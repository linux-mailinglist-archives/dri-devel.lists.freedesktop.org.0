Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99FF4C1D1B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 21:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6693D10E70E;
	Wed, 23 Feb 2022 20:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6290110E70E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 20:25:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id d5340349-94e6-11ec-b2df-0050568cd888;
 Wed, 23 Feb 2022 20:26:08 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E7A57194B37;
 Wed, 23 Feb 2022 21:25:51 +0100 (CET)
Date: Wed, 23 Feb 2022 21:25:45 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 4/5] fbdev: Improve performance of cfb_imageblit()
Message-ID: <YhaYSeyYIwqur2hy@ravnborg.org>
References: <20220223193804.18636-1-tzimmermann@suse.de>
 <20220223193804.18636-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223193804.18636-5-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 08:38:03PM +0100, Thomas Zimmermann wrote:
> Improve the performance of cfb_imageblit() by manually unrolling
> the inner blitting loop and moving some invariants out. The compiler
> failed to do this automatically. This change keeps cfb_imageblit()
> in sync with sys_imagebit().
> 
> A microbenchmark measures the average number of CPU cycles
> for cfb_imageblit() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging).
> 
> cfb_imageblit(), new: 15724 cycles
> cfb_imageblit(): old: 30566 cycles
> 
> In the optimized case, cfb_imageblit() is now ~2x faster than before.
> 
> v3:
> 	* fix commit description (Pekka)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

The code looks equally complicated now in the sys and cfb variants.

Question: What is cfb an abbreviation for anyway?
Not related to the patch - but if I have known the memory is lost..

	Sam
