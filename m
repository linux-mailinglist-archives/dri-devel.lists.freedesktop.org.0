Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410A37AF012
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 17:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF8F10E3F6;
	Tue, 26 Sep 2023 15:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8DF10E3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 15:55:40 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38QD7xha008431; Tue, 26 Sep 2023 15:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6ssByzI6Wu2JZFt8QtVW4ogZ5m9MnE9HfPuZJpaV1PU=;
 b=KDNHVGBlE3/4MNXqzG217elBBS0Io4hqOvtniIT15oPxr6Ir4dCTJff16wjRz0gspKTx
 25trhYrUtChSVKll3Rle43Od5HMVSD1VEDOaFwONc5cS6jt0QEs9i/sEeTfQiXsGKCwQ
 MZuw/uWcPXFJiWBnC6DV7PYR8KCVhmGhsqdqBZLVnlo7R21ljf1FKT/T7heNOTaRKiwB
 V5H/2TUQpv175x+MlY6Hvk+o9ZRaBVDDVU3qYtX3TwwJbRFMPbBROsJnn68Z2F24mnkX
 9VdIPYnKOo3nxtgFbkYI9FiJW9ief4QuWh8gnywASJ8mKe4/HdElVXGTuI0hNcOLd1ey Bg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tb72skrjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:55:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QFtYNv003691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:55:34 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 26 Sep
 2023 08:55:34 -0700
Message-ID: <98fd9c8e-a5b0-af3d-48e8-b27796d2da8c@quicinc.com>
Date: Tue, 26 Sep 2023 09:55:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 5/6] accel/ivpu/40xx: Fix missing VPUIP interrupts
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
 <20230925121137.872158-6-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230925121137.872158-6-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: G1sqRw76SwC4PIxkl-yIs8FHd1sFj8vf
X-Proofpoint-ORIG-GUID: G1sqRw76SwC4PIxkl-yIs8FHd1sFj8vf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_12,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxlogscore=696 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260138
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/25/2023 6:11 AM, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Move sequence of masking and unmasking global interrupts from buttress
> interrupt handler to generic one that handles both VPUIP and BTRS
> interrupts.
> 
> Unmasking global interrupts will re-trigger MSI for any pending interrupts.
> Lack of this sequence can randomly cause to miss any VPUIP interrupt that
> comes after reading VPU_40XX_HOST_SS_ICB_STATUS_0 and before clearing
> all active interrupt sources.
> 
> Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
