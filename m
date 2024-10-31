Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0819B8470
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B887310E114;
	Thu, 31 Oct 2024 20:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IX4HBNS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751710E114;
 Thu, 31 Oct 2024 20:34:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VAHosw009566;
 Thu, 31 Oct 2024 20:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mMLJI7Zwou0AIfa5DBCGV8tXsi5TaBK6b4xbCUPc4mA=; b=IX4HBNS9ubgXkUOY
 ll0KEMC3Rr0iZW2NE6WNZWzir+ImtEys8M/LfgiMvAGOEfGIscVArTwRQvcwCleS
 bAlF4EPEiACxL0TQTDBudVQVokvCFIp+GiDOXocVfsuv6fhq1KkjXj2pIIcNBZ3L
 7mf05NSfO0a4QpkGj8zqLse4gW1e2WGOWCE3QLA/LwqUMyyQaWupMTD2GWBwCg9o
 0lPV+MXuyuacf+qipoIFInK9U8U+fbHsdzX+VRBaxMorL+bXGMpTmhakKi02f0Zf
 uRMbUzIKrscR/GbbPRphSfHQAiihWA5b3dTXtVSNneExZ9pFRTMjRjuTEkOKE06x
 3rwNNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kjm1d6x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2024 20:34:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VKYKXg007835
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2024 20:34:20 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 13:34:19 -0700
Message-ID: <52f47e00-8da8-4b02-8a36-bbfad015ed66@quicinc.com>
Date: Thu, 31 Oct 2024 13:34:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] i2c: skip of_i2c_register_device() for invalid child
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <swboyd@chromium.org>, <airlied@gmail.com>,
 <quic_jesszhan@quicinc.com>, <lyude@redhat.com>, <simona@ffwll.ch>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
 <CAA8EJppKou84MZm0JS_4bPveMO2UxpMs5ejCoL7OMWd-umtDmQ@mail.gmail.com>
 <92217ec6-c21c-462a-a934-9e93183c1230@quicinc.com>
 <mlpiuko7n6rp3x55z4qterdns2wzqnfwgjxikbshrvakrscsak@antl2vzla5bd>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <mlpiuko7n6rp3x55z4qterdns2wzqnfwgjxikbshrvakrscsak@antl2vzla5bd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _lT_b00_izNCYu-5d_JS0vLEL-HnIb-V
X-Proofpoint-ORIG-GUID: _lT_b00_izNCYu-5d_JS0vLEL-HnIb-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310155
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



On 10/31/2024 12:30 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 31, 2024 at 11:45:53AM -0700, Abhinav Kumar wrote:
>>
>>
>> On 10/31/2024 11:23 AM, Dmitry Baryshkov wrote:
>>> On Wed, 30 Oct 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> of_i2c_register_devices() adds all child nodes of a given i2c bus
>>>> however in certain device trees of_alias_from_compatible() and
>>>> of_property_read_u32() can fail as the child nodes of the device
>>>> might not be valid i2c client devices. One such example is the
>>>> i2c aux device for the DRM MST toplogy manager which uses the
>>>> display controller device node to add the i2c adaptor [1] leading
>>>> to an error spam like below
>>>>
>>>> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
>>>> i2c i2c-20: of_i2c: modalias failure on /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
>>>> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
>>>> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>>>> i2c i2c-20: of_i2c: invalid reg on /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>>>> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>>>>
>>>> Add protection against invalid child nodes before trying to register
>>>> i2c devices for all child nodes.
>>>>
>>>> [1] : https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_dp_mst_topology.c#L5985
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    drivers/i2c/i2c-core-of.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
>>>> index a6c407d36800..62a2603c3092 100644
>>>> --- a/drivers/i2c/i2c-core-of.c
>>>> +++ b/drivers/i2c/i2c-core-of.c
>>>> @@ -86,6 +86,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>>>>    {
>>>>           struct device_node *bus, *node;
>>>>           struct i2c_client *client;
>>>> +       u32 addr;
>>>> +       char temp[16];
>>>>
>>>>           /* Only register child devices if the adapter has a node pointer set */
>>>>           if (!adap->dev.of_node)
>>>> @@ -101,6 +103,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>>>>                   if (of_node_test_and_set_flag(node, OF_POPULATED))
>>>>                           continue;
>>>>
>>>> +               if (of_property_read_u32(node, "reg", &addr) ||
>>>> +                   of_alias_from_compatible(node, temp, sizeof(temp)))
>>>> +                       continue;
>>>
>>> I think just of_property_read_u32() should be enough to skip
>>> non-I2C-device children. If of_alias_from_compatible() fails, it is a
>>> legit error.
>>>
>>
>> Thanks for the review.
>>
>> of_alias_from_compatible() looks for a compatible string but all child nodes
>> such as ports will not have the compatible. Hence below error will still be
>> seen:
>>
>> i2c i2c-20: of_i2c: modalias failure on
>> /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
> 
> But ports node don't have a reg property too, so it should be skipped
> based on that.
> 

hmmm this is a good point. I see that individual port@ nodes do have a 
reg but ports node does not.

I will re-test this once without the of_alias_from_compatible() and drop 
the of_alias_from_compatible in v2.

>>
>>>> +
>>>>                   client = of_i2c_register_device(adap, node);
>>>>                   if (IS_ERR(client)) {
>>>>                           dev_err(&adap->dev,
>>>> --
>>>> 2.34.1
>>>>
>>>
>>>
> 
