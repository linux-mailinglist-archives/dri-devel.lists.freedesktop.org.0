Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CC894D4DA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367EF10E98B;
	Fri,  9 Aug 2024 16:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pKAT8HQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92C510E98B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 16:40:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479AZ2ak004864;
 Fri, 9 Aug 2024 16:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 W4AM0skEw2EGTbmvxd/JH3BWHycEem5bzdl0AaWSKLE=; b=pKAT8HQLAfsNpyAF
 T35UF/Mm7Vk0+2eJ0yjat3Z3wny8dex1wK/HyTXySVHj0vhSVGjQMo5ush8GB/XF
 mCPusV32a119aHkq4xS0LgNfQUrETgUfhVWWk9+LKXM1WIJ7McD0nF4cmaXZdv/H
 U1myHF07q5T+OW7M7aoECjRZe7wutVfhbTy6JV+I1wFhByQ6bny1uR0FO6x1k/Sr
 flViyMZBsLTKCW7bfGUi5diHEfhKQ6o8gzDds6NgZOE5SxaxW11ikjXu3uXepvR3
 mkQwI/AnQifekFSf04VHB+4da5XygbDHYngcTlf6tPjKAHHbj4o0HBTtesu7mqCQ
 myK0QA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40whg38vax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Aug 2024 16:39:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 479Gdvcf027581
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Aug 2024 16:39:58 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 09:39:57 -0700
Message-ID: <b10c8754-7062-7543-e766-fb18570fb122@quicinc.com>
Date: Fri, 9 Aug 2024 10:39:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 05/10] accel/amdxdna: Add GEM buffer object management
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-6-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240805173959.3181199-6-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aUykT3Iq-22hlOvm_xtD_fxSh0Q6zjNb
X-Proofpoint-GUID: aUykT3Iq-22hlOvm_xtD_fxSh0Q6zjNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=719 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090118
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

On 8/5/2024 11:39 AM, Lizhi Hou wrote:
> +/**
> + * struct amdxdna_drm_create_bo - Create a buffer object.
> + * @flags: Buffer flags. MBZ.
> + * @type: Buffer type.
> + * @vaddr: User VA of buffer if applied. MBZ.
> + * @size: Size in bytes.
> + * @handle: Returned DRM buffer object handle.
> + */
> +struct amdxdna_drm_create_bo {
> +	__u64	flags;
> +	__u32	type;
> +	__u32	_pad;
> +	__u64	vaddr;
> +	__u64	size;
> +	__u32	handle;
> +};

Needs padding
