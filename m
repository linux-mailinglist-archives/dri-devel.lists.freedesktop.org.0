Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7BD9EC521
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADE510E5FE;
	Wed, 11 Dec 2024 06:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aaDwTFrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBD410EA29;
 Wed, 11 Dec 2024 00:40:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAHWQVg003763;
 Wed, 11 Dec 2024 00:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jWkVdOrrUJpu4291mJNo5ceP3fIrkV7JN6cPA3f5hZk=; b=aaDwTFrd0aa6WyIY
 dOMce8/P3NkjnGskCXtNVG7MoDqKsrhPYNfVlNu0RsGpcQo+E276AfMJd0rTUjAW
 3wVcOtSFcgSPyctKPEg6u5O9ODrp9gDAZxlkBpXgF7T+Y3KG+bmPtv2v6weqcrH8
 YwFLa8PQsztb3Z1mGFu2hu6rdfnEqiLJ+QsEApHStslvobtoMKEmIjNxZwLRR0QC
 7uuZ6LZNT/mquzMEN94sV+YMs352prkVinrbNY/zProXm1C7GHvH1S3sr+dq19hA
 TS+rIqCQ4HRMxdjAJFefCLK0TQRt1ZBwRhpjT+99109m7STO8QiasQ/De3+IIZ5e
 yYjl4g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgt861-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 00:40:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB0eE6E022702
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 00:40:14 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 16:40:09 -0800
Date: Wed, 11 Dec 2024 06:10:06 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, "Pavan
 Kondeti" <quic_pkondeti@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <8fc505a0-91ad-4188-8627-fa28fc73a2ae@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CACu1E7H0-zzEPv8ytmx_9XRe1t-RCc7enshgwk2r9-0gWK44hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7H0-zzEPv8ytmx_9XRe1t-RCc7enshgwk2r9-0gWK44hw@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PvmUjKDOnqJZQma83MfyC6K3d2j27XMo
X-Proofpoint-ORIG-GUID: PvmUjKDOnqJZQma83MfyC6K3d2j27XMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1011 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=980 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110002
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2024 at 05:52:27PM -0500, Connor Abbott wrote:
> On Mon, Dec 9, 2024 at 3:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > When kernel is booted in EL2, SECVID registers are accessible to the
> > KMD. So we can use that to switch GPU's secure mode to avoid dependency
> > on Zap firmware. Also, we can't load a secure firmware without a
> > hypervisor that supports it.
> >
> > Tested following configurations on sa8775p chipset (Adreno 663 gpu):
> >
> > 1. Gunyah (No KVM) - Loads zap shader based on DT
> > 2. KVM in VHE - Skips zap shader load and programs SECVID register
> > 3. KVM in nVHE - Loads zap shader based on DT
> > 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
> >         programs SECVID register
> >
> > For (1) and (3) configuration, this patch doesn't have any impact.
> > Driver loads secure firmware based on other existing hints.
> >
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
> For initializing CX_MISC_SW_FUSE_VALUE in a7xx_cx_mem_init(), we used
> !qcom_scm_is_available() to assume that the register is writable
> instead - can you just do that?
> 

qcom_scm_is_avaialble() returns true as most of the QC TZ firmware API
works w/ kernel running as bare metal i.e booted with EL2. Any services
that assume QC firmware @ EL2 (QHEE) is absent.

Thanks,
Pavan
