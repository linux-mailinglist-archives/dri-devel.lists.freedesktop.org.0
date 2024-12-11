Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C6D9EC5A7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 08:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C01610E3E8;
	Wed, 11 Dec 2024 07:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ts7abG4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6831E10E3E8;
 Wed, 11 Dec 2024 07:37:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB2FnWq020687;
 Wed, 11 Dec 2024 07:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2ApkyV010oEBw1KPZSHLnLAdIS0MyeeyKe4GabfFW3g=; b=Ts7abG4VA6zZ1hpF
 7myPQyZBx5yd/EuxcsQusfTeEyPgWNZXg1yPR1CELL355J8xSnsMnaH3Vo5t6cc+
 3k/Dt/ZH6EnCaeQtlNAsSg2gL3RBC4Qiv7geoSNFSCvwoXnBl/Ni+eDs8zK5kAil
 VV9knBRWDhVGw6a/iFBO7CXN156zNkMVKjdCuTdmmB7KEOgCU+27EzQHYg28e12O
 mnBIyjlxFw+aeUxIxq2G3yLXVHRlEor1aSFi4BhCOAMflDxpi4AEUknXU24Inhxw
 EaAKGSUS9UwBVHEUtYoerDSbQeYYWlH895VbO6PXM4BtPeuPtmifWS1fJO9Ebq4e
 Yhd2Yg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e341e1qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 07:37:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB7b64l019213
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2024 07:37:06 GMT
Received: from hu-pkondeti-hyd (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 23:37:01 -0800
Date: Wed, 11 Dec 2024 13:06:58 +0530
From: Pavan Kondeti <quic_pkondeti@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Pavan Kondeti <quic_pkondeti@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Elliot Berman
 <quic_eberman@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <b47d44cc-77b7-4137-97e3-b245e1394580@quicinc.com>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
 <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
 <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
 <CAF6AEGs4EebrwyQZviNXqB2=3h2wgZpmbrdGHuEU4z1D014GRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs4EebrwyQZviNXqB2=3h2wgZpmbrdGHuEU4z1D014GRA@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nyRwFXNdLr3D4MyGX4UnRiE7tbAfjMpJ
X-Proofpoint-ORIG-GUID: nyRwFXNdLr3D4MyGX4UnRiE7tbAfjMpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110056
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

+devicetree

On Tue, Dec 10, 2024 at 07:43:19PM -0800, Rob Clark wrote:
> On Tue, Dec 10, 2024 at 7:08 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> > > On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
> > >> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > >>> On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> > >>>>
> > >>>> When kernel is booted in EL2, SECVID registers are accessible to the
> > >>>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> > >>>> on Zap firmware. Also, we can't load a secure firmware without a
> > >>>> hypervisor that supports it.
> > >>>
> > >>> Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
> > >>
> > >> This is better, isn't it? Otherwise, multiple overlays should be
> > >> maintained for each soc/board since EL2 can be toggled from bootloader.
> > >> And this feature is likely going to be more widely available.
> > >>
> > >
> > > The DeviceTree passed to the OS needs to describe the world that said OS
> > > is going to operate in. If you change the world you need to change the
> > > description.
> > > There are several other examples where this would be necessary
> > > (remoteproc and watchdog to name two examples from the Qualcomm upstream
> > > world).
> >
> > But basic things work without those changes, right? For eg: Desktop UI
> 
> It isn't really so much about whether certain use-cases can work with
> a sub-optimal description of the hw (where in this case "hw" really
> means "hw plus how the fw allows things to look to the HLOS").. It is
> more about the hw/fw/whatever providing an accurate description of
> what things look like to the HLOS.
> 
> I'm leaning more towards the hw+fw providing HLOS an accurate view...
> and the fact that that carries over into other areas of dtb (ie. it
> isn't the only thing that slbounce needs to patch, as I previously
> mentioned) reinforces my view there.  This seems like a thing to fix
> in fw/bootloader tbh.
> 

Thanks Rob and Bjorn for your inputs. At the moment, we don't have
capability in our bootloader to apply a *specific* overlay when Linux
kernel is starteed in EL, this is making GPU non-functional. This patch
from Akhil fixes the problem without depending on the bootloader.

From this discussion, I understand that it is recommended to provide
HW+FW view in dT correctly instead of doing runtime checks in the
kernel. We can take this as a requirement to the bootloader.

I would like to check how we should proceed with overlay. Should we
submit dtso upstream and let bootloader apply the overlay at runtime or
this whole overlay needs to be maintained in the bootloader. Also,
Should we build all board dtb for EL2 as well or just leave it at compiling
the EL2 dtbo (one per SoC)?

Thanks,
Pavan
