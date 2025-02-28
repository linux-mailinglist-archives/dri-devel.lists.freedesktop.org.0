Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DCA4946C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA1810EC24;
	Fri, 28 Feb 2025 09:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CA910EC24
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:08:53 +0000 (UTC)
Received: from [127.0.0.1] (161-51-78-170.static.ef-service.nl [161.51.78.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 13C6D3EE67;
 Fri, 28 Feb 2025 10:08:48 +0100 (CET)
Date: Fri, 28 Feb 2025 10:08:47 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_8/8=5D_drm/msm/dpu=3A_drop_n?=
 =?US-ASCII?Q?ow-unused_condition_for_has=5Flegacy=5Fctls?=
User-Agent: Thunderbird for Android
In-Reply-To: <20250228-dpu-active-ctl-v2-8-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
 <20250228-dpu-active-ctl-v2-8-9a9df2ee5193@linaro.org>
Message-ID: <CA752964-870A-4DB9-A6F7-0E701EA24AB2@somainline.org>
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

On 28 February 2025 05:14:12 CET, Dmitry Baryshkov <dmitry=2Ebaryshkov@lina=
ro=2Eorg> wrote:
>Now as we have dropped the DPU_CTL_SPLIT_DISPLAY from DPU >=3D 5=2E0
>configuration, drop the rm->has_legacy_ctl condition which short-cutted
>the check for those platforms=2E
>
>Suggested-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>
>Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>---
>
>Note, it is imposible to reoder commits in any other sensible way=2E The

Reorder :)

>DPU_CTL_SPLIT_DISPLAY can not be dropped before the patch that enables
>single-CTL support=2E

Maybe I expected this note on patch 4/6 introducing it, but it disappears =
after merging anyway so that's a mega-nit=2E Thanks for sending this!

Reviewed-by: Marijn Suijten <marijn=2Esuijten@somainline=2Eorg>

>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm=2Ec
>index 4dbc9bc7eb4f151f83055220665ee5fd238ae7ba=2E=2E2557effe639b5360bc948=
a49b0cccdb59ee35dab 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm=2Ec
>@@ -410,8 +410,7 @@ static int _dpu_rm_reserve_ctls(
>=20
> 		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
>=20
>-		if (rm->has_legacy_ctls &&
>-		    needs_split_display !=3D has_split_display)
>+		if (needs_split_display !=3D has_split_display)
> 			continue;
>=20
> 		ctl_idx[i] =3D j;
>

