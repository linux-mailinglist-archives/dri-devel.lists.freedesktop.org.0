Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4A2A5F88
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA726F3D1;
	Wed,  4 Nov 2020 08:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4DE6E8C8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 17:34:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604424872; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=chZXK7LKaQWhsJngmSxlrn5Gd7QZePP6oMaO/PyNsGc=;
 b=KEvb5zMdnIX1ans/ouhDwCYgBPRbDY/2+V0sbhje3otlVXQCWST+a4Ths5fftGwmxZhsZmMH
 Xy2i2ci+OHDVmdb88GvegWq0wQXhDpqZE/Dxhd6U/M9tszfIqXRSdQzofsUkqso9s/X0tJhu
 QOIjod+v7dq8TaIrBP+tE6UG5/k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5fa194991037425ce1dcc2ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 17:34:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1D89FC43387; Tue,  3 Nov 2020 17:34:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A700C433C9;
 Tue,  3 Nov 2020 17:34:15 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 03 Nov 2020 09:34:15 -0800
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: deinitialize mainlink if link training failedo
In-Reply-To: <160435078857.884498.13223713108695196370@swboyd.mtv.corp.google.com>
References: <20201030232253.11049-1-khsieh@codeaurora.org>
 <160435078857.884498.13223713108695196370@swboyd.mtv.corp.google.com>
Message-ID: <e2d080eb8c5b0efaaa7e97ac19451f57@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: freedreno@lists.freedesktop.org, rnayak@codeaurora.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-02 12:59, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2020-10-30 16:22:53)
>> DP compo phy have to be enable to start link training. When
>> link training failed phy need to be disabled so that next
>> link trainng can be proceed smoothly at next plug in. This
> 
> s/trainng/training/
> 
>> patch de initialize mainlink to disable phy if link training
> 
> s/de/de-/
> 
>> failed. This prevent system crash due to
>> disp_cc_mdss_dp_link_intf_clk stuck at "off" state.  This patch
>> also perform checking power_on flag at dp_display_enable() and
>> dp_display_disable() to avoid crashing when unplug cable while
>> display is off.
>> 
>> Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused 
>> by failure of link train
>> 
> 
> Drop newline please.
> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Can you send this as a patch series? There were three patches sent near
> each other and presumably they're related.
> 
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 34 
>> +++++++++++++++++++++++++++--
>>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++
>>  2 files changed, 45 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index cee161c8ecc6..904698dfc7f7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1468,6 +1468,29 @@ static int dp_ctrl_reinitialize_mainlink(struct 
>> dp_ctrl_private *ctrl)
>>         return ret;
>>  }
>> 
>> +static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private 
>> *ctrl)
>> +{
>> +       struct dp_io *dp_io;
>> +       struct phy *phy;
>> +       int ret = 0;
> 
> Please drop this initialization to 0.
> 
>> +
>> +       dp_io = &ctrl->parser->io;
>> +       phy = dp_io->phy;
>> +
>> +       dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>> +
>> +       dp_catalog_ctrl_reset(ctrl->catalog);
>> +
>> +       ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
> 
> As it's overwritten here.
> 
>> +       if (ret)
>> +               DRM_ERROR("Failed to disable link clocks. ret=%d\n", 
>> ret);
>> +
>> +       phy_power_off(phy);
>> +       phy_exit(phy);
>> +
>> +       return -ECONNRESET;
> 
> Isn't this an error for networking connections getting reset? Really it
> should return 0 because it didn't fail.
> 
>> +}
>> +
>>  static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>>  {
>>         int ret = 0;
>> @@ -1648,8 +1671,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>         if (rc)
>>                 return rc;
>> 
>> -       while (--link_train_max_retries &&
>> -               !atomic_read(&ctrl->dp_ctrl.aborted)) {
>> +       while (--link_train_max_retries) {
>>                 rc = dp_ctrl_reinitialize_mainlink(ctrl);
>>                 if (rc) {
>>                         DRM_ERROR("Failed to reinitialize mainlink. 
>> rc=%d\n",
>> @@ -1664,6 +1686,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>                         break;
>>                 } else if (training_step == DP_TRAINING_1) {
>>                         /* link train_1 failed */
>> +                       if 
>> (!dp_catalog_hpd_get_state_status(ctrl->catalog))
>> +                               break;          /* link cable 
>> unplugged */
>> +
>>                         rc = dp_ctrl_link_rate_down_shift(ctrl);
>>                         if (rc < 0) { /* already in RBR = 1.6G */
>>                                 if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) 
>> {
>> @@ -1683,6 +1708,9 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>                         }
>>                 } else if (training_step == DP_TRAINING_2) {
>>                         /* link train_2 failed, lower lane rate */
>> +                       if 
>> (!dp_catalog_hpd_get_state_status(ctrl->catalog))
> 
> Maybe make a function called dp_catalog_link_disconnected()? Then the
> comment isn't needed.
> 
>> +                               break;          /* link cable 
>> unplugged */
>> +
>>                         rc = dp_ctrl_link_lane_down_shift(ctrl);
>>                         if (rc < 0) {
>>                                 /* end with failure */
>> @@ -1703,6 +1731,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>          */
>>         if (rc == 0)  /* link train successfully */
>>                 dp_ctrl_push_idle(dp_ctrl);
>> +       else
>> +               rc = dp_ctrl_deinitialize_mainlink(ctrl);
> 
> So if it fails we deinitialize and then return success? Shouldn't we
> keep the error code from the link train attempt instead of overwrite it
> with (most likely) zero? I see that it returns -ECONNRESET but that's
> really odd and seeing this code here means you have to look at the
> function to figure out that it's still returning an error code. Please
> don't do that, just ignore the error code from this function.
> 
There are two possible failure cases at plugin request, link training 
failed  and read dpcd/edid failed.
It does not need to enable phy/pll to perform aux read/write from/to 
dpcd or edid.
on the other hand, phy/pll need to be enabled to perform link training. 
If link training failed,
then phy/pll need to be disabled so that phy/pll can be enabled next 
link training correctly.
Link training failed error has to be propagated back to the top caller 
so that dp_display_host_init()
will be called again at next plugin request.


>> 
>>         return rc;
>>  }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 3eb0d428abf7..13b66266cd69 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -529,6 +529,11 @@ static int dp_hpd_plug_handle(struct 
>> dp_display_private *dp, u32 data)
>>         if (ret) {      /* link train failed */
>>                 hpd->hpd_high = 0;
>>                 dp->hpd_state = ST_DISCONNECTED;
>> +
>> +               if (ret == -ECONNRESET) { /* cable unplugged */
>> +                       dp->core_initialized = false;
>> +               }
> 
> Style: Drop braces on single line if statements.
> 
>> +
>>         } else {
>>                 /* start sentinel checking in case of missing uevent 
>> */
>>                 dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
>> @@ -794,6 +799,11 @@ static int dp_display_enable(struct 
>> dp_display_private *dp, u32 data)
>> 
>>         dp_display = g_dp_display;
>> 
>> +       if (dp_display->power_on) {
>> +               DRM_DEBUG_DP("Link already setup, return\n");
>> +               return 0;
>> +       }
>> +
>>         rc = dp_ctrl_on_stream(dp->ctrl);
>>         if (!rc)
>>                 dp_display->power_on = true;
>> @@ -826,6 +836,9 @@ static int dp_display_disable(struct 
>> dp_display_private *dp, u32 data)
>> 
>>         dp_display = g_dp_display;
>> 
>> +       if (!dp_display->power_on)
>> +               return -EINVAL;
>> +
>>         /* wait only if audio was enabled */
>>         if (dp_display->audio_enabled) {
>>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>> 
>> base-commit: fd4a29bed29b3d8f15942fdf77e7a0a52796d836
> 
> What is this commit?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
