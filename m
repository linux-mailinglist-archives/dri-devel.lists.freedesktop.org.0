Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F2A7EB448
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 16:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385F10E05F;
	Tue, 14 Nov 2023 15:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE6710E05F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699977518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iBNoiEiOap3tfmenjQPxW4JMLyXGdhX71AJJ3aaGQrY=;
 b=VpuTn2m2jUMIy37bvh7MY9iFIH2XaLqM0+zutOlYK6fy3fXOktuvrU7OAzf8uYvUETqORk
 8nNLZl1wBSNt5pbKu+MxAgj4vNk0SFCAx9IwimYzLy1hgZEWVFLRxKYd/wDcj2uE5HmnSC
 7n+ZkKlXLUWSVRsVWXqgPDZXEL/SBQk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-Hk833gvqOmerwWQQZilQUQ-1; Tue, 14 Nov 2023 10:58:36 -0500
X-MC-Unique: Hk833gvqOmerwWQQZilQUQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6757f3d7911so59008776d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 07:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699977516; x=1700582316;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iBNoiEiOap3tfmenjQPxW4JMLyXGdhX71AJJ3aaGQrY=;
 b=hIR3/hZKuL/tSvKd5mtmTw5XCpH59f+LCRGF+8s4bd6+AXK5cxm1lOOQ8U0eZtIEDt
 0X0vIsW4IufgGxj+kt2j8G5msFnAOb0iyL8o4oKC7S+khvParMW8c6zL/xvfLhQKieO8
 Uabf1yjc48gPpss6dkjGMK4eGeMIQ5fXZATYREEnQfCIyghiLTsD1ZKpDdoq+UAsNE3a
 6jVZh00SkPs+8qJ91UHicUBClaqhJPw29riDH7sf94IY/fey20Xl0zxOPz/A8995AJ/o
 hcXiuPLaHDhUntHliz4iERWqACawEflXjALQEeEJlAzdpgpSVmwCvsazF6mmucCfOUnb
 KDHw==
X-Gm-Message-State: AOJu0YyXJmMahTfyCCeWqTof+0fYIQf458raMsKZmxMQkqBUIwnpTKlD
 DyqZBbNw2XoeR9zbYWCUNteHbSAZBtiDHlrBXF4OEXQGZKWq1X08ePrJHK6C4nHk3zN3+G+AeFO
 7csYsP91QnKJQL7WnMgn5JFHmXJ1Z
X-Received: by 2002:a0c:d803:0:b0:671:9c02:cbaa with SMTP id
 h3-20020a0cd803000000b006719c02cbaamr2595863qvj.39.1699977516501; 
 Tue, 14 Nov 2023 07:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcbzCxyPfkeXktmjuQ1rejnRN2Px02gUZbgnNz45wfbmVDzqfZ1kzIsL5k6QsYBr2FO6V3HQ==
X-Received: by 2002:a0c:d803:0:b0:671:9c02:cbaa with SMTP id
 h3-20020a0cd803000000b006719c02cbaamr2595835qvj.39.1699977516201; 
 Tue, 14 Nov 2023 07:58:36 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 u6-20020a0ced26000000b0065b229ecb8dsm2999160qvq.3.2023.11.14.07.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 07:58:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm: Add
 drm_atomic_helper_buffer_damage_{iter_init,merged}() helpers
In-Reply-To: <c4fdfec8-aa9a-4a09-94c4-114595cf5596@suse.de>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-3-javierm@redhat.com>
 <c4fdfec8-aa9a-4a09-94c4-114595cf5596@suse.de>
Date: Tue, 14 Nov 2023 16:58:33 +0100
Message-ID: <8734x872dy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org,
 Bilal Elmoussaoui <belmouss@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 stable@vger.kernel.org, Sima Vetter <daniel.vetter@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks a lot for your feedback.

> Hi
>
> Am 09.11.23 um 18:24 schrieb Javier Martinez Canillas:
>> To be used by drivers that do per-buffer (e.g: virtio-gpu) uploads (rather
>> than per-plane uploads), since these type of drivers need to handle buffer
>> damages instead of frame damages.
>> 
>> The drm_atomic_helper_buffer_damage_iter_init() has the same logic than
>> drm_atomic_helper_damage_iter_init() but it also takes into account if the
>> framebuffer attached to plane's state has changed since the last update.
>> 
>> And the drm_atomic_helper_buffer_damage_merged() is just a version of the
>> drm_atomic_helper_damage_merged() helper, but it uses the iter_init helper
>> that is mentioned above.
>> 
>> Fixes: 01f05940a9a7 ("drm/virtio: Enable fb damage clips property for the primary plane")
>> Cc: <stable@vger.kernel.org> # v6.4+
>> Reported-by: nerdopolis <bluescreen_avenger@verizon.net>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218115
>> Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>> 
>>   drivers/gpu/drm/drm_damage_helper.c | 79 ++++++++++++++++++++++++++---
>>   include/drm/drm_damage_helper.h     |  7 +++
>>   2 files changed, 80 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
>> index aa2325567918..b72062c9d31c 100644
>> --- a/drivers/gpu/drm/drm_damage_helper.c
>> +++ b/drivers/gpu/drm/drm_damage_helper.c
>> @@ -204,7 +204,8 @@ EXPORT_SYMBOL(drm_atomic_helper_dirtyfb);
>>   static void
>>   __drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
>>   				     const struct drm_plane_state *old_state,
>> -				     const struct drm_plane_state *state)
>> +				     const struct drm_plane_state *state,
>> +				     bool buffer_damage)
>
> I think it would be preferable to drop patches one and two and instead 
> add this parameter directly to drm_atomic_helper_damage_iter_init() and 
> drm_atomic_helper_damage_merged().  That's a bit of churn, but more 
> readable code.
>

Makes sense. I'll do that in v2.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

