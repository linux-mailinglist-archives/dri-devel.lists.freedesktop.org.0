Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6965D5BB68E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 07:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3967210E427;
	Sat, 17 Sep 2022 05:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9B710E529;
 Fri, 16 Sep 2022 21:22:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GL7HsQ000349;
 Fri, 16 Sep 2022 21:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wUGXXztn75LJ9JzABXVfmagNY50hkoudX/9OXz0xTtI=;
 b=ma2nOq4uWKBObq8t367RVebHN78hq6gtvfOguoeeWdIPjvuHXOKb1bYGUCOhVhQaxWHr
 8coY/1B+o2dudKsitcWnPMgYamefTWEFS5vJ04ijy1ZBmjQdyOsnSVLHbOTHudPT2X/a
 o8+nrCaX86o/HhzUYfEByFEjv/N/vZDJol3TSRP37rqJpVp8xbNVZB0UNz8nl512dFzF
 K3rcsq0xqGlliwl/aeIPk44qDolGg5sOKtPM4MeD6YaxQPj5Mhfbo812w6jXzcA+guMC
 3vXzG+bhKo0x5IOUxifnrvfN3NusmlXbMimEMNLq5w/BHejCsVIcfPR3zfxSuIAHnppt 9w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jm94mc6ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 21:22:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28GLHWNL028408
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 21:17:32 GMT
Received: from [10.110.7.80] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 16 Sep
 2022 14:17:31 -0700
Message-ID: <07b39c97-30be-4e82-044e-51b0d98a5197@quicinc.com>
Date: Fri, 16 Sep 2022 14:17:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 5/7] drm/msm/dp: Implement hpd_notify()
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-6-quic_bjorande@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220916200028.25009-6-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: z8LfGOf-g9-UyVPMTPOXs_MrIm4FTRHI
X-Proofpoint-ORIG-GUID: z8LfGOf-g9-UyVPMTPOXs_MrIm4FTRHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_14,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=539
 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1011 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160152
X-Mailman-Approved-At: Sat, 17 Sep 2022 05:33:33 +0000
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/16/2022 1:00 PM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The DisplayPort controller's hot-plug mechanism is based on pinmuxing a
> physical signal no a GPIO pin into the controller. This is not always

nit: s/ no / on /?

> possible, either because there aren't dedicated GPIOs available or
> because the hot-plug signal is a virtual notification, in cases such as
> USB Type-C.

