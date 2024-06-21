Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5E912A77
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537AC10F216;
	Fri, 21 Jun 2024 15:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jdR3/hBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A5D10F216
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:40:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LDeY8X011782;
 Fri, 21 Jun 2024 15:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YBk4CF4UPEXWbB98EgNPocGwgxm/YWpqMdILVUQfhUg=; b=jdR3/hBfUiNJnXJx
 I38h2ZAsHWdFhRhgagKMnPRSFJqc9TLZ2U0dnJIxYYFNnnsatkFph16PdhZ3ECaI
 EAeWSeGZWN8F1rzjeP0hJSEOzd38l5EiziKEe21vmbENa9A5q+DfyauvRFTWoUxY
 aIEla9pTkLYFdm7auWla0DCfloFBLHkml/ZgQMRENUrBpyrrw7aquotLTX7T83Xy
 w/JEqNPsUskwrBqsojj0/PNHKWd+PS/iRWByc12Bx47er0cW03eGDX0pCxPdm7x6
 +STuJyVoKTMefNSJ64nJz377CZcN/HRLRfkPuQeYF3JI9K/XFqXWFhNsZgJz0h5J
 l+Rdow==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrrcaxr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 15:40:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45LFeAcO028417
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 15:40:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 08:40:09 -0700
Message-ID: <6f59552d-d7a3-5e05-3465-e707c1b7eaf2@quicinc.com>
Date: Fri, 21 Jun 2024 09:40:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>
CC: Ekansh Gupta <quic_ekangupt@quicinc.com>, Oded Gabbay
 <ogabbay@kernel.org>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <gregkh@linuxfoundation.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
 <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: d1R3fDJ_FJG53irXbXHK7jysFboLvO4o
X-Proofpoint-ORIG-GUID: d1R3fDJ_FJG53irXbXHK7jysFboLvO4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_07,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406210114
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

On 6/21/2024 5:19 AM, Dmitry Baryshkov wrote:
> On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
>>
>> On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
>>> On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
>>>> Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
>>>> to be added for PD notifications and other missing features. Adding
>>>> and maintaining new files from within fastrpc directory would be easy.
>>>>
>>>> Example of feature that is being planned to be introduced in a new C
>>>> file:
>>>> https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
>>>>
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>   MAINTAINERS                          |  2 +-
>>>>   drivers/misc/Kconfig                 | 13 +------------
>>>>   drivers/misc/Makefile                |  2 +-
>>>>   drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
>>>>   drivers/misc/fastrpc/Makefile        |  2 ++
>>>>   drivers/misc/{ => fastrpc}/fastrpc.c |  0
>>>>   6 files changed, 21 insertions(+), 14 deletions(-)
>>>>   create mode 100644 drivers/misc/fastrpc/Kconfig
>>>>   create mode 100644 drivers/misc/fastrpc/Makefile
>>>>   rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
>>>
>>> Please consider whether it makes sense to move to drivers/accel instead
>>> (and possibly writing a better Kconfig entry, specifying that the driver
>>> is to be used to offload execution to the DSP).
>>>
>>
>> Wouldn't this come with the expectation of following the ABIs of
>> drivers/accel and thereby breaking userspace?
> 
> As I wrote earlier, that depends on the accel/ maintainers decision,
> whether it's acceptable to have non-DRM_ACCEL code underneath.
> But at least I'd try doing that on the grounds of keeping the code at
> the proper place in the drivers/ tree, raising awareness of the
> FastRPC, etc.
> For example current fastrpc driver bypasses dri-devel reviews, while
> if I remember correctly, at some point it was suggested that all
> dma-buf-handling drivers should also notify the dri-devel ML.
> 
> Also having the driver under drivers/accels makes it possible and
> logical to  implement DRM_ACCEL uAPI at some point. In the ideal world
> we should be able to declare existing FastRPC uAPI as legacy /
> deprecated / backwards compatibility only and migrate to the
> recommended uAPI approach, which is DRM_ACCEL.
> 

I suspect Vetter/Airlie need to be involved in this.

Its my understanding that accelerator drivers are able to reside in misc 
as long as there is no use of dma-buf.  Use of dma-buf means they need 
to be in drm/accel.

There is precedent for moving a driver from misc to accel (HabanaLabs).

Right now, I'm not aware that fastRPC meets the requirements for 
drm/accel.  There is an open source userspace driver, but I'm not aware 
of an open source compiler.  From what I know of the architecture, it 
should be possible to utilize upstream LLVM to produce one.

-Jeff
