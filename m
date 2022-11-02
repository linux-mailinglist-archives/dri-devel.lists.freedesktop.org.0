Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF186163C0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 14:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B5610E12C;
	Wed,  2 Nov 2022 13:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755D110E12C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667395120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwBDqC0WlxuXZx78i1Kk8UO6XhWjpnLHnqutJ4PGo5M=;
 b=AZnNriMuN+1MZLCTdoa7V62oY0aiZCdcIL29DSBov0yMNL19Yg5eFxu7HOMzm4AivoCQ4T
 XjVRPR2UuTp+C3HXbFTMuaJI0ipv5c+/uhooU1hrZ3lD6kyfxy0Hol3X0xgwT9s7EP5sy6
 b17HagTpo4yNAsefRYWvcF+6z5PO19U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-Oqkz98c9OgSKqG0gdvUBtw-1; Wed, 02 Nov 2022 09:18:39 -0400
X-MC-Unique: Oqkz98c9OgSKqG0gdvUBtw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h18-20020adfa4d2000000b00236584fc8c7so4772033wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 06:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZwBDqC0WlxuXZx78i1Kk8UO6XhWjpnLHnqutJ4PGo5M=;
 b=ImOpZMy4/qerJf6m3ZyiK/ZqV91HqeOgoYaHzjT40W7R6PoU43//5JZODAj+CeZk8M
 hjBDB/D5dPVt/6PH1sQjjumLFzVIBlBkbQLIcsaDrfvQwLk+xVOe2MqDKQaYeOjJQEIm
 osmgbgwevDK9hyGKcYDziedSwt0h9FBqT56xexB/PrUbZ0KuoIcjQtkqvEMHFl43fZ3K
 1D3icTnLzhFKyYEgkTpICdedaq7LFRHNQQbbVOk1SqJNpD1/d7xWx/WoiHhyCeJHykk+
 ZgvamwIEkaZrRcG7R1cHE/SlCsh1eXk/ku2Z2McHhFx8MwW+eaEef9pipiCMkUyWjg8U
 pftg==
X-Gm-Message-State: ACrzQf2+DAaoNSzqnCuTRts8UN7vmVC5e6Z3LaXNPIfNVZ4gA7/4LIcx
 gijRYuAuE/4hhFb/yrwb1s3PFdO5L2igS9yyRYYycXtz4VRiXQMWSqIgCZbUYirfjlAyEPjUwmf
 EtqgHRHW60sYT9OJf96sKt4Wt1TCd
X-Received: by 2002:a05:600c:5114:b0:3c7:8eb:fb1c with SMTP id
 o20-20020a05600c511400b003c708ebfb1cmr25705164wms.204.1667395117342; 
 Wed, 02 Nov 2022 06:18:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5U52V0wvyQJ486LBjKPqaxRm1EVlCaEMo6kliRl30sq1oyZZOlqqfv3r0EC32G7WNFtgW8hQ==
X-Received: by 2002:a05:600c:5114:b0:3c7:8eb:fb1c with SMTP id
 o20-20020a05600c511400b003c708ebfb1cmr25705150wms.204.1667395117182; 
 Wed, 02 Nov 2022 06:18:37 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b13-20020a5d550d000000b002366b17ca8bsm14769255wrv.108.2022.11.02.06.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 06:18:36 -0700 (PDT)
Message-ID: <b464794b-2bb9-99d7-0172-41f565701fa0@redhat.com>
Date: Wed, 2 Nov 2022 14:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm/ofdrm: Depend on CONFIG_MMU
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, maxime@cerno.tech
References: <20221101104049.15601-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221101104049.15601-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Danilo Krummrich <dakr@redhat.com>, Michal Suchanek <msuchanek@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/22 11:40, Thomas Zimmermann wrote:
> Add a dependency on CONFIG_MMU to ofdrm. The driver uses GEM SHMEM
> helpers, which require MMU support. A reported error message [1] is
> shown below.
> 
>    arm-linux-gnueabi-ld: drivers/gpu/drm/drm_gem_shmem_helper.o: in function `drm_gem_shmem_fault':
>    >> drivers/gpu/drm/drm_gem_shmem_helper.c:562: undefined reference to `vmf_insert_pfn'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: c8a17756c425 ("drm/ofdrm: Add ofdrm for Open Firmware framebuffers")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: "Noralf Trønnes" <noralf@tronnes.org>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Michal Suchanek <msuchanek@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Link: https://lore.kernel.org/dri-devel/202210192029.ZFeJvqjv-lkp@intel.com/ # [1]
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

