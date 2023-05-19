Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D858709F88
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 21:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFA710E4D8;
	Fri, 19 May 2023 19:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DC410E4D8;
 Fri, 19 May 2023 19:04:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34JCaN2l026842; Fri, 19 May 2023 19:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=opzbwkDTgm8cg905fbiHB+IaDqvTINH0S8yzfdIVucQ=;
 b=R4oCqG6wi4UYwFirTgVkLs2JG8ahGHALBvJZkPEX37G3R5nOxzcHE8oTr/NwTSKUzzTP
 eGNDIo1BUKYt22wRuFhM/FJCrbaJ6Z+plHLUhXJnf1Voiv7LhmD9RRDRWx42AdmPcnlL
 1e0pjNe2VHag5KIQZT6aVYpIPUvkvS7+9/M6ucDG8y2cuCLGBkGcHyACQMJJm7hyUFPM
 JOIchT+moBYJhU9xtXCQ8Z5JGhmC5zFKN98nxkXcTgF8jdleKD2+vu5WJJlpn11dsEe7
 P22108ziN1dcq1HCMtY3ua8muSu2EUbMrjUTad5XPACfDD+X7OzQE3Drg74F0SFiiY1w kg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qp69u1d63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 19:04:03 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34JJ41Sp030712
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 May 2023 19:04:02 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 19 May
 2023 12:04:01 -0700
Message-ID: <d4e78b24-a3f1-37a3-11c1-92631b3e7c45@quicinc.com>
Date: Fri, 19 May 2023 12:04:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Adjust pclk rate for compression
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-1-1072c70e9786@quicinc.com>
 <79b468f5-8f2e-175b-5bce-1b3ea5127628@quicinc.com>
 <i4bemmveyvowfy7dogetoygaflfttpe26dpg7bbimrzf53wv3w@o3odsno4pb2w>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <i4bemmveyvowfy7dogetoygaflfttpe26dpg7bbimrzf53wv3w@o3odsno4pb2w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yEaxfN0UFLSebcIDduIl4fL_-QJC5pzL
X-Proofpoint-GUID: yEaxfN0UFLSebcIDduIl4fL_-QJC5pzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_14,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190163
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/8/2023 2:56 PM, Marijn Suijten wrote:
> On 2023-05-05 14:49:08, Jessica Zhang wrote:
>> On 5/5/2023 2:23 PM, Jessica Zhang wrote:
>>> Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
>>> is enabled.
>>>
>>> Changes in v2:
>>> - Adjusted pclk_rate math to divide only the hdisplay value by
>>>     compression ratio
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 17 +++++++++++++----
>>>    1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 43a5ec33eee8..0e5778e8091f 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -561,7 +561,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>>>    	clk_disable_unprepare(msm_host->byte_clk);
>>>    }
>>>    
>>> -static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
>>> +static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
>>> +		struct drm_dsc_config *dsc, bool is_bonded_dsi)
>>>    {
>>>    	unsigned long pclk_rate;
>>>    
>>> @@ -576,6 +577,14 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
>>>    	if (is_bonded_dsi)
>>>    		pclk_rate /= 2;
>>>    
>>> +	/* If DSC is enabled, divide hdisplay by compression ratio */
>>> +	if (dsc) {
>>> +		int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * msm_dsc_get_bpp_int(dsc),
>>> +				dsc->bits_per_component * 3);
>>> +		int fps = DIV_ROUND_UP(pclk_rate, mode->htotal * mode->vtotal);
>>
>> Should've used drm_mode_vrefresh() here... Will spin a v3 with that
>> change (along with any additional comments)
> 
> Perhaps unsigned long on some of these?  Overall the computations and
> multi-lines look rather cluttered, perhaps (parts of) this is/are a
> prime candidate to go into the new helpers?

Hi Marijn,

Sorry for the late reply, wanted to get the MSM DSC helpers series 
settled first before addressing these changes.

Sounds good, I'll put these calculations in a separate 
dsi_adjust_compressed_pclk() helper.

> 
> Note that I cannot get the 4k mode working at 60Hz on one of my panels
> (30Hz works with minor corruption), regardless of this patch.  See also:
> https://gitlab.freedesktop.org/drm/msm/-/issues/24#note_1900031
As discussed elsewhere, we suspect that this is unrelated to DSC 
specifically and might be an issue with the upstream driver not taking 
transfer time into account with calculating pclk_rate.

We will look into this as a separate issue.

> 
>>> +		pclk_rate = (new_hdisplay + (mode->htotal - mode->hdisplay)) * mode->vtotal * fps;
>>> +	}
>>> +
>>>    	return pclk_rate;
>>>    }
>>>    
>>> @@ -585,7 +594,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>>    	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>    	u8 lanes = msm_host->lanes;
>>>    	u32 bpp = dsi_get_bpp(msm_host->format);
>>> -	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
>>> +	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
>>>    	u64 pclk_bpp = (u64)pclk_rate * bpp;
>>>    
>>>    	if (lanes == 0) {
>>> @@ -604,7 +613,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
>>>    
>>>    static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>    {
>>> -	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
>>> +	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
>>>    	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
>>>    							msm_host->mode);
>>>    
>>> @@ -634,7 +643,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>    
>>>    	dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>    
>>> -	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
>>> +	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;
> 
> Let's rebase on top of "drm/msm/dsi: simplify pixel clk rate handling"
> [1] to clean this up.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20230118130031.2345941-1-dmitry.baryshkov@linaro.org/

I've looked into this patch and have made a comment on it. Just have 
some reservations about it as it changes the functionality of a clk 
handler op.

I will hold off on rebasing and wait for that thread to resolve first.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>>>    	do_div(pclk_bpp, 8);
>>>    	msm_host->src_clk_rate = pclk_bpp;
>>>    
>>>
>>> -- 
>>> 2.40.1
>>>
