Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33D8990A7A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 19:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E54510EA54;
	Fri,  4 Oct 2024 17:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dCFHK+Aq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131CB10EA54
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 17:57:09 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494Aeo9A014160;
 Fri, 4 Oct 2024 17:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RjVAIODgIMe6TcbnIeo3RvgBeLIP865au+8FkWupWgM=; b=dCFHK+Aq1D39Kj8q
 /8zZqnnMxcaPungOtziwi19nWb9Kdky8tavB4xRDm7/HgM+yavWP8Vf9WV356Y1S
 JB7n6LUYGDGD2v+h7C/AdCyCNnB6TeG0XeP20nJ1dPcQXrKB2fuwlXwYEgP3Hnsp
 sRjMXIhkVZYGV07590sBwexPoh2beoGoA8bqlYRvXO6S6EFI2e6dybc5xy/xYkQY
 4vnGLIB1SkVwHWdtw+DtQIq+KRlwCTHyYVXJYibd7Ec5gmY6qfYxgu6spllS5snv
 0WLnJg9e+FmP8q7uTKBwTfsOvQST7bwu/aHXze1xj/MEl7qEcvlEgodvCpORBvHY
 slJ/kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205e2xc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 17:56:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494HuwkL016729
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 17:56:58 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:56:57 -0700
Message-ID: <d5694bb9-e035-c4ba-392e-ca06562355d1@quicinc.com>
Date: Fri, 4 Oct 2024 11:56:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V3 06/11] accel/amdxdna: Add GEM buffer object management
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-7-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240911180604.1834434-7-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gxZCMvLNNaZWAXU2vSgITrRDBLVmKIfm
X-Proofpoint-ORIG-GUID: gxZCMvLNNaZWAXU2vSgITrRDBLVmKIfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=791
 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040123
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

On 9/11/2024 12:05 PM, Lizhi Hou wrote:
> +/**
> + * struct amdxdna_drm_create_bo - Create a buffer object.
> + * @flags: Buffer flags. MBZ.
> + * @type: Buffer type.
> + * @pad1: MBZ.
> + * @vaddr: User VA of buffer if applied. MBZ.
> + * @size: Size in bytes.
> + * @handle: Returned DRM buffer object handle.
> + * @pad2: MBZ.
> + */
> +struct amdxdna_drm_create_bo {
> +	__u64	flags;
> +	__u32	type;
> +	__u32	pad1;
> +	__u64	vaddr;
> +	__u64	size;
> +	__u32	handle;
> +	__u32	pad2;
> +};

Why not eliminate both padding fields by either moving "handle" up, or 
"type" down?
