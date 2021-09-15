Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE9640CBFB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 19:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96FA6E9C8;
	Wed, 15 Sep 2021 17:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA6D6E9C8;
 Wed, 15 Sep 2021 17:53:43 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FGTCSV032082; 
 Wed, 15 Sep 2021 17:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=PQTltMoWSduSUEjvHiBrBX2GfJ7ms1OUq6dHiJ++Aek=;
 b=0eafCOP3o8+155mCZ6vw5kkVPv4tVks5NctznJzm+jtDi7EZpeYFgQvQkmdEGkwRD1jU
 q4JovHwR+DbJfEdEPkOj0VKciXw6lADbbIPoX+55JBp4AHOuCM/hg8HtS5Qiz1asxzHB
 u3FDrGkveUBi7uLsEwq7n/fZ0bCfTFdH65xMs1VBDdHjYSQRWMfbgKBmJD41tJceLOec
 wqAtrspCyfCSCl8VgYPAfQ4R9kMXJyv3pUE/60ysnbeydQvwNzsGx2rmwd7jCX7+3V4C
 /GChjI1OUB2FGguS6F/u6070X0s5dw+UxnrNrrS/n4RNzTz9BWOgGX047ERbjVXlDG4C Bw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=PQTltMoWSduSUEjvHiBrBX2GfJ7ms1OUq6dHiJ++Aek=;
 b=IfSXkDZPRGF629g6oBulzHFIe2lzyq9kebWwtA0CzYglDVDuMDoDVXDKxFgIx4dFdwUP
 wiNMqKOzwcGXzlS++SYU9Rwzi71eY9DS2cVSjjCRQC2IVWaOlWSFVh3YFGb/nZKKgUle
 KnlYBVBvAjIvAkopz9aWtIVYkzb2e10U2SXyE6v4P2/AmsvUbszZI/txLeWFEIsIDsKX
 HZyIT9pFFj8EavwEp76GbfdBKahQ7wS/YPI9yKHIMc6sfxBHFVkVLbug8h2ncUwTk5uy
 nKcddDOw5lpwLV53eIcWidzTRAFRygbw/FGg1137GGwRG3Mm1cKH/WGsl06boQt8iqqD BQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2p3mp3mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18FHkSlf161006;
 Wed, 15 Sep 2021 17:53:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 3b0m986kuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 17:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqVDnOiFgY9mimV633/6wKm0Eg9Rbe4zCFyngEaPuEXaKaCTkpVcVqkQ7JbPxZJzkKgWCTVE74Mbz4pzAzMsG98Q+4M/482EgNKOlA93eanwHNYWsgVmzUh+4yx2if1JJDTMHFHe2Y9XCZg95QXA+p0dYwr2hNPoE9e707TwgxAXE+axXm7/ZOU06WgMYBOja9mhrSgr6dWU9lLlFYIE2cytX9phxgWQWnWENzRDCrwUF9j2KshpAzmQEpxsmjYfL0z3W9vP1cbjgACT8pqyyx3GtgPOjiqa6OCE1k7+IzW8im4kK16Huyk22noQ0jSRuknHannDVppnws7U2SVPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PQTltMoWSduSUEjvHiBrBX2GfJ7ms1OUq6dHiJ++Aek=;
 b=K8LZtIr/qv+IZfhPi+f+Xm7b69fZzlv8By5wFcCVYLY16YvG+tZrbD8PO96TTsjvaPv6lrqscazbldpK3Pt3bRIS3X8Olh7uIz8MWNARJydGYekIxlJaFHFal8rSnNc18QJHzP3JnA1LOrMJuU4daBqQEGhMkR9pvbY4lNnpSWs+w5qo4XsPFr1XFIKU56CXy4VYnIoSx/wAx730N/x0zRWMDx9VTdPQLBGnSOzipV0k6egWk6JAqSqB6sLgXfP2EXXkl7UVkrj2BRBCdiCS/fVf/6mV0wvuGdiLULkQ28mqbYo/QJUAClBohZbqispWI44i6n5GPSNXRDbUKWSJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQTltMoWSduSUEjvHiBrBX2GfJ7ms1OUq6dHiJ++Aek=;
 b=DnWGQu2VPk8NLmUtYJAed/FtSfks39X8u9Z8KNvZbTsuxXjFKZdGahKXff67045TPp/FB/RUFvPOth3YwgzWrXStcp6zAkpC6xbRDN2ycwlE5V2sV8+6hX5Wy6PW2BVc/cbTlDOyT0UhCnUbp7dYGMS4/LNdkYKLR8Bnvva31Ss=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1568.namprd10.prod.outlook.com (2603:10b6:300:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 17:53:28 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 17:53:28 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v2 0/3] lib,
 stackdepot: check stackdepot handle before accessing slabs
Date: Thu, 16 Sep 2021 03:53:18 +1000
Message-Id: <20210915175321.3472770-1-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0105.ausprd01.prod.outlook.com
 (2603:10c6:10:111::20) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SY6PR01CA0105.ausprd01.prod.outlook.com (2603:10c6:10:111::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 17:53:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f08f2a30-4fef-45a3-c2f9-08d97871b91f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1568:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1568141FBECB90627648A096B0DB9@MWHPR10MB1568.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIGPK1RfNzikULQWFFurwHWk1AojfBcTUhHruiPrDYi5X747Q80FqXgv21ZSMVZrWb2Wvo559lIx/iVZCHUQqozGRt6T/Pqq4ZdmznPGzS+org0FI/kCuZ0g7p8csup8r1tY1c9HfyVSBtIEd2rnA667GxwgPQWeNoP5G77tNDbN5qZr2mGyQcAOdDupLZF1bdn6PLnaf/adAl7wWqMA66VmRPHYN5wZRWZqUK6STZotMO3K6VLPTWSjlMseI+BiCnul/9MMj22vU28HR7EplJP0zqSzw9qeN60SAD0c/HQyxEiCv5rrHsLZJNLoKRiZKWQ4Q8NZjuj/qqilrfWFnu/ZXUm52whHTtnBSBHZsXcN06GJhrurr2HmwNf43fgRyq/Ljkq+f3bhYtLuZzRg3MwBjjgmEEQ8hCbh4KyMclYpGrtR5HhnWGw7NiOsClcD5YH0mCHQwJDjyBagpO5mPaUz/sOsDRmK7B6CIb+9bGbzeVmp9XQaSeyp032P10DDgSu28SJaOkP0QkkWpwK61IC1cyeuwngZpPllaTTQiA1fUaFVSQhe2nwvh8uQy5wym3LYGSZvXFwA3pCY2JIN3zNJyFWssco3EcPER9fq25cFRXEtpUE/ILLoXr44zpfGH10As5HjxAXGJrOkWNxW/MdtgHv02V9T0U1trgpKeFVOR+uQ6Tjq4UJ4AwWD3vxSiB5GU5H/Oa6IzE1tOCFMDTkd6fOUL20Lv/9SJFdhQYxUnmRaeciQ3Qh2KTGUZ8EVXa916zjI+sn87NXGH3CusRslkYP35SvJ5SzKdNByVnwmR3aRlEmo5IKqpQQhftp6Bx4BARV20ewrDVRwO5n8HrVB9vctoviU5//Uczdr2hs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(396003)(366004)(346002)(966005)(6486002)(66556008)(66946007)(2906002)(6666004)(921005)(66476007)(38100700002)(8936002)(6506007)(38350700002)(83380400001)(7416002)(956004)(2616005)(8676002)(26005)(186003)(52116002)(103116003)(36756003)(316002)(86362001)(1076003)(5660300002)(478600001)(6512007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YpP0LyepXL/QqFfhuEDwNItqUOGPxs/9JBZdQcg6Ss0o8HdfxefqTxFwNXTy?=
 =?us-ascii?Q?LSCtOpBWgg6/DxXtVaUIegJu3CfG1YwkJcyo+YIvD+nxC8FLl5Ibuo6VRIGm?=
 =?us-ascii?Q?Q/Csfx0+OSRmvlGz9EJkMMUhAgdV9Ix0CeszsVI80Cpq2XvddxGNpfGFvqGP?=
 =?us-ascii?Q?P/Q92kqIU2fbC4Ro0Yp273op+QCEvICR9kuxH5FeuFE1O7XoQ0qtcK/VDjgI?=
 =?us-ascii?Q?pCZqIyQ/1P7rw7h331tcgnu54uDpFG/jg8vmd1orHQvElyxr2YmIWW1RzW39?=
 =?us-ascii?Q?ndwdZrhygrPTHCcgAaIueqbEU9oJz0q0IvuqzmCCguyzZuL8r2qhr0wtSOCj?=
 =?us-ascii?Q?YLTydZcg9fdb3tBDovvPuvZ8N06MoUpHyWx49x3jf+t4DZqFMiWwfbOTwYIj?=
 =?us-ascii?Q?fufzTdUwPKPK+mF/5N1xGqc6e9XzrrQkGXODzysraBT+VlVUXQK5Cj4otQlR?=
 =?us-ascii?Q?I0dmEti5uDL+Joq1fuASmQbG0j5OMjOnblvR3qNQbO+WZi2LPUM1Iuu/ddFQ?=
 =?us-ascii?Q?prWt3t+4M+N/Q9Bon0Gy1msmq4lZP8ZOqrNgIgcounrLJ+iQyP3NJG1PrDpA?=
 =?us-ascii?Q?af/5YZusTOt3amTm9j4XTRiYgpT4fa3sYiYUoA5SLLMKMl+YhqXnRaWOXP5p?=
 =?us-ascii?Q?MYYcE/+0QRrwN5qMRUhexKiG1BCMacomh3E8CpOLgetK32bVZoHqbxLIn55h?=
 =?us-ascii?Q?RovszUhID5suVkbLviLlIcU9/Zqmbko+IWSBKk3QeVDHUETpwiH99SGsL0CJ?=
 =?us-ascii?Q?ILaX8BdBhICl7AoLg+sGtkeYbckjxblDeG3y0p/JH5YAiIFWS2WhCy9Q1Nzf?=
 =?us-ascii?Q?Uapv+oB51MsFQgeCSMnUWpRXWyqgXYN4Ll6wrdrUtgZ/OqjwOFd8rwY8fBv8?=
 =?us-ascii?Q?DYu7tC9t8OU1KuI/KJa1f7Z31ffavL4lw12B7lfJn5BS4jCWefJr90W4K4FH?=
 =?us-ascii?Q?BVGs1f+bqDJc0AITDfqsbwtDsahC4MiLh6u5fVboIqiLouxeu3jLv0sVQsSu?=
 =?us-ascii?Q?MiCwO078dJ6nbdsW1mQ8MIpCnKvQroISR0ZRXKwFZLBElc80JxPsxYnwOind?=
 =?us-ascii?Q?6pJgD4bNlGZkXZODzEg/PAl8obmVIjNSGG1dhOsrHFnMqMEdRV+wHznizPY0?=
 =?us-ascii?Q?1SOVk/UNMQtfLOO8z/LngFyzGUFeWq7KCCdvGjXLiExvUTXM5GxcbMrtlPFM?=
 =?us-ascii?Q?K0mX3racEP2QqO8eRcUzQ3ObzpdazKhN2LFrqQmM9Vh4O2+r142TqZy7CfST?=
 =?us-ascii?Q?XQopUMcKHuLqVNfYGic1S9rUa73p0sHaic5kn0WVDR5GGi2VzPrvsEtyW1CN?=
 =?us-ascii?Q?zzPOAnLQ9X4kS5KOVtpKksJN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08f2a30-4fef-45a3-c2f9-08d97871b91f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 17:53:28.3493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A53XU9TPD0hHVP3L9IJGlbQ3G4S83zapq6kVzRm/0U+wR9NEkb6tDzWqUPIOCcBPPNs+0CqMQUpB4o4hJWHqqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1568
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150105
X-Proofpoint-GUID: VIxzGFAGkzzfl0H1FEwK_6vsWlQ_vQqV
X-Proofpoint-ORIG-GUID: VIxzGFAGkzzfl0H1FEwK_6vsWlQ_vQqV
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
 - Fixed compilation error [1] due to typo in patch-3 (stack_depot_print
   used in place of stack_depot_snprint)
   This compilation error appears with CONFIG_DRM_I915_DEBUG_RUNTIME_PM=y
   and this was missed by my test config (x86_64_defconfig)

[1] https://patchwork.freedesktop.org/series/94696/

Original cover letter
------------------------------------------
This patch series consolidates the changes submitted and reviewed at [1]
and [2].
The patches at [1] and [2] were submitted separarely, but they have some
inter dependency (later patches were created on top of earlier ones).
As both sets are still under review, I have put them in a single
change set here, so that it can be reviewed/included together and also
to avoid automation build failures where git am fails because of absent
parent.

I have included Acked-by (from Vlastimil) and Reviewed-by (from Alexander)
tags obtained so far for these changes and have also addressed last review
comment from Vlastimil [3].

To summarize, the changes in this set are as follows:

PATCH-1: Checks validity of a stackdepot handle before proceeding
to access stackdepot slab/objects.

PATCH-2: Adds a helper in stackdepot, to allow users to print
stack entries just by specifying the stackdepot handle. It also
changes such users to use this new interface.   

PATCH-3: Adds a helper in stackdepot, to allow users to print
stack entries into buffers just by specifying the stackdepot handle and
destination buffer. It also changes such users to use this new interface.

[1] https://lore.kernel.org/lkml/20210902000154.1096484-1-imran.f.khan@oracle.com/
[2] https://lore.kernel.org/lkml/20210910141001.1622130-1-imran.f.khan@oracle.com/
[3] https://lore.kernel.org/lkml/ef0aa660-0cb6-dc21-f2ce-368b34f8af3d@suse.cz/

Imran Khan (3):
  lib, stackdepot: check stackdepot handle before accessing slabs.
  lib, stackdepot: Add helper to print stack entries.
  lib, stackdepot: Add helper to print stack entries into buffer.

 drivers/gpu/drm/drm_dp_mst_topology.c   |  5 +--
 drivers/gpu/drm/drm_mm.c                |  5 +--
 drivers/gpu/drm/i915/i915_vma.c         |  5 +--
 drivers/gpu/drm/i915/intel_runtime_pm.c | 20 +++--------
 include/linux/stackdepot.h              |  5 +++
 lib/stackdepot.c                        | 45 +++++++++++++++++++++++++
 mm/kasan/report.c                       | 15 ++-------
 mm/page_owner.c                         | 18 +++-------
 8 files changed, 66 insertions(+), 52 deletions(-)

-- 
2.30.2

