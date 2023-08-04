Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83345770549
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0265D10E730;
	Fri,  4 Aug 2023 15:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F7D10E72C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:52:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C24812E4;
 Fri,  4 Aug 2023 17:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691164299;
 bh=lFrTIpehaqnj0HX1LVNTkkPASYHWt+esFmM23BmyPoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bUCsOnC0ipVnAIqzRJlorPEPbHHhHmniYj5imefEFCoHnu7VNukYXZdy+8V7Y0Smm
 oOkmgQ72qtx1xjwMXDIT6QDM15b5SaVCBEiyiou+UE/SKc+j2zgGPOJxpVV7GCfAAK
 VlMleoxgY5LKJoFAYnHhPeTWhMe5G2jurbW1OxcA=
Date: Fri, 4 Aug 2023 18:52:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: Re: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
Message-ID: <20230804155249.GJ12951@pendragon.ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
 <20230803234703.GJ9722@pendragon.ideasonboard.com>
 <20230803235315.GL9722@pendragon.ideasonboard.com>
 <20230804000615.GN9722@pendragon.ideasonboard.com>
 <bf2001af-00f2-3a1e-8b79-5747e6607a12@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf2001af-00f2-3a1e-8b79-5747e6607a12@igel.co.jp>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 kieran.bingham+renesas@ideasonboard.com, taki@igel.co.jp,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Damian,

(CC'ing Tomi)

On Fri, Aug 04, 2023 at 11:49:32AM -0400, Damian Hobson-Garcia wrote:
> On 2023/08/03 20:06, Laurent Pinchart wrote:
> > On Fri, Aug 04, 2023 at 02:53:17AM +0300, Laurent Pinchart wrote:
> >> On Fri, Aug 04, 2023 at 02:47:04AM +0300, Laurent Pinchart wrote:
> >>> Hi Damian,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
> >>>> Add additional pixel formats for which blending is disabling when
> >>> Did you mean "disabled" instead of "disabling" ?
> 
> Oops.  Yes, that's exactly what I meant.
> 
> >>>
> >>>> DRM_MODE_BLEND_PIXEL_NONE is set.
> >>>>
> >>>> Refactor the fourcc selection into a separate function to handle the
> >>>> increased number of formats.
> >>>>
> >>>> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
> >>>> ---
> >>>>   drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
> >>>>   1 file changed, 32 insertions(+), 17 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> >>>> index 45c05d0ffc70..96241c03b60f 100644
> >>>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> >>>> @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
> >>>>   	DRM_FORMAT_Y212,
> >>>>   };
> >>>>   
> >>>> +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
> >>>> +{
> >>>> +	u32 fourcc = state->format->fourcc;
> >>>> +
> >>>> +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> >>>> +		switch (fourcc) {
> >>>> +		case DRM_FORMAT_ARGB1555:
> >>>> +			fourcc = DRM_FORMAT_XRGB1555;
> >>>> +			break;
> >>>> +
> >>>> +		case DRM_FORMAT_ARGB4444:
> >>>> +			fourcc = DRM_FORMAT_XRGB4444;
> >>>> +			break;
> >>>> +
> >>>> +		case DRM_FORMAT_ARGB8888:
> >>>> +			fourcc = DRM_FORMAT_XRGB8888;
> >>>> +			break;
> >>>> +
> >>>> +		case DRM_FORMAT_BGRA8888:
> >>>> +			fourcc = DRM_FORMAT_BGRX8888;
> >>>> +			break;
> >>>> +
> >>>> +		case DRM_FORMAT_RGBA1010102:
> >>>> +			fourcc = DRM_FORMAT_RGBX1010102;
> >>>> +			break;
> >>> Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
> >>> intentionally ?
> 
> Yes, it was intentionally left out for the time being for the
> reason that you noted (i.e. DRM_FORMAT_XRGB2101010 not
> being handled by the DU driver).
> 
> >> It looks like DRM_FORMAT_ARGB2101010 will require a bit more work, as
> >> DRM_FORMAT_XRGB2101010 is not handled by the DU driver at the moment.
> >> Let's do so with a patch on top of this series.
> Yes, I was thinking the same thing.
> > Replying to myself again, the datasheet doesn't explicitly list
> > DRM_FORMAT_XRGB2101010 as supported, but the generic mechanism to
> > specify the location of the components should work fine for that format.
> > Is this something you would be able to test ?
> 
> Unfortunately I don't have a Gen 4 system on hand to test the 2-10-10-10 
> formats with.
> I will double-check with the office in Japan, but I don't think that 
> they have one either.

Tomi, is this something you could test ?

> >> There's no need to send
> >> a v2, I can handle the simple change in the commit message if you let me
> >> know whether my comment is right or wrong.

-- 
Regards,

Laurent Pinchart
