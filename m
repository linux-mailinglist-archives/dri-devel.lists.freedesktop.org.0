Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13D633705
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 09:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B058510E3A1;
	Tue, 22 Nov 2022 08:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Mon, 21 Nov 2022 22:41:34 UTC
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC03510E33D;
 Mon, 21 Nov 2022 22:41:34 +0000 (UTC)
Received: from [127.0.0.1] (bband-dyn193.178-41-216.t-com.sk [178.41.216.193])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8150C1F8A5;
 Mon, 21 Nov 2022 23:35:48 +0100 (CET)
Date: Mon, 21 Nov 2022 23:35:46 +0100
From: Martin Botka <martin.botka@somainline.org>
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_drm/msm/dpu=3A_Print_inte?=
 =?US-ASCII?Q?rrupt_index_in_addition_to_the_mask?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221121222456.437815-1-marijn.suijten@somainline.org>
References: <20221121222456.437815-1-marijn.suijten@somainline.org>
Message-ID: <60E46E34-763F-4D03-B0CC-70B5A8AA660D@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Nov 2022 08:27:33 +0000
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On November 21, 2022 11:24:55 PM GMT+01:00, Marijn Suijten <marijn=2Esuijt=
en@somainline=2Eorg> wrote:
>The mask only describes the `irq_idx % 32` part, making it generally
>impossible to deduce what interrupt is being enabled/disabled=2E  Since
>`debug/core_irq` in debugfs (and other prints) also include the full
>`DPU_IRQ_IDX()` value, print the same full value here for easier
>correlation instead of only adding the `irq_idx / 32` part=2E
>
>Furthermore, make the dbgstr messages more consistent=2E
>
>Signed-off-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts=2Ec | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts=2Ec b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts=2Ec
>index cf1b6d84c18a=2E=2E64589a9c2c51 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts=2Ec
>@@ -252,9 +252,9 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_h=
w_intr *intr, int irq_idx)
>=20
> 	cache_irq_mask =3D intr->cache_irq_mask[reg_idx];
> 	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
>-		dbgstr =3D "DPU IRQ already set:";
>+		dbgstr =3D "already ";
> 	} else {
>-		dbgstr =3D "DPU IRQ enabled:";
>+		dbgstr =3D "";
>=20
> 		cache_irq_mask |=3D DPU_IRQ_MASK(irq_idx);
> 		/* Cleaning any pending interrupt */
>@@ -268,7 +268,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_h=
w_intr *intr, int irq_idx)
> 		intr->cache_irq_mask[reg_idx] =3D cache_irq_mask;
> 	}
>=20
>-	pr_debug("%s MASK:0x%=2E8lx, CACHE-MASK:0x%=2E8x\n", dbgstr,
>+	pr_debug("DPU IRQ %d %senabled: MASK:0x%=2E8lx, CACHE-MASK:0x%=2E8x\n",=
 irq_idx, dbgstr,
> 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
>=20
> 	return 0;
>@@ -301,9 +301,9 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_=
hw_intr *intr, int irq_idx)
>=20
> 	cache_irq_mask =3D intr->cache_irq_mask[reg_idx];
> 	if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) =3D=3D 0) {
>-		dbgstr =3D "DPU IRQ is already cleared:";
>+		dbgstr =3D "already ";
> 	} else {
>-		dbgstr =3D "DPU IRQ mask disable:";
>+		dbgstr =3D "";
>=20
> 		cache_irq_mask &=3D ~DPU_IRQ_MASK(irq_idx);
> 		/* Disable interrupts based on the new mask */
>@@ -317,7 +317,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_=
hw_intr *intr, int irq_idx)
> 		intr->cache_irq_mask[reg_idx] =3D cache_irq_mask;
> 	}
>=20
>-	pr_debug("%s MASK:0x%=2E8lx, CACHE-MASK:0x%=2E8x\n", dbgstr,
>+	pr_debug("DPU IRQ %d %sdisabled: MASK:0x%=2E8lx, CACHE-MASK:0x%=2E8x\n"=
, irq_idx, dbgstr,
> 			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
>=20
> 	return 0;

Looks good to me=2E

Reviewed-by: Martin Botka <martin=2Ebotka@somainline=2Eorg>
