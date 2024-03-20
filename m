Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C9881241
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 14:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B4810E116;
	Wed, 20 Mar 2024 13:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X/pccOB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A317510E116
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710941006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+6oNZYA5370c4KGWdEFU65Z5mlYdjZGRdbPpGQE3sDk=;
 b=X/pccOB1EPp8hjvmYuQWUk4FscRf8V/OrqSjVXTVfqNFjFE5zo1kJrYEpgYQKYJ23oDxs9
 SKg0B/ebqdFay+6zEkPMpcMu1CuFzKMb6iKs8xXxF+h+mWMnBpp3/fnxznySwXhwVh32i/
 3eGQSak9gMA8+svwKpMbyQl4qhKzmfY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-yMvQiJKJPxa4MGEB241BvA-1; Wed, 20 Mar 2024 09:23:24 -0400
X-MC-Unique: yMvQiJKJPxa4MGEB241BvA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4140dd880b2so20048145e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 06:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710941003; x=1711545803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6oNZYA5370c4KGWdEFU65Z5mlYdjZGRdbPpGQE3sDk=;
 b=UB7c5DvE92DYvY6G/9BlgQcOX4A8HgW17QGNxmEtCm5Q6aA0NUJOcZt4hfAWdGrWlz
 wJ5V1LGJEU2iq/l6YY1aS246WlKKIgmiW91eY9bQvlHgiI2hphSNRyEB8UCt7Fbq8/Ag
 n57DBEzrEpzjbu07aIa2xRCNDwnSc/YyEWHruswaliv8pVQ4d7wzBeYwGZhL/ILzf34H
 jvzNfraA8lEKr7ENCbXCpQe7T52Ey61mx2q9cAkueunySsfHknSG1XYDfvjNjYhtwujR
 uaBjoVitxJBBq+5IfGGiaX96NdaR5x9yBfs4eXL6STaGwf9Fuu4cXAkB0sJW9lCQOWTI
 GfWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA/6EGWTIiivZ1VeYg/GObVmcn4t7Tp2vdatLwMCNNmek8V/lbJpuGSzV4yWBdNhyqhyNyeT2yHWcFMWKzMXVxTn3F5RCe0buWNNbKLf0m
X-Gm-Message-State: AOJu0YyUx6Gj42aGwp/BauXRf2kQUv9XsBoXO2EPMSg5Hqk0Dwc1oDU3
 fXiFgSafn+dXzSePfr2VFv4+/iD2NIy/6BpczBHuDLIGL6pHrSdb6yPNY0eJ1hrTArGyhGAaB29
 cWGiiF9TDORQD59H9AQoQhOUHYspjY4D4bY5hDyOc0uODRZWRTq9A2glSaE5Z9p30aQ==
X-Received: by 2002:a05:600c:444e:b0:414:a36:f17e with SMTP id
 v14-20020a05600c444e00b004140a36f17emr8419020wmn.33.1710941003232; 
 Wed, 20 Mar 2024 06:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnoxc0ItU0VE0xCtc8nDq/jmLFXMQSF8hgS5etI1kpbKJ1cmWEac3cSUTlK7nXzeoWHCLVmQ==
X-Received: by 2002:a05:600c:444e:b0:414:a36:f17e with SMTP id
 v14-20020a05600c444e00b004140a36f17emr8418997wmn.33.1710941002743; 
 Wed, 20 Mar 2024 06:23:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b0041468961233sm2213163wmq.35.2024.03.20.06.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 06:23:22 -0700 (PDT)
Date: Wed, 20 Mar 2024 14:23:21 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com, 
 philippe.cornu@foss.st.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Martin =?utf-8?Q?Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: Re: STM32 DSI controller driver: mode_valid clock tolerance
Message-ID: <20240320-berserk-soft-crab-70d22c@houat>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c2uo4eciowtywp47"
Content-Disposition: inline
In-Reply-To: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c2uo4eciowtywp47
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Fri, Mar 08, 2024 at 09:35:27AM +0100, Sean Nyekjaer wrote:
> I=E2=80=99m using a stm32mp157 with a sn65dsi83 DSI2LVDS bridge. The LVDS
> display is having a minimum clock of 25.2 MHz, typical of 27,2 MHz and
> a max of 30,5 MHz.
>=20
> I will fail the mode_valid check with MODE_CLOCK_RANGE. It will
> request 27200000 Hz, but is getting 27250000. Guess the display is
> fine with this :)
>=20
> In this case it seems a bit harsh to fail if the output clock isn=E2=80=
=99t
> within 50 Hz of the requested clock.

Even for HDMI, the tolerance is usually .5% of the pixel clock. 50Hz
seems overly restrictive.

> If HDMI is requiring a tolerance of 50 Hz, would it be better to do
> the check in the HDMI bridge driver?

Judging from the code, it would be hard to do because the clock that
generates the pixel clock isn't exposed to the HDMI bridge.

Maxime

--c2uo4eciowtywp47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfrjSQAKCRDj7w1vZxhR
xaeXAP4v7eTw/+9FwH0Cc4hF7TRC1YdDLxTVnPdqi2UgyGFgtwD/UbIEzvYapnzD
+6fCskDtHvvfS5FCgUp9Hwsq1lfG3wM=
=OBMH
-----END PGP SIGNATURE-----

--c2uo4eciowtywp47--

