Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F404A76D5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD1510E41D;
	Wed,  2 Feb 2022 17:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1E710E3AC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 17:27:36 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 8c6558ae-844d-11ec-ac19-0050568cd888;
 Wed, 02 Feb 2022 17:28:34 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BB95A194B6F;
 Wed,  2 Feb 2022 18:27:27 +0100 (CET)
Date: Wed, 2 Feb 2022 18:27:25 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: fbmem: Fix the implicit type casting
Message-ID: <Yfq+/dVOgDVbhjRJ@ravnborg.org>
References: <20220131065719.1552958-1-yzhai003@ucr.edu>
 <b1c1f68d-4620-2429-66bd-33d806d31457@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1c1f68d-4620-2429-66bd-33d806d31457@gmx.de>
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
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Yizhuo Zhai <yzhai003@ucr.edu>, dri-devel@lists.freedesktop.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Tue, Feb 01, 2022 at 04:02:40PM +0100, Helge Deller wrote:
> On 1/31/22 07:57, Yizhuo Zhai wrote:
> > In function do_fb_ioctl(), the "arg" is the type of unsigned long,
> 
> yes, because it comes from the ioctl framework...
> 
> > and in "case FBIOBLANK:" this argument is casted into an int before
> > passig to fb_blank().
> 
> which makes sense IMHO.
> 
> > In fb_blank(), the comparision if (blank > FB_BLANK_POWERDOWN) would
> > be bypass if the original "arg" is a large number, which is possible
> > because it comes from the user input.
> 
> The main problem I see with your patch is that you change the behaviour.
> Let's assume someone passes in -1UL.
> With your patch applied, this means the -1 (which is e.g. 0xffffffff on 32bit)
> is converted to a positive integer and will be capped to FB_BLANK_POWERDOWN.
> Since most blank functions just check and react on specific values, you changed
> the behaviour that the screen now gets blanked at -1, while it wasn't before.
> 
> One could now argue, that it's undefined behaviour if people
> pass in wrong values, but anyway, it's different now.

We should just plug this hole and in case an illegal value is passed
then return -EINVAL.

Acceptable values are FB_BLANK_UNBLANK..FB_BLANK_POWERDOWN,
anything less than or greater than should result in -EINVAL.

We miss this kind or early checks in many places, and we see the effect
of this in some drivers where they do it locally for no good.

	Sam
