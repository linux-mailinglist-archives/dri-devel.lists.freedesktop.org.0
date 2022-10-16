Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2C5FFD1F
	for <lists+dri-devel@lfdr.de>; Sun, 16 Oct 2022 05:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECA610E2C4;
	Sun, 16 Oct 2022 03:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1C710E2C4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Oct 2022 03:10:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7C8A884D39;
 Sun, 16 Oct 2022 05:10:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665889834;
 bh=/ih7MMtOVWk6y6McHxlK2kgpKWNK9A6akUXnMQnaunc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ssbj94ZRaC3Z3ccy41Xums/8QHO7fjbkprTjw0Y/DN0lyptxxCU77li4eQ2qI1ztR
 8zSvr0S0oWjurNWpYLvw4BPbnCsEPHXIBzImXJV4iw2okevx/rrsLW+zoQI7Pordhz
 7/u+S66CaLmGXziFtUIdzZ7fNvpwAUt39KLtrJqpdyjL2kQ6w+xo1DG1boS5+E7gf0
 dFDEEKnnlJnJIlH9nZO/WYBVOChSz6EIW7h0yVZas+FeNU1NRKZ+jYQbPdnB06ANHc
 q9Dkeqk1MyKJzOJKwMsfu8fd7omKTW0p/VwrCo4N824LuwV6W5a3tLEVrlGYDhnI6i
 w1Evp76sy4ieg==
Message-ID: <30f0f13c-0ae5-3f70-c6ce-56a0c5a4ead0@denx.de>
Date: Sun, 16 Oct 2022 05:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 0/4] drm: lcdif: Improve YUV support
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/29/22 22:42, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series improves YUV support in the i.MX8MP LCDIF
> driver. After patches 1/4 and 2/4 that fix tiny cosmetic issues, patch
> 3/4 fixes YUV quantization range for the RGB to YUV conversion. Patch
> 4/4 addresses the other direction and adds support for YUV planes.
> 
> Please see individual patches for details.
> 
> Compared to v2, review comments have been taken into account, and the
> YUV to RGB coefficients in patch 4/4 have been fixed (they were
> blatantly wrong due to a stupid mistake).
> 
> The series has been tested on a Polyhex Debix board with the currently
> out-of-tree HDMI encoder support patches developed by Lucas Stach, with
> the kmstest and the libcamera 'cam' applications.
> 
> There is a know issue with the way the driver programs the format and
> pitch, which produces incorrect output when testing YUV formats with the
> legacy (non-atomic) KMS API, in particular with the modetest
> application. The framebuffer is accessed from the plane state in
> function called from the .atomic_enable() handler, which in some
> circumstances results in the format and/or pitch of the old frame buffer
> being used. This issue preexists, and can be triggered by selecting a
> different RGB format with modetest (XR15 for instance). It should be
> fixed separately, and I wouldn't consider it as a blocker for this
> series as YUV formats can already be used correctly when using the KMS
> atomic API.
> 
> Kieran Bingham (1):
>    drm: lcdif: Add support for YUV planes
> 
> Laurent Pinchart (3):
>    drm: lcdif: Fix indentation in lcdif_regs.h
>    drm: lcdif: Don't use BIT() for multi-bit register fields
>    drm: lcdif: Switch to limited range for RGB to YUV conversion
> 
>   drivers/gpu/drm/mxsfb/lcdif_kms.c  | 232 ++++++++++++++++++++++++++---
>   drivers/gpu/drm/mxsfb/lcdif_regs.h |  37 ++---
>   2 files changed, 229 insertions(+), 40 deletions(-)

Applied all, thanks
