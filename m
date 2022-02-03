Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5B4A8FDC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 22:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A83A10E2F8;
	Thu,  3 Feb 2022 21:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CBA10EC82
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 21:27:36 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 3e0f2c91-8538-11ec-ac19-0050568cd888;
 Thu, 03 Feb 2022 21:28:34 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 42F4D194B78;
 Thu,  3 Feb 2022 22:27:34 +0100 (CET)
Date: Thu, 3 Feb 2022 22:27:31 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 07/21] fbdev/sysfs: Fix locking
Message-ID: <YfxIw83tbU4lrpKj@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-8-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Qing Wang <wangqing@vivo.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:05:38PM +0100, Daniel Vetter wrote:
> fb_set_var requires we hold the fb_info lock. Or at least this now
> matches what the ioctl does ...
> 
> Note that ps3fb and sh_mobile_lcdcfb are busted in different ways here,
> but I will not fix them up.
> 
> Also in practice this isn't a big deal, because really variable fbdev
> state is actually protected by console_lock (because fbcon just
> doesn't bother with lock_fb_info() at all), and lock_fb_info
> protecting anything is really just a neat lie. But that's a much
> bigger fish to fry.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Qing Wang <wangqing@vivo.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
