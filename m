Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF876FE7F8
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 01:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C550510E56E;
	Wed, 10 May 2023 23:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4BB10E56E;
 Wed, 10 May 2023 23:11:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AMsMj3026708; Wed, 10 May 2023 23:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HjDcgjS5DZW6UuYV8r11Pc/FqhPUIigxzCzfrJDDsV8=;
 b=b2UTSaL14g7a6n3Ef9MHaDiNmuUqqjzb3aB40mGEjZxLiHNRB9GpvikZGFqbb2X/89Cb
 QjfSVPcLx377UdWB44Uoxv/t+dpGIbUvI0Jt3oPMRkFRBa4oBNe06+krEAtpvZwio3Wi
 EIBv/C6N9BlCZ309QIsLyoz7qO3OewjM5yoM8gf4ZhzHUuO6iu5o/Oj/ZYRVNcf9AqzB
 ElerFEYnYhqVKh6/SEpok43rABeDH/m8bdGPuZ49Wu9e31yOM7bR9hQ/nIGK9zoLmIKg
 VO1f6sYIRUJ46lC50NCTs/UP+DuB/A6ze+jLL+3o+kslec8J0Vd2XASfthLpJHjDYdTX Xw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg79csqmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:11:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34ANBRr9015221
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:11:27 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 16:11:27 -0700
Message-ID: <74ae5514-2b04-9363-902e-cb4d7cbe1128@quicinc.com>
Date: Wed, 10 May 2023 16:11:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 2/2] drm/msm/dp: add mutex to protect internal_hpd
 against race condition between different threads
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <agross@kernel.org>,
 <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <vkoul@kernel.org>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n532y=ARQ_+urEA_b3zUn+gKTu1fgK_siHNt3CpbLB9PZg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n532y=ARQ_+urEA_b3zUn+gKTu1fgK_siHNt3CpbLB9PZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: N1Y7ho_dLycMuuFUqlQKFTZn30bqDzLf
X-Proofpoint-ORIG-GUID: N1Y7ho_dLycMuuFUqlQKFTZn30bqDzLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=712 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100192
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/10/2023 3:46 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2023-05-10 13:31:05)
>> Intrenal_hpd is referenced by event thread but set by drm bridge callback
>> context. Add mutex to protect internal_hpd to avoid conflicts between
>> threads.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
> 
> This patch looks completely unnecessary. How can dp_bridge_hpd_enable()
> be called at the same time that dp_bridge_hpd_disable() is called or
> dp_bridge_hpd_notify() is called? Isn't there locking or ordering at a
> higher layer?

Ack. We can drop this patch because we are protected by 
bridge->hpd_mutex in drm_bridge_hpd_enable() / drm_bridge_hpd_disable () 
and drm_bridge_hpd_notify().
