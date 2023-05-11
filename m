Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A687002F6
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A5110E629;
	Fri, 12 May 2023 08:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD3D10E0D0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 19:47:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34BJKCvj005540; Thu, 11 May 2023 19:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GMdMZanCPuIQdAXFLNo3WJTphkoKE1vlUhMHToOgUww=;
 b=aaCmjPWsPPS0/rMgDhaOhjDwTkK6wDhJdVDs9/rlyi61CzeIhnpwGSvTpbs4mnx6aRIt
 cQocYxGP75Dqfm4PX2dtsHKdUkg/tgIxMhDSpofNAAIq46EG+XIojMJkHx2ZGe9InPMB
 CJcRDRFMKNRn0PBTkdaFnWyZ4DzyEzOID/nN8RSNdOzRB6Eu+gWeOBJDCof2OaPfOh8J
 juT1g6QSFDmhZLzHUKx9sS+A8VUnT7Es3BBhCkDyM48jJ3XHQHrXXtWpzvMPvt+DTeXw
 WQHC+/11bykeZrchfDERRJ4QOxsevr3hLmp71+DvK+7U5vmXKNPl4i9LTqWE9a4D6Reu WQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgv1u9pe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 19:47:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34BJl4Sj030846
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 19:47:04 GMT
Received: from [10.50.47.207] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 11 May
 2023 12:47:02 -0700
Subject: Re: [PATCH] accel/qaic: silence some uninitialized variable warnings
To: Dan Carpenter <dan.carpenter@linaro.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
References: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Message-ID: <962011a6-9089-b678-6ac8-ce29b8ffa2fb@quicinc.com>
Date: Fri, 12 May 2023 01:16:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5zfhe7JIzJ0c6nTCWcOPBlG6meEolwCV
X-Proofpoint-ORIG-GUID: 5zfhe7JIzJ0c6nTCWcOPBlG6meEolwCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1011 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110167
X-Mailman-Approved-At: Fri, 12 May 2023 08:48:34 +0000
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/3/2023 4:11 PM, Dan Carpenter wrote:
> Smatch complains that these are not initialized if get_cntl_version()
> fails but we still print them in the debug message.  Not the end of
> the world, but true enough.  Let's just initialize them to a dummy value
> to make the checker happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/accel/qaic/qaic_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index ff80eb571729..e10e8b603e37 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -263,7 +263,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
>   static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>   {
>   	struct qaic_device *qdev;
> -	u16 major, minor;
> +	u16 major = -1, minor = -1;
>   	int ret;
>   
>   	/*
> 

Thank you Dan for the patch.

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

I agree with Jeff's comment to sort the variable declaration length wise.
