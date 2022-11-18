Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF062F626
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822210E73A;
	Fri, 18 Nov 2022 13:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4AD10E73A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668778320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x4nB3PcQq6z+eg2ypXICO8ip5B2x/s01xN0yuqnITsw=;
 b=HupPPATjvunp/dtBRzIgC7NCkPmi1fOuQ6m1nQZN9N0tWBg3JrU6cyqPE6/qTvfCibqDGu
 p1bsLLGdP8kmhA6+wT0So5pTwcHPIlHl050uMvUti90ObCe+iGEl8akkYMznpo9D1sktsB
 9p8pmTC1pkwBQTuXtkgI6ATHvUqH+fg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-lfgcOLwdOtOUEeh8yScWxw-1; Fri, 18 Nov 2022 08:31:59 -0500
X-MC-Unique: lfgcOLwdOtOUEeh8yScWxw-1
Received: by mail-wr1-f72.google.com with SMTP id
 q2-20020adfab02000000b00241b8f7efc5so1415966wrc.19
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 05:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x4nB3PcQq6z+eg2ypXICO8ip5B2x/s01xN0yuqnITsw=;
 b=01B58CcoWatXrzqeMt9R6LuVY5wdimBgCetdpc8QrF03jYcTIHMAz8TxucmdO5p5sX
 oUS0bvsbU0B3dlfKazz592fEIvi2xTGGZcvkjo25xcJ25AKdbyIJgO6JJ2jojqyXPvuU
 CYUIKmOcAq1/wTUF9zky2sBR6ktCXfA9r9N5e6aYaZrlrfXIX3UMd2PEhYXuYapX+MXX
 aI4J9kw6NuBLF5Wgu69PIzFaH3F+7nJ9i9ZdvZ2ooXxA9DMPW/FB2J1tF+0f07PelM8c
 QQn6dTfRgfSPaHS77rOy91QKZkIfF4Mhp3EPkzgQOb6fOIY49drHy2BoaHQj5M+lXwV3
 GD6g==
X-Gm-Message-State: ANoB5plEkqJVqWWoAYQk4Spj6XkLLfwFgp5mUiv7RB/U6fZQfpiIyERO
 Ihbuq66pkLmUhCA2sHZt97iXSHxlOYwJDqO1WShrtNtrdjnCI6LpSkKp8zureDzDLncXqFNGQ/7
 6OPmuNo1dG8Fo4VgwtPOdmiZU16AN
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id
 t21-20020a1c7715000000b003cfd18d3bfemr8286106wmi.203.1668778317985; 
 Fri, 18 Nov 2022 05:31:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Pcf9S1nam9Z2k4KCq9jhFqDb+bRC08A7LTUa1O+CywPor3rPQ+WkpX7PNfeTd9M/CvDc+pg==
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id
 t21-20020a1c7715000000b003cfd18d3bfemr8286091wmi.203.1668778317791; 
 Fri, 18 Nov 2022 05:31:57 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003c5571c27a1sm5745729wmo.32.2022.11.18.05.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 05:31:57 -0800 (PST)
Message-ID: <c1d46889-904d-c9c2-e246-4c8cfc1aeefe@redhat.com>
Date: Fri, 18 Nov 2022 14:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/7] drm/hisilicon/hibmc: Fix preferred depth and bpp
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-2-tzimmermann@suse.de>
 <b0421c22-2893-d76a-4cd8-07f5fdb9add1@redhat.com>
 <a62babce-5deb-43ba-1a96-8f31c603b3a2@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <a62babce-5deb-43ba-1a96-8f31c603b3a2@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 14:18, Thomas Zimmermann wrote:

[...]

>>
>> In the cover letter you said "color depth is the number of color and alpha bits
>> that affect image composition" but it should be "only the number of color bits
>> excluding the alpha bits" a better description right?
> 
> I was looking at drm_fourcc.c, where alpha formats, such as ARGB888, 
> have alpha included in their depth value. [1] Alpha obviously effects 
> image composition.
> 
> But meaning of these terms is somewhat fuzzy, as the command-line 
> arguments of video= include a BPP value that is more similar to DRM's 
> depth value.
>

I see.
 
> [1] 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fourcc.c#L175
> 
>>
>> I also wonder if instead of using a 24 magic number, TRUE_COLOR_DEPTH constant
>> macro or XRGB8888_COLOR_DEPTH could be defined?
> 
> Please not. What we should do is to replace the preferred depth and bpp 
> with a single format constant (as 4cc or drm_format_info) that 
> designates a preferred default. From that format constant, the values 
> exported to userspace and fbdev emulation should be retrieved automatically.
> 
> If anything, I'd add a TODO item to convert the DRM codebase.
>

Right. That makes more sense indeed.
 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

