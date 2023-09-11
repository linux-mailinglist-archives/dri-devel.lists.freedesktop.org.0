Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5879A98E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 17:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B86D10E31C;
	Mon, 11 Sep 2023 15:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498810E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 15:21:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38BEfcWn030165; Mon, 11 Sep 2023 15:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WWbwzPYqqY7vhFf+EpM1RbJP3MYpIrqZYlA2coPtbew=;
 b=mLnatmlui5p4dpzcI/rvDi4zoGAwCvkmNSruJ8uCFsDCVF5s+NlsF9p6Wl7j6DPPS5Gp
 2BrNXxnjZuQYdxPWnP6GWWYDC6lls+GMYsyHgtdPdtyco4A0YDSQfFFVGgoaj+0k0eSo
 8kFftVEc4JM4YrBVYnByQk2mPDItBIL9aWOE6VKNCfuKKwwFSFkj3G86CkV6venhVTW5
 i8JANXejf77Y1grT2sAwrVLdjQXHazuMds4BaPHtcRp0Kc4Tp7ksq7On1nWAjJYI0P8E
 gbRw06nbL60RMDrU3y8nUYAhAhkRYu5wXuHP3WUEcJTJOg728vX6LfsQnDQ8Qm5m3N5H JQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t20yy0mhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 15:21:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BFL4nS016213
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 15:21:04 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 08:21:04 -0700
Message-ID: <1e43477e-f11f-6bc8-ba19-238e526fa196@quicinc.com>
Date: Mon, 11 Sep 2023 09:21:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC 2/4] accel/ivpu: Fix locking in
 ivpu_bo_remove_all_bos_from_context()
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
 <20230901164842.178654-3-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230901164842.178654-3-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7uOZynQ6LRD3a-SB8b0O26lnZrTfv1Il
X-Proofpoint-GUID: 7uOZynQ6LRD3a-SB8b0O26lnZrTfv1Il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=774 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309110140
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2023 10:48 AM, Stanislaw Gruszka wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> ivpu_bo_remove_all_bos_from_context() could race with ivpu_bo_free()
> when prime buffer was closed after vpu device was closed.
> 
> Move the bo_list from context to vdev and use a dedicated lock to
> sync it. This list is not modified when BO is added/removed from
> a context.
> 
> Also rename ivpu_bo_free_vpu_addr() to ivpu_bo_unbind() because this
> function does more then just free vpu_addr.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
