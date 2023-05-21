Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6170AF6B
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 20:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2708F10E1EE;
	Sun, 21 May 2023 18:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8F810E1EE
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 18:14:35 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7EE6E3EBDD;
 Sun, 21 May 2023 20:14:32 +0200 (CEST)
Date: Sun, 21 May 2023 20:14:31 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dpu: drop debugfs regset32 support
Message-ID: <oxorfp2txvw6azzmq2xvehrvqhi3xyhmxsspnycvg72fevrgnb@jdr332tv5s4t>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <20230521172147.4163085-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521172147.4163085-2-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-21 20:21:47, Dmitry Baryshkov wrote:
> Drop the custom DPU's dpu_debugfs_create_regset32() function. With the
> SSPP user being gone, there is no need in this function. While we are at
> it also drop unused debugfs declarations from dpu_kms.h.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 65 -------------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 48 ------------------
>  2 files changed, 113 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index a4293dc0b61b..26597fcb2a09 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -186,71 +186,6 @@ static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
>  
>  }
>  
> -/*
> - * Companion structure for dpu_debugfs_create_regset32.
> - */
> -struct dpu_debugfs_regset32 {
> -	uint32_t offset;
> -	uint32_t blk_len;
> -	struct dpu_kms *dpu_kms;
> -};
> -
> -static int dpu_regset32_show(struct seq_file *s, void *data)
> -{
> -	struct dpu_debugfs_regset32 *regset = s->private;
> -	struct dpu_kms *dpu_kms = regset->dpu_kms;
> -	void __iomem *base;
> -	uint32_t i, addr;
> -
> -	if (!dpu_kms->mmio)
> -		return 0;
> -
> -	base = dpu_kms->mmio + regset->offset;
> -
> -	/* insert padding spaces, if needed */
> -	if (regset->offset & 0xF) {
> -		seq_printf(s, "[%x]", regset->offset & ~0xF);
> -		for (i = 0; i < (regset->offset & 0xF); i += 4)
> -			seq_puts(s, "         ");
> -	}
> -
> -	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -
> -	/* main register output */
> -	for (i = 0; i < regset->blk_len; i += 4) {
> -		addr = regset->offset + i;
> -		if ((addr & 0xF) == 0x0)
> -			seq_printf(s, i ? "\n[%x]" : "[%x]", addr);
> -		seq_printf(s, " %08x", readl_relaxed(base + i));
> -	}
> -	seq_puts(s, "\n");
> -	pm_runtime_put_sync(&dpu_kms->pdev->dev);
> -
> -	return 0;
> -}
> -DEFINE_SHOW_ATTRIBUTE(dpu_regset32);
> -
> -void dpu_debugfs_create_regset32(const char *name, umode_t mode,
> -		void *parent,
> -		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms)
> -{
> -	struct dpu_debugfs_regset32 *regset;
> -
> -	if (WARN_ON(!name || !dpu_kms || !length))
> -		return;
> -
> -	regset = devm_kzalloc(&dpu_kms->pdev->dev, sizeof(*regset), GFP_KERNEL);
> -	if (!regset)
> -		return;
> -
> -	/* make sure offset is a multiple of 4 */
> -	regset->offset = round_down(offset, 4);
> -	regset->blk_len = length;
> -	regset->dpu_kms = dpu_kms;
> -
> -	debugfs_create_file(name, mode, parent, regset, &dpu_regset32_fops);
> -}
> -
>  static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
>  {
>  	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 797b4ff3e806..66209e2448d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -141,54 +141,6 @@ struct dpu_global_state
>  struct dpu_global_state
>  	*__must_check dpu_kms_get_global_state(struct drm_atomic_state *s);
>  
> -/**
> - * Debugfs functions - extra helper functions for debugfs support
> - *
> - * Main debugfs documentation is located at,
> - *
> - * Documentation/filesystems/debugfs.rst
> - *
> - * @dpu_debugfs_create_regset32: Create 32-bit register dump file
> - */
> -
> -/**
> - * dpu_debugfs_create_regset32 - Create register read back file for debugfs
> - *
> - * This function is almost identical to the standard debugfs_create_regset32()
> - * function, with the main difference being that a list of register
> - * names/offsets do not need to be provided. The 'read' function simply outputs
> - * sequential register values over a specified range.
> - *
> - * @name:   File name within debugfs
> - * @mode:   File mode within debugfs
> - * @parent: Parent directory entry within debugfs, can be NULL
> - * @offset: sub-block offset
> - * @length: sub-block length, in bytes
> - * @dpu_kms: pointer to dpu kms structure
> - */
> -void dpu_debugfs_create_regset32(const char *name, umode_t mode,
> -		void *parent,
> -		uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms);
> -
> -/**
> - * dpu_debugfs_get_root - Return root directory entry for KMS's debugfs
> - *
> - * The return value should be passed as the 'parent' argument to subsequent
> - * debugfs create calls.
> - *
> - * @dpu_kms: Pointer to DPU's KMS structure
> - *
> - * Return: dentry pointer for DPU's debugfs location
> - */
> -void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
> -
> -/**
> - * DPU info management functions
> - * These functions/definitions allow for building up a 'dpu_info' structure
> - * containing one or more "key=value\n" entries.
> - */
> -#define DPU_KMS_INFO_MAX_SIZE	4096
> -
>  /**
>   * Vblank enable/disable functions
>   */
> -- 
> 2.39.2
> 
