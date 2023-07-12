Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D412750A03
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4762D10E532;
	Wed, 12 Jul 2023 13:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4580410E532
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689169887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c4ipeOcGs5/QdbpLafE8sFTEM3z9tA9NjXOVeMuTk2o=;
 b=M0JDHedwnevyeg4ljV6g6Je/Ul+jvpF0sesddHFWGtXnE8CSnjZmmk/ICGAoz/5/uGOqHe
 G5WUuopNVvOmEgJFL7nmGYLkflONN4VWENt7KdK02ptSXfhuOjgQDXHa5aYHwot/kG4Dbw
 hnX/DiHNJoefZmypsaqRUkKPQHPFUWs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-c9ZMO2mrMiinvizeRmFwjw-1; Wed, 12 Jul 2023 09:51:25 -0400
X-MC-Unique: c9ZMO2mrMiinvizeRmFwjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fb40d0623bso3714215e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689169884; x=1691761884;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4ipeOcGs5/QdbpLafE8sFTEM3z9tA9NjXOVeMuTk2o=;
 b=doMcmccvsFGGsBeZ5eo6Rm4joVivKbYeuUhlr5UnGAHKD9CJQQuW0JZqbc00agUpjG
 IMu7h9TUORDK92fBPI9PvhV3xP21HeqEom5Jz3zDjQa8HpCnCNhjJtr81UXNjMezZwxG
 j3VIzb6mNgNIgYpE4A4QUTSieH3qbMMXLoZc9C7hFdRDdexIsA3v2yOLRUwdArb1Z3t3
 ZSe+u9rf9kxYaY+HRw/5LhRjAhH3nfjrK4Ma9T/wjzWZSV13ZOMvYEWRXfGHJFUa9eDr
 sZpWPBRGHKbWKPdcY9wm9kdkhKYe0wBVlgO7MsKIfKQlceN7Y9X4ItIHLo3bmtF+GS6S
 +g1w==
X-Gm-Message-State: ABy/qLaNGll4dhVKIoc4kFxGKKeY77sVY6IJPoqvpnFxGPqKaHPqcpnk
 pUUq3IRFeTzSSKNwcsmgM/EMEbxnZkWz06fDYv7hY2f9TUZyX4tqso5jx9UhQJB5HosFSpDoyth
 wNWBvHVrZEpMfni7wc4YwJF/EYVjz
X-Received: by 2002:a05:600c:1c8a:b0:3fa:88b4:bff3 with SMTP id
 k10-20020a05600c1c8a00b003fa88b4bff3mr1798749wms.11.1689169884313; 
 Wed, 12 Jul 2023 06:51:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEhBP73f3O/jbU0ccGKwWuIfxeNrJjawRL8knw+eX3ipC5AtXEX2y09N4NirxVht4LpBgfyrQ==
X-Received: by 2002:a05:600c:1c8a:b0:3fa:88b4:bff3 with SMTP id
 k10-20020a05600c1c8a00b003fa88b4bff3mr1798734wms.11.1689169884030; 
 Wed, 12 Jul 2023 06:51:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 hn32-20020a05600ca3a000b003fbdd5d0758sm5172192wmb.22.2023.07.12.06.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 06:51:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC v1 00/52] drm/crtc: Rename struct drm_crtc::dev to
 drm_dev
In-Reply-To: <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <94eb6e4d-9384-152f-351b-ebb217411da9@amd.com>
 <20230712110253.paoyrmcbvlhpfxbf@pengutronix.de>
 <o3dc4q27ap6rajsvpfwfvs3z3afekkwbhnclvswkaietciy2kc@unjf67gz5tur>
 <20230712133803.rf26cbg5wz7wsmgl@pengutronix.de>
Date: Wed, 12 Jul 2023 15:51:21 +0200
Message-ID: <87o7khgrvq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> Hello Maxime,
>
> On Wed, Jul 12, 2023 at 02:52:38PM +0200, Maxime Ripard wrote:
>> On Wed, Jul 12, 2023 at 01:02:53PM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> > > Background is that this makes merge conflicts easier to handle and d=
etect.
>> >=20
>> > Really?
>>=20
>> FWIW, I agree with Christian here.
>>=20

FWIW I agree with Christian and Maxime as well. It's easier to review and
merge as a single patch, and also makes the resulting git history better.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

