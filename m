Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5924AA03A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7325010E58C;
	Fri,  4 Feb 2022 19:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5D710E58C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 19:39:07 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 41731055-85f2-11ec-b20b-0050568c148b;
 Fri, 04 Feb 2022 19:40:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 17211194B8B;
 Fri,  4 Feb 2022 20:39:03 +0100 (CET)
Date: Fri, 4 Feb 2022 20:39:00 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 14/21] fbcon: use lock_fb_info in fbcon_open/release
Message-ID: <Yf2A1GN0Mg9aotUY@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-15-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-15-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Claudio Suarez <cssk@net-c.es>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:05:45PM +0100, Daniel Vetter wrote:
> Now we get to the real motiviation, because fbmem.c insists that
> that's the right lock for these.
> 
> Ofc fbcon.c has a lot more places where it probably should call
> lock_fb_info(). But looking at fbmem.c at least most of these seem to
> be protected by console_lock() too, which is probably what papers over
> any issues.
> 
> Note that this means we're shuffling around a bit the locking sections
> for some of the console takeover and unbind paths, but not all:
> - console binding/unbinding from the console layer never with
> lock_fb_info
> - unbind (as opposed to unlink) never bother with lock_fb_info
> 
> Also the real serialization against set_par and set_pan are still
> doing by wrapping the entire ioctl code in console_lock(). So this
> shuffling shouldn't be worse than what we had from a "can you trigger
> races?" pov, but it's at least clearer.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Claudio Suarez <cssk@net-c.es>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Du Cheng <ducheng2@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: William Kucharski <william.kucharski@oracle.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Zheyu Ma <zheyuma97@gmail.com>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>

Well, the patch does what the commit log says.
Acked-by: Sam Ravnborg <sam@ravnborg.org>
