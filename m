Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0A83E106
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB6310FCEB;
	Fri, 26 Jan 2024 18:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30D10FCEB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:04:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QHFnx5003673; Fri, 26 Jan 2024 18:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=6iw4YGR5xufM8ee94zcvA+eKRSembAFfOYbKDgYbmnY=; b=Hc
 c8WfEPXt/dpZ8zEL8DQ++ZlQJd7S1iiccgEJeP73fSCK89RGia6kO9IT/Kx/Dxbk
 QNbdOEUbPTZJ/pj93wylvJo9wXtflRROYdMjeUVWFKGzYGYeuy90Fu/8dfBF5brW
 TInYl2lpdfrK5u5Rv+kHI1LdZqmT4r2aU7GVY278NwoNa8ytI+zDYlnNp8ex2kZ4
 aSfDTKohi/AGNe3aQsEUmbfKzCXK7FanWDPLUKaRN5KaJV2mdLp6jBRPrn0+PSms
 JzykIfHpp78+1vTqVPLkFrWVQkb2XAdEoYJ6KymfnYMuIMzc0lA/LeRo1y0iCFAo
 3IenUBCLrNaaa1Vu8M+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgy8g406-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 18:04:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QI4SUC001400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 18:04:28 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 10:04:28 -0800
Message-ID: <636cbb5d-fa85-c83d-d962-85dbdf844139@quicinc.com>
Date: Fri, 26 Jan 2024 11:04:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/3] accel/ivpu: Improve recovery and reset support
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
 <20240122120945.1150728-4-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240122120945.1150728-4-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2aIgnclTZU9IvCvK5GbO8MWhww3I5BQk
X-Proofpoint-ORIG-GUID: 2aIgnclTZU9IvCvK5GbO8MWhww3I5BQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=853
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260134
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
>    - Synchronize job submission with reset/recovery using reset_lock
>    - Always print recovery reason and call diagnose_failure()
>    - Don't allow for autosupend during recovery
>    - Prevent immediate autosuspend after reset/recovery
>    - Prevent force_recovery for issuing TDR when device is suspended
>    - Reset VPU instead triggering recovery after changing debugfs params

This change appears to be doing 6 different things.  While they are all 
reset related, it seems like this should be 6 individual changes.  Is 
there some dependency in the code that I am missing where having these 
all combined is the better technical solution?
