Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09612B1DA00
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 16:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC62610E86F;
	Thu,  7 Aug 2025 14:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="A/8YC/79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013025.outbound.protection.outlook.com
 [40.107.44.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7301510E86F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 14:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwY3qS+uco5nxTyeQ6YEb0mqI9pL1+MriY5U7djbt5054UinChiT8bZTnqmO2uO2+TUYHCc9dkJ7F5wZY5fI40xf39oPGqTlLAZmglcy3WsTI5OT1uZD1xI8W2Xu0vmWJblaJ42zI9lUfMLHU9th4pB5eArMr+RTZw0sliXq+/cATVFo8OTqhK+463fuL6qG/atp6Tf2i8We8IzxKr65NGAaMwiGB/gAcDOszeDVpjOktU82vHU9UsR8oLcUd/2jrksXfXzpNBUPPGqxipqjAUTPgQkIwPY7iTNbdzHT55sZeXvR27VbBD2qr5NJt52DtZbXTEMbR8S+n/eNrs0pOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXfXBrGf+dzKCn/Y7Tbp1xWbxmV0JfC9Q9T1xrbkcbQ=;
 b=Ipf0jtZ/zNzL9OFhdS3lJ/Pl6d3NO6ORF+Pq9rVujLpfvNAk4i6aDhzd0qHvBWMntUidPw/1vaKgiT9n6prgC8QSFigu5W4ojn9mB4qLASFqHPL9Bn6N7eAE9723VuSENz0axWZOD9lCEGPTZRKUeTxrYo/UDpgdsGpAcy4DLnzT4sMgK6PQdxeoek8D0Xa0CgKF35tgRZWB+m4vqEr/h5R9qyO2Kge+orMn/iG7mWR6kaQPUs16fmAsNiMQeS0fq4mt8xLTedlZj0nH7R7DvFZS+N3m0+l5PDb4jJja5zPbGxal5vUGPBx1/skg4E8U/qd7ENsjud/8oJk1+UmaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXfXBrGf+dzKCn/Y7Tbp1xWbxmV0JfC9Q9T1xrbkcbQ=;
 b=A/8YC/79h2MTS/WqICo/fPR2H9QBxK/QJXc2TyE9p3MKpuP35sFqxwWhHLFP9jr1UW03pmvNPysaPEcCjTzMVrYSUsBMfVwKM8DVERUFKvdSoDBOJXfROFhH0U5JAXjc1ABmr+5d5WC8H4xOY4lcFuXYACfch+47xd+e9LsH2NTdlepfrwFvoJrozss+Vd336T3zXhqZrfvvzupZ6MaXs9p0prQICRWpHci01YXGw7kl5i9928XfbIYyK5OnN7D3bJ316envOa+BR2SNQr8aJePIjwv3Nz8xRpNuS89FkeDbJyOGY6Oeox6RFavRsIB/WjG0NJITY27WQQjzdPaJFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB7175.apcprd06.prod.outlook.com (2603:1096:101:22a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.14; Thu, 7 Aug 2025 14:39:31 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 14:39:31 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: willy@infradead.org
Subject: [PATCH v2 0/2] drm: remove redundant __GFP_NOWARN
Date: Thu,  7 Aug 2025 22:39:09 +0800
Message-Id: <20250807143919.575439-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fd510e-1d89-480e-e563-08ddd5c0383e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aqUyHgSt0nV68QJ0lo2N4gfWtCvAoqS3uc9uREOpmc3e70Y9JZr2tt4lBgWx?=
 =?us-ascii?Q?U4XcG8lrYGPsYwNWJo0v+0o1JTB+pBLlnRqmld4L1csNeDTcjQ0ykAqB1xmk?=
 =?us-ascii?Q?HVnjUnbAFdSmdMFoSbNmsRwFYPY5PVkagbvjf4QVQfHreYDc62DkJ+9MjGOP?=
 =?us-ascii?Q?5BXPNv7jG/u7DP79DM/+4fdCsdnppCjZrCT48bqwZN9BGDuMWvLNxMHQEvAp?=
 =?us-ascii?Q?H895zyiZQD49DNpLow9d5jDbcE5XxzlbzDqI6+ItjXisIMxHC2zmEnIXb381?=
 =?us-ascii?Q?xHKlIajtOKLFmB//quszvyxOjnKe+J4AriZjJ0R+vbl5nKpzSLFctd/kpz9U?=
 =?us-ascii?Q?6nZ3r0HYQs+3CIfBV8XYxmLVoym/J1vNZr2ht2URFZtab4reGwSX4SScCz8t?=
 =?us-ascii?Q?rZYVg/97mbr8by58koqjD6SOMKPSBuSL/L7I/izEmRhsfTm3Zh9VlTORAQuE?=
 =?us-ascii?Q?94DYml9Foy0F5Dz/Of6FT99Ys/gBcATBdomCH4RDx6Qeh6Pl5rlzTj/W/mFP?=
 =?us-ascii?Q?GavrGIROpZ91elOpuABs9e+gZCqVIUVNk+ceMRFuHe/MmkVNgcktc/9ZsZFg?=
 =?us-ascii?Q?uwjwqT2IRU6guE83siUWVzHOl2748dFzamOdE1j6VJwlXyCcB76+5JmGwWQi?=
 =?us-ascii?Q?luVUPGTa8RPYt7RyJFMzXTG1hOyDV3qVrqTL5FZjgZTGlp4VEx2rR+yTFQw9?=
 =?us-ascii?Q?LGDV08v+sdw6jcgwUR81B4zUWm2CUKrAFAFowRAlCv57nKQvDL8NON/hxNd7?=
 =?us-ascii?Q?2+ICR0/APxYUTT9RU5cCOFwBKLKMiLCdDhqybVUS5fnxDs7umloPg2YwXCWk?=
 =?us-ascii?Q?oewkIBAO/H+WwBG3vyH7GwGowIRETfTzVOLf2JbVy3F3NGrKri2dCDGEiqFN?=
 =?us-ascii?Q?WFBv3icO0gYi757TNNbPFKS16UAI4pEgyt9sJ9fmRPky7jQofX7N6rE5F4qO?=
 =?us-ascii?Q?RvXUN2d0j97JfraCjG2gkUPWXwXGWHkpCR/KoqVW3ZAVmBa4YjuoZKeV2xq4?=
 =?us-ascii?Q?9UYdTMeYBmdg59xmk5sqgIxdd/UEwctk5C+L04IF3FLnxq2iHp35y8w7v7j7?=
 =?us-ascii?Q?uXbY1j2jvxETzEPcCVyP7/6GOyNNKdhsy7OL81a3YHXpuLUf3roccZxyVr2E?=
 =?us-ascii?Q?Pi79sg1u9cNTv5ADLZfsJ3MiM+IMo/FMlgUDGl6L2/L2+AsWIiDv/m8x6ROs?=
 =?us-ascii?Q?d0jMMJ8bdkEcBHBCji0Qw+R/xWQDsh/lDBbMNbmrHiRrid7IULEEpVXkcOhc?=
 =?us-ascii?Q?RgoIPn0Ya+2YUDw4dEbV7uzB0sl/W6JlJk4hy/k/GRVwNBBUu3uUUSVxtQzC?=
 =?us-ascii?Q?qiW92jbzP/dPLt3VV5EXOvI6LUbI1JM3HUqCWFoh7czpC7SKIElKUyw34TEx?=
 =?us-ascii?Q?R8kBg0tNOmzetecXlRGfKnKKGQE6XiXuhAAJFxJa/jnS2DrpnPLfqsYCOaXf?=
 =?us-ascii?Q?bvHyHyMrXUTZ3CaYAl+CsYnOWNCmLN/jHyv5HQL44cQsylArOPi5UvotyMq9?=
 =?us-ascii?Q?yFECnIegh1CWN+0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Av2kbXVMsX3E1ww8xA0+Jf+WF+c8w01jKG58gk+NVbQY+3dXJvNtXWyN2zXb?=
 =?us-ascii?Q?jvSBc2uKvrQcVrkGAI/+p4YePOflSmciyXNrcbf5vPkzut7HAyirtx3toseV?=
 =?us-ascii?Q?DRsYEi80r7YNBPdJ79voGqgWeC8Lh81Ml1qch2Zehuvqi6QbcRW2scMjCE/a?=
 =?us-ascii?Q?QXh8TbU+Hhf3wKNKpi7glEBh/p60fHjW2RSXFWqtFG8lDoEauGbmMx/jHtNV?=
 =?us-ascii?Q?txmEDFqkSC97ZTmLQcpQxRHKitNgqDSDiQ3Hpx7pnFwu8HT7WzQ9L30ShbyA?=
 =?us-ascii?Q?AF3cduCULBelLGQQNC/g3sg8WjLHKRwDBzzT8cXECqaUU2Ignt/F7SsTTXfo?=
 =?us-ascii?Q?8V+Fhq3Fng6Cfoq/mlp246V+6oQnafsNqHpuqkW4v4g5nkAac/g1ymkaom3y?=
 =?us-ascii?Q?XlPgPz/lsG91G4eCLsH+CBEap7FNP23FDYfZjIe+XJ1KAr9d4KsMl1sDb+Lq?=
 =?us-ascii?Q?UjTIdLRoKe2sfj1ElIXHOLvCQhpr8YbscQ+WJb869Jszx372fW8vh4tVGFt5?=
 =?us-ascii?Q?k2uevACCF5O8/H43O22oGaRdEO396CsN8yMrXYZuxJnOkoPbzlT0p847PCiu?=
 =?us-ascii?Q?dooSwwUriccfIq4AqGbwrnx8X/1ZYRbEKtCXQKYhkjods7PMotCRAjZZ+BK7?=
 =?us-ascii?Q?Va3+WezQUBoKYlt9SGOCJsbi+26EZW6C55Dx275LAAGrvOdA5CkqT7E2GdmS?=
 =?us-ascii?Q?fGciFpQsCfeaKLjFCGgo3F3AlA+qfIOyLnlfdy8cTM+Y75mqKUPT+pJ5dd+K?=
 =?us-ascii?Q?EaiaOZIM3m7UaAYsIRVyhGXTxrOkhOYQDJqFtvUYqBc6QCE+7116JHRQf/d4?=
 =?us-ascii?Q?HoWNxbUGBrFzJwIy8zpwxcYT5q3vplDDDzqySlZdc7vMqTG/jtvSz4wYf44m?=
 =?us-ascii?Q?pa37r7jmxfUDvu/ay5IJbRDDaTKBFCn9VeeXKMof77JwWXmnXAm5JTt824ss?=
 =?us-ascii?Q?0yC1UfomeR5DNI1aFUARhhuEyF5PMkgq05nnBIgg67bcekckbP11fmvXzJFd?=
 =?us-ascii?Q?MYhWJfQuA8F7KH2IpCKXHTJIaNC8f1ThjXE5yJHMw2S0+XWwdDRT5w36GbkQ?=
 =?us-ascii?Q?rZa7eGsBx64NXO1RkmOLs3EgtSIidXXyqCGNBP8hDtp4gGVqpSSfwRTYzuKu?=
 =?us-ascii?Q?zXXUQHCOHQ299SRgZpeWzrJPZ99352jcBYRk2jXJ+8pWkCEuO2ZjRP1w7+Tx?=
 =?us-ascii?Q?KC6KHehuJ+6v4DQ187cLgxwrLzC3UwH1AzdHzw4Og2zpT4rcIUY4z2thkAks?=
 =?us-ascii?Q?fZ+XF55pbjL/bNEsVlyNhRUC5VSPcv1T2Rb2rRbqwUu9EpfVXhW3Sf4UNuVB?=
 =?us-ascii?Q?e4xGVU132wzVKbpyC9mH2p5MI2EJtOnVIWzbW6Vs8lWCKkPlqbpTOHc1ke8r?=
 =?us-ascii?Q?QNkrTLgazeWwRg7M0BRXSJ6Jb6dNva5eWfPi8yy9odLuAvgpEF0NbT7Zxnrc?=
 =?us-ascii?Q?h/IQu1bSVqfsteYuFEpxOaBYTNCF+j3hm7WvIvf6qnOc0SzGhfyTnsGH5eLM?=
 =?us-ascii?Q?l4Wza1/+euB/8JNAUOD78hu92SkM7s1QWDwupUEVbhYECpZi1ABi38TyyUnV?=
 =?us-ascii?Q?Vt7Jx+AgYhiqrYWMp/IvlS7uEiruzfcG7gjisJD5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fd510e-1d89-480e-e563-08ddd5c0383e
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 14:39:31.3720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cscp0pda2v1hKSM55nV+1F0UHykxvfYgiUu7v0Gw70w3+FL+xWtHIkhYUjoVRekgxAt75vAxu52KL82i9dzUVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7175
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

Commit 16f5dfbc851b ("gfp: include __GFP_NOWARN in GFP_NOWAIT") made
GFP_NOWAIT implicitly include __GFP_NOWARN.

Therefore, explicit __GFP_NOWARN combined with GFP_NOWAIT (e.g.,
`GFP_NOWAIT | __GFP_NOWARN`) is now redundant.  Let's clean up these
redundant flags across subsystems.

No functional changes.

Qianfeng Rong (2):
  drm/locking: remove redundant __GFP_NOWARN
  drm/i915: remove redundant __GFP_NOWARN

 drivers/gpu/drm/drm_modeset_lock.c               | 4 ++--
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
 drivers/gpu/drm/i915/i915_active.c               | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1

