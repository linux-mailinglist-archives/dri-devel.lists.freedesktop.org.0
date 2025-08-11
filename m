Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4AB2073B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 13:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADA810E447;
	Mon, 11 Aug 2025 11:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wLTFxJ4l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B85D10E446;
 Mon, 11 Aug 2025 11:16:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 503A882A;
 Mon, 11 Aug 2025 13:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754910911;
 bh=qZKSfx7lKS5o8A/i/O0jJ194e5b90E76li/qjrSBjwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wLTFxJ4l4/be02dukk9caxg38DsmT1fJe9X69ePV0pEMOsiwwZf8wvsVD2r7u8bRf
 r40fkfnyO322t0/phGW1K6mbN8weXPAI5+R8JibrzG3rt8ClsGhv81a7gJPprc31Kw
 FgTe+VBl1jyq23wOp9iGn0pmr3QC1Vh1TX2AcyGQ=
Date: Mon, 11 Aug 2025 14:15:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, kernel-list@raspberrypi.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev,
 tzimmermann@suse.de, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <20250811111546.GA30760@pendragon.ideasonboard.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
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

On Mon, Aug 11, 2025 at 01:22:30PM +0300, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 12:44:29PM +0300, Laurent Pinchart wrote:
> > On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> > > Some drivers cannot work with the current design where the connector
> > > is embedded within the drm_writeback_connector such as intel and
> > > some drivers that can get it working end up adding a lot of checks
> > > all around the code to check if it's a writeback conenctor or not.
> > > To solve this we move the drm_writeback_connector within the
> > > drm_connector and remove the drm_connector base which was in
> > > drm_writeback_connector. We do all other required
> > > modifications that come with these changes along with addition
> > > of new function which returns the drm_connector when
> > > drm_writeback_connector is present.
> > > All drivers will be expected to allocate the drm_connector.
> > > 
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
> > >  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
> > >  include/drm/drm_writeback.h     | 68 ++++-----------------------------
> > >  3 files changed, 89 insertions(+), 72 deletions(-)
> > > 
> > > @@ -2305,6 +2360,11 @@ struct drm_connector {
> > >  	 * @cec: CEC-related data.
> > >  	 */
> > >  	struct drm_connector_cec cec;
> > > +
> > > +	/**
> > > +	 * @writeback: Writeback related valriables.
> > > +	 */
> > > +	struct drm_writeback_connector writeback;
> > 
> > No, sorry, that's a bad idea. Most connectors have nothing to do with
> > writeback, you shouldn't introduce writeback-specific fields here.
> > drm_writeback_connector happens to be a drm_connector because of
> > historical reasons (it was decided to reuse the connector API exposed to
> > userspace instead of exposing a completely separate API in order to
> > simplify the implementation), but that does not mean that every
> > connector is related to writeback.
> > 
> > I don't know what issues the Intel driver(s) have with
> > drm_writeback_connector, but you shouldn't make things worse for
> > everybody due to a driver problem.
> 
> Suraj is trying to solve a problem that in Intel code every drm_connector
> must be an intel_connector too. His previous attempt resulted in a loose
> abstraction where drm_writeback_connector.base wasn't initialized in
> some cases (which is a bad idea IMO).
> 
> I know the historical reasons for drm_writeback_connector, but I think
> we can do better now.
> 
> So, I think, a proper approach would be:
> 
> struct drm_connector {
>     // other fields
> 
>     union {
>         struct drm_connector_hdmi hdmi; // we already have it
>         struct drm_connector_wb wb;  // this is new
>     };
> 
>     // rest of the fields.
> };

I still don't like that. This really doesn't belong here. If anything,
the drm_connector for writeback belongs to drm_crtc.

If the issue is that some drivers need a custom drm_connector subclass,
then I'd rather turn the connector field of drm_writeback_connector into
a pointer.

> I plan to add drm_connector_dp in a similar way, covering DP needs
> (currently WIP).

-- 
Regards,

Laurent Pinchart
