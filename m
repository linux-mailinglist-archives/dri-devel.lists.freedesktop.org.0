Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86611919A20
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB5110E1CC;
	Wed, 26 Jun 2024 21:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gPa83Fiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E960710E165;
 Wed, 26 Jun 2024 21:52:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfUup022696;
 Wed, 26 Jun 2024 21:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=qIwvRHU1HPsS7DudEDwvKVGI
 UGLiVRN2T5iRCevDCoY=; b=gPa83Fiu0P/zuPWJefsmy+XuGboc0ZvleC/eQMpg
 eDI5Fd/20xvQImg92bABhV0oDwFIo+Vtt05E82KphYWAWImTYzuF8Bw/UN+r2y9t
 f7tZHwMYN77qGrqWzVKtVWGLJ8Av71Lp0XsIrb80ZOaVPtg7K5DBtvhJfgNu8Bgv
 7MvTZobbqyA3SDi6+SFTfThYNRxuAIhJhAz0GduKKtlASYDHvWlVNtu0t6st0e5M
 U8f9hfhVokVX67WHSESRSyiV34YItv6DjPN7be06C7Er5/xq4sdJDkX9tI+klAO+
 nvp4tzFLsrDBfSiYVfZJM4bEet7XpTiniZBqCNVp/i+dZQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9j7v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 21:52:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QLqQ21006025
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 21:52:26 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 14:52:22 -0700
Date: Thu, 27 Jun 2024 03:22:18 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Kiarash Hajian <kiarash8112hajian@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
Message-ID: <20240626215218.pnbzy25c74c7a22a@hu-akhilpo-hyd.qualcomm.com>
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
 <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
 <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGt5=bcni0K1ysot3-hVj9gWECJ5qP=M-sEDkRrAmEHFGg@mail.gmail.com>
 <20240625202308.prg72urp4mvtxzax@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGs4i4mM9dpD3weG8GunHHfM0JESkzgX1Wd4PBDYatbQqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAF6AEGs4i4mM9dpD3weG8GunHHfM0JESkzgX1Wd4PBDYatbQqg@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7ZxKhyL2RdKhbIx27bF2rkglQuR3c--L
X-Proofpoint-GUID: 7ZxKhyL2RdKhbIx27bF2rkglQuR3c--L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_14,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=832 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260160
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

<< snip >>

> > > > > > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> > > > > >                 return ERR_PTR(-EINVAL);
> > > > > >         }
> > > > > >
> > > > > > -       ret = ioremap(res->start, resource_size(res));
> > > > > > +       ret = devm_ioremap_resource(&pdev->dev, res);
> > > > >
> > > > > So, this doesn't actually work, failing in __request_region_locked(),
> > > > > because the gmu region partially overlaps with the gpucc region (which
> > > > > is busy).  I think this is intentional, since gmu is controlling the
> > > > > gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> > > > > overlapping region.  Maybe Akhil knows more about GMU.
> > > >
> > > > We don't really need to map gpucc region from driver on behalf of gmu.
> > > > Since we don't access any gpucc register from drm-msm driver, we can
> > > > update the range size to correct this. But due to backward compatibility
> > > > requirement with older dt, can we still enable region locking? I prefer
> > > > it if that is possible.
> > >
> > > Actually, when I reduced the region size to not overlap with gpucc,
> > > the region is smaller than REG_A6XX_GPU_CC_GX_GDSCR * 4.
> > >
> > > So I guess that register is actually part of gpucc?
> >
> > Yes. It has *GPU_CC* in its name. :P
> >
> > I just saw that we program this register on legacy a6xx targets to
> > ensure retention is really ON before collapsing gdsc. So we can't
> > avoid mapping gpucc region in legacy a6xx GPUs. That is unfortunate!
> 
> I guess we could still use devm_ioremap().. idk if there is a better
> way to solve this

Can we do it without breaking backward compatibility with dt?

-Akhil

> 
> BR,
> -R
> 
> > -Akhil.
> >
> > >
> > > BR,
> > > -R
