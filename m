Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C187E0542
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 16:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D839C10E168;
	Fri,  3 Nov 2023 15:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C7C10E168
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 15:07:33 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3A3EWQ8g012296; Fri, 3 Nov 2023 15:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=E1Zp4ZPb3CKjcRmfc0jW2h78yWEqKXXIwNBQC22w/UU=;
 b=Bx74YZn9XPnkSTBVlBxrn0oY9+8/Gz87dWw3Rk7CO5k7PtjSfhmh0yZSTznglY1ZQ+MY
 chXZPVtbZw3FJX72RRlL5aKCuD3lULuRlVg3YPJ4YNGabHZmMAERCkaj6Utl8WetMSGL
 XBBa0jHo1ubUSXmx/WiMJ9WyrTaYjVHsZmVhIVXEFnjiLKUbh022kPX6995AHF8hsKQ4
 NRN/1fNdOilHB0rfbyl5kFeMIS57ThCwMv/L+hz2xCtKL6cYSA6BJ5M/0umvbCM14jNz
 00+oRJwS1q+K55R+JiaP6ZNPYEC/rWucNzLSQS0mr4wbb9q89+qpVTd/Wr8nMqLF8r3s xg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4v8mrw2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Nov 2023 15:07:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3F7NBV006953
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Nov 2023 15:07:23 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 08:07:22 -0700
Message-ID: <a03dc1ab-755c-415e-da65-aff507d30546@quicinc.com>
Date: Fri, 3 Nov 2023 09:07:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Support for 0 resize slice execution in BO
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
References: <20231027164330.11978-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231027164330.11978-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WRdS453nXX9TvR4OAWn6yJg3j2CkWMd4
X-Proofpoint-ORIG-GUID: WRdS453nXX9TvR4OAWn6yJg3j2CkWMd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_14,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030127
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/2023 10:43 AM, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Add support to partially execute a slice which is resized to zero.
> Executing a zero size slice in a BO should mean that there is no DMA
> transfers involved but you should still configure doorbell and semaphores.
> 
> For example consider a BO of size 18K and it is sliced into 3 6K slices
> and user calls partial execute ioctl with resize as 10K.
> slice 0 - size is 6k and offset is 0, so resize of 10K will not cut short
>            this slice hence we send the entire slice for execution.
> slice 1 - size is 6k and offset is 6k, so resize of 10K will cut short this
>            slice and only the first 4k should be DMA along with configuring
>            doorbell and semaphores.
> slice 2 - size is 6k and offset is 12k, so resize of 10k will cut short
>            this slice and no DMA transfer would be involved but we should
>            would configure doorbell and semaphores.
> 
> This change begs to change the behavior of 0 resize. Currently, 0 resize
> partial execute ioctl behaves exactly like execute ioctl i.e. no resize.
> After this patch all the slice in BO should behave exactly like slice 2 in
> above example.
> 
> Refactor copy_partial_exec_reqs() to make it more readable and less
> complex.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Pushed to drm-misc-next

-Jeff
