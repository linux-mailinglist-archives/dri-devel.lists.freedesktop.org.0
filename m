Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF607AF01C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 17:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5665B10E17D;
	Tue, 26 Sep 2023 15:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E4A10E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 15:57:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38QEKpab016114; Tue, 26 Sep 2023 15:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EVCQSveuHT7ZchLE9/1ELr5NgUCV/uarGxErWNMf14s=;
 b=eDOu/3nRaV+KOyR5aeVHL2YJPipk1HnwVRg1zxPvObQ+DB6PKuZrOw/qm3isle8qUBa5
 YNEuxgwIp/HMJpW38L1PlSoOd8kWJrsLcUidRzHtTAX3fRkEu7IatJaebxfgP5poPQx3
 yVSk3upOnxIilj9C60Kpnr8joOAZUCWGRpaGxeu2uOUfVE94SYvUGiWx8GAzHYZm6fVd
 vE1058ADl/vshQ5AHzSkTR2oNCPEoU4Mz6nxYOLJQSRuiZHZn+wf6bvCw7zOOg57gwGb
 FJafL1/LXM9XJ+g9GWdNxXWM4wvDfDecswRdC0HQ2N6S/wnMDgZLjZROECKsz/LzWZXN 5A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tbnb3swmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:57:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38QFvU0F005060
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Sep 2023 15:57:30 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 26 Sep
 2023 08:57:30 -0700
Message-ID: <4a3414d4-ea9f-e8bd-446a-5f5d30a2658a@quicinc.com>
Date: Tue, 26 Sep 2023 09:57:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/2] accel/ivpu: Use local variable for debugfs root
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230907072610.433497-1-stanislaw.gruszka@linux.intel.com>
 <20230907072610.433497-2-stanislaw.gruszka@linux.intel.com>
 <20230926052601.GC846747@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230926052601.GC846747@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tdLCRBzXmcqdpjwpqXsLFscR1CNu6CJG
X-Proofpoint-ORIG-GUID: tdLCRBzXmcqdpjwpqXsLFscR1CNu6CJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_13,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=668
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309260140
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/25/2023 11:26 PM, Stanislaw Gruszka wrote:
> Use local variable for debugfs root, just to make further changes
> easier.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
