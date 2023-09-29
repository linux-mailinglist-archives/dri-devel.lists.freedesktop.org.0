Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17287B29F0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 02:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E9810E041;
	Fri, 29 Sep 2023 00:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5CF10E041;
 Fri, 29 Sep 2023 00:46:32 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38SNvgNl026356; Fri, 29 Sep 2023 00:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=afqAn7dGHUrlAfXXYIxYiEc20eODfjmPGA+l2AIO5QA=;
 b=lQCH7OLOzUdEnhZzixzvQz5U/EUMM82fB4kCv8ctjF/XnzOVjKc7wTj7REpsvwunQDbQ
 muVpMkt9FwQbPY3x/DP92fM+jkWSjezxXWS3G997LNu/0eH+kEfQNvleb15T/XQDcj0R
 EDPDYRbHrM0wQWBe992gMUYCB8xXK431197vg2gnebESjYBAnuvVf/poqAvDrc6kfuHv
 yDzTBw9/lJXZDZSpP9y0SvztOii9YipwceqHpKZ9pTzddTZaedespblTWLHKqGiZU+eL
 5pT4Gc5LP3lnS8LjL6J4YM2xJBPTHob0nC+N4i4qKy5XRntVqvJ6G5ZHs+s6W+1KCGka uQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tdfbrrgh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Sep 2023 00:46:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38T0kGXO005113
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Sep 2023 00:46:16 GMT
Received: from [10.110.70.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 28 Sep
 2023 17:46:13 -0700
Message-ID: <58701008-bb93-e5c6-9ca0-5bc43f9a46f0@quicinc.com>
Date: Thu, 28 Sep 2023 17:46:11 -0700
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n51Hrs66oG4NF5rDETkVO-ocG_6_=Aqc5cE-qPDViSgKyA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: f0UFRBg3XnK49yRbyxc7x5Rx8Tc3NF6g
X-Proofpoint-GUID: f0UFRBg3XnK49yRbyxc7x5Rx8Tc3NF6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_24,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309290004
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



On 9/27/2023 3:01 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2023-09-25 09:07:18)
>>
>> On 9/22/2023 6:35 PM, Abhinav Kumar wrote:
>>>
>>> Doing link training when we get hpd instead of atomic_enable() is a
>>> design choice we have been following for a while because for the case
>>> when link training fails in atomic_enable() and setting the link
>>> status property as you mentioned, the compositor needs to be able to
>>> handle that and also needs to try with a different resolution or take
>>> some other corrective action. We have seen many compositors not able
>>> to handle this complexity. So the design sends the hotplug to usermode
>>> only after link training succeeds.
>>>
>>> I do not think we should change this design unless prototyped with an
>>> existing compositor such as chrome or android at this point.
>>>
>>> Thanks
>>>
>>> Abhinav
>>
>>
>> We did perform link training at atomic_enable() at eDP case since we can
>> assume link training will always success without link rate or link lane
>> being reduced.
>>
>> However for external DP case, link training can not be guarantee always
>> success without link rate or lane being reduced as Abhinav mentioned.
>>
>> In addition,  CTS (compliance test) it required to complete link
>> training within 10ms after hpd asserted.
> 
> Is it possible to change that timeout? I have to look around for the CTS
> parameters because I'm pretty confused how it can work. What do we do if
> DP wakes the system from suspend and asserts HPD? We need resume time to
> be < 10ms?  That's not realistic.
> 

No, the CTS doesnt say we need to finish link training within 10ms after 
HPD is asserted. It says it must be completed in 10ms after 
TRAINING_PATTERN_SET dpcd write.

"Wait until the Source DUT writes 00h to the TRAINING_PATTERN_SET byte 
of Reference Sink DPCD Link Configuration Field to indicate the end of 
the link training. Stop the link training timer. Verify that link 
training completed in 10ms or less"

That needs to be done independent of HPD so we can ignore the CTS point.

>>
>> I am not sure do link training at atomic_enable() can meet this timing
>> requirement.
>>
> 
> At least in the DP spec itself it doesn't require the link to be trained
> within 10ms of HPD being asserted. Instead it simply recommends that the
> OS start configuring the display promptly after HPD is asserted, e.g.
> within 100ms. There's some strict timing on IRQ_HPD, so the driver must
> read DPCD registers within 100ms of IRQ_HPD rising edge; maybe that is
> what CTS is checking for?
> 
> TL;DR: I don't see why CTS should stop us from link training in
> atomic_enable(). It would be beneficial to do so to make eDP and DP the
> same. It would also help to report a drm connector being connected
> _before_ link training so that userspace knows the link itself is the
> bad part of the equation (and not that the DP connector looks
> disconnected to userspace when in fact it really is connected and the
> monitor is asserting HPD, just the link training failed).

Its the corrective action of the userspace when it finds link is bad is 
the concern as I highlighted in the other response. Just reading and 
resetting link_status is not enough to recover.
