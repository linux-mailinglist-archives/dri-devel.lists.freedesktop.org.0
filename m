Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E340A544
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 06:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5344B6E3D0;
	Tue, 14 Sep 2021 04:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F716E3D0;
 Tue, 14 Sep 2021 04:25:08 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DNXxd8005145; 
 Tue, 14 Sep 2021 04:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=LuSSPO8rPO6qQmQGMJt11MCmkYoR0fS+S+Jszci0sr0=;
 b=c1vPNApsF3zNQZroRLetnmG2MfRHCQmqwqC0RaFRXvUL95ZyE8vgTg6oMfwfWj5q5q/B
 U7FeToKV1fXoVesyttHbHa/3mcdh6Koqrz8TFtIqyseK5QDnCnxud0IB8NaT4HpvlDB7
 2fKjQR5I5vgfvi0vDdLRuFILjEYSpic8JCfEaI7aLmpVQuv2aR5Dfo1s3/89Z+UOqmLh
 iVYSaNns+E1wwCowbRx58w9QLO8XJN8caRBuxjNeE3ppWdxVZM5ujgsvY7VkfG6Ea00F
 4cStm+4YXzv6j5yqwFKZutiJrK2WcrBUyuuaiJEbm1oZxW/P+X6E8BWIl4SCAOn5ilml gA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=LuSSPO8rPO6qQmQGMJt11MCmkYoR0fS+S+Jszci0sr0=;
 b=A4WdMJKHw6qZaDze0SNrSrAKLeqPxz1xWeaF/xB/qV7QUQ+x2ZqVylPKxts+2YDG8FE/
 ywcAkpNVXmYLsuSYyx6x9Hmmx17i5Vjp0mJB4MCjelUgLVWs4hSsmDRQnFoWmJFdFeXS
 ehtSols7c3a2GXs/PFiSNBxNbQMMi01bkajdtYuiq36it56GlZaiK7D24yAH2Gd2YL9y
 BVhbos1UuQ/LuIqa93soaw+IuXObG+a3f2iYgSIBrMTi1iJc3bQ6p/Gy0lPFbLhGFnN9
 NMmAXe1HFQWSD31c8GbCnnkPskWVa2vH65fzoCHBui6Kr8OjAd1T0TV7A9xMKAQq70Ef Gg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b1ka9508x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 04:23:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18E4BP7J193858;
 Tue, 14 Sep 2021 04:23:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 3b167re69e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 04:23:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vt5PydtBN5Q4rsxUrH8wDX+Hc8xiHnkG4sQUoleDQmLHskJ2Rz0XsgcBC9NoqpFr4IG0upT/BB8ubFDBhCDHBQ5HVO9YGtc5wRvL/U+aAM3PT7B3PGTrQe5i/WM9KLI0sL98VrtG1GHRsfA2pTsYZedEhZS9mEqbdv2f+WLpVYl8gAtNiBKBemZGUJTIFIIsFHnSLW7Nw4BNtmhv/YVz+KiRHE/AuYBcBio/p03Qn3av0m60g2XbLwPVwrNJ7Nrz/om5r7Ny7KM9K499i+4SDqMqgxZ8LNmcIye+BoxkfGQQCds7nDLOvhlBGYJV0xcl8xU4t9mcRm4yGvMtPVRCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LuSSPO8rPO6qQmQGMJt11MCmkYoR0fS+S+Jszci0sr0=;
 b=HAsrjifo7/dZ9SajdoBr7HY0dCJCE54a4fi5gnOAc7qPVY8aOSPW2tDaFibeEPqgqxCJdyhyuu5lRluqDQTOKO3CVFSI1VA2XAlofhrptRf7NioY+wSWrBrTdSQYts20uH/HJb/b8bZtB23YP4I3KhV2rcVsEftvZHW6StbXkK5enPNKf9loyTi70MWG2QLVUOlbjKPs1nyZKGDd0L+P6ItaHbDff8J4t1YpHAzhfftc56UUFu41mkLD29+/teJd9g05aPsLDm40zBWYEnEGWrlpZQsJeqtcnC0GcCOiV75ptpV+MaD2Yk4sGajXAIE5RD905i3Cj+gWeHCUA50pkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuSSPO8rPO6qQmQGMJt11MCmkYoR0fS+S+Jszci0sr0=;
 b=pgNuFX6aXr0eOsdsa9iLxTVwrW+IagyESm5hx4jFd8fwMGjwacv6ZwjsI+Eezy0Zxk4rOYZjzbuOQiOnhdkxSRCXLshYBrzx3JpmCuy+OoAhc9TCnd8uxw0IMyRaYYQumLXQV0FsHIlgpCNbXZxJLprrYICNFLfJniVy0h0vFTA=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR1001MB2319.namprd10.prod.outlook.com (2603:10b6:301:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 04:23:53 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 04:23:53 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH v2 0/1] lib,
 stackdepot: Add helper to print stack entries into buffer.
Date: Tue, 14 Sep 2021 14:23:44 +1000
Message-Id: <20210914042345.1919996-1-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0016.ausprd01.prod.outlook.com
 (2603:10c6:10:31::28) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYCPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:10:31::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 04:23:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb67ba73-b098-4407-4af5-08d9773775ce
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2319:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB23199D7326DDE7105E6440C6B0DA9@MWHPR1001MB2319.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tYxGFZLjUiDp/ZUMijY+RDihAZgUCX7HuFcLkjpLI9KgqT0NqwOv/bWH5a1OkaJcU5gx9hSqujuFFasI0fwLDNfA2eg0Ja60YJ7KXhVh74FQlLsf4XcayXytFaU8xMoSOQJyZLkL+S7l9HtdtEND7mMLpm8YC9qXUIKB/+H82fPbonytWznxA/V3+uuR1dqOyq3tpYtKlsmD796FhT1JYkv9j9tOj9AOYuOGoWx28+jppjzvze5SxxytHKzRd8TbT5Yt7PkSKga5kNczG4/Xyta5HE+zFGeuOa4tkwvidQKn9TRk78qYKre2kVqa6yDUYkpwLfAtQA6QQGiOrU9ZgeXH+60wih1YHTImdYPWHzX0XssjRa0N06NIHTuG/bX/G6OJUaLY6oOEZQ0AIrgbTyq09sZYxyPTv4SpsM9byGMQFOjkrw6TC8VoIuIXys3/jxH9BWDBfcILyQ+QHowJVRVmGd+2NKaFhv3pKPB/9VGMQBgq/hmNZSgSiPYZKXNfiNFoHggc4TkysFpdbFeo2quKIVOBqFoelcHz4eG1VdkTOf29QEszG5IZpe8feAuq8vvtIe2zD8lwdYeSET7/Jzp3JLT9NZYgoS6UZc/LtD4gSpa0Eij9Aiebum55nND49G4vjSURBo0zSEMGqsBkIDJKO1YwbmDXxyYeCn3/0kJLkunDfOKkPbUvlD+aj+JlpW64tk2GSdVdglYk2bo+xGJuPK4PeQd9MJOwKFj79e6z2LBl27ht6rO0WHZap6H9Sm1xH/N/KeiRm3Rx+hkxqYCu2q3zEv5NSaAOVSg0A+BScsRlGpEcevCuUQ4nWYqo70LnMHnY+oR87PHJMC+/IvHFIoAXChhy4TZu+jl4Gtc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(921005)(6486002)(66946007)(956004)(4326008)(2616005)(966005)(2906002)(103116003)(5660300002)(316002)(36756003)(186003)(7416002)(508600001)(1076003)(6506007)(52116002)(26005)(8936002)(38350700002)(38100700002)(66556008)(6666004)(66476007)(8676002)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XOjiLQDPD7XqMJM1tolZAflJ9Kr3XylHx9Eo0IGWoBhq+nKmLgvF2o7q7+3+?=
 =?us-ascii?Q?FLqIk+Z3d1cdGmjL9HRiqF2n5uJeEcJK0c5frN1L5N/RHTgGp4SqwpqGkDNL?=
 =?us-ascii?Q?EYW8lVLFlgG8thFju4uYRYo+7FglanPPj7jaJtcDv9WN+vYnqTDey/GX7boX?=
 =?us-ascii?Q?GiYjFWQWpYvWvPvmQ2AjqBBU6TOBKDaGAW4KUKs0dwBiDn85gPODmVUcK1OP?=
 =?us-ascii?Q?ztH+L8MPhOkuVxyXCPKGzBl58M2X1DPxsIgAJK26qHTiO7VU5mb5OAjsjWu9?=
 =?us-ascii?Q?7NIrdJmcbwDLfIJGi9N0q+hecWOZgitNw+jKojN2C7i+a1Wf6WkKacLJ3YTO?=
 =?us-ascii?Q?LOGiXGhiIcJf3DXxIjanHPUaGEmTKR0cLia0W7pHkUfE4EE0nS5S7ZkquXoQ?=
 =?us-ascii?Q?EK0fa6yULZOXcOjFhhh/4p6gSNi8T2l2pKAxWRDHxe2jZYBF4yreJjKIndWR?=
 =?us-ascii?Q?VAk8Dc6ZM1aXL2ObLsUDp0cTeBUq5rMtFhh/UcBgwEknkRg1ayGKgs/3++Vh?=
 =?us-ascii?Q?KGxnJnnMRNnm7UxO7y9QaZfpCWKKS5KOgIxy+PlrWvJywbHRsAfgIf+pYo4S?=
 =?us-ascii?Q?3ordy4bvI51kVAXuNjgpXvbUy8F5reVxKQkVP3qYM71MZrQfBk4iT3XOdr2w?=
 =?us-ascii?Q?SbtIiGw1aJy0bsypwxWkOkElvgg80/dXkP8BlkI2Dn6TFf4TMeqKx6ZnGHkC?=
 =?us-ascii?Q?hY0M77kx6NPA77fQD/dRnuyHR6gIiF5Actf1QoXF51UG4KHrSjlyyThgDO9R?=
 =?us-ascii?Q?mQ0/j2tg8CVJiWHRNBkd07vpTVFUlUe+2G061JAkCRaHaL+a13vsLzAvjARf?=
 =?us-ascii?Q?hZHricl6eGoixkXS27pGr+oZyrpjaQ0nAm1gdH+hhRSXlxjCxzyZ2zVH3Gav?=
 =?us-ascii?Q?5a1oFg1K2oc3f5xAz0lkHYFjCZGLOXvwMCOltBR2oX6EDTNdT0+wUzOX5Myb?=
 =?us-ascii?Q?fzvreVqUFaqNrre7Oz6+4uIRNLwat/sAS4bFZq1BiCRFkqntQocewx9J1Kzi?=
 =?us-ascii?Q?6rrY0+FIy2rn17E6bng3IPKbDwhZ5dt+QgVYyfqLX1u7GVpiSrxdKrinGVo1?=
 =?us-ascii?Q?hy1Qz7iixsSo1BIIT2yA+TaCc4H9EcYvO/AItFv40kd19L07Kml1b9UYKHIQ?=
 =?us-ascii?Q?vTIGk5u5iQxid2IlJi9Hm6nneZmlKf584BfyIbcS27ujvR8te5r8j33/Mfwv?=
 =?us-ascii?Q?nApDkaKWnWSxVkZIERET5V05MgxKqirpO+UC9rh8r3NHQtZva5AWAx2YhsXs?=
 =?us-ascii?Q?qPUcxG+o7Dc/3Dzsa9FOCXmh+D+I/fM1UHoUO+LML16ISasEbr3kIvN+ttqW?=
 =?us-ascii?Q?LthFkKt63IgeHMTlSTQeb2t8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb67ba73-b098-4407-4af5-08d9773775ce
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 04:23:53.3902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+o7XgwjoEM+fevQVbS9ukvNco3ykGkTtgK/wLpb5FfRccNj1yaBbUPpMECyc1fVs28gtbtn8q6B4R8tA/s2zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2319
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10106
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109140024
X-Proofpoint-GUID: cD7I0HNu_PpV4qY-32uAk-AMDzQoYCyz
X-Proofpoint-ORIG-GUID: cD7I0HNu_PpV4qY-32uAk-AMDzQoYCyz
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

Changes in v2:
  - Addressed review comment.
  - Added Acked from Vlastimil.
  - Fixed one mistake, due to which stack_trace_snprint was always
    getting invoked with 0 as space value.
    Changed it to make use of space argument, because users that
    are printing stack entries into buffer, may intend to specify
    indentation as well.

I also observed build error reported at [4]. This is happening
due to failure in cherry-picking this patch and this happens because
the earlier patches (mentioned in original cover lette), are not there
in the tree.

Please let me know, if it would be better if I send earlier patches with
this change as well. I can resend those patches keeping the Acked-by and
Reviewed-by tags, obtained in those patches.

[4] https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/94553/__;!!ACWV5N9M2RV99hQ!f4tVsbn8O3mxUrGV-8udpN7kFqqQ84bFeSgkqV0aOmatwAJStZV0dkai1xkpsOSDpQ$

Original cover letter
----------------------
This change is in response to discussion at [1].
The patch has been created on top of my earlier changes [2] and [3].
If needed I can resend all of these patches together, though my
earlier patches have been Acked.

[1] https://lore.kernel.org/lkml/e6f6fb85-1d83-425b-9e36-b5784cc9e69a@suse.cz/
[2] https://lore.kernel.org/lkml/fe94ffd8-d235-87d8-9c3d-80f7f73e0c4e@suse.cz/
[3] https://lore.kernel.org/lkml/85f4f073-0b5a-9052-0ba9-74d450608656@suse.cz/

Imran Khan (1):
  lib, stackdepot: Add helper to print stack entries into buffer.

 drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +----
 drivers/gpu/drm/drm_mm.c                |  5 +----
 drivers/gpu/drm/i915/i915_vma.c         |  5 +----
 drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++++---------------
 include/linux/stackdepot.h              |  3 +++
 lib/stackdepot.c                        | 24 ++++++++++++++++++++++++
 mm/page_owner.c                         |  5 +----
 7 files changed, 36 insertions(+), 31 deletions(-)

-- 
2.30.2

