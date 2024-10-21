Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6F9A5FEC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3198210E061;
	Mon, 21 Oct 2024 09:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="n1uqvqge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A4F10E061;
 Mon, 21 Oct 2024 09:25:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNeWsJ012434;
 Mon, 21 Oct 2024 09:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FrkaZtmzXTkRZuEl7EBR8LKN
 ooXSAMsvdcrBEWEArZ8=; b=n1uqvqgePpzHB/7msJj48ijTEz3SzMX0KH6uvPN3
 Mquva7Dq+2qS00Ey9mQN3uW+bdWjFIaR04D388bjQQ4Jo2KetbiH9ETdiEVPDaf7
 GUYtMR2ICAdkkqMkuRJcV8FD+pqILkF4jEjnTroCqmAWdlvycnNzoYJHW/9hQSby
 eMnbnaCCSXVYanNg+DKhbTbaL7H1opKmF59SLuqcKizQMhQeF2uxVKaiD3ZXC8Q+
 iGQtCZ/DA94G6aiRqnsCDazZTlKzLbt3xyQ811wGDRqjJx36+8VU3dGKxkIcw2Y7
 pnZp64ejwCN56MVDxB+AcwZ1F2c171zf9rffaDeMn2NXPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vc42xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 09:25:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L9PIvD026234
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Oct 2024 09:25:18 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 02:25:13 -0700
Date: Mon, 21 Oct 2024 14:55:09 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH] drm: a6xx: avoid excessive stack usage
Message-ID: <20241021092509.tm4w3ufdgcd7of37@hu-akhilpo-hyd.qualcomm.com>
References: <20241018151143.3543939-1-arnd@kernel.org>
 <20241019093146.kdp25pir5onjmg4g@hu-akhilpo-hyd.qualcomm.com>
 <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <k42wmgziqia6balqsrfualbg73giesjxxtyaldkxsrdxkro2li@6neybqsu27me>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rzEOsr8QyrNssvJKSpZeqDP7AqSoUiU2
X-Proofpoint-ORIG-GUID: rzEOsr8QyrNssvJKSpZeqDP7AqSoUiU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=676 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210067
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

On Sat, Oct 19, 2024 at 04:14:13PM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 19, 2024 at 03:01:46PM +0530, Akhil P Oommen wrote:
> > On Fri, Oct 18, 2024 at 03:11:38PM +0000, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > > 
> > > Clang-19 and above sometimes end up with multiple copies of the large
> > > a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> > > a6xx_hfi_send_bw_table() calls a number of device specific functions to
> > > fill the structure, but these create another copy of the structure on
> > > the stack which gets copied to the first.
> > > 
> > > If the functions get inlined, that busts the warning limit:
> > > 
> > > drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> > 
> > Why does this warning says that the limit is 1024? 1024 bytes is too small, isn't it?
> 
> Kernel stacks are expected to be space limited, so 1024 is a logical
> limit for a single function.

Thanks for the clarification. I think it is better to move this table to
struct a6xx_gmu which is required anyway when we implement dynamic generation
of bw table. Also, we can skip initializing it in subsequent gpu wake ups.

Arnd, do you think that would be sufficient? I can send that patch if you
want help.

-Akhil

> 
> 
> -- 
> With best wishes
> Dmitry
