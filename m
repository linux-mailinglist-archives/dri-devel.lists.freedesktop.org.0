Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FE6BC3D5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 03:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CEF88DA9;
	Thu, 16 Mar 2023 02:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE5388DA9;
 Thu, 16 Mar 2023 02:36:12 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G24v6l031896; Thu, 16 Mar 2023 02:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=05A5Fd6+yPWKz+JHS3bo5WpbGb9EWFg1cqLhx+b36+k=;
 b=i4XGtk2ax4fMWuxJB5HRCp5VBQpdLprJ32nr0lCMvMlB0Ur9h6l+rD+lt288R9JLcAkV
 xDYj/HFzHBrM1ywKpBqux3PoxjHAobxiiUozDPqRNUr8RJD6KU20fMdmE4Klg0NTTIvP
 /jc1zyalPyO92OhbL8/0Z6JmJsdToLfI3ucqS+eMH/DXE14pZ3Nwz6wBECdTDNmYbj83
 BRiCKqWhbClO6AGX10U48Z2abTzTUJhdc3TDxv89ePlPXHfURvUn63dO5vbnDRtg4lRn
 orlgTqGimgowxVCqfwClMl74qZ+s0dqrhXAEB79pbglpo7qmxRUssZY5xy6h2CToqRPN Tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxjretd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 02:36:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G2a3gW010872
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 02:36:03 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 19:36:02 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: (subset) [PATCH v2] drm/msm/disp/dpu: fix sc7280_pp base offset
Date: Wed, 15 Mar 2023 19:35:51 -0700
Message-ID: <167893410626.12323.14919462334772351303.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1677533800-3125-1-git-send-email-quic_khsieh@quicinc.com>
References: <1677533800-3125-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: di2Cg6JoXmsS3IcGuqCfeZZvJ04WNLMY
X-Proofpoint-ORIG-GUID: di2Cg6JoXmsS3IcGuqCfeZZvJ04WNLMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 suspectscore=0 mlxlogscore=974 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160022
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 27 Feb 2023 13:36:40 -0800, Kuogee Hsieh wrote:
> At sc7280, pingpong block is used to management the dither effects
> to reduce distortion at panel. Currently pingpong-0 base offset is
> wrongly set at 0x59000. This mistake will not cause system to crash.
> However it will make dither not work. This patch correct sc7280 ping
> pong-0 block base offset.
> 
> Changes in v2:
> -- add more details info n regrading of pingpong block at commit text
> 
> [...]

Applied, thanks!

[1/1] drm/msm/disp/dpu: fix sc7280_pp base offset
      https://gitlab.freedesktop.org/drm/msm/-/commit/ce68153edb5b

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
