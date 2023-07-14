Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931AD753FBC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 18:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA2710E8BF;
	Fri, 14 Jul 2023 16:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF52010E8BC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 16:18:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36ECxOS9021618; Fri, 14 Jul 2023 16:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e6r0TRgzqXyjI0fqkjeUdWf0X1fscclvLj1znvXwemE=;
 b=ADc2PSuMvGyk0xnbVrEkl5PCFzVNMMCzkWCeyc+ymNMBE7ttUW4YPTmWBdaT37wJLsDk
 ZJnF/0xlVaB1f5Iu7qAPKUGwyQTT5uhXwwskcRxkX5ge9/oTKqbp4QM23b9MAu/FfD8U
 t+5qPDZ1gykiqbfOxZkFTgrTlG0x22J8PNX4zChsBYpty2vM/7J2E7kQC+XGCaF/Wdtd
 DSuM118qm9RVCOR6c8VxjKMUOU1UdWgdEXDyBpPtRzFkzk4ymu8UNRemzQgymm9rX9j9
 Ari3LBeU+YGGinXRmM0weY/XU+/wE8terfgfHSdOYtJ8e7LcYQqB4nSjtSSdXC2Grfxq VQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpukt6sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 16:17:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EGHei5023085
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jul 2023 16:17:40 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 09:17:40 -0700
Message-ID: <8482922f-ac4a-32ed-8900-cd5c6191e552@quicinc.com>
Date: Fri, 14 Jul 2023 10:17:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/5 v4] accel/qaic: Fix a leak in map_user_pages()
Content-Language: en-US
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
References: <ZK0Q+ZuONTsBG+1T@moroto>
 <f4c35b9b-68a2-1e9e-762a-b1001c495f01@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <f4c35b9b-68a2-1e9e-762a-b1001c495f01@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: X3h7yO552nBI61ryV21eptswdh8imkLU
X-Proofpoint-GUID: X3h7yO552nBI61ryV21eptswdh8imkLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_07,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=763 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140148
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
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/2023 5:47 AM, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/11/2023 1:51 PM, Dan Carpenter wrote:
>> If get_user_pages_fast() allocates some pages but not as many as we
>> wanted, then the current code leaks those pages.  Call put_page() on
>> the pages before returning.
>>
>> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Pushed to drm-misc-fixes

-Jeff
