Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78272DA90
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD1C10E337;
	Tue, 13 Jun 2023 07:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A81610E230
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:44:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35C9QvYD002272; Mon, 12 Jun 2023 12:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AbqVcEBTgwpX78pdviKKVyjWrTI6YI8h2YEgR9e9Gvc=;
 b=kCo1pR4STXPu4x0rLsWVJBc3Uk+Uvkr1zmk5KMs5UMsnXaZnNJsYijd4gHk85or8ON+K
 S5z1nEQTpWyj7V+rVMagJSZjOeK9fgtli/iXXFwxNV4CkQvmBB7PTatY5awd9AG5iSA9
 sA39PnxkQvGyYKP4MOgPFXW2b4cDnHzTsWVGJgYxg8RwVYZIMk2iTEJpemzFiklHXrfk
 W2dIAGxJKavcyBuTkTG1wQtcwOF+lXVTPNBCvixIUQlOeud92rDyg+RwsAZPOl0Uh7Ys
 g+Xe7OyT6Mx5MtEUzhvETmYc7snm9GlZKvDfftyarnQaP/ZptJmHgYoM+aXj7FSVT4y0 Sg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r4ggr3b27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 12:44:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35CCiHSp014000
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 12:44:18 GMT
Received: from [10.50.37.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 12 Jun
 2023 05:44:14 -0700
Message-ID: <1d2aa1b5-56d1-b334-5f2d-2fe3fb42b0b1@quicinc.com>
Date: Mon, 12 Jun 2023 18:14:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] accel/qaic: Fix dereferencing freed memory
To: Sukrut Bellary <sukrut.bellary@linux.com>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20230610021200.377452-1-sukrut.bellary@linux.com>
Content-Language: en-US
From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
In-Reply-To: <20230610021200.377452-1-sukrut.bellary@linux.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uCWHrFY7FAqAC1J-jmAOGSzXxsWQAkpw
X-Proofpoint-ORIG-GUID: uCWHrFY7FAqAC1J-jmAOGSzXxsWQAkpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120110
X-Mailman-Approved-At: Tue, 13 Jun 2023 07:14:01 +0000
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/10/2023 7:42 AM, Sukrut Bellary wrote:
> smatch warning:
> 	drivers/accel/qaic/qaic_data.c:620 qaic_free_object() error:
> 		dereferencing freed memory 'obj->import_attach'
> 
> obj->import_attach is detached and freed using dma_buf_detach().
> But used after free to decrease the dmabuf ref count using
> dma_buf_put().
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> ---
>   drivers/accel/qaic/qaic_data.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index e42c1f9ffff8..7cba4d680ea8 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -613,11 +613,13 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
>   static void qaic_free_object(struct drm_gem_object *obj)
>   {
>   	struct qaic_bo *bo = to_qaic_bo(obj);
> +	struct dma_buf *dmabuf;
>   
>   	if (obj->import_attach) {
>   		/* DMABUF/PRIME Path */
> +		dmabuf = obj->import_attach->dmabuf;
>   		dma_buf_detach(obj->import_attach->dmabuf, obj->import_attach);
> -		dma_buf_put(obj->import_attach->dmabuf);
> +		dma_buf_put(dmabuf);
>   	} else {
>   		/* Private buffer allocation path */
>   		qaic_free_sgt(bo->sgt);

Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
