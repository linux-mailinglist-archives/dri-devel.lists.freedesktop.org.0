Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B677CFA8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 17:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98F10E1A7;
	Tue, 15 Aug 2023 15:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B90310E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 15:54:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37FFOgDa010244; Tue, 15 Aug 2023 15:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2PlecWAlfBhCfts3ubDN5CZ/qZA3WWvzg+/g3N09+2M=;
 b=GoTUYmaIF3Z12V6FCjqpoUPfoI7S8w3AitCo3W+xf2G09/YLmyW9A5m0wCC/vt9biJWM
 IRYYw3At9/DlC57VT95984ZxIXboD/PFfSAk0x8Q/6i15EkAEBp8jYfiIqKQhjtXabFB
 uu9iXe8n6I13wIeGg1kcHzU+xKYhCxtIXMJ8PxVta1ob63LMTVZL51xeZPYlZheuTm0h
 shVi1Bl8qO8Fdwf/AOXRRCgyFvSsVbx+XfUrEsJz7mV730zY3UiB1cDPtqtj8Yf1d2C7
 TuawlMh37ucqGyxIN/ufsvDw9z6M6E8Yl9QWvpzjoXLLf0sZ2nuIbuozKQpPjtUoRSLj kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sfh74k28d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Aug 2023 15:53:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37FFrsCW001811
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Aug 2023 15:53:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 15 Aug
 2023 08:53:53 -0700
Message-ID: <c581e23c-805e-6acf-78ea-07b4dba8efc7@quicinc.com>
Date: Tue, 15 Aug 2023 09:53:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Clean up integer overflow checking in
 map_user_pages()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <24d3348b-25ac-4c1b-b171-9dae7c43e4e0@moroto.mountain>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <24d3348b-25ac-4c1b-b171-9dae7c43e4e0@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: sFySdkTOyzTLpVrdi0Z8UvFRlHjHWhys
X-Proofpoint-GUID: sFySdkTOyzTLpVrdi0Z8UvFRlHjHWhys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-15_16,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308150142
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>, Jacek
 Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/2023 6:23 AM, Dan Carpenter wrote:
> The encode_dma() function has some validation on in_trans->size but it
> would be more clear to move those checks to find_and_map_user_pages().
> 
> The encode_dma() had two checks:
> 
> 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
> 		return -EINVAL;
> 
> The in_trans->addr variable is the starting address.  The in_trans->size
> variable is the total size of the transfer.  The transfer can occur in
> parts and the resources->xferred_dma_size tracks how many bytes we have
> already transferred.
> 
> This patch introduces a new variable "remaining" which represents the
> amount we want to transfer (in_trans->size) minus the amount we have
> already transferred (resources->xferred_dma_size).
> 
> I have modified the check for if in_trans->size is zero to instead check
> if in_trans->size is less than resources->xferred_dma_size.  If we have
> already transferred more bytes than in_trans->size then there are negative
> bytes remaining which doesn't make sense.  If there are zero bytes
> remaining to be copied, just return success.
> 
> The check in encode_dma() checked that "addr + size" could not overflow
> and barring a driver bug that should work, but it's easier to check if
> we do this in parts.  First check that "in_trans->addr +
> resources->xferred_dma_size" is safe.  Then check that "xfer_start_addr +
> remaining" is safe.
> 
> My final concern was that we are dealing with u64 values but on 32bit
> systems the kmalloc() function will truncate the sizes to 32 bits.  So
> I calculated "total = in_trans->size + offset_in_page(xfer_start_addr);"
> and returned -EINVAL if it were >= SIZE_MAX.  This will not affect 64bit
> systems.
> 
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Pushed to drm-misc-fixes

-Jeff
