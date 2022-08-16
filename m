Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A25963CC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 22:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E97310E17B;
	Tue, 16 Aug 2022 20:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5F410E17B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 20:40:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GKQWsO001199;
 Tue, 16 Aug 2022 20:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=fxPvanH4qeBVh2aZXacr3twnFRomdbTwosccx73kWus=;
 b=GAxzEeB9Je887taMm/C3Y6+mEPelnEBsZTdS5ir79sWaEeKsKifbbefniv/ZVwUSEqVm
 mbHAwhC/Yeueym6aKukGgOOiP1MBUDpM04UcnuLLYYgvXDE031CTL8YOmU4E4IW7o+x7
 hAYV1P6tAsVyLrHKim8W6rFQjx6L+dY3mjyRYYUlOBAUvjDKTHGsPEQi1As4LnjWdie5
 d4CslhXzh8ligvnZygwBwEOgaHHxm0K8M0DcWrCEPLVhuos8ciUPTJjjM3buY2giTdDs
 Eb1w0RTStllQ6+BfwnbGfx9v9y82+rlKk8aupKe1w+K45xkE+IIm4lsD2Tl/KVy8SNGH sg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j06c0tn60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 20:39:55 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27GKdsOk012363
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 20:39:54 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 16 Aug 2022 13:39:54 -0700
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 16 Aug
 2022 13:39:53 -0700
Message-ID: <7e047ee0-0243-d9d4-f0bc-7ed19ed33c19@quicinc.com>
Date: Tue, 16 Aug 2022 14:39:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: <tj@kernel.org>, <lizefan.x@bytedance.com>, <cgroups@vger.kernel.org>,
 <hannes@cmpxchg.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: GPU device resource reservations with cgroups?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: F6JGtFf7UBmS0kSYJwVIEAQK6aGvdabZ
X-Proofpoint-GUID: F6JGtFf7UBmS0kSYJwVIEAQK6aGvdabZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160076
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, Carl Vanderlip <quic_carlv@quicinc.com>,
 tjmercier@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello cgroup experts,

I have a GPU device [1] that supports organizing its resources for the 
purposes of supporting containers.  I am attempting to determine how to 
represent this in the upstream kernel, and I wonder if it fits in cgroups.

The device itself has a number of resource types – compute cores, 
memory, bus replicators, semaphores, and dma channels.  Any particular 
workload may consume some set of these resources.  For example, a 
workload may consume two compute cores, 1GB of memory, one dma channel, 
but no semaphores and no bus replicators.

By default all of the resources are in a global pool.  This global pool 
is managed by the device firmware.  Linux makes a request to the 
firmware to load a workload.  The firmware reads the resource 
requirements from the workload itself, and then checks the global pool. 
If the global pool contains sufficient resources to satisfy the needs of 
the workload, the firmware assigns the required resources from the 
global pool to the workload.  If there are insufficient resources, the 
workload request from Linux is rejected.

Some users may want to share the device between multiple containers, but 
provide device level isolation between those containers.  For example, a 
user may have 4 workloads to run, one per container, and each workload 
takes 1/4th of the set of compute cores.  The user would like to reserve 
sets of compute cores for each container so that container X always has 
the expected set of resources available, and if container Y 
malfunctions, it cannot “steal” resources from container X.

To support this, the firmware supports a concept of partitioning.  A 
partition is a pool of resources which are removed from the global pool, 
and pre-assigned to the partition’s pool.  A workload can then be run 
from within a partition, and it consumes resources from that partition’s 
pool instead of from the global pool.  The firmware manages creating 
partitions and assigning resources to them.

Partitions do not nest.

In the above user example, the user can create 4 partitions, and divide 
up the compute cores among them.  Then the user can assign each 
individual container their own individual partition.  Each container 
would be limited to the resources within it’s assigned partition, but 
also that container would have exclusive access to those resources. 
This essentially provides isolation, and some Quality of Service (QoS).

How this is currently implemented (in downstream), is perhaps not ideal. 
  A privileged daemon process reads a configuration file which defines 
the number of partitions, and the set of resources assigned to each. 
That daemon makes requests to the firmware to create the partitions, and 
gets a unique ID for each.  Then the daemon makes a request to the 
driver to create a “shadow device”, which is a child dev node.  The 
driver verifies with the firmware that the partition ID is valid, and 
then creates the dev node.  Internally the driver associates this shadow 
device with the partition ID so that each request to the firmware is 
tagged with the partition ID by the driver.  This tagging allows the 
firmware to determine that a request is targeted for a specific 
partition.  Finally, the shadow device is passed into the container, 
instead of the normal dev node.  The userspace within the container 
operates the shadow device normally.

One concern with the current implementation is that it is possible to 
create a large number of partitions.  Since each partition is 
represented by a shadow device dev node, this can create a large number 
of dev nodes and exhaust the minor number space.

I wonder if this functionality is better represented by a cgroup. 
Instead of creating a dev node for the partition, we can just run the 
container process within the cgroup.  However it doesn’t look like 
cgroups have a concept of resource reservation.  It is just a limit.  If 
that impression is accurate, then I struggle to see how to provide the 
desired isolation as some entity not under the cgroup could consume all 
of the device resources, leaving the containers unable to perform their 
tasks.

So, cgroup experts, does this sound like something that should be 
represented by a cgroup, or is cgroup the wrong mechanism for this usecase?

[1] - 
https://lore.kernel.org/all/1660588956-24027-1-git-send-email-quic_jhugo@quicinc.com/
