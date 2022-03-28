Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A64E91AE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFE410E161;
	Mon, 28 Mar 2022 09:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C9A10E61F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 09:46:21 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 383629BC;
 Mon, 28 Mar 2022 11:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648460779;
 bh=pcwCelIgg5PfKrL30CLzfV5FkRHuZw4RuC17Tbggats=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZBJbMRU4Y2a2og6ngrKoRpzry4+v/5N549nTM1Xdtqg3UfXJf9eYErOFhydcgP30K
 wutgdrbnwEK147LiLJI6GH4JPZ/tNhHawcw6jKx+7bOGA0IOznz82K0nIjfaEvROS+
 xZT70vs6Sq92F1DQfjSa4ZVufV0FDj0JTJlF/nCs=
Message-ID: <e126b6a7-5c34-66d5-d371-b2bae3b94924@ideasonboard.com>
Date: Mon, 28 Mar 2022 12:46:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
Content-Language: en-US
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> This patch series fixes excessive DMM or CMA usage of GEM buffers leading to
> various runtime allocation failures. The series enables daily usage of devices
> without exausting limited resources like CMA or DMM space if GPU rendering is
> needed.
> 
> The first patch doesn't bring any functional changes, it just moves some
> TILER/DMM related code to a separate function, to simplify the review of the
> next two patches.
> 
> The second patch allows off-CPU rendering to non-scanout buffers. Without that
> patch, it is basically impossible to use the driver allocated GEM buffers on
> OMAP3 for anything else but a basic CPU rendered examples as if we want GPU
> rendering, we must allocate buffers as scanout buffers, which are CMA allocated.
> CMA soon gets fragmented and we start seeing allocation failures. Such failres
> in Xorg cannot be handeled gracefully, so the system is basically unusable.
> 
> Third patch fixes similar issue on OMAP4/5, where DMM/TILER spaces get
> fragmented with time, leading to allocation failures.
> 
> Series were tested on Motolola Droid4 and Nokia N900, with OMAP DDX and
> PVR EXA from https://github.com/maemo-leste/xf86-video-omap
> 
> Ivaylo Dimitrov (3):
>    drm: omapdrm: simplify omap_gem_pin
>    drm: omapdrm: Support exporting of non-contiguous GEM BOs
>    drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER
> 
>   drivers/gpu/drm/omapdrm/omap_gem.c        | 198 +++++++++++++++++-------------
>   drivers/gpu/drm/omapdrm/omap_gem.h        |   3 +-
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |   5 +-
>   3 files changed, 116 insertions(+), 90 deletions(-)
> 

I have pushed this to drm-misc-next.

  Tomi
