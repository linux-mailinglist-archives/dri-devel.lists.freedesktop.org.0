Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD6B83E0EC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BDA10FC6C;
	Fri, 26 Jan 2024 17:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F110FC6C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 17:53:30 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QHrNpl007405; Fri, 26 Jan 2024 17:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=d+t9l0PgYvu1SBacwNknc3YzshrJinevjAMxDDjgqfw=; b=SS
 BjLL6ugu6ftonK7kunboomaxS2So48hWGmE2rav6a/lOdzN8anm8VUy3Fj2o9gsg
 C6+WOmdR/g0/UjsnE/OfuvvGb9/RNRB5qvF0aYD5lYPAdpkS/kwVLSQ8NTcngd+R
 hhQYkctxnw7FWDN1ZCkK1wLz00gZMAUvbX0Yip54gavyq0yxMTDWhac9gIcnOzJY
 wkRa8dJfKZVsmYCtRrPDo2wnY/mvF0D2TrgU1VhMnlYHmwCjHX+YClZ4Yqzgj+pb
 65GkH2syKqt690fUkOjzAfXpcG+Fudp04/dnt1DIZTVI+ksPW2fTr4SR18s3UIsO
 bgW1SDmaKzz8fNeZOBfg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv1ypt11s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 17:53:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QHrMPq013207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 17:53:22 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 09:53:21 -0800
Message-ID: <e3d5a672-b1e9-5e38-74ed-692305ec19ff@quicinc.com>
Date: Fri, 26 Jan 2024 10:53:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] accel/ivpu: Improve stability of ivpu_submit_ioctl()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
 <20240122120945.1150728-3-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240122120945.1150728-3-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JS0bwXbbBv8xwqnMy_YQQwicFYbcPogn
X-Proofpoint-GUID: JS0bwXbbBv8xwqnMy_YQQwicFYbcPogn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260133
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
Cc: oded.gabbay@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/22/2024 5:09 AM, Jacek Lawrynowicz wrote:
> - Wake up the device as late as possible

Can you amend with why this is a good idea?

> - Remove job reference counting in order to simplify the code
> - Don't put jobs that are not fully submitted on submitted_jobs_xa in
>    order to avoid potential races with reset/recovery
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_job.c | 139 +++++++++++++++-------------------
>   drivers/accel/ivpu/ivpu_job.h |   1 -
>   2 files changed, 62 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 4fed0c05e051..d9b47a04b35f 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -125,7 +125,7 @@ void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv)
>   /*
>    * Mark the doorbell as unregistered and reset job queue pointers.
>    * This function needs to be called when the VPU hardware is restarted
> - * and FW looses job queue state. The next time job queue is used it
> + * and FW loses job queue state. The next time job queue is used it
>    * will be registered again.
>    */
>   static void ivpu_cmdq_reset_locked(struct ivpu_file_priv *file_priv, u16 engine)
> @@ -239,60 +239,32 @@ static struct dma_fence *ivpu_fence_create(struct ivpu_device *vdev)
>   	return &fence->base;
>   }
>   
> -static void job_get(struct ivpu_job *job, struct ivpu_job **link)
> +static void ivpu_job_destroy(struct ivpu_job *job)
>   {
>   	struct ivpu_device *vdev = job->vdev;
> -
> -	kref_get(&job->ref);
> -	*link = job;
> -
> -	ivpu_dbg(vdev, KREF, "Job get: id %u refcount %u\n", job->job_id, kref_read(&job->ref));
> -}
> -
> -static void job_release(struct kref *ref)
> -{
> -	struct ivpu_job *job = container_of(ref, struct ivpu_job, ref);
> -	struct ivpu_device *vdev = job->vdev;
>   	u32 i;
>   
> +	ivpu_dbg(vdev, JOB, "Job destroyed: id %3u ctx %2d engine %d",
> +		 job->job_id, job->file_priv->ctx.id, job->engine_idx);
> +
>   	for (i = 0; i < job->bo_count; i++)
>   		if (job->bos[i])
>   			drm_gem_object_put(&job->bos[i]->base.base);
>   
>   	dma_fence_put(job->done_fence);
>   	ivpu_file_priv_put(&job->file_priv);
> -
> -	ivpu_dbg(vdev, KREF, "Job released: id %u\n", job->job_id);
>   	kfree(job);
> -
> -	/* Allow the VPU to get suspended, must be called after ivpu_file_priv_put() */
> -	ivpu_rpm_put(vdev);
> -}
> -
> -static void job_put(struct ivpu_job *job)
> -{
> -	struct ivpu_device *vdev = job->vdev;
> -
> -	ivpu_dbg(vdev, KREF, "Job put: id %u refcount %u\n", job->job_id, kref_read(&job->ref));
> -	kref_put(&job->ref, job_release);
>   }
>   
>   static struct ivpu_job *
> -ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
> +ivpu_job_create(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
>   {
>   	struct ivpu_device *vdev = file_priv->vdev;
>   	struct ivpu_job *job;
> -	int ret;
> -
> -	ret = ivpu_rpm_get(vdev);
> -	if (ret < 0)
> -		return NULL;
>   
>   	job = kzalloc(struct_size(job, bos, bo_count), GFP_KERNEL);
>   	if (!job)
> -		goto err_rpm_put;
> -
> -	kref_init(&job->ref);
> +		return NULL;
>   
>   	job->vdev = vdev;
>   	job->engine_idx = engine_idx;
> @@ -306,17 +278,14 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
>   	job->file_priv = ivpu_file_priv_get(file_priv);
>   
>   	ivpu_dbg(vdev, JOB, "Job created: ctx %2d engine %d", file_priv->ctx.id, job->engine_idx);
> -
>   	return job;
>   
>   err_free_job:
>   	kfree(job);
> -err_rpm_put:
> -	ivpu_rpm_put(vdev);
>   	return NULL;
>   }
>   
> -static int ivpu_job_done(struct ivpu_device *vdev, u32 job_id, u32 job_status)
> +static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32 job_status)
>   {
>   	struct ivpu_job *job;
>   
> @@ -333,9 +302,10 @@ static int ivpu_job_done(struct ivpu_device *vdev, u32 job_id, u32 job_status)
>   	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
>   		 job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
>   
> +	ivpu_job_destroy(job);
>   	ivpu_stop_job_timeout_detection(vdev);
>   
> -	job_put(job);
> +	ivpu_rpm_put(vdev);

Since this put() corresponds to a get() that is not in this function, I 
suggest adding a comment that points to where the corresponding get() is.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
