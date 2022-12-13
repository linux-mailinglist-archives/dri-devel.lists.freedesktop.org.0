Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997B64AD1C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 02:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31F10E2B7;
	Tue, 13 Dec 2022 01:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5146910E2B7;
 Tue, 13 Dec 2022 01:36:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BD1KIIc002952; Tue, 13 Dec 2022 01:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pCZeAfDoRhwWqONc4flZx60RTmPIhwedWOry2zw04m8=;
 b=ESnm0JDYvat8UpXraksERXMqs2Kj/Hl8XfKh3gRys+XF7yzraas7zLQqRa/1ZDGyGwat
 MK0l50xPL+2Gr0v8KfdYMqpwew3Ts6JqZnq+jvI7D5TeD/tb2foZfDlAGqfH9czfIoF1
 qL5+GYIZagzoACiWw4L1taWnjIcfP1c+vt4yzfB8q/yMgJEGXQSQYypDw+7/OAiWuPZq
 fdMBEZRhPa89inkvf6VKasKjLQZ7PRVF10WUlwE6MJBF+UaFKF28pPKL+nmXLkCXHCf3
 jPMD5uXteUh47bd4nRBLjIKHeO+Uifyw8ba8zeYaj1Fozf/gQg1k7QhIXrx3yHMVf/oh LA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mchesdsy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 01:36:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BD1a2c2022801
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 01:36:02 GMT
Received: from [10.111.167.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 12 Dec
 2022 17:36:00 -0800
Message-ID: <46c1f014-7c3f-88c4-d576-7b6bd5e1590d@quicinc.com>
Date: Mon, 12 Dec 2022 17:35:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH] drm/msm/hdm: Fix the error handling path of
 msm_hdmi_dev_probe()
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean
 Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
References: <b3d9dac978f1e2e42a40ec61f58aa98c44c85dfd.1670741386.git.christophe.jaillet@wanadoo.fr>
 <b34374ed-0444-6bd9-4994-7f890455b451@quicinc.com>
In-Reply-To: <b34374ed-0444-6bd9-4994-7f890455b451@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QiioKxyM5fxSL8PC9z6BgRR-vYYuuoh5
X-Proofpoint-GUID: QiioKxyM5fxSL8PC9z6BgRR-vYYuuoh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212130014
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/12/2022 5:34 PM, Abhinav Kumar wrote:
> 
> 
> On 12/10/2022 10:50 PM, Christophe JAILLET wrote:
>> If an error occurs after a successful msm_hdmi_get_phy() call, it must be
>> undone by a corresponding msm_hdmi_put_phy(), as already done in the
>> remove function.
>>
>> Fixes: 437365464043 ("drm/msm/hdmi: move msm_hdmi_get_phy() to 
>> msm_hdmi_dev_probe()")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Actually, i missed one nit

In the subject line, it should be "drm/msm/hdmi"

The "i" is missing.

Please fix that and post it.

> 
>> ---
>> Not sure if the Fixes tag is correct. At least it is when the probe needs
>> to be fixed but the issue was maybe there elsewhere before.
> 
> Seems right to me.
> 
>> ---
>>   drivers/gpu/drm/msm/hdmi/hdmi.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index 4d3fdc806bef..97372bb241d8 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -532,11 +532,19 @@ static int msm_hdmi_dev_probe(struct 
>> platform_device *pdev)
>>       ret = devm_pm_runtime_enable(&pdev->dev);
>>       if (ret)
>> -        return ret;
>> +        goto err_put_phy;
>>       platform_set_drvdata(pdev, hdmi);
>> -    return component_add(&pdev->dev, &msm_hdmi_ops);
>> +    ret = component_add(&pdev->dev, &msm_hdmi_ops);
>> +    if (ret)
>> +        goto err_put_phy;
>> +
>> +    return 0;
>> +
>> +err_put_phy:
>> +    msm_hdmi_put_phy(hdmi);
>> +    return ret;
>>   }
>>   static int msm_hdmi_dev_remove(struct platform_device *pdev)
