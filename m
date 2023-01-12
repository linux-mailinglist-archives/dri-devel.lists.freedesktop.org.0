Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2057667CFD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F419A10E1A9;
	Thu, 12 Jan 2023 17:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C8210E1A9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:52:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CDS7Sa025737; Thu, 12 Jan 2023 17:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IF9vB0iHF02x0eTm7lMGZfbIiMtgTWxEI9XKK1nk3r8=;
 b=Ft33ERv9GE+hNelMfoJxW9XUG+uX47kBpNXVIW3dCM93iAKxwuxU2YLX+wFp9Un1pSDK
 kVtbHiXKhdLCKNS4NAIEnYNNgblRaHl0Nx985aMuotDfXWj8IMV7ncjKMN/jU61yf6ZF
 MCfZEouC4orI8UJNQUKpSWe/BXUcE4L51+GDCYlh6cSg7V0LYs9kZE5uwKwZuaF5Meru
 j0u0vzGrDhsREQ9b+AKHPC2Dr3n+NmILwtkJBCWkPVsgCAEMeYpp/QW/CakCvODiDJ5K
 n0vUGqKonvPlqSL4ADwv2PcekKlfd+xSCN4rYaZvsi58FrwQw9mIEkLr1CxiY7Ia8yw5 pA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2k47gmq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:52:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30CHq4wQ000849
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:52:04 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 09:52:03 -0800
Message-ID: <bf47516e-861b-36f2-97a3-579c5fe30f67@quicinc.com>
Date: Thu, 12 Jan 2023 10:52:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 3/7] accel/ivpu: Add GEM buffer object management
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-4-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230109122344.253994-4-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Z745hC58ma4-XKnYA_-xXG5hUk_Bh_-x
X-Proofpoint-ORIG-GUID: Z745hC58ma4-XKnYA_-xXG5hUk_Bh_-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1015 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=845 impostorscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301120129
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
> Adds four types of GEM-based BOs for the VPU:
>    - shmem
>    - userptr
>    - internal
>    - prime
> 
> All types are implemented as struct ivpu_bo, based on
> struct drm_gem_object. VPU address is allocated when buffer is created
> except for imported prime buffers that allocate it in BO_INFO IOCTL due
> to missing file_priv arg in gem_prime_import callback.
> Internal buffers are pinned on creation, the rest of buffers types
> can be pinned on demand (in SUBMIT IOCTL).
> Buffer VPU address, allocated pages and mappings are released when the
> buffer is destroyed.
> Eviction mechism is planned for future versions.

mechism -> mechanism

Hopefully whomever applies this can fix it up inline and this doesn't 
require a new revision.

> 
> Add three new IOCTLs: BO_CREATE, BO_INFO, BO_USERPTR
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
