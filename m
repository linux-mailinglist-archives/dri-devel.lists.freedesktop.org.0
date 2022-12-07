Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85027645C7D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 15:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331CE10E3BA;
	Wed,  7 Dec 2022 14:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110A710E3BA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WCURuc2PPraHWzw6A9eFTozRqyV32p8iHua71/1Pbc=; b=NyKUyEIScREOP4k+T3Trmy1KpY
 qgYKPKhUb5ZP1zc/7gsVPtPKH0b33zRPpsGaMsSOKMOB8cbadZr3vsAVCjtGmg8OmX35uQjlLnFrO
 VBV00VjarWPDiGHzLcEwDI/7g7zjHaYSrCukCmzpN+LuhTBfrbp1LzsitDy7i/PEp1qq26gMTdiGS
 fb3BvvWfOhd3PQaCXBhXO8iojUMjm24MmkNxuTDOVonhtstAmODGPKSPiCDGG0ht80oVjYf8NOm/B
 JrtgU7vyABHSHwvqOQsV0Ne+NywJZv7PTHzA+G0kl2HY4EI+GX2YeyAO/B3eLhRLTdgsrAPzvUb/u
 jIV6JyjQ==;
Received: from [143.107.182.242] (helo=[10.41.75.14])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1p2vNN-00GcOE-2j; Wed, 07 Dec 2022 15:26:21 +0100
Message-ID: <51fb1fdd-edf0-b2a3-0573-76a9101adfb3@igalia.com>
Date: Wed, 7 Dec 2022 11:26:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 18/20] drm/vc4: tests: Fail the current test if we
 access a register
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
 <20221123-rpi-kunit-tests-v3-18-4615a663a84a@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20221123-rpi-kunit-tests-v3-18-4615a663a84a@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kselftest@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 12:11, Maxime Ripard wrote:
> Accessing a register when running under kunit is a bad idea since our
> device is completely mocked.
> 
> Fail the current test if we ever access any of our hardware registers.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Just a small nit: I believe that macros with multiple statements should 
be enclosed in a do-while block [1], even READ macros. I saw that you 
enclosed the WRITE macros on a do-while block, but not the READ macros.

[1] 
https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/vc4/vc4_crtc.c      | 13 +++++++++++--
>   drivers/gpu/drm/vc4/vc4_dpi.c       | 13 +++++++++++--
>   drivers/gpu/drm/vc4/vc4_drv.h       | 29 +++++++++++++++++++++++++----
>   drivers/gpu/drm/vc4/vc4_dsi.c       |  9 ++++++++-
>   drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  4 ++++
>   drivers/gpu/drm/vc4/vc4_txp.c       | 13 +++++++++++--
>   drivers/gpu/drm/vc4/vc4_vec.c       | 13 +++++++++++--
>   7 files changed, 81 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 7d1a696477ce..a1a3465948c4 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -50,8 +50,17 @@
>   
>   #define HVS_FIFO_LATENCY_PIX	6
>   
> -#define CRTC_WRITE(offset, val) writel(val, vc4_crtc->regs + (offset))
> -#define CRTC_READ(offset) readl(vc4_crtc->regs + (offset))
> +#define CRTC_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, vc4_crtc->regs + (offset));					\
> +	} while (0)
> +
> +#define CRTC_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(vc4_crtc->regs + (offset));					\
> +	})
>   
>   static const struct debugfs_reg32 crtc_regs[] = {
>   	VC4_REG32(PV_CONTROL),
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 1f8f44b7b5a5..0edf3c4c98c8 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -103,8 +103,17 @@ to_vc4_dpi(struct drm_encoder *encoder)
>   	return container_of(encoder, struct vc4_dpi, encoder.base);
>   }
>   
> -#define DPI_READ(offset) readl(dpi->regs + (offset))
> -#define DPI_WRITE(offset, val) writel(val, dpi->regs + (offset))
> +#define DPI_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(dpi->regs + (offset));						\
> +	})
> +
> +#define DPI_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, dpi->regs + (offset));					\
> +	} while (0)
>   
>   static const struct debugfs_reg32 dpi_regs[] = {
>   	VC4_REG32(DPI_C),
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 418f4f308e36..78fda5332cb3 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -19,6 +19,8 @@
>   #include <drm/drm_mm.h>
>   #include <drm/drm_modeset_lock.h>
>   
> +#include <kunit/test-bug.h>
> +
>   #include "uapi/drm/vc4_drm.h"
>   
>   struct drm_device;
> @@ -645,10 +647,29 @@ to_vc4_crtc_state(const struct drm_crtc_state *crtc_state)
>   	return container_of(crtc_state, struct vc4_crtc_state, base);
>   }
>   
> -#define V3D_READ(offset) readl(vc4->v3d->regs + offset)
> -#define V3D_WRITE(offset, val) writel(val, vc4->v3d->regs + offset)
> -#define HVS_READ(offset) readl(hvs->regs + offset)
> -#define HVS_WRITE(offset, val) writel(val, hvs->regs + offset)
> +#define V3D_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(vc4->v3d->regs + (offset));						\
> +	})
> +
> +#define V3D_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, vc4->v3d->regs + (offset));					\
> +	} while (0)
> +
> +#define HVS_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(hvs->regs + (offset));						\
> +	})
> +
> +#define HVS_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, hvs->regs + (offset));					\
> +	} while (0)
>   
>   #define VC4_REG32(reg) { .name = #reg, .offset = reg }
>   
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 878e05d79e81..2c9cb27903a0 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -617,6 +617,8 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
>   	dma_cookie_t cookie;
>   	int ret;
>   
> +	kunit_fail_current_test("Accessing a register in a unit test!\n");
> +
>   	/* DSI0 should be able to write normally. */
>   	if (!chan) {
>   		writel(val, dsi->regs + offset);
> @@ -645,7 +647,12 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
>   		DRM_ERROR("Failed to wait for DMA: %d\n", ret);
>   }
>   
> -#define DSI_READ(offset) readl(dsi->regs + (offset))
> +#define DSI_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(dsi->regs + (offset));						\
> +	})
> +
>   #define DSI_WRITE(offset, val) dsi_dma_workaround_write(dsi, offset, val)
>   #define DSI_PORT_READ(offset) \
>   	DSI_READ(dsi->variant->port ? DSI1_##offset : DSI0_##offset)
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> index 48db438550b1..b04b2fc8d831 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> @@ -456,6 +456,8 @@ static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
>   
>   	WARN_ON(pm_runtime_status_suspended(&hdmi->pdev->dev));
>   
> +	kunit_fail_current_test("Accessing an HDMI register in a unit test!\n");
> +
>   	if (reg >= variant->num_registers) {
>   		dev_warn(&hdmi->pdev->dev,
>   			 "Invalid register ID %u\n", reg);
> @@ -486,6 +488,8 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
>   
>   	WARN_ON(pm_runtime_status_suspended(&hdmi->pdev->dev));
>   
> +	kunit_fail_current_test("Accessing an HDMI register in a unit test!\n");
> +
>   	if (reg >= variant->num_registers) {
>   		dev_warn(&hdmi->pdev->dev,
>   			 "Invalid register ID %u\n", reg);
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 2b69454b8534..ef5cab2a3aa9 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -145,8 +145,17 @@
>   /* Number of lines received and committed to memory. */
>   #define TXP_PROGRESS		0x10
>   
> -#define TXP_READ(offset) readl(txp->regs + (offset))
> -#define TXP_WRITE(offset, val) writel(val, txp->regs + (offset))
> +#define TXP_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(txp->regs + (offset));						\
> +	})
> +
> +#define TXP_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, txp->regs + (offset));					\
> +	} while (0)
>   
>   struct vc4_txp {
>   	struct vc4_crtc	base;
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index e270a4099be3..f589ab918f4d 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -207,8 +207,17 @@ struct vc4_vec {
>   	struct debugfs_regset32 regset;
>   };
>   
> -#define VEC_READ(offset) readl(vec->regs + (offset))
> -#define VEC_WRITE(offset, val) writel(val, vec->regs + (offset))
> +#define VEC_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(vec->regs + (offset));						\
> +	})
> +
> +#define VEC_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, vec->regs + (offset));					\
> +	} while (0)
>   
>   static inline struct vc4_vec *
>   encoder_to_vc4_vec(struct drm_encoder *encoder)
> 
