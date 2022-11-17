Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0C62D45B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 08:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351C310E562;
	Thu, 17 Nov 2022 07:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E0F10E562
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:48:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AH6vGWY030397; Thu, 17 Nov 2022 07:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tBzCcWB+FWTWbCRzQPLuDi04qenTt42bi9VpD3R/tks=;
 b=k5zdoItO7JDlN1YZQb7uFaC0sFN/yvrZq1KQpGNHEDXiKq1+/g1JLIiaf7ptpzh0FomQ
 d0XFLuA2aF7PGUQOTwUFGD+DlKhO2PL2pAjFFw9IqFGagOL9u7v2oYMZFzuOtADRkt8O
 NeGXfI5EtCSpJHJX4S+8Ms6OEP85VHO49zyUaoRV9+luuVJHdZ+VbmjGVQRintHz7z2k
 lCf06jUx+MIaCmpNIizxXRQdSHjsCkaSSPwLHCx48FOl2xIs33W5xMFCZvYbR6PcWp3t
 qkiEs59s8EIBlKL5QEA19jihs0ku77YhP6pP0NeZYp2HW7SlxKbWYl0qwmLO03mRxzqr 2Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kwg4sg5ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 07:48:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AH7m9pV030059
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 07:48:09 GMT
Received: from [10.216.46.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 23:48:05 -0800
Message-ID: <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com>
Date: Thu, 17 Nov 2022 13:18:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
Content-Language: en-US
To: Gaosheng Cui <cuigaosheng1@huawei.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <tjmercier@google.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Pavan Kondeti <quic_pkondeti@quicinc.com>
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OAJK_heCCFjZ6aNynq_IIlIB5nii1D7-
X-Proofpoint-ORIG-GUID: OAJK_heCCFjZ6aNynq_IIlIB5nii1D7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_04,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170058
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

Sometime back Dan also reported the same issue[1] where I do mentioned
that fput()-->dma_buf_file_release() will remove it from the list.

But it seems that I failed to notice fput() here calls the
dma_buf_file_release() asynchronously i.e. dmabuf that is accessed in
the close path is already freed. Am I wrong here?

Should we have the __fput_sync(file) here instead of just fput(file)
which can solve this problem?

[1]https://lore.kernel.org/all/20220516084704.GG29930@kadam/

Thanks,
Charan
On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
> Smatch report warning as follows:
> 
> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
>   '&dmabuf->list_node' not removed from list
> 
> If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
> and dmabuf will be freed, but dmabuf->list_node will not be removed
> from db_list.head, then list traversal may cause UAF.
> 
> Fix by removeing it from db_list.head before free().
> 
> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf is in valid list")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/dma-buf/dma-buf.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index b809513b03fe..6848f50226d5 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	return dmabuf;
>  
>  err_sysfs:
> +	mutex_lock(&db_list.lock);
> +	list_del(&dmabuf->list_node);
> +	mutex_unlock(&db_list.lock);
>  	/*
>  	 * Set file->f_path.dentry->d_fsdata to NULL so that when
>  	 * dma_buf_release() gets invoked by dentry_ops, it exits
