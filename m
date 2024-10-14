Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A599CBAC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 15:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBA110E480;
	Mon, 14 Oct 2024 13:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bevjQFGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CBD10E480
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 13:38:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EAYids030609;
 Mon, 14 Oct 2024 13:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CjUVBn/S4Q+F72+zjF5DYNpx7ZIySgxJCRYcbF6CNTw=; b=bevjQFGe9IYePFtP
 uYzLq+WW3cjecND6B5nPb/MSYgXPLIdP9w0i6oz4B26EDM03eIOW8JSSMXtj2t0g
 5x9HUSLPNz0qFN05RmDKVh61tFLlJ0HAcSXR1lBFXoVWZsfIN11mlWEKtn3Yc5tT
 VG9h+t+YEA2IbeEXC3EEQIsFAjPY5/jp9UpirDiSjyDiNkhqRkCZ0eTDugh54eoQ
 Gz4GHbYwGKBp46Uff7CwUHuZIVVgFkIh27gHJDDiSQgM2OjsK+Y1/40/9IVeGEiJ
 YFV+kbtqR8nJHp0oXJDfw67xg0lpPzVzGhEaoSvInZRBCwOGdLAKpAb34JLpWwuA
 tp3Jxw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfvdeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 13:38:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EDcWt2010094
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Oct 2024 13:38:32 GMT
Received: from [10.48.241.50] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 06:38:31 -0700
Message-ID: <ba72f359-2bb1-4ec9-80e9-5787483d6ec4@quicinc.com>
Date: Mon, 14 Oct 2024 06:38:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/ttm/tests: Fix memory leak in
 ttm_tt_simple_create()
To: Jinjie Ruan <ruanjinjie@huawei.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <christian.koenig@amd.com>, <ray.huang@amd.com>,
 <dmitry.baryshkov@linaro.org>, <dave.stevenson@raspberrypi.com>,
 <mcanal@igalia.com>, <skhan@linuxfoundation.org>,
 <davidgow@google.com>, <karolina.stolarek@intel.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <asomalap@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241014125204.1294934-1-ruanjinjie@huawei.com>
 <20241014125204.1294934-4-ruanjinjie@huawei.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241014125204.1294934-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AissHuSG7Z1Cn_b0jGsmpTJnFArTyppY
X-Proofpoint-ORIG-GUID: AissHuSG7Z1Cn_b0jGsmpTJnFArTyppY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=776 malwarescore=0 mlxscore=0
 clxscore=1011 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140099
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

On 10/14/2024 5:52 AM, Jinjie Ruan wrote:
> modprobe ttm_device_test and then rmmod ttm_device_test, the fllowing

nit: s/fllowing/following/

> memory leaks occurs:

