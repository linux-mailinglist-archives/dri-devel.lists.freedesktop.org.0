Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E86AA76FA
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 18:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE3810E0D0;
	Fri,  2 May 2025 16:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gQP/z2vY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555BC10E0D0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 16:17:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96E0FAF;
 Fri,  2 May 2025 18:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1746202618;
 bh=n6+2xUCCX3MfUNwyYOoeQx+IBsfLD9OrCui0qPfrvS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gQP/z2vYd8X+wMfXmvSwiuJ2RR9a4zuErRnToO5ddjNByOAX21VJPnioV+2TVf3Kr
 C3L/02QgiGlFKJYgF9IgWHoaAFIz+ByXjBDqjL0rEd+mcfaMccE1CrZwowQ75MOpes
 ajCgxTxjA3yn5oHN8K2TFhJ3b/5k//T/hB6HfgSc=
Date: Fri, 2 May 2025 19:16:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 0/9] media: renesas: vsp1: Add colorspace support
Message-ID: <20250502161657.GD15945@pendragon.ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
 <aBSAgR15PoPVS9Ic@tom-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aBSAgR15PoPVS9Ic@tom-desktop>
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

Hi Tommaso,

On Fri, May 02, 2025 at 10:21:21AM +0200, Tommaso Merciai wrote:
> On Wed, Apr 30, 2025 at 02:28:55AM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series extends the VSP1 driver with colorspace support. It
> > turns out that the VSP RPF and WPF entities can convert between RGB and
> > YUV, a feature that we have failed to test so far. The hardware support
> > BT.601 and BT.709, in both limited and full range. Proper configuration
> > of colorspace is crucial for accurate image rendering.
> > 
> > Patch 1/9 starts by implementing pixel format enumeration in the driver,
> > a feature that was surprisingly missing. Patch 2/9 then continues with
> > another fix, restricting the creation of the HSI and HST entities to VSP
> > instances that include them. Following with another fix, patch 4/9
> > addresses format setting on the RPF and WPF source pad to disable HSV
> > <-> { RGB, YUV } conversion, a feature *not* supported by the hardware.
> > 
> > After those initial fixes, patch 5/9 starts implementing colorspace
> > support by reporting the related information to userspace. The driver
> > currently hardcodes limited range BT.601 when programming the hardware,
> > so that is the value that the patch reports to userspace for YUV
> > formats. Patch 6/9 makes the YCbCr encoding and quantization
> > configurable, finalizing colorspace support in the VSP driver.
> > 
> > The next three patches are new in this version. They proceed with
> > exposing colorspace configurability in the API exposed to the DU DRM
> > driver in patch 8/9 (with 7/9 performing a small refactoring first).
> > Patch 9/9 then updates the DU driver accordingly, to create plane
> > colorspace properties and wire them up to the VSP.
> > 
> > The series has been tested with the vsp-tests suite and the kms-tests
> > suite. Patches that add CSC support to the vsp-tests suite have been
> > posted in [1], and can be found in the vsp-tests git tree in [2].
> 
> I've tested this series with out of Tree patches with RZ/G3E.
> Basically I've added the equivalent of:
> 
>  - drm: rcar-du: Create plane color properties
> 
> On drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> 
> Tested using modetest:
> 
> modetest -M rzg2l-du -s 48@46:800x600-60.32@YU16 -d -P 39@46:512x300+200+200@YU16
> 
> modetest -M rzg2l-du -w 32:COLOR_ENCODING:0
> modetest -M rzg2l-du -w 32:COLOR_ENCODING:1
> 
> modetest -M rzg2l-du -w 32:COLOR_RANGE:0
> modetest -M rzg2l-du -w 32:COLOR_RANGE:1
> 
> Where 32 is the id of the primary plane.
> 
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thank you for confirming this works on RZ. Unfortunately your Tested-by
tag came after I submitted the pull request, and the patches got merged
without it. It however gives me confidence that the code is working as
intended.

> > Updates to media-ctl and yavta to support setting colorspace on video
> > capture devices and on subdev source pads have been merged in the
> > respective projects, make sure to use the latest master branch if you
> > want to run the tests.
> > 
> > The series has also been tested with the latest v4l2-compliance. The bad
> > news is that the test flags 56 errors when run on a Renesas Salvator-X
> > 2nd version board based on r8a77965:
> > 
> > Grand Total for vsp1 device /dev/media1: 757, Succeeded: 701, Failed: 56, Warnings: 0
> > 
> > The good news is that none of those are regressions, quite the contrary:
> > without this series applied, the total number of failures is 95, and the
> > diff shows no new error. I will therefore address those issues
> > separately.
> > 
> > I would like to get patch 1/9 to 8/9 merged in v6.16, to then merge 9/9
> > in v6.17.
> > 
> > [1] https://lore.kernel.org/linux-renesas-soc/20250409004758.11014-1-laurent.pinchart@ideasonboard.com
> > [2] https://git.ideasonboard.com/renesas/vsp-tests.git/log/?h=csc
> > 
> > Laurent Pinchart (9):
> >   media: renesas: vsp1: Implement pixel format enumeration
> >   media: renesas: vsp1: Make HSI and HST modules optional
> >   media: renesas: vsp1: Fix HSV format enumeration
> >   media: renesas: vsp1: Fix media bus code setup on RWPF source pad
> >   media: renesas: vsp1: Report colour space information to userspace
> >   media: renesas: vsp1: Allow setting encoding and quantization
> >   media: renesas: vsp1: Name nested structure in vsp1_drm
> >   media: renesas: vsp1: Expose color space through the DRM API
> >   drm: rcar-du: Create plane color properties
> > 
> >  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c |  15 ++
> >  drivers/media/platform/renesas/vsp1/vsp1.h    |   1 +
> >  .../media/platform/renesas/vsp1/vsp1_brx.c    |   9 +-
> >  .../media/platform/renesas/vsp1/vsp1_drm.c    |  22 +-
> >  .../media/platform/renesas/vsp1/vsp1_drm.h    |   8 +-
> >  .../media/platform/renesas/vsp1/vsp1_drv.c    |  59 +++---
> >  .../media/platform/renesas/vsp1/vsp1_entity.c |  22 +-
> >  .../media/platform/renesas/vsp1/vsp1_entity.h |   2 +
> >  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  11 +-
> >  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 188 ++++++++++++++++--
> >  .../media/platform/renesas/vsp1/vsp1_pipe.h   |   5 +
> >  .../media/platform/renesas/vsp1/vsp1_rpf.c    |  29 ++-
> >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  51 ++++-
> >  .../media/platform/renesas/vsp1/vsp1_sru.c    |   9 +-
> >  .../media/platform/renesas/vsp1/vsp1_uds.c    |   9 +-
> >  .../media/platform/renesas/vsp1/vsp1_video.c  |  50 ++++-
> >  .../media/platform/renesas/vsp1/vsp1_wpf.c    |  29 ++-
> >  include/media/vsp1.h                          |   4 +
> >  18 files changed, 442 insertions(+), 81 deletions(-)
> > 
> > 
> > base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
> > prerequisite-patch-id: e3d9847d1da4398f1bf0b57f5ef4a612392c7255

-- 
Regards,

Laurent Pinchart
