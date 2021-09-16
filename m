Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20940DB5D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3006EDC6;
	Thu, 16 Sep 2021 13:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37E06EDC3;
 Thu, 16 Sep 2021 13:35:54 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GDQDJm004749; 
 Thu, 16 Sep 2021 13:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2021-07-09;
 bh=y4GJHNUxGwbXl9l9lQQZYHCZRYz4WE1RdEtDkfUsRFs=;
 b=kVKEhC0ymlPER05VlAPc8SC0QNvhhmzFbVX6AZZp7Tmb1lUn1juIb6ekbSLLjWpH037/
 UqM109hzU7Zk4w9dUGaki/skM5y6QjMp2KkwWGkWdQNpR6N7MMy7+M0wDzTEMQGH9Gs5
 Uj6ZsNT0sZjy7QgxCzFI+fI4Zcp436SAgFTK20n1Q2jP3aI71a8JlmMYv+6+8Sp58ACO
 5csLHjgvzCos8vJaVS0JhBEiCPwNjeE0rcN7YfKMMvs3ray+ifbEWHoyIOzkG0yellAv
 qem/c9/mNbs9ne6iOngBRgjNSrX+oUi1HOgeEtTm6i1x9jgr+5vPqGGUCUJEX+n2HQXB nw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=y4GJHNUxGwbXl9l9lQQZYHCZRYz4WE1RdEtDkfUsRFs=;
 b=TH5SuCa0HBsZ1HSgNqIRieNst3SKLTU0PGHd4MPRKs8PIqAZqmpfURPnyC7Crh52O8pF
 q1G8NQaB96Ym7+FDJU/3EmikxqDhHg0ZPf6BwPY2w/iVLDTTwzUfIXjXfTqbs5yQvAzQ
 C1A1vrgfhUcVZZu7cBjNGZyRxlmQ817QYw15JCAwKhxG+icDNvHibkXylW717ac9BwxF
 OU6kEtPYWMwPuBTnX+C0ah3JJnq0OihXLAbi8qyOUlUZtIwZiaCdNaJPlDh4B8DDAYKg
 Gbbi3E/H3mSZsC/HysxeEU+A9UFMRKS9D465qhIBpQFXrWMTZRxfm+8qnhAW84paytOs Rw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3jy7kfwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GDZHt2083818;
 Thu, 16 Sep 2021 13:35:44 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by userp3030.oracle.com with ESMTP id 3b0hjy8gc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:35:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU2rhnbxNab9qoGQ5tI6uzBl8mYBfBjDL2XWitFX0I6UBojRMHL359+GsT18NuJzDRSGNlyG6vXXCFes2LQvyjuh9k15eDGPuzb53+D+j/VDQnPSBEZWI1rZBnNS5wDeWFtwc9H8EoPNQPy7mfA283p7nRLc7Yx92ISqfFRkukHC6o0kWIDv7caF9mB1TmS/HeH+oo/C4ACkWTJJ50auX/+QXsOx6QTG1SFmOHIkeqDanjFwuEhUguUpNDnYkO+WZ6LcyfyQvNV2Uw0s8qC45uAPyU9FLl0Ra5wCGjRxv6Bt908YOr3+c052MIrZz1m7fzpRruok0PNY3UlEdiUE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=y4GJHNUxGwbXl9l9lQQZYHCZRYz4WE1RdEtDkfUsRFs=;
 b=j9YZgxBQK0sy5Nek+3l87lxrQ+uMyJnLzvUSiqwAXgn7I6/rw4JFBgcBedux2UJwVHO/i4LOdffP0i4Tjlbt3AQT/F2RuwcWG1m6M3k+1Y71i6RNYxlMjKrJ+QXb+T7ODJBVrF0gwHErBJFZe90kVD6tqhDpVWpM5E0SU7Wqm5cZeFN02c+BCsko9bh1vhncB32SmU8TBlSuygQFstiGOq0lDvzi2bRydKma1O3GbSrkUFP5hWPp3wXbo3nvL+6PeopkPvZT4uXY6fRoXwlcp+sxAYHvSopGRLaO5+ggZpqNQ5Q9ju79Ya5kVX26etOhmDrLNBPB0V0dY5fwaCKWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4GJHNUxGwbXl9l9lQQZYHCZRYz4WE1RdEtDkfUsRFs=;
 b=HgKzcp92zjg1UrZx8ClBw7uyQyJfH58PnOqA7Clv1yZ6/xpuNM6dk5lVrjQcWFmLmHoGqHAzl1OsjRtkJNWKaMhmVsd3N/feHpIrXiC/Vf9dNDe7O0/Ru5fgymfPAN2CToQy7pWJ5uUo8AKXW+icnGk9tC62/q3OoUj5+07eM0g=
Authentication-Results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by CO6PR10MB5553.namprd10.prod.outlook.com (2603:10b6:303:140::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 13:35:42 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:35:42 +0000
From: Imran Khan <imran.f.khan@oracle.com>
To: vbabka@suse.cz, geert@linux-m68k.org, akpm@linux-foundation.org,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org
Subject: [PATCH RESEND v3 0/3] lib,
 stackdepot: check stackdepot handle before accessing slabs
Date: Thu, 16 Sep 2021 23:35:32 +1000
Message-Id: <20210916133535.3592491-1-imran.f.khan@oracle.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20)
 To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
MIME-Version: 1.0
Received: from localhost.localdomain (110.33.47.182) by
 SYBPR01CA0008.ausprd01.prod.outlook.com (2603:10c6:10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 13:35:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c302ddc-ccbe-4280-47cd-08d97916e127
X-MS-TrafficTypeDiagnostic: CO6PR10MB5553:
X-Microsoft-Antispam-PRVS: <CO6PR10MB555328F891C3325AFF991071B0DC9@CO6PR10MB5553.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HOjpQ1fCz4sBWawZ5cGu+iUko1WGuHrdo6r8dETW2nJYCSnbnwj3PKbnV/lQJgAkTAS+PHLb63RBomXnnxLBZA4dFA/Co2b6FGKNTUmWlbT+oPZOtD4GNL8VDC8ApYcn9bs894B1pnlxRr3C7xMJyaG7XbCzjUc8ShUnaESHE7wgvrtsXflvvxENmv5A+ri67bNFJ8pl6mL5gTnmwbMwWK1hcpp0AoAFXqQkp90QHp9nVzyjxRznrFQtsbSgCWpMPJ5LqJuooz2KkRmI+k4tpkK0GdB0K+DxF573WdXbWdX5vDWjJG0I/IIPAR/EZM2WoxtmkCy5YszbSXG4K5+GYkpM285uQc7SsqVvToeSS6jsY9Av4Ho0tr3XBi3/oVs7BJmE8Ir1ekgLzZIbJ83Jft5G3QNS9zxYbXVPIjvftTvAyI31jvYy+lsI5iRqkZOm6wUnHFAhpgwi+L4E11487Uc8E0jOBATLIiLjYRiHytNqybrGZLx1Ms1Noi/3up57rHMb7lUVmPhE8PbPY2hHCcryORBcvu/fgQlqDv6zO2eHIMEnAdVQl0CAGEJPOBiAjcanCO2ew39z4So49rvj/EPBPHlmjK1bhHlSQC6nZnU3MoeGDH+DRbYo+30b0WB1kADNq7FKJuk1pI8R3Ns0TfVTlgiK0Hc6B5eRMXRpFig/fNWOAKDvy7ZjkkSQhZOU9hw4NQxysI/BA912iwHxWKg+2SBa1e3DKIR0V6BFbc45rY9xXeOXe4ZHLsXzRv+5P2LFbJx3Chz9jNXqWWjIBt7VmpmXXEJdWFiJQMPxf7++lTAesyP1A+XMlTivMGrCJYlgjtclPvcg8QW8/2ASG63LWR61qCYw0nfL4UESzSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4468.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39860400002)(136003)(396003)(346002)(4326008)(316002)(36756003)(26005)(5660300002)(956004)(8936002)(83380400001)(7416002)(66946007)(52116002)(2616005)(38350700002)(6512007)(6666004)(38100700002)(66556008)(66476007)(103116003)(921005)(8676002)(86362001)(6486002)(966005)(478600001)(6506007)(2906002)(186003)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1VFxJY7qV94LvuPhwE1ZX0JkW/2eRLODHEUJiX3k6V5zknpZO0xT/bLvbf2w?=
 =?us-ascii?Q?0kdf4rtnRIV1MhyjaI2kRN6BVZcPPsQqEt8fqAOIE9S0nkE+ppEHIJMMwyg+?=
 =?us-ascii?Q?iE6oLDNfFE42hXq0C69GRR3jojD8c8OAWP6Ce5rQB+LVA7WfXa0CX75OW5PW?=
 =?us-ascii?Q?/e+1zfWlR5WWnklbfaIYL6b+L+27WzUk2rEEixXE0NBE3ZVA2bE9lLnNTTlx?=
 =?us-ascii?Q?SHTh4Qziz08/IRdM5BDFv7uoIPET2KJNtc6XShhuSF2ZX0neGrxSbuSNibCY?=
 =?us-ascii?Q?p1a+AtkwTLjvijw7DnCX1E4e5+5mqaOCgDhinwGINFoqLb+IPkXU+QAsYNv4?=
 =?us-ascii?Q?PmQki3CmBCuLNbwSdMjAy9wzEwXjnYJhOuek1l5E0Z4uqDKWgmzyt7vqldTh?=
 =?us-ascii?Q?j2gfpb8ZV64TZzrdaU81iKJ2naxaS19eoIeV79Be0Eqka4HL3XMLlXr2D4WQ?=
 =?us-ascii?Q?CgNxdYxheV1mLYNLB04DRQNCtFc5edL4iEKK/3VtDuW0addYg5CSkPSGiAPl?=
 =?us-ascii?Q?pZAvdjheP6bX0AQZV7OgnMNAM31wnqe1MQRhDbnL54rqfyaObUM+kTWNGP41?=
 =?us-ascii?Q?+ToPt1XLwcQJieyPSgKgdy6dMmGKvZgDWQn/QOmewqexR4mzTqVdusH+GNMy?=
 =?us-ascii?Q?NEzCprktVJ3UKgkFa0NAt5SbLs9hhua0iQaDbitaDRtzIrvxoK68PpQNDx3p?=
 =?us-ascii?Q?PW1xw40lx5d0/go37s66RCwEBaSoriBdA2uhrOLU/5D5KN6NmbYB64wYhwda?=
 =?us-ascii?Q?ka5oLtxepXHJkYpGRMNtM7/3kNBIt9gtN7AefHtuwQnCYR2+2T5hOfQ1kUBV?=
 =?us-ascii?Q?CcSnbpPe13qiDdKVbCETpFcfiMjgtiThXFEFLBK6eZNJHIim6W42TNJEGvek?=
 =?us-ascii?Q?NFFwbHiIvhLo9SHxON5vCHteE0tD8lfk5q7PZ604CSjjnjoyU6FHwZX/iQyu?=
 =?us-ascii?Q?bRlJZBMsMdw5YQ85OOjYYQ1pGA1i3DuIAljOTPLUY6U3TIAtRllHZWxbRfcw?=
 =?us-ascii?Q?kCfBkt/7VDNLY6lYxBqfOSfzjQvxVW8evqOkjoSWB1EbZMFXFFAC+NtmBZEU?=
 =?us-ascii?Q?uVQeHcjzGncYphCVc+mnOzjaYE2eUfosXaxU4NbXwP3molgMKJk1FIiPnwYY?=
 =?us-ascii?Q?363wY3ByFIFrAMNN71fTziUdPK3mDftkUnUadtGEMlBiDqDo7OYJlHC3E6p1?=
 =?us-ascii?Q?sieYdqN7Qg6YsR70qU3S13mAaTK2/P4Tp7QwiSpmHCx/XdYY8segEplIGQ+u?=
 =?us-ascii?Q?YnvR7VIVZ+NZjaGvWX/pzpyK7R74hLZX1htojZrcMWby4nncmYOwzfX4iHVd?=
 =?us-ascii?Q?IjQcmcr9Yq0Ih8ozjywgVmAs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c302ddc-ccbe-4280-47cd-08d97916e127
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:35:42.4569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnWaEuVRVvhI98Q7Mem/RG4V8JOoaLgV1Efv+keeSR4fz5H1heeL5rYWPUMSvjdyn4SjYFZqiwMPsDd3ba2P6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5553
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160087
X-Proofpoint-GUID: tTwR4aXqdaV8JPmAMbPeMdzvJmGfK1jj
X-Proofpoint-ORIG-GUID: tTwR4aXqdaV8JPmAMbPeMdzvJmGfK1jj
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

Changes in v3:
 - Fixed build error [1], due to missing EXPORT_SYMBOL_GPL in patch-3

[1] https://patchwork.freedesktop.org/series/94696/#rev2

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
 lib/stackdepot.c                        | 46 +++++++++++++++++++++++++
 mm/kasan/report.c                       | 15 ++------
 mm/page_owner.c                         | 18 +++-------
 8 files changed, 67 insertions(+), 52 deletions(-)


base-commit: 70ced02f322fd5bde59e805e77b19c811950d165
-- 
2.30.2

