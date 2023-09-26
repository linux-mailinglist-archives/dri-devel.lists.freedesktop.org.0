Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBBE7AEFFC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 17:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487AE10E104;
	Tue, 26 Sep 2023 15:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DE210E104
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 15:52:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38QD4jJU000350; Tue, 26 Sep 2023 15:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HIfh5dYMraCTQOKmfWJJn7chOjngPtabwmi2f02HSq4=;
 b=XMBlb+bl9Ocxpw0xFVtdx9Kv1m0bpEDTPEH278qhyPVnGlPegEA+6mJuyiWmmkdXj2W/
 Y9O1A7MrDECGO9w3BoVbCA8nWZhED8LJNwpFZX7B0A+Grp7dfCiQIvoYHa/Okt6geJ8b
 +L85hK4nbygYC0mUJUTtAuGFtQFlF7OQ6B14Z+Hay0+jY856eHQqjtI8A1NY8lY77a97
 0dZv6LtXuqVoGxPU0WaleX6OS+HM5nmbVOlJidAjOi4SZYUXrQk6eT5EazOgwS3sILZD
 e3wHAwlv/LRBPuxP3nWQD7YfYAWRqKgO6nZD/Pk2eVa/1gz7lM15i9T2njHgayYQcRPy 3w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tbv6611ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:52:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QFq0dR001781
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:52:00 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 26 Sep
 2023 08:52:00 -0700
Message-ID: <aee3781f-c496-1312-3104-5ad2dda1ee5f@quicinc.com>
Date: Tue, 26 Sep 2023 09:51:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/6] accel/ivpu: Do not use wait event interruptible
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
 <20230925121137.872158-2-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230925121137.872158-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WI04zPrS9EtQ1GmlR73ih2eeE0w1g6S4
X-Proofpoint-GUID: WI04zPrS9EtQ1GmlR73ih2eeE0w1g6S4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_13,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=919 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> If we receive signal when waiting for IPC message response in
> ivpu_ipc_receive() we return error and continue to operate.
> Then the driver can send another IPC messages and re-use occupied
> slot of the message still processed by the firmware. This can result
> in corrupting firmware memory and following FW crash with messages:
> 
> [ 3698.569719] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_send_receive_internal(): IPC receive failed: type 0x1103, ret -512
> [ 3698.569747] intel_vpu 0000:00:0b.0: [drm] ivpu_jsm_unregister_db(): Failed to unregister doorbell 3: -512
> [ 3698.569756] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_tx_prepare(): IPC message vpu:0x88980000 not released by firmware
> [ 3698.569763] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_tx_prepare(): JSM message vpu:0x88980040 not released by firmware
> [ 3698.570234] intel_vpu 0000:00:0b.0: [drm] ivpu_ipc_send_receive_internal(): IPC receive failed: type 0x110e, ret -512
> [ 3698.570318] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_mmu_dump_event(): MMU EVTQ: 0x10 (Translation fault) SSID: 0 SID: 3, e[2] 00000000, e[3] 00000208, in addr: 0x88988000, fetch addr: 0x0
> 
> To fix the issue don't use interruptible variant of wait event to
> allow firmware to finish IPC processing.
> 
> Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
