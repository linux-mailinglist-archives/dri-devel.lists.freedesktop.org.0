Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F159F43B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB66410E6BC;
	Wed, 24 Aug 2022 07:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A3110F5AB;
 Tue, 23 Aug 2022 16:58:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NGrx2l002092;
 Tue, 23 Aug 2022 16:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+qrbrKgm5g+AB7gZnY8w7DFGwEnJ8r/3Znz/BY5oREE=;
 b=b1k+1J4vHKw+5BHAxDostnbM77eT5H779RDfCAJ5hUL7kdSCDyALF5qaCfKl1066vj4E
 fgURQCPFiDM/VcmK/v9cl0MKxsz1V0GyTiYK91YcIamxCrSGoBtInnqhsy8VqTFyXqHa
 yec5U0t31TOd2AOUt3D2ymkxY/x9Vzw6URtCn2j1lo3BqoPptnjHLb8rAk3HI7AuUbEQ
 jRJGqXdAMAYT1Zskyt55xXFAKiKXj0+qWGhR5fX6QPfIyCZSEKoPy9FHFX3KZqq0LPx5
 xpWzi7U0FX7UJo9YYzfYhmqQ2rglYHRK/SzCfEv144C40wqxHZD3h7qaRi5sD0zhVS2Q ew== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pj01k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 16:58:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NGrGRT019514
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 16:53:16 GMT
Received: from [10.50.48.231] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 09:53:13 -0700
Message-ID: <1ff9a75d-7a59-a9c2-793c-2a2533eb269c@quicinc.com>
Date: Tue, 23 Aug 2022 22:23:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] drm/msm/iommu: optimize map/unmap
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20220823163719.90399-1-robdclark@gmail.com>
From: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
In-Reply-To: <20220823163719.90399-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vf2quyRG0Y1UdLavu2tYkGsBogwgcuL1
X-Proofpoint-ORIG-GUID: vf2quyRG0Y1UdLavu2tYkGsBogwgcuL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=770 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230068
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/2022 10:07 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Using map_pages/unmap_pages cuts down on the # of pgtable walks needed
> in the process of finding where to insert/remove an entry.  The end
> result is ~5-10x faster than mapping a single page at a time.
>
> v2: Rename iommu_pgsize(), drop obsolete comments, fix error handling
>      in msm_iommu_pagetable_map()
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 101 +++++++++++++++++++++++++++-----
>   1 file changed, 86 insertions(+), 15 deletions(-)

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>

Thanks,
Sai

