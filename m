Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538C990AFD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E10410EA5D;
	Fri,  4 Oct 2024 18:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GGkDwsV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F8B10EA5D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 18:20:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AE7qO032696;
 Fri, 4 Oct 2024 18:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 w7U9Iz4T63Hri05kLr6t2UzHA17vtCnF+ABQccaowb8=; b=GGkDwsV9dSxWTcyo
 KZ9dUiWA3kEis+j7W4sJ0s1rgJH7H/J5BgvjG4f1jkv1vSqvT3wD+XuGjk8jSd0N
 EB9BnOPCDf8dv2oafzj7XcGirhcSZyejX7Mg0XKhMpcx++PdJN4719apVb5pCGOy
 cOIAx3G3ibNGAgJXfIoTmko06EjwmPvF2UJAya1U2mI3814+kYiQh5DTTORzcSP4
 hj+o7k523T5IBA8t3Xkt/435oA11okY1QAaJfEW9fUSGjYfuECdgKVRDO3EtUlrs
 cnQBPPFujLLXBX4hRAUldgxlGdlIYh8wteVvcUWtXtCBTvmHvh142iORZa7N816T
 h6iWng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205f2xf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 18:20:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494IKoc5017971
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 18:20:50 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 11:20:49 -0700
Message-ID: <016d4da1-a139-30ef-a9ed-970564e710ac@quicinc.com>
Date: Fri, 4 Oct 2024 12:20:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V3 09/11] accel/amdxdna: Add error handling
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-10-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240911180604.1834434-10-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yH9b4g-Jfh1ntK-D2fdIWceiw4WrK5Kn
X-Proofpoint-ORIG-GUID: yH9b4g-Jfh1ntK-D2fdIWceiw4WrK5Kn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=895 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040126
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

On 9/11/2024 12:06 PM, Lizhi Hou wrote:
> +/*
> + * Below enum, struct and lookup tables are porting from XAIE util header file.
> + *
> + * Below data is defined by AIE device and it is used for decode error message
> + * from the device.
> + */
> +
> +enum aie_module_type {
> +	AIE_MEM_MOD = 0,
> +	AIE_CORE_MOD,
> +	AIE_PL_MOD,
> +};
> +
> +enum aie_error_category {
> +	AIE_ERROR_SATURATION = 0,
> +	AIE_ERROR_FP,
> +	AIE_ERROR_STREAM,
> +	AIE_ERROR_ACCESS,
> +	AIE_ERROR_BUS,
> +	AIE_ERROR_INSTRUCTION,
> +	AIE_ERROR_ECC,
> +	AIE_ERROR_LOCK,
> +	AIE_ERROR_DMA,
> +	AIE_ERROR_MEM_PARITY,
> +	/* Unknown is not from XAIE, added for better category */
> +	AIE_ERROR_UNKNOWN,
> +};
> +
> +/* Don't pack, unless XAIE side changed */
> +struct aie_error {
> +	u8			row;
> +	u8			col;
> +	enum aie_module_type	mod_type;

As far as I am aware, the compiler will use multiple variable sizes to 
define an enum. This feels very fragile.

> +	u8			event_id;
> +};
