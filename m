Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC29A6A4B7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71B610E5E3;
	Thu, 20 Mar 2025 11:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="qZcYbXIm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qZcYbXIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2795810E5E5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W3zveJOAgRuv537UzZ59ZtwH/qmBEAwbY2JYbOirMkQD+0+k+QTMOFW07swTxnbAQm/gbf6i3tViQnHD3COl4drijcJVY5/ToDy/mQBO4Vca+8+v6tEmZZUP85l2Tgz6hArFtZlGkp++WtQ4JRRZqZlkXzAdQ9BVe/q308eK1HrrJntOwRWKCAssoKcI5FlXDGi7JvU22j3v40xfURsFn/xXxk/0g0TSwNhPqr6n1fiT1/AQRT6HE5SKT/tJTrcdysv0LOIRxng1uBFB7i4W3MM11YZLUUEpEanhUj5jCmzFFzDsPBMUi4uvLXzSrFzkMu3S1kNlffNFanNWoH8ayg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJdvRf2cZn5crTwsSzEmzrD+7XEnstobIN9lPJt0nRI=;
 b=Mdnifj0jKYmsHaAuJLU9Gyb4IS7Dv38HJFF2hOBASYg2XSO9m1BKOU4s6KUteA0Ezy7ZB18TRA0gifgKiSaX/dQic4iEU+SJmkBLMabrEjptuSRYbKjhfLJj07VVMacKoheuD81ToFL2+xo+7q4Eida39SdUvcRbqbiNc5qMNFuv6Z3bnJffW7jbbsOxXPNZhlpw7stgMvBpPcl276AOtGCYKZ3hllH/e3kB8zJYzpBN+xLmRu1Zbu16hcnJ2KNexAfMHD6KHdAXv7p8rD9VKfQ2oApc4DpSI6Qs9TM3hGidA60DybDiyyKAbWp5r8uaP/mooeKQa95NVAlKMSKZ/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJdvRf2cZn5crTwsSzEmzrD+7XEnstobIN9lPJt0nRI=;
 b=qZcYbXImlJH766RUs017IcXaL0zId+Fg6E0eyjPP0HJIHjCUSe4O4fuZNloRDwSJRXEAFJU6OzyFWT+p4cwOL36rxmZzzpw952ovqGgeiv8ddR3BDwiBlNZinPhlLlCXuzymwPp0lxoe0+SNjgpCjbzevBx4r3H76MDc7k6UMmo=
Received: from DU6P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::22)
 by AM8PR08MB6465.eurprd08.prod.outlook.com (2603:10a6:20b:365::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 11:18:09 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::46) by DU6P191CA0007.outlook.office365.com
 (2603:10a6:10:540::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 11:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:09 +0000
Received: ("Tessian outbound 77cd431de54d:v597");
 Thu, 20 Mar 2025 11:18:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 756a92a518657eb4
X-TessianGatewayMetadata: mt0EJJwy1/i8oTwlqC/K16U1kVqARWEQezon19Oxs8ZXWMN+xWQxBvx6J0fBsT2uhZoVwByuzbg8wvN1Hbmg/BRtAl9Zcm65/3R0ZHLfDjiMqaHeNKgaef+DwOkOR8FW/nsP6FJPDSbLfLN0ERYUY93cIMxoC2qfcz1igNqPPLk=
X-CR-MTA-TID: 64aa7808
Received: from Lb4d8711e3bea.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56FD2232-E6CC-408F-9EEA-8D9E481684C5.1; 
 Thu, 20 Mar 2025 11:18:01 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb4d8711e3bea.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYAnTT4WFrxZYELtQZfVlOyhDs6deI+ER+i5irURSOoKvPoO6pw97WZFqp/LFg0II60r/ygekoi70ltpwDSsCunFPXqn5O0HoL73GDKx27q8WnaAg6Pi+W664Qro++5kGbjOSaBTeFPuY95whgiMVr1D6MCIdaRjH9hX4d2Q3irSL3CNRTW85B1rXuwsCRRdN/aVJOFxIVgSW67OCy/VJM082YLWkldSyzA/1ZKeA2KVGpHhDAMw/jwDkNYiprxHEbGc+R237Qd1PclWOKHtDOGKZuLcwUN4lS3Kh0ai6bgj6sFHExD6JCVS4WtyxtMDTQtwAFAF14OeTWufDTIzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJdvRf2cZn5crTwsSzEmzrD+7XEnstobIN9lPJt0nRI=;
 b=RIkfBVOzwF9U1pXhkPtrGeWpcSiFPb7Ii0qdtQ0+fw5X/x4grMqI0rGXRsnaN+IBZk9rhvtBSrRWG8k/LyjM1DAZshtUK3G1x1M3ChSYe0MbFGMsH+d7QAi/iU3SJsjpA5fdneH1FUiip9NnE2zEdCi9TeyHGBJ3y6E448A6Bj9Sl/MKkpKW6Mlfq9wOgzXqPuriBdGuoUTlpZyOkNS/M0AKIx3BvjyJa8DYwn+qx36AJfg9hdTgSgADXwKzMxBCkEnRP0Yq6FhppZo8qVrks/F7ARar8N9hzML8N5c3PkW+dHJVsdCgeFgyQldH/By1Rl2IRIrVaHTPdVj7hFFLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJdvRf2cZn5crTwsSzEmzrD+7XEnstobIN9lPJt0nRI=;
 b=qZcYbXImlJH766RUs017IcXaL0zId+Fg6E0eyjPP0HJIHjCUSe4O4fuZNloRDwSJRXEAFJU6OzyFWT+p4cwOL36rxmZzzpw952ovqGgeiv8ddR3BDwiBlNZinPhlLlCXuzymwPp0lxoe0+SNjgpCjbzevBx4r3H76MDc7k6UMmo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:17:58 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:17:58 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] drm/panthor: Move GPU info initialization into
 panthor_hw.c
Date: Thu, 20 Mar 2025 11:17:36 +0000
Message-ID: <20250320111741.1937892-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0209.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB6715:EE_|DB5PEPF00014B95:EE_|AM8PR08MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ad9852-2f58-4ed4-21f7-08dd67a0e51d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?wYeuG4Jg1s3rZoj6g6Bf2GyuecNbeTj1T9G8NKi1qQVxQm1bL+1esDDavCZF?=
 =?us-ascii?Q?xvxJQqhj50V0smJMfImLHbTo9rZaaNbqnUPHYGRrzwPs5Jh/G6KrjSrXi+Ls?=
 =?us-ascii?Q?IXMVS8Xd/YGG7IiJe4Y0gQCJ/mVd9qRCjLS8fMzLcfr9ViIlDQCWr+nnz06+?=
 =?us-ascii?Q?b+92Sd87B//tEJ3NDsbHSUqEALiaSKpVlOgU65pCf/esIxtwIJgFhOLoX9HI?=
 =?us-ascii?Q?v8oTVcQwKBkV8TbOeTAETgKioTz0QnuSMAWPF87OGDzYnK3KJN3p5fxlnzOI?=
 =?us-ascii?Q?N7LBIVj6ho0mPz8u5OrRrMBNjtkG9AGyCl1jCAmMb81NsW1GX0yA5FrYduZK?=
 =?us-ascii?Q?kDCWh/GkKYwsm1pQowWce9JSelBrq9OGxrA+hbPdFp6VfslbvPGueNQ/mIgQ?=
 =?us-ascii?Q?fEhPuQ7ChSnqAGkZkwpay/QtFDpQ6WWGGD3dWt192ly76Nfw5p10J3kdD/WW?=
 =?us-ascii?Q?dGrRvBGrxhpAdG0hUtrLe2fJ77zZtWnCHtVGLf50XuBHugyF3RbPNY15UXgj?=
 =?us-ascii?Q?QNv14JrBShV4IgLX98sQNYT2SVqdeHjvueR28Hd+NE3OstM/w01EIFKJROIz?=
 =?us-ascii?Q?XGbrvQeoigqHMYhTUJFaFEzyd0AbJPPR3mbD6wEvx4gHnVMv2bfyQUzsRRWT?=
 =?us-ascii?Q?tKc0Zm6P5EB17jEURaFLo4fNktQIACgOtZrRv6hDjBRCIBoGPN5MRZXQDpxb?=
 =?us-ascii?Q?4uAtwaCTt2mT8yNZP44U1nCkPbM1a+tCv+99XJhtzaAdNlzgpZzWqAukdd83?=
 =?us-ascii?Q?0BREkNG5x6BsucN6FS4JgKdFwe8BdrkCvt0N8ThUAJ8RFqevNl7uATPd2Y0Q?=
 =?us-ascii?Q?9i37d+S6XlC49ybB3h6HGYn7zZpczlOCZQxYlbUe9WEIHa/mWqdxoYU5uCl2?=
 =?us-ascii?Q?3BCrIa7sLUit2atVp9+1FDnLY8/6h6SiOvxhPT7zA4t9tnQNyFBuOLKhSJND?=
 =?us-ascii?Q?26ANH0oliwu50mRtkBdiE7nOwv5/bSThrpYIsgfYTI32NGr4FWzcQv0DMa/f?=
 =?us-ascii?Q?n6pPk9Q65HKDY9OyY+oUqbziKGhXSYKha1W/FyNFc121EFWcdm/V9sHogvQi?=
 =?us-ascii?Q?Fpx8/cuvXSCqFsygAdv39RKbXi98Bfx7KdyfxtQ6cYmMNRjJDTxswXEFonS7?=
 =?us-ascii?Q?k1fZYYTKwxWShMrg5cWDaFGL40Kajol6xhmDIBrOk93F4SNCWTJTUt6Fqqgp?=
 =?us-ascii?Q?wsAWnEZccrDO+/9cHths1n0qIIPx/oLr3lZ8R4oJUUT7ohsBlv4HbpgMGvdC?=
 =?us-ascii?Q?qBhQKtFjCpQ3itN/YFhIfSki32ClTC2mjeD0GLZyC2rt6eJ0dDNr2hswdGRg?=
 =?us-ascii?Q?gJo4gVzdydC9mRG14gvZcYkyCBGAQ3hJCQTgyAJiJDyj4mCQGCUqn1Ufekgk?=
 =?us-ascii?Q?0rg4po4yMb9FDNkkbtdZ1QkXZlLE?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 80590e64-33b4-4147-5f8b-08dd67a0de4e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PBlqi1W+lkProXFnsWClx+UqKo6S3Aoc9WxMqgq+oi2VK79fvFxtZ2kxoyHI?=
 =?us-ascii?Q?fbji4wt+Zx99YXj/CRlajca/9g2L46CCmf0C7OHWTS2ent3r3eIZA9jWVv/K?=
 =?us-ascii?Q?vFDcS8ndfmLGgMh+D2K9OaBg+8bkpdz9kzulUG3LXlcMGchwohROR4szK8ss?=
 =?us-ascii?Q?1NcvLEbq6Xj3XX6tE9sNkHhhnn0DJn+QbFtyv2YqpUhor1CczKJ6fJODSjzE?=
 =?us-ascii?Q?izNQDtE+bg3HXAZCBKHwA1dZdtM8jVHAiHPWo1Iqxd+IedjqoQ3+gFMG/PiG?=
 =?us-ascii?Q?baQITrOiiVGNUzXH0ZizeNDETFaprrqdGR138nFPFF6tR4/8oQQxPdqs9Ddu?=
 =?us-ascii?Q?6dhFxcvqH6Ff8joNGOVvUBWybDhDXSX9KNLLGKe1tcZFhHm8zQJ8fOfWgqAz?=
 =?us-ascii?Q?eI+HSX0gxGy02XykUp5h3BypHzreANmFziNcxWHey1BN58JiKtScFEwYVYb8?=
 =?us-ascii?Q?FXZLrLZ/rKP2IliOEJEfEnXiSuxB6seHVgV3YW4cQKhRQdk/2972/u4DrSFZ?=
 =?us-ascii?Q?/QRy6EhZoVCuIVOEbyATtzU5tEqy3yJOoYX8X8oEWldcobvaZ6HEwKVAlOqN?=
 =?us-ascii?Q?RrXZiejNvUnOvLzpjwWHIJ4CAJtK23DhmWglNcEY2Mlm/JoWgx9bT2HV+ZL6?=
 =?us-ascii?Q?2EIYTSZglzoTC2MAXh0kyb0mwsxF24ouuDUcNlN8PmCwctMcyl+NlTFRHgW1?=
 =?us-ascii?Q?EyLGXSPre3SBz+EfjziFx/nb7tMVjIJqQiLefYrnwaNCHYwNEqCEt+fB/nmd?=
 =?us-ascii?Q?wAl7LITPLiEAxl2aZYwDaHFUZ8En53KhSOD3Zj2N9sGsGbrkwL+FZSuBcjTf?=
 =?us-ascii?Q?2LbGrNNHSjIrS6TCpdPPW1IomwzW12rK/gOzHlTliouLYMnZZ0CyDoP35yeG?=
 =?us-ascii?Q?RW+LrIC5vBBe2Z8wvPr8aqFp333831cDMv7dSSdQNzzX9l1TlwFOVsCVccdj?=
 =?us-ascii?Q?9iXfWn1b2Rw0oTX2xVN5q5US6rz1ctrRBxo3MFv3IM1Jbg56aYSohW/u/j7q?=
 =?us-ascii?Q?uWrid77zncnQnNKpA2RCJsaSN26M7wFCu8E15BXxUNXj17WlaChZDIO7A9WI?=
 =?us-ascii?Q?pulEA3ehvGYli3vBTnY9L3PwHh0CbF/ZAMzyZWv2ArfHmclLwIQIbtCrnib7?=
 =?us-ascii?Q?gCb0wm6hYhBzi2VzVpnPEbtxZItSycqI44D/EBFW3Q2NJgXE5js2IKlHx0G8?=
 =?us-ascii?Q?p5jxGIzlkKzVbnlL/C4ngEXNnuDlXAbARcMPGnbNZ64sSgwVMyKDm3cB3Zej?=
 =?us-ascii?Q?C/J48KbJlwArlKf2/yKgdwPKT0DjT9dojJ38TBk1/T39WQxVPjlx//dN09cv?=
 =?us-ascii?Q?n2gaJ9uGTHV87IC0O29hU4hQCCYCkQtLcB7HYuBWoy0mL+8tX2N/xXucmebj?=
 =?us-ascii?Q?isdObNtB0dyLTG3/0fSDvkMVeMJi7PJy/XOFwfXFJVmiv1nIsp1pzrEmzkXb?=
 =?us-ascii?Q?BTEjEW4j7LjdTmvPg0aVSu65t5Qu6qG/4wN67L8BzghxZTRjIuBqQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:09.2642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ad9852-2f58-4ed4-21f7-08dd67a0e51d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6465
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

This patch moves GPU info initialization into panthor_hw.c in
preparation of handling GPU register changes. The GPU register reading
operations to populate gpu_info are separated into an architecture
specific arch_*_gpu_info_init() function and is called via the new
function pointer abstraction under hw.ops.gpu_info_init().

Future GPU support will be performed by implementing a *_gpu_info_init()
function specific to that architecture version. It can call any existing
*_gpu_info_init() and extend it with additional register reads or
provide an entirely different implementation.

This patch will enable Panthor to support GPUs with changes to register
offsets, size and fields.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c |  95 -----------------------
 drivers/gpu/drm/panthor/panthor_hw.c  | 105 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h  |   3 +-
 3 files changed, 107 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0dee011fe2e9..fcdee8901482 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	if (status & GPU_IRQ_FAULT) {
@@ -203,7 +109,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 234bfd50cf0d..4cc4b0d5382c 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,10 +5,113 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
+}
+
+static void panthor_gpu_init_info(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	ptdev->hw->ops.gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
 static struct panthor_hw panthor_hw_devices[] = {
 	{
 		.arch_id = GPU_ARCH_ID_MAKE(10, 0, 0),
 		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0, 0),
+		.ops = {
+			.gpu_info_init = arch_10_8_gpu_info_init,
+		},
 	},
 };
 
@@ -59,6 +162,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
 
 	ptdev->hw = hdev;
 
+	panthor_gpu_init_info(ptdev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 5eb0549ad333..dfe0f86c5d76 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -31,7 +31,8 @@ struct panthor_hw_regmap {
  * struct panthor_hw_ops - HW operations that are specific to a GPU
  */
 struct panthor_hw_ops {
-
+	/** @gpu_info_init: Function pointer to initialize GPU info. */
+	void (*gpu_info_init)(struct panthor_device *ptdev);
 };
 
 /**
-- 
2.47.1

