Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6FCCC3F4C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1217C10E04C;
	Tue, 16 Dec 2025 15:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CjsFCNJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F5A10E2CE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:32:48 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7bb2fa942daso439820b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 07:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765899168; x=1766503968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkhPh91ZY2hMYr441a2z2DOrRPSoQAqhkmD0EJY8UKw=;
 b=CjsFCNJb/V4ehfHpjJ/jz4jRlgL9xOBeCgaa11hfOYqDYCnXk10VOoArhq3MyhK3P5
 dfa2UycMaeR4Q9baWcnAbN0AdjUFNKdVQxa6H88Sr0aIkqFwaky1uy9ELf1T6JJzQxa3
 4OL4Gpng/sjRpmxhTS3AYKkAOG8Rh6O7ITbHWR1ZBBFQMDpuL47XqjrLXoqRlFBurB0q
 FHcL9GANEVe9AHMbNMDS43c//qCxrK3YguOAu44Tu2dj4Sj0DwOiRKZAdZ/RPRvWjA5H
 x6jNQqvL/t8u7/6uzL9Quad6zdo6Mjoa3v6KjZSUobiifK5bVHgthT6H9R5D/TUC6ffI
 lpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765899168; x=1766503968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KkhPh91ZY2hMYr441a2z2DOrRPSoQAqhkmD0EJY8UKw=;
 b=h2WdSpbSBZck0Q0XCtl/20WUCnceOjbqmtjamroF2upq1ymnvkmAVbY1P23eJhZD03
 rs5TX3G+nuNz85E1/UdO2kg3sg5HCUCKVSD3nSEdvjrVulCWtafwF2EO930gy6lJjx7N
 1DpcA1pobaWRUI9kwF691qMIXONrI8JgnoyE0Nzt2ilBQi0vkl9Nks6nq4hjy58/t5nb
 lOo09CHLiNK/RpcA5xa+lctFph+G1hT7FONqqujiiHIujyLyxcB579m/ug2uLocqg84S
 6LhZ29t/ZriZDvj4jLlOnJFeGncKfvWRpunRLAPIgwMRRNO+UjlTrGZVFsY/SzEPIwiP
 vPHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Vl4mvVK+WDUfwLEE4mTRvwjjPl+ftbzVftcUjvK+ILSY6tLcX52KrvM06Xo2Icm+Qo0m8F6ObsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4NCuAY60gGQnRrnjJJ1AaMmNYm4i+aAeMPuUuv1tYMWLSa05v
 MYnY1n5BMXZufPhofHe85rW6h1P0n4BsI0cgXXG+Q3CrgRglXx+UuRhaRLTeTv+wi/1Hr5Elqaj
 g4yiQ+miQaNJsXhHV6KuisE8f2aJXFFU=
X-Gm-Gg: AY/fxX5+8VcUc1E0FlrXqwiAB3TnKzkUEaLWjY7hWzKJF4niWBNP9YYNMfzj94SSz3U
 aAPc+VNXfr1vtkQikEL0NXsKLibaA3Mw38+9nroSk4WKS8jzuzVfCbQqnyT/6djUrX1hZwjfCJZ
 n/k61ucQ0zqp3v/OgFyG57MODXWRFvnzorFTBN7pq+1mMffQ6h9st7Aetiy/DE1rBOPXjcWVAZW
 sCZrihucUxiNAOAEhCjht9CtZrSIkQSEwZjxWKTZdORPBgIYP/S/zfCqPvGiMboHCKmNSJJ
X-Google-Smtp-Source: AGHT+IHhUgn023eZckLDJr66UWTv1KcKOxMhsR5XJTU744G0O42iJEjgUhlnEldsrY+9G87YNdyLX6VDcYBP8Tkw1wM=
X-Received: by 2002:a05:701b:2908:b0:11e:3e9:3e9b with SMTP id
 a92af1059eb24-11f34c1d3f5mr3414985c88.6.1765899167730; Tue, 16 Dec 2025
 07:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20251216103238.625468-1-abhiraj21put@gmail.com>
In-Reply-To: <20251216103238.625468-1-abhiraj21put@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Dec 2025 10:32:35 -0500
X-Gm-Features: AQt7F2ryiv1nPzitbcsupElTVxoT7HZ5mdi1PuYorzpZ3hssoGLTENzWeFukyhQ
Message-ID: <CADnq5_PuzCBWTD50ABObmq5tk+nQ=juKizFZwVXt3bmkEjmUNA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Convert legacy DRM logging in evergreen.c to
 drm_* helpers
To: Abhishek Rajput <abhiraj21put@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Applied.  Thanks!

On Tue, Dec 16, 2025 at 5:33=E2=80=AFAM Abhishek Rajput <abhiraj21put@gmail=
.com> wrote:
>
> Replace DRM_DEBUG(), DRM_ERROR(), and DRM_INFO() calls with the
> corresponding drm_dbg(), drm_err(), and drm_info() helpers in the
> radeon driver.
>
> The drm_*() logging helpers take a struct drm_device * argument,
> allowing the DRM core to prefix log messages with the correct device
> name and instance. This is required to correctly distinguish log
> messages on systems with multiple GPUs.
>
> This change aligns radeon with the DRM TODO item:
> "Convert logging to drm_* functions with drm_device parameter".
>
> Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
>
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/=
evergreen.c
> index bc4ab71613a5..3cbc6eedbf66 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -1630,6 +1630,7 @@ void evergreen_pm_misc(struct radeon_device *rdev)
>         int req_cm_idx =3D rdev->pm.requested_clock_mode_index;
>         struct radeon_power_state *ps =3D &rdev->pm.power_state[req_ps_id=
x];
>         struct radeon_voltage *voltage =3D &ps->clock_info[req_cm_idx].vo=
ltage;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         if (voltage->type =3D=3D VOLTAGE_SW) {
>                 /* 0xff0x are flags rather then an actual voltage */
> @@ -1638,7 +1639,7 @@ void evergreen_pm_misc(struct radeon_device *rdev)
>                 if (voltage->voltage && (voltage->voltage !=3D rdev->pm.c=
urrent_vddc)) {
>                         radeon_atom_set_voltage(rdev, voltage->voltage, S=
ET_VOLTAGE_TYPE_ASIC_VDDC);
>                         rdev->pm.current_vddc =3D voltage->voltage;
> -                       DRM_DEBUG("Setting: vddc: %d\n", voltage->voltage=
);
> +                       drm_dbg(ddev, "Setting: vddc: %d\n", voltage->vol=
tage);
>                 }
>
>                 /* starting with BTC, there is one state that is used for=
 both
> @@ -1659,7 +1660,7 @@ void evergreen_pm_misc(struct radeon_device *rdev)
>                 if (voltage->vddci && (voltage->vddci !=3D rdev->pm.curre=
nt_vddci)) {
>                         radeon_atom_set_voltage(rdev, voltage->vddci, SET=
_VOLTAGE_TYPE_ASIC_VDDCI);
>                         rdev->pm.current_vddci =3D voltage->vddci;
> -                       DRM_DEBUG("Setting: vddci: %d\n", voltage->vddci)=
;
> +                       drm_dbg(ddev, "Setting: vddci: %d\n", voltage->vd=
dci);
>                 }
>         }
>  }
> @@ -2168,6 +2169,7 @@ static void evergreen_program_watermarks(struct rad=
eon_device *rdev,
>         u32 pipe_offset =3D radeon_crtc->crtc_id * 16;
>         u32 tmp, arb_control3;
>         fixed20_12 a, b, c;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         if (radeon_crtc->base.enabled && num_heads && mode) {
>                 active_time =3D (u32) div_u64((u64)mode->crtc_hdisplay * =
1000000,
> @@ -2244,14 +2246,14 @@ static void evergreen_program_watermarks(struct r=
adeon_device *rdev,
>                     !evergreen_average_bandwidth_vs_available_bandwidth(&=
wm_high) ||
>                     !evergreen_check_latency_hiding(&wm_high) ||
>                     (rdev->disp_priority =3D=3D 2)) {
> -                       DRM_DEBUG_KMS("force priority a to high\n");
> +                       drm_dbg_kms(ddev, "force priority a to high\n");
>                         priority_a_cnt |=3D PRIORITY_ALWAYS_ON;
>                 }
>                 if (!evergreen_average_bandwidth_vs_dram_bandwidth_for_di=
splay(&wm_low) ||
>                     !evergreen_average_bandwidth_vs_available_bandwidth(&=
wm_low) ||
>                     !evergreen_check_latency_hiding(&wm_low) ||
>                     (rdev->disp_priority =3D=3D 2)) {
> -                       DRM_DEBUG_KMS("force priority b to high\n");
> +                       drm_dbg_kms(ddev, "force priority b to high\n");
>                         priority_b_cnt |=3D PRIORITY_ALWAYS_ON;
>                 }
>
> @@ -2401,6 +2403,7 @@ static int evergreen_pcie_gart_enable(struct radeon=
_device *rdev)
>  {
>         u32 tmp;
>         int r;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         if (rdev->gart.robj =3D=3D NULL) {
>                 dev_err(rdev->dev, "No VRAM object for PCIE GART.\n");
> @@ -2448,7 +2451,7 @@ static int evergreen_pcie_gart_enable(struct radeon=
_device *rdev)
>         WREG32(VM_CONTEXT1_CNTL, 0);
>
>         evergreen_pcie_gart_tlb_flush(rdev);
> -       DRM_INFO("PCIE GART of %uM enabled (table at 0x%016llX).\n",
> +       drm_info(ddev, "PCIE GART of %uM enabled (table at 0x%016llX).\n"=
,
>                  (unsigned)(rdev->mc.gtt_size >> 20),
>                  (unsigned long long)rdev->gart.table_addr);
>         rdev->gart.ready =3D true;
> @@ -2626,16 +2629,17 @@ static void evergreen_blank_dp_output(struct rade=
on_device *rdev,
>         unsigned stream_ctrl;
>         unsigned fifo_ctrl;
>         unsigned counter =3D 0;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         if (dig_fe >=3D ARRAY_SIZE(evergreen_dp_offsets)) {
> -               DRM_ERROR("invalid dig_fe %d\n", dig_fe);
> +               drm_err(ddev, "invalid dig_fe %d\n", dig_fe);
>                 return;
>         }
>
>         stream_ctrl =3D RREG32(EVERGREEN_DP_VID_STREAM_CNTL +
>                              evergreen_dp_offsets[dig_fe]);
>         if (!(stream_ctrl & EVERGREEN_DP_VID_STREAM_CNTL_ENABLE)) {
> -               DRM_ERROR("dig %d , should be enable\n", dig_fe);
> +               drm_err(ddev, "dig %d , should be enable\n", dig_fe);
>                 return;
>         }
>
> @@ -2652,7 +2656,7 @@ static void evergreen_blank_dp_output(struct radeon=
_device *rdev,
>                                      evergreen_dp_offsets[dig_fe]);
>         }
>         if (counter >=3D 32)
> -               DRM_ERROR("counter exceeds %d\n", counter);
> +               drm_err(ddev, "counter exceeds %d\n", counter);
>
>         fifo_ctrl =3D RREG32(EVERGREEN_DP_STEER_FIFO + evergreen_dp_offse=
ts[dig_fe]);
>         fifo_ctrl |=3D EVERGREEN_DP_STEER_FIFO_RESET;
> @@ -2998,10 +3002,11 @@ static int evergreen_cp_start(struct radeon_devic=
e *rdev)
>         struct radeon_ring *ring =3D &rdev->ring[RADEON_RING_TYPE_GFX_IND=
EX];
>         int r, i;
>         uint32_t cp_me;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         r =3D radeon_ring_lock(rdev, ring, 7);
>         if (r) {
> -               DRM_ERROR("radeon: cp failed to lock ring (%d).\n", r);
> +               drm_err(ddev, "radeon: cp failed to lock ring (%d).\n", r=
);
>                 return r;
>         }
>         radeon_ring_write(ring, PACKET3(PACKET3_ME_INITIALIZE, 5));
> @@ -3018,7 +3023,7 @@ static int evergreen_cp_start(struct radeon_device =
*rdev)
>
>         r =3D radeon_ring_lock(rdev, ring, evergreen_default_size + 19);
>         if (r) {
> -               DRM_ERROR("radeon: cp failed to lock ring (%d).\n", r);
> +               drm_err(ddev, "radeon: cp failed to lock ring (%d).\n", r=
);
>                 return r;
>         }
>
> @@ -3826,6 +3831,7 @@ u32 evergreen_gpu_check_soft_reset(struct radeon_de=
vice *rdev)
>  {
>         u32 reset_mask =3D 0;
>         u32 tmp;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         /* GRBM_STATUS */
>         tmp =3D RREG32(GRBM_STATUS);
> @@ -3884,7 +3890,7 @@ u32 evergreen_gpu_check_soft_reset(struct radeon_de=
vice *rdev)
>
>         /* Skip MC reset as it's mostly likely not hung, just busy */
>         if (reset_mask & RADEON_RESET_MC) {
> -               DRM_DEBUG("MC busy: 0x%08X, clearing.\n", reset_mask);
> +               drm_dbg(ddev, "MC busy: 0x%08X, clearing.\n", reset_mask)=
;
>                 reset_mask &=3D ~RADEON_RESET_MC;
>         }
>
> @@ -4495,6 +4501,7 @@ int evergreen_irq_set(struct radeon_device *rdev)
>         u32 grbm_int_cntl =3D 0;
>         u32 dma_cntl, dma_cntl1 =3D 0;
>         u32 thermal_int =3D 0;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         if (!rdev->irq.installed) {
>                 WARN(1, "Can't enable IRQ/MSI because no handler is insta=
lled\n");
> @@ -4520,40 +4527,40 @@ int evergreen_irq_set(struct radeon_device *rdev)
>         if (rdev->family >=3D CHIP_CAYMAN) {
>                 /* enable CP interrupts on all rings */
>                 if (atomic_read(&rdev->irq.ring_int[RADEON_RING_TYPE_GFX_=
INDEX])) {
> -                       DRM_DEBUG("evergreen_irq_set: sw int gfx\n");
> +                       drm_dbg(ddev, "%s : sw int gfx\n", __func__);
>                         cp_int_cntl |=3D TIME_STAMP_INT_ENABLE;
>                 }
>                 if (atomic_read(&rdev->irq.ring_int[CAYMAN_RING_TYPE_CP1_=
INDEX])) {
> -                       DRM_DEBUG("evergreen_irq_set: sw int cp1\n");
> +                       drm_dbg(ddev, "%s : sw int cp1\n", __func__);
>                         cp_int_cntl1 |=3D TIME_STAMP_INT_ENABLE;
>                 }
>                 if (atomic_read(&rdev->irq.ring_int[CAYMAN_RING_TYPE_CP2_=
INDEX])) {
> -                       DRM_DEBUG("evergreen_irq_set: sw int cp2\n");
> +                       drm_dbg(ddev, "%s : sw int cp2\n", __func__);
>                         cp_int_cntl2 |=3D TIME_STAMP_INT_ENABLE;
>                 }
>         } else {
>                 if (atomic_read(&rdev->irq.ring_int[RADEON_RING_TYPE_GFX_=
INDEX])) {
> -                       DRM_DEBUG("evergreen_irq_set: sw int gfx\n");
> +                       drm_dbg(ddev, "%s : sw int gfx\n", __func__);
>                         cp_int_cntl |=3D RB_INT_ENABLE;
>                         cp_int_cntl |=3D TIME_STAMP_INT_ENABLE;
>                 }
>         }
>
>         if (atomic_read(&rdev->irq.ring_int[R600_RING_TYPE_DMA_INDEX])) {
> -               DRM_DEBUG("r600_irq_set: sw int dma\n");
> +               drm_dbg(ddev, "r600_irq_set: sw int dma\n");
>                 dma_cntl |=3D TRAP_ENABLE;
>         }
>
>         if (rdev->family >=3D CHIP_CAYMAN) {
>                 dma_cntl1 =3D RREG32(CAYMAN_DMA1_CNTL) & ~TRAP_ENABLE;
>                 if (atomic_read(&rdev->irq.ring_int[CAYMAN_RING_TYPE_DMA1=
_INDEX])) {
> -                       DRM_DEBUG("r600_irq_set: sw int dma1\n");
> +                       drm_dbg(ddev, "r600_irq_set: sw int dma1\n");
>                         dma_cntl1 |=3D TRAP_ENABLE;
>                 }
>         }
>
>         if (rdev->irq.dpm_thermal) {
> -               DRM_DEBUG("dpm thermal\n");
> +               drm_dbg(ddev, "dpm thermal\n");
>                 thermal_int |=3D THERM_INT_MASK_HIGH | THERM_INT_MASK_LOW=
;
>         }
>
> @@ -4713,6 +4720,7 @@ int evergreen_irq_process(struct radeon_device *rde=
v)
>         bool queue_thermal =3D false;
>         u32 status, addr;
>         const char *event_name;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         if (!rdev->ih.enabled || rdev->shutdown)
>                 return IRQ_NONE;
> @@ -4725,7 +4733,7 @@ int evergreen_irq_process(struct radeon_device *rde=
v)
>                 return IRQ_NONE;
>
>         rptr =3D rdev->ih.rptr;
> -       DRM_DEBUG("evergreen_irq_process start: rptr %d, wptr %d\n", rptr=
, wptr);
> +       drm_dbg(ddev, "%s start: rptr %d, wptr %d\n", __func__, rptr, wpt=
r);
>
>         /* Order reading of wptr vs. reading of IH ring data */
>         rmb();
> @@ -4766,18 +4774,18 @@ int evergreen_irq_process(struct radeon_device *r=
dev)
>                                 mask =3D LB_D1_VLINE_INTERRUPT;
>                                 event_name =3D "vline";
>                         } else {
> -                               DRM_DEBUG("Unhandled interrupt: %d %d\n",
> +                               drm_dbg(ddev, "Unhandled interrupt: %d %d=
\n",
>                                           src_id, src_data);
>                                 break;
>                         }
>
>                         if (!(disp_int[crtc_idx] & mask)) {
> -                               DRM_DEBUG("IH: D%d %s - IH event w/o asse=
rted irq bit?\n",
> +                               drm_dbg(ddev, "IH: D%d %s - IH event w/o =
asserted irq bit?\n",
>                                           crtc_idx + 1, event_name);
>                         }
>
>                         disp_int[crtc_idx] &=3D ~mask;
> -                       DRM_DEBUG("IH: D%d %s\n", crtc_idx + 1, event_nam=
e);
> +                       drm_dbg(ddev, "IH: D%d %s\n", crtc_idx + 1, event=
_name);
>
>                         break;
>                 case 8: /* D1 page flip */
> @@ -4786,7 +4794,7 @@ int evergreen_irq_process(struct radeon_device *rde=
v)
>                 case 14: /* D4 page flip */
>                 case 16: /* D5 page flip */
>                 case 18: /* D6 page flip */
> -                       DRM_DEBUG("IH: D%d flip\n", ((src_id - 8) >> 1) +=
 1);
> +                       drm_dbg(ddev, "IH: D%d flip\n", ((src_id - 8) >> =
1) + 1);
>                         if (radeon_use_pflipirq > 0)
>                                 radeon_crtc_handle_flip(rdev, (src_id - 8=
) >> 1);
>                         break;
> @@ -4804,39 +4812,39 @@ int evergreen_irq_process(struct radeon_device *r=
dev)
>                                 event_name =3D "HPD_RX";
>
>                         } else {
> -                               DRM_DEBUG("Unhandled interrupt: %d %d\n",
> +                               drm_dbg(ddev, "Unhandled interrupt: %d %d=
\n",
>                                           src_id, src_data);
>                                 break;
>                         }
>
>                         if (!(disp_int[hpd_idx] & mask))
> -                               DRM_DEBUG("IH: IH event w/o asserted irq =
bit?\n");
> +                               drm_dbg(ddev, "IH: IH event w/o asserted =
irq bit?\n");
>
>                         disp_int[hpd_idx] &=3D ~mask;
> -                       DRM_DEBUG("IH: %s%d\n", event_name, hpd_idx + 1);
> +                       drm_dbg(ddev, "IH: %s%d\n", event_name, hpd_idx +=
 1);
>
>                         break;
>                 case 44: /* hdmi */
>                         afmt_idx =3D src_data;
>                         if (afmt_idx > 5) {
> -                               DRM_ERROR("Unhandled interrupt: %d %d\n",
> +                               drm_err(ddev, "Unhandled interrupt: %d %d=
\n",
>                                           src_id, src_data);
>                                 break;
>                         }
>
>                         if (!(afmt_status[afmt_idx] & AFMT_AZ_FORMAT_WTRI=
G))
> -                               DRM_DEBUG("IH: IH event w/o asserted irq =
bit?\n");
> +                               drm_dbg(ddev, "IH: IH event w/o asserted =
irq bit?\n");
>
>                         afmt_status[afmt_idx] &=3D ~AFMT_AZ_FORMAT_WTRIG;
>                         queue_hdmi =3D true;
> -                       DRM_DEBUG("IH: HDMI%d\n", afmt_idx + 1);
> +                       drm_dbg(ddev, "IH: HDMI%d\n", afmt_idx + 1);
>                         break;
>                 case 96:
> -                       DRM_ERROR("SRBM_READ_ERROR: 0x%x\n", RREG32(SRBM_=
READ_ERROR));
> +                       drm_err(ddev, "SRBM_READ_ERROR: 0x%x\n", RREG32(S=
RBM_READ_ERROR));
>                         WREG32(SRBM_INT_ACK, 0x1);
>                         break;
>                 case 124: /* UVD */
> -                       DRM_DEBUG("IH: UVD int: 0x%08x\n", src_data);
> +                       drm_dbg(ddev, "IH: UVD int: 0x%08x\n", src_data);
>                         radeon_fence_process(rdev, R600_RING_TYPE_UVD_IND=
EX);
>                         break;
>                 case 146:
> @@ -4857,11 +4865,11 @@ int evergreen_irq_process(struct radeon_device *r=
dev)
>                 case 176: /* CP_INT in ring buffer */
>                 case 177: /* CP_INT in IB1 */
>                 case 178: /* CP_INT in IB2 */
> -                       DRM_DEBUG("IH: CP int: 0x%08x\n", src_data);
> +                       drm_dbg(ddev, "IH: CP int: 0x%08x\n", src_data);
>                         radeon_fence_process(rdev, RADEON_RING_TYPE_GFX_I=
NDEX);
>                         break;
>                 case 181: /* CP EOP event */
> -                       DRM_DEBUG("IH: CP EOP\n");
> +                       drm_dbg(ddev, "IH: CP EOP\n");
>                         if (rdev->family >=3D CHIP_CAYMAN) {
>                                 switch (src_data) {
>                                 case 0:
> @@ -4878,30 +4886,30 @@ int evergreen_irq_process(struct radeon_device *r=
dev)
>                                 radeon_fence_process(rdev, RADEON_RING_TY=
PE_GFX_INDEX);
>                         break;
>                 case 224: /* DMA trap event */
> -                       DRM_DEBUG("IH: DMA trap\n");
> +                       drm_dbg(ddev, "IH: DMA trap\n");
>                         radeon_fence_process(rdev, R600_RING_TYPE_DMA_IND=
EX);
>                         break;
>                 case 230: /* thermal low to high */
> -                       DRM_DEBUG("IH: thermal low to high\n");
> +                       drm_dbg(ddev, "IH: thermal low to high\n");
>                         rdev->pm.dpm.thermal.high_to_low =3D false;
>                         queue_thermal =3D true;
>                         break;
>                 case 231: /* thermal high to low */
> -                       DRM_DEBUG("IH: thermal high to low\n");
> +                       drm_dbg(ddev, "IH: thermal high to low\n");
>                         rdev->pm.dpm.thermal.high_to_low =3D true;
>                         queue_thermal =3D true;
>                         break;
>                 case 233: /* GUI IDLE */
> -                       DRM_DEBUG("IH: GUI idle\n");
> +                       drm_dbg(ddev, "IH: GUI idle\n");
>                         break;
>                 case 244: /* DMA trap event */
>                         if (rdev->family >=3D CHIP_CAYMAN) {
> -                               DRM_DEBUG("IH: DMA1 trap\n");
> +                               drm_dbg(ddev, "IH: DMA1 trap\n");
>                                 radeon_fence_process(rdev, CAYMAN_RING_TY=
PE_DMA1_INDEX);
>                         }
>                         break;
>                 default:
> -                       DRM_DEBUG("Unhandled interrupt: %d %d\n", src_id,=
 src_data);
> +                       drm_dbg(ddev, "Unhandled interrupt: %d %d\n", src=
_id, src_data);
>                         break;
>                 }
>
> @@ -5000,6 +5008,7 @@ static int evergreen_startup(struct radeon_device *=
rdev)
>  {
>         struct radeon_ring *ring;
>         int r;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         /* enable pcie gen2 link */
>         evergreen_pcie_gen2_enable(rdev);
> @@ -5016,7 +5025,7 @@ static int evergreen_startup(struct radeon_device *=
rdev)
>         if (ASIC_IS_DCE5(rdev) && !rdev->pm.dpm_enabled) {
>                 r =3D ni_mc_load_microcode(rdev);
>                 if (r) {
> -                       DRM_ERROR("Failed to load MC firmware!\n");
> +                       drm_err(ddev, "Failed to load MC firmware!\n");
>                         return r;
>                 }
>         }
> @@ -5038,7 +5047,7 @@ static int evergreen_startup(struct radeon_device *=
rdev)
>                 rdev->rlc.cs_data =3D evergreen_cs_data;
>                 r =3D sumo_rlc_init(rdev);
>                 if (r) {
> -                       DRM_ERROR("Failed to init rlc BOs!\n");
> +                       drm_err(ddev, "Failed to init rlc BOs!\n");
>                         return r;
>                 }
>         }
> @@ -5071,7 +5080,7 @@ static int evergreen_startup(struct radeon_device *=
rdev)
>
>         r =3D r600_irq_init(rdev);
>         if (r) {
> -               DRM_ERROR("radeon: IH init failed (%d).\n", r);
> +               drm_err(ddev, "radeon: IH init failed (%d).\n", r);
>                 radeon_irq_kms_fini(rdev);
>                 return r;
>         }
> @@ -5109,7 +5118,7 @@ static int evergreen_startup(struct radeon_device *=
rdev)
>
>         r =3D radeon_audio_init(rdev);
>         if (r) {
> -               DRM_ERROR("radeon: audio init failed\n");
> +               drm_err(ddev, "radeon: audio init failed\n");
>                 return r;
>         }
>
> @@ -5119,6 +5128,7 @@ static int evergreen_startup(struct radeon_device *=
rdev)
>  int evergreen_resume(struct radeon_device *rdev)
>  {
>         int r;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         /* reset the asic, the gfx blocks are often in a bad state
>          * after the driver is unloaded or after a resume
> @@ -5141,7 +5151,7 @@ int evergreen_resume(struct radeon_device *rdev)
>         rdev->accel_working =3D true;
>         r =3D evergreen_startup(rdev);
>         if (r) {
> -               DRM_ERROR("evergreen startup failed on resume\n");
> +               drm_err(ddev, "evergreen startup failed on resume\n");
>                 rdev->accel_working =3D false;
>                 return r;
>         }
> @@ -5176,6 +5186,7 @@ int evergreen_suspend(struct radeon_device *rdev)
>  int evergreen_init(struct radeon_device *rdev)
>  {
>         int r;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         /* Read BIOS */
>         if (!radeon_get_bios(rdev)) {
> @@ -5201,7 +5212,7 @@ int evergreen_init(struct radeon_device *rdev)
>                         dev_err(rdev->dev, "Card not posted and no BIOS -=
 ignoring\n");
>                         return -EINVAL;
>                 }
> -               DRM_INFO("GPU not posted. posting now...\n");
> +               drm_info(ddev, "GPU not posted. posting now...\n");
>                 atom_asic_init(rdev->mode_info.atom_context);
>         }
>         /* init golden registers */
> @@ -5233,7 +5244,7 @@ int evergreen_init(struct radeon_device *rdev)
>                 if (!rdev->me_fw || !rdev->pfp_fw || !rdev->rlc_fw || !rd=
ev->mc_fw) {
>                         r =3D ni_init_microcode(rdev);
>                         if (r) {
> -                               DRM_ERROR("Failed to load firmware!\n");
> +                               drm_err(ddev, "Failed to load firmware!\n=
");
>                                 return r;
>                         }
>                 }
> @@ -5241,7 +5252,7 @@ int evergreen_init(struct radeon_device *rdev)
>                 if (!rdev->me_fw || !rdev->pfp_fw || !rdev->rlc_fw) {
>                         r =3D r600_init_microcode(rdev);
>                         if (r) {
> -                               DRM_ERROR("Failed to load firmware!\n");
> +                               drm_err(ddev, "Failed to load firmware!\n=
");
>                                 return r;
>                         }
>                 }
> @@ -5287,7 +5298,7 @@ int evergreen_init(struct radeon_device *rdev)
>          */
>         if (ASIC_IS_DCE5(rdev)) {
>                 if (!rdev->mc_fw && !(rdev->flags & RADEON_IS_IGP)) {
> -                       DRM_ERROR("radeon: MC ucode required for NI+.\n")=
;
> +                       drm_err(ddev, "radeon: MC ucode required for NI+.=
\n");
>                         return -EINVAL;
>                 }
>         }
> @@ -5323,6 +5334,7 @@ void evergreen_fini(struct radeon_device *rdev)
>  void evergreen_pcie_gen2_enable(struct radeon_device *rdev)
>  {
>         u32 link_width_cntl, speed_cntl;
> +       struct drm_device *ddev =3D rdev_to_drm(rdev);
>
>         if (radeon_pcie_gen2 =3D=3D 0)
>                 return;
> @@ -5343,11 +5355,11 @@ void evergreen_pcie_gen2_enable(struct radeon_dev=
ice *rdev)
>
>         speed_cntl =3D RREG32_PCIE_PORT(PCIE_LC_SPEED_CNTL);
>         if (speed_cntl & LC_CURRENT_DATA_RATE) {
> -               DRM_INFO("PCIE gen 2 link speeds already enabled\n");
> +               drm_info(ddev, "PCIE gen 2 link speeds already enabled\n"=
);
>                 return;
>         }
>
> -       DRM_INFO("enabling PCIE gen 2 link speeds, disable with radeon.pc=
ie_gen2=3D0\n");
> +       drm_info(ddev, "enabling PCIE gen 2 link speeds, disable with rad=
eon.pcie_gen2=3D0\n");
>
>         if ((speed_cntl & LC_OTHER_SIDE_EVER_SENT_GEN2) ||
>             (speed_cntl & LC_OTHER_SIDE_SUPPORTS_GEN2)) {
> --
> 2.43.0
>
