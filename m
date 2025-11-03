Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57FC2B140
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C8E10E3AD;
	Mon,  3 Nov 2025 10:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nkj6ofue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E11510E3AB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:34:53 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A383LBe694040; Mon, 3 Nov 2025 10:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bbJfcRBmvzB7GPs3ALPm2KF8b3Wy02IooMd1RLjQELE=; b=nkj6ofueew6o00Ut
 4VNte3EvAXkx2fBes4WXEtuB4xN8A//JfPV013JgOuoN/h/69VaW8PRhkzAO0yrn
 6rid8/pAzzXyZ6cuvDatVWFm6+TYh00CfnfTG87QZ7qTwsZr+mPiGs4jOEdBWfln
 pDEz+iwALb8llU6sbY5Eqj7BPBQJ2NTR6ekRRp4Sp9VWZoxyrKfO0VvzvZwbMyF1
 SRNScDpGS59ILhZxr1IQX7153V7OYvrKvEclT7LtZvAwm+o+pnK01Om/Wrx8Y8Cz
 Jdd3OzIuTH4k07INoJE6cl8Ji8cmN0kJHarJsTf7CT1aENFwWqjcAmeCnVWF/cNA
 qyie4w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8ma1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Nov 2025 10:34:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A3AYar3006668
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Nov 2025 10:34:36 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 3 Nov
 2025 02:34:30 -0800
Message-ID: <45be2cab-d6a3-4ff8-b66e-2424a74328f6@quicinc.com>
Date: Mon, 3 Nov 2025 16:04:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: anx7625: Fix EDID block size at
 drm_edid_alloc() calling
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, <quic_rajeevny@quicinc.com>
CC: <bliang@analogixsemi.com>, <qwen@analogixsemi.com>,
 <treapking@chromium.org>, <jason-jh.lin@mediatek.corp-partner.google.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250808064613.2623732-1-xji@analogixsemi.com>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250808064613.2623732-1-xji@analogixsemi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2UQ5bLOB1zZ2Wxzh5yuKL6Ik5XTvNE9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NiBTYWx0ZWRfX/8DwIp48Z1Fx
 bQaJiEEAzD5aggGbtbSba4IHw/w55++E9keIczyXO2kVkTL4+NZ1RH1mcSSSB8/HeCDSzYf6mQe
 aPFq+eWVW8GN8Wm/kH5mSBK/kh5g/7TXymKbfemhZsJUk2GrpY2PQYxZwiuZdjDrZdjDoaQsH3P
 YMkQG62z0tKtr09H9+XhoPx7fy+oq86Mj1nW0oN34lD/UOfniv5YO+uHp6M9I2wJz5lm6oVr9kE
 mVRolR38dTjwf5WWcfh4A+FXb9o6gf6lqcHkekQKZkp8pvuQjrFrAayE+OqmNJMLLIacwAnKQVC
 6nYLc0bBcEJ27N743PWfBwJlVhazCEI3Ea/QwKYEV/uYZ9WrJAIb+gp26JddVFJN2Vq/RrGxgjq
 u/Emahqps8V667CCYunhyoupEI2UzQ==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=6908853d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=bbNUuHX0AAAA:8 a=COk6AnOGAAAA:8
 a=Nas7dopP-U0ihP8ZSH4A:9 a=QEXdDO2ut3YA:10 a=3b-t3vAtY4IUXy2q2Ylb:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 2UQ5bLOB1zZ2Wxzh5yuKL6Ik5XTvNE9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030096
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

On 8/8/2025 12:16 PM, Xin Ji wrote:
> Since DRM validates the all of EDID blocks, allocates drm_edid data
> structure based on the actually block count returned by the sink
> monitor at drm_edid_alloc() calling.
> 
> Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more")
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index c0ad8f59e483..4b5a74e9785e 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_read(struct anx7625_data *ctx)
>  		return NULL;
>  	}
>  
> -	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, FOUR_BLOCK_SIZE);
> +	ctx->cached_drm_edid = drm_edid_alloc(edid_buf, edid_num * EDID_LENGTH);
>  	kfree(edid_buf);
>  
>  out:

I applied https://lore.kernel.org/all/20250808064613.2623732-1-xji@analogixsemi.com/ on linux-next (next-20250929),
tested on QCS9100 RIDE SX platform.

Before this patch, the ANX7625 bridge driver allocated drm_edid with a fixed 512 bytes (FOUR_BLOCK_SIZE),
while the connected monitor provides only 256 bytes of EDID (2 blocks; EDID_LENGTH = 128 bytes per block)
(It could vary depending on the number of edid blocks supported by the monitor). This mismatch caused
drm_edid_valid() to fail and the system to boot into a fail safe mode.

With this patch, the allocation uses edid_num * EDID_LENGTH, matching the actual number of EDID blocks from
the monitor, and the issue is no longer reproducible.

Tested-by: Ayushi Makhija <quic_amakhija@quicinc.com>

Thanks,
Ayushi
