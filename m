Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B73F2768
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F2D6EA12;
	Fri, 20 Aug 2021 07:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta016.useast.a.cloudfilter.net
 (omta016.useast.a.cloudfilter.net [34.195.253.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D5E6E90E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 22:38:32 +0000 (UTC)
Received: from cxr.smtp.a.cloudfilter.net ([10.0.16.208]) by cmsmtp with ESMTP
 id GitXmBkkIMRfUGqgBm8hw4; Thu, 19 Aug 2021 22:38:31 +0000
Received: from ws ([24.255.45.226]) by cmsmtp with ESMTPSA
 id Gqg7mujOYGuc7Gqg9mu6bO; Thu, 19 Aug 2021 22:38:31 +0000
Authentication-Results: cox.net; auth=pass (LOGIN) smtp.auth=j.duncan@cox.net
X-Authority-Analysis: v=2.4 cv=fKP8YbWe c=1 sm=1 tr=0 ts=611edd67
 a=rsvNbDP3XdDalhZof1p64w==:117 a=rsvNbDP3XdDalhZof1p64w==:17
 a=kj9zAlcOel0A:10 a=1fMUTEkdAAAA:8 a=pGLkceISAAAA:8 a=kviXuzpPAAAA:8
 a=GrN4TtxLF5UlEiDcx2YA:9 a=CjuIK1q_8ugA:10 a=kXTuJJ3fruM0IRz_0_AM:22
 a=qrIFiuKZe2vaD64auk6j:22
Date: Thu, 19 Aug 2021 15:38:26 -0700
From: Duncan <j.duncan@cox.net>
To: lnx7586@gregdf.com
Cc: mikpelinux@gmail.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, jason@jlekstrand.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ttm: allow debugfs_create_file() to fail in
 ttm_global_init()
Message-ID: <20210819153826.460b9c11@ws>
In-Reply-To: <20210816143046.3320-1-lnx7586@gregdf.com>
References: <CAM43=SNDAcS952MZpsiD2Z-WU9Bd0EPv=7Z86i7FGdvDtsSXdQ@mail.gmail.com>
 <20210816143046.3320-1-lnx7586@gregdf.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCtUxm8u7SxW4XPKllZefbNT+mD/lU+MRYFCROUjQvA3TCyuPsw6R/VZUY5w//Uw6HGgSaUHc9IDPNtXKgkkXGGwWIb7vdw5oH43KLhM4WbXX2codFuj
 c/M5tnvlEMFRxVD+/sds4NrKxQQkvTHPQF0Yy4upOzT1DJSS2zhecwr7NldSBjOpbT2pfgVZP79E4FGebFB0/djb5bd+tTWHXlJtkw8hbJv3k8YKjyMfvFBF
 pehxLvpQ9BXppshs+0Ca3u4s/8gmuvmiYFyz4wl4BsqgHiV/MH+87UBmp+hvjHCtPHiaL8iy2PiU3IArQOBhAw4Lb5qwlwRmFIf9uLxCkB5R/p0+in67zz1p
 AnvdkiaH
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Aug 2021 16:30:46 +0200
lnx7586@gregdf.com wrote:

> From: Greg Depoire--Ferrer <lnx7586@gregdf.com>
> 
> Commit 69de4421bb4c ("drm/ttm: Initialize debugfs from
> ttm_global_init()") unintentionally made ttm_global_init() return
> early with an error when debugfs_create_file() fails. When
> CONFIG_DEBUG_FS is disabled, debugfs_create_file() returns a ENODEV
> error so the TTM device would fail to initialize.
> 
> Instead of returning early with the error, print it and continue.
> ENODEV can be ignored because it just means that CONFIG_DEBUG_FS is
> disabled.
> 
> Fixes: 69de4421bb4c ("drm/ttm: Initialize debugfs from ttm_global_init()")
> Reported-by: Mikael Pettersson <mikpelinux@gmail.com>
> Reported-by: Duncan <j.duncan@cox.net>
> Signed-off-by: Greg Depoire--Ferrer <lnx7586@gregdf.com>
> ---
> Hi, I had this bug as well with the nouveau driver after updating.
> This patch fixes it for me.
> 
>  drivers/gpu/drm/ttm/ttm_device.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

This fixes the problem here, too.  Running it now.

Tested-by: Duncan <j.duncan@cox.net>

-- 
Duncan - HTML messages treated as spam
"They that can give up essential liberty to obtain a little
temporary safety, deserve neither liberty nor safety."
Benjamin Franklin
