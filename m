Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F043AAC3FE8
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CBF10E37E;
	Mon, 26 May 2025 12:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mbdof1iD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7010E374;
 Mon, 26 May 2025 12:58:22 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9qPkR015219;
 Mon, 26 May 2025 12:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9L65B9cAXkrXNycFsx+oz14Vk89MX3SAUsF1qlfrcMM=; b=mbdof1iD0bvrWDN+
 49CWUOA+Qj6NQ0x09L6JfrZDcG9r0aaVuPjMYCVF6z8xSUZU0nr1rsDahjMfJqP1
 jBgQcyDnGqFc/8JmpqoWpGjkGyvIBRRcDQb+wj5bGZqYKiq1xMnHgMWfFYiRbReL
 9TTbOyt/DN1V7FyCMfbeuniUvdKxspYK0gs1JWn/1bgYitAgLjPnAcPxeWVDSnKn
 ejtsB1qEwZHjJZf1uB7wR/FOrte81mLDU58vMcdV+EiQgKTSPM5aFqurYBnZLnsr
 1vFWoeWV4PpQfE6Cl+64xNo7+HdMH4TTmjE7IUpPA49COdYTvn9tsOsSy69FNY8R
 Vmu9Sw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wccc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 May 2025 12:57:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54QCvibr027574
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 May 2025 12:57:44 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 May
 2025 05:57:38 -0700
Message-ID: <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
Date: Mon, 26 May 2025 20:57:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/45] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>, Rob Clark
 <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-17-f8618d42a99a@quicinc.com>
 <45awcx2az5m5v4etpuaycqx2dolzjkrcjg6ehmooivwuqb6ac3@euo7rsoccqup>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <45awcx2az5m5v4etpuaycqx2dolzjkrcjg6ehmooivwuqb6ac3@euo7rsoccqup>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=68346549 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=ZPSvpmQREfRDJfDRKNsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: h2q3X7BekGhI8uLZbgim2OODXENxQ2ga
X-Proofpoint-GUID: h2q3X7BekGhI8uLZbgim2OODXENxQ2ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDExMCBTYWx0ZWRfX4fy0ACFsqfFa
 CmRlcA3HmBA/tY5s8eMkilEqppUUoPmyOxzywgM8bzfhTenbu/DoK2zLoTuzWNk8BsnwqsztK4u
 0vhAhYVmm6XrpR07rWWbBLGWig7QPNfD9ajT4pXsJnGGuvoj0OAAgMGLhTnHaGhGcD8hCS9du+G
 RTfQucp0jmePrT/xNNJrsW5CgLo36PxIC4EA588jgrJKY5Ye8MlYeWmImRZShR3PqpMshYPLGnU
 mTG+CsLF/vsJSDHYmqFY+CPcJvD+oZAr3iFVkDmzrjGC/Bto0Y2NwCdo0MxSKHFMkGYmA+EsPiH
 BL/ac0rYhnaWjCvE/123fJjgfktTuQ30ndsRDc+Lr/9xayW0YOeOGGVDOZgnD6gkLRzHtK4IIfo
 Ei560KFcgkZF90Xw0mLYVumgD+NbXLCjBJW/67txi58mX1w1D2n2AAlLmiKs+qMtkMFwg/Hn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260110
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



On 2024/12/8 13:42, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 08:31:48PM -0800, Abhinav Kumar wrote:
>> Use the dp_panel's stream_id to adjust the offsets for stream 1
>> which will be used for MST in the dp_catalog. Also add additional
>> register defines for stream 1.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 99 ++++++++++++++++++++++++++++---------
>>   drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ++--
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 ++
>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     | 13 ++++-
>>   5 files changed, 99 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index ee7f2d0b23aa034428a01ef2c9752f51013c5e01..e6f6edf617898241c74580eb0ae6bc58f06a154f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -457,10 +457,20 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
>>   					u32 test_bits_depth)
>>   {
>>   	u32 misc_val;
>> +	u32 reg_offset = 0;
>> +
>>   	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>>   				struct msm_dp_catalog_private, msm_dp_catalog);
>>   
>> -	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
>> +	if (msm_dp_catalog->stream_id >= DP_STREAM_MAX) {
>> +		DRM_ERROR("invalid stream_id:%d\n", msm_dp_catalog->stream_id);
>> +		return;
>> +	}
> 
> Please drop extra-protective handling. How can stream_id become invalid?
> 
>> +
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
>> +		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>> +
>> +	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + reg_offset);
>>   
>>   	/* clear bpp bits */
>>   	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
>> @@ -470,7 +480,7 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
>>   	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>>   
>>   	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
>> -	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>> +	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
>>   }
>>   
>>   void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
>> @@ -500,10 +510,21 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
>>   	u32 const link_rate_hbr2 = 540000;
>>   	u32 const link_rate_hbr3 = 810000;
>>   	unsigned long den, num;
>> +	u32 mvid_reg_off = 0, nvid_reg_off = 0;
>>   
>>   	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>>   				struct msm_dp_catalog_private, msm_dp_catalog);
>>   
>> +	if (msm_dp_catalog->stream_id >= DP_STREAM_MAX) {
>> +		DRM_ERROR("invalid stream_id:%d\n", msm_dp_catalog->stream_id);
>> +		return;
>> +	}
>> +
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_1) {
>> +		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
>> +		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
>> +	}
>> +
>>   	if (rate == link_rate_hbr3)
>>   		pixel_div = 6;
>>   	else if (rate == 162000 || rate == 270000)
>> @@ -545,9 +566,14 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
>>   		nvid *= 3;
>>   
>>   	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>> -	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
>> -	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
>> -	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
>> +
>> +	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
>> +	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
>> +
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
>> +		msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
>> +	else
>> +		msm_dp_write_p1(catalog, MMSS_DP_DSC_DTO, 0x0);
>>   }
>>   
>>   int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
>> @@ -910,13 +936,20 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
>>   	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
>>   				struct msm_dp_catalog_private, msm_dp_catalog);
>>   	u32 reg;
>> +	u32 offset = 0;
>> +
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
>> +		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
>>   
>> -	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
>> -	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
>> -	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
>> -	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
>> +	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER + offset, total);
>> +	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC + offset, sync_start);
>> +	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
>> +	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER + offset, msm_dp_active);
>>   
>> -	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
>> +		reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
>> +	else
>> +		reg = msm_dp_read_p1(catalog, MMSS_DP_INTF_CONFIG);
>>   
>>   	if (msm_dp_catalog->wide_bus_en)
>>   		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
>> @@ -926,7 +959,11 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
>>   
>>   	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
>>   
>> -	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_0)
>> +		msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
>> +	else
>> +		msm_dp_write_p1(catalog, MMSS_DP_INTF_CONFIG, reg);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -936,18 +973,22 @@ static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_cata
>>   	u32 header[2];
>>   	u32 val;
>>   	int i;
>> +	u32 msm_dp_generic_offset = 0;
>>   
>>   	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
>>   
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
>> +		msm_dp_generic_offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
>> +
>>   	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>>   
>> -	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
>> -	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
>> +	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0 + msm_dp_generic_offset, header[0]);
>> +	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1 + msm_dp_generic_offset, header[1]);
>>   
>>   	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>>   		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>>   		       (vsc_sdp->db[i + 3] << 24));
>> -		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
>> +		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i + msm_dp_generic_offset, val);
>>   	}
>>   }
>>   
>> @@ -955,13 +996,17 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
>>   {
>>   	struct msm_dp_catalog_private *catalog;
>>   	u32 hw_revision;
>> +	u32 sdp_cfg3_offset = 0;
>>   
>>   	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
>>   
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_1)
>> +		sdp_cfg3_offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
>> +
>>   	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
>>   	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
>> -		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
>> -		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
>> +		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x01);
>> +		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x00);
>>   	}
>>   }
>>   
>> @@ -969,18 +1014,27 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
>>   {
>>   	struct msm_dp_catalog_private *catalog;
>>   	u32 cfg, cfg2, misc;
>> +	u32 misc_reg_offset = 0;
>> +	u32 sdp_cfg_offset = 0;
>> +	u32 sdp_cfg2_offset = 0;
>>   
>>   	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
>>   
>> -	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
>> -	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
>> -	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
>> +	if (msm_dp_catalog->stream_id == DP_STREAM_1) {
>> +		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>> +		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
>> +		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
>> +	}
>> +
>> +	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset);
>> +	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
>> +	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset);
>>   
>>   	cfg |= GEN0_SDP_EN;
>> -	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
>> +	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
>>   
>>   	cfg2 |= GENERIC0_SDPSIZE_VALID;
>> -	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
>> +	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
>>   
>>   	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
>>   
>> @@ -990,7 +1044,8 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
>>   	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
>>   
>>   	pr_debug("misc settings = 0x%x\n", misc);
>> -	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
>> +
>> +	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
>>   
>>   	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> index edeebf1f313f50e9c54feee1e5aa6aa2dbba3058..c020b7cfa008241e937f6a53764b136431f1dbd9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
>> @@ -47,10 +47,6 @@ enum msm_dp_catalog_audio_header_type {
>>   	DP_AUDIO_SDP_HEADER_MAX,
>>   };
>>   
>> -struct msm_dp_catalog {
>> -	bool wide_bus_en;
>> -};
>> -
>>   /* stream id */
>>   enum msm_dp_stream_id {
>>   	DP_STREAM_0,
>> @@ -60,6 +56,11 @@ enum msm_dp_stream_id {
>>   	DP_STREAM_MAX,
>>   };
>>   
>> +struct msm_dp_catalog {
>> +	bool wide_bus_en;
>> +	enum msm_dp_stream_id stream_id;
>> +};
>> +
> 
> The same can be achieved by moving enum msm_dp_stream_id up in one of
> the earlier patches.
> 
>>   /* Debug module */
>>   void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 0648831df956dfc7afa1cbfb0dea2c32b02ff74e..ba39b009032dd6f5cb708988963cd6acb6838e4a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -179,6 +179,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>>   						struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 cc, tb;
>> +	ctrl->catalog->stream_id = msm_dp_panel->stream_id;
>>   
>>   	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>>   	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
>> @@ -2062,7 +2063,9 @@ void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_d
>>   	struct msm_dp_ctrl_private *ctrl;
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +	ctrl->catalog->stream_id = dp_panel->stream_id;
>>   	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
>> +
>>   }
>>   
>>   void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 172de804dec445cb08ad8e3f058407f483cd6684..662bf02b8b1a5165f927835bef3c11ac091ddce6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -309,7 +309,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
>>   
>>   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   	catalog = panel->catalog;
>> +
>>   	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
>> +	catalog->stream_id = msm_dp_panel->stream_id;
> 
> Why is it a proper place to set catalog->stream_id? It doesn't looks
> like it to me.
Ok, maybe msm_dp_display_set_stream_id is more proper place. Or can we 
drop stream_id in catalog totally, and f the stream_id is needed in the 
catalog function, pass it as a parameter to the catalog function. just 
like that:
int msm_dp_ctrl_***(struct msm_dp_ctrl *ctrl, enum msm_dp_stream_id 
stream_id,***);

> 
>>   
>>   	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 3835c7f5cb984406f8fc52ea765ef2315e0d175b..6c534fde6034fced2cb428e9a29de31ed5c5fcc4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -138,13 +138,17 @@
>>   #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>>   
>>   #define REG_DP_SOFTWARE_MVID			(0x00000010)
>> +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
>>   #define REG_DP_SOFTWARE_NVID			(0x00000018)
>> +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
>>   #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
>> +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
>>   #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
>>   #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
>>   #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
>> -
>>   #define REG_DP_MISC1_MISC0			(0x0000002C)
>> +#define REG_DP1_MISC1_MISC0			(0x0000042C)
>> +
>>   #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>>   #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>>   #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
>> @@ -211,8 +215,11 @@
>>   #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
>>   
>>   #define MMSS_DP_SDP_CFG				(0x00000228)
>> +#define MMSS_DP1_SDP_CFG			(0x000004E0)
>>   #define GEN0_SDP_EN				(0x00020000)
>>   #define MMSS_DP_SDP_CFG2			(0x0000022C)
>> +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
>> +
>>   #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>>   #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
>>   #define GENERIC0_SDPSIZE_VALID			(0x00010000)
>> @@ -221,6 +228,8 @@
>>   #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
>>   
>>   #define MMSS_DP_SDP_CFG3			(0x0000024c)
>> +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
>> +
>>   #define UPDATE_SDP				(0x00000001)
>>   
>>   #define MMSS_DP_EXTENSION_0			(0x00000250)
>> @@ -270,6 +279,8 @@
>>   #define MMSS_DP_GENERIC1_8			(0x00000348)
>>   #define MMSS_DP_GENERIC1_9			(0x0000034C)
>>   
>> +#define MMSS_DP1_GENERIC0_0			(0x00000490)
>> +
>>   #define MMSS_DP_VSCEXT_0			(0x000002D0)
>>   #define MMSS_DP_VSCEXT_1			(0x000002D4)
>>   #define MMSS_DP_VSCEXT_2			(0x000002D8)
>>
>> -- 
>> 2.34.1
>>
> 

