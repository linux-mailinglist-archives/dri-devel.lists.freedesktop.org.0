Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA573974D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 08:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EA910E179;
	Thu, 22 Jun 2023 06:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344AF10E179
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 06:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687414821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GSEQzVo+wYXj2q8maNLl6Uya7Y31HfRofN3pWXyvNjw=;
 b=actDqfMD+/IZ8CEk6Dr0Xxg5XKJqFztqhem6G8BydLQpaPxvdUsg7dprMXAETjlI8Z27rj
 72rNo/AW1OuHPThReLb5YxFSFAW3q4jnGpXxHBxwy/3t2Tayu8tG8EVIj1hwEN7EIWiCPO
 gkyDAbcjdXnctOlmAAVJgyhPbmMShZI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-Z5g8dWnRP0iduVqvCbSLeg-1; Thu, 22 Jun 2023 02:20:18 -0400
X-MC-Unique: Z5g8dWnRP0iduVqvCbSLeg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b46c4bf141so40601601fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 23:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687414816; x=1690006816;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GSEQzVo+wYXj2q8maNLl6Uya7Y31HfRofN3pWXyvNjw=;
 b=HlPa/l3qFSLQrSa1Fv9LJPCTD3cHoMx4anPlW4vZzCMuAY76BW1LZF29KWL1BOaGXr
 opZgHeJbPw5y/iaFH4qxcxFOPGs953d35CFlxR66uy7bsxrMnzbWXWrdcRiLEsdnM29L
 vCnCVuzOEVvz51LfROA6xkYuDX3Nqw1XrjSRQOL8YhFu2+9jx4GKnJlLOtD1TMaid2f8
 sGG1J/Q+sA/fmyy2K3wqMmVQiLlpoQi6Lm97oQ8tzKcwFa8k0loYTfoPipbe6wA9HZ5k
 2hkUtINpE9ufhqcO5vqNLQ3W8o/Iw0lTwcke9HjHW6aYrBKP/t3RJ7q+ApiJZkycKW4V
 8kFw==
X-Gm-Message-State: AC+VfDyYnw4B+J6sFOuwo3xmnzHxnt5cBvX0MiAOtHfiG9LlJ6U6oXu1
 CtpAOys4YeN/otMqv6oItAyXoPj8648QF80vA83in3Jte5SZ/adB+JKWO8wyd0jV15kDynM8sag
 Fdu0QdPm/uk9e0qYcV3YBS4xUiaow
X-Received: by 2002:a2e:99cf:0:b0:2b4:6dbf:e6fe with SMTP id
 l15-20020a2e99cf000000b002b46dbfe6femr8267304ljj.51.1687414816229; 
 Wed, 21 Jun 2023 23:20:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6SEp25jAWRXMGpreIkfhUOf/yYkXPo1CogPqvYP3GxGd3uElbw5+dicQwfa6Yv1swUb0XeBQ==
X-Received: by 2002:a2e:99cf:0:b0:2b4:6dbf:e6fe with SMTP id
 l15-20020a2e99cf000000b002b46dbfe6femr8267292ljj.51.1687414815882; 
 Wed, 21 Jun 2023 23:20:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1c4c03000000b003f9b3ccb815sm8563669wmf.1.2023.06.21.23.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 23:20:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, "aesteve@redhat.com" <aesteve@redhat.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
In-Reply-To: <53f4fe46502841ed64d404e23d08b4280cb9b72c.camel@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <3ef205a7-f418-e22d-6bae-7be08f60d2f8@redhat.com>
 <87legdi93z.fsf@minerva.mail-host-address-is-not-set>
 <53f4fe46502841ed64d404e23d08b4280cb9b72c.camel@vmware.com>
Date: Thu, 22 Jun 2023 08:20:12 +0200
Message-ID: <878rcchvc3.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Aleix Pol <aleixpol@kde.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zackr@vmware.com> writes:

[adding Aleix Pol from KDE/kwin to Cc list]

Hello Zack,

> On Wed, 2023-06-21 at 09:10 +0200, Javier Martinez Canillas wrote:

[...]

>> > 
>> > Hi all,
>> > 
>> > We have been testing the v2 of this patch and it works correctly for us.
>> > 
>> > First we tested with a patched Mutter, the mouse clicks were correct,
>> > and behavior was as expected.
>> > 
>> > But I've also added an IGT test as suggested above:
>> > https://gitlab.freedesktop.org/aesteve/igt-gpu-tools/-/compare/master...modeset-cursor-hotspot-test?from_project_id=1274
>> > 
>> > I could post the IGT patch upstream once Zack's patches land.
>> > 
>> 
>> Zack, are you planning to re-spin the series soon? Otherwise Albert could
>> continue working on that if you prefer.
>
> Besides mutter I wanted to patch kwin as well, but I haven't been able to find the
> time to patch it as well. I can respin with discussed changes over the weekend if

That would be great!

> we're ok with getting this in without kde support from the start.
>

In my opinion that is OK, specially now that Albert also wrote an IGT
test, so there are two different users of your new KMS properties.

Support for kwin can be added as a follow-up once your patches land.
But I don't know what others thing.

> z
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

