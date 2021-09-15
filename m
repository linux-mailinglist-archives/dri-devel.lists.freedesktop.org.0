Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF9440BD54
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 03:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BEC6E893;
	Wed, 15 Sep 2021 01:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88F26E893;
 Wed, 15 Sep 2021 01:49:28 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18EKxaFo026025; 
 Wed, 15 Sep 2021 01:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=+Lu3Gpnjo6zmDsCYMW0k29it7kaXvtef4cG4xLmCpIA=;
 b=dTGGnZtlqma1urfGu/rEOEwyeYyDL+0IdkTLb9+LAFpQY+V4jOoyVJwoWtoGjinkc0Ly
 7H33mrzvLxosQ5K0ESBWNYo0QhQab1NTnqkU8u0kuv4TKlzbmRMpEjTvOCePo35V67AR
 9lvA+djYMBprVQ2b8QkosDaEKcthaxqG4m10p0NWHuW32WN6X2LDdDN2K86rS1lc8PFp
 2sXSRbbx9TaWqqLGBCaaVevKbQT9nfRIk9JuTFmKcb7e1/mtth/Yt08s97rKHXPs40B6
 UA0WBP7XM/UO0y54pftOhZxCpGg7NRXwCdWyelFMj2MGeEQnVYx0xRoqWd5JGA+eUwy0 sQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=+Lu3Gpnjo6zmDsCYMW0k29it7kaXvtef4cG4xLmCpIA=;
 b=Pem38vGJw7ChjTubVdolrjoRyxd3dWd6YbuExO0XheJBiz0Won4vMfYsiwG2VskIZeBd
 K9Qnl3t623AUjtpoVlidnyFmL5AlUaqhczXKQw/BD/nYVOwNflSFNq1uIRlxTEhsx2C+
 DCJiaolNCYkGTa8mBw5b1dmQ1KrkUmsl+BTjzfLRH/L/5yLux9ceOu7D+E/I16qd99fE
 M2gYjnWdBeh8TorrM19rxxwL5k5k1RuCoAXKeLkxzAmoguqGc70/p1SKCWZ1j2xvh12R
 BW7V0ubDqcM+/lamGVFo5Pj4JY/cfqNzxsI2go9IcOCzBB9DVGizlQZ9UXz8EHmvPfir sw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b2j4sbs4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18F1fY6d092178;
 Wed, 15 Sep 2021 01:48:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by userp3020.oracle.com with ESMTP id 3b167swfbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 01:48:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgsxokUuEg+xhs0pGxZRadxakjmk0FmFOXgzXM98ggg2HV16z76Ov/XK5rugUyf+dYrKAItzSlxR5kaLF2DJ3WD0QPhFgKHlb5nFdwVYrsUKWvEwYvtoxYAZOBuRAf5gr3zbIYXiJZN9jqi+ixg8YMceVwY0xs/Aqgb4hi01/6Edi/CsWBODnbBSOEbXDJ+JyHqH/5OMikDQfFZ2RtO7YwTnR8QYNXOfPa8WGzhqSBNNG/4RutQ41zeVyVZzE3rfGKQ/lhyAL3WQPHW2zH6rgNTEPcHfNW3eOBjwZj8cHb70I3Dzn5cPq1Al1LcrRc1Wqr9dcT1RBHoFpoifz2aqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+Lu3Gpnjo6zmDsCYMW0k29it7kaXvtef4cG4xLmCpIA=;
 b=HKlyQBr1nbii88SvsBzyq6bdnXcV0sX7QQCycDSpqzGoNFWFFsA4Vh2DJvdu/wjEydJaTn6UT0qugSn9r610xFlD/U6EMQu+noyGkRXmZE0whILy6CgWC8TFf++Ga1YBNlQxr+Uu8jfQcTETGMFJo9/8KGj0/mvEIS88OSEJJXOq19b5QBmeMlLwT97Djvgc06LP+tNUvsamJ12dcwovkqXlXXe9HwBy/ADpMe6mxtsjQWBKBvEyPOQs7nL26wvA1MIJbTThKrJLeglylG6hY1EoQM/MuPiMXDKko881zFcWMrf6aKq0Z1XrXjeQh3x+a8jarrJ45zn9gPSs0Hpiww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Lu3Gpnjo6zmDsCYMW0k29it7kaXvtef4cG4xLmCpIA=;
 b=y3MRkKDdNmRXpKqcLvVGoKJK5V3r77txk51uQKG39pJWnZ0Bq7n0Ln3LpHrGO3qTLrABsoY34yXRFOaMGVXBBBmULhRAdGcrlcmJ6COeQQdvbZyleiqAKlHhF4/nzdJocMRJGuxpW610sFDfTJLmm4rvCDg09S22SXf4vGQ1Hx8=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by MWHPR10MB1726.namprd10.prod.outlook.com (2603:10b6:301:a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 15 Sep
 2021 01:48:13 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 01:48:13 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND 0/3] lib,
 stackdepot: check stackdepot handle before accessing slabs
Date: Wed, 15 Sep 2021 11:48:03 +1000
Message-Id: <20210915014806.3206938-1-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28)
 To CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYAPR01CA0016.ausprd01.prod.outlook.com (2603:10c6:1::28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 01:48:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5173f01-8800-40fe-00a1-08d977eae144
X-MS-TrafficTypeDiagnostic: MWHPR10MB1726:
X-Microsoft-Antispam-PRVS: <MWHPR10MB172693B55D315C30D314A139B0DB9@MWHPR10MB1726.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiO9jsPlFaVdac3NZKUXXsRJFUJh2kg3y89FBKKWROx4sn7uDau3kqUaToR1Go0qxXHrd0bwCwzkv70EbRHG9pHtdSia6PabzNERtSERKAwpmHc4RG/tRrZveU5xbOyaxgiioXWVb0ECGrt4XEoHRSK/rFNgOIK0l/YOnMeeEDose9qF9HhZIm5xhWp1YypAYgFY75q24VgRXsDfWTqQpRPOoeDhpRxDLczijDg6pY8fHjB3YSMM8mtfI92r1IcJymsudfhbBmUv+d1744vRdWpMA9sks2e+KvSgPuWlW+VDd+fXWc0J6PINdD5PvVJoHZpUhlJkwBh+RexphsqZeHRZHWc96SSUGASvUeey6frvX8CMqAHCT6RsY3LcYyj62nzXJbQXub/9PgYWNlkO5bTvyUASBk7rVcuu2FFDJC0W6/dXApEb5+VW6jxs+WTN7fnk8KReLYqTVZFytqFrG2UMWBh5uqHBi2yt53J7e3/OnBVQWiajuDH0gio57l4LLX3w9S0CGB3CJan/QqvOw6kUrXZRlboiMt+i5e2j/woOmlQ1VGyGW9gjtfIpvnI0cfJHzBE6s2RQU0qNwen91I1OdlJMx8s9JI1kU9k6O5Ygz27JVyhL2gozvjHmXw4qlAKRPGfK1+Vuwtx9KFj4h6zFHrcGpsJVzlv7O+2Fv84ugS4oXx/Pr5UyWuUsZSZah7b5SY4q/2nLkPq67PUgLwsHKFiS+lB6x7uy8GT0wK4fC0XZiuhd7dF31Hv6zU+oKfi8YQAp3RufA/7ChwD1tscdqTE5vYd4x9lMVCTNHUnJqNbOBfv7VQH7Ow9Uh8s1DS6WaawZEP9It45T4J2eA/E8NvNHD99V8z9AWfGHvxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(376002)(136003)(39860400002)(6666004)(86362001)(6506007)(6512007)(1076003)(7416002)(83380400001)(38350700002)(38100700002)(52116002)(103116003)(4326008)(5660300002)(36756003)(186003)(8676002)(2616005)(956004)(6486002)(8936002)(66556008)(66476007)(66946007)(26005)(921005)(316002)(2906002)(966005)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzf2DHjFZ8wwBfJJuUhAutNc4OPXB8nMPdBJeskIQG0WnOg7OndkToD2/u9D?=
 =?us-ascii?Q?kc0FIwRjg5HtBriKl6DPGFuoxAD177zd2d2tSkLVSCCfK0q4PaB2tOSw4/zZ?=
 =?us-ascii?Q?6krroSKjn0bU/PtKwZUD2sZ0FIGvp+QLJrt14WW09CONjqMKJ7lvbCIW1ALR?=
 =?us-ascii?Q?SgLzfXzFPcW1Mna0qzMzX6M8LMixb2EgVRZQXdF+awnTy+3FV2UcyK+NrvF4?=
 =?us-ascii?Q?uaPGuAVUuEAMHzNp/E+POQFUVXAgCIm/LvepjUpjf6rpAV8BDZ6e7K0Rf4/Q?=
 =?us-ascii?Q?hzia/qhdj8TU08XDg2lbd3AEno6jSlbvQVO2/V43PmmcfGqxZGO5WoE0MdYm?=
 =?us-ascii?Q?Zv/f++xsC+SANsQdTLvtAHCmdd4NDC7xDyLnHvbwLBI91a9sOlIQ3S+8/5bf?=
 =?us-ascii?Q?CAiE9NKgu9ZQynVRiW8p7+/pSkJLxA7WMVrRBWxRwsP4lTllqR2PzSFdqZtV?=
 =?us-ascii?Q?43L9bLNjRuwHAQ0+39uZks7o0EEU0BAljggVSY+NIHsfXOmYk+ARfpcE/l76?=
 =?us-ascii?Q?6v7T1Fn2kaGPEs19Y6WS1GE8GvIuHcBQyW9ZzI55WXVoxtNcLi/BZqVU82MM?=
 =?us-ascii?Q?/cDQU4PH4kl8NQxkDBRlJckLi0Vy2jTdNuan3/jpDrRlJivfLrsYG3/n6Gxx?=
 =?us-ascii?Q?vvPPgSwBGXW4blVmIMG8SyhahFC4vXLgt8vw17Yrs4ufml+kvMNeAVJxyGIg?=
 =?us-ascii?Q?VX5qleNBcCLQjYocsDDgTMMvd9Em3NYw231OxwC/zzqpUMnwZ0ficUgBBpPU?=
 =?us-ascii?Q?xMHpuc66SW2PLBpsMVBctGvF/k0DQQV+YK3BLfhmfS+jtvYhfRGVpR6kLSua?=
 =?us-ascii?Q?SHorxXBZWeCnSR1q8X5qk4/SvB9exImma7FPPtK2uyyRSWuKxHM9QrDT/E9f?=
 =?us-ascii?Q?uAX10w+2g8C1aWPQjFL+o6WVVOWQrYJwcXWCrhnVzfn/+cILq4NiuRsEdkcK?=
 =?us-ascii?Q?sk/CutlR04ivHYn8moaivRxODDuOqscLdgEL81qSOXC/Y8m34IhJ8C5H7UxT?=
 =?us-ascii?Q?/5iwkWI4ROOxcn1E5Gev+b4ZWmCHqOgcgc7511+mPudgK4q9dmceYoZcmNPz?=
 =?us-ascii?Q?M5NbhuyL1cWVJIGKYHtNKrni+affXCSmT7MoyhmMbcIsVWvk0YdY9DcfMaYL?=
 =?us-ascii?Q?EiXpVV3FT/oj5369co754jnS9K+t6YBJJvsIzaXlfdcBpNF5QrDFUtQNxtsc?=
 =?us-ascii?Q?18S2agcxStmLV83s4xcOJRcDk3jwg9Danm3FWcgF8bbe+dpaaUJZf137ycPk?=
 =?us-ascii?Q?Ifsxzpv4HvBRQ1ipNQtB7fxcqnPYtl7M9FvHzg/O0jD7TKqy8oyfXJ49nY1N?=
 =?us-ascii?Q?2VuYVN+tbki0T62DfjZpnhRI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5173f01-8800-40fe-00a1-08d977eae144
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 01:48:13.6681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZjLJ575ag3jLb0p2NiQvHg5GoC3AozHsXX+Ir6nwINUyCjO4iEQsmKwvltynJ4zXnFoUDur9yU02OxLAoGF2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1726
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10107
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=910 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150008
X-Proofpoint-ORIG-GUID: 7sDaMTyJu2wOUIbFHOHYMeTKo6Zz-JM7
X-Proofpoint-GUID: 7sDaMTyJu2wOUIbFHOHYMeTKo6Zz-JM7
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

