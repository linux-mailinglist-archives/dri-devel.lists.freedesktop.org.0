Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD15777BCC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 17:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2151610E557;
	Thu, 10 Aug 2023 15:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D368110E19E;
 Thu, 10 Aug 2023 15:11:45 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37ADtHYq032721; Thu, 10 Aug 2023 15:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=FZ+nlaKL9Qv79LM4WTrYUXZqedsB2SevqEK2guA852Q=;
 b=MUk2gAYmp9WErUweO6DsNuKa7GsJ7uo69cUqMYPdOjcaGqSfUjOOUt+ukFF4wdGlonRs
 NynhfOrujnXA1gWl96ZnDXhTCJfJXid26Www817CICEC+qOQmTiAKgxm5uiolreohLmk
 LlwWy2yYGf9kkXH+fz31Bx7oMBsvQJ0RZn3Mow64GfIfTx4/8/ufxkWzOnSWHSiDlk6y
 KfcQHUjpeVaKYTd7TdVkelgtsH4PCTBLm+I3ditBs0tCXtACvHu/rhUyFAmJW+Ly1EZX
 cqdZa/6Cq68StXHfRpJ1mfr5iKFXcB2mFM9elFBhWPalvDLumz7D/RpFTrBJFrfeP2MM Xg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sch7ct1xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 15:11:27 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AFBRlg009587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 15:11:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 10 Aug 2023 08:11:26 -0700
Date: Thu, 10 Aug 2023 08:11:25 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] drm/msm/adreno: adreno_gpu: Switch to
 memdup_user_nul() helper
Message-ID: <20230810151125.GO1428172@hu-bjorande-lv.qualcomm.com>
References: <20230810120424.2108348-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230810120424.2108348-1-ruanjinjie@huawei.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 38JCVTyiwyONUsfqvfPcsUGqS8mZxY0X
X-Proofpoint-GUID: 38JCVTyiwyONUsfqvfPcsUGqS8mZxY0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_12,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=692 mlxscore=0 adultscore=0 malwarescore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100129
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 08:04:24PM +0800, Ruan Jinjie wrote:
> Use memdup_user_nul() helper instead of open-coding to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn
