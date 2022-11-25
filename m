Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8C0638F71
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 19:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45F510E785;
	Fri, 25 Nov 2022 18:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BCC10E785
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=02v2tOTIgeiZlqNjn7CcBPGh22Rf7rYTwxnR0ZjxRbg=; b=cd2+6g5s9w8Yv8A6Qu5Mhws/9F
 reWAPDReev8tXvMsWnSJOXwZUqQsdXvM3Y6Q2HCDa/NbKEi+cPSV2xeLo5I04RuCM3ZPm32Gwgxiz
 th1ACEN6cgkY2gfaWndVb25ZwRNzE+Z8CEAjtttOpUJ7hZ3hTN9CRAdp3BY7uGhv6EG3Il+tGeLAL
 FOMRIKlov/zHTH8fTmuRUt/4Q1WsRJawcP0h209HJOuyx5a27pRQ0tphynIoiolpyf45stN4y3c7T
 3SqtSeAnEeI4ObivBfAwNIAxZIdNoxv+EpbqnOuBo48b9FKhf9PAAUmFJ55nmVX7HMP/F0Z6usJQk
 CDX0Q8vg==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=49584)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oyczs-0006KQ-DA; Fri, 25 Nov 2022 19:00:20 +0100
Message-ID: <617154df-72a6-e6bb-e7ba-f328e12c538f@tronnes.org>
Date: Fri, 25 Nov 2022 19:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/8] drm/mipi-dbi: Convert to shadow-plane helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121104532.8301-1-tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 11.45, skrev Thomas Zimmermann:
> Convert the MIPI-DBI-based drivers to shadow-plane helpers. The
> drivers vmap/vunmap GEM buffer memory during the atomic commit.
> Shadow-plane helpers automate this process.
> 
> Patches 1 to 4 prepare the MIPI code for the change and simplify
> the restof the patchset.
> 
> Patches 5 to 7 rework the vmap code in the MIPI-DBI drivers and add
> shadow-plane helpers. Most of the affected drivers call MIPI-DBI
> helpers and get the update automatically. Only ili9225 and st7586
> require changes to their source code.
> 
> Patch 8 simplifies drm_dev_enter() and _exit(). It's not strictly
> needed, but streamlines the driver code and make sense overall.
> 
> Testing is welcome, as I don't have any hardware to test these
> changes myself.
> 

Tested-by: Noralf Trønnes <noralf@tronnes.org> # drm/tiny/mi0283qt

> Thomas Zimmermann (8):
>   drm/simple-kms: Remove drm_gem_simple_display_pipe_prepare_fb()
>   drm/ili9225: Call MIPI DBI mode_valid helper
>   drm/st7586: Call MIPI DBI mode_valid helper
>   drm/mipi-dbi: Initialize default driver functions with macro
>   drm/mipi-dbi: Prepare framebuffer copy operation in pipe-update
>     helpers
>   drm/mipi-dbi: Support shadow-plane state
>   drm/mipi-dbi: Use shadow-plane mappings
>   drm/mipi-dbi: Move drm_dev_{enter,exit}() out from fb_dirty functions
> 
>  drivers/gpu/drm/drm_gem_atomic_helper.c      |  31 +---
>  drivers/gpu/drm/drm_mipi_dbi.c               | 175 +++++++++++++++----
>  drivers/gpu/drm/drm_simple_kms_helper.c      |   2 +-
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c |   6 +-
>  drivers/gpu/drm/tiny/hx8357d.c               |   5 +-
>  drivers/gpu/drm/tiny/ili9163.c               |   6 +-
>  drivers/gpu/drm/tiny/ili9225.c               |  42 +++--
>  drivers/gpu/drm/tiny/ili9341.c               |   5 +-
>  drivers/gpu/drm/tiny/ili9486.c               |   5 +-
>  drivers/gpu/drm/tiny/mi0283qt.c              |   5 +-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c        |   5 +-
>  drivers/gpu/drm/tiny/st7586.c                |  45 +++--
>  drivers/gpu/drm/tiny/st7735r.c               |   5 +-
>  include/drm/drm_gem_atomic_helper.h          |   2 -
>  include/drm/drm_mipi_dbi.h                   |  50 +++++-
>  include/drm/drm_plane.h                      |   4 +-
>  include/drm/drm_simple_kms_helper.h          |   4 +-
>  17 files changed, 265 insertions(+), 132 deletions(-)
> 
> 
> base-commit: b7598e2b3a3116bb5ddbf756db30a0e5dc0877ea
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
