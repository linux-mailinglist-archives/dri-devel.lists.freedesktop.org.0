Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44B862082
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 00:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C71610ECE6;
	Fri, 23 Feb 2024 23:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ItwPNNqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FE010ECE6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 23:12:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NNCqgp025802; Fri, 23 Feb 2024 23:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=0YdDlT5/jyjrEqUVlFuky4E/JM91obYgvcB7yiTXWx4=; b=It
 wPNNqb7OxS7MlES9+7NUR0qIKiy+EoK/nHwrUO2+0lVBSFlnSl4BP+U1j3s9DXVj
 AQ3okmIjV9fXwkXA2rv3eQHl5Wed4bkGX+qmQA8RWHo3rJhvW0aT5RsJ5JMcaIo6
 hN7lkZ89rxnVBVt7ARYgrsPsllNc3Rz4g9AXTzqVzsTsmDUPTQ/CTVI2xDO0eWrZ
 txtOnhYleWkRtl4ciWOqOPEF1XLvLQv3jKeyJhmvaw+WFI5xEERdGPSArqqvI7gV
 w3ypfVhtEWIG/mCFuS3a/RBYN4RlHFZ4XE/3+v5KISMD/RUlvwI7Bbt1Ph69IXav
 XCYQsAYrzYnNftZeb5RA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wf2cnr91w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 23:12:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NNCoi4004992
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 23:12:50 GMT
Received: from [10.110.73.113] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 15:12:50 -0800
Message-ID: <b0387e6f-2ac8-8037-f096-186113c63d82@quicinc.com>
Date: Fri, 23 Feb 2024 15:12:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] accel/habanalabs: initialize maybe-uninitialized
 variables
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: Tal Risin <trisin@habana.ai>
References: <20240220160129.909714-1-ogabbay@kernel.org>
 <20240220160129.909714-7-ogabbay@kernel.org>
From: Carl Vanderlip <quic_carlv@quicinc.com>
In-Reply-To: <20240220160129.909714-7-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: aSgJnKOT0QlBsfdxFfq-7T3F2MdJDk9k
X-Proofpoint-GUID: aSgJnKOT0QlBsfdxFfq-7T3F2MdJDk9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_06,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=685 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402230167
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

On 2/20/2024 8:01 AM, Oded Gabbay wrote:
> From: Tal Risin <trisin@habana.ai>
> 
> Prevent static analysis warning.
> 
> Signed-off-by: Tal Risin <trisin@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
