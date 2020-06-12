Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A61F7D00
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 20:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562E96E152;
	Fri, 12 Jun 2020 18:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492B8894D7;
 Fri, 12 Jun 2020 18:39:27 +0000 (UTC)
IronPort-SDR: bJOvGUliTa6lf3DhwDJaWfoCXiSfu2kv2V3ADhbcLrYgWH/+SvX3uHTi/GEcbjjpUlIR5BZH3B
 /iE5P3dHeW8w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 11:39:26 -0700
IronPort-SDR: nb7chWRPihvv8iJO0TU2WwuvROk8XK8gQD9IyEC6B8n5PYRnnU6ula2eWFdeME7FbYqICbQ5+F
 bl82I99X8dzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="307324617"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 12 Jun 2020 11:39:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Jun 2020 21:39:22 +0300
Date: Fri, 12 Jun 2020 21:39:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: DP PHY compliance for JSL
Message-ID: <20200612183922.GM6112@intel.com>
References: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
 <20200604190612.GI6112@intel.com>
 <fea323968324ceefe813d34d80fdd9779614aa01.camel@intel.com>
 <20200612183345.GB7458@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612183345.GB7458@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Srinivas, Vidya" <vidya.srinivas@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 11:33:45AM -0700, Manasi Navare wrote:
> On Thu, Jun 04, 2020 at 08:01:03PM +0000, Almahallawy, Khaled wrote:
> > On Thu, 2020-06-04 at 22:06 +0300, Ville Syrj=E4l=E4 wrote:
> > > On Thu, Jun 04, 2020 at 10:33:48AM +0530, Vidya Srinivas wrote:
> > > > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_dp.c | 40
> > > > ++++++++++++++++++++++++++-------
> > > >  1 file changed, 32 insertions(+), 8 deletions(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > index 7223367171d1..44663e8ac9a1 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > > @@ -5470,22 +5470,32 @@ intel_dp_autotest_phy_ddi_disable(struct
> > > > intel_dp *intel_dp)
> > > >  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> > > >  	struct intel_crtc *crtc =3D to_intel_crtc(intel_dig_port-
> > > > >base.base.crtc);
> > > >  	enum pipe pipe =3D crtc->pipe;
> > > > -	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > dp_tp_ctl_value;
> > > > +	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > dp_tp_ctl_value, trans_ddi_port_mask;
> > > > +	enum port port =3D intel_dig_port->base.port;
> > > > +	i915_reg_t dp_tp_reg;
> > > > +
> > > > +	if (IS_ELKHARTLAKE(dev_priv)) {
> > > > +		dp_tp_reg =3D DP_TP_CTL(port);
> > > > +		trans_ddi_port_mask =3D TRANS_DDI_PORT_MASK;
> > > > +	} else if (IS_TIGERLAKE(dev_priv)) {
> > > > +		dp_tp_reg =3D TGL_DP_TP_CTL(pipe);
> > > > +		trans_ddi_port_mask =3D TGL_TRANS_DDI_PORT_MASK;
> > > > +	}
> > > >  =

> > > >  	trans_ddi_func_ctl_value =3D intel_de_read(dev_priv,
> > > >  						 TRANS_DDI_FUNC_CTL(pip
> > > > e));
> > > >  	trans_conf_value =3D intel_de_read(dev_priv, PIPECONF(pipe));
> > > > -	dp_tp_ctl_value =3D intel_de_read(dev_priv, TGL_DP_TP_CTL(pipe));
> > > >  =

> > > > +	dp_tp_ctl_value =3D intel_de_read(dev_priv, dp_tp_reg);
> > > >  	trans_ddi_func_ctl_value &=3D ~(TRANS_DDI_FUNC_ENABLE |
> > > > -				      TGL_TRANS_DDI_PORT_MASK);
> > > > +					trans_ddi_port_mask);
> > > >  	trans_conf_value &=3D ~PIPECONF_ENABLE;
> > > >  	dp_tp_ctl_value &=3D ~DP_TP_CTL_ENABLE;
> > > >  =

> > > >  	intel_de_write(dev_priv, PIPECONF(pipe), trans_conf_value);
> > > >  	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(pipe),
> > > >  		       trans_ddi_func_ctl_value);
> > > > -	intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl_value);
> > > > +	intel_de_write(dev_priv, dp_tp_reg, dp_tp_ctl_value);
> > > =

> > > All this ad-hoc modeset code really should not exist. It's going to
> > > have different bugs than the norma modeset paths, so compliance
> > > testing
> > > this special code proves absolutely nothing about the normal modeset
> > > code. IMO someone needs to take up the task of rewrtiting all this to
> > > just perform normal modesets.
> =

> But isnt that behaviour of the scope against the compliance spec?

scope?

> The PHY request as per the VESA compliance spec should only come through
> a short pulse.
> Yes if it comes through a long pulse, it will reset the link and this who=
le
> code will fall apart.

I am not saying anything about how the sink signals the requests.
That's just an implementation detail that doesn't really matter.

> =

> Manasi
> =

> > =

> > Agree. I've just found that we get kernel NULL pointer dereference and
> > panic when we try to access to_intel_crtc(intel_dig_port-
> > >base.base.crtc). This is because we didn't realize when we developed
> > the code that test scope has an option to send PHY test request on Long
> > HPD. Current desing assume PHY test request on short HPD. Because of
> > that we got the following error
> > =

> > =

> > [  106.810882] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]]
> > digital hpd on [ENCODER:308:DDI F] - long
> > [  106.810916] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]]
> > Received HPD interrupt on PIN 9 - cnt: 10
> > [  106.811026] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got
> > hpd irq on [ENCODER:308:DDI F] - long
> > [  106.811095] i915 0000:00:02.0: [drm:i915_hotplug_work_func [i915]]
> > running encoder hotplug functions
> > [  106.811184] i915 0000:00:02.0: [drm:i915_hotplug_work_func [i915]]
> > Connector DP-3 (pin 9) received hotplug event. (retry 0)
> > [  106.811227] i915 0000:00:02.0: [drm:intel_dp_detect [i915]]
> > [CONNECTOR:309:DP-3]
> > [  106.811292] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]]
> > enabling TC cold off
> > [  106.811365] i915 0000:00:02.0: [drm:tgl_tc_cold_request [i915]] TC
> > cold block succeeded
> > [  106.811489] i915 0000:00:02.0: [drm:__intel_tc_port_lock [i915]]
> > Port F/TC#3: TC port mode reset (tbt-alt -> dp-alt)
> > [  106.811663] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]]
> > enabling AUX F TC3
> > [  106.812449] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00000 AUX ->
> > (ret=3D 15) 12 14 04 80 00 00 01 00 00 00 00 00 00 00 00
> > [  106.812484] i915 0000:00:02.0: [drm:intel_dp_read_dpcd [i915]] DPCD:
> > 12 14 04 80 00 00 01 00 00 00 00 00 00 00 00
> > [  106.813266] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00400 AUX ->
> > (ret=3D 12) 00 00 00 00 00 00 00 00 00 00 00 00
> > [  106.813271] [drm:drm_dp_read_desc] DP sink: OUI 00-00-00 dev-ID  HW-
> > rev 0.0 SW-rev 0.0 quirks 0x0000
> > [  106.813891] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00200 AUX ->
> > (ret=3D  1) 01
> > [  106.813940] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]]
> > source rates: 162000, 216000, 270000, 324000, 432000, 540000, 648000,
> > 810000
> > [  106.813974] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]]
> > sink rates: 162000, 270000, 540000
> > [  106.814007] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]]
> > common rates: 162000, 270000, 540000
> > [  106.814550] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00021 AUX ->
> > (ret=3D  1) 00
> > [  106.814583] i915 0000:00:02.0: [drm:intel_dp_detect [i915]]
> > [ENCODER:308:DDI F] MST support: port: yes, sink: no, modparam: yes
> > =

> > .....
> > =

> > [  106.927291] i915 0000:00:02.0: [drm:intel_dp_check_service_irq
> > [i915]] PHY_PATTERN test requested
> > [  106.927897] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00219 AUX ->
> > (ret=3D  1) 0a
> > [  106.928507] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00220 AUX ->
> > (ret=3D  1) 04
> > [  106.929143] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00248 AUX ->
> > (ret=3D  1) 00
> > [  106.929824] [drm:drm_dp_dpcd_read] AUX F/port F: 0x00202 AUX ->
> > (ret=3D  6) 00 00 80 00 00 00
> > [  106.929830] BUG: kernel NULL pointer dereference, address:
> > 0000000000000578
> > [  106.936809] #PF: supervisor read access in kernel mode
> > [  106.941953] #PF: error_code(0x0000) - not-present page
> > [  106.947082] PGD 0 P4D 0 =

> > [  106.949643] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [  106.954010] CPU: 6 PID: 200 Comm: kworker/6:2 Not tainted 5.7.0-rc7-
> > CI-CI_DRM_8566+ #5
> > [  106.975251] Workqueue: events i915_hotplug_work_func [i915]
> > [  106.980887] RIP: 0010:intel_dp_process_phy_request+0x94/0x5a0 [i915]
> > [  106.987239] Code: 48 83 c4 20 5b 5d 41 5c 41 5d 41 5e 41 5f c3 48 8d
> > 74 24 12 4c 89 f7 e8 3a 3e 00 00 49 8b 86 28 ff ff ff 49 8b 9e d8 fe ff
> > ff <48> 63 80 78 05 00 00 8b 93 54 0d 00 00 48 8d ab e8 0e 00 00 48 89
> > [  107.005890] RSP: 0018:ffffc9000046fb20 EFLAGS: 00010246
> > =

> > I plan to temporarily fix this issue by ignoreing scope request on long
> > HPD, until we have modeset based implementation.
> > =

> > > >  }
> > > >  =

> > > >  static void
> > > > @@ -5497,20 +5507,28 @@ intel_dp_autotest_phy_ddi_enable(struct
> > > > intel_dp *intel_dp, uint8_t lane_cnt)
> > > >  	enum port port =3D intel_dig_port->base.port;
> > > >  	struct intel_crtc *crtc =3D to_intel_crtc(intel_dig_port-
> > > > >base.base.crtc);
> > > >  	enum pipe pipe =3D crtc->pipe;
> > > > -	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > dp_tp_ctl_value;
> > > > +	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > > dp_tp_ctl_value, trans_ddi_sel_port;
> > > > +	i915_reg_t dp_tp_reg;
> > > > +
> > > > +	if (IS_ELKHARTLAKE(dev_priv)) {
> > > > +		dp_tp_reg =3D DP_TP_CTL(port);
> > > > +		trans_ddi_sel_port =3D TRANS_DDI_SELECT_PORT(port);
> > > > +	} else if (IS_TIGERLAKE(dev_priv)) {
> > > > +		dp_tp_reg =3D TGL_DP_TP_CTL(pipe);
> > > > +		trans_ddi_sel_port =3D TGL_TRANS_DDI_SELECT_PORT(port);
> > > > +	}
> > > >  =

> > > >  	trans_ddi_func_ctl_value =3D intel_de_read(dev_priv,
> > > >  						 TRANS_DDI_FUNC_CTL(pip
> > > > e));
> > > >  	trans_conf_value =3D intel_de_read(dev_priv, PIPECONF(pipe));
> > > >  	dp_tp_ctl_value =3D intel_de_read(dev_priv, TGL_DP_TP_CTL(pipe));
> > > > -
> > > >  	trans_ddi_func_ctl_value |=3D TRANS_DDI_FUNC_ENABLE |
> > > > -				    TGL_TRANS_DDI_SELECT_PORT(port);
> > > > +				    trans_ddi_sel_port;
> > > >  	trans_conf_value |=3D PIPECONF_ENABLE;
> > > >  	dp_tp_ctl_value |=3D DP_TP_CTL_ENABLE;
> > > >  =

> > > >  	intel_de_write(dev_priv, PIPECONF(pipe), trans_conf_value);
> > > > -	intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl_value);
> > > > +	intel_de_write(dev_priv, dp_tp_reg, dp_tp_ctl_value);
> > > >  	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(pipe),
> > > >  		       trans_ddi_func_ctl_value);
> > > >  }
> > > > @@ -5557,6 +5575,7 @@ static u8
> > > > intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
> > > >  static void intel_dp_handle_test_request(struct intel_dp
> > > > *intel_dp)
> > > >  {
> > > >  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> > > > +	struct drm_i915_private *dev_priv =3D i915;
> > > >  	u8 response =3D DP_TEST_NAK;
> > > >  	u8 request =3D 0;
> > > >  	int status;
> > > > @@ -5582,6 +5601,11 @@ static void
> > > > intel_dp_handle_test_request(struct intel_dp *intel_dp)
> > > >  		response =3D intel_dp_autotest_edid(intel_dp);
> > > >  		break;
> > > >  	case DP_TEST_LINK_PHY_TEST_PATTERN:
> > > > +		if (!IS_ELKHARTLAKE(dev_priv) ||
> > > > !IS_TIGERLAKE(dev_priv)) {
> > > > +			drm_dbg_kms(&i915->drm,
> > > > +				"PHY compliance for platform not
> > > > supported\n");
> > > > +			return;
> > > > +		}
> > > >  		drm_dbg_kms(&i915->drm, "PHY_PATTERN test
> > > > requested\n");
> > > >  		response =3D intel_dp_autotest_phy_pattern(intel_dp);
> > > >  		break;
> > > > -- =

> > > > 2.7.4
> > > > =

> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > > =

> > > =

> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
