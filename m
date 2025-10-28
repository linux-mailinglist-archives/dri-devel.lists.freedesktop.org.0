Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16281C1311F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 07:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C75C10E589;
	Tue, 28 Oct 2025 06:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m9ydgKiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E9610E047
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 06:07:23 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b6cf3174ca4so3802225a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 23:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761631643; x=1762236443; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X3Mi6dBwQl7K+tk271ylyIVMo6R3DpX7lq7cC7Ipe/g=;
 b=m9ydgKiHXm78/2bJRidrhZlR1ys0v568yK9z9FSgrVfePpHSDQ6xMBHNyB7++XKhLf
 vIl2+VmoalKMXqYg5LAUU0bPERduYVhR3+HiDpvdjrFyy25vtwSQTl26AoWVXEML67oB
 oOdUrpXoWT+q9vertB71Dl0IBGagSJcZcisZDaguDWWLU3npVgRlqhjKGsge7i5kPCR+
 Ku9qNWOPJOC3kQpzTXs0f6WLrN6rD+RcaJ1wTfX7+Fjjb4WanWkQH140LPEbXJ+RNQHv
 tNoGwQgD4bmSC33SOL8Ma54yo9qvGM9baimqfXNs3LkxbJuXwpjwcrRUSm/HCbLebTOD
 CcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631643; x=1762236443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X3Mi6dBwQl7K+tk271ylyIVMo6R3DpX7lq7cC7Ipe/g=;
 b=FQiq8LKCfaIlnq31NKzQdSiitQPT9ifRb9f4OiAv8StMISz1/talKsAePURtKvGOFP
 vnwFH1g79kDX0KC5qv530cMO0qD1DJ2Fno1awLEMQQ7C7GGpiXioXNnbg8xMpbo1Y1uV
 sol4pOsNBgeb+XmzOc9vAqjMgcwM7qAXAmzGMjM1/oG0djGSZ95GzCg13lEheV5y3Tlj
 4HJ2zFJdBPSw3wsHhoT0GDxlsfv8XcMEYLvHz8CDAiHJuUbOfKt7bBilLAT/fNV6pz0/
 Gt2bJ/PQMoiT/KqiYdZQg70/5os4sHxbsTzOFCl0/LoBcx29/UCiYfKFNiE6cKiKgtK9
 SysQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSo0j/nv6D2/QGMH8SOZcW8Z4/HeuGrf4eL3Xwklnc074N40teWV3XN1TYNlJ0do49rVPZgRJTy/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmIuMsjXIqJh0CXhCrdSH2RGMj3Ze7T3Qx1+0s3P5sdz//E37d
 VYVd5iHlytCt9T8XgF+JZ62dTNnP+o04w3gUg2fmFeGLuAt5ftrCCLry
X-Gm-Gg: ASbGncuBaXjmg7l/pKKrzJSJxWLdhsUZDEx7laRXGLdgaBr83q4dZuAF9CDi0T31K5V
 HeitD+CxOoX+L3BjWI32MZgXPxSZkKCKh2qkuZ+x721IeYqPCg0hdqyp0+EM59gcl8T8u/QKljy
 xa1Yk0tBXwxRl2MZ7LFGHOOcWz8RwKm2x3boSLSR33OpHFq1TwD669KaL0+//X3vbqOVzHVNKHP
 wgSkKbWX/rA3CgnYHbxxRAhG4Inxi25QVq2WwI4Ro1OE7kuFjfhQ/f2fBhA/VIhC0FFOf4ORDBs
 f6/+Ug4F48IoOLhoPCf9jx+JU9QK76cYGayEPOkE8JEMhtgH8/XvzjkEk4h6+n37hWIrrMUYaxs
 xArBn/5a60vlZ58HlfqPXj8xr44KphTEtAjFpuhV1jvFC/QQ7BHRE629oA7UlN62vvweJ1Eco/s
 +3DDgon0fg0fquysh97FTODZScA0KNqMTvVjj4exfJrxFLOOXc347ugQ==
X-Google-Smtp-Source: AGHT+IEqDKe28CM1wcw1T5jIas5LPW4A4iQTrqZvLc/K2EgN8TV441SShFqZjxfapz7ZcPNUWZg1Vg==
X-Received: by 2002:a17:902:c945:b0:265:47:a7b0 with SMTP id
 d9443c01a7336-294cb37b969mr24029555ad.10.1761631643254; 
 Mon, 27 Oct 2025 23:07:23 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:1c69:7897:d90:375b?
 ([2600:8802:702:7400:1c69:7897:d90:375b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b71268bfaa1sm9237607a12.7.2025.10.27.23.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 23:07:22 -0700 (PDT)
Message-ID: <a4a7f1c9-1817-4092-9ab1-07209bb44125@gmail.com>
Date: Mon, 27 Oct 2025 23:07:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/23/2025 12:53 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Hi Yuanjie,

Can you reword the commit message title to be more clear on what this 
patch *does*? "Compatible with Kaanapali interrupt register" is vague.

Something like "Add interrupt registers for DPU 13.x" is a complete 
sentence and makes it clear that you're adding interrupt registers.

Thanks,

Jessica Zhang

> 
> DPU version 13 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>   1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 49bd77a755aa..8d265581f6ec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -40,6 +40,15 @@
>   #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
>   #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
>   
> +#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))
> +#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
> +#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
> +#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
> +#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
> +#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
> +#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
> +#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
> +
>   /**
>    * struct dpu_intr_reg - array of DPU register sets
>    * @clr_off:	offset to CLEAR reg
> @@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>   	},
>   };
>   
> +/*
> + * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
> + */
> +static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
> +	[MDP_SSPP_TOP0_INTR] = {
> +		INTR_CLEAR,
> +		INTR_EN,
> +		INTR_STATUS
> +	},
> +	[MDP_SSPP_TOP0_INTR2] = {
> +		INTR2_CLEAR,
> +		INTR2_EN,
> +		INTR2_STATUS
> +	},
> +	[MDP_SSPP_TOP0_HIST_INTR] = {
> +		HIST_INTR_CLEAR,
> +		HIST_INTR_EN,
> +		HIST_INTR_STATUS
> +	},
> +	[MDP_INTF0_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(0),
> +		MDP_INTF_REV_13xx_INTR_EN(0),
> +		MDP_INTF_REV_13xx_INTR_STATUS(0)
> +	},
> +	[MDP_INTF1_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(1),
> +		MDP_INTF_REV_13xx_INTR_EN(1),
> +		MDP_INTF_REV_13xx_INTR_STATUS(1)
> +	},
> +	[MDP_INTF1_TEAR_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
> +		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
> +		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
> +	},
> +	[MDP_INTF2_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(2),
> +		MDP_INTF_REV_13xx_INTR_EN(2),
> +		MDP_INTF_REV_13xx_INTR_STATUS(2)
> +	},
> +	[MDP_INTF2_TEAR_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
> +		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
> +		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
> +	},
> +	[MDP_INTF3_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(3),
> +		MDP_INTF_REV_13xx_INTR_EN(3),
> +		MDP_INTF_REV_13xx_INTR_STATUS(3)
> +	},
> +	[MDP_INTF4_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(4),
> +		MDP_INTF_REV_13xx_INTR_EN(4),
> +		MDP_INTF_REV_13xx_INTR_STATUS(4)
> +	},
> +	[MDP_INTF5_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(5),
> +		MDP_INTF_REV_13xx_INTR_EN(5),
> +		MDP_INTF_REV_13xx_INTR_STATUS(5)
> +	},
> +	[MDP_INTF6_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(6),
> +		MDP_INTF_REV_13xx_INTR_EN(6),
> +		MDP_INTF_REV_13xx_INTR_STATUS(6)
> +	},
> +	[MDP_INTF7_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(7),
> +		MDP_INTF_REV_13xx_INTR_EN(7),
> +		MDP_INTF_REV_13xx_INTR_STATUS(7)
> +	},
> +	[MDP_INTF8_INTR] = {
> +		MDP_INTF_REV_13xx_INTR_CLEAR(8),
> +		MDP_INTF_REV_13xx_INTR_EN(8),
> +		MDP_INTF_REV_13xx_INTR_STATUS(8)
> +	},
> +};
> +
>   #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
>   
>   static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
> @@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
>   	if (!intr)
>   		return ERR_PTR(-ENOMEM);
>   
> -	if (m->mdss_ver->core_major_ver >= 7)
> +	if (m->mdss_ver->core_major_ver >= 13)
> +		intr->intr_set = dpu_intr_set_13xx;
> +	else if (m->mdss_ver->core_major_ver >= 7)
>   		intr->intr_set = dpu_intr_set_7xxx;
>   	else
>   		intr->intr_set = dpu_intr_set_legacy;
