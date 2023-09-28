Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D37B287E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 00:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB1610E6BB;
	Thu, 28 Sep 2023 22:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD38D10E6BD;
 Thu, 28 Sep 2023 22:36:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38SLYRRB023964; Thu, 28 Sep 2023 22:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0oLww7t8NDTz6izW9MTTTB5935394WQk9q/qSKmqzyc=;
 b=Ts92vjeVu9hrV6OvcFfsTQ6n19jahFEaBO1FxeOMc4eHXNNTkskYJjhanq81fnWvB0LG
 YwMxsxo+zlf1rPtfVMlvzyJ5SG1PNztSKusr5LGho7G5SmX9Rjh0ow5akA47tnxlgcaj
 EhU0/RlWNu1Xxds2algjTGI7OXJoy3Fb84eRECKKjrqQzGD0mJDNeBKmkgzCx6wAdCeR
 5pEfcFy74YM+H8dTFyJYAFhKMUk7HyfbJ5BpFPkWgmq+nBdWI8VaUOGmwt9/stmKn+Wt
 v+o8DzbBZSALETLo3vgw/rK+r6toBSflsrEVUB+K3wT/O2z4xq2HkLbighr1haVoqMQE aw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcpkguvc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 22:35:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38SMZsD0031313
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 22:35:54 GMT
Received: from [10.110.70.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 28 Sep
 2023 15:35:51 -0700
Message-ID: <15ccacce-c20b-5fe2-5d89-a0627bd4a9e0@quicinc.com>
Date: Thu, 28 Sep 2023 15:35:49 -0700
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
 <65566a68-3510-2e5f-7d57-e4dba08c008c@quicinc.com>
 <CAE-0n51Ep4zBx6bswL4Yb+F0+8dW+L2kaKQaZBi-91jsVqm_9Q@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n51Ep4zBx6bswL4Yb+F0+8dW+L2kaKQaZBi-91jsVqm_9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: V3j7udvTMQzgURdnq_tEUPI5YIRroyh7
X-Proofpoint-ORIG-GUID: V3j7udvTMQzgURdnq_tEUPI5YIRroyh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_22,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280193
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



On 9/27/2023 2:41 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2023-09-22 18:35:27)
>> On 9/22/2023 2:54 PM, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2023-09-19 02:50:12)
>>>>
>>>> This should be hpd_notify, who starts link training, not some event.
>>>
>>> I think this driver should train the link during atomic_enable(), not
>>> hpd_notify() (or directly from the irq handler). The drm_bridge_funcs
>>> talk a bit about when the clocks and timing signals are supposed to be
>>> enabled. For example, struct drm_bridge_funcs::atomic_pre_enable() says
>>> the "display pipe (i.e.  clocks and timing signals) feeding this bridge
>>> will not yet be running when this callback is called". And struct
>>> drm_bridge_funcs::atomic_enable() says "this callback must enable the
>>> display link feeding the next bridge in the chain if there is one."
>>>
>>> That looks to me like link training, i.e. the display link, should
>>> happen in the enable path and not hpd_notify. It looks like link
>>> training could fail, but when that happens I believe the driver should
>>> call drm_connector_set_link_status_property() with
>>> DRM_MODE_LINK_STATUS_BAD. The two callers of that which exist in the
>>> tree also call drm_kms_helper_hotplug_event() or
>>> drm_kms_helper_connector_hotplug_event() after updating the link so that
>>> userspace knows to try again.
>>>
>>> It would be nice if there was some drm_bridge_set_link_status_bad() API
>>> that bridge drivers could use to signal that the link status is bad and
>>> call the hotplug helper. Maybe it could also record some diagnostics
>>> about which bridge failed to setup the link and stop the atomic_enable()
>>> chain for that connector.
>>
>> Doing link training when we get hpd instead of atomic_enable() is a
>> design choice we have been following for a while because for the case
>> when link training fails in atomic_enable() and setting the link status
>> property as you mentioned, the compositor needs to be able to handle
>> that and also needs to try with a different resolution or take some
>> other corrective action. We have seen many compositors not able to
>> handle this complexity.
> 
> The chrome compositor handles this case[1]. If the link status is set to
> bad and there are non-zero number of modes on a connected connector it
> resets the status to good to try again.
> 

Thanks for the link. Just resetting the property alone and trying again 
is going to lead to the same failure again. So that alone is 
insufficient and doesn't sound right.

As documented here:

https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-properties

"When user-space receives the hotplug uevent and detects a "BAD" 
link-status, the sink doesn't receive pixels anymore (e.g. the screen 
becomes completely black). The list of available modes may have changed. 
User-space is expected to pick a new mode if the current one has 
disappeared and perform a new modeset with link-status set to "GOOD" to 
re-enable the connector."

Picking a different mode is a reasonable attempt to try again but even 
that might fail again if it picks a mode which falls in the same link rate.

Thats why, to re-iterate what i mentioned, we need to see if some sort 
of a handshake fallback exists or can be implemented. It will need 
compositor support as well as driver change to maybe remove that mode etc.

We prioritized user experience here to make sure display_enable() wont 
fail otherwise the user might keep waiting for the screen to come up 
forever. With the driver ensuring link is trained and then reporting to 
usermode, its a safer option as the driver will train with the highest 
link rate / lane combination supported and also remove modes which dont 
fall in this bucket in dp_bridge_mode_valid.

Till we validate this, I would prefer to keep this change out of this 
series.

>> So the design sends the hotplug to usermode only
>> after link training succeeds.
> 
> I suspect this is why my trogdor device turns off after rebooting when I
> apply a ChromeOS update with the lid closed and DP connected. Userspace
> wants to know that a display is connected, but this driver is still link
> training by the time userspace boots up so we don't see any drm
> connector indicating status is connected. No drm connectors connected
> means the OS should shutdown.
> 

Interesting use case but I am not sure if thats whats happening till we 
debug that. Why should OS shutdown if connectors are not in "connected" 
state? Agreed, display will be off. But shouldnt compositor be alive in 
case it receives hotplug? The user (in this case you) never turned the 
device off so why should the OS shutdown?

>>
>> I do not think we should change this design unless prototyped with an
>> existing compositor such as chrome or android at this point.
> 
> Is this driver used with android?
> 

There are some internal efforts ongoing with prototyping this but I 
cannot comment more on this right now.

> [1] https://source.chromium.org/chromium/chromium/src/+/main:ui/ozone/platform/drm/gpu/hardware_display_plane_manager_atomic.cc;l=114;drc=67520ac99db89395b10f2ab728b540eef0da8292
