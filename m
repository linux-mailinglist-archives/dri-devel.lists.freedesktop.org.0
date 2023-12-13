Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7220D812384
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 00:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC8310E837;
	Wed, 13 Dec 2023 23:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA8510E837
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702511306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlH0hEer7+Nk19Vq61ytYQm6EsTqNJlYAMHbJqXd6yE=;
 b=Fx4HY9aHvS2iHzTOM0jHTetw7jdDVxX/MauFhP4hKpWdTWaEHH+ixgysT+2dnhaEiNty6K
 gQ3EEERmoD8o2HWY2QbGAb9jCS+0XAnu6PYLUp249Hs7Z3QaoQquQgiiYKId8LlBz86813
 Z26A+PqDytvEm5iUXpGOyVI73HZk2rQ=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-5i8x0D2BMWiEuvDLWaWzsQ-1; Wed, 13 Dec 2023 18:48:25 -0500
X-MC-Unique: 5i8x0D2BMWiEuvDLWaWzsQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-4b288467e05so2025595e0c.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702511304; x=1703116104;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlH0hEer7+Nk19Vq61ytYQm6EsTqNJlYAMHbJqXd6yE=;
 b=Aw6NrxvtEB6uCU7f6LyYp/ND+ORYujTVo8Nc2NHvBziq0JQqRcB+qzhA9GCkjqn/BC
 5g+gN/Ac7Hiqti3OoIS2kjEk5w9h5eBc8QkRgIMKqMatGMqxm3N3sT3eyNLemBoYMqdQ
 ZGjkMGvLuwFcqOfJCjTpkCzGwX5zYCCy3wzUP3I9yp6HJpmQh+/S5o91mJz/s0p3CJyK
 7mXgK+xHbuSemS5Vo8DLnu2/Ui4yLreNNJSyFPhJ2UbiNCDVTCPjPw+vaIifp8OAIshT
 xY2hrcZQFwDC0Y9/u/i2D39xzwKCKWXkArCur8bEb8wYffibsaA4xdZ/Nad7jr4xzOy9
 dFCw==
X-Gm-Message-State: AOJu0Yx9UHFeZRo5F5xGNfC+sbVhVEHj7DMSxa/VrgcLxHvqsJceIelc
 u3dgGU6stVGqzHeAt1L77zHBvdaoiE5tOgqiG25Qb0LJ6fmpUsgIq1m7B23pyFgF60/Fi+kR5BG
 6tRPitKv32uomBcgbp11Oex5n03lI
X-Received: by 2002:a1f:f4c9:0:b0:4b2:884d:60ef with SMTP id
 s192-20020a1ff4c9000000b004b2884d60efmr6453507vkh.9.1702511304467; 
 Wed, 13 Dec 2023 15:48:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdScfcgntZWOMNXTw3/v7+E4FVhmTkodlicMCAD2tYLEyL4jcsSSdQlpenRfQ9H4cIjARGMQ==
X-Received: by 2002:a1f:f4c9:0:b0:4b2:884d:60ef with SMTP id
 s192-20020a1ff4c9000000b004b2884d60efmr6453500vkh.9.1702511304155; 
 Wed, 13 Dec 2023 15:48:24 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 ej8-20020ad45a48000000b0067a4396f9cdsm5449659qvb.8.2023.12.13.15.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 15:48:23 -0800 (PST)
Message-ID: <f10791773520f85857749c080af999821dd41a0d.camel@redhat.com>
Subject: Re: nouveau 0000:01:00.0: drm_WARN_ON(!found_head)
From: Lyude Paul <lyude@redhat.com>
To: Borislav Petkov <bp@alien8.de>, Paul Dufresne <dufresnep@zoho.com>, 
 Danilo Krummrich <me@dakr.org>
Date: Wed, 13 Dec 2023 18:48:22 -0500
In-Reply-To: <114bf9f5790f637a6cdec4957244192d3bd76a04.camel@redhat.com>
References: <20231111120323.GAZU9tiw8e0RSzCGB9@fat_crate.local>
 <20231212224037.GAZXjhZUDeoq50xKJ5@fat_crate.local>
 <18c613ec092.ae61cf7d6029.4389632938517239705@zoho.com>
 <20231213113936.GBZXmX+MKqX/qOnPn1@fat_crate.local>
 <20231213124936.GCZXmoYDq8nMRs75XM@fat_crate.local>
 <114bf9f5790f637a6cdec4957244192d3bd76a04.camel@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hopefully you're still on at this point - if you are, could you try startin=
g
the machine up with the following kernel module arguments passed to nouveau=
?

debug=3Ddisp=3Dtrace

Then see if you can find any lines that mention INHERIT? I have a feeling I=
'm
just going to have to add a workaround for the time being, but I'd really l=
ove
to know how we're managing to get that far on a hardware generation we neve=
r
implemented that nvkm ioctl for=E2=80=A6

On Wed, 2023-12-13 at 18:37 -0500, Lyude Paul wrote:
> agh - thank you for repeatedly poking on this, I've been busy enough with=
 GSP
> work I totally missed this. Yes - I'm quite surprised that this is blowin=
g up,
> but considering that looks to be a GT218 I guess display state readback m=
ust
> just work a bit differently there since that's really early on into the N=
V50
> days.
>=20
> The reason that was a drm_WARN_ON() was because it indicates that we're n=
ot
> reading back OR -> head assignments properly. But, I'm confused how we're=
 even
> getting that far on a non-GSP platform. I'm going to dig into this now, b=
ut if
> I don't figure out a good fix by the end of the day I'll just send a patc=
h to
> silent the warning.
>=20
> Thanks again for bugging me about this!
>=20
> On Wed, 2023-12-13 at 13:49 +0100, Borislav Petkov wrote:
> > On Wed, Dec 13, 2023 at 12:39:36PM +0100, Borislav Petkov wrote:
> > > We're getting close to releasing so I guess we either debug this or s=
hut
> > > up the WARN.
> >=20
> > Not only that - panic_on_warn turns this into an explosion so you don't
> > want that in a released kernel.
> >=20
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

