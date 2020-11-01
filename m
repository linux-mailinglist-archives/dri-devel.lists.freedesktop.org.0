Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0B82A1CFE
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 10:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA51C6EA5F;
	Sun,  1 Nov 2020 09:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85776EA5F
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 09:47:22 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 39BD020022;
 Sun,  1 Nov 2020 10:47:20 +0100 (CET)
Date: Sun, 1 Nov 2020 10:47:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] video/fbdev/core: Mark debug-only variable as
 __maybe_unused
Message-ID: <20201101094718.GD1166694@ravnborg.org>
References: <20201021121512.17774-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021121512.17774-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=2p3zRRVL11vTGQ8z29QA:9 a=CjuIK1q_8ugA:10
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 gregkh@linuxfoundation.org, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, jingxiangfeng@huawei.com,
 george.kennedy@oracle.com, daniel.vetter@ffwll.ch, yepeilin.cs@gmail.com,
 natechancellor@gmail.com, jirislaby@kernel.org, peda@axentia.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Wed, Oct 21, 2020 at 02:15:12PM +0200, Thomas Zimmermann wrote:
> Compiling fbcon.c gives
> 
> ../drivers/video/fbdev/core/fbcon.c: In function 'fbcon_exit':
> ../drivers/video/fbdev/core/fbcon.c:3358:7: warning: variable 'pending' set but not used [-Wunused-but-set-variable]
>  3358 |   int pending = 0;
>       |       ^~~~~~~
> 
> The variable pending is only used for fbcon debugging. It's unused
> otherwise. Mark it accordingly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

A better fix would be to replace the few uses of DPRINTK() with
pr_dbg(). pr_info() is alread in use.

ofc, the next step would be to replace all prink() with their pr_
counterparts.

Peilin, maybe this is one for your nice cleanups in fbcon?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
