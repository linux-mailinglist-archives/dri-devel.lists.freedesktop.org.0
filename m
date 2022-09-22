Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2155E6CA2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 22:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A75910E092;
	Thu, 22 Sep 2022 20:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA3110E092;
 Thu, 22 Sep 2022 20:03:03 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MJPhFH005513;
 Thu, 22 Sep 2022 20:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=K+Xi7TmjvvK5loJ7d8ijdozv4jEQrQh7PtQSTQp+nB0=;
 b=VPBxGkmerblhxkhuMLNof/y5GHkB1d/FsWNQDSF+eWd+Umbbq0/xP9uak1vE1QsFaF5B
 HhYcmNhBzjTqLDJAl0uwKE0TQn1a0CKaNqbWEpu0K94NROsdO999cvF8znoJ9MQuk0VH
 92BEcPSUPddh9PU0Xm4LyvFGZ1hFtrj7sCoH2mecPZ1EjM/Px3zYTaeiq7H2PK5d/YIw
 XQ1/C2cD4NkGn7oGvN8DG69Jy49ir2ycLIG475kgRU7Of5wPftS8S2mAfkznOie9nLoS
 +Sq0AXhIaJ55fupuiTrCEB79K0l6+GPi3bebJZlM70GpZzBe9WmmQSJMaGJHujWu0cpp VA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrpp996jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 20:02:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28MK2qo3026794
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 20:02:52 GMT
Received: from [10.110.101.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 22 Sep
 2022 13:02:51 -0700
Message-ID: <5d5b7250-37f0-ca36-c9d7-a83ab8eb5a5a@quicinc.com>
Date: Thu, 22 Sep 2022 13:02:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 06/10] drm/msm/dp: fix aux-bus EP lifetime
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Johan Hovold
 <johan+linaro@kernel.org>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-7-johan+linaro@kernel.org>
 <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KWEhbisclbBtKGMvQxa0Nszmch_tBiHx
X-Proofpoint-ORIG-GUID: KWEhbisclbBtKGMvQxa0Nszmch_tBiHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209220129
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "# 4.0+" <stable@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/13/2022 5:36 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Sep 13, 2022 at 9:58 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>> Device-managed resources allocated post component bind must be tied to
>> the lifetime of the aggregate DRM device or they will not necessarily be
>> released when binding of the aggregate device is deferred.
>>
>> This can lead resource leaks or failure to bind the aggregate device
>> when binding is later retried and a second attempt to allocate the
>> resources is made.
>>
>> For the DP aux-bus, an attempt to populate the bus a second time will
>> simply fail ("DP AUX EP device already populated").
>>
>> Fix this by tying the lifetime of the EP device to the DRM device rather
>> than DP controller platform device.
>>
>> Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
>> Cc: stable@vger.kernel.org      # 5.19
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
> This seems fine to me as a short term fix until we get the DP AUX
> populating moved to probe.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
