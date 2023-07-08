Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964FC74BBD5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 06:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B2B10E09F;
	Sat,  8 Jul 2023 04:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5604A10E09F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 04:44:22 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3684dLxu012290; Sat, 8 Jul 2023 04:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tVIAgFGK4lVMUAiCJ2lvzhu9Vc4syLxBdPtpoxw/260=;
 b=V9s0LdX4XiU4X4u0khs93p+8CqdtY1pjylupmI7BvPg0Alv98cwODQn96ciYN36mL+Rg
 jlG8pkgOwW/vTA4JbdvHafJ+SnJRZErexj4AZbqsx/JylbaUv2tYKaC3dXNVSnLdgv6m
 qdf74paUSB1IofAcDBfrYx124Spr5ngkSDQYU+3uA6vR7OuTJxA4kCz6Xpqx+db6qPG2
 +T8ash1c4NlwB9h5rBT9da6FbWTLyvv6R4uvLc0GI0F0JJShFJaAw+AMcRZGNeG1qH7a
 mDK8rJwEcoMFgg6A5O9xMzPiFo01JkZlDR3DsRd8qeUWaMMI1tcmky8H+vGCA56S0Ex/ 4w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpyw1r299-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Jul 2023 04:44:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3684iEVT006765
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 8 Jul 2023 04:44:14 GMT
Received: from [10.50.31.106] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 7 Jul
 2023 21:44:10 -0700
Message-ID: <b9114d9b-11f9-df2a-261e-05dc7db9c9f5@quicinc.com>
Date: Sat, 8 Jul 2023 10:14:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/5] accel/qaic: Fix a leak in map_user_pages()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
References: <d04e5fc2-7b2b-4fb1-a9d7-17b55ecb9986@moroto.mountain>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <d04e5fc2-7b2b-4fb1-a9d7-17b55ecb9986@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: c2GEzYOHuwGC_dL9vH0_atFoj4ZxSIV1
X-Proofpoint-ORIG-GUID: c2GEzYOHuwGC_dL9vH0_atFoj4ZxSIV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-08_02,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307080041
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/21/2023 12:52 PM, Dan Carpenter wrote:
> If get_user_pages_fast() allocates some pages but not as many as we
> wanted, then the current code leaks those pages.  Call put_page() on
> the pages before returning.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/accel/qaic/qaic_control.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 03932197f1ac..7c3f9009617f 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -424,9 +424,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
>   	}
>   
>   	ret = get_user_pages_fast(xfer_start_addr, nr_pages, 0, page_list);
> -	if (ret < 0 || ret != nr_pages) {
> -		ret = -EFAULT;
> +	if (ret < 0)
>   		goto free_page_list;
> +	if (ret != nr_pages) {
> +		nr_pages = ret;
> +		ret = -EFAULT;
> +		goto put_pages;
>   	}
>   
>   	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);

Thank you for catching this :)

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
