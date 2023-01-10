Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDB6637A0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 04:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F39510E48F;
	Tue, 10 Jan 2023 03:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECB310E08C;
 Tue, 10 Jan 2023 03:04:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30A2urdF032147; Tue, 10 Jan 2023 03:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3K7sAroFg2oi/lNGPZZUkc6T0QOLN7fghzrckR1sL4I=;
 b=H4+7kO7FRrN7/s3xPindW0D8kVVnP/+g3mJisM9urOP6x+XIL03hIwx2Ze3ZfPrAfba4
 nxvre249Qnxc+PrURtxqBS2nlT7tVK1kiV9QQxlA1DdCeE7pur3PU+35WFUCVAiSftWo
 XP3DLtw4K8mV9xpNJJRGTBxYP3luXabIxsYsNL4AFVvTaSJ50tIKUFPwylMNQgbQw+j9
 JQIg4o3Kf2C3jNwU5qJbMr9ocmuYowyH5Oo31q0f2oxg/CEG6JHgPsrkVLZe8giInQYv
 IVCMN06eoKOpkaRwSXJ8RbCvgMX2GvGKXQ4YHkMJzUj35YSuWOOtlRq7amtRXG+px0Ty fw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n0q6ery4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 03:04:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30A34jDq018987
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 03:04:45 GMT
Received: from [10.110.115.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 9 Jan 2023
 19:04:45 -0800
Message-ID: <fd5fe81b-caac-ed4a-6e49-fdc6f4f37952@quicinc.com>
Date: Mon, 9 Jan 2023 19:04:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/msm/dsi: implement opp table based check for
 dsi_mgr_bridge_mode_valid()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <1663807768-23969-2-git-send-email-quic_abhinavk@quicinc.com>
 <29e5110a-1759-8d8c-6646-f7b487990c0b@linaro.org>
 <b638db8c-20c8-827d-fd08-5e3bdb8dd924@linaro.org>
 <2d30f45a-ccd0-052e-6f6c-1e119c44f81a@quicinc.com>
 <8b8ea954-1747-2174-1977-a6e0f23d7fc7@linaro.org>
 <0180c789-9e7e-e1ed-3484-c638c860ce96@quicinc.com>
 <aa4fc2f4-204e-3570-fce3-ad9107061b73@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <aa4fc2f4-204e-3570-fce3-ad9107061b73@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BZChysby_t-UwQ5s04IVMyocQEoi_Qrn
X-Proofpoint-ORIG-GUID: BZChysby_t-UwQ5s04IVMyocQEoi_Qrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_16,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100017
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
Cc: quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/9/2023 7:00 PM, Dmitry Baryshkov wrote:
> On 10/01/2023 04:56, Abhinav Kumar wrote:
>>
>>
>> On 1/9/2023 6:47 PM, Dmitry Baryshkov wrote:
>>> On 10/01/2023 04:40, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 1/9/2023 5:19 PM, Dmitry Baryshkov wrote:
>>>>> On 27/10/2022 20:36, Dmitry Baryshkov wrote:
>>>>>> On 22/09/2022 03:49, Abhinav Kumar wrote:
>>>>>>> Currently there is no protection against a user trying to set
>>>>>>> an unsupported mode on DSI. Implement a check based on the opp
>>>>>>> table whether the byte clock for the mode can be supported by
>>>>>>> validating whether an opp table entry exists.
>>>>>>>
>>>>>>> For devices which have not added opp table support yet, skip
>>>>>>> this check otherwise it will break bootup on those devices.
>>>>>>>
>>>>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
>>>>>>> Reported-by: Rob Clark <robdclark@gmail.com>
>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 23 +++++++++++++++++++++++
>>>>>>>   1 file changed, 23 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>>>> index 3a1417397283..87b518c42965 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>>>> @@ -450,6 +450,29 @@ static enum drm_mode_status 
>>>>>>> dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>>>>>>       int id = dsi_mgr_bridge_get_id(bridge);
>>>>>>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>>>>>       struct mipi_dsi_host *host = msm_dsi->host;
>>>>>>> +    struct platform_device *pdev = msm_dsi->pdev;
>>>>>>> +    struct dev_pm_opp *opp;
>>>>>>> +    struct opp_table *opp_tbl;
>>>>>>> +    unsigned long byte_clk_rate;
>>>>>>> +
>>>>>>> +    byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), 
>>>>>>> mode);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * first check if there is an opp table available for the 
>>>>>>> calculated
>>>>>>> +     * byte clock and then check DSC related info. Some devices 
>>>>>>> have not
>>>>>>> +     * added support for OPP table. Skip the check for those.
>>>>>>> +     */
>>>>>>> +    opp_tbl = dev_pm_opp_get_opp_table(&pdev->dev);
>>>>>>
>>>>>> Can we store the table inside the msm_dsi during the init? Then we 
>>>>>> won't have to get it again and again during each mode_valid call.
>>>>>
>>>>> I checked other drivers. I think we can skip the get_opp_table 
>>>>> completely, can we not? Just handle ENODEV returned from 
>>>>> dev_pm_opp_find_freq_ceil().
>>>>>
>>>>
>>>> Your point is valid but I had a doubt on that API.
>>>>
>>>> As per the documentation of that API, it says
>>>>
>>>> 639  * Return: matching *opp and refreshes *freq accordingly, else 
>>>> returns
>>>> 640  * ERR_PTR in case of error and should be handled using IS_ERR. 
>>>> Error return
>>>> 641  * values can be:
>>>> 642  * EINVAL:    for bad pointer
>>>> 643  * ERANGE:    no match found for search
>>>> 644  * ENODEV:    if device not found in list of registered devices
>>>> 645  *
>>>> 646  * The callers are required to call dev_pm_opp_put() for the 
>>>> returned OPP after
>>>> 647  * use.
>>>> 648  */
>>>> 649 struct dev_pm_opp *dev_pm_opp_find_freq_ceil(struct device *dev,
>>>> 650                          unsigned long *freq)
>>>> 651 {
>>>>
>>>> So ideally yes, ENODEV means that table was not found but .... that 
>>>> API uses _find_opp_table under the hood.
>>>>
>>>> which says
>>>>
>>>> 79  * Return: pointer to 'struct opp_table' if found, otherwise 
>>>> -ENODEV or
>>>> 80  * -EINVAL based on type of error.
>>>> 81  *
>>>> 82  * The callers must call dev_pm_opp_put_opp_table() after the 
>>>> table is used.
>>>>
>>>> Now, how would we know if the failure was due to table not found OR 
>>>> entry not found.
>>>>
>>>> Table now found means that SOC has probably not started using OPP 
>>>> table which is alright and not an error.
>>>>
>>>> But EINVAL could mean an entry not found which means it exceeds the 
>>>> opp table limits.
>>>
>>> I think this would be -ERANGE as documented.
>>>
>>> EINVAL means dev is null or something of the same kind.
>>>
>>
>> Okay, so EINVAL and ERANGE are genuine errors but ENODEV is not in our 
>> case as all SOCs might not have opp table yet.
>>
>> Do you still think selective handling of these two errors is better 
>> than the current implementation? That way its separation is clear.
> 
> I think that we should drop the opp_table handling.
> Then select basing on the returned error:
>   ERANGE => MODE_CLOCK_HIGH
>   EINVAL and any other error => MODE_ERROR
>   ENODEV => skip the check, continue with dsc
> 
> See below.
> 

Ack, lets do it this way.

I am clear now, will spin a v2.

>>
>>>>
>>>> So there was some ambiguity on this. So I broke it down into two calls.
>>>>
>>>> If my concern is invalid, let me know.
>>>>
>>>> But I do agree with you that we can cache the opp table once rather 
>>>> than doing it in every mode_valid().
>>>>
>>>>>>
>>>>>>> +    if (opp_tbl) {
>>>>>>> +        opp = dev_pm_opp_find_freq_ceil(&pdev->dev, 
>>>>>>> &byte_clk_rate);
>>>>>>> +        if (IS_ERR(opp)) {
>>>>>>> +            pr_err("opp table not found for freq %lu err: %ld\n",
>>>>>>> +                    byte_clk_rate, PTR_ERR(opp));
>>>>>>> +            return PTR_ERR(opp);
> 
> Note: mode_valid returns `enum drm_mode_status`, so we can not return 
> PTR_ERR here.
> 
>>>>>>> +        }
>>>>>>> +        dev_pm_opp_put(opp);
>>>>>>> +        dev_pm_opp_put_opp_table(opp_tbl);
>>>>>>> +    }
>>>>>>>       return msm_dsi_host_check_dsc(host, mode);
>>>>>>>   }
>>>>>>
>>>>>
>>>
> 
