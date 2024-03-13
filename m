Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D8787A2F7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 07:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A13E10E96B;
	Wed, 13 Mar 2024 06:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 408 seconds by postgrey-1.36 at gabe;
 Wed, 13 Mar 2024 06:28:02 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CBC10E96B;
 Wed, 13 Mar 2024 06:28:02 +0000 (UTC)
X-QQ-mid: bizesmtp80t1710310709trkc2gr1
X-QQ-Originating-IP: GLC8Iu67rXhV6eCFYKQmrbl6IkFlciWctK/Tvp2LRJk=
Received: from john-PC ( [123.114.60.34]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 13 Mar 2024 14:18:27 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: RmDZc/K2LPGX8QM1YeXZshthElQ2uZpSSUsxNZv7fWEpt0RBL4E/tI9skKcKk
 5ZKVyGSJl6s0vhpvrJ0lBNIiqBablTIX6rfDaqRRdX6YMmoXIHmkJyt5dkxecksOnZBvLTS
 BvY8b8+x3uU3l2ZZvXdM41PEGNgsaaYJIbyoSn8GSP+5p9ISHi7kqDiHsnaJ7aVOBgpCTeL
 I75T0mKZGigjLTDDU29Hd1eflwxhYelYIPNV8gy3o3aadoOjBG2MIAeyshmJETwXq8tHCV0
 2Fp/Cz4T88wyf6HnXL0/43kW5pTFj8E6AiLizSKrWJitqyZfUkVGWf9+ZSEVUOEnFU+1tTi
 Yk/Uh1FEKP4ICh+IFZEYZODJxIog/wakp2B9pTWCdpCzfemdPy8z/Q4ZgoHhT06jdcMv7t9
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17432395954863793065
Date: Wed, 13 Mar 2024 14:18:27 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, srinivasan.shanmugam@amd.com,
 sunran001@208suo.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack bit
 before hpd initialization
Message-ID: <A65A2F93D9F165EC+20240313141827.40f30bd5@john-PC>
In-Reply-To: <20240131075703.24600-1-maqianga@uniontech.com>
References: <20240131075703.24600-1-maqianga@uniontech.com>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0
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

On Wed, 31 Jan 2024 15:57:03 +0800
Qiang Ma <maqianga@uniontech.com> wrote:

Hello everyone, please help review this patch.

  Qiang Ma

> Problem:
> The computer in the bios initialization process, unplug the HDMI
> display, wait until the system up, plug in the HDMI display, did not
> enter the hotplug interrupt function, the display is not bright.
> 
> Fix:
> After the above problem occurs, and the hpd ack interrupt bit is 1,
> the interrupt should be cleared during hpd_init initialization so that
> when the driver is ready, it can respond to the hpd interrupt
> normally.
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
> v2:
>  - Remove unused variable 'tmp'
>  - Fixed function spelling errors
>  
> drivers/gpu/drm/amd/amdgpu/dce_v10_0.c |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 22 ++++++++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 22 ++++++++++++++++++----
>  4 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c index
> bb666cb7522e..12a8ba929a72 100644 ---
> a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c +++
> b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c @@ -51,6 +51,7 @@
>  
>  static void dce_v10_0_set_display_funcs(struct amdgpu_device *adev);
>  static void dce_v10_0_set_irq_funcs(struct amdgpu_device *adev);
> +static void dce_v10_0_hpd_int_ack(struct amdgpu_device *adev, int
> hpd); 
>  static const u32 crtc_offsets[] = {
>  	CRTC0_REGISTER_OFFSET,
> @@ -363,6 +364,7 @@ static void dce_v10_0_hpd_init(struct
> amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
>  		WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> hpd_offsets[amdgpu_connector->hpd.hpd], tmp); 
> +		dce_v10_0_hpd_int_ack(adev,
> amdgpu_connector->hpd.hpd); dce_v10_0_hpd_set_polarity(adev,
> amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
>  			       amdgpu_connector->hpd.hpd);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c index
> 7af277f61cca..745e4fdffade 100644 ---
> a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c +++
> b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c @@ -51,6 +51,7 @@
>  
>  static void dce_v11_0_set_display_funcs(struct amdgpu_device *adev);
>  static void dce_v11_0_set_irq_funcs(struct amdgpu_device *adev);
> +static void dce_v11_0_hpd_int_ack(struct amdgpu_device *adev, int
> hpd); 
>  static const u32 crtc_offsets[] =
>  {
> @@ -387,6 +388,7 @@ static void dce_v11_0_hpd_init(struct
> amdgpu_device *adev) AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
>  		WREG32(mmDC_HPD_TOGGLE_FILT_CNTL +
> hpd_offsets[amdgpu_connector->hpd.hpd], tmp); 
> +		dce_v11_0_hpd_int_ack(adev,
> amdgpu_connector->hpd.hpd); dce_v11_0_hpd_set_polarity(adev,
> amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> amdgpu_connector->hpd.hpd); }
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c index
> 143efc37a17f..28c4a735716b 100644 ---
> a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c +++
> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c @@ -272,6 +272,21 @@ static
> void dce_v6_0_hpd_set_polarity(struct amdgpu_device *adev,
> WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
>  
> +static void dce_v6_0_hpd_int_ack(struct amdgpu_device *adev,
> +				 int hpd)
> +{
> +	u32 tmp;
> +
> +	if (hpd >= adev->mode_info.num_hpd) {
> +		DRM_DEBUG("invalid hdp %d\n", hpd);
> +		return;
> +	}
> +
> +	tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> +	tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> +	WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
> +}
> +
>  /**
>   * dce_v6_0_hpd_init - hpd setup callback.
>   *
> @@ -311,6 +326,7 @@ static void dce_v6_0_hpd_init(struct
> amdgpu_device *adev) continue;
>  		}
>  
> +		dce_v6_0_hpd_int_ack(adev,
> amdgpu_connector->hpd.hpd); dce_v6_0_hpd_set_polarity(adev,
> amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> amdgpu_connector->hpd.hpd); }
> @@ -3088,7 +3104,7 @@ static int dce_v6_0_hpd_irq(struct
> amdgpu_device *adev, struct amdgpu_irq_src *source,
>  			    struct amdgpu_iv_entry *entry)
>  {
> -	uint32_t disp_int, mask, tmp;
> +	uint32_t disp_int, mask;
>  	unsigned hpd;
>  
>  	if (entry->src_data[0] >= adev->mode_info.num_hpd) {
> @@ -3101,9 +3117,7 @@ static int dce_v6_0_hpd_irq(struct
> amdgpu_device *adev, mask = interrupt_status_offsets[hpd].hpd;
>  
>  	if (disp_int & mask) {
> -		tmp = RREG32(mmDC_HPD1_INT_CONTROL +
> hpd_offsets[hpd]);
> -		tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> -		WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> tmp);
> +		dce_v6_0_hpd_int_ack(adev, hpd);
>  		schedule_delayed_work(&adev->hotplug_work, 0);
>  		DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c index
> adeddfb7ff12..8ff2b5adfd95 100644 ---
> a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c +++
> b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c @@ -264,6 +264,21 @@ static
> void dce_v8_0_hpd_set_polarity(struct amdgpu_device *adev,
> WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp); }
>  
> +static void dce_v8_0_hpd_int_ack(struct amdgpu_device *adev,
> +				 int hpd)
> +{
> +	u32 tmp;
> +
> +	if (hpd >= adev->mode_info.num_hpd) {
> +		DRM_DEBUG("invalid hdp %d\n", hpd);
> +		return;
> +	}
> +
> +	tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
> +	tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> +	WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
> +}
> +
>  /**
>   * dce_v8_0_hpd_init - hpd setup callback.
>   *
> @@ -303,6 +318,7 @@ static void dce_v8_0_hpd_init(struct
> amdgpu_device *adev) continue;
>  		}
>  
> +		dce_v8_0_hpd_int_ack(adev,
> amdgpu_connector->hpd.hpd); dce_v8_0_hpd_set_polarity(adev,
> amdgpu_connector->hpd.hpd); amdgpu_irq_get(adev, &adev->hpd_irq,
> amdgpu_connector->hpd.hpd); }
> @@ -3176,7 +3192,7 @@ static int dce_v8_0_hpd_irq(struct
> amdgpu_device *adev, struct amdgpu_irq_src *source,
>  			    struct amdgpu_iv_entry *entry)
>  {
> -	uint32_t disp_int, mask, tmp;
> +	uint32_t disp_int, mask;
>  	unsigned hpd;
>  
>  	if (entry->src_data[0] >= adev->mode_info.num_hpd) {
> @@ -3189,9 +3205,7 @@ static int dce_v8_0_hpd_irq(struct
> amdgpu_device *adev, mask = interrupt_status_offsets[hpd].hpd;
>  
>  	if (disp_int & mask) {
> -		tmp = RREG32(mmDC_HPD1_INT_CONTROL +
> hpd_offsets[hpd]);
> -		tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
> -		WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd],
> tmp);
> +		dce_v8_0_hpd_int_ack(adev, hpd);
>  		schedule_delayed_work(&adev->hotplug_work, 0);
>  		DRM_DEBUG("IH: HPD%d\n", hpd + 1);
>  	}

