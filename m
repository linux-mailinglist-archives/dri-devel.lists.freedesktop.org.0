Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F60A6FE0DC
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BAF10E4BC;
	Wed, 10 May 2023 14:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474CA10E4BC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 14:57:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AE8D0k014769; Wed, 10 May 2023 14:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sM0lPnSnMR85dWalCPE6DM0jV4KlJsaqVN8HJDT/jJI=;
 b=HccFqMlxfqarfy4KiEqPD+LE6H8SSUECSowCbYHa/CELhlaOlLxqwWGXLHh+2ONzJKyT
 jOw689IWLCk+KY5iDo6oo6wzw4Ey2TZqMEpAeUnEZwYv9B8uvzkJzIPQsEj1ufkYCJ7X
 gyBqE81K0cAXufwF3Eb6ZzQGbHxfH55VLQIwUFiTeEuSenP5KXmOWeI5a1ml8MFZAy2g
 w/8rqVYSoYZLNoo+CjPKlC0H23rI+LZWRW9SK31xsVWwR78lU/c36VH+oCHRwh3PKN5G
 NnouW4Ic3YobTe1gMtRcAnAEbP7Arf0ZqaCdkS8KR+WVgD42Go7E3E/4cAFV6UdYqa77 yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfw3d1s17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 14:57:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AEv49n028154
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 14:57:04 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 07:57:04 -0700
Message-ID: <2d1fb58f-f98b-ba17-65e9-9ea4b467102a@quicinc.com>
Date: Wed, 10 May 2023 08:57:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: silence some uninitialized variable warnings
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Mug3i2VXkPTwLSIbbbTCpYZj0m2y0eCw
X-Proofpoint-GUID: Mug3i2VXkPTwLSIbbbTCpYZj0m2y0eCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=846 mlxscore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100121
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

On 5/3/2023 4:41 AM, Dan Carpenter wrote:
> Smatch complains that these are not initialized if get_cntl_version()
> fails but we still print them in the debug message.  Not the end of
> the world, but true enough.  Let's just initialize them to a dummy value
> to make the checker happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the cleanup.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Could use a fixes tag, and also I'd prefer to maintain the style of 
sorting the variable declaration lines by line length.  Given the minor 
nature of these nits, I plan to address them.
