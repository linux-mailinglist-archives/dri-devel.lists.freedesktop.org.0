Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60087BE9505
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 16:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9074510EC43;
	Fri, 17 Oct 2025 14:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="CFv8xL7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973710EC43
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 14:49:42 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H9mRcK001261;
 Fri, 17 Oct 2025 14:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=pp1; bh=0dSIPJcwALWv0mVTV
 Q+ng2o6HtT44rWSzjve/F3qb2c=; b=CFv8xL7eUVUkx8ILeVfw51sxDDhOTJXU/
 QhUYMw2ivVvlQOmE+R9v5m9RcBTs3yiwLvE6058CuKstPDE7V849dxNKgACjFmEY
 wnj8rImQh1YPTyI3CRtznA0DW+tVCUCBnUQu3PCYbqB09g/GXtjR6S6J/KEeCm/8
 7oDsxiVfPwPz+DpQZ4/fTN9ntp4MmdjM/ggYndZk0YVpAXU6QuEg62jk2Vg2haXH
 tSeVJXccCucjGnWJxKxjpugj7dGl54YaRDvSZ9oyJ7XYyfIyxd9T5MdiycCDpAek
 cLD5E4bmmjYh6codnEhjGoucnk8x5H23sILHMtd5QS7Rvy38ZpVGA==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8e8sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:49:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59HEnVhc027905;
 Fri, 17 Oct 2025 14:49:31 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8e8sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:49:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59HC1xU6003603;
 Fri, 17 Oct 2025 14:49:29 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r1xydwuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Oct 2025 14:49:29 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 59HEnTEn34210530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Oct 2025 14:49:29 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1316458059;
 Fri, 17 Oct 2025 14:49:29 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE57058058;
 Fri, 17 Oct 2025 14:49:24 +0000 (GMT)
Received: from b35lp69.lnxne.boe (unknown [9.152.108.100])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 17 Oct 2025 14:49:24 +0000 (GMT)
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: balbirs@nvidia.com
Cc: Liam.Howlett@oracle.com, airlied@gmail.com, akpm@linux-foundation.org,
 apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com,
 byungchul@sk.com, dakr@kernel.org, david@redhat.com, dev.jain@arm.com,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, matthew.brost@intel.com,
 mpenttil@redhat.com, npache@redhat.com, osalvador@suse.de,
 rakie.kim@sk.com, rcampbell@nvidia.com, ryan.roberts@arm.com,
 simona@ffwll.ch, ying.huang@linux.alibaba.com, ziy@nvidia.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org, linux-next@vger.kernel.org
Subject: linux-next: KVM/s390x regression (was: [v7 03/16] mm/huge_memory: add
 device-private THP support to PMD operations)
Date: Fri, 17 Oct 2025 16:49:24 +0200
Message-ID: <20251017144924.10034-1-borntraeger@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-4-balbirs@nvidia.com>
References: <20251001065707.920170-4-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DfklAXPcfAtrNGM5jY-KNpF22Kob2KaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA4NCBTYWx0ZWRfXwJljw/lEqKWM
 D1hwuYVkDKLS/aDjhMhaRxdkXUSsyvHOYS97+v4q1edG+GxAcK4qeURdagJiI4mVK2s6N2IiAW+
 HcUFjBszJ89TY2a8nhqnMOY2r9Z3+6/toRhinLlrnZKDkls6dnQVfAEy/mphOIHvkGfmruukvpI
 eh3FxlZBm66BejMBARNCpb2ZZU9PMje2quJEIdM0sotJ6Lbj+2EQjXV6LOsocpdP7nbV+JEub/Q
 zi1OsQ1dlXYfwTnKwlvoaj5KWRQdtidwWKDSBBb/l7q+Ydcv8NYUkQuzj9YJ9fvOgoB5RCWm2Xh
 hHWazhg6C7AUK0gqCe9jK8iyOw7VLAZGw85A5ldyo1xtx38HBNkzQd7K4fMOqEXoBf/r28hVYoL
 R+KqIHei+dJEDX1+JlW0IYYc8R3Oqg==
X-Proofpoint-GUID: FMxTvdFdAsHpeQIzVN6T6lFv6ZTA0cpa
X-Authority-Analysis: v=2.4 cv=af5sXBot c=1 sm=1 tr=0 ts=68f2577c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=axXWKVb_3fx9jgWgKzgA:9
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120084
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch triggers a regression for s390x kvm as qemu guests can no longer start

error: kvm run failed Cannot allocate memory
PSW=mask 0000000180000000 addr 000000007fd00600
R00=0000000000000000 R01=0000000000000000 R02=0000000000000000 R03=0000000000000000
R04=0000000000000000 R05=0000000000000000 R06=0000000000000000 R07=0000000000000000
R08=0000000000000000 R09=0000000000000000 R10=0000000000000000 R11=0000000000000000
R12=0000000000000000 R13=0000000000000000 R14=0000000000000000 R15=0000000000000000
C00=00000000000000e0 C01=0000000000000000 C02=0000000000000000 C03=0000000000000000
C04=0000000000000000 C05=0000000000000000 C06=0000000000000000 C07=0000000000000000
C08=0000000000000000 C09=0000000000000000 C10=0000000000000000 C11=0000000000000000
C12=0000000000000000 C13=0000000000000000 C14=00000000c2000000 C15=0000000000000000

KVM on s390x does not use THP so far, will investigate. Does anyone have a quick idea?

Christian Borntraeger
