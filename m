Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73AACB0AE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F7510E52D;
	Mon,  2 Jun 2025 14:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="dPjb+xVx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dPjb+xVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C08C10E2ED
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s93rDCHMXYwya8SR3EZB7Q5Fp+rR4iIZtHEv3ndpMyiDhefp/3oRHyMBMytnSna4HeYu88yoi4ERA974ugufyh67pOCXrnt9o6ZdQLQfD541Tr9YmMOlz+vtbiYsnHqwgLGRZOV0JPNL7Bs/NyWOxJyIJHKMdkZzbCJV7wDQpAgWgpVXJBUMvNRHMa0xlGqi5Z4IAgDDfdoxd/QtD/ijTKjEdFE3RHaU0Tx3mea3HvPnq02Y3QfcYWGVCvDZlJo9ybLXfJkTxVB0jN4KrjPudH1Jvhr8GMi8bcafHc0PLD12qXGNi8eXGybj/KhmzvXwu7fFp+2jzXvyzJGBr7dKdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6210aX5zlrxHE/cIUkTkGk/pTMoUhGMGljATO8Ffq8=;
 b=ARs7CzWacntnkbSzQXu4AWl/yGch3c60X2cHG0mTAHk2IT21ZKa2/AIUA9OYj65bz8d15eTrGssY18nCq2Im0Y4ShzQDm7KdYp9E4MAZ8S/eII7Wj/dBFJC2esDwst8TXQAMtxQQSlyPrsoD8jyl7OjkYDJzBJgVV+jOmebpvK2Yi7Cus3k8Urg3JeYM9/JeOoypx9KdGsH2dJtnAzU9CGcs6jp5UcqOSOPz1ZwQA+NXQwfyShEn7QdQ3p9RsGHOlKo/MfphvJjH+4GCCiYagRPBlwXaTRagozJoEc7fnnbzguPLX/X4thwBBtoVNSEAoZCj64KV1HAaATrlw5mk6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6210aX5zlrxHE/cIUkTkGk/pTMoUhGMGljATO8Ffq8=;
 b=dPjb+xVxnebULwbjKGAVHhLqDlrN/JngmevaRbYiVl2U3SlurDGL9fBKVMhcX69XExdtiXPazo7yQKD1zMG1BJ7HUz8awY8F9IIeNzR+aW7uWkLhkS31chnNYzkKw9MzHZXsw2HgkWWMTd0Uj2LB+37IqAeeAclBC5IgZGeAGTE=
Received: from PR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::30) by
 DB5PR08MB10062.eurprd08.prod.outlook.com (2603:10a6:10:48f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:09:09 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:101:1:cafe::e7) by PR2P264CA0042.outlook.office365.com
 (2603:10a6:101:1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 2 Jun 2025 14:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.2 via
 Frontend Transport; Mon, 2 Jun 2025 14:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pD58n07DJFa1X9mLj2/RtS2cXLc6HiRb50ZAfaL4nKA7DvSB1h2yLE/fR3qWl1poQkmufsCQrHckv05nPWr/jiP8E0cqGfZBIA2ZkA4EMPoC58b0qOSCRl92vBwO79z2zhLmgh/1bzkTMofmoHfniCrtXIUzfSEEl6uNz3mFYTX+zS7WSigqiutP1P8BHYsp4XolNiKDoupgHM8g3wJCtCCPrQ0UtB/S+R4hkxMfSYegBmAWlBmbcLMOEvsUshAfryaWJ1UdGJR3BC+tqAEyOTUxqpCIIH9zyGuZ7jEA02vPMvSFFw4kRhi9HzbzyvXo37AqC/HOzJaKEpT8ER7uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6210aX5zlrxHE/cIUkTkGk/pTMoUhGMGljATO8Ffq8=;
 b=p4/CtFB1+VyiS8yeU+QZuX7S0LgK4w8nALMuad6demIg5Jl0ZXNI+JYq6kATlIfc4AR3Uj6+IaxkDcNkjyhg2AeoSYKPgVcnkg6CMkIg4AlYOrEtCpRArDTrtmLM0ZFeJHmB06anmjAK460+uIjaBZme/uHeS7h5OFp3ssO+IoeP7Ee/DPKpZxsBbRI+RaCU72+DfYwXjcOlTGkg+cYD9RAkrZqaq3r//KEtT0I1GYaV7ILM9zkUuhJoGShNudhIAWI+GhCXsptxdI4RFLlQyyyawNxFmVSFaa7hiKu1esu2KxA/LP4afY6dhiiMjCfILNxqaz78DiUm8sT7jHDBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6210aX5zlrxHE/cIUkTkGk/pTMoUhGMGljATO8Ffq8=;
 b=dPjb+xVxnebULwbjKGAVHhLqDlrN/JngmevaRbYiVl2U3SlurDGL9fBKVMhcX69XExdtiXPazo7yQKD1zMG1BJ7HUz8awY8F9IIeNzR+aW7uWkLhkS31chnNYzkKw9MzHZXsw2HgkWWMTd0Uj2LB+37IqAeeAclBC5IgZGeAGTE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8033.eurprd08.prod.outlook.com
 (2603:10a6:150:9a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 2 Jun
 2025 14:08:35 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:35 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] drm/panthor: Add support for Mali-G720 and Mali-G725
 GPUs
Date: Mon,  2 Jun 2025 15:08:13 +0100
Message-ID: <20250602140814.2559538-10-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::34) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8033:EE_|AM4PEPF00025F9A:EE_|DB5PR08MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: 91eb6e7d-405f-453c-2a4c-08dda1df0a10
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?wY6HUJfZC2aXWO3eT9JMC9QaheGVLTsvqL2dEiYOfD8DJuqfYB2iSA5vBM1g?=
 =?us-ascii?Q?BJnIS0ERoqttsZ6xm18D3LTNbMh6BcuLEok/1Xj/qY4lRSixixYL3O6MB3z1?=
 =?us-ascii?Q?RTH6o/vaz+2n/sD1IHJ7R/eSWKIOe5F5G46/moHvanZqS0ngHuSWXORpVjuJ?=
 =?us-ascii?Q?uXo6MwtI9POZ3qM0hZDN7tfcFksRSRtdncqrnsUu3k58RPZDEiV7Ssj0fYBM?=
 =?us-ascii?Q?Sby88K4Kik41Ng2/Nb6r7rwa3OYXWcJGK65DhRO34Wl54xCmWscWpODHcQkY?=
 =?us-ascii?Q?NyxkxYvMRjBUnEiqwpa4Gxfa6CnDX6NY9ib89IO4jFMINf9G6Q4NRigN0b81?=
 =?us-ascii?Q?DCFTJHu1z9I9kAO5wo1DGxcv5vRmQztjglJD1EaG19dDZUUdGBV4gOFirmwP?=
 =?us-ascii?Q?L4pbE1RtgH6EbEC6lJLHfLAxBV0gcacOirwZOQCoGxSHS2v5Kn80rVeinhN5?=
 =?us-ascii?Q?8lpzovCHqj/tQytkh/j9KFEDu35luoIvSAchN5pkH2FB0nmtL4/g+KCw3Nvt?=
 =?us-ascii?Q?PQeClXZ8OmCab6l+rEY8jCS75i6T40hFaGGYnpVFKlM2q+rI5MDEDrAi0Vqy?=
 =?us-ascii?Q?stuZFkPAfqrCrcYw+pYAZHroETbWkjKH9uTaSLc8ILvn8K1GsZDeXFjdpP5v?=
 =?us-ascii?Q?Zpik/D9Vc4rM7eAdKgAD3d8c610kglDXL02svK7b6ZoDXGFqAyYmVJ6l6q1y?=
 =?us-ascii?Q?68y5OokzOHFlwfpki9BFQQT4kEWfBhTHI/oQUE+WXV9B9EJCYgiArwiVycMp?=
 =?us-ascii?Q?VRJLEdLSoBONEM0abxd3PrhcXA8U8UXwV3PfFMoeJmvOmJpuRqA8W0euI7Rc?=
 =?us-ascii?Q?jA0BiSfXWflKpvLJYa6x9wkPq4A0MCd6PcpWeb+i+JhHEcGjtdMdWIjLqMks?=
 =?us-ascii?Q?UCkrZnoBZCRoCXp8wqmODzCqwQkwOrfjAWgrAkKYJiHOU3wqajRzfnXsfPQg?=
 =?us-ascii?Q?bUZoUTV89DMF5ZJvd+G0mst1fRrJ2AcivVTeLnK9V3GkkRP9M32V81+M7IPQ?=
 =?us-ascii?Q?saUP+g57H47XTbGKJl4Fs7r5MTp2pmV2Ti3rLDzaXBCyEuVf2prV31J2Qlh0?=
 =?us-ascii?Q?m2Hb20pm+cLXQj8myBOm7wdcAvpvYUGO11JVMhyDyQcQ3ADPNESZTNnwxLRU?=
 =?us-ascii?Q?s4sLsn6SxpDPCDekFU5lw6vi8yYJ+/FSiQELMihkvcsBpaltO8JcGfGt0QNx?=
 =?us-ascii?Q?kMXhi4Kw00shU9Rwsm/h8SgDuv6Ge2A+vNOW7NS3f+xhpwtaYRJ9oAi6KqFl?=
 =?us-ascii?Q?QW/9bzxO3LoauUaVDvG/8XBg+8nOuMyo/LndSnR25bZzvQrjsUNu0kDIrBPb?=
 =?us-ascii?Q?nwg3dNv40cwy3dWk7UqEhHhMRxu4c8Fc2sVBKEEzhNf2sO7ykQy27jnFk0MD?=
 =?us-ascii?Q?lgNr2kG/r+6E/RwQCXQmfOlhz9UWgh5hxXYSbn75fE903QNw1Y2vxrTeSnPg?=
 =?us-ascii?Q?ZT6BLEoJZfA=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8033
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 91ed229a-8b64-4231-b4c4-08dda1def6c4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|1800799024|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QWNJCofDwtq6muLxPfKHP7tdYWD+DjfkIREg0ggg5RREx/7YA5B99KR+MRJh?=
 =?us-ascii?Q?DnJbqr4BxWhTv9X/O7bHtCXaRmJqHikQDovhi5aXxWziJBLzs/QQkdlTZxjz?=
 =?us-ascii?Q?oB5FywjU45fzgjfV5reydTfVVwuMBXJcANIQHnWRrc2oXLtSBNfQzAWUgQys?=
 =?us-ascii?Q?OvQ4qFO1dJadt+GG+ub7DS631jI9S9Ou2dOBV6MqASNftdNGrrOY2yg+7XO0?=
 =?us-ascii?Q?597J0cStU4kna1e1hRml+ABKdVHCh+wJG5jhaFBsQCYhLIJEirJJWU80m/Ra?=
 =?us-ascii?Q?qp88VE3UQIwR3DcePhq9FHru4H46dxV0P4Dl60cAkqHBGA5r5ulJctjQuJfG?=
 =?us-ascii?Q?lJYcBNMlodlkL04G7f9GQBaTULWLMvpWnhcqfD2HDzpocPCBBgYKWcQlYYHq?=
 =?us-ascii?Q?2NWD6VVPgSw6+GDklPde38AWa1pN+l9zufLi3Yj9U7oVBkbDa7WCTehHQk4I?=
 =?us-ascii?Q?1tVapvA1lVTlWe+Eny98ok8fnQNAkMGV6Mw9BQcfwHyI8bR6teJ3uT4x5vYp?=
 =?us-ascii?Q?JW6dyzWp6XPBbVy3XovHxNhHJvF2CCjsNMbdtPG0Mrsyjp0W8U9NlItI3rvX?=
 =?us-ascii?Q?nVvo5PRb6rcDBkdXXgJ+yGE+eOp+afUhTiH42ESRzFBiHeH/KbQysqQyHfqD?=
 =?us-ascii?Q?nQ6rUPPIElNvrxfDzncTEb6AIw5tESjgA+dJzqhfUtDZrfLh7WpLj7YzR3Oh?=
 =?us-ascii?Q?3Wz1lFXogSKcmYQ4Z2s3XwH0wCZfKZtZg548lnC6eRKlE1S8Cc4hLyZ4nVYZ?=
 =?us-ascii?Q?6qA05L22nUpNbgzx23xIDDOb2ajGORmAksLDJRiGRl1GTF/56JpoxTsihVNF?=
 =?us-ascii?Q?06p4Q+1CcDxUDptaJVBzD8gLqg1cPMLj+I76YGp8ycldSNVBshHxYoL0RABm?=
 =?us-ascii?Q?lohRrfXjSsOOWk5+2fTD1pcFNkRLvWLPO8TUzolB+TCz1unT5JGa13GqdaJe?=
 =?us-ascii?Q?qrIGFj/bl57+w7EMlv3MfDFLdFM0KkL7UEpyApkLlrY96bDgmdqE4CoxZLWS?=
 =?us-ascii?Q?heeT9pqE+S0G4iwPVRqvFj9vQzc/ngmVXqatLilGNET7cle2KmLALswvY7Ub?=
 =?us-ascii?Q?jR6w83Sg3q/SFojtQRmAbnyG4bwkb+Q/1MGH6Z2ePPOuP2n/KWKfm4jKKAgJ?=
 =?us-ascii?Q?d55jbN6tvpeKUuAumILZfSKg+waIFPvP8woN4zcP6bPnzBcyN6IgUwtGYAp5?=
 =?us-ascii?Q?Brcw5fFFaUGwKSr34smmK45+dj4yIgAVfO6RA3TtWx/a3ortaZB/sZXfEc4g?=
 =?us-ascii?Q?8xIOBltVbFeaZZCO7gf3ZU+a1LiMS+IC2/NItothp1N/dg81CZcLCDoKSkdH?=
 =?us-ascii?Q?xPyS+MqXOOeXN4vCTnUyUsUE62L8LybRXh0BjXL9UEkGj65F6YtX2XpTPABI?=
 =?us-ascii?Q?1rDL8JdpZwR5to1WqgJUb00NW9ECiXOI+FntQslFUIEsoK+y2oKBHrpOkHvI?=
 =?us-ascii?Q?b3WVahosK5Czx7ADOVJrN12ORZXeoUGqkQ2DVJz2R1sHq+uNrui6yjT0cuS1?=
 =?us-ascii?Q?oUHXhXONfMlhE7Fdk4xQhexLnK0NkbhRq0aA?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:07.4240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91eb6e7d-405f-453c-2a4c-08dda1df0a10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10062
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

Mali-G720 and Mali-G725 deprecates the use of FLUSH_MEM and FLUSH_PT
MMU_AS commands in favour of cache maintenance via
GPU_COMMAND's FLUSH_CACHES and FLUSH_PA_RANGE.

They also introduce the following registers:
- GPU_COMMAND_ARG0~1
- SHADER_PWRFEATURES
- AMBA_FEATURES
- AMBA_ENABLE

This patch enables FLUSH_CACHES for both families of GPUs via the
PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH bit until FLUSH_PA_RANGE support
is added. It also adds the aforementioned register definitions and
firmware binary support for arch 12.8 and 13.8.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  2 ++
 drivers/gpu/drm/panthor/panthor_hw.c   | 30 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 12 +++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fa6e0b48a0b2..9bf06e55eaee 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 5ec9d7f28368..281d86c4715e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -61,6 +61,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(11, 3):
 		return "Mali-G615";
+	case GPU_PROD_ID_MAKE(12, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G720-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G720";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(12, 1):
+		return "Mali-G620";
+	case GPU_PROD_ID_MAKE(13, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G925-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G725";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(13, 1):
+		return "Mali-G625";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -109,6 +127,18 @@ static struct panthor_hw panthor_hw_devices[] = {
 			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
 		},
 	},
+	{
+		.arch_major = 12,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
+	},
+	{
+		.arch_major = 13,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
+	},
 };
 
 static int init_gpu_id(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 4eaa2b612756..8e01440f8743 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -89,6 +89,8 @@
 
 #define GPU_DOORBELL_FEATURES				0xC0
 
+#define GPU_COMMAND_ARG(n)				(0xD0 + ((n) * 8))
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -98,6 +100,8 @@
 #define L2_READY					0x160
 
 #define SHADER_PWRON					0x180
+#define SHADER_PWRFEATURES				0x188
+#define   SHADER_PWRFEATURES_RAY_TRACING_UNIT		BIT(0)
 #define TILER_PWRON					0x190
 #define L2_PWRON					0x1A0
 
@@ -125,6 +129,13 @@
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
+#define AMBA_FEATURES					0x300
+#define   AMBA_FEATURES_ACE_LITE			BIT(0)
+#define   AMBA_FEATURES_ACE				BIT(1)
+#define   AMBA_FEATURES_SHAREABLE_CACHE_SUPPORT		BIT(5)
+
+#define AMBA_ENABLE					0x304
+
 #define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
 #define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
 
@@ -138,6 +149,7 @@
 #define MCU_STATUS_ENABLED				1
 #define MCU_STATUS_HALT					2
 #define MCU_STATUS_FATAL				3
+#define MCU_FEATURES					0x708
 
 /* Job Control regs */
 #define JOB_INT_RAWSTAT					0x1000
-- 
2.49.0

