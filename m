Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4FC79383A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A3210E5AC;
	Wed,  6 Sep 2023 09:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C6810E5AC
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693992563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMqIR9ChMNlEVJa1gO47uMRlJMxWrepnjEzHK1RRN70=;
 b=UCoWmTTK+75ki4rTgbCSOtQCDRZO1n9wrLGXfKKQ6SyXGt7JEKdc2vTlVp0a5ChUYzDqbl
 lN0Bx5gEK2GKdwV+2BVgwBIUDaUmpCLQrrMFCv3QnCKoo8aDgcAVEKMbxUP//yCHDmiO80
 AawJt/WLjMd6M53joVZPr2zj4yorFBU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-U-OO-WsnMomerr52lqB_qw-1; Wed, 06 Sep 2023 05:29:21 -0400
X-MC-Unique: U-OO-WsnMomerr52lqB_qw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40298cbbcdbso19717205e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 02:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693992560; x=1694597360;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8B+wqbMJ/KaLGLfSS8F3fJoqpV4SEwmStwo3hQ6ibIA=;
 b=KT2HfK9yJSe9TxT0bILITzQFAaktXFK87TjZ91R4pVP9Q0JdGG0sfB7WfXyF2SluzI
 HE2Up0ex7puHZNTIl/+gH760b5nZFqGyLLuRPZTBf1yS2FshkwG9UJR96GanaYzCwPa9
 BHMxB/7phLNxitkqG0AcV9wR52cW2PYqunV9FGrmdTmhOjiqZw9tuboq821j9bCb7Idc
 CqSFSWh3p4tcU/rtivsW/MfX1Wi7uRDeFS0BiWcGdNIP41YqPS7xF3jMN5wQjoqW8tjJ
 jYbX9OEjhctb+Lp/dCNDguw5H2RwHAkkeX23TXRPN9QPle32AFzKPWAaanJgq13CM6GE
 F44Q==
X-Gm-Message-State: AOJu0YyOMze+GM13nYB2l2G5iBjKIS20qmCzCIlouZbbj0P+2VEudZm1
 IjLv4HPIl+N61rGjOJ8IW2MUIWSvuQ0+SIV1P/P/68/RkU83HQ0ZaeeSnKEYAcg2ntcRxo8wAkp
 aV2YrZzwC8X+9SdoO9e/NdT3dBniO
X-Received: by 2002:adf:e2c8:0:b0:319:6e71:d1dd with SMTP id
 d8-20020adfe2c8000000b003196e71d1ddmr1930995wrj.12.1693992560469; 
 Wed, 06 Sep 2023 02:29:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgvsOiebW3EqCUDRBg3ZNZBD1nY0zPDbKcQ378AtSFqyJ5+vHZVy9qpcDJVzJfw+ulMLoLAQ==
X-Received: by 2002:adf:e2c8:0:b0:319:6e71:d1dd with SMTP id
 d8-20020adfe2c8000000b003196e71d1ddmr1930979wrj.12.1693992560113; 
 Wed, 06 Sep 2023 02:29:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f3-20020a5d6643000000b00318147fd2d3sm19891578wrw.41.2023.09.06.02.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:29:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Jocelyn Falempe
 <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, bluescreen_avenger@verizon.net
Subject: Re: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
In-Reply-To: <25bd597f-f4b5-8592-f111-898b4a613941@suse.de>
References: <20230809192514.158062-1-jfalempe@redhat.com>
 <9b232cab-057c-bb42-48cb-f83da3f0e938@suse.de>
 <12490fcd-7c72-090d-b7ed-9928d51c21a2@redhat.com>
 <25bd597f-f4b5-8592-f111-898b4a613941@suse.de>
Date: Wed, 06 Sep 2023 11:29:18 +0200
Message-ID: <87r0nb4pld.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Jocelyn and Thomas,

> Hi Jocelyn
>
> Am 05.09.23 um 16:46 schrieb Jocelyn Falempe:

[...]

>>=20
>> I'm a bit reluctant to re-use the fbdev code, for a few reasons:
>>  =C2=A0* I want drm_panic to work if CONFIG_FB and CONFIG_DRM_FBDEV_EMUL=
ATION=20
>> are not set.
>
> The code would live in video/ and be independend from fbdev. It's quite=
=20
> a bit of refactoring, but might be worth it in the long term.
>

FWIW, I agree with Thomas here. The drawing/blitting logic seems to be
useful regardless of fbdev and moving it to video/ makes sense to me,
instead of adding yet another infrastructure to do the same that will
only be used for the DRM panic handler.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

