Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93FC7D1247
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC4D10E5C5;
	Fri, 20 Oct 2023 15:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9D10E5C5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:10:31 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39KETcX8022197; Fri, 20 Oct 2023 15:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QwDwU/pEPbRdzspL0epn5wwglgJZZc+c6B/vz0YSsQs=;
 b=gWFFbnxHxkobjzBq1CzE5Ppj8gNGNqlmt60WrRQU7AtjSL4YZOn6lpo66Ki0WDJ+udz0
 uizj2/UXMaIFn+Nax9YfKK7vKhwhLfhFBxVfOLdwLReSOEPkPkmWIMinVqcyuSiHnauq
 cDVY0279Ag0wH/9hd9/Fq+xCtPVZX+sv4ZU8KaMfUBIctScsYrdiHNUQi4kDrVK2WGeC
 RupJPOrpifVOV+sB38NmbieDrqTZzBK7NRmU90fakFC/nNGonlZ7RFLFqyQfJDArTMkX
 BAnh4peg95InOOO4P0hfTsiu9E+yq2r98mFsvT2ZEtUZnmwqxon5VkIaWvt2NejCU7aq /w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tubwr2bpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 15:10:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39KFARil012691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Oct 2023 15:10:27 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 20 Oct
 2023 08:10:27 -0700
Message-ID: <d0794e2a-0953-ee13-411e-5a415efe95d5@quicinc.com>
Date: Fri, 20 Oct 2023 09:10:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/6] accel/ivpu: Use ratelimited warn and err in IPC/JSM
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
 <20231020104501.697763-2-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231020104501.697763-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oUl0FiyVfAq5QpFBJTb19scoZYMjs6_g
X-Proofpoint-ORIG-GUID: oUl0FiyVfAq5QpFBJTb19scoZYMjs6_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=841 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310200125
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

On 10/20/2023 4:44 AM, Stanislaw Gruszka wrote:
> From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> 
> Quite often during test corner cases IPC, JSM functions can flood
> dmesg with warn or err messages. With that lost dmesg history.
> Change warn, err to ratelimited versions in IPC, JSM to suppress
> dmesg spam occurrence during fail test scenarios.
> 
> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
