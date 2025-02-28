Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28EA494C7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6B610EC22;
	Fri, 28 Feb 2025 09:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4310EC26
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:23:56 +0000 (UTC)
Received: from [127.0.0.1] (161-51-78-170.static.ef-service.nl [161.51.78.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6CDB03F26F;
 Fri, 28 Feb 2025 10:23:55 +0100 (CET)
Date: Fri, 28 Feb 2025 10:23:54 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] drm/msm/dpu: program master INTF value
User-Agent: Thunderbird for Android
In-Reply-To: <20250228-dpu-active-ctl-v2-2-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
 <20250228-dpu-active-ctl-v2-2-9a9df2ee5193@linaro.org>
Message-ID: <CAACA6C8-441A-4B6E-AC07-A46094A02126@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 28 February 2025 05:14:06 CET, Dmitry Baryshkov <dmitry=2Ebaryshkov@lina=
ro=2Eorg> wrote:
>If several interfaces are being handled through a single CTL, a main
>('master') INTF needs to be programmed into a separate register=2E Write
>corresponding value into that register=2E
>
>Co-developed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Signed-off-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec | 12 ++++++++++++
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh |  2 ++
> 2 files changed, 14 insertions(+)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_hw_ctl=2Ec
>index 32ab33b314fc44e12ccb935c1695d2eea5c7d9b2=2E=2Effff60c4206c6f2833293=
fdcc56b653f7d3124a5 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Ec
>@@ -583,6 +583,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl =
*ctx,
> 	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> 	DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE, merge_3d_active);
>=20
>+	if (cfg->intf_master)
>+		DPU_REG_WRITE(c, CTL_INTF_MASTER, BIT(cfg->intf_master - INTF_0));
>+
> 	if (cfg->cdm)
> 		DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
> }
>@@ -625,6 +628,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_h=
w_ctl *ctx,
> {
> 	struct dpu_hw_blk_reg_map *c =3D &ctx->hw;
> 	u32 intf_active =3D 0;
>+	u32 intf_master =3D 0;
> 	u32 wb_active =3D 0;
> 	u32 merge3d_active =3D 0;
> 	u32 dsc_active;
>@@ -651,6 +655,14 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_=
hw_ctl *ctx,
> 		intf_active =3D DPU_REG_READ(c, CTL_INTF_ACTIVE);
> 		intf_active &=3D ~BIT(cfg->intf - INTF_0);
> 		DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
>+
>+		intf_master =3D DPU_REG_READ(c, CTL_INTF_MASTER);
>+
>+		/* Unset this intf as master, if it is the current master */
>+		if (intf_master =3D=3D BIT(cfg->intf - INTF_0)) {
>+			DPU_DEBUG_DRIVER("Unsetting INTF_%d master\n", cfg->intf - INTF_0);

Don't think you want to include my testing ramblings here: we didn't print=
 a message either when the master was _set_, and don't print messages for o=
ther register writes either=2E

After that:

Reviewed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>

>+			DPU_REG_WRITE(c, CTL_INTF_MASTER, 0);
>+		}
> 	}
>=20
> 	if (cfg->wb) {
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_hw_ctl=2Eh
>index 85c6c835cc8780e6cb66f3a262d9897c91962935=2E=2Ee95989a2fdda6344d0cb9=
d3036e6ed22a0458675 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl=2Eh
>@@ -36,6 +36,7 @@ struct dpu_hw_stage_cfg {
> /**
>  * struct dpu_hw_intf_cfg :Describes how the DPU writes data to output i=
nterface
>  * @intf :                 Interface id
>+ * @intf_master:           Master interface id in the dual pipe topology

Not sure if you've seen my comment in v1 about the dual word; maybe the qu=
adpipe series can update it since they might need a master (or two?) as wel=
l?

- Marijn

>  * @mode_3d:               3d mux configuration
>  * @merge_3d:              3d merge block used
>  * @intf_mode_sel:         Interface mode, cmd / vid
>@@ -45,6 +46,7 @@ struct dpu_hw_stage_cfg {
>  */
> struct dpu_hw_intf_cfg {
> 	enum dpu_intf intf;
>+	enum dpu_intf intf_master;
> 	enum dpu_wb wb;
> 	enum dpu_3d_blend_mode mode_3d;
> 	enum dpu_merge_3d merge_3d;
>

