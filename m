Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0B9825845
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2322110E620;
	Fri,  5 Jan 2024 16:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A65810E620
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:36:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405EstDM014778; Fri, 5 Jan 2024 16:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=xMcWOdizeT8DnD70DGA/oGNohpxuujyXoFYzpEU5xik=; b=GF
 iAcSz6r/XWqN34Xs3PftlmGg+0JdbBoqWUnGg46yZ8SLWoGvLpOjUyW4mDyRNhsx
 Fy9NICscNwpTPX5LahzZvUr+8Z2al60YD5K9T0di78Pq9G8G3ceffGurGqACjIR+
 2Qczx9rE6THt5nb3ZHBs4VRpaSuKwDFUgZ89brjj7JUB+u5MbmHiWrPDfRncHpYx
 nX5WlVZiM/Jrfd/zwE84guvttagX9i0NjcQ4hjm9NuEvO+BsazsMURd3zKwfdcNy
 uaxy8MTR6bqMdskUk2AY4XKJmWyw+Rp68kCLZOJdzR2ZzYQTYdow9O5C1eZTw7Jx
 STJbXlhe9SiAld/PKBAg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ve97r9gbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 16:36:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405GaODH029457
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Jan 2024 16:36:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 08:36:24 -0800
Message-ID: <2936fafd-fa17-1f63-40c3-c38f1b93d5b0@quicinc.com>
Date: Fri, 5 Jan 2024 09:36:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 06/10] accel/ivpu: Fix for missing lock around
 drm_gem_shmem_vmap()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-7-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240105112218.351265-7-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8m1OAL5FW4XssXsZvzABul46-pQN23_K
X-Proofpoint-GUID: 8m1OAL5FW4XssXsZvzABul46-pQN23_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=554 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050137
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

On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
> drm_gem_shmem_vmap/vunmap requires dma resv lock to be held.
> This was missed during conversion to shmem helper.
>  > Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Fixes tag?

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
