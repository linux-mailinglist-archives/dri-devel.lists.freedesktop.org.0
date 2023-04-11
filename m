Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624D6DE68E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 23:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CF410E696;
	Tue, 11 Apr 2023 21:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD0D10E139;
 Tue, 11 Apr 2023 21:36:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BLZoHq005235; Tue, 11 Apr 2023 21:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yi66xqTXmrXM4706RJ42Os6COYBm/l9WO25/oo1BeUg=;
 b=A5JuXgOxleIaKb3vY9kfRLaWU3C7o67EYuyrtk519pHTuMFgQEXzFDd2H0J8Usyh0gqb
 hhXAt53FswBRD2Rigx79w1rGN4EWz3RbjAfBo55LT9YhqDrxVN5pBeBDjAwrEx4BXqy1
 w2c/omWnu2eYwgibgYxkTGGAuPTJR3tQ416nGWXLveyo0aXWLZjYVKBz0gCikc9cfhRb
 An38Dx+6ANSOIrqolMD7LzEjMEGKuwC5SFXrZ6KXFvlo8h9AaX6wILq0gkJ4wBnzms9I
 r0FzMp+q8cwqbH+usGpKDFy2h4FhdOpKFwCspOo+mJquKp6wBlxjsmOz3G++F2jpNcpb yg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwe5j857r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 21:36:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33BLaBm1020690
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 21:36:11 GMT
Received: from [10.110.115.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 11 Apr
 2023 14:36:10 -0700
Message-ID: <a8deba9a-0be1-b70b-8a6d-4a35d5788b2f@quicinc.com>
Date: Tue, 11 Apr 2023 14:36:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: add DSC range checking during resource
 reservation
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
References: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oWsQaHGVlIiu9QRQ01kTCu0iF4WKLSrj
X-Proofpoint-ORIG-GUID: oWsQaHGVlIiu9QRQ01kTCu0iF4WKLSrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_14,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110193
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/2023 2:09 PM, Kuogee Hsieh wrote:
> Perform DSC range checking to make sure correct DSC is requested before
> reserve resource for it.
> 
> Fixes: c985d7bb64ff ("drm/msm/disp/dpu1: Add DSC support in RM")

I cannot find any fixes tag with this hash.

This is the right one.

Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Otherwise, seems quite reasonable to me,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
