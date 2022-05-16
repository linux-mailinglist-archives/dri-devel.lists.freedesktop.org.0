Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF5B528561
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5E810FDB5;
	Mon, 16 May 2022 13:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA4210FE6A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8R1mkdr2H6XuHw1sFr97pfwIN3qzLna2pbCQJQJ5MA=; b=GxwUCHr955X6y2XjfI7C7y1pEl
 6RfF2/A+0xENYS/0zZIdlueRuZ8gy97SKNgClyIoZj9hIkwpR7KOKavGTGr/kbu/mC8n0kvy7fr2Y
 GrRrgx8Fwiqt9vMgaMXZYjcuc5uyW5YDPDh6i8LF1sIVzm3lRHjlJ8r6rIhhcEs6RB3B9uFj4iFrD
 RRHwAkWurTIAQFXG1xOOHh3EeAFoq8/NyNZQziYwfYvsrT6ftwDfkx/y2ar7fMAjn+aYZFC3tyCeD
 hhwp2q6Nkh36A2aFweZyYe3Sj/2R2TnzvJsvLmNTL/+hpYMUWYObwKt6Xkh9WVPOS7rAbWoy4fWxV
 eM0n2vpQ==;
Received: from [2a01:799:961:d200:c8f8:d7f:27e0:1988] (port=51716)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nqamc-0004xx-Kz; Mon, 16 May 2022 15:29:10 +0200
Message-ID: <c130681a-980f-c7a8-1497-7a44db30c70c@tronnes.org>
Date: Mon, 16 May 2022 15:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/4] drm: Ignore non-existing color planes in helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 christian.koenig@amd.com
References: <20220509081602.474-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220509081602.474-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 09.05.2022 10.15, skrev Thomas Zimmermann:
> Some DRM helpers assume that all potential color planes of a framebuffer
> are available; even if the color format didn't specify them. Non-existing
> planes are silently ignored. This behavior is inconsistent with other
> helpers and apparently leads to subtle bugs with uninitialized GEM buffer
> mappings. [1]
> 
> Change all affected code to look at the framebuffer format's number of
> color planes and only process these planes. The update has been discussed
> in [2] before.
> 
> Tested with GEM SHMEM helpers on simpledrm.
> 

Tested with drm/gud, now there's only one UBSAN warning:

Tested-by: Noralf Trønnes <noralf@tronnes.org>

I was hoping to get some time to give a review, but it doesn't look like
I'm able to do that.

Noralf.


> [1] https://lore.kernel.org/dri-devel/20210730183511.20080-1-tzimmermann@suse.de/T/#md0172b10bb588d8f20f4f456e304f08d2a4505f7
> [2] https://lore.kernel.org/dri-devel/877dc0d9-c6c6-022c-20d8-14b33e863934@suse.de/
> 
> Thomas Zimmermann (4):
>   drm/gem: Share code between drm_gem_fb_{begin,end}_cpu_access()
>   drm/gem: Ignore color planes that are unused by framebuffer format
>   drm/gem-vram: Ignore planes that are unused by framebuffer format
>   drm/gem: Warn on trying to use a non-existing framebuffer plane
> 
>  drivers/gpu/drm/drm_gem_atomic_helper.c      |   6 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 103 +++++++++----------
>  drivers/gpu/drm/drm_gem_vram_helper.c        |  36 ++++---
>  include/drm/drm_gem_framebuffer_helper.h     |  10 +-
>  4 files changed, 81 insertions(+), 74 deletions(-)
> 
> 
> base-commit: b0b93865a24c910fcbfa6e6fa0955fae930a56d3
