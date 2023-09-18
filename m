Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD07A533A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 21:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB8B10E0F3;
	Mon, 18 Sep 2023 19:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3FF10E025;
 Mon, 18 Sep 2023 19:46:36 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38IHSHP9008425; Mon, 18 Sep 2023 19:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vzrpQ4gweLl+IByBQuhzYD2oZHDx2mZxj2oAr9SBgw8=;
 b=fNvNNToFgp5qI7qACvPEetTx/7epUbk1mjdDAc2jgNizSuUnQc4J+GEQ65WHs/VklNaE
 n87gUxT9hFn9FeMGe+BLR3HEI9JenzjW4KE4lXANxl56UHck1mkW3RKT7BZJUFQhke2W
 2xASUYFRG94pbjWlqYcf9shn9lt+9WQREMcpqhqzzvV/38hGWpONObLIvwMLxKdupVoG
 aGLAL2UHlkDV3VtVKeMgZzuNdodux0tLlPjlUq2E7j0VelhH9OI5rdvLdfzZ+12Ll1ik
 qrk1zPybH91VFPWOTKJvLV2mfGIvs1WB7cfMJK3G2XoyEqGAdFBTY35MZTUjgfsmK3mN aw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t54f13xum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 19:46:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IJk7PK018104
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 19:46:07 GMT
Received: from [10.110.56.54] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 12:46:07 -0700
Message-ID: <4d1d4d46-84f2-0308-7a93-39a87b974139@quicinc.com>
Date: Mon, 18 Sep 2023 12:45:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dsi: fix irq_of_parse_and_map() error checking
To: Dan Carpenter <dan.carpenter@linaro.org>, Hai Li <hali@codeaurora.org>
References: <4f3c5c98-04f7-43f7-900f-5d7482c83eef@moroto.mountain>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <4f3c5c98-04f7-43f7-900f-5d7482c83eef@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FqOkq3A1JBPzuHlNSRAXRsfiPRi28fGB
X-Proofpoint-GUID: FqOkq3A1JBPzuHlNSRAXRsfiPRi28fGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_08,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309180173
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
Cc: freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/15/2023 5:59 AM, Dan Carpenter wrote:
> The irq_of_parse_and_map() function returns zero on error.  It
> never returns negative error codes.  Fix the check.
> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Will queue it up for -fixes
