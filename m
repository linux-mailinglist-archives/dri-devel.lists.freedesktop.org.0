Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 357826D13EA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E972F10F0B7;
	Fri, 31 Mar 2023 00:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2C810F0B7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 00:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680221761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYOsoa4Z7/gzxGDVD3CC/X5K9+9dkcBpkJG6lsPqaj8=;
 b=aewB4nPJ4Qkhpth1qoqbLXaIH1+tYZobqaZ3zOvGs8G9ztdbF1mobGFJo/tlgmRykrkos4
 QeTBt8gdNFIUUuP5iQghjibSCt0JgST0sTfROpJ8Aivjc0thsHb770Bzz/+vL/7NfAIRDd
 VJORGGI30X3ZNMMnwzBUhNS5O27j0aQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-MZMXz7chNX2oUw0eL893UA-1; Thu, 30 Mar 2023 20:15:59 -0400
X-MC-Unique: MZMXz7chNX2oUw0eL893UA-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay37-20020a05600c1e2500b003ee69edec16so11151874wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 17:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680221758;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bYOsoa4Z7/gzxGDVD3CC/X5K9+9dkcBpkJG6lsPqaj8=;
 b=3HOqQaJ0mYLyqJ5P8MbQIGA2elbSmQ1M9oDkaHe0SG3bb70u+4jKhwMRAbsRdS80+H
 R7/my3IWIUauYiPcQHIAeChLhnogNutC8qhFTeevX9WeLZNDu5zkxYh7tblQEBLwGRpa
 VAJ87alvStnijPUx0LQG3AlNV8avlhVcEmO3lw37BMQrl3aYhCdf/8+QD/dR4itsjwmb
 xLg1+i1muCLB6UoVqWxmsEusM6giSiCA/83oT/JstvhdCa2QZTPW+bF9rrC6DMWaTYbZ
 OoSF90AA3lOjdN6TypuzpgdE6GK6vtzioU0WpfH25uRK3ig8DG4uTjWGrlPCgGBYLmvS
 VhxQ==
X-Gm-Message-State: AAQBX9flMfU5oa9ZXZDa/GGA1O+zvdjZm2oeCUJCCHexvbQeAWuYYrBO
 kXsJd/DxEXSYEvCK9FgF79KjA4zFXbHZ5jt15eBA6Dz7exSKgJYx8g2J6xVk0rbAqaEkJ9+Uapz
 5ijNonDvQnWqORSzwi4Urfyg2GOkm
X-Received: by 2002:a1c:7217:0:b0:3f0:4428:94fa with SMTP id
 n23-20020a1c7217000000b003f0442894famr138633wmc.26.1680221758619; 
 Thu, 30 Mar 2023 17:15:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350aGe2qUYI+NqZK/kTvYxcsrjwHb7rnqJNwLLZQKg/VCLaKJKplsusq+6pTRrgIe8gKX+8bKnA==
X-Received: by 2002:a1c:7217:0:b0:3f0:4428:94fa with SMTP id
 n23-20020a1c7217000000b003f0442894famr138624wmc.26.1680221758354; 
 Thu, 30 Mar 2023 17:15:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003e203681b26sm740608wme.29.2023.03.30.17.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 17:15:57 -0700 (PDT)
Message-ID: <f5286649-01b6-5121-e1f9-b42605e0a556@redhat.com>
Date: Fri, 31 Mar 2023 02:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [GIT PULL] etnaviv-fixes for 6.3
To: Lucas Stach <l.stach@pengutronix.de>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <de8e08c2599ec0e22456ae36e9757b9ff14c2124.camel@pengutronix.de>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <de8e08c2599ec0e22456ae36e9757b9ff14c2124.camel@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/23 18:19, Lucas Stach wrote:
> Hi Dave, Daniel,
> 
> please pull the following fixes for the next rc. One fix to get rid of
> a memory leak showing up in the wild and two reverts to get rid of the
> scheduler use-after-free reported by Danilo.

Besides the reverts, we might want to consider something like this as 
well: https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.com/T/#u

Considering Christians response to my report, this isn't the first time 
this happened. Admittedly, it's a bit subtle and I'd like to prevent 
something like this happening again.

- Danilo

> 
> Regards,
> Lucas
> 
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>    Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.pengutronix.de/git/lst/linux etnaviv/fixes
> 
> for you to fetch changes up to baad10973fdb442912af676de3348e80bd8fe602:
> 
>    Revert "drm/scheduler: track GPU active time per entity" (2023-03-30 17:47:05 +0200)
> 
> ----------------------------------------------------------------
> Lucas Stach (3):
>        drm/etnaviv: fix reference leak when mmaping imported buffer
>        Revert "drm/etnaviv: export client GPU usage statistics via fdinfo"
>        Revert "drm/scheduler: track GPU active time per entity"
> 
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 43 +------------------------------------------
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 10 +++++++++-
>   drivers/gpu/drm/scheduler/sched_main.c      |  6 ------
>   include/drm/gpu_scheduler.h                 |  7 -------
>   4 files changed, 10 insertions(+), 56 deletions(-)
> 

