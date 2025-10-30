Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACFCC21AAD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5C310E326;
	Thu, 30 Oct 2025 18:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lX1PGOHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E01510E0ED;
 Thu, 30 Oct 2025 18:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ga71JtwhkGN61j2+k2EVjFbUAsKSxz0kZCA+9ZRjOhgZhPn/aMcMj7oYAEvaj0BXsrO/pGIh0nzH+PZulbuUsb0ejFcHByvAfQ5nHgoZDYw+X+s+JIgoZDFfep4Q6SY0Oe3jb0Am4U3B0cW33t56Adc665KDp8LrfiEDsbbVxgPTFyXFBZ9iwR+7JhPKTElTQci4JTwjrIsm2+TEH237ohwMBJXMC1VJREmesRb9cYCdkgAqCrMbHZflNEaGRziDMoEB2Th5cKojPTU+cWEiEm8GpyDZKugAJkk29DVLgI5XBKeA8npKjoH9qI/bgpiUh6BMJzU3uJ2PZa3FY9wVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qydi9IrCfjOBSImRAzHWJPpyRoK+OmBCEhbEDrgH/0E=;
 b=hPNTKeYkUdxG5OSfHrRUv7Y0gebKfdyqPYYaCPAb3AhwS8K/zwjGyNBw6jSgeDuFq3LfDzM/3qZGCErRmnrUkbRmbFBlrZO6OEt/q5xH4g26yoIizWQLO13i6aumueLy3imKaG5ZZDfBRAb5twWtABZmOVNGCG5rKybFwsKy4v+EF+MGfkR3Wss5ZhTSCB7VR+XdIDUkGBhjZ7rduLGXLkk5dEf3pYBBBepNnEnU3OxB3GPOZpo68ClxpR4ZxYm8AbEceWn7rwibR1wHnd0TVTgfV44WgB9JRaWMV7OyxAub3j1zfXJr4WJKyuKIinffB5RhixT7pzUUQKs7sNEo9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qydi9IrCfjOBSImRAzHWJPpyRoK+OmBCEhbEDrgH/0E=;
 b=lX1PGOHlAu3qUcvPmLzntx33VzhCkeXRY1hd7rCauGkXodsiD4sQLZ3zbSmmV6nAKoXxVeu28esX5Oxdv+YBfM0hGLfixZR4vPdUMTxYmYXNdYAyJ9l8LpCsfOKpg4U6AAhlJ3guaQl6TeFm8q+/DihOujugAuPhf+Exn4X2UoyVx0OHoNhe/SW78DIUpVtVUUncGAA/HX8AIo7huS58VBlHKnO1JadDGBvHjJldoseob6SBd5SGwwva7ToSurQoiCBC+FxC7FGp++BnvZW1adRKo4DLZKizlG0E6oXsbs6VEhbuf+UKOqbi/pOQ52CXEld5pfFNcwqYbDdJp3XKEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 18:07:12 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 18:07:12 +0000
From: James Jones <jajones@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH v2 0/2] drm/nouveau: Advertise correct modifiers on GB20x
Date: Thu, 30 Oct 2025 11:11:51 -0700
Message-ID: <20251030181153.1208-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:a03:54::30) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 008f1971-fb3b-4a92-0a75-08de17df2636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UjBLR4sMUIK1qUJSlBs5UqquRE0TfjEo6AOMgHZCl8D35kwZOm+tmIEM20/o?=
 =?us-ascii?Q?CofA0bcj5BQLpLZJgnC3I0vHHWsOQQ4qRJVwOzbPl6YQY1LhLBOv3Y6basAy?=
 =?us-ascii?Q?+LOpxjsPVX9TSNyPNMHY3ZthZngu38HpVDMTP0VOoBLLqFzGbeGUMZ7weIzj?=
 =?us-ascii?Q?Cj1VjwGK2xAgYtd3F5ICtXTRhgUeSa5yrAPvBM5yOB/+Cm20witPV6hvICAJ?=
 =?us-ascii?Q?m6+wDu6mFhj95HlWwtxkXAMqg8WQConwDQ9rRsfmrz5uiF/DMgWyJ7Q+6jdl?=
 =?us-ascii?Q?8buquT43Osses1pbOQ4McShBwXNe4gLRfUWBMelt83+1vAibj7c9SnbkGp9p?=
 =?us-ascii?Q?kxYIgwf+BMLtviKwGnJj57/JpDLg1OA0cai87n8knNnmoCjTqZnnyO1OMDj1?=
 =?us-ascii?Q?109hCdbIfoGqOAT2RGc/lFXZei2IH3zpFBKkqtTPC0tkBTOsqC7uRXzqhjcF?=
 =?us-ascii?Q?bk5RuFNiou22oZYzTkY84iNyLTulqgsSgHTvAjOWXc6x9CgFrBlittttqWOT?=
 =?us-ascii?Q?fhQTasoAxnh8yvr2sCGyE2vMQikoYAd9eOc9Nkf+HdVRkTVG/aLyUlSEtNnN?=
 =?us-ascii?Q?cT650Jf/x15N1xH6JNAiprYd9DkivH/nBuE+sjKvn5vTbejsQrtuDdPyVNAS?=
 =?us-ascii?Q?EjrkYt70u8xyyNnFIOaFGZTc2QXoHyANeadsxlFCpjE0vFrKrqKXZck/k9y+?=
 =?us-ascii?Q?DDX+ctgwyzdcfeUhW8I5ICVfJiVnPmjs0Z2v8JHTUO8vNXg2qXwws/YOjh2K?=
 =?us-ascii?Q?XBVH4FR0Z8tzbG3wwrGvZc4Z1ommA7LH/LdWf2SPHONK6Qr1YKaDVVWFCvng?=
 =?us-ascii?Q?/7sWudBA8mWvGVzjcs6UmBiO4oPH7dRePJTAT4bM2B5uRdSWhR1/Qd6d+n4/?=
 =?us-ascii?Q?bfpHYiAxrdJ0FC7WAyOqJx/nSdOaqDMj5exM3QfLiY/3BQwV/b7ybOrmcs0a?=
 =?us-ascii?Q?oNa4STzRN0LbUP+2xxb0RDoy+PP+6mEX0CcFL9XCsYzuhpTSDLQEgjBkkxo1?=
 =?us-ascii?Q?sWpfGTcDrQFCBuz1dInOG1ttUNHWZPMqbmO8eWxfrTlqyvw+bArkRO5oR3qt?=
 =?us-ascii?Q?KM2V6iavIGQP4+TcETvmPfOMxRpfgVAVdykWtDABrrdfQvdaUKggdUvkIG9F?=
 =?us-ascii?Q?It+bqEUVijYi7ZpNL4tVDnkNjSurH6NcqyqVUTuo8BQqwYIWENWy+IkG8kFa?=
 =?us-ascii?Q?z4BxQ2kIoSlmZ31pKT+jZlwqWB/l+JxZZNIJVxvuoY49f26Oe72eJqpa/hUO?=
 =?us-ascii?Q?axSlNhcljYvzQMSVUl3pFfmrMqXEakhyoMXV74M7vnCXhpW7+0CONSteRRFj?=
 =?us-ascii?Q?QQXFdz0vofBPEvVGbhPmu+X8wholLYf6BQbEY55/spN4fBUA7UOZvisENQPU?=
 =?us-ascii?Q?2SXeqqcels+1YlOWAHQmJ0HB7lz2fcoam/n0Luxo2EJiCwC9PstCQA8vjPtZ?=
 =?us-ascii?Q?tWzIzbYqvEic6sV9pA9wL9l1/ZDX9gwKXUAmCQLFao+KJ66N69e8tQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sn6Y4M0ZfX39QlKGOOqfhORXu3P0oNVTDTSp4/SZog2vtsTIkJa/dp9zsnUN?=
 =?us-ascii?Q?GkE1cPx+5UOCQYADPdpGl87r5g2kVRHyPSp7/EjM68a82g8S+n13SO3hXnBz?=
 =?us-ascii?Q?Wj1V+XVymJ5OP1T1deFCxtYNOJXiJg7DqMbtzQKYZW0YIh1vkUYs3TGTpWKQ?=
 =?us-ascii?Q?FdZ13wEKNSY/7+a7gppeOvdBFo9NUJwxhJ8Z+xzRUAwYVarBbdEXjJRwaV8T?=
 =?us-ascii?Q?PeyXGTACpUs4blAZGUOi41OVBiBaIR0ICKgXwGJiN+Omag/vdw5lR5HRqLuK?=
 =?us-ascii?Q?YchbV0gep+qeuitCUvxMSZ3tta+apwk/hDGnoZFY2ZtSN6JwRfop3s0IlYc5?=
 =?us-ascii?Q?okYI33yxeAZ3XsfMJw461kCtDo9BtNlYn4v+fzNljJ/MDGV3HIF6VAVgMDg+?=
 =?us-ascii?Q?h0NKaSCarNW+Wsc4YUitkLk+BC1fhpscpP80OeLZy+kJOp5gwtiXflh6lzpM?=
 =?us-ascii?Q?uHRgLbqRtduY2PQmaZXzGAixfydfVseVuTc2zsfrjVRn+7Nix6H08oO+UsRm?=
 =?us-ascii?Q?vrSnrNG/W3R+do4RjsvbWFFga2V6CfWLQT5doC/h3dBtJ1ahaoode84G5vrT?=
 =?us-ascii?Q?9aoQIpwBQ0K/8gz3enSKWrwqKBAgOstOTAQNm/hg37s61OChRq4tA4cTe5uI?=
 =?us-ascii?Q?hTJ/YPftMK0bwsmnRemtktHbAmVyAuiDGkX4Np28hRy+2+FLD0iSmwBB04Mt?=
 =?us-ascii?Q?dtMod4MMx0iBkTQmWrAOWbHCdgHcGt578UCSqeoHqdxkBE7VvT1eT0nPV6Wk?=
 =?us-ascii?Q?pnrcc4jh7F5tbnWQ/DkReUqZhfKwg332XKuCSpB0jsY3PUTsq5VdXIV55jYW?=
 =?us-ascii?Q?9w1ZMyHRw6blKVS3RrtAy5/trzEG+0iN/LryEkBDocmjJG9lUrs8c8jdy13/?=
 =?us-ascii?Q?HSe03fSSFboMtXQBGknmQnPugrtrzAEr8G5x9Cc1uf4TIOMdxVik48yOnbSz?=
 =?us-ascii?Q?qE3wJRQvK75xaP8Xwztk8fLOrSr610VznM8sWGl5/9QoCqwC7MblwN7NsjV+?=
 =?us-ascii?Q?Y2ghOqOGqFUoW17aKOyUFeyIVOW44OHrQlUKkJUiY5qeX6TKaTwePnNedc5e?=
 =?us-ascii?Q?dS7JCkx0qb1sx0eg9EffOAd7QTgF4eZLpBauJnarVE0eABWpk+KaIavKgNol?=
 =?us-ascii?Q?OpZ7PnTIdgij3WKQMNMDAiInUS4NSI7cPdGF//1zJyO8CYGRZ8UHx/gb2Idq?=
 =?us-ascii?Q?9TemB45hUZmw8eKPnnLaR4foYVNBfPjxJFPh0DbD+W0o/+sJmjoVNxHuTJoq?=
 =?us-ascii?Q?RM5aFPDSqXobyh+QonzjfnlMWSBPYBc6JTGeybEKLb4Sg+o3U3qfFxcJ3qom?=
 =?us-ascii?Q?E8anTlbS3zFEQsQt9+wS7r2uxyXA98loVD6iXDPPhl7QvgvYzV7fgMTm2UXa?=
 =?us-ascii?Q?jEQk2zYEEZa+cxiUwB88fXqG8sJ6o9sgG/wo8NF4wkRkaOa336tFLvWaYPig?=
 =?us-ascii?Q?HjDMm9P64hb0iGVSSCutuOTaRwb/1qQj+L94MT3yOL5bJaL5kThsMmbMF0OY?=
 =?us-ascii?Q?upmp+Rg+3xPP5jX7qORS8vTQtF2sf2qJYc+fZZ7TJWujr3CIR6SSfYjHicEX?=
 =?us-ascii?Q?OOze4UlmsbtM4QBZPmt39Ix6H9uSaXPzfcORLcxv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008f1971-fb3b-4a92-0a75-08de17df2636
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 18:07:12.0783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLW4KcWhEr8/+0VxW/zRMQn0P9kOomSvAemtfwq/PvPVNAHpVxI911/MdDtCj0c7OaNxETftCHi+kJBj+o3S6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479
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

This series adds new format modifiers for 8 and 16-bit formats on GB20x
GPUs, preventing them from mistakenly sharing block-linear surfaces
using these formats with prior GPUs that use a different layout.

There are a few ways the parameteric format modifier definition
could have been altered to handle the new layouts:

-The GOB Height and Page Kind field has a reserved value that could
 have been used. However, the GOB height and page kind enums did
 not change relative to prior chips, so this is sort of a lie.
 However, this is the least-invasive change.

-An entirely new field could have been added. This seems
 inappropriate given the presence of an existing appropriate field.
 The advantage here is it avoids splitting the sector layout field
 across two bitfields.

The chosen approach is the logically consistent one, but has the
downside of being the most complex, and that it causes the
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its 's'
parameter twice. However, utilizing simple helper functions in
client code when accessing the parameteric format modifier fields
easily addresses the complexity, and I have audited the relevant code
and do not believe the double evaluation should cause any problems in
practice.

Tested on GB20x and TU10x cards using the following:

-kmscube w/NVK+Zink built with these patches applied:

   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36336

 with various manually specified formats
 and both manually specified and automatically
 selected modifiers.

-drmfmtmods, a tiny test program that lists modifiers:

   https://github.com/cubanismo/drmfmtmods

Changes in v2:

-Added "Fixes: 6cc6e08d4542" line since this can be considered a bug
 fix for the initial blackwell KMS support in nouveau.

-Dropped the second patch from the v1 series as it has been merged.

Changes since the RFC version here:

  https://lore.kernel.org/nouveau/20250703223658.1457-1-jajones@nvidia.com/

-Dropped the helper macros & static inlines in
 drm_fourcc.h as requested by Faith Ekstrand,
 who noted these aren't helpful for UMD code,
 which is all written in rust now. I may re-
 introduce some of these in a subsequent series,
 but we both agreed we do not want to delay
 progress on the modifiers themselves while we
 debate the details of those cometic details.

-Reserved an extra bit for future sector
 layouts.

-Fixed handling of linear modifiers on GB20x
 and NV5x/G8x/G9x/GT2xx chips.

James Jones (2):
  drm: define NVIDIA DRM format modifiers for GB20x
  drm/nouveau: Advertise correct modifiers on GB20x

 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 24 +++++++++++++--
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 +++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h               | 25 ++++++++++------
 5 files changed, 75 insertions(+), 12 deletions(-)

-- 
2.50.1

