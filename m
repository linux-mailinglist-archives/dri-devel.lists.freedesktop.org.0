Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEBE51FBC5
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 13:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69DB10ED13;
	Mon,  9 May 2022 11:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C223110ED13
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652097344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xm/K2vPG3eyk/BOEFauBHWfC86brT3r7CMsbdWwspKg=;
 b=TWGvcFA46XaZucUpSueMJDwfKSwAdsjd3sRzoPeliPhOQpVi6yoaxXfiA2WnX4Dja+Tb2o
 QnqDE+7lcOyBwWU7leK5BAMf6FisfwKnUxG1QWzal9eBKS0n4Up3OXtJNQEkj+mZ0rHJk8
 rPR4gY0GPeT4Y/ZFgPy1kNKdKXTi4K4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-w-G8Y5OGNXmZpCnFaeik8g-1; Mon, 09 May 2022 07:55:43 -0400
X-MC-Unique: w-G8Y5OGNXmZpCnFaeik8g-1
Received: by mail-ej1-f72.google.com with SMTP id
 ox8-20020a170907100800b006f9dc6e4a22so1003841ejb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 04:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xm/K2vPG3eyk/BOEFauBHWfC86brT3r7CMsbdWwspKg=;
 b=l8FTog8zJbx7f3yuTb4Y6PWyyZFBu3uvosm2gwoc76RV63aiW90Dwp1PbvcKl43Tbj
 Td9ORfVINFZVlBfS/hFT1nfiQ9AA6fPEfqSS2UzwgkC64HJhw7BBap35kWBLARjl++/t
 EPOUDYeOt5xbE4pcrvpkS30cWURNEYXfOgQEs5IvR2bNavDYnl8WAsNRUt0bKNNbmaU8
 WGrPtYTid/uXkMkezS9RXKtUThKiS3OwA6JEcIEU8lRXrEJ6REX4+YjvwG6igktIbj/t
 6oes5pUXMhJQ1E7v9q8JtvKmfOArv8DShBCQRXCUIqy3DqbW3VjMv6UnVGdMAd7GSzj6
 Zlcg==
X-Gm-Message-State: AOAM533bKyQfzL9AlELDE1/45smamcLyAtGkk63yqj6EDZpY4i/KELCw
 E2vO6s28ot31bX8tkVG/UBbX0Lmi14zno3UsVYBJDL8pKUxZl+x/mOIL04QNmnVLS33zhn81xhg
 CUw3NTjLeVrj4YBENZ0mchOn3+cB1
X-Received: by 2002:a17:906:6a0f:b0:6f5:15cf:2e5 with SMTP id
 qw15-20020a1709066a0f00b006f515cf02e5mr13990160ejc.584.1652097342519; 
 Mon, 09 May 2022 04:55:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/IviDV3X4F7qm85nm38k7Yt3xzAVZh58hRP5EosesfaWJElC4Dp7LgH19w4cF8ut03cqX9A==
X-Received: by 2002:a17:906:6a0f:b0:6f5:15cf:2e5 with SMTP id
 qw15-20020a1709066a0f00b006f515cf02e5mr13990141ejc.584.1652097342317; 
 Mon, 09 May 2022 04:55:42 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 g34-20020a056402322200b0042617ba63b7sm6076764eda.65.2022.05.09.04.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 04:55:41 -0700 (PDT)
Message-ID: <aa4c0305-c99b-050b-80a5-d13e8e10b78c@redhat.com>
Date: Mon, 9 May 2022 13:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/vmwgfx: Fix passing partly uninitialized
 drm_mode_fb_cmd2 struct
To: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
References: <20220509110425.165537-1-hdegoede@redhat.com>
 <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6eea44ce-4057-7267-8a0b-096cdc61dd94@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/9/22 13:52, Javier Martinez Canillas wrote:
> Hello Hans,
> 
> On 5/9/22 13:04, Hans de Goede wrote:
>> vmw_fb_kms_framebuffer() declares a drm_mode_fb_cmd2 struct on the stack
>> without zero-ing it and then continues with initializing only some fields.
>>
>> This leads to drm_mode_fb_cmd2.modifiers[0] containing garbage,
>> which eventually gets used by drm_helper_mode_fill_fb_struct() to
>> set fb->modifier when leads to the following atomic-check failure:
>>
>> vmwgfx 0000:00:02.0: [drm:drm_atomic_check_only] [PLANE:34:plane-0]
>>  invalid pixel format XR24 little-endian (0x34325258),
>>  modifier 0xffff94d64719e000
>> fbcon_init: detected unhandled fb_set_par error, error code -22
>>
>> Which causes the fbdev emulation and thus also fbcon to not work.
>>
>> Initialize the struct with all zeros to fix this.
>>
>> Fixes: dabdcdc9822a ("drm/vmwgfx: Switch to mode_cmd2")
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2072556
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> Zack fixed this already:
> 
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5405d25b9e8e6

I see, but it seems that this was never pushed to drm-misc-fixes,
so this is still broken in 5.18-rc#

Regards,

Hans

