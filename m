Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E567A651CFD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E6710E344;
	Tue, 20 Dec 2022 09:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AFD10E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8TwpXV0XnYsgvagPag9L7MpjXeefLJTkMJCGh9V7pg=;
 b=HUKxeEe/NQ/7x/sMkaAuGBSclBSx+N8Sk2siij16PkayDl/RrfDxowt0mcgQGXTuDGkaQL
 j3EIJzcO4QTMVomAbTALtfCIQBikU38/e90T25U043YmAwozoraOLHUofUAKjEko+GbWA+
 UvTSIplJwSrGoIExdDb+Co7xWCQFeW8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-29Si5S55NGmu3LIjELSWHg-1; Tue, 20 Dec 2022 04:17:26 -0500
X-MC-Unique: 29Si5S55NGmu3LIjELSWHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 9-20020a1c0209000000b003d1c0a147f6so7778228wmc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 01:17:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E8TwpXV0XnYsgvagPag9L7MpjXeefLJTkMJCGh9V7pg=;
 b=NzDc7EqLd5DjJztDkcganLeUetl/R6d/t+lD5BnvgF1bSXKwe2lpEk+eq4mBhxy3Vm
 tWXvw6PfAQpgAJXa446SuNYKE9n3ccTsdkDJw6dhcP3OeDOA4NjiI1/MTLK5NFwPd+AG
 QNyLvDqV+2R17syV3yjS/HpxAPDRoShVJNTxdrH4SAWFZgI0OX6FXzWYVsiaRVJBy5mu
 uDE1MDBku560jBb3/d8+sMUvJNhY6dyLbrlWN5uBz+a1YXlTlu7A7WgU9Pi5yW4a89kH
 VR1zGE/GySPoGusNBJrEuxVpvGjzxW4gpyaRuBHm7Ksju8ejxKSw2UqlxE/7w/mx+T7f
 pbnA==
X-Gm-Message-State: AFqh2kpD92kFKTF1flIAQV7OfCNEEsf7j8DjNviSbOlHER7E4SuDNX5C
 2Cf/xa8jxqTBAm5vuS4Hkki4vzY1LNxlo+Ou+AmprOKiJFTZSVm8oHzWCRFMccIKkVc8cDAVu96
 I/oCkZKdPqtiCfV+msbrE7gQckAg6
X-Received: by 2002:a05:600c:220c:b0:3d2:3831:e5c4 with SMTP id
 z12-20020a05600c220c00b003d23831e5c4mr995470wml.40.1671527845274; 
 Tue, 20 Dec 2022 01:17:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuuo6HgeH5yLW955AXoTEHdpszfHBedFCr5hOSv462STXosZPN5E6XN8VtP9mnawtIRXA48sQ==
X-Received: by 2002:a05:600c:220c:b0:3d2:3831:e5c4 with SMTP id
 z12-20020a05600c220c00b003d23831e5c4mr995452wml.40.1671527845031; 
 Tue, 20 Dec 2022 01:17:25 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003c71358a42dsm30460043wmq.18.2022.12.20.01.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:17:24 -0800 (PST)
Message-ID: <4bb928f8-ee2c-7b3c-9390-7efb53c23b80@redhat.com>
Date: Tue, 20 Dec 2022 10:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 02/18] Revert "fbcon: don't lose the console font across
 generic->chip driver switch"
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de
References: <20221219160516.23436-1-tzimmermann@suse.de>
 <20221219160516.23436-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219160516.23436-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/19/22 17:05, Thomas Zimmermann wrote:
> This reverts commit ae1287865f5361fa138d4d3b1b6277908b54eac9.
> 
> Always free the console font when deinitializing the framebuffer
> console. Subsequent framebuffer consoles will then use the default
> font. Rely on userspace to load any user-configured font for these
> consoles.
> 
> Commit ae1287865f53 ("fbcon: don't lose the console font across
> generic->chip driver switch") was introduced to work around losing
> the font during graphics-device handover. [1][2] It kept a dangling
> pointer with the font data between loading the two consoles, which is
> fairly adventurous hack. It also never covered cases when the other
> consoles, such as VGA text mode, where involved.
> 
> The problem has meanwhile been solved in userspace. Systemd comes
> with a udev rule that re-installs the configured font when a console
> comes up. [3] So the kernel workaround can be removed.
>
> This also removes one of the two special cases triggered by setting
> FBINFO_MISC_FIRMWARE in an fbdev driver.
> 
> Tested during device handover from efifb and simpledrm to radeon. Udev
> reloads the configured console font for the new driver's terminal.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=892340 # 1
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=1074624 # 2
> Link: https://cgit.freedesktop.org/systemd/systemd/tree/src/vconsole/90-vconsole.rules.in?h=v222 # 3
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

