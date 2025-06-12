Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42774AD7771
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 18:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7086610E06D;
	Thu, 12 Jun 2025 16:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MDbN1/K5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1521710E06D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 16:04:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so12533355e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749744285; x=1750349085; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVt7yi9oobDjgSWlzKDtexUp1A9xv8eXiTMakhYwEZ8=;
 b=MDbN1/K55XpEEf1A29I+leqt9YlmNQsFXzNR+q2Y3uT2IAqMTP7FXgRVcT7h/CKO/A
 C0WtiLFp7TBsBEt9X0Kq91oL1xS4DhUiByH90Pe/+O4EzGWpwOsL1Dxu+bCioku0PdPN
 +whgBd/iEYDA4rU4eSla3eWSd70WrQNGAHJNIu0a2aINh119MKSIx4wDI0F2syGcktYA
 b9VR2r2muqJIcU+ccuV6mxeGsNoTtBkIBMMPXqHnIvNrLcAXz9Su18fNLk2SaP2kwzl4
 lgr9lQdH3bq95kfieXM2CRT53PxuKtbpiYr94r2fz7oBSZgadv4e49Uw/KcDy3e6LRm9
 AIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749744285; x=1750349085;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yVt7yi9oobDjgSWlzKDtexUp1A9xv8eXiTMakhYwEZ8=;
 b=MoQHaqc2di10I1PprtYBiI8T+BWiuqVYb7Wf8oeMECqgsOl5oCN8Xd9fTUktdYEFhD
 TOdZTWlr2Z8z7YdmCHb7MFQo+hwkFNgsZz4PLaq8TNFQ8ApTJtv89urZ1YJ0HNMZXR/b
 yDl70NtQHSOn/FKWKxz9s1ANVkXlOMfN9GB9qqQnZUsgJtr7GfPI2S6k/+1CsSA4V/PG
 j8jIApfoU0WZ/zqrTjhe8dYZLiqMvhRPSPgQpwBPfkuDyfNniRoQ/suQZsQfNpUNX0XU
 MUKn2bpfjroJ6kYIgjNa1eW0iTJGLlOW9GQ4x6IvLGX1AFzqZ1kaFafc9t6gIBNDLAfn
 hSKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdk8tHRka1h/zpspHkXGAvpRNh+05JlX96KbgmET/wXoVBUbwt7XG5KxZoO9PhgJ9EV5Q3dOXahZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCaKVBQfLGfpgtvlmyw7fZeraN3taEwSp4eoyeL9MjrIFasw7F
 dv2Or3AlE1GQ+nYzqxSydhByJTxARJuIV9zFKApdDEnI1Jb6zgkWVdNfJQCmZiAuOwo=
X-Gm-Gg: ASbGncsYUrm3c6j66fNpHaJfpS+BG7JRJoh5xy+28c0txFYEW4VVXj0JcpP7CUgNDAM
 b97RzQhtH6IuTKqyIl9iJRP6FgdlJL4/HVDyRg6Gfd15SnIyW7v7+MMkEG8PgQ4GwYXuR2ulws5
 XTbv4kTOu5ZvUqCriGQveroKsfEC1/j9QyChsvVmxlA8KHkggegYvTvhENOIcDbct83b3qixEYO
 VTqtp4JoaHUacXY6v52Y2c76xDR9Lsj4T5lsKyKEXzvjNgADdVwu9PSDT12eXNQteNADa/emlay
 AQdQdoG1GAaQ0zuAfPdzZMJmCg11IWZPcRx9L8mu6Num1XlJN44G3c9iqXtfGCjuukk=
X-Google-Smtp-Source: AGHT+IFJV6N61R7eQMpTQxieQIe+uvVO8hNtuqS1gL43rMcL+iiwLE0vyR8mjdp5Mfj8xXlJDzQq4w==
X-Received: by 2002:a05:600c:83c6:b0:453:2433:1c5b with SMTP id
 5b1f17b1804b1-4532486c53emr75837335e9.5.1749744284644; 
 Thu, 12 Jun 2025 09:04:44 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5619762dcsm2359430f8f.20.2025.06.12.09.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 09:04:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 17:04:43 +0100
Message-Id: <DAKOKYU9O323.M7OSA1CFHQWX@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robdclark@gmail.com>, "Sean Paul" <sean@poorly.run>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
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

On Mon Jun 9, 2025 at 7:24 PM BST, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
>
> v2: use %pOF
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_drv.c              |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.h              |  1 +
>  3 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 778e6ae7f137..0d12454b1f2e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -178,6 +178,26 @@ static int find_chipid(struct device_node *node, uin=
t32_t *chipid)
>  	return 0;
>  }
> =20
> +bool adreno_has_gpu(struct device_node *node)
> +{
> +	const struct adreno_info *info;
> +	uint32_t chip_id;
> +	int ret;
> +
> +	ret =3D find_chipid(node, &chip_id);
> +	if (ret)
> +		return false;
> +
> +	info =3D adreno_info(chip_id);
> +	if (!info) {
> +		pr_warn("%pOF: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
> +			node, ADRENO_CHIPID_ARGS(chip_id));
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int adreno_bind(struct device *dev, struct device *master, void *=
data)
>  {
>  	static struct adreno_platform_config config =3D {};
> @@ -188,18 +208,17 @@ static int adreno_bind(struct device *dev, struct d=
evice *master, void *data)
>  	int ret;
> =20
>  	ret =3D find_chipid(dev->of_node, &config.chip_id);
> -	if (ret)
> +	/* We shouldn't have gotten this far if we can't parse the chip_id */
> +	if (WARN_ON(ret))
>  		return ret;

I just hit this with linux-next on qrb2210 RB1 [1].

Is it expected an warning now or do we miss some device tree updates on
linux-next for RB1?

I don't recall seeing such warnings previously.

Thanks,
Alexey

[1]:

 msm_dpu 5e01000.display-controller: bound 5e94000.dsi (ops dsi_ops [msm])
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 242 at drivers/gpu/drm/msm/adreno/adreno_device.c:224=
 adreno_bind+0x90/0x120 [msm]
 Modules linked in: q6asm_dai q6routing q6afe_dai q6adm q6asm q6afe_clocks =
snd_q6dsp_common q6afe q6core apr pdr_interface qrtr_smd qcom_pd_mapper qco=
m_pdr_msg mcp251xfd ath10k_snoc snd_soc_wsa881x_i2c snd_soc_wsa881x_common =
can_dev lontium_lt9611uxc(+) ath10k_core ath mac80211 hci_uart btqca btbcm =
libarc4 msm snd_soc_sm8250 qrtr bluetooth drm_exec snd_soc_qcom_sdw qcom_q6=
v5_pas llcc_qcom snd_soc_qcom_common lmh qcom_wdt ocmem cfg80211 ecdh_gener=
ic qcom_pil_info pinctrl_sm6115_lpass_lpi gpu_sched ecc drm_display_helper =
rfkill qcom_q6v5 pinctrl_lpass_lpi qcom_sysmon pwrseq_core lpasscc_sm6115 d=
ispcc_qcm2290 qcom_common snd_soc_lpass_va_macro cec snd_soc_lpass_rx_macro=
 drm_dp_aux_bus snd_soc_lpass_tx_macro qcom_glink_smem gpucc_qcm2290 snd_so=
c_pm4125 mdt_loader snd_soc_lpass_macro_common qmi_helpers snd_soc_pm4125_s=
dw soundwire_qcom regmap_sdw slimbus qcom_pmic_tcpm qcom_usb_vbus_regulator=
 drm_client_lib tcpm rtc_pm8xxx snd_soc_wcd_mbhc aux_hpd_bridge qcom_pon qc=
rypto soundwire_bus sha256 qcom_stats gpi
  spi_geni_qcom i2c_qcom_geni rpmsg_ctrl libsha256_generic libsha256 rpmsg_=
char qcom_rng sha256_arm64 authenc icc_bwmon phy_qcom_qmp_usbc libdes typec=
 phy_qcom_qusb2 display_connector i2c_gpio rmtfs_mem drm_kms_helper socinfo=
 fuse drm backlight dm_mod ip_tables x_tables ipv6
 CPU: 0 UID: 0 PID: 242 Comm: (udev-worker) Not tainted 6.16.0-rc1-next-202=
50612-00025-g0ce0d3974333-dirty #2 PREEMPT=20
 Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
 pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
 pc : adreno_bind+0x90/0x120 [msm]
 lr : adreno_bind+0x50/0x120 [msm]
 sp : ffff8000813f3580
 x29: ffff8000813f3580 x28: ffff000008ae8800 x27: ffff000007c63700
 x26: ffffca4a2814b860 x25: ffff000008b26880 x24: ffffca4a24922000
 x23: ffffca4a249229d8 x22: ffff000009838800 x21: ffff000008b26880
 x20: ffff000002ce4410 x19: ffffca4a2495a710 x18: 0000000000000006
 x17: 6f5f697364207370 x16: 6f28206973642e30 x15: 0720072007200720
 x14: 0000000000000000 x13: 0000000000000000 x12: 0101010101010101
 x11: 7f7f7f7f7f7f7f7f x10: ffffca4a2866e1b2 x9 : 0000000000000002
 x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff2f383131
 x5 : ffff00007fc1b968 x4 : 0000000000000000 x3 : 000000000000001e
 x2 : 0000000000000001 x1 : 0000000007000200 x0 : ffffca4a2495a710
 Call trace:
  adreno_bind+0x90/0x120 [msm] (P)
  component_bind_all+0x100/0x23c
  msm_drm_bind+0x148/0x3e0 [msm]
  try_to_bring_up_aggregate_device+0x16c/0x1e0
  __component_add+0xa4/0x174
  component_add+0x14/0x20
  dsi_dev_attach+0x20/0x34 [msm]
  dsi_host_attach+0x58/0x98 [msm]
  devm_mipi_dsi_attach+0x34/0x90
  lt9611uxc_attach_dsi.isra.0+0x94/0x124 [lontium_lt9611uxc]
  lt9611uxc_probe+0x568/0x604 [lontium_lt9611uxc]
  i2c_device_probe+0x158/0x32c
  really_probe+0xbc/0x2b4
  __driver_probe_device+0x78/0x120
  driver_probe_device+0x3c/0x154
  __driver_attach+0x90/0x1a0
  bus_for_each_dev+0x68/0xb8
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x68/0x124
  i2c_register_driver+0x48/0xcc
  lt9611uxc_driver_init+0x20/0x1000 [lontium_lt9611uxc]
  do_one_initcall+0x60/0x1d4
  do_init_module+0x54/0x23c
  load_module+0x1730/0x1cc0
  init_module_from_file+0x74/0xa0
  __arm64_sys_finit_module+0x130/0x2f8
  invoke_syscall+0x48/0x104
  el0_svc_common.constprop.0+0xc0/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x2c/0x80
  el0t_64_sync_handler+0x10c/0x138
  el0t_64_sync+0x198/0x19c
 ---[ end trace 0000000000000000 ]---
 adreno 5900000.gpu: supply vdd not found, using dummy regulator
 adreno 5900000.gpu: supply vddcx not found, using dummy regulator
 msm_dpu 5e01000.display-controller: bound 5900000.gpu (ops a3xx_ops [msm])
 [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x60050000
 dummy 1-0045: No cache used with register defaults set!
 [drm] Initialized msm 1.12.0 for 5e01000.display-controller on minor 0
 msm_dpu 5e01000.display-controller: [drm:adreno_request_fw [msm]] loaded q=
com/a702_sqe.fw from new location


