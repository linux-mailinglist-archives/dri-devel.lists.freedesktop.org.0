Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9166EBD7A
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 08:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2509910E044;
	Sun, 23 Apr 2023 06:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ci74p00im-qukt09082702.me.com (ci74p00im-qukt09082702.me.com
 [17.57.156.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4092210E03D
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1682183220; bh=hE7F9RIADDqRpsK+h4crL1SysJ+hnqR11V2//4NVMfI=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=vLsUoasfu1QGnVad7euoLs08bK9rhuOaAuc2Cm7Y44+idbkMghAyt4ijA9sRGJIxU
 yJ3PIez2kQyrYgnZM4XRxWRxLl6c3DrIb7whWlPb8sJ7NvuS183oRliPG2tgb49v4C
 IoSe9HRE86eCE4AvpOn1WtcVM5I6Exr6XEACu+EwzlghHLFOhTKabhmHPaeCUFnINw
 +dqo31O8G22+68F3osq2zyg6R41JLOQ2UCv80CVnRGDCCODPqtR6W1da5vHzNxQxlW
 sXXPMZOkXtcLRYWzCn/VzA0uyPQnyqjB1RAdOcYoFxcMg3uCYKmHsZ4rLRK4/AFpNv
 trJ5nQUhpQrAA==
Received: from imac101 (ci77p00im-dlb-asmtp-mailmevip.me.com [17.57.156.26])
 by ci74p00im-qukt09082702.me.com (Postfix) with ESMTPSA id A0F23154009F;
 Sat, 22 Apr 2023 17:06:58 +0000 (UTC)
Date: Sat, 22 Apr 2023 19:06:55 +0200
From: Alain Volmat <avolmat@me.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 7/9] drm/sti/sti_hdmi: convert to using is_hdmi from
 display info
Message-ID: <ZEQUL8UB1uRXF0Aq@imac101>
References: <cover.1662036058.git.jani.nikula@intel.com>
 <74fbd7a83712009734534d92e5499d4d87f0c53b.1662036058.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74fbd7a83712009734534d92e5499d4d87f0c53b.1662036058.git.jani.nikula@intel.com>
X-Proofpoint-GUID: LmJRN1o3gg7pIiq6KJreuDk0GnyLdUOK
X-Proofpoint-ORIG-GUID: LmJRN1o3gg7pIiq6KJreuDk0GnyLdUOK
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2304220157
X-Mailman-Approved-At: Sun, 23 Apr 2023 06:47:48 +0000
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
Cc: Alain Volmat <alain.volmat@foss.st.com>, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Thu, Sep 01, 2022 at 03:47:09PM +0300, Jani Nikula wrote:
> Prefer the parsed results for is_hdmi in display info over calling
> drm_detect_hdmi_monitor(). Remove the now redundant hdmi_monitor member
> from struct sti_hdmi.
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/sti/sti_hdmi.c | 11 ++++++-----
>  drivers/gpu/drm/sti/sti_hdmi.h |  2 --
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index cb82622877d2..7e6d47c1c43b 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -266,6 +266,7 @@ static void hdmi_active_area(struct sti_hdmi *hdmi)
>   */
>  static void hdmi_config(struct sti_hdmi *hdmi)
>  {
> +	struct drm_connector *connector = hdmi->drm_connector;
>  	u32 conf;
>  
>  	DRM_DEBUG_DRIVER("\n");
> @@ -275,7 +276,7 @@ static void hdmi_config(struct sti_hdmi *hdmi)
>  
>  	/* Select encryption type and the framing mode */
>  	conf |= HDMI_CFG_ESS_NOT_OESS;
> -	if (hdmi->hdmi_monitor)
> +	if (connector->display_info.is_hdmi)
>  		conf |= HDMI_CFG_HDMI_NOT_DVI;
>  
>  	/* Set Hsync polarity */
> @@ -985,15 +986,15 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
>  	if (!edid)
>  		goto fail;
>  
> -	hdmi->hdmi_monitor = drm_detect_hdmi_monitor(edid);
> -	DRM_DEBUG_KMS("%s : %dx%d cm\n",
> -		      (hdmi->hdmi_monitor ? "hdmi monitor" : "dvi monitor"),
> -		      edid->width_cm, edid->height_cm);
>  	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
>  
>  	count = drm_add_edid_modes(connector, edid);
>  	drm_connector_update_edid_property(connector, edid);
>  
> +	DRM_DEBUG_KMS("%s : %dx%d cm\n",
> +		      (connector->display_info.is_hdmi ? "hdmi monitor" : "dvi monitor"),
> +		      edid->width_cm, edid->height_cm);
> +
>  	kfree(edid);
>  	return count;
>  
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.h b/drivers/gpu/drm/sti/sti_hdmi.h
> index 05b2f3d0d48d..6d4c3f57bc46 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.h
> +++ b/drivers/gpu/drm/sti/sti_hdmi.h
> @@ -57,7 +57,6 @@ struct hdmi_audio_params {
>   * @reset: reset control of the hdmi phy
>   * @ddc_adapt: i2c ddc adapter
>   * @colorspace: current colorspace selected
> - * @hdmi_monitor: true if HDMI monitor detected else DVI monitor assumed
>   * @audio_pdev: ASoC hdmi-codec platform device
>   * @audio: hdmi audio parameters.
>   * @drm_connector: hdmi connector
> @@ -83,7 +82,6 @@ struct sti_hdmi {
>  	struct reset_control *reset;
>  	struct i2c_adapter *ddc_adapt;
>  	enum hdmi_colorspace colorspace;
> -	bool hdmi_monitor;
>  	struct platform_device *audio_pdev;
>  	struct hdmi_audio_params audio;
>  	struct drm_connector *drm_connector;
> -- 

Acked-by: Alain Volmat <avolmat@me.com>

Thanks.

> 2.34.1
> 
