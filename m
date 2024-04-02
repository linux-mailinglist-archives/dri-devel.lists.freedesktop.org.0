Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A24895E33
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 23:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCC8112056;
	Tue,  2 Apr 2024 21:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95923112056
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 21:00:34 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CF73D1F509;
 Tue,  2 Apr 2024 23:00:31 +0200 (CEST)
Date: Tue, 2 Apr 2024 23:00:30 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/4] drm/mipi-dsi: use correct return type for the DSC
 functions
Message-ID: <rqj27ry5bvh5mcnstptshynm4t74jjcnvnr2qw4d7plqy4nkxi@xlisoqjblidj>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-2-144f17a11a56@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402-lg-sw43408-panel-v3-2-144f17a11a56@linaro.org>
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

On 2024-04-02 02:51:13, Dmitry Baryshkov wrote:
> The functions mipi_dsi_compression_mode() and
> mipi_dsi_picture_parameter_set() return 0-or-error rather than a buffer
> size. Follow example of other similar MIPI DSI functions and use int
> return type instead of size_t.
> 
> Fixes: f4dea1aaa9a1 ("drm/dsi: add helpers for DSI compression mode and PPS packets")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 6 +++---
>  include/drm/drm_mipi_dsi.h     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index ef6e416522f8..9874ff6d4718 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -654,7 +654,7 @@ EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> +int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
>  {
>  	/* Note: Needs updating for non-default PPS or algorithm */
>  	u8 tx[2] = { enable << 0, 0 };
> @@ -679,8 +679,8 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode);
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
> -				       const struct drm_dsc_picture_parameter_set *pps)
> +int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
> +				   const struct drm_dsc_picture_parameter_set *pps)
>  {
>  	struct mipi_dsi_msg msg = {
>  		.channel = dsi->channel,
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index c0aec0d4d664..3011d33eccbd 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -241,9 +241,9 @@ int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi);
>  int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
>  int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
>  					    u16 value);
> -ssize_t mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
> -ssize_t mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
> -				       const struct drm_dsc_picture_parameter_set *pps);
> +int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
> +int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
> +				   const struct drm_dsc_picture_parameter_set *pps);
>  
>  ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
>  			       size_t size);
> 
> -- 
> 2.39.2
> 
