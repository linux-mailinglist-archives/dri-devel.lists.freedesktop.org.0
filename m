Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC89D15B0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 17:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465D410E525;
	Mon, 18 Nov 2024 16:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OU7v34Xc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7145710E525
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 16:48:36 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGdXa028405;
 Mon, 18 Nov 2024 16:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I+GFP6iBo1rb3ao0ESNw3laydo1qbrn5QHEsN1a+aGQ=; b=OU7v34XclrGlNE7I
 t1tLViM6NGPAAW/VEv3LA3H7TxbmhaJtKHlpw9XQvLVm+HtAgfcHVP9378CvUl3F
 HcUnMfvBr7+F116lWNRhyppXm+Ze09mkLBd2EcZwVv2qAW7i+KcN1bisCsmTJrUH
 9k2hkL4EXs3bdZHAj7Z3wRG+bvDSE+K5U8ShRBZzm5hNgJXvqq2F+/3i+g5JSFoc
 w2JITjaIrOb/JE7c/qmiwvmjurdZgrAluGanuwpZAykGQRRb2Dh78txrAmJxNZTJ
 oP9Mm0OLdHvQLjD24oS1E/pMSDnYsN1yI97WChScpQVrcF9jGQsmev0HjiKcEOVp
 vue9+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y5r29j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 16:48:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIGmWst031429
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 16:48:32 GMT
Received: from [10.110.125.248] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 08:48:31 -0800
Message-ID: <e7721ac9-b809-4fdd-a369-5e827b35745a@quicinc.com>
Date: Mon, 18 Nov 2024 08:48:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Drop redundant vfree() null check in sahara
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <andersson@kernel.org>,
 <quic_yabdulra@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "kernel test robot" <lkp@intel.com>
References: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
From: Carl Vanderlip <quic_carlv@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241117202629.1681358-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SAByqQladp4lUMziuEWkT8QxC0PAGNiD
X-Proofpoint-ORIG-GUID: SAByqQladp4lUMziuEWkT8QxC0PAGNiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1011 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=695 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411180139
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

On 11/17/2024 12:26 PM, Jeffrey Hugo wrote:
> The documentation for vfree() says that passing in NULL is ok. Therefore
> we can drop the null check as redundant.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410301732.abF5Md4e-lkp@intel.com/
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
