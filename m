Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0327667E2C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 19:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93EC10E32C;
	Thu, 12 Jan 2023 18:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76C710E32C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 18:32:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CGj2xQ012390; Thu, 12 Jan 2023 18:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pnASPewPQ/9t1uODLyaFYQVMl3xAkLwZ9+Kk0+arix4=;
 b=D2iTbDjxZl+A6y0O0f/HJiUfT9GfeilUIe17QpnyoBdP3YMywJNYYhTfVvoIAvnBCIam
 R4xSshIaunXz4HHrYYTNtS4qKWG3EgkEUF7idusPRXfI+k6thrMLjVuOEZ/671S34X0Z
 xp0W4ISEVlN/P3lSuZJLtTu6kzgG2w9392ddwCw5+Is+u5ZExiCwIOerG7ROZ5wzEFXd
 FBolsYCanRD+BwIkj6AtAmaoQ+FyGW2Mibj9usfn/idiPORJomDrSFd55GAFGxCMDTp+
 hQnNzM8oMuaxOW6tP18W6GX59Dx/PlSOfnCgv+veMmjbh1G125/usaZTRQGRUt+pJ928 IQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1kbqcuv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 18:32:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30CIWOOk017980
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 18:32:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 10:32:23 -0800
Message-ID: <78b9f039-6612-e78c-231e-edeb092f2489@quicinc.com>
Date: Thu, 12 Jan 2023 11:32:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 6/7] accel/ivpu: Add command buffer submission logic
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-7-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230109122344.253994-7-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3jzb8DTMy0NynSRx08qzj2MtStLD-_6u
X-Proofpoint-ORIG-GUID: 3jzb8DTMy0NynSRx08qzj2MtStLD-_6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_10,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120133
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
> Each of the user contexts has two command queues, one for compute engine
> and one for the copy engine. Command queues are allocated and registered
> in the device when the first job (command buffer) is submitted from
> the user space to the VPU device. The userspace provides a list of
> GEM buffer object handles to submit to the VPU, the driver resolves
> buffer handles, pins physical memory if needed, increments ref count
> for each buffer and stores pointers to buffer objects in
> the ivpu_job objects that track jobs submitted to the device.
> The VPU signals job completion with an asynchronous message that
> contains the job id passed to firmware when the job was submitted.
> 
> Currently, the driver supports simple scheduling logic
> where jobs submitted from user space are immediately pushed
> to the VPU device command queues. In the future, it will be
> extended to use hardware base scheduling and/or drm_sched.
> 
> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
