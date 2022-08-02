Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A895881D8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 20:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905ED11BB74;
	Tue,  2 Aug 2022 18:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D09112FEF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 18:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=D0PK1bfHTKooI9fAsxRXzq/f4llPUyccP9Do73wixGg=;
 b=JjH3vgnR44o8QQvycQP8bg0nIQDBwVESq0fHHohNrX15lNj5/BQqKbOMN+0KdA6OuaUNyhbZo9T9f
 2Dy0mRksdsZFO/gMQEnGfoA9nt2Zn7VKShm3cfEMc/azV3+T5K14Cm/94DosEMt8PsR1Q2R2DtK/s/
 IDGbw/IA9KL30WnGMQoYPjySxY2tfITaHcMn6dN0zs/gC/qb2xTQ6GBhurLlAPOcx1LezOneMsy9K+
 8tFP6soEmK+28/CAhHY7h/l89xvGqt67w40lImo+GQWVjvS4kkHMSANI+MO7WY23gk37anaxP1irNF
 U82hL4a0vaMjhLB4bbAFwgp1a2r8qXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=D0PK1bfHTKooI9fAsxRXzq/f4llPUyccP9Do73wixGg=;
 b=Tvcx8T7g7fVGMIcB1ZmB/CKSAklYWRtVeA06FvfQDl/nCKMORIKE9YI72lyfRykC6dNiy/n3faECF
 e8jU/7lBA==
X-HalOne-Cookie: a2f6cb94a3c37daf9f3f2f5680c1594af0cb938c
X-HalOne-ID: b1e9030c-1290-11ed-be81-d0431ea8bb03
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id b1e9030c-1290-11ed-be81-d0431ea8bb03;
 Tue, 02 Aug 2022 18:26:58 +0000 (UTC)
Date: Tue, 2 Aug 2022 20:26:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v7 0/5] drm: rename CMA helpers to DMA
 helpers
Message-ID: <YulscTGLXzsbar4v@ravnborg.org>
References: <20220802000405.949236-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802000405.949236-1-dakr@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Tue, Aug 02, 2022 at 02:04:00AM +0200, Danilo Krummrich wrote:
> This patch series renames all CMA helpers to DMA helpers - considering the
> hierarchy of APIs (mm/cma -> dma -> gem/fb dma helpers) calling them DMA
> helpers seems to be more applicable.
> 
> Additionally, commit e57924d4ae80 ("drm/doc: Task to rename CMA helpers")
> requests to rename the CMA helpers and implies that people seem to be confused
> about the naming.
> 
> The patches are compile-time tested building a x86_64 kernel with
> `make allyesconfig && make drivers/gpu/drm`.

For good measure I build tested each patch on my setup - which covers a
few more archs (cross compiled).
There was a few checkpatch warnings when applying, which I happily ignored.
Most/all are existing flaws where you do other edits in the relevant
line.

I consider the series ready to be applied to drm-misc, but have not done
so myself.
I have pinged Daniel Vetter on irc - as he was the one suggesting the
task from the very beginning.

	Sam
