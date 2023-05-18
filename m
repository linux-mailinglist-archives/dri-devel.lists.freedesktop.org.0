Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2B70837A
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 16:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195A10E0BF;
	Thu, 18 May 2023 14:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08B510E0BF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:04:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34ICWWrv003349; Thu, 18 May 2023 14:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=n+yQfUQ87Lf9dY0t9p7EADSR1Tb9oSR7tu0EsYq+8F4=;
 b=NEHNvAX24MziVcZfdJP3IYlr16y0ZfznMYope/OCqLh2zFDPjRGoadUcFLCjWEzbShYP
 YxlAbKCrqiYiga9wDbLExI5nJ8CvDEvdl6Y21JtFf7hbIbM6ly/1mcbHO+n9evbi5UFu
 PbclhysGPrK9QVDvPOMpoFdUQTDRW7XNlJ12BpdXN5tPWGG8pHEPaAeqe0SKRHI3wmXL
 MSeKH2/VPzKOrI8J3b0iylXNiN+axkF4/xrk8KJ2eLbwvLsmrMiyDs0MF9e/C+WOXSiV
 nlU7+eAjnfjrVpDDnkaa6cgriXC3p4IMJ5zSyKMF6sXgnvlg1zUdjaxUAqqjJgmG20ir mQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qnc30s6un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 14:04:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IE4e6b005752
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 14:04:40 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 18 May
 2023 07:04:39 -0700
Message-ID: <af799bbf-f6f5-0d83-4683-1a2d03c98577@quicinc.com>
Date: Thu, 18 May 2023 08:04:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/5] accel/ivpu: Add MMU support for 4 level page mappings
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
 <20230518131605.650622-3-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230518131605.650622-3-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: B6luyoF8EpOKp5KF6IVU3VJRNeHuW3Km
X-Proofpoint-ORIG-GUID: B6luyoF8EpOKp5KF6IVU3VJRNeHuW3Km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_11,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 mlxscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180112
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Raymond Tan <raymond.tan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/2023 7:16 AM, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Program additional fourth level required for mappings with VA above 38bits.
> 
> Co-developed-by: Raymond Tan <raymond.tan@intel.com>
> Signed-off-by: Raymond Tan <raymond.tan@intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
