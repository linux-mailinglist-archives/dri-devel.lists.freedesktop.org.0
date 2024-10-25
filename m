Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42639B0C3B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B576010EB5E;
	Fri, 25 Oct 2024 17:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="b0f3CgbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008E10EB5E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:55:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB69lr016490;
 Fri, 25 Oct 2024 17:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BMUguSwfBOZPn7n/2hNIIMG965a8TqhWDHdHceGrhTE=; b=b0f3CgbPK4wlYtOs
 v5dIZyU9lbI5dE4bExTTWFtYRFs/cYtj60LSAWpbCtXUfkzAizXGwAT/u3JaCMk2
 NBti+DC9uicNWkURwlhWeeN5Xg4zsqgPvWffKnj85T9PFjbEm/iK6dwnjXhBHUjP
 BZpweQ+YrJ0qelMyN5Tl+RF1f+YMWMRZsjZUl6ZF7mVl8iPlx4cxaz0wvpcZP2/s
 XsAda1fknWG39rvufs//qPKHWTYE8QRWahCmX6VW9kRXT9dsRGb2cFZLB0DpoFlw
 Pdn396tLnHgQkFsCCF69oLQftwI3jpo9irGhq/r2hOp439GmVktifTulGImMczFy
 qrhibg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga5js8ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 17:55:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PHt1GZ009940
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2024 17:55:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 10:55:01 -0700
Message-ID: <72765a2d-2e4d-b8fc-8caa-8d4a131357bd@quicinc.com>
Date: Fri, 25 Oct 2024 11:55:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V5 07/10] accel/amdxdna: Add command execution
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
 <20241021161931.3701754-8-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241021161931.3701754-8-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DABxdHmJeE9a_8v7GGwbJli4bffM51g8
X-Proofpoint-GUID: DABxdHmJeE9a_8v7GGwbJli4bffM51g8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250136
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

On 10/21/2024 10:19 AM, Lizhi Hou wrote:
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index 3792750834b2..08f3ec7146ab 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -13,6 +13,7 @@
>   extern "C" {
>   #endif
>   
> +#define AMDXDNA_INVALID_CMD_HANDLE	(~0UL)
>   #define AMDXDNA_INVALID_ADDR		(~0UL)
>   #define AMDXDNA_INVALID_CTX_HANDLE	0
>   #define AMDXDNA_INVALID_BO_HANDLE	0
> @@ -29,6 +30,8 @@ enum amdxdna_drm_ioctl_id {
>   	DRM_AMDXDNA_CREATE_BO,
>   	DRM_AMDXDNA_GET_BO_INFO,
>   	DRM_AMDXDNA_SYNC_BO,
> +	DRM_AMDXDNA_EXEC_CMD,
> +	DRM_AMDXDNA_WAIT_CMD,
>   };
>   
>   /**
> @@ -201,6 +204,54 @@ struct amdxdna_drm_sync_bo {
>   	__u64 size;
>   };
>   
> +enum amdxdna_cmd_type {
> +	AMDXDNA_CMD_SUBMIT_EXEC_BUF = 0,
> +	AMDXDNA_CMD_SUBMIT_DEPENDENCY,
> +	AMDXDNA_CMD_SUBMIT_SIGNAL,
> +};
> +
> +/**
> + * struct amdxdna_drm_exec_cmd - Execute command.
> + * @ext: MBZ.
> + * @ext_flags: MBZ.
> + * @hwctx: Hardware context handle.
> + * @type: One of command type in enum amdxdna_cmd_type.
> + * @cmd_handles: Array of command handles or the command handle itself
> + *               in case of just one.
> + * @args: Array of arguments for all command handles.
> + * @cmd_count: Number of command handles in the cmd_handles array.
> + * @arg_count: Number of arguments in the args array.
> + * @seq: Returned sequence number for this command.
> + */
> +struct amdxdna_drm_exec_cmd {
> +	__u64 ext;
> +	__u64 ext_flags;
> +	__u32 hwctx;
> +	__u32 type;
> +	__u64 cmd_handles;
> +	__u64 args;
> +	__u32 cmd_count;
> +	__u32 arg_count;
> +	__u64 seq;
> +};
> +
> +/**
> + * struct amdxdna_drm_wait_cmd - Wait exectuion command.
> + *
> + * @hwctx: hardware context handle.
> + * @timeout: timeout in ms, 0 implies infinite wait.
> + * @seq: sequence number of the command returned by execute command.
> + *
> + * Wait a command specified by seq to be completed.
> + * Using AMDXDNA_INVALID_CMD_HANDLE as seq means wait till there is a free slot
> + * to submit a new command.
> + */
> +struct amdxdna_drm_wait_cmd {
> +	__u32 hwctx;
> +	__u32 timeout;
> +	__u64 seq;
> +};
> +
>   #define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
>   	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
>   		 struct amdxdna_drm_create_hwctx)
> @@ -225,6 +276,14 @@ struct amdxdna_drm_sync_bo {
>   	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SYNC_BO, \
>   		 struct amdxdna_drm_sync_bo)
>   
> +#define DRM_IOCTL_AMDXDNA_EXEC_CMD \
> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_EXEC_CMD, \
> +		 struct amdxdna_drm_exec_cmd)
> +
> +#define DRM_IOCTL_AMDXDNA_WAIT_CMD \
> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_WAIT_CMD, \
> +		 struct amdxdna_drm_wait_cmd)
> +

Nope.  This looks like a driver private wait ioctl on a specific BO. 
That is not the modern way to do things per Vetter -

https://lore.kernel.org/dri-devel/ZC75%2Fq34YnDDsGpB@phenom.ffwll.local/

Skimming the implementation, it looks like you are already using fences 
and the drm scheduler, so plumbing in syncobjs is not much more than 
what you are already doing, I think.

-Jeff
