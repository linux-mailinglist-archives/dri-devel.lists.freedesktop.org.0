Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BDF2A3479
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 20:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED886E0BE;
	Mon,  2 Nov 2020 19:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5A26E0BE;
 Mon,  2 Nov 2020 19:43:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k10so14644485wrw.13;
 Mon, 02 Nov 2020 11:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f6IxraRxxdSog0pizitTRE7WWJiT5BOAX8ryhNU1NRQ=;
 b=VE4XXdGU8dJOhXS0df4gzIUa6WS+ia5T1R9HtsqvcLzEc19f5G22wX8cdUuvh1t4Aj
 oA2mShqlCi+ap0GIx3OV/gvMk9mBtgowaTKUAdvgl+ZMmoTHfq0iX94q9Yot+fmtgJiY
 ADzzadXm3vv7CfN5+jO6Fc2iuegatwOKEZwuWf1EEtzFl3EqYMCAk0bcMdQ8GHiIk3l6
 pmnFqEfUKSdzKInQ+Jz/SvlRum4GjYGTzEX9Ck/ndx54ymdapK308qrxEFA5j8feWz1z
 weE/unWrmE8WvBWellDKcXYg/sysFXHGwOImAAd+Zit4qrbDRMdmD6uowwr4pmxlu/O4
 /P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f6IxraRxxdSog0pizitTRE7WWJiT5BOAX8ryhNU1NRQ=;
 b=ezRBxW75B2U/XCLcIslmbwV0SeXBhiVhlgumd9/HcPWMs7RzBklE2tZBDLGDvFVhYQ
 SoOqUNCHCMQolFAh7bm8QVMNnZTOgtxjUqnIqWcOXCu5+RSjswXv0id8uR3zboVvj2am
 sRGx+v3mzC+bRWv431DDBKgmTYYzvMYh+/TvZ3yuTi7hotJuYFq+E4iFVTAS/XSgBYtL
 iVSNCCcaokreB69a/+sMsYQsv4u1f5Ax5t2Iwg25Yx6U2hsNh9bY8jW7jD2GwFfuhiNZ
 /pnugX1k6fb86D56tFF4SJ15h2i9UZETxLHeZ6YKvPGalwaM6IajdE0HG0HkhHKTImEc
 dJow==
X-Gm-Message-State: AOAM531G4Xl+4KVvEbdHRTatRcak3HIeswLjUySZzd4Lu6Nn58zdCPq7
 dECtBQ1CgJY8ogRxbblirUT9tkhNGMjMrufT/Uk=
X-Google-Smtp-Source: ABdhPJw78jtdtZ6xpKIYXTw9wOhl0vAPW7uN5ackYLXnSo41LINFhWGQviyc5uG6uHsW7YR8EsHqWn6a1bPM83bcQc0=
X-Received: by 2002:adf:f246:: with SMTP id b6mr21844385wrp.111.1604346236857; 
 Mon, 02 Nov 2020 11:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20201102184147.GA42288@localhost>
In-Reply-To: <20201102184147.GA42288@localhost>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2020 14:43:45 -0500
Message-ID: <CADnq5_OnA3T_p4pTEOpoqQ=NZyso2VFoDiOHu=+h7dKOeKHq-A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: do not initialise global variables to 0 or
 NULL
To: Deepak R Varma <mh12gx2825@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 1:42 PM Deepak R Varma <mh12gx2825@gmail.com> wrote:
>
> Initializing global variable to 0 or NULL is not necessary and should
> be avoided. Issue reported by checkpatch script as:
> ERROR: do not initialise globals to 0 (or NULL).

I agree that this is technically correct, but a lot of people don't
seem to know that so we get a lot of comments about this code for the
variables that are not explicitly set.  Seems less confusing to
initialize them even if it not necessary.  I don't have a particularly
strong opinion on it however.

Alex

>
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 46 ++++++++++++-------------
>  drivers/gpu/drm/amd/amdgpu/atom.c       |  4 +--
>  2 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 8ab6126ff70c..6de94c46bc91 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -94,16 +94,16 @@
>  #define KMS_DRIVER_MINOR       40
>  #define KMS_DRIVER_PATCHLEVEL  0
>
> -int amdgpu_vram_limit = 0;
> -int amdgpu_vis_vram_limit = 0;
> +int amdgpu_vram_limit;
> +int amdgpu_vis_vram_limit;
>  int amdgpu_gart_size = -1; /* auto */
>  int amdgpu_gtt_size = -1; /* auto */
>  int amdgpu_moverate = -1; /* auto */
> -int amdgpu_benchmarking = 0;
> -int amdgpu_testing = 0;
> +int amdgpu_benchmarking;
> +int amdgpu_testing;
>  int amdgpu_audio = -1;
> -int amdgpu_disp_priority = 0;
> -int amdgpu_hw_i2c = 0;
> +int amdgpu_disp_priority;
> +int amdgpu_hw_i2c;
>  int amdgpu_pcie_gen2 = -1;
>  int amdgpu_msi = -1;
>  char amdgpu_lockup_timeout[AMDGPU_MAX_TIMEOUT_PARAM_LENGTH];
> @@ -113,43 +113,43 @@ int amdgpu_aspm = -1;
>  int amdgpu_runtime_pm = -1;
>  uint amdgpu_ip_block_mask = 0xffffffff;
>  int amdgpu_bapm = -1;
> -int amdgpu_deep_color = 0;
> +int amdgpu_deep_color;
>  int amdgpu_vm_size = -1;
>  int amdgpu_vm_fragment_size = -1;
>  int amdgpu_vm_block_size = -1;
> -int amdgpu_vm_fault_stop = 0;
> -int amdgpu_vm_debug = 0;
> +int amdgpu_vm_fault_stop;
> +int amdgpu_vm_debug;
>  int amdgpu_vm_update_mode = -1;
> -int amdgpu_exp_hw_support = 0;
> +int amdgpu_exp_hw_support;
>  int amdgpu_dc = -1;
>  int amdgpu_sched_jobs = 32;
>  int amdgpu_sched_hw_submission = 2;
> -uint amdgpu_pcie_gen_cap = 0;
> -uint amdgpu_pcie_lane_cap = 0;
> +uint amdgpu_pcie_gen_cap;
> +uint amdgpu_pcie_lane_cap;
>  uint amdgpu_cg_mask = 0xffffffff;
>  uint amdgpu_pg_mask = 0xffffffff;
>  uint amdgpu_sdma_phase_quantum = 32;
> -char *amdgpu_disable_cu = NULL;
> -char *amdgpu_virtual_display = NULL;
> +char *amdgpu_disable_cu;
> +char *amdgpu_virtual_display;
>  /* OverDrive(bit 14) disabled by default*/
>  uint amdgpu_pp_feature_mask = 0xffffbfff;
> -uint amdgpu_force_long_training = 0;
> -int amdgpu_job_hang_limit = 0;
> +uint amdgpu_force_long_training;
> +int amdgpu_job_hang_limit;
>  int amdgpu_lbpw = -1;
>  int amdgpu_compute_multipipe = -1;
>  int amdgpu_gpu_recovery = -1; /* auto */
> -int amdgpu_emu_mode = 0;
> -uint amdgpu_smu_memory_pool_size = 0;
> +int amdgpu_emu_mode;
> +uint amdgpu_smu_memory_pool_size;
>  /* FBC (bit 0) disabled by default*/
> -uint amdgpu_dc_feature_mask = 0;
> -uint amdgpu_dc_debug_mask = 0;
> +uint amdgpu_dc_feature_mask;
> +uint amdgpu_dc_debug_mask;
>  int amdgpu_async_gfx_ring = 1;
> -int amdgpu_mcbp = 0;
> +int amdgpu_mcbp;
>  int amdgpu_discovery = -1;
> -int amdgpu_mes = 0;
> +int amdgpu_mes;
>  int amdgpu_noretry = -1;
>  int amdgpu_force_asic_type = -1;
> -int amdgpu_tmz = 0;
> +int amdgpu_tmz;
>  int amdgpu_reset_method = -1; /* auto */
>  int amdgpu_num_kcq = -1;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
> index 696e97ab77eb..46c00ee580b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> @@ -66,7 +66,7 @@ typedef struct {
>         bool abort;
>  } atom_exec_context;
>
> -int amdgpu_atom_debug = 0;
> +int amdgpu_atom_debug;
>  static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index, uint32_t * params);
>  int amdgpu_atom_execute_table(struct atom_context *ctx, int index, uint32_t * params);
>
> @@ -88,7 +88,7 @@ static int atom_dst_to_src[8][4] = {
>  };
>  static int atom_def_dst[8] = { 0, 0, 1, 2, 0, 1, 2, 3 };
>
> -static int debug_depth = 0;
> +static int debug_depth;
>  #ifdef ATOM_DEBUG
>  static void debug_print_spaces(int n)
>  {
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
