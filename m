Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0187A5628
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 01:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7F610E155;
	Mon, 18 Sep 2023 23:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D84910E155
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 23:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=fLr+5A15VSUbtMMP5IPvcZWsIHqHVDxSBnslFRVcYqA=; b=aUbU6qdjT0Di/P/BZLG6a3Ht/N
 KTLjYdvNCgU5F8txvK5jEC+6bobISzi6cK09L77uw7gnHWpeV/2fwV3hbXQamaN06PEM+tEW8LHG/
 ynaL6WrU+fbkzQu6pD3qPgNiT7GoyduJ6ly07Fp+5n+mkLkMcf4TQnz/S+Yi6jeILohIQK6mUeIWj
 41YWDqcbGqv8OBb+k5gAltv2nmd/DkTYEHU+Mk6FH2XozA28vCI+SY3SMaB/Dj5O1NvxWr2YNHlWe
 FizjsSAMq3avf+xokrJpZo0MplmDBQfIYF4l418fCInCQzVNiDHZms+6kvZZEKDy/eGFOqSwOEyYC
 /vYZzyhg==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=38150)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qiNWV-00Ar9f-5r;
 Tue, 19 Sep 2023 01:19:23 +0200
Message-ID: <5dc52140-e6b1-0fe2-40c3-00dfaa954a03@tronnes.org>
Date: Tue, 19 Sep 2023 01:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC][PATCH v2 0/2] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net
References: <20230915083307.1185571-1-jfalempe@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20230915083307.1185571-1-jfalempe@redhat.com>
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
Cc: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/15/23 10:28, Jocelyn Falempe wrote:
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
> 
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
> 
> This is a proof of concept, and works only with simpledrm, using a new get_scanout_buffer() api
> 

There's a panic handling entry in Documentation/gpu/todo.rst pointing to
some work done in this area.

Noralf.

> To test it, make sure you're using the simpledrm driver, and trigger a panic:
> echo c > /proc/sysrq-trigger
> 
> v2
>  * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
>  * Add the panic reason to the panic message (Nerdopolis)
>  * Add an exclamation mark (Nerdopolis)
>  
> I didn't reuse the fbdev functions yet, that would need some fbdev refactoring, because they rely on struct fb_info, and struct vc_data (for font/console). But I still plan to at least try it for v3.
> 
> A few more though:
>  1) what about gpu with multiple monitor connected ?
> maybe get_scanout_buffer() could return a list of scanout buffers ?
>  2) I think for some GPU drivers, there might need a flush_scanout_buffer() function, that should be called after the scanout buffer has been filled ?
> 
> Best regards,
> 
> Jocelyn Falempe (2):
>   drm/panic: Add a drm panic handler
>   drm/simpledrm: Add drm_panic support
> 
>  drivers/gpu/drm/Kconfig          |  11 ++
>  drivers/gpu/drm/Makefile         |   1 +
>  drivers/gpu/drm/drm_drv.c        |   3 +
>  drivers/gpu/drm/drm_panic.c      | 270 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/simpledrm.c |  17 ++
>  include/drm/drm_drv.h            |  14 ++
>  include/drm/drm_panic.h          |  41 +++++
>  7 files changed, 357 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_panic.c
>  create mode 100644 include/drm/drm_panic.h
> 
> 
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
