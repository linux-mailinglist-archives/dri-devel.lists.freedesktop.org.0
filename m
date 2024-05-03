Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB68BACF4
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 15:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFA310FDA6;
	Fri,  3 May 2024 13:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EC11127BF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 13:02:04 +0000 (UTC)
Received: from i53875b01.versanet.de ([83.135.91.1] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s2sY6-0000wj-1A; Fri, 03 May 2024 15:02:02 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 2/2] drm/rockchip: vop2: configure layers for vp3 on rk3588
Date: Fri, 03 May 2024 15:02:01 +0200
Message-ID: <9626238.rMLUfLXkoz@diego>
In-Reply-To: <062d86ab-1518-4160-870c-3cd36228d055@cherry.de>
References: <20240425195506.2935955-1-heiko@sntech.de>
 <20240425195506.2935955-3-heiko@sntech.de>
 <062d86ab-1518-4160-870c-3cd36228d055@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Freitag, 3. Mai 2024, 14:57:03 CEST schrieb Quentin Schulz:
> Hi Heiko,
> 
> On 4/25/24 9:55 PM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > The rk3588 VOP2 has 4 video-ports, yet the driver currently only
> > configures the first 3, as used on the rk3568.
> > 
> 
> I'm wondering whether we should update the drawing at the top of the 
> driver then?
> 
> > Add another block to configure the vp3 as well, if applicable.
> > 
> > Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
> >   drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
> >   2 files changed, 13 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > index 523880a4e8e74..1a327a9ed7ee4 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -2303,6 +2303,7 @@ static void vop2_setup_alpha(struct vop2_video_port *vp)
> >   static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
> >   {
> >   	struct vop2 *vop2 = vp->vop2;
> > +	const struct vop2_data *vop2_data = vop2->data;
> >   	struct drm_plane *plane;
> >   	u32 layer_sel = 0;
> >   	u32 port_sel;
> > @@ -2344,6 +2345,17 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
> >   	else
> >   		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX, 8);
> >   
> > +	/* configure vp3 */
> > +	if (vop2_data->soc_id == 3588) {
> 
> I think it'd be smarter to check against vop2->data->nr_vps >= 4; so 
> that we don't need to maintain a list of SoCs that support a specific 
> number of video ports.

probably ;-)

> 
> > +		struct vop2_video_port *vp3 = &vop2->vps[3];
> 
> This is always possible because vps is statically allocated for 4 items, 
> c.f. struct vop2_video_port vps[ROCKCHIP_MAX_CRTC]; so we don't 
> necessarily need it in this specific location and can group it with the 
> others. Cosmetic suggestion though.
> 
> Otherwise, the change itself makes sense to me, so:
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

though comments from Andy from Rockchip in another thread suggest that
this is not necessary at all, as the "last" vp somehow has a hardware lock
to take the remaining layers or so.

And while tracking down dsi issues I had a "binary" state of
"gray display" without this patch and working DSI with it, in the last days
I haven't been able to reproduce this anymore.

So I guess I'll fix up the first patch according to your comment and keep
this change here for later.


Heiko


