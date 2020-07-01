Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ED6210465
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE1D6E5D5;
	Wed,  1 Jul 2020 07:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880DC6E3D0;
 Wed,  1 Jul 2020 07:01:06 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0328480549;
 Wed,  1 Jul 2020 09:01:03 +0200 (CEST)
Date: Wed, 1 Jul 2020 09:01:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: Re: [PATCH 00/59] Add support for Keem Bay DRM driver
Message-ID: <20200701070102.GA1494555@ravnborg.org>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=jI2zVFFQ7FhuZ9nkOqYA:9 a=FLVDQ4wIpBK0nb2X:21
 a=aD_O1mNEXz4SOdM6:21 a=CjuIK1q_8ugA:10
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
Cc: intel-gfx@lists.freedesktop.org, edmund.j.dea@intel.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 daniel.vetter@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anitha.

On Tue, Jun 30, 2020 at 02:27:12PM -0700, Anitha Chrisanthus wrote:
> This is a new DRM driver for Intel's KeemBay SOC.
> The SoC couples an ARM Cortex A53 CPU with an Intel
> Movidius VPU.
...
Nice and informative intro - thanks.

The patchset looks more like a dump of current state and less like a
logical set of changes - as the few I looked at changed code introduced
in earlier patches.
So I ended up applying all patches to a local branch.
Very good to post an WIP version so you can capture some early
feedback.
It is never fun to think something is finished and then address a lot of
feedback.


Some general remarks after reading/browsing some of the code:
- Embeds drm_device - good
- Uses SPDX, good. But includes also a license text. Can we
  get rid of the redundandt license text?
- Some of the inline functions in kmb_drv.h is too large
  (kmb_write_bits_mipi())
- There is stray code commented out using "//" here and there - shall be
  dropped.
- Please arrange include files in blocks:
#include <linux/...>

#include <video/...>

#include <drm/...>

#include "kmb_*"

Within each block sort alphabetially.

- Use a kmb_ prefix or similar for global variables - like under_flow
- no extern in .c files - plane_status
- Consider using an array for the clk's
- In general use drm_info(), drm_err() for logging.
  Yes, you will need to pass kmb_drm_private around to do so
- Do not use drm_device->dev_private, it is deprecated. Use upclassing
- kmb_driver can be slimmed a lot. See what recent drivers uses. There is
  some nice defines so it is obvious what is not standard.
  DRIVER_HAVE_IRQ is not relevant btw.
- Start using drmm_* support. The way kmb_drm_private is allocated
  is sub-optimal

The above was my fist drive-by comments - but do not be discouraged.
For the most part they should be easy to address.
Looking forward for other feedback and for v2.

Let me know if the above triggers any questions.

> +--------------+    +---------+    +-----------------------+
> |LCD controller| -> |Mipi DSI | -> |Mipi to HDMI Converter |
> +--------------+    +---------+    +-----------------------+

Question to dri-devel people:
Would the Mipi DSI be better represented outside the display driver?
If yes, how?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
