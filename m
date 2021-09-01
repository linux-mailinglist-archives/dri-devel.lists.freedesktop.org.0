Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC1F3FD633
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 11:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6CF6E059;
	Wed,  1 Sep 2021 09:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0C76E059
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630487294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sb1gUtd0hXcMtoF0AKF7BtNjs4zgBEQQbBwZxit0nlE=;
 b=KdLQSo9D0hjJ6eNw4tN7+hFOy11F84dl5i/2/SwFopCGlWwEROf9cv8imVwGxXG5xpVAZZ
 iMN6DwNervBAHa6vWPKFeaOC4oJnV46NQZRDBr7f/m9B0SU04vedKCbRrtfsI2wtYei1Nx
 PhIX5yFCDLUM/bLH86Ck6ceLPcElspk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-7E7-06n6PLGcFuwIHJXyfA-1; Wed, 01 Sep 2021 05:08:13 -0400
X-MC-Unique: 7E7-06n6PLGcFuwIHJXyfA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so590747wrl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 02:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sb1gUtd0hXcMtoF0AKF7BtNjs4zgBEQQbBwZxit0nlE=;
 b=q34OD8tVnEG/6ziO5ySy/3xcUMrXEsHlCVP/c3dPbO02jHSWrjz9qT+f4ZdypajlBV
 wNdLaNJxm4XpseiBfWwlHx5oOBI5el9W6wn5cQUH6N39QWHC9paR3ae9T3czH7ibwZLP
 6ghFetvE6+gbMnurwzW019pgY6YCtYD+okLy5BZRXNO+51ViUtgazcgwvVABLDjJfE6N
 wQkRClgfUzXIgkrWVF+J9NiVNKXnRH0Q4Ikr1ZT9D2+x7H3xXD8EDV9GX3vSbSqGfe6T
 JhLHLGud1i+hub7BFqK+dYY/ERcuhlTQcVyFIXHLLeuMsYR3T4NAWI+Orz5mtnNZ4+iV
 /4Kw==
X-Gm-Message-State: AOAM532skQwGh+nWzKUqcHntnFcsg74SDlXsCt0EyOOangxhhgbNqn4l
 P6hxGfTn+4h6XLuiLRg2xKTW8ZhDkAjM/Wvmp5ubTu+EvCnsQ/ykZ2coM8+Ii4oViLjUW7ib/rs
 KRO77vMNjoWPiPlAR0wbw/jm0Ey5c
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr35782797wrz.369.1630487292143; 
 Wed, 01 Sep 2021 02:08:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJVpF+a4RLY2ojCpEsLP4x9qa6h6EWAkPZshm1oL9/N1tpkEHx6iVx4+dMTAUDoMkqzH46XA==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr35782773wrz.369.1630487291925; 
 Wed, 01 Sep 2021 02:08:11 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id i68sm21120783wri.26.2021.09.01.02.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 02:08:11 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Peter Robinson <pbrobinson@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 David Airlie <airlied@linux.ie>
References: <20210827100027.1577561-1-javierm@redhat.com>
 <bb5d045c-c9de-b6df-cf45-32b1a866264a@suse.de>
 <YSlI+ryYqoRxM7aB@phenom.ffwll.local>
 <a7395626-f022-5c89-07cd-c30d0d52d3dd@redhat.com>
 <YS4iIR689bAZ4QT9@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <b6ba8f6b-4f0c-53cc-e384-ecea3af78410@redhat.com>
Date: Wed, 1 Sep 2021 11:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS4iIR689bAZ4QT9@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 8/31/21 2:35 PM, Daniel Vetter wrote:
> On Sat, Aug 28, 2021 at 12:02:21AM +0200, Javier Martinez Canillas wrote:

[snip]

>>
>> We talked about a drmcon with Peter Robinson as well but then decided that a
>> way to disable CONFIG_FB but still having the DRM fbdev emulation could be a
>> intermediary step, hence these RFC patches.
>>
>> But yes, I agree that a drmcon would be the proper approach for this, to not
>> need any fbdev support at all. We will just keep the explicit disable for the
>> fbdev drivers then in the meantime.
> 
> I think the only intermediate step would be to disable the fbdev uapi
> (char node and anything in sysfs), while still registering against the
> fbcon layer so you have a console.
>

Right, $subject disabled the sysfs interface but left the fbdev chardev. I can
try to do a v2 that also disables that interface but just keep the fbcon part.
 
> But looking at the things syzbot finds the really problematic code is all
> in the fbcon and console layer in general, and /dev/fb0 seems pretty
> solid.
>

Yes, but still would be an improvement in the sense that no legacy fbdev uAPI
will be exposed and so user-space would only depend on the DRM/KMS interface.

> I think for a substantial improvement here in robustness what you really
> want is
> - kmscon in userspace
> - disable FB layer
> - ideally also disable console/vt layer in the kernel

Earlier in the thread it was mentioned that an in-kernel drmcon could be used
instead. My worry with kmscon is that moving something as critical as console
output to user-space might make harder to troubleshoot early booting issues.

And also that will require user-space changes. An in-kernel drmcon could be a
drop-in replacement though.

> - have a minimal emergency/boot-up log thing in drm, patches for that
>   floated around a few times
>

Interesting. Do you have any pointers for this? My search-fu failed me when
trying to find these patches.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

