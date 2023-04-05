Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341696D8951
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 23:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D559510E1E3;
	Wed,  5 Apr 2023 21:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B7510E261
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 21:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680728973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YO532sOCk7QS+kqonSqdJ1x9wG4RVcYNXha8nJHWDR0=;
 b=LOv3ecgaD3RgM4fIT6cyWKcJi8ABUiC9qxi+ajHEQobunTARQAQmbix+B5p8tKx3djKxD8
 BmZTHnl7DzxiYN6cLsfF4NLt++MfD1HvJrzsQxuGNh5kOSM2TnHhJO6ZiUlR3iAKzymoEu
 Jc8gfuBC7MSDaZW7Alis6JPFNGPDhuw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-XgPUSVG1OWSJK0CVLcQc4w-1; Wed, 05 Apr 2023 17:09:31 -0400
X-MC-Unique: XgPUSVG1OWSJK0CVLcQc4w-1
Received: by mail-wm1-f72.google.com with SMTP id
 k1-20020a05600c1c8100b003ee6dbceb81so17948876wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 14:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680728970;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YO532sOCk7QS+kqonSqdJ1x9wG4RVcYNXha8nJHWDR0=;
 b=ved+3x3c2z9OcIsfXFTL3ajxzp9jf4eYkB6UiI/Sn963zyce9uxUmZmRF3R28HZHLK
 ze13P1nrfbm2zvIbQgHqv42pbDB1s9jJcwWcO4KCDbsPtE8qJZoP6NXhDzhPw0OX4NbF
 qxsE0txNlCPfUwouh4tjmRZegl/ABaZxfax6sHISRcmy3h8JvyLAywHxtdQDeTmAiLdb
 0Bknw9R7jXpwEtppS3XVBiXEZuQ5XbMlAWaUda5tqVq3q44XQFRU1VFOqbiho14H4MQi
 v4gclVy4nk/w41a7YDt5ijvyUfMv8JurpLX2eseoxyW8OFz4eN+mBirIGoVWYyC0SQFk
 pk+Q==
X-Gm-Message-State: AAQBX9cbd14EOQMxcuZ+0/2ETI7akyIDdbtigRLT5NzNETgJB+6VTywi
 PtyxZlXu4g/snps1LCJRwLcMCfYcsj1cMAFlPsqVRoAvBb8e/RiTy7UFZ3yHlK98UXtQehJbYtP
 kCoSzs1ENWSrMC5dnHaL6fV32i8uU
X-Received: by 2002:a7b:c8d5:0:b0:3f0:44d1:3ba5 with SMTP id
 f21-20020a7bc8d5000000b003f044d13ba5mr5535389wml.5.1680728970539; 
 Wed, 05 Apr 2023 14:09:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350aEIsNom9z1ywcolJeDI9TUI2ZeJw5josPfQIhaJ7dqu7ULsSfpcvFxESpz0kfizB4+3GqbKQ==
X-Received: by 2002:a7b:c8d5:0:b0:3f0:44d1:3ba5 with SMTP id
 f21-20020a7bc8d5000000b003f044d13ba5mr5535382wml.5.1680728970219; 
 Wed, 05 Apr 2023 14:09:30 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 jb10-20020a05600c54ea00b003ede2c4701dsm3264701wmb.14.2023.04.05.14.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:09:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/fb-helper: fix input validation gaps in check_var
In-Reply-To: <ZC3dtDP+m4c5jgNZ@phenom.ffwll.local>
References: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
 <20230404194038.472803-3-daniel.vetter@ffwll.ch>
 <87a5zmd2jn.fsf@minerva.mail-host-address-is-not-set>
 <ZC12aR9ddp3j/3dL@phenom.ffwll.local>
 <87ilea9twa.fsf@minerva.mail-host-address-is-not-set>
 <ZC2t1I1SQrQh/fy1@phenom.ffwll.local>
 <878rf69qfj.fsf@minerva.mail-host-address-is-not-set>
 <ZC3dtDP+m4c5jgNZ@phenom.ffwll.local>
Date: Wed, 05 Apr 2023 23:09:27 +0200
Message-ID: <87355e9gu0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Wed, Apr 05, 2023 at 07:42:08PM +0200, Javier Martinez Canillas wrote:

[...]

>> >> Ah, your patch adds it after that indeed. Please ignore my comment then.
>> >
>> > So rb: you?
>> >
>> 
>> Yes, I already provided it in my previous email and has been picked by
>> patchwork. I could do again but probably will confuse dim when applying.
>
> Yeah just wanted to confirm I cleared up all your questions. Merged the
> entire series to drm-misc-next, thanks for the review.
>

You are welcome.

>> The only patch from your series that is missing an {r,a}b is #1 right now:
>> 
>> https://patchwork.kernel.org/project/dri-devel/list/?series=736966&archived=both
>
> That's a different one :-)
>

Oh, sorry about that. Somehow I switched threads in my head in the middle
of the response.

> I'll respin with your comments and then let you&Thomas duke it out about
> patch 1.
> -Daniel
>

Perfect, thanks! It would be good to finally have that issue fixed.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

