Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F10666CC6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 09:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C661C10E894;
	Thu, 12 Jan 2023 08:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0F110E894
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673513093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5a4BjVGA5+VS7280a0HZ27tLyRrI18llQE1bUBA8/1A=;
 b=DOgsRssGXCLt4JF9OAwjaCMhhcHQAgMk1Fyt1l3dOJjlcQ8tSLWE+WdVliAepuoO2ur+A7
 4IFwgl28LpNqn9CYJP6peZBRoxcIdxEyxg2poTEwm51aSReDGbDH6vfgjgDHeMrdO70ZQz
 TIUlr4mliy4ghi5Q8uELXYufROrXuQQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-Q2EdmdvTMq2S41DGhCfXWA-1; Thu, 12 Jan 2023 03:44:50 -0500
X-MC-Unique: Q2EdmdvTMq2S41DGhCfXWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k38-20020a05600c1ca600b003da1c24f23cso147248wms.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 00:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5a4BjVGA5+VS7280a0HZ27tLyRrI18llQE1bUBA8/1A=;
 b=Na2+SSbIzOHTBCax7nik3b0aF+2vSQRAAZ59qVHT036zr1ZH340M2wpSVPzl1BTHAl
 k7VtVD8b7h9Dd0U6Gb3Z5eKgpda6ZS86ECatlD/5OWUqmepTxn+fbOJl8ksEJxuJKKVm
 3iHxxNdpnEvaWQjCvLxhXVCoVJl/aBPjwlmuNzsO0IiJRCiKb3gqf5OcnlmaLIZF1OpQ
 0kqhNVG0mAijjtyPKMHtRFl0HrlPbhINAITLvz5tpfSZNrpO/xVXlt1swaN5S8CwVuch
 T8fCSYo2/C6j0RSuUDbE7ZF6hZ738EMtu01zJRkVOAedfrGIb881qwyT5MD/tlh7tXoT
 uFnw==
X-Gm-Message-State: AFqh2krkLwJhWoId4uqDl7+llWzOJ2uEU932hB/RinRCttCArvV9IZhz
 HUrazLttPxbid68uBb0b0MfthkkWa2g+kZJmleU3zz1PokuCKSUthlayZCHVi+YKVZxF+pL/CaC
 OHNXkl0NQPVFS/ukF9rzkIudU3gom
X-Received: by 2002:a05:6000:705:b0:267:e918:d1e6 with SMTP id
 bs5-20020a056000070500b00267e918d1e6mr47978584wrb.51.1673513089192; 
 Thu, 12 Jan 2023 00:44:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsBcz+NOewCErJTagdikvQUga/n6zRME4ChBTvTDSkbfqsCpMEvFJRtoH3xbPIha9jKtsWTZw==
X-Received: by 2002:a05:6000:705:b0:267:e918:d1e6 with SMTP id
 bs5-20020a056000070500b00267e918d1e6mr47978578wrb.51.1673513088989; 
 Thu, 12 Jan 2023 00:44:48 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d66c9000000b002bdd7ce63b2sm526804wrw.38.2023.01.12.00.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 00:44:48 -0800 (PST)
Message-ID: <733eb41e-a296-47bb-ce06-18dff755723c@redhat.com>
Date: Thu, 12 Jan 2023 09:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 11/11] video/aperture: Only remove sysfb on the default
 vga pci device
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Aaron Plattner <aplattner@nvidia.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-11-daniel.vetter@ffwll.ch>
 <fb72e067-3f5f-1bac-dc9b-3abd9d7739a2@redhat.com>
 <ad725823-f4ef-904f-c04c-90a6aad43323@nvidia.com>
 <7b00e592-345f-4dd5-3452-7f6f70fc608a@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <7b00e592-345f-4dd5-3452-7f6f70fc608a@suse.de>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/12/23 08:55, Thomas Zimmermann wrote:

[...]

>> Thanks Daniel and Javier!
>>
>> I wasn't able to reproduce the original problem on my hybrid laptop 
>> since it refuses to boot with the console on an external display, but I 
>> was able to reproduce it by switching the configuration around: booting 
>> with i915.modeset=0 and with an experimental version of nvidia-drm that 
>> registers a framebuffer console. I verified that loading nvidia-drm 
> 
> Thank you for testing.
> 
> One thing I'd like to note is that using DRM's fbdev emulation is the 
> correct way to support a console. Nvidia-drm's current approach of 
> utilizing efifb is fragile and requires workarounds from distributions 
> (at least here at SUSE). Steps towards fbdev emulation are much appreciated.
>
 
I was meaning to mention the same. Fedora also is carrying a workaround just
for the Nvidia proprietary driver since all other drivers provide a emulated
fbdev device.

So getting this finally fixed will be indeed highly appreciated.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

