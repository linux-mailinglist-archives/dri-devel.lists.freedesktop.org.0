Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C736720860
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 19:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7667010E5DC;
	Fri,  2 Jun 2023 17:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1811C10E5DC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 17:30:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352ENjx0028180; Fri, 2 Jun 2023 17:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0lA1C0/hN0GX6UVMe/H7CkAFbXhAjNM+SBc56ZGYERk=;
 b=Ffvi0n0/uPNClK40RknZ1GXg9feoHL1nezBllqU8F05AXTT5BYtnQa59XwazDaRp1NE5
 FecbhrE5mgijuPML2tiJvA32G6ZtQ3VGF+j0uzZ5YgpuHiPKlATzPt5L/W135yeTO7u+
 sLjv9HAuJ92nK0mbmjz0TeE51eTbU7oMc80X0ppPJ2s+mzyWGgVzEnTYZvrPz9/fhzBo
 LqpUpsWcAZNR43shnMXpvslqeDerSoWeJr/Mb2dYDn/cPv6uqW3Ybtz4PaOLakyMGikw
 v3NRFBT0oclDRNp9lMHz81bzPZqbhhEfeU3NSGtQTMlF2hke1cQdCVMiwxuCgXpjVlpz Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qy2v1259g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 17:30:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352HUWU1014714
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 17:30:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 2 Jun 2023
 10:30:32 -0700
Message-ID: <66ccf028-48df-0493-6510-19bd635210a5@quicinc.com>
Date: Fri, 2 Jun 2023 11:30:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/2] accel/ivpu: Do not use mutex_lock_interruptible
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
 <20230525103818.877590-2-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230525103818.877590-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FoNN9pf_aSLFIoRPlS_JbGT9NsJishx3
X-Proofpoint-GUID: FoNN9pf_aSLFIoRPlS_JbGT9NsJishx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_13,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxlogscore=933
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020132
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
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/2023 4:38 AM, Stanislaw Gruszka wrote:
> If we get signal when waiting for the mmu->lock we do not invalidate
> current MMU configuration what might result on undefined behavior.

"that might result in"

> Additionally there is little or no benefit on break waiting for
> ipc->lock. In current code base, we keep this lock for short periods.

What about error cases?  Nothing where say the hardware can be 
unresponsive and a process from userspace is blocked?  Without 
interruptible(), ctrl+c will have no effect.

> Fixes: 263b2ba5fc93 ("accel/ivpu: Add Intel VPU MMU support")
> Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
