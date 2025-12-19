Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3CCCF95C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3F10E465;
	Fri, 19 Dec 2025 11:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48F110E227
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 11:34:00 +0000 (UTC)
Received: from ehlo.thunderbird.net (161-51-78-170.static.ef-service.nl
 [161.51.78.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 88F811F548;
 Fri, 19 Dec 2025 12:33:59 +0100 (CET)
Date: Fri, 19 Dec 2025 12:34:00 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
User-Agent: Thunderbird for Android
In-Reply-To: <20251218-mdp5-drop-dpu3-v2-2-11299f1999d2@oss.qualcomm.com>
References: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
 <20251218-mdp5-drop-dpu3-v2-2-11299f1999d2@oss.qualcomm.com>
Message-ID: <8895EC9F-E1E3-487D-A8E5-F9909BEE0CCF@somainline.org>
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

On 18 December 2025 15:38:24 CET, Dmitry Baryshkov <dmitry=2Ebaryshkov@oss=
=2Equalcomm=2Ecom> wrote:
>DPU units before 4=2Ex don't have a separate CTL_START IRQ to mark the
>begin of the data transfer=2E In such a case, wait for the

Unfinished sentence=2E And would it make sense to note this down in a code=
-comment as well?

E=2Eg=2E

=2E=2E=2Ewait for the "transfer complete" IRQ if there's no CTL_START IRQ =
(or the ctl is already started)=2E

Is there a significant timing difference on the two irqs, or does it not m=
atter?

- Marijn

>
>Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode pan=
els")
>Reported-by: Alexey Minnekhanov <alexeymin@postmarketos=2Eorg>
>Closes: https://lore=2Ekernel=2Eorg/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d=
1@postmarketos=2Eorg
>Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@oss=2Equalcomm=2Ecom>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec b/dri=
vers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec
>index 0ec6d67c7c70=2E=2Ee6f55902e355 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=2Ec
>@@ -681,7 +681,8 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
> 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
> 		return 0;
>=20
>-	if (phys_enc->hw_ctl->ops=2Eis_started(phys_enc->hw_ctl))
>+	if (phys_enc->hw_ctl->ops=2Eis_started(phys_enc->hw_ctl) ||
>+	    !phys_enc->irq[INTR_IDX_CTL_START])
> 		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
>=20
> 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
>

