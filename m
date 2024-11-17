Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242FF9D059D
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 21:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F359410E096;
	Sun, 17 Nov 2024 20:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IAQs4qTD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83A210E096
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 20:04:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AHK1l3g013698;
 Sun, 17 Nov 2024 20:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bwbwDERwuL8pvfjToiKa0zE7DeL+S0jIMcx7sO8Z1j0=; b=IAQs4qTDb3uW/chV
 1aRs5hlsFqMQUQYjsraJ59FkB6Az7OUjp2V7WH6nRtZwuTUCnOQ3TAa9szG4U/UV
 Ks25ySojitc4bdZ/eTKOnxNmAB4pdeg0qX0zimR7j7iCYa0ps96eCXxoYy9OTq8v
 eWx6euMgP9j75yGu2ZNWoz0ozLbrfmGfh3K7X4VOs0yn+6/vQwh4jjOmpMOWt1WJ
 fAQFhZmRfkA8rEQ68Px/8MeTmvyS3PPiDrpNdob9Z1sUEip24CgLxBGES+4S7n+t
 bUyYt0gH1r/PkYnvLE1tgc5sDaZZpgWHlq4k/hQW0c4ShNjHd8WHHqQY8dq5nEA2
 SvOJ2w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv3ap1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Nov 2024 20:03:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AHK3uFx020468
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Nov 2024 20:03:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 12:03:55 -0800
Message-ID: <749e9a1d-7bcf-0c04-41b3-e0a4b89068bd@quicinc.com>
Date: Sun, 17 Nov 2024 13:03:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V10 07/10] accel/amdxdna: Add command execution
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241112194745.854626-1-lizhi.hou@amd.com>
 <20241112194745.854626-8-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241112194745.854626-8-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0UKvOWKEqfSxrOE8exOkn-e6cBp12tY7
X-Proofpoint-GUID: 0UKvOWKEqfSxrOE8exOkn-e6cBp12tY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411170181
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

On 11/12/2024 12:47 PM, Lizhi Hou wrote:
> @@ -88,6 +91,8 @@ struct amdxdna_client {
>   	struct list_head		node;
>   	pid_t				pid;
>   	struct mutex			hwctx_lock; /* protect hwctx */
> +	/* do NOT wait this srcu when hwctx_lock is hold */

do NOT wait on this srcu when hwctx_lock is held

> +	struct srcu_struct		hwctx_srcu;
>   	struct idr			hwctx_idr;
>   	struct amdxdna_dev		*xdna;
>   	struct drm_file			*filp;


The significant problem I see currently is that this got merged -

commit b2ef808786d93df36585cee42cfb973fc41636eb
Author: Christian König <ckoenig.leichtzumerken@gmail.com>
Date:   Mon Aug 26 14:25:38 2024 +0200

     drm/sched: add optional errno to drm_sched_start()

I can no longer compile this patch.  Specifically I see -

   INSTALL libsubcmd_headers
   UPD     include/config/kernel.release
   UPD     include/generated/utsrelease.h
   CALL    scripts/checksyscalls.sh
   CC      init/version.o
   AR      init/built-in.a
   CC      kernel/sys.o
   CC      drivers/base/firmware_loader/main.o
   CC      kernel/module/main.o
   CC [M]  drivers/accel/amdxdna/aie2_ctx.o
   CC [M]  drivers/accel/amdxdna/aie2_message.o
   CC [M]  drivers/accel/amdxdna/aie2_pci.o
   CC [M]  drivers/accel/amdxdna/aie2_psp.o
   CC [M]  drivers/accel/amdxdna/aie2_smu.o
   CC [M]  drivers/accel/amdxdna/amdxdna_ctx.o
   CC [M]  drivers/accel/amdxdna/amdxdna_gem.o
   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox.o
   CC [M]  drivers/accel/amdxdna/amdxdna_mailbox_helper.o
   CC [M]  drivers/accel/amdxdna/amdxdna_pci_drv.o
   CC [M]  drivers/accel/amdxdna/amdxdna_sysfs.o
   CC [M]  drivers/accel/amdxdna/npu1_regs.o
   CC [M]  drivers/accel/amdxdna/npu2_regs.o
   CC [M]  drivers/accel/amdxdna/npu4_regs.o
   CC [M]  drivers/accel/amdxdna/npu5_regs.o
drivers/accel/amdxdna/aie2_ctx.c: In function ‘aie2_hwctx_restart’:
drivers/accel/amdxdna/aie2_ctx.c:84:9: error: too few arguments to 
function ‘drm_sched_start’
    84 |         drm_sched_start(&hwctx->priv->sched);
       |         ^~~~~~~~~~~~~~~
In file included from ./include/trace/events/amdxdna.h:12,
                  from drivers/accel/amdxdna/aie2_ctx.c:14:
./include/drm/gpu_scheduler.h:593:6: note: declared here
   593 | void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
       |      ^~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:229: 
drivers/accel/amdxdna/aie2_ctx.o] Error 1
make[5]: *** Waiting for unfinished jobs....
   AR      drivers/base/firmware_loader/built-in.a
   AR      drivers/base/built-in.a
make[4]: *** [scripts/Makefile.build:478: drivers/accel/amdxdna] Error 2
make[3]: *** [scripts/Makefile.build:478: drivers/accel] Error 2
make[2]: *** [scripts/Makefile.build:478: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
   AR      kernel/module/built-in.a
   AR      kernel/built-in.a

With the above two things fixed:

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

