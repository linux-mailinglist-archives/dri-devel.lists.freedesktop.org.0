Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53BAD0BCBD
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF5510E913;
	Fri,  9 Jan 2026 18:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lMv78pFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22610E913;
 Fri,  9 Jan 2026 18:08:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9085943C03;
 Fri,  9 Jan 2026 18:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37486C4CEF1;
 Fri,  9 Jan 2026 18:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767982091;
 bh=dLaDk4A28vd+9dAphpzqG8U7UomWQsL8BpomS9WzYX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMv78pFuYBmz9R+uDzhDLQxxyfzJVieJkUn/t2oDyJoZST0tPAna76FVyhiWYvyIa
 t1v9FTPBRtoTPV4Qo3FSdpvXY8uGF4l+cDwCy4A8kPZYDlwQwn85GlzcX5EekDo+GM
 KD5VswRk6Z4scBOUBrWsTitkKi3cqJOHLqhJQSTiXlrRlGoFl8ejFT7o9BWUOjTxya
 dwLXZlYd3N6cbnqYYUjAyw9pfl0UeADaVEuHOY7P8C0CT4KPnKWUumFBQhcNA3vlma
 pGVyPB91jDcmTroCS0Tmo9XvVuRRS8fuCBiAtz3WyQ36980GhGrCpMMpHvy3LgHu5K
 VN8mg3Gkkbp+g==
Date: Fri, 9 Jan 2026 12:08:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] soc: qcom: smem: Expose DDR data from SMEM
Message-ID: <nsjzp77f7btdziurip3v6nu5utcwni253mrx6orkefz5mibb3s@cp7c6tv3joxk>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
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

On Thu, Jan 08, 2026 at 03:21:50PM +0100, Konrad Dybcio wrote:
> diff --git a/drivers/soc/qcom/smem_dramc.c b/drivers/soc/qcom/smem_dramc.c
[..]
> +struct ddr_regions_v5 {
> +	u32 ddr_region_num; /* We expect this to always be 4 or 6 */
> +	u64 ddr_rank0_size;
> +	u64 ddr_rank1_size;
> +	u64 ddr_cs0_start_addr;
> +	u64 ddr_cs1_start_addr;
> +	u32 highest_bank_addr_bit;

Aren't all these structs encoded in little endian? __leXX?

> +	struct ddr_region_v5 ddr_region[] __counted_by(ddr_region_num);

Was going to joke about this one, but realized that there's a
__counted_by_le()

> +};
> +
> +struct ddr_details_v5 {
> +	u8 manufacturer_id;
> +	u8 device_type;
> +	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
> +	struct ddr_freq_plan_v5 ddr_freq_tbl;
> +	u8 num_channels;
> +	u8 _padding;
> +	struct ddr_regions_v5 ddr_regions;
> +};
> +
> +/* V6 */
> +struct ddr_misc_info_v6 {
> +	u32 dsf_version;
> +	u32 reserved[10];
> +};
> +
> +/* V7 */
> +struct ddr_details_v7 {
> +	u8 manufacturer_id;
> +	u8 device_type;
> +	struct ddr_part_details ddr_params[MAX_CHAN_NUM];
> +	struct ddr_freq_plan_v5 ddr_freq_tbl;
> +	u8 num_channels;
> +	u8 sct_config;
> +	struct ddr_regions_v5 ddr_regions;
> +};
> +
> +/**
> + * qcom_smem_dram_get_hbb(): Get the Highest bank address bit
> + *
> + * Context: Check qcom_smem_is_available() before calling this function.
> + * Because __dram * is initialized by smem_dram_parse(), which is in turn
> + * called from * qcom_smem_probe(), __dram will only be NULL if the data
> + * couldn't have been found/interpreted correctly.
> + *
> + * Return: 0 on success, -ENODATA on failure.

Seems more like "highest bank bit on success, -ENODATA on failure.

> + */
> +int qcom_smem_dram_get_hbb(void)
> +{
> +	int hbb;
> +
> +	if (!__dram)
> +		return -ENODATA;
> +
> +	hbb = __dram->hbb;
> +	if (hbb == 0)
> +		return -ENODATA;
> +	else if (hbb < DDR_HBB_MIN || hbb > DDR_HBB_MAX)
> +		return -EINVAL;

Not really "Invalid argument", -ENODATA is probably better here as well.

> +
> +	return hbb;
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_dram_get_hbb);
> +
[..]
> +/* The structure contains no version field, so we have to perform some guesswork.. */
> +static int smem_dram_infer_struct_version(size_t size)
> +{
> +	/* Some early versions provided less bytes of less useful data */
> +	if (size < sizeof(struct ddr_details_v3))
> +		return -EINVAL;
> +
> +	if (size == sizeof(struct ddr_details_v3))
> +		return INFO_V3;
> +
> +	if (size == sizeof(struct ddr_details_v3)
> +		 + sizeof(struct ddr_freq_table))

Don't you find it weird to have the + after the wrap?

> +		return INFO_V3_WITH_14_FREQS;
> +
> +	if (size == sizeof(struct ddr_details_v4))
> +		return INFO_V4;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 4 * sizeof(struct ddr_region_v5))
> +		return INFO_V5;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 4 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_xbl2quantum_smem_data)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V5;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 6 * sizeof(struct ddr_region_v5))
> +		return INFO_V5_WITH_6_REGIONS;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 6 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_xbl2quantum_smem_data)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V5_WITH_6_REGIONS;
> +
> +	if (size == sizeof(struct ddr_details_v5)
> +		 + 6 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_misc_info_v6)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V6;
> +
> +	if (size == sizeof(struct ddr_details_v7)
> +		 + 4 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_misc_info_v6)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V7;
> +
> +	if (size == sizeof(struct ddr_details_v7)
> +		 + 6 * sizeof(struct ddr_region_v5)
> +		 + sizeof(struct ddr_misc_info_v6)
> +		 + sizeof(struct shub_freq_plan_entry))
> +		return INFO_V7_WITH_6_REGIONS;
> +
> +	return INFO_UNKNOWN;
> +}
> +
[..]
> +
> +struct dentry *smem_dram_parse(struct device *dev)
> +{
> +	struct dentry *debugfs_dir;
> +	enum ddr_info_version ver;
> +	struct smem_dram *dram;
> +	size_t actual_size;
> +	void *data = NULL;
> +
> +	/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
> +	data = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_DDR_INFO_ID, &actual_size);
> +	if (IS_ERR_OR_NULL(data))
> +		return ERR_PTR(-ENODATA);
> +
> +	ver = smem_dram_infer_struct_version(actual_size);
> +	if (ver < 0) {
> +		/* Some SoCs don't provide data that's useful for us */
> +		return ERR_PTR(-ENODATA);
> +	} else if (ver == INFO_UNKNOWN) {
> +		/* In other cases, we may not have added support for a newer struct revision */
> +		pr_err("Found an unknown type of DRAM info struct (size = %zu)\n", actual_size);

Is there a reason why this isn't dev_err(dev, ...)?

> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	dram = devm_kzalloc(dev, sizeof(*dram), GFP_KERNEL);
> +	if (!dram)
> +		return ERR_PTR(-ENOMEM);
> +
> +	switch (ver) {
> +	case INFO_V3:
> +		smem_dram_parse_v3_data(dram, data, false);
> +		break;
> +	case INFO_V3_WITH_14_FREQS:
> +		smem_dram_parse_v3_data(dram, data, true);
> +		break;
> +	case INFO_V4:
> +		smem_dram_parse_v4_data(dram, data);
> +		break;
> +	case INFO_V5:
> +	case INFO_V5_WITH_6_REGIONS:
> +	case INFO_V6:
> +		smem_dram_parse_v5_data(dram, data);
> +		break;
> +	case INFO_V7:
> +	case INFO_V7_WITH_6_REGIONS:
> +		smem_dram_parse_v7_data(dram, data);
> +		break;
> +	default:
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* Both the entry and its parent dir will be cleaned up by debugfs_remove_recursive */
> +	debugfs_dir = debugfs_create_dir("qcom_smem", NULL);
> +	debugfs_create_file("dram_frequencies", 0444, debugfs_dir, dram,
> +			    &smem_dram_frequencies_fops);
> +	debugfs_create_file("hbb", 0444, debugfs_dir, dram, &smem_hbb_fops);
> +
> +	/* If there was no failure so far, assign the global variable */
> +	__dram = dram;
> +
> +	return debugfs_dir;
> +}
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index f946e3beca21..223cd5090a2a 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -2,6 +2,8 @@
>  #ifndef __QCOM_SMEM_H__
>  #define __QCOM_SMEM_H__
>  
> +#include <linux/platform_device.h>

I'm not able to see why.

Regards,
Bjorn

> +
>  #define QCOM_SMEM_HOST_ANY -1
>  
>  bool qcom_smem_is_available(void);
> @@ -17,4 +19,6 @@ int qcom_smem_get_feature_code(u32 *code);
>  
>  int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
>  
> +int qcom_smem_dram_get_hbb(void);
> +
>  #endif
> 
> -- 
> 2.52.0
> 
