Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE9B1E65C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 12:17:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7196610E1D4;
	Fri,  8 Aug 2025 10:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="T4MUx9WX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFB110E1D4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 10:17:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787BZ6a007643;
 Fri, 8 Aug 2025 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c/phIuxoIUzkjBry14BRzTtMSTDr5kOHNRDCXHgMW+k=; b=T4MUx9WXbm4vFpWk
 tLK7/QyQSRqWM14T3pS8QXVjBNNus4tNtPoTt0HwoC9rZu4bB75NceIrGcSdUh+K
 jDW+v/krliyuSYX/tdrjXcNCfYHsKhGVjy0urZ7O0FXf1GehhU6qCYFm6oqooBMe
 bh6UHgNmMUEf8m0Qxw0dzSVOtVXMBOVh9yZTgLNpgZ69Bx7UwwTQmYtOgtgms0Ao
 vPmDJZgMMzRx7B8IzpJ0NcRSMxRI+W+6DspBRHZuHJc8vp419XbiIGeUdwb1W/rC
 DtyACocduXXQjAoTAs2l5tcfeZPZhtLDBiHGprcQJ9fMgQoOnEpB1bjO0HtRgNIS
 7yBU9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u26q44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Aug 2025 10:17:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 578AHBHa010739
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Aug 2025 10:17:11 GMT
Received: from [10.219.56.14] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 8 Aug
 2025 03:17:05 -0700
Message-ID: <a5526631-15fc-479f-8ac8-015231357080@quicinc.com>
Date: Fri, 8 Aug 2025 15:46:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, Mattijs
 Korpershoek <mkorpershoek@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-2-0abdc5863a4f@kernel.org>
Content-Language: en-US
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <20250617-dma-buf-ecc-heap-v5-2-0abdc5863a4f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QtuIlNDcZUtMiEkoJ1Eo_DGgYVxnih83
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=6895cea7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=PNflvO2YEgqhxBGMU7UA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: QtuIlNDcZUtMiEkoJ1Eo_DGgYVxnih83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX8H7DV5Yc9Ti9
 sRH1qkdQbzr/5idaEBh/1gEEOr9XMM62GnP1gp1b4EO/2FaF6igM8im7qvEcj7+tmVN31pHvMiC
 TmFwknZqkB57qCdudIeaIg9pv8Ym5hcarcNkOMn0pDlqMcA/lAZrdsQlhX3YvBDL6fS1j6LKJkN
 53areVHa033QARJ+3791eQjNA2EH4zupu8EXGie8kYikiKiyet21/v9oLkbojLjXhZt8vW5mPXT
 JBKOArQGBAU9KhW9AnEl1aut9AR4iqQ8m87bYXrJcoABdAqehayhRs7WZU/ClDonynkwZNLjsw9
 E+6PkyD5H+fC2cUcmZfHNyZUSO8oCbdo8yPY4UFtNkBu8kGlgNN36kyNOLGrUhP6G6v7q/yOzBJ
 nH4m9P7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
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

Hi Maxime,

On 6/17/2025 5:55 PM, Maxime Ripard wrote:
> +static void carveout_heap_dma_buf_release(struct dma_buf *buf)
> +{
> +	struct carveout_heap_buffer_priv *buffer_priv = buf->priv;
> +	struct carveout_heap_priv *heap_priv = buffer_priv->heap;
> +	unsigned long len = buffer_priv->num_pages * PAGE_SIZE;
> +
> +	gen_pool_free(heap_priv->pool, buffer_priv->paddr, len);

Just checking If clearing of the memory is missed before releasing it to
the free pool. If not, isn't it a leak of data when the heap is being
used by the multiple apps.

BTW, thanks for these patches.

> +	kfree(buffer_priv);
> +}

-Charan
