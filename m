Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC101E9A61
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 22:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D7F89D99;
	Sun, 31 May 2020 20:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9372A89D99
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 20:58:23 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C79CB80518;
 Sun, 31 May 2020 22:58:20 +0200 (CEST)
Date: Sun, 31 May 2020 22:58:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 0/2] video: fbdev: fix error handling, convert to
 pin_user_pages*()
Message-ID: <20200531205819.GC138722@ravnborg.org>
References: <20200522041506.39638-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522041506.39638-1-jhubbard@nvidia.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8 a=_Wotqz80AAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=0vaWVN_RBqfUHpfuwWIA:9
 a=CjuIK1q_8ugA:10 a=buJP51TR1BpY-zbLSsyS:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John.
On Thu, May 21, 2020 at 09:15:04PM -0700, John Hubbard wrote:
> Hi,
> 
> Note that I have only compile-tested this series, although that does
> also include cross-compiling for a few other arches. I'm hoping that
> this posting will lead to some run-time testing.
> 
> Also: the proposed fix does not have a "Fixes:" tag, nor does it
> Cc stable. That's because the issue has been there since the dawn of
> git history for the kernel. If it's gone unnoticed this long, then
> there is clearly no need for the relatively fast track of putting it
> into stable, IMHO. But please correct me if that's wrong.
> 
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

Thanks, patches are now applied to drm-misc-next.
They will hit -next soon, but you will have to wait
until next (not the upcoming) merge window before they hit
mainline linux.

	Sam

> 
> John Hubbard (2):
>   video: fbdev: fix error handling for get_user_pages_fast()
>   video: fbdev: convert get_user_pages() --> pin_user_pages()
> 
>  drivers/video/fbdev/pvr2fb.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 051143e1602d90ea71887d92363edd539d411de5
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
