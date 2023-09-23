Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C37ABD1A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 03:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5543E10E021;
	Sat, 23 Sep 2023 01:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CEA10E087;
 Sat, 23 Sep 2023 01:35:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38N16bxV006809; Sat, 23 Sep 2023 01:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=C5Pi/Hiu81gwHXsRnreMP9dALYwD5nvn3uXY+FzJ5CU=;
 b=UR/I0rfH5D+g0vFQjL3/9zWDvCQgqo3aCrSWEtKcbrdDnwAX4m1qrAIet41PNXQ8pYiH
 p6elEErFhNZmClpyoo4ELt75aqRgBb9VuUflbvgVaIqmGlAzV/Ci1FlwztYmaNH9lagT
 9C6QuKLVm4/5+ee2fyQYp9Mc99tYxNJNQlvqypZDVBmv/EGRIeyxjEz9/BQVzmcNcJCR
 YIWBFaphfAMVTpPZbjaQxe1387SzlynkTwmVIPQLLHRvhss96t3Ywra2CRy1h63xE0wO
 lJcl6kjTyB1Z35MzalJsK+h77ELyxO8LnqXhBbdQypVoCRa5ESCLIhDpA0yvjCob42RL iA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9nqnr1ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 23 Sep 2023 01:35:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38N1ZThO017144
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 23 Sep 2023 01:35:29 GMT
Received: from [10.110.28.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 18:35:28 -0700
Message-ID: <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
Date: Fri, 22 Sep 2023 18:35:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 6/7] drm/msm/dp: add pm_runtime_force_suspend()/resume()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-7-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqPXoFX4LXyXYgfh07Vpxg-KgD8VBR6x5bXf4GOJmbOtw@mail.gmail.com>
 <2f98d5f1-57c1-d9fe-cb1c-b975db057287@quicinc.com>
 <CAA8EJpr2wRq6Txi7YAQpJKa_9UGqH_nmHzvVOaAPkwOrtDg4Tw@mail.gmail.com>
 <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n53dqHONzMTd_ZC-fKWTzDVq6Wqwo4OFZMUcghZ5SD5RhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UlklZ01rmbcdcrNvAHp9SEp5pFYq-myZ
X-Proofpoint-ORIG-GUID: UlklZ01rmbcdcrNvAHp9SEp5pFYq-myZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_21,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309230013
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 9/22/2023 2:54 PM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-09-19 02:50:12)
>> On Mon, 18 Sept 2023 at 20:48, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>
>>>
>>> On 9/15/2023 6:21 PM, Dmitry Baryshkov wrote:
>>>> On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>> Add pm_runtime_force_suspend()/resume() to complete incorporating pm
>>>>> runtime framework into DP driver. Both dp_pm_prepare() and dp_pm_complete()
>>>>> are added to set hpd_state to correct state. After resume, DP driver will
>>>>> re training its main link after .hpd_enable() callback enabled HPD
>>>>> interrupts and bring up display accordingly.
>>>> How will it re-train the main link? What is the code path for that?
>>>
>>> 1) for edp, dp_bridge_atomic_enable(), called from framework, to start
>>> link training and bring up display.
>>
>> And this path doesn't use .hpd_enable() which you have mentioned in
>> the commit message. Please don't try to shorten the commit message.
>> You see, I have had questions to several of them, which means that
>> they were not verbose enough.
>>
>>>
>>> 2) for external DP, HPD_PLUG_INT will be generated to start link
>>> training and bring up display.
>>
>> This should be hpd_notify, who starts link training, not some event.
> 
> I think this driver should train the link during atomic_enable(), not
> hpd_notify() (or directly from the irq handler). The drm_bridge_funcs
> talk a bit about when the clocks and timing signals are supposed to be
> enabled. For example, struct drm_bridge_funcs::atomic_pre_enable() says
> the "display pipe (i.e.  clocks and timing signals) feeding this bridge
> will not yet be running when this callback is called". And struct
> drm_bridge_funcs::atomic_enable() says "this callback must enable the
> display link feeding the next bridge in the chain if there is one."
> 
> That looks to me like link training, i.e. the display link, should
> happen in the enable path and not hpd_notify. It looks like link
> training could fail, but when that happens I believe the driver should
> call drm_connector_set_link_status_property() with
> DRM_MODE_LINK_STATUS_BAD. The two callers of that which exist in the
> tree also call drm_kms_helper_hotplug_event() or
> drm_kms_helper_connector_hotplug_event() after updating the link so that
> userspace knows to try again.
> 
> It would be nice if there was some drm_bridge_set_link_status_bad() API
> that bridge drivers could use to signal that the link status is bad and
> call the hotplug helper. Maybe it could also record some diagnostics
> about which bridge failed to setup the link and stop the atomic_enable()
> chain for that connector.

Doing link training when we get hpd instead of atomic_enable() is a 
design choice we have been following for a while because for the case 
when link training fails in atomic_enable() and setting the link status 
property as you mentioned, the compositor needs to be able to handle 
that and also needs to try with a different resolution or take some 
other corrective action. We have seen many compositors not able to 
handle this complexity. So the design sends the hotplug to usermode only 
after link training succeeds.

I do not think we should change this design unless prototyped with an 
existing compositor such as chrome or android at this point.

Thanks

Abhinav
