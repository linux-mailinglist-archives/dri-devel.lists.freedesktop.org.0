Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51E15EDB9C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 13:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6C010E454;
	Wed, 28 Sep 2022 11:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5110E452;
 Wed, 28 Sep 2022 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664364011; x=1695900011;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bB9gV6PKTJ+wQN/jZxmKOit1gS2GRU2vEL6efEMk60I=;
 b=kKJpSZMO3OoXkjx+1YCib1Dn+4H/KqrINTficWiVinFsQeHSLm6k0CH0
 CD2XRp+iLEYczocYF5YuocbSxvhPXXUKX3sX0ALB5BwvrIjjbvHEIcjsF
 KK3r42qHc378lv6Xx7g0FWnm8PMp3oDUM9qc+9eTyseieOfZU4SVXGWwA
 kPEs2IwWANUTMLs4qhW3yeF3Pya6likKhO3+/pB5QGDEmFMbmUMB4tjiK
 64O963IFRDCcREYTdlasGbJLkBJwgDsgXPQqtms5CzpmA0rnJ5ps9Luhc
 W2XsFHzF1o6MW/JsKPom0F5y70MUbRbvHar8VBpFCUm0kubg1MSPY6kSM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="302486013"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="302486013"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 04:20:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="710935508"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="710935508"
Received: from novermar-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.30])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 04:20:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/display: Don't rewrite link config when setting phy
 test pattern
In-Reply-To: <20220916054900.415804-1-khaled.almahallawy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220916054900.415804-1-khaled.almahallawy@intel.com>
Date: Wed, 28 Sep 2022 14:20:05 +0300
Message-ID: <875yh7zqxm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Or Cochvi <or.cochvi@intel.com>, intel-gfx@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Sep 2022, Khaled Almahallawy <khaled.almahallawy@intel.com> wrote:
> The sequence for Source DP PHY CTS automation is [2][1]:
> 1- Emulate successful Link Training(LT)
> 2- Short HPD and change link rates and number of lanes by LT.
> (This is same flow for Link Layer CTS)
> 3- Short HPD and change PHY test pattern and swing/pre-emphasis
> levels (This step should not trigger LT)
>
> The problem is with DP PHY compliance setup as follow:
>
>      [DPTX + on board LTTPR]------Main Link--->[Scope]
>      	     	        ^                         |
> 			|                         |
> 			|                         |
> 			----------Aux Ch------>[Aux Emulator]
>
> At step 3, before writing TRAINING_LANEx_SET/LINK_QUAL_PATTERN_SET
> to declare the pattern/swing requested by scope, we write link
> config in LINK_BW_SET/LANE_COUNT_SET on a port that has LTTPR.
> As LTTPR snoops aux transaction, LINK_BW_SET/LANE_COUNT_SET writes
> indicate a LT will start [Check DP 2.0 E11 -Sec 3.6.8.2 & 3.6.8.6.3],
> and LTTPR will reset the link and stop sending DP signals to
> DPTX/Scope causing the measurements to fail. Note that step 3 will
> not trigger LT and DP link will never recovered by the
> Aux Emulator/Scope.
>
> The reset of link can be tested with a monitor connected to LTTPR
> port simply by writing to LINK_BW_SET or LANE_COUNT_SET as follow
>
>   igt/tools/dpcd_reg write --offset=0x100 --value 0x14 --device=2
>
> OR
>
>   printf '\x14' | sudo dd of=/dev/drm_dp_aux2 bs=1 count=1 conv=notrunc
>   seek=$((0x100))
>
> This single aux write causes the screen to blank, sending short HPD to
> DPTX, setting LINK_STATUS_UPDATE = 1 in DPCD 0x204, and triggering LT.
>
> As stated in [1]:
> "Before any TX electrical testing can be performed, the link between a
> DPTX and DPRX (in this case, a piece of test equipment), including all
> LTTPRs within the path, shall be trained as defined in this Standard."
>
> In addition, changing Phy pattern/Swing/Pre-emphasis (Step 3) uses the
> same link rate and lane count applied on step 2, so no need to redo LT.
>
> The fix is to not rewrite link config in step 3, and just writes
> TRAINING_LANEx_SET and LINK_QUAL_PATTERN_SET
>
> [1]: DP 2.0 E11 - 3.6.11.1 LTTPR DPTX_PHY Electrical Compliance
>
> [2]: Configuring UnigrafDPTC Controller - Automation Test Sequence
> https://www.keysight.com/us/en/assets/9922-01244/help-files/
> D9040DPPC-DisplayPort-Test-Software-Online-Help-latest.chm
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Or Cochvi <or.cochvi@intel.com>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>

Pushed to drm-misc-next, thanks for the patch.

I didn't seek further confirmation because i915 is still the only user
of this function it seems.

BR,
Jani.


> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 92990a3d577a..9f055d9710ea 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2670,17 +2670,8 @@ int drm_dp_set_phy_test_pattern(struct drm_dp_aux *aux,
>  				struct drm_dp_phy_test_params *data, u8 dp_rev)
>  {
>  	int err, i;
> -	u8 link_config[2];
>  	u8 test_pattern;
>  
> -	link_config[0] = drm_dp_link_rate_to_bw_code(data->link_rate);
> -	link_config[1] = data->num_lanes;
> -	if (data->enhanced_frame_cap)
> -		link_config[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> -	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, link_config, 2);
> -	if (err < 0)
> -		return err;
> -
>  	test_pattern = data->phy_pattern;
>  	if (dp_rev < 0x12) {
>  		test_pattern = (test_pattern << 2) &

-- 
Jani Nikula, Intel Open Source Graphics Center
