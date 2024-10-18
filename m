Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550D9A488A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA81A10E992;
	Fri, 18 Oct 2024 20:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TfRJmjOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4F410E992
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:53:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IAMjeS018286;
 Fri, 18 Oct 2024 20:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xs8IRlAIv1w9/0UDEOWIqVd9oeiDRwLJhdPRxrGB0EI=; b=TfRJmjOBUKEHBKnA
 4nNM2yY08xInfPVmnXD32ezEiWAPwRa3Xt0pwokM0CPZkiJ6n7Kr0AsHo3HOEVqx
 yO8st/2Pk25ZIj2V4rUMeANrtiboZa0J42/E50ngi+UeS4zb1YIqBFCXWdt1uYYE
 63ECNhVexkudRahH0BsCylM2T1zqs6obJYFripUASUq6qC7+qSC11L7RCO0PC47Q
 ZrEH5b60kc5OFEr8sL3NNYTOH8E6SXQB5Nb6Gh9Xmnjxh8G+SZhXhJ3YD87x02cj
 731ff7PDyJg6osrJuvYW4njPchVvPeVmGrMtkZFCZ5VJR1BNXc4LB45wW9WmmsRl
 eTwFFQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx5bgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 20:53:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IKre4A030328
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 20:53:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 13:53:40 -0700
Message-ID: <b7fc7b06-3e6d-8a05-9dd4-8aa39a4e80fd@quicinc.com>
Date: Fri, 18 Oct 2024 14:53:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V4 08/10] accel/amdxdna: Add suspend and resume
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, Xiaoming Ren <xiaoming.ren@amd.com>
References: <20241011231244.3182625-1-lizhi.hou@amd.com>
 <20241011231244.3182625-9-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241011231244.3182625-9-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dyyquR6pZxiLZO2CWCE2j90n_ttcbLnN
X-Proofpoint-ORIG-GUID: dyyquR6pZxiLZO2CWCE2j90n_ttcbLnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=702 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180133
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

On 10/11/2024 5:12 PM, Lizhi Hou wrote:
> Implement PCI power management suspend and resume callbacks.
> 
> Co-developed-by: Narendra Gutta<VenkataNarendraKumar.Gutta@amd.com>
> Signed-off-by: Narendra Gutta<VenkataNarendraKumar.Gutta@amd.com>
> Co-developed-by: Xiaoming Ren<xiaoming.ren@amd.com>
> Signed-off-by: Xiaoming Ren<xiaoming.ren@amd.com>
> Co-developed-by: Min Ma<min.ma@amd.com>
> Signed-off-by: Min Ma<min.ma@amd.com>
> Signed-off-by: Lizhi Hou<lizhi.hou@amd.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
