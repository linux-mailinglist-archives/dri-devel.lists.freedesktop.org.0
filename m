Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5867916FB6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 20:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D19810E6FD;
	Tue, 25 Jun 2024 18:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BEoG71qU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B4510E189;
 Tue, 25 Jun 2024 18:02:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P8Y91o029121;
 Tue, 25 Jun 2024 18:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/RGL8NHTH4b3pQ/JYRu7flha
 7u7/6/xKUKZWPQ+3m4M=; b=BEoG71qUjvpyRoZd0w7HjKyJ1LHWBjBUdEjIASpR
 /4GPse2pp7gXQzkj+r8opQOr7dblYFwQZHxUILhooZirupGEunwrtvFcrFKR3mRn
 kfTVEMfk92gZHjBPHMXLYTvC68/J0qYJjQ3Ynw73wsf2YYT1+MobOjjtuEkzV6UL
 +urLU+n9lMzZU5wi/r1iqM305jiuVDTmd8qzTg3MjTxmjCWkOByPD7IWbhc0LunJ
 aMfX7Ww/MxPDq/BWgKgTG+nY5MQtm+Cveo7fHUX7VGH3DkZ2LyOnycosPKhwwzF3
 /2tWEV/ZInsPLIpZO8WI0q242W3xm4rIntsTKzGoqlXrTA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywq077bqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 18:02:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45PI2UGc005996
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Jun 2024 18:02:30 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 11:02:25 -0700
Date: Tue, 25 Jun 2024 23:32:21 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Will Deacon <will@kernel.org>
CC: Andrew Halaney <ahalaney@redhat.com>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <20240625180221.irtao4s6i7xurzsx@hu-akhilpo-hyd.qualcomm.com>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
 <20240516145005.gdksmvxp35m45ifh@hu-akhilpo-hyd.qualcomm.com>
 <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
 <20240604144055.GE20384@willie-the-truck>
 <20240618161158.qpqbv77tqveo5g6l@hu-akhilpo-hyd.qualcomm.com>
 <20240620130400.GA4750@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240620130400.GA4750@willie-the-truck>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2BZn3DZ19cIqEV4hBiPANomJNl1XlAs1
X-Proofpoint-GUID: 2BZn3DZ19cIqEV4hBiPANomJNl1XlAs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250132
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

On Thu, Jun 20, 2024 at 02:04:01PM +0100, Will Deacon wrote:
> On Tue, Jun 18, 2024 at 09:41:58PM +0530, Akhil P Oommen wrote:
> > On Tue, Jun 04, 2024 at 03:40:56PM +0100, Will Deacon wrote:
> > > On Thu, May 16, 2024 at 01:55:26PM -0500, Andrew Halaney wrote:
> > > > On Thu, May 16, 2024 at 08:20:05PM GMT, Akhil P Oommen wrote:
> > > > > On Thu, May 16, 2024 at 08:15:34AM -0500, Andrew Halaney wrote:
> > > > > > If I understand correctly, you don't need any memory barrier.
> > > > > > writel()/readl()'s are ordered to the same endpoint. That goes for all
> > > > > > the reordering/barrier comments mentioned below too.
> > > > > > 
> > > > > > device-io.rst:
> > > > > > 
> > > > > >     The read and write functions are defined to be ordered. That is the
> > > > > >     compiler is not permitted to reorder the I/O sequence. When the ordering
> > > > > >     can be compiler optimised, you can use __readb() and friends to
> > > > > >     indicate the relaxed ordering. Use this with care.
> > > > > > 
> > > > > > memory-barriers.txt:
> > > > > > 
> > > > > >      (*) readX(), writeX():
> > > > > > 
> > > > > > 	    The readX() and writeX() MMIO accessors take a pointer to the
> > > > > > 	    peripheral being accessed as an __iomem * parameter. For pointers
> > > > > > 	    mapped with the default I/O attributes (e.g. those returned by
> > > > > > 	    ioremap()), the ordering guarantees are as follows:
> > > > > > 
> > > > > > 	    1. All readX() and writeX() accesses to the same peripheral are ordered
> > > > > > 	       with respect to each other. This ensures that MMIO register accesses
> > > > > > 	       by the same CPU thread to a particular device will arrive in program
> > > > > > 	       order.
> > > > > > 
> > > > > 
> > > > > In arm64, a writel followed by readl translates to roughly the following
> > > > > sequence: dmb_wmb(), __raw_writel(), __raw_readl(), dmb_rmb(). I am not
> > > > > sure what is stopping compiler from reordering  __raw_writel() and __raw_readl()
> > > > > above? I am assuming iomem cookie is ignored during compilation.
> > > > 
> > > > It seems to me that is due to some usage of volatile there in
> > > > __raw_writel() etc, but to be honest after reading about volatile and
> > > > some threads from gcc mailing lists, I don't have a confident answer :)
> > > > 
> > > > > 
> > > > > Added Will to this thread if he can throw some light on this.
> > > > 
> > > > Hopefully Will can school us.
> > > 
> > > The ordering in this case is ensured by the memory attributes used for
> > > ioremap(). When an MMIO region is mapped using Device-nGnRE attributes
> > > (as it the case for ioremap()), the "nR" part means "no reordering", so
> > > readX() and writeX() to that region are ordered wrt each other.
> > 
> > But that avoids only HW reordering, doesn't it? What about *compiler reordering* in the
> > case of a writel following by a readl which translates to:
> > 	1: dmb_wmb()
> > 	2: __raw_writel() -> roughly "asm volatile('str')
> > 	3: __raw_readl() -> roughly "asm volatile('ldr')
> > 	4: dmb_rmb()
> > 
> > Is the 'volatile' keyword sufficient to avoid reordering between (2) and (3)? Or
> > do we need a "memory" clobber to inhibit reordering?
> > 
> > This is still not clear to me even after going through some compiler documentions.
> 
> I don't think the compiler should reorder volatile asm blocks wrt each
> other.
> 

Thanks Will for confirmation.

-Akhil.

> Will
