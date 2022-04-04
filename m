Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39544F126B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 11:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072910EC45;
	Mon,  4 Apr 2022 09:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1678 seconds by postgrey-1.36 at gabe;
 Mon, 04 Apr 2022 09:55:01 UTC
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
 [211.29.132.249])
 by gabe.freedesktop.org (Postfix) with ESMTP id B150010EBF6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 09:55:01 +0000 (UTC)
Received: from dread.disaster.area (pa49-180-43-123.pa.nsw.optusnet.com.au
 [49.180.43.123])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 29B8410E55FB;
 Mon,  4 Apr 2022 19:26:57 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nbIz9-00Dc5C-Sq; Mon, 04 Apr 2022 19:26:55 +1000
Date: Mon, 4 Apr 2022 19:26:55 +1000
From: Dave Chinner <david@fromorbit.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.18-rc1
Message-ID: <20220404092655.GR1544202@dread.disaster.area>
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=624ab9e5
 a=MV6E7+DvwtTitA3W+3A2Lw==:117 a=MV6E7+DvwtTitA3W+3A2Lw==:17
 a=kj9zAlcOel0A:10 a=z0gMJWrwH1QA:10 a=6Fu7hv2xAAAA:8 a=7-415B0cAAAA:8
 a=L05BbbQJD6-TbP0LrSsA:9 a=CjuIK1q_8ugA:10 a=OCr_TKDY-yBPQKLGgHr3:22
 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 04, 2022 at 10:16:08AM +0200, Geert Uytterhoeven wrote:
> On Mon, 4 Apr 2022, Geert Uytterhoeven wrote:
> > Below is the list of build error/warning regressions/improvements in
> > v5.18-rc1[1] compared to v5.17[2].
> > 
> > Summarized:
> >  - build errors: +36/-15
> >  - build warnings: +5/-38
> > 
> > Happy fixing! ;-)

Well....

> >  + /kisskb/src/fs/xfs/xfs_buf.h: error: initializer element is not constant:  => 46:23

Looking at:

http://kisskb.ellerman.id.au/kisskb/buildresult/14714961/

The build error is:

/kisskb/src/fs/xfs/./xfs_trace.h:432:2: note: in expansion of macro 'TP_printk'
  TP_printk("dev %d:%d daddr 0x%llx bbcount 0x%x hold %d pincount %d "
  ^
/kisskb/src/fs/xfs/./xfs_trace.h:440:5: note: in expansion of macro '__print_flags'
     __print_flags(__entry->flags, "|", XFS_BUF_FLAGS),
     ^
/kisskb/src/fs/xfs/xfs_buf.h:67:4: note: in expansion of macro 'XBF_UNMAPPED'
  { XBF_UNMAPPED,  "UNMAPPED" }
    ^
/kisskb/src/fs/xfs/./xfs_trace.h:440:40: note: in expansion of macro 'XFS_BUF_FLAGS'
     __print_flags(__entry->flags, "|", XFS_BUF_FLAGS),
                                        ^
/kisskb/src/fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfs_buf_flags_class':
/kisskb/src/fs/xfs/xfs_buf.h:46:23: error: initializer element is not constant
 #define XBF_UNMAPPED  (1 << 31)/* do not map the buffer */

This doesn't make a whole lotta sense to me. It's blown up in a
tracepoint macro in XFS that was not changed at all in 5.18-rc1, nor
was any of the surrounding XFS code or contexts.  Perhaps something
outside XFS changed to cause this on these platforms?

Can you bisect this, please?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
