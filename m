Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6355A3B6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9C10F518;
	Fri, 24 Jun 2022 21:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A8D10F518
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:37:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06642575;
 Fri, 24 Jun 2022 23:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1656106661;
 bh=x/2F7wnnx9++HURFgjwgfwtKcJIps+u4eDRx97GPze0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FktPHgHF3x9VZTv7zmTHLU8yCbFcOGDwe4wEi0fHFCQUQATV7iYr3INsRC04oAe2n
 sSed6OBwE5rNl3b4t4N1Cgu/YitNrCpHqH28NdTfvn9E/h78nwTsNFUQJoGXDSZ34r
 vnsXFGoLXsfHXphWYLyOH5BEW4YZzky72pxmND0s=
Date: Sat, 25 Jun 2022 00:37:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/fourcc: Add formats for packed YUV 4:4:4 AVUY and
 XVUY permutations
Message-ID: <YrYukw1Z/RjWk/Zv@pendragon.ideasonboard.com>
References: <20220616185210.22018-1-laurent.pinchart@ideasonboard.com>
 <YrYpvmInnq5Muahz@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrYpvmInnq5Muahz@phenom.ffwll.local>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Fri, Jun 24, 2022 at 11:16:46PM +0200, Daniel Vetter wrote:
> On Thu, Jun 16, 2022 at 09:52:10PM +0300, Laurent Pinchart wrote:
> > Add FourCCs for two missing permutations of the packed YUV 4:4:4 color
> 
> For a second I thought this 4:4:4 is the bit packing, but it's the 444
> sampling rate thing.
> 
> Man formats are confusing.

:-)

> > components, namely AVUY and XVUY.
> > 
> > These formats are needed by the NXP i.MX8 ISI. While the ISI is
> > supported by a V4L2 device (corresponding formats have been submitted to
> > V4L2), it is handled in userspace by libcamera, which uses DRM FourCCs
> > for pixel formats.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index f1972154a594..399d950c53e3 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -205,7 +205,9 @@ extern "C" {
> 
> I build script to make sure we don't accidentally assign duplicated codes
> would be nice, this is pain to check.

Do you mean something like

cat include/uapi/drm/drm_fourcc.h | \
	grep '#define DRM_FORMAT_.*fourcc_code' | \
	sed 's/.*fourcc_code(\([^)]*\)).*/\1/' | \
	sort | \
	uniq -c | \
	grep -qv '^ \+1 ' && echo "Duplicate 4CC !!"

?

Where could this live ?

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> >  #define DRM_FORMAT_VYUY		fourcc_code('V', 'Y', 'U', 'Y') /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
> >  
> >  #define DRM_FORMAT_AYUV		fourcc_code('A', 'Y', 'U', 'V') /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
> > +#define DRM_FORMAT_AVUY8888	fourcc_code('A', 'V', 'U', 'Y') /* [31:0] A:Cr:Cb:Y 8:8:8:8 little endian */
> >  #define DRM_FORMAT_XYUV8888	fourcc_code('X', 'Y', 'U', 'V') /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
> > +#define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
> >  #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
> >  #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */

-- 
Regards,

Laurent Pinchart
