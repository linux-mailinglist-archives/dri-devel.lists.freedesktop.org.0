Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48F8990997
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 18:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1499610E060;
	Fri,  4 Oct 2024 16:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="U5FOTrMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF03B10E060
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 16:44:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494BK7Js027793;
 Fri, 4 Oct 2024 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yLPFMD2M6aTG9LP/lyv2ZofjbR63WTYFxn1ePXnHWHU=; b=U5FOTrMZeCAs3AQa
 X2hBkULmDc4lsQlEhG5m/3GkZ/SqwgaV27ATs/gCN8xztGmHF/0iEA+4qJQ2oG3r
 tP1ra47aOsa5DOfzcR28SvodedOFABfAgOV8SSsj4/6Kr3r220tpuP18N1tZZ/VC
 lCAC0j5p0W/OdxJLeMnHEsyhjCLiil5zS0nSxel6dLnkk0AoT6oAkCwkhlwvZ8An
 LkKEaT9oGPq58WflsdlE+50v/CYPf0lhc+srBM9RRgwUKLlmL2BCUrrg0977ZSyI
 8rTfpYO5VVJQv/HXIlNLhNfJLAUZhxGeUH/cAWA1NYBkeQ6I2j4hBrPnQOInUC/4
 Y750lg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205haqs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 16:43:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494GhwtT016527
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 16:43:58 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 09:43:58 -0700
Message-ID: <a629b04c-6239-1469-d259-17a7cd5890ec@quicinc.com>
Date: Fri, 4 Oct 2024 10:43:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] accel/ivpu: Add initial Panther Lake support
Content-Language: en-US
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jacek.lawrynowicz@linux.intel.com>
References: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
 <20241004162505.1695605-2-maciej.falkowski@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241004162505.1695605-2-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lCZulvVW6TbXlQFvapm42PHdvt9oTYwq
X-Proofpoint-ORIG-GUID: lCZulvVW6TbXlQFvapm42PHdvt9oTYwq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=971 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040116
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

On 10/4/2024 10:25 AM, Maciej Falkowski wrote:
> Add support for the 5th generation of Intel NPU that
> is going to be present in PTL_P (Panther Lake) CPUs.
> NPU5 code reuses almost all of previous driver code.
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
