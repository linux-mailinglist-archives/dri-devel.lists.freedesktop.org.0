Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA67B5EB1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E75F10E19B;
	Tue,  3 Oct 2023 01:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3571010E094;
 Tue,  3 Oct 2023 01:33:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3930kbZF031647; Tue, 3 Oct 2023 01:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eQzTMLkI/SRnx3s8MUN9c1/X05zKDhSPiiowucxwbdc=;
 b=njecMQ/jKOtuFgJ/7DfaiOJvutb63oEelRpFLy4ORPirH8Z8N4YQTmMZQJEyuyy3cwAJ
 0wpBCvqm6mrNtlPCOXGavPoD5iTCKrSqziOTxChaMwEgD7bSFk2Ol1luOpmxCRghC7xI
 0g8dsM3fWCJnJ1V64Du9VgzzAqrPNuHaap+njjeT2cVhbvBcmXtkP1zoVqhP3XaGeqpO
 oo9N7CaJiGRZGsmxAkdjW+treslP57HQTybG8EdArpTCH5/aX8KW0EtGCQ5lX3ZJO6UA
 PxXzRw907iHEOLS3PmaR93pn6ohErQKa/hHGxA8xsL5KyhiTosV1B5ln4xNiqQWabLNy SQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tg1v38yea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Oct 2023 01:32:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3931WqWG008541
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Oct 2023 01:32:52 GMT
Received: from [10.110.1.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 2 Oct
 2023 18:32:49 -0700
Message-ID: <b9bd5423-f6e3-e511-613c-b6535c27b205@quicinc.com>
Date: Mon, 2 Oct 2023 18:32:47 -0700
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
 <1d9bf80d-0267-937b-4dd9-c57db7a89cb4@quicinc.com>
 <CAE-0n51Hrs66oG4NF5rDETkVO-ocG_6_=Aqc5cE-qPDViSgKyA@mail.gmail.com>
 <58701008-bb93-e5c6-9ca0-5bc43f9a46f0@quicinc.com>
 <CAE-0n50N6hXM7qQZzccKy2X-kcru9n7Nvgn_V4tOHTnLn64qjw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n50N6hXM7qQZzccKy2X-kcru9n7Nvgn_V4tOHTnLn64qjw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FEktAmGvqznxNRqtU58vxTDLwBAln3xk
X-Proofpoint-ORIG-GUID: FEktAmGvqznxNRqtU58vxTDLwBAln3xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_16,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310030011
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



On 10/2/2023 3:58 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2023-09-28 17:46:11)
>> On 9/27/2023 3:01 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2023-09-25 09:07:18)
>>>>
>>>> However for external DP case, link training can not be guarantee always
>>>> success without link rate or lane being reduced as Abhinav mentioned.
>>>>
>>>> In addition,  CTS (compliance test) it required to complete link
>>>> training within 10ms after hpd asserted.
>>>
>>> Is it possible to change that timeout? I have to look around for the CTS
>>> parameters because I'm pretty confused how it can work. What do we do if
>>> DP wakes the system from suspend and asserts HPD? We need resume time to
>>> be < 10ms?  That's not realistic.
>>>
>>
>> No, the CTS doesnt say we need to finish link training within 10ms after
>> HPD is asserted. It says it must be completed in 10ms after
>> TRAINING_PATTERN_SET dpcd write.
>>
>> "Wait until the Source DUT writes 00h to the TRAINING_PATTERN_SET byte
>> of Reference Sink DPCD Link Configuration Field to indicate the end of
>> the link training. Stop the link training timer. Verify that link
>> training completed in 10ms or less"
>>
>> That needs to be done independent of HPD so we can ignore the CTS point.
> 
> Great!
> 
>>
>>>>
>>>> I am not sure do link training at atomic_enable() can meet this timing
>>>> requirement.
> 
> Why? It's putting some time bound on link training in general to only
> take 10ms, right?
> 

Like I said, CTS is mentioning 10ms to finish link training after the 
DUT writes 00h to the TRAINING_PATTERN_SET byte. So for this discussion 
lets leave out CTS for now.

>>>>
>>>
>>> At least in the DP spec itself it doesn't require the link to be trained
>>> within 10ms of HPD being asserted. Instead it simply recommends that the
>>> OS start configuring the display promptly after HPD is asserted, e.g.
>>> within 100ms. There's some strict timing on IRQ_HPD, so the driver must
>>> read DPCD registers within 100ms of IRQ_HPD rising edge; maybe that is
>>> what CTS is checking for?
>>>
>>> TL;DR: I don't see why CTS should stop us from link training in
>>> atomic_enable(). It would be beneficial to do so to make eDP and DP the
>>> same. It would also help to report a drm connector being connected
>>> _before_ link training so that userspace knows the link itself is the
>>> bad part of the equation (and not that the DP connector looks
>>> disconnected to userspace when in fact it really is connected and the
>>> monitor is asserting HPD, just the link training failed).
>>
>> Its the corrective action of the userspace when it finds link is bad is
>> the concern as I highlighted in the other response. Just reading and
>> resetting link_status is not enough to recover.
> 
> What needs to be done to recover? Userspace will try to set a mode on
> the connector again if the link status is bad and there were some modes
> available. If there are zero modes and the link is bad, then it ignores
> the connector. I'm not sure what else could be done to recover besides
> try again and stop trying if no modes exist.
> 

Let me re-explain if I didnt make this clear last time.

You are right. Thats all the "userspace" can do which is basically retry 
the mode. And like I said, its again only going to fail. All the 
corrective actions you mentioned below like ignoring the connector 
entirely or consider that the display has link training problems are not 
something we decided to go with on a commercial device where we expect 
things to be more reliable.

Let me re-explain what I explained in the prev response.

If driver issues hot-plug after link-training:

It would have implemented all the link training mechanisms such as 
trying lower rates/number of lanes and made sure that when the usermode 
queries the list of modes, only the modes which fit into the link rate 
which was link trained successfully will be exposed and the chances of a 
user ending up with a blank screen on connection are pretty high.

This reduces the dependency on usermodes to be smart enough to implement 
such policies and we would rather not depend on those unless we have 
some reference to a compositor which is more sturdy. I do not think the 
CrOS code you have pointed to is more sturdy than the driver mechanism 
explained above.

As opposed to this, if we just issue hotplug without any of this, 
usermode does not know which mode to retry as we do not remove or edit 
the mode list once link training fails.

> Acting like the connector isn't connected makes the situation worse for
> ChromeOS because userspace thinks there's nothing there so it can't try
> to retrain the link again. Instead, userspace has to rely on the kernel
> driver to train the link again. The kernel should just tell userspace
> the link is bad so userspace can implement the policy to either ignore
> the connector entirely or to consider it a display that is having link
> training problems.
> 

What gain will it give if it retries the same mode blindly as opposed to 
the safer option I have explained above. None of the policies you have 
highlighted seem like something an end user will be satisfied with.

> So again, I see no reason why the kernel driver thinks it can implement
> a policy to train the link before indicating the drm connector is
> connected. It should stop doing that. Instead it should tell userspace
> that the connector is connected and then train the link when there's a
> modeset. If the modeset fails then userspace can take action to either
> figure out that the link is bad, or notify the user that the cable is
> bad, or to try replugging or power cycle the monitor, etc. None of that
> can be done if the kernel lies about the state of the connector because
> the link training failed.

Usermode is unable to take the corrective action without proper support 
from the kernel like removing unsupported modes etc and I dont see other 
drivers taking an action like that. Kernel is not lying. Its delaying 
the status to a point where usermode can safely handle.

Please explain to me how any of the policies you have explained usermode 
can take are safer and have more chance of success than what we have now.
