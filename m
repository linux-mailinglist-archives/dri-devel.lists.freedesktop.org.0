Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7A24E6C4
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B896E447;
	Sat, 22 Aug 2020 09:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC496E447;
 Sat, 22 Aug 2020 09:47:37 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 38C4680516;
 Sat, 22 Aug 2020 11:47:35 +0200 (CEST)
Date: Sat, 22 Aug 2020 11:47:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Ing. Josua Mayer" <josua.mayer@jm0.eu>
Subject: Re: etnaviv crashes on dove cubox since 5.7.0 with external abort on
 non-linefetch (0x1808) at 0xf09c8000
Message-ID: <20200822094733.GE430436@ravnborg.org>
References: <a26c4ca5-483d-2244-976e-505e2ac28df0@jm0.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a26c4ca5-483d-2244-976e-505e2ac28df0@jm0.eu>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=c-y2BjIB62eLKLXEq0IA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: airlied@linux.ie, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Josua.

On Fri, Aug 21, 2020 at 03:25:36PM +0200, Ing. Josua Mayer wrote:
> Dear Maintainers, readers ...
> 
> While updating the solidrun cubox (dove) running debian from 5.6 to 5.7
> I came across a new crash in etnaviv that did not occur before - and is
> also present in 5.8.0:
> 
> [   33.042453] etnaviv etnaviv: bound f1840000.gpu (ops gpu_ops [etnaviv])
> [   33.049195] etnaviv-gpu f1840000.gpu: model: GC600, revision: 19
> [   33.055216] 8<--- cut here ---
> [   33.058257] Unhandled fault: external abort on non-linefetch (0x1808)
> at 0xf09c8000
> [   33.065878] pgd = 3adc9ddb
> [   33.068570] [f09c8000] *pgd=2e83f811, *pte=f1840653, *ppte=f1840453
> [   33.074825] Internal error: : 1808 [#1] SMP ARM
> ... full logfile attached
> 
> A lengthy git bisect revealed:
> 815e45bbd4d3b00ddb2af017fbdab25110ed13a4 is the first bad commit
> commit 815e45bbd4d3b00ddb2af017fbdab25110ed13a4
> Author: Christian Gmeiner <christian.gmeiner@gmail.com>
> Date:   Mon Jan 6 16:16:47 2020 +0100
> 
>     drm/etnaviv: determine product, customer and eco id
> 
>     They will be used for extended HWDB support.
> 
>     Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
>     Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> 
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 ++++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 +++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> Since I understand neither the crash nor the patch that triggers it, I
> am posting this here in front of more trained eyes ;)

Good news it is already fixed, but patch is not upstream.
Could you try this patch and report back, especilly if the patch does
not help.

https://lore.kernel.org/dri-devel/20200821181731.94852-1-christian.gmeiner@gmail.com/

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
