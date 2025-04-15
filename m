Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC6A89272
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 05:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E00410E32C;
	Tue, 15 Apr 2025 03:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="N/MwBqoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011006.outbound.protection.outlook.com [52.101.129.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9DD10E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 03:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4S0WhGOA5EyjR3T9GUwWYr0d+7AnZGrUHuV6yz2sFoLcP4RQLNEOtup9KAddb2r6/ZyUUmsaBbOO95C1HeogOHm4ELdHGAsuoL3Evnod5DR0G7Z93UaJZXd6RBMC7D1LVR8KVy6DSQ00sJQupY1aOtaiHSE2qoBiNcWpj2QzsuF+uyT4FHicRpzCJ3ioIs3DQDVCq9PmxezBa02AXWS7kWq9+MMiQnedDQeXyugs2bbMsE2OOQEDwI+SmvuRP1/nbn/BadPCFRRvBtlKhJqbESZb4NRvliYqeW3LHuDZ8GWkPpIaBweqigGMB3IAdKQSrm2z/kXLsBdw3ghjBfaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V7KKi28MOpTVSvByMmh6iFiFKYZuQ0BNeepJoaEBX0=;
 b=kC0S2emV0N4/zCNVJjOIJDzsH0ICf3fzZkjn3RqQ2VIiu0wAEneYU2Q8tyZ/66WmjJucei0InMgGDaseJMZW3t9fTuVlHjgkDS2yeo4hfR/FhnY9tIDcOTfCw2USW7//WvNl+z98ALTrccvpDiEJ3kydQcBr50YBxv1pt9oTsWMjTbBFTuC9dhWhSCiLFkO20rfLl/HgKuGTgsm+EtQyQ8tUO7s3LssKs3kRghZTGRlGCAl9ivD7LT4Ch0Z2Z1/IG5qLjjow7njPIk06FZI2GEOBXMKV0kNTjVn0EZPXCucZ25WEDdNTSQ3G1oNz6Hwj6FwUZi+CSgRp4TcdELa2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V7KKi28MOpTVSvByMmh6iFiFKYZuQ0BNeepJoaEBX0=;
 b=N/MwBqoYOt02Zy3g+8D0bTG578ZqT0PbvwhWWuSfASgOPDEssPcCIpXP7aD3z/f5uqxZZ06XXSYtZX3fYS9Okq2/rvJdXxX01MmyY6BJ76TFabcxUAJ7NWpTSzgJ/7S0lbROFOsUWfgRnUTNXv3XM5HjSFJiBmFbwXk5fKQieJP+80DFeKzNYsUiW3KdOhmhFA38MQVB1KUrjhUJ17ULs4uUrY+PHvnGWv6AC2m1+MHnTXe8e+Hz6cD21JbogoTwh1bQiM1y1ggDN67nyIr92tR1qRSKrocrY7+Gpjo/9nuZay+rGhJSYLaZEozs87II++QCogMeuHPK1aGSotSUZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB4984.apcprd06.prod.outlook.com (2603:1096:400:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 03:16:21 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 03:16:20 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 0/2] Fix udmabuf vmap error
Date: Tue, 15 Apr 2025 11:15:45 +0800
Message-ID: <20250415031548.2007942-1-link@vivo.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 439bc05c-cfac-4775-df6f-08dd7bcbe45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wl3Ico/X2Po1l8g9ztAZ3YkLAubkbSwYpNfja/8dAIT55DEftqTuLEN21+6s?=
 =?us-ascii?Q?fVlojKTkF4Fdm3IR+FsWsreDkjY6AtegJknsE5eP5veo/8Szoyptifs4JIhr?=
 =?us-ascii?Q?5YJM7eHxZzaHGn8kY2D56En1RBZzplwWuTNyiZsvGuN9y5NXogC1ov7hGaa8?=
 =?us-ascii?Q?XZXLU/2i8o8W5pFzhbRII/q5vXWOYQ3nDhXiL0HA+tnYMeQbOyI2c87BO+NH?=
 =?us-ascii?Q?ArDvh9076zZo9Nhq6GJgnbJSqzRBtQE08EOqlhQ7Uu0S5fIgjcpCH0pLh+nE?=
 =?us-ascii?Q?P4qkyyFPP8Y4tWdeXV0rq+kELvjmBC4bVRg5i8PJ9LXeLMOiYPbaEGI3VvrO?=
 =?us-ascii?Q?23rlGAz9xCTOAtt0HkSPhVZUu+65MZGBlwzfudjbQ0bcHKx/OvShJd+I8k49?=
 =?us-ascii?Q?Qw4QwDbNcI7C1IDKJFTdEyiTroQs3ArPp2K/YL2zsYMgnEa4pFq4q1amdcW8?=
 =?us-ascii?Q?bNDThI39GLh4U/NT2W8BkKdNvKeijRVqVZkreCnmWUdOZfu/5Op887lLDoat?=
 =?us-ascii?Q?1W/aykSS4SRbyV045ES1rtTxQ/DujEQrrPpB3JX0MJqOnHcfDSFS7hGBHs4P?=
 =?us-ascii?Q?OMvUCIv4/xNEuLObPTtbLtpV5GdFeFT0RREq+oPoSakAM0gDt0UMHFmlHL2a?=
 =?us-ascii?Q?oV3VlsSk7diSdtOWddxDzFpbkl5Fs/puGYXrSfcHys3qAEXzkO6zunQjBogo?=
 =?us-ascii?Q?gnF2Zm4zg33171Q+DFZobfVrMBW0gHw+oaA0II/pClPeaUjFmdkunGtMRiOL?=
 =?us-ascii?Q?6QS+hBxPRHhXwZrgeuqSnAT6OKQ0Mn+9b9uQpIEqYaZrKhPXJsyYG22q3iDy?=
 =?us-ascii?Q?7vrW+pPANX4muAlgcvmycf0jzamCQy6MY/2LOGCKYb8I2TXsCbTbktb7ZkwV?=
 =?us-ascii?Q?68Xd6xNooTqyM/5s41k+pDG5lInTPxXcRDaSSfry3uwLtGpnMhkEc2XUIKhG?=
 =?us-ascii?Q?FbyfX/9GGqHs30y97Ug8bfADOiQW0LPDUuo6vF+gW/vDie0tXHC5N1hYSe0U?=
 =?us-ascii?Q?Uhp6IHqa5LIVw5PcJ4D6nE1DH+t7yQ0BGjPEDZVyHGaozmFSoK/7WtcxaRPF?=
 =?us-ascii?Q?eZJDfiMCvXBgHmMzjT0mOyMC7S2nGxHES0WXNusL4Z/V8KENBw0omaqwx/LW?=
 =?us-ascii?Q?4Os/WNkNtbX6mEiEHhjqkDg4Zp1TNTK9JN2RQUTYyyJy3gcW4BWAA7J28+Iv?=
 =?us-ascii?Q?70LEHeBHn4WXVvcB503RRUt6d4Ub/VmuBa+tYgPusjIQT43FI2SI7fRpJN2Z?=
 =?us-ascii?Q?2yhnaHcsl6QFmy/emYE5BKtLPqCcItJ7b1SmjUGQgNk32prfO0L99t1nX1Vp?=
 =?us-ascii?Q?rYbBjmFiVKgixzgHC/9CKsTKH2hXRdIye2ZYOdP1cinon14R1Yn1e26gbB4g?=
 =?us-ascii?Q?5i+hYf9/ZmVtCBeI3C4R+7REXfO8JF3Z05pPezmc52z8k7EI/+zE2hHOwf0K?=
 =?us-ascii?Q?4PgtwaYUH9YaRliS9c4q8IzXUQbwYA3C5ERQnrtESemdolYhw9LJ6rx06xsM?=
 =?us-ascii?Q?/eipt0eSt1BmYQw+bhZyglL3BvC8X3vtXGKp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j9bX89fJpK4hZJmuEaRDNCPcHjrdSj80AqwXmatBRnqAoY8mvpcyB2W8Go+N?=
 =?us-ascii?Q?aovxZCEKICcECwwo0CW+4FyXSyrY9jpkssYSohdbb0TL0pLF3+6TG6+kLLoT?=
 =?us-ascii?Q?dT41iygCG2MdkDHy7kq/5m0aKY5US+vLg2uTudvq2wHLV3ch8kHkHzUOMKPs?=
 =?us-ascii?Q?0XfKvramX54aFmKfNX4woMvVHcuKEFVfwOXTJnye3bzuEyvnrcG+4AkncGEN?=
 =?us-ascii?Q?Y7pRkhvp0UPUJuO1ujeA0GSaNLh5oxE1JznPmTFC6DFCF/yamqY5Jn54XAXg?=
 =?us-ascii?Q?8HBfjoxci4UMIVijlVSjOt0pxxWXUIzxhk0Czw1Ve8UAwrS8u0AlDVGRpWeR?=
 =?us-ascii?Q?qkPOu0ZGiwikEI8Shb1jbWB6cVcoqMJ//ylYbJNQQANeDOMD2m5L7UkS+T4+?=
 =?us-ascii?Q?cc+IT4B2buCvRtgADyjV0fSHK+jM2MtTZe1bwLG3ZBXHaFZMZLPJfWTe50XU?=
 =?us-ascii?Q?IbPfmIR4NFhAkrr2K27Tflnbqga7lpo9pONeYrz7nfXFqP3MeC497iNS0pVV?=
 =?us-ascii?Q?1QqP83PgO09nlHwH/YkpdtZyjc/Y8c3szRWP0kJr/sTV3MRcVli5ni4z2ejD?=
 =?us-ascii?Q?FjXhM6o1i83dM20HBBPYEH0q5BNxjp+j6vhTt439ETU0ALAKJSebOyBAr+44?=
 =?us-ascii?Q?U4clPU1/6XXCkgRaHKuSyPz6fr975VnGePbzzaURnmVtwhpw2LXmXzLBMVX/?=
 =?us-ascii?Q?fyUi27jdDL/sqYRfMZdsHSk0xkIQSDfUe7PmlbxdPatGj43y+8q+b4g+N4JG?=
 =?us-ascii?Q?RgQJTxrLFegBekrfrFu5gdfKnYiC3dVe7eM8vvWqbeSPDnHU4DH5QssO2HE7?=
 =?us-ascii?Q?oXp3R864KdwqKQQny2ZXtsUcU0cW1a2nqyZ4H/yXGF3V8+qi8WmaPhvssrPQ?=
 =?us-ascii?Q?+oPOi/9esvJ2DtD3pXGXL4h451RN0wE5caIxIVJM5JWSvF4GIck7ASbGgkN9?=
 =?us-ascii?Q?UppNxjBMcgrrcJMjAIK7LUuvraBifa3zj7DRsqRiVlcNJGauZbnwhh/0wbT7?=
 =?us-ascii?Q?/3UtelkeOe1C1xjbZPLFunabavWCP4oEgGnya9OYpjt3BdOEK3IV7ZZCXtm9?=
 =?us-ascii?Q?Ey9plsl4Ovs9XBRNSF1j5n4vPVGJJ3hhGpUXyjR1PVJBjh0FyYjakHq43awl?=
 =?us-ascii?Q?zCNR3LuvmrqYLKEvAzllfGgdt1R4gpzWG8Dy7xFi+Pjc4xR8tTKfBCIhP/TY?=
 =?us-ascii?Q?eyGDI1eHT6Mjp5X+V4egAJwk7I5OVf6+/rgwqq26/Yp5Oib0tztrghU7KuhT?=
 =?us-ascii?Q?/nqsBhrLe7WF97EAdunsKoPy2L5LS9yw9itg9TsukszUUmnvXUWHCEvwFUPV?=
 =?us-ascii?Q?9xLsp1n8f5wyRn2CIa/vgwzvcubm1yM7yMnsT14PPZjutM3X/xQQ7+nQnxSq?=
 =?us-ascii?Q?Wiv7qABbIu9AciECZ393L7SzJCmOwuaIqIPEPkUpo9RLcWo4qlJzpEI3vp0r?=
 =?us-ascii?Q?GrW2LanC+EPGGbFJPBlEpYhs4mUL1k+hSZOvNyh81+HCY+nkZpCDLZVq7OMH?=
 =?us-ascii?Q?2s256xtC3u/g2CbTUY0JNC6+3OjPGzD8hlCyEX0aqwmh4z9lwMHWg9EJ49zC?=
 =?us-ascii?Q?cbr1yqrppk5K7uSEzZGA35cXHV/B6KgsrRCgbonl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439bc05c-cfac-4775-df6f-08dd7bcbe45c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 03:16:19.8683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtgBzn2MlmfFceCX6gb2ZgGAOEs/SHSEEXrPoc9PN7K4eJOomGcGQTMQZLFJvVJ4TI5CBOEVfktaCrZq5zOntg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4984
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

In [1] Bingbu report an error that vmap_udmabuf invoke failed due to use
vmap_pfn and blocked by !pfn_valid.

Due to misunderstand it, I change vmap_pfn check of !pfn_valid to
pfn_valid, then send [2], then Christoph point that:
  vmap_pfn is entirely for memory not backed by pages or folios,
  i.e. PCIe BARs and similar memory.  This must not be mixed with proper
  folio backed memory.

So, I given a misuse of vmap_pfn. But to fix vmap_udmabuf, and consider
HVO effect, I offer a RFC patchset [3], which simple copy vmap_pfn to
vmap_udmabuf, other implement folio range based vmap.

But in [3], Muchun point that I misunderstand HVO, which do not
released any page struct pointer in vmemmap, only change this VA's PTE
point to hugetlb's **HEAD** page frame, and release remainned **tail** page
frame. So any page struct pointer do exist, and folio_page, folio_pfn or
other api still can work.

By this, we can fix this error simpliy:
 Patch 1 revert this vmap_pfn misuse patch.
 Patch 2 fix missed offset page set.

[1] https://lore.kernel.org/all/9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com/
[2] https://lore.kernel.org/all/20250312061513.1126496-1-link@vivo.com/
[3] https://lore.kernel.org/all/20250327092922.536-1-link@vivo.com/

Huan Yang (2):
  Revert "udmabuf: fix vmap_udmabuf error page set"
  udmabuf: fix vmap missed offset page

 drivers/dma-buf/Kconfig   |  1 -
 drivers/dma-buf/udmabuf.c | 23 ++++++++---------------
 2 files changed, 8 insertions(+), 16 deletions(-)


base-commit: b425262c07a6a643ebeed91046e161e20b944164
--
2.48.1

