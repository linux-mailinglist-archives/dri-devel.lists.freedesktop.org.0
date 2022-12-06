Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20809644A06
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 18:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200E610E152;
	Tue,  6 Dec 2022 17:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F04310E152
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 17:12:28 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6EIKMp011077; Tue, 6 Dec 2022 17:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gbTI29gU+RaHEPzdX7DpjRFQgHj1oOdJ8MG0Mzj+dW8=;
 b=Luo7gIcfIhx86tRGFEAZISIffml4S0UiBxa/iAiY2imkZeovRUh/CTPLJKEeGhn0slko
 ktcE9sZKie0ogS/X/rfSV4pPgCaBgqHPH2T7lXKdEuoBEgwTnZjJSEYBIN4SnfWg0laH
 Mys9w0hkDiRokNPz4hTVdAsTi6TsodThug8yoKPoqTlxA+kdFxUNIslpRQtxBuwOkAps
 9fMltYMbQ2LwPRIdSbo10k39CRTXJB3hLfmV0Uo69Q/tmujAO6wGnGKGcSGxaaCVsHr/
 VbbVcLVqipMtEJaGWsoXgq+OG5AS6gsXu7AQg0svThoDWj+QzfaEPchw7YXtrj1AnJL5 0w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m9eev4arv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 17:12:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B6HC6UH011188
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Dec 2022 17:12:06 GMT
Received: from [10.216.56.35] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 6 Dec 2022
 09:12:04 -0800
Message-ID: <2d0182b8-c154-e763-bc2a-323e2faa120b@quicinc.com>
Date: Tue, 6 Dec 2022 22:42:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: fix dma_buf_export init order
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <cuigaosheng1@huawei.com>, <tjmercier@google.com>,
 <sumit.semwal@linaro.org>
References: <20221206151207.8801-1-christian.koenig@amd.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <20221206151207.8801-1-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eELwQd6EbxOeYlM3M7c04YJfQbls5CVb
X-Proofpoint-GUID: eELwQd6EbxOeYlM3M7c04YJfQbls5CVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=815 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060143
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Christian for this nice cleanup!!

On 12/6/2022 8:42 PM, Christian König wrote:
> @@ -638,10 +630,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	if (!try_module_get(exp_info->owner))
>  		return ERR_PTR(-ENOENT);
>  
> +	file = dma_buf_getfile(exp_info->size, exp_info->flags);
> +	if (IS_ERR(file)) {
> +		ret = PTR_ERR(file);
> +		goto err_module;
> +	}
> +
> +	if (!exp_info->resv)
> +		alloc_size += sizeof(struct dma_resv);
> +	else
> +		/* prevent &dma_buf[1] == dma_buf->resv */
> +		alloc_size += 1;
>  	dmabuf = kzalloc(alloc_size, GFP_KERNEL);
>  	if (!dmabuf) {
>  		ret = -ENOMEM;
> -		goto err_module;
> +		goto err_file;
>  	}
>  
>  	dmabuf->priv = exp_info->priv;
> @@ -653,44 +656,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	init_waitqueue_head(&dmabuf->poll);
>  	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
>  	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
> +	mutex_init(&dmabuf->lock);
> +	INIT_LIST_HEAD(&dmabuf->attachments);
>  
>  	if (!resv) {
> -		resv = (struct dma_resv *)&dmabuf[1];
> -		dma_resv_init(resv);
> +		dmabuf->resv = (struct dma_resv *)&dmabuf[1];
> +		dma_resv_init(dmabuf->resv);
> +	} else {
> +		dmabuf->resv = resv;
>  	}
> -	dmabuf->resv = resv;
>  
> -	file = dma_buf_getfile(dmabuf, exp_info->flags);
> -	if (IS_ERR(file)) {
> -		ret = PTR_ERR(file);
> +	ret = dma_buf_stats_setup(dmabuf, file);
> +	if (ret)
>  		goto err_dmabuf;
> -	}
>  
> +	file->private_data = dmabuf;
> +	file->f_path.dentry->d_fsdata = dmabuf;
>  	dmabuf->file = file;
>  
> -	mutex_init(&dmabuf->lock);
> -	INIT_LIST_HEAD(&dmabuf->attachments);
> -
>  	mutex_lock(&db_list.lock);
>  	list_add(&dmabuf->list_node, &db_list.head);
>  	mutex_unlock(&db_list.lock);
>  
> -	ret = dma_buf_stats_setup(dmabuf);
> -	if (ret)
> -		goto err_sysfs;
> -
>  	return dmabuf;
>  
> -err_sysfs:
> -	/*
> -	 * Set file->f_path.dentry->d_fsdata to NULL so that when
> -	 * dma_buf_release() gets invoked by dentry_ops, it exits
> -	 * early before calling the release() dma_buf op.
> -	 */
> -	file->f_path.dentry->d_fsdata = NULL;
> -	fput(file);
>  err_dmabuf:
> +	if (!resv)
> +		dma_resv_fini(dmabuf->resv);
>  	kfree(dmabuf);
> +err_file:
> +	fput(file);

This fput() still endup in calling the dma_buf_file_release() where
there are no checks before accessing the file->private_data(=dmabuf)
which can result in null pointer access. Am I missing something trivial?

>  err_module:
>  	module_put(exp_info->owner);
>  	return ERR_PTR(ret);
> -- 2.34.1
