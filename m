Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8000F7E4A3A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 22:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E824B10E6B3;
	Tue,  7 Nov 2023 21:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AA010E6B3;
 Tue,  7 Nov 2023 21:01:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A7GfXVT026997; Tue, 7 Nov 2023 21:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7ZwM7r3QrT26WkewixkRvzlkvg33eyhy6lV/EJbSppw=;
 b=pMzkDX/kOsTWxo9K4EoSOBUAzo4ZzJj8Bl7zzLHYz+g/7SqKgtrwx0ER7ilsFq6JbVSS
 ZOI14UftbHZlMCbC3HEmQLdzqWra0XF02iYyz6+EXRWSWSZpIlfDLJUgKb3PNsNdXHfl
 bOFJzzcEGinFbR7MAwodO1KOBS34686x+xLysr9ogXe5LXoZF3u1QYKKSPimH2hRStWo
 OIxvftN2BUKNFSb2Fq1EQNPooDRBSAAUFsvdEZIjkBfsf3ilLeLiOqAPIUy2O3GFmInw
 mJz6FZ7f6ZkvusX9n1iBYfLQBGFgUNmg6cJJWGTTy9ZJqd4njN8qyw9vECUFhPB7RlmA 0w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u74v337y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Nov 2023 21:01:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A7L13jX016096
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Nov 2023 21:01:03 GMT
Received: from [10.110.83.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 7 Nov
 2023 13:01:01 -0800
Message-ID: <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
Date: Tue, 7 Nov 2023 13:00:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 0/7] incorporate pm runtime framework and eDP clean up
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: u0myOGG0V7VbiTtSM4TzrOb_sXsIbdRh
X-Proofpoint-ORIG-GUID: u0myOGG0V7VbiTtSM4TzrOb_sXsIbdRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-07_12,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=627
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2311070174
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
> On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> The purpose of this patch series is to incorporate pm runtime framework
>> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
>> driver during system probe time. During incorporating procedure, original
>> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
>> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
>> provided by pm runtiem framework such as pm_runtime_force_suspend() and
>> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
>> are bound at system probe time too.
>
> With this patchset in place I can crash the board using the following
> sequence (SM8350-HDK):
>
> - plug the USBC DP dongle
> - run modetest at any mode, don't press Enter yet
> - unplug the dongle
> - press Enter to stop modetest
>
> => the board resets to Sahara.
>
> Please ping me if you need any additional information from my side.

questiosn,

1) which dongle are you used?

2) what code branch shoud I used to duplicate this problem.

I can not duplicate  system crash problem at my setup kodiak (SM7325) 
chrome book with my PM runtime patch series.

my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)

I did:

1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC 
cable directly to 1080p display

2)  stop ui

3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at 
display)

4) unplug apple dongle or DP typeC cable

5) hit enter key

6) start ui

7) display back to login page of chrome book


