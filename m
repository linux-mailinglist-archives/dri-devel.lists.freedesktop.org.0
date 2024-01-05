Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0566D825C90
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 23:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C8810E16C;
	Fri,  5 Jan 2024 22:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F0C10E16C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 22:35:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 405KSrR0008943; Fri, 5 Jan 2024 22:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=8oF8YtXnmRSg5LEI4v32QTrQzaw+EWbJ3ACSmQRtH74=; b=DU
 Qx8+/Yy/YeqG71v7LbieZC3uiJirKZJocyg9PpHBqBfFtJJmPiGdAKNAaMfhColG
 AdX/p+nkd4QvYLMG/7Jhcqtvomk5MhqnNe0lyYcWvl4z6VDUYQzSSeuaf8twfq8h
 xSRAC9jU3oolV8De1OLxG8Fb93OHnT9WWi+HP0NXD8E+Z3lZeIL+mwM1auJdIBel
 P4Lgh21XsWxeQLbCT2WuodtMQzf06XX/80JNUZALSgUV9RZT4KAZGIZXELCArRza
 rZtmEdyjSVs0VpOEqgmai6A6FTDsejOZbpJIi3zQZW+YhAINkzwybapdd5HurZe9
 XFo6WzBWO/wDAQHEaiyQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3venmt8tbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jan 2024 22:34:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405MYin4016863
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Jan 2024 22:34:44 GMT
Received: from [10.110.102.225] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 5 Jan
 2024 14:34:44 -0800
Message-ID: <343d487b-cb44-ddb7-f775-d5fd0ab1286d@quicinc.com>
Date: Fri, 5 Jan 2024 14:34:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] accel/ivpu: Disable buffer sharing among VPU
 contexts
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-9-jacek.lawrynowicz@linux.intel.com>
From: Carl Vanderlip <quic_carlv@quicinc.com>
In-Reply-To: <20240105112218.351265-9-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wwi_TRSBXha6a-ssGRb44k98BL6EYqvy
X-Proofpoint-GUID: wwi_TRSBXha6a-ssGRb44k98BL6EYqvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=842 impostorscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050174
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
Cc: quic_jhugo@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/5/2024 3:22 AM, Jacek Lawrynowicz wrote:
> Imported buffer from another VPU context will now have just reference
> increased and there will be a single sgt fixing above problem but
> buffers still can't be shared among VPU contexts because each context
> have its own MMU mapping and ivpu_bo supports only single MMU mapping.

This paragraph/sentence needs rewrite. Here's my take...

"
Buffers imported from another VPU context will now just increase 
reference count, leaving only a single sgt, fixing the problem above.
Buffers still can't be shared among VPU contexts because each has its 
own MMU mapping and ivpu_bo only supports single MMU mappings.
"

-Carl V.
