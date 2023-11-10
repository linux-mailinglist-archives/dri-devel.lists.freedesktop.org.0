Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EC7E788D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 05:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4425310E648;
	Fri, 10 Nov 2023 04:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC64C10E649
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 04:06:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AA3qrk7011543; Fri, 10 Nov 2023 04:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ReRM9NCnEyWVp3cZBc9kTQoUWSj1XEqhmPnbwboSpI8=;
 b=TkiZzJp6EgHe4MGVXW0jew392G909flw5z5PGutWaBigoLey3Ts5AqLAyieaztyd56jC
 Wg+ySg8ZX40Y8MSqrs5D2nC6mrJTotHknzPzM2XB7jjej3xTVuWmPFHiKh5F7C9jD+F0
 mD021sgQJFWA/4A3XxcS56O6hY44RBXwd6lhkRVZCLg67ZNMIBKBHodsPTrpxS2uIsfH
 BoCTcD+Vf9XE8Zp3HSst1jD8hscqI1378WVpyCi1HCG/8jZYzJuvfadcmcUOBLRmT2TD
 ez7HxOWObdH4capaULbPHhn0OJ40lrgbDQM8ClwXoRjdWgy8LszcndRyGP92USQpKoUK kw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u8y399w5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 04:06:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA46YN7026889
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Nov 2023 04:06:34 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 20:06:34 -0800
Message-ID: <a6e9bfe7-52f6-7705-e594-243e9ffd1826@quicinc.com>
Date: Thu, 9 Nov 2023 21:06:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/5] accel/ivpu: Do not use cons->aborted for
 job_done_thread
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
 <20231107123514.2218850-4-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231107123514.2218850-4-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BtRJk4ryfMfcdn0-gVpz7F2Ur8mTp0aK
X-Proofpoint-ORIG-GUID: BtRJk4ryfMfcdn0-gVpz7F2Ur8mTp0aK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_17,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=725 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311100034
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/2023 5:35 AM, Jacek Lawrynowicz wrote:
> From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> This allow to simplify ivpu_ipc_receive() as now we do not have
> to process all messages in aborted state - they will be freed in
> ivpu_ipc_consumer_del().
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Missing SOB.

-Jeff
