Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143AA9B79BA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 12:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C279610E0A1;
	Thu, 31 Oct 2024 11:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnf/3hqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC7C10E0A1;
 Thu, 31 Oct 2024 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730374443; x=1761910443;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rad7u463xWi2MhcMG4ACZLpipTH5MAEkEWxnR7IUYzI=;
 b=fnf/3hqBrUp7nek6inX+8wAcZ7PhWFb3xgK/ElS/+Ww1eFDMcHmXKE6/
 MMsrR8Hjr2TerIiRr5CYRa/x7LLKMiZ7Z+AjEAmHx1bZeXVfeTuq7bj+c
 io9E1ysWlQKzfS9cm27UIt9wUL0zPjugBnm58VXI/XFitA8W92KyT5yjh
 +ww3X6z4Ty9/zk3gXf3QfLCw6Q1GGAoFy8VlGzN5+dNg5qtpy3TB5+p7m
 9PUy7N83MGlifYJTr1H2WqDvhSFtfqmNHojtmFdWhaKdXrvaeY3DOeqUt
 4TS6xu0noTOqvwNF2NTxqELr5PM/JfoZVzl2Pp8Cau2HVEETHqRmixID/ Q==;
X-CSE-ConnectionGUID: hE68/RwJQmSfT8PohQG5dQ==
X-CSE-MsgGUID: G66Ka3hySrSswn/oA3O4mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="17748624"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="17748624"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 04:34:02 -0700
X-CSE-ConnectionGUID: n9sV0ysrS3+sj260hNjB0A==
X-CSE-MsgGUID: H+CxxR49Tbedvhi14tGNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="87202121"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 04:33:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sergey
 Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC][PATCH] drm: i915: do not NULL deref hdmi attached_connector
In-Reply-To: <20241031105145.2140590-1-senozhatsky@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241031105145.2140590-1-senozhatsky@chromium.org>
Date: Thu, 31 Oct 2024 13:33:55 +0200
Message-ID: <87y124jyl8.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Oct 2024, Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> 	*** RFC ***
>
> intel_ddi_init() may skip connector initialization, for instance,
> both intel_ddi_init_dp_connector() and intel_ddi_init_hdmi_connector()
> are optional.  This leads to situation that ->attached_connector may
> be NULL for some connectors.  For instance, on my setup 'DDI A/PHY A'
> and 'DDI TC1/PHY TC1' are not initialized.
>
> However, functions like intel_dp_dual_mode_set_tmds_output() and
> friends don't take this into consideration.  This leads to NULL
> ptr-derefs:
>
> KASAN: null-ptr-deref in range [0x0000000000000848-0x000000000000084f]
> RIP: 0010:intel_hdmi_encoder_shutdown+0x105/0x230
> Call Trace:
> <TASK>
> i915_driver_shutdown+0x2d8/0x490
> pci_device_shutdown+0x83/0x150
> device_shutdown+0x4ad/0x660
> __se_sys_reboot+0x29c/0x4d0
> do_syscall_64+0x60/0x90
>
> Add a new helper to avoid NULL ->attached_connector derefs and
> switch some intel_hdmi function to it.  I'm not sure if we need
> to switch all or just intel_dp_dual_mode_set_tmds_output() (I
> have only seen this one doing NULL derefs so far).

I think the question is, what are we doing running this code if the
connector initialization was skipped?

BR,
Jani.

>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 27 ++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index e1a1351bc94f..c089dd20972b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1256,12 +1256,19 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
>  			      &crtc_state->infoframes.drm);
>  }
>  
> +static struct i2c_adapter *to_ddc(struct intel_hdmi *hdmi)
> +{
> +	if (hdmi->attached_connector)
> +		return hdmi->attached_connector->base.ddc;
> +	return NULL;
> +}
> +
>  void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool enable)
>  {
>  	struct intel_display *display = to_intel_display(hdmi);
> -	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
> +	struct i2c_adapter *ddc = to_ddc(hdmi);
>  
> -	if (hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
> +	if (!ddc || hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
>  		return;
>  
>  	drm_dbg_kms(display->drm, "%s DP dual mode adaptor TMDS output\n",
> @@ -1275,7 +1282,7 @@ static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
>  				unsigned int offset, void *buffer, size_t size)
>  {
>  	struct intel_hdmi *hdmi = &dig_port->hdmi;
> -	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
> +	struct i2c_adapter *ddc = to_ddc(hdmi);
>  	int ret;
>  	u8 start = offset & 0xff;
>  	struct i2c_msg msgs[] = {
> @@ -1292,6 +1299,10 @@ static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
>  			.buf = buffer
>  		}
>  	};
> +
> +	if (!ddc)
> +		return -EINVAL;
> +
>  	ret = i2c_transfer(ddc, msgs, ARRAY_SIZE(msgs));
>  	if (ret == ARRAY_SIZE(msgs))
>  		return 0;
> @@ -1302,11 +1313,14 @@ static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
>  				 unsigned int offset, void *buffer, size_t size)
>  {
>  	struct intel_hdmi *hdmi = &dig_port->hdmi;
> -	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
> +	struct i2c_adapter *ddc = to_ddc(hdmi);
>  	int ret;
>  	u8 *write_buf;
>  	struct i2c_msg msg;
>  
> +	if (!ddc)
> +		return -EINVAL;
> +
>  	write_buf = kzalloc(size + 1, GFP_KERNEL);
>  	if (!write_buf)
>  		return -ENOMEM;
> @@ -1335,9 +1349,12 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
>  {
>  	struct intel_display *display = to_intel_display(dig_port);
>  	struct intel_hdmi *hdmi = &dig_port->hdmi;
> -	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
> +	struct i2c_adapter *ddc = to_ddc(hdmi);
>  	int ret;
>  
> +	if (!ddc)
> +		return -EINVAL;
> +
>  	ret = intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an,
>  				    DRM_HDCP_AN_LEN);
>  	if (ret) {

-- 
Jani Nikula, Intel
