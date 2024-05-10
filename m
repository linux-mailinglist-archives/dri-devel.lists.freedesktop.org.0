Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159F8C277E
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3345710ED4F;
	Fri, 10 May 2024 15:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nXNRXI+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6618110ED4F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:16:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E8083D5;
 Fri, 10 May 2024 17:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715354206;
 bh=j5U02hjASsINAaYItIarcZkmxJVACMCoVQyAxb1d4YM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nXNRXI+/cEEbdhU/LxaMwVEoVFGICuenZ9oKzJ4Pvw+4Rn9vTPy48wsxJX5oaXsZo
 w5eqhuDoHDehHp7iDKWM5Xjv15q+WA2DDWr95lpQMzWXyKfTxEAm+oCmYQq3FBVXGM
 i+p2lMs53bhqlhIXnc56sLbqmR8fTqZDnSq2b9yI=
Date: Fri, 10 May 2024 18:16:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com, jani.nikula@intel.com
Subject: Re: [PATCH v7 8/8] gpu: ipu-v3: Use generic macro for rounding to
 nearest multiple
Message-ID: <20240510151642.GA17158@pendragon.ideasonboard.com>
References: <20240509184010.4065359-1-devarsht@ti.com>
 <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
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

On Fri, May 10, 2024 at 06:03:52PM +0300, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 12:10:10AM +0530, Devarsh Thakkar wrote:
> > Use generic macro round_closest_up for rounding to nearest multiple instead
> 
> round_closest_up()
> 
> We refer to the functions as func().
> 
> > of using local function.
> 
> ...
> 
> > @@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
> >  		 * The closest input sample position that we could actually
> >  		 * start the input tile at, 19.13 fixed point.
> >  		 */
> > -		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
> > +		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
> >  		/* Convert 19.13 fixed point to integer */
> >  		in_pos_rounded = in_pos_aligned / 8192U;
> 
> Oh, these seems to be better to use either ALIGN*(), or PFN_*() / PAGE_*()
> families of macros. What the semantic of 8192 is?

The comment mentions 19.13 fixed point, so I assume that's the
fractional part of the integer. It doesn't seem related to pages.

-- 
Regards,

Laurent Pinchart
