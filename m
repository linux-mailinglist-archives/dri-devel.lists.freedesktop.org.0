Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DCBD8826
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8B510E58E;
	Tue, 14 Oct 2025 09:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="my1CuUzP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="my1CuUzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E0B10E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lPIzqBSpveB313uJ7YWHSd8FfiPX8qdRRSzYbbAGFNWK1msySCxO28RZdnoMwyFgHoPn99SSUl50OcYn0vqd0QbeYJnon952CwG1So1RR+QEtoJhjQkjuUQvLchutRNCPvdLD6GPrON/DXEgWFZBHBGm1Pu4OheWhZkzI7sAwWAIPtPVdpyrpz3Az+nea039Fti77U75Pa3nLWIBPKaoEbdmRTByayKaZmoLbtxApDDwVHU5UFJnpSD963JXTpteHeCNWrOvgnFRPjYBDjXjWFntzoTDUgHGs/dV/oxcrqA8KMm/wc9XlFKIsObhr9o3aFtRpw13oLpFGWXiqPmTFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xy1gjZ6FnR0v3NIhsRyhaeMUq/yYza3/sxvGWFcg94=;
 b=rZItee8gkwUMGSWklToh96L37NvvQsapd9fkoCIviHOYHg2sTIoapwP0hnPkT/OMxAol+Q8Lgolnf15/sjW6IwNtm2zchh0MmO5nEzhMlZgrFZedZc/jQJsZxEgiJdc/QTzWmuocemThbow8JMT+eXObJ8hZsGGPaT3iPL3JAB3nZqpww7tTGi+6wsFOudkvjORYbMZRJkwx/2iREdgu47fqQXTS/amA8fHWbzeJbUOKQ3Ek7hfXryzK3a2coHqvDkzdBnr/6Ib8D/jzYn+mzuPDHKD27P5nisao6jN/kuKffIp9/QMTXxItHRC3TNTXFsoNQ+evWVyzofQ0DpOt2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xy1gjZ6FnR0v3NIhsRyhaeMUq/yYza3/sxvGWFcg94=;
 b=my1CuUzPzCm0y2TE5LS5Rv1UvssSD8Lun0N5DDmmxyh165Z9QprluDzU15MTmniwIwpS6x1wR/64FjBtS9j9HC1Zc3zYypvPomxm098YjlkZjHj2T1Wo38ahVJhQl87+Ok71WCQ59veYhOLgK28Su/LEiVlv+UkxDBMhFzzzZSI=
Received: from DB8PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:110::37)
 by DB3PR08MB9010.eurprd08.prod.outlook.com (2603:10a6:10:42b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:44:35 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::a2) by DB8PR04CA0027.outlook.office365.com
 (2603:10a6:10:110::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Tue,
 14 Oct 2025 09:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 09:44:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lV1o8AexSz/UUngyGONIxXNtFd2D2wzoxFZ2CbjF6DGfUx1k+5mc2NyCPEEOR31TALzG6u3LXX8105z+32azDXcYzZyxdjkvJhIQq5XmFF2SPRLZZ/Rb0hycsD9TTCi1bKEQKAEk9sQBnIym9Hgi/24Is7TqurHi2KqycLiKOmJdfuDVZ2ymIG89A2GC4YyL3+X/nS1h+Mqb1Y2vuLD3oD49ZjRX7ah9PTpu96q2LqVGfLAzOvdMXTSYoYRdJoB0lOw5C+uUgU33+juLF5d68VJk97nS6rDT2TCfxvMTw9QYoC588JhxDsx8ugRJaoGP0tpSzWqjp+0LuCNF/e5ALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xy1gjZ6FnR0v3NIhsRyhaeMUq/yYza3/sxvGWFcg94=;
 b=ybX6vRLRmNrJK9Y0ibxuV31C4kbjx4FYiRGvzrozXcsw/IQfZ9Td6/dxl4kwQ2C1POKLXSXx+VLn+DgTHjqD22PXGWwtXaC27v1/VnJLbJ3ToA6EN5pYWITENF68AqbTWo62YprRU9jIDnChoDaeccx/92nmpLseF9Gz/jlOx0dKhFFBIZvMkEmvPxlC0q0BX4whwYv7MtBfBzS1MyT7mwrxX/xmo6AVcbbRyTnZo6KmILO9743W+AZTQsBkJRfIR5evD0m8tVEmYHNRYjRkhyKpVKr8G611ct+0K9yVfV7w3istKwMyrrs5Of0glEYI6JFT5cYQbCrNkFeF6dh7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xy1gjZ6FnR0v3NIhsRyhaeMUq/yYza3/sxvGWFcg94=;
 b=my1CuUzPzCm0y2TE5LS5Rv1UvssSD8Lun0N5DDmmxyh165Z9QprluDzU15MTmniwIwpS6x1wR/64FjBtS9j9HC1Zc3zYypvPomxm098YjlkZjHj2T1Wo38ahVJhQl87+Ok71WCQ59veYhOLgK28Su/LEiVlv+UkxDBMhFzzzZSI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB8286.eurprd08.prod.outlook.com
 (2603:10a6:20b:555::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:44:02 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:02 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] drm/panthor: Add arch-specific panthor_hw binding
Date: Tue, 14 Oct 2025 10:43:29 +0100
Message-ID: <20251014094337.1009601-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0146.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::11) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB8286:EE_|DB1PEPF000509FE:EE_|DB3PR08MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: cb51c262-8d76-43c9-a216-08de0b06492f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?AXoyojNisQwkzNeSW6flg1m5YoCcuvRu9Pl1Qobz0d1GaDbiw4ChfS4qTwpl?=
 =?us-ascii?Q?DFATJ/zh0ijGTEq4Frgmz+QLYKnBAULswG0MWnFCaVP+PyTGjSOHgiA7NbCK?=
 =?us-ascii?Q?El+bL0mmkUA7EtB/jvd7rI5mEXkB4/IJUyWYLPVfP9ncucuU38Xn67L9OZp6?=
 =?us-ascii?Q?1HQ/x/YS1JkpvI37RWc4o+O4Kblfrv5yEu3ht6TG8Q2czE2K30Cv4Ubmfbxp?=
 =?us-ascii?Q?+okOpD21HB8QDHb6kU74aq1m5NRM9a/WW6ctaquHjeTuvRd2d4pSuCjRo9XE?=
 =?us-ascii?Q?+sRQhaQ+g1oCJ+KVJfIRbckf9LjG+qbcl8bagCvxFQdz+sF8PVZf/JuIuOt/?=
 =?us-ascii?Q?5HXccgVyM2g8KQ8ItBmAfhpK4TgsAdu3RIFHi1cqbV3HlU2ovvKf79VaPGXN?=
 =?us-ascii?Q?Cbr6AyninEcGHGlH+BwL01GGyA9EoeG+/1ZRgpXnXXLsMzJJFpzISGU5mjlR?=
 =?us-ascii?Q?Kz7WIj5TkqOlzB+Pee2xB14tgID0u016tzJF1Xfc8k6+OB4eWIvMYH4We4zb?=
 =?us-ascii?Q?ZKectnfqnZnDadBHhFUxBnfh3ER+kZp1UUudC4oMup/V7aoxsp41P5stB+U8?=
 =?us-ascii?Q?o0+7koaOhq3q4KJOb8peFPZp71df5AQ5V/uGE7gJliDxXGUY16vzhcNM2uTx?=
 =?us-ascii?Q?Xs8gX0B6CNinLVjodiv9uFKyO2JiKnCAlFDaBKNugvwJ4ZSsuUJRy0b0w2mF?=
 =?us-ascii?Q?c/O5CjFLAhQiPgfj0HkOihR/E6pXwBWGP0VMQAz4kSWglXoGgrmKIeH+BL8R?=
 =?us-ascii?Q?CpSdOBGeeRT3ie2vYoG8MJR8CvASnfwLER+9oQO4iKa+5pUVfpYHdKJIz/he?=
 =?us-ascii?Q?NQHNMvLLfXFN15S2F5x9MIOPu1s7somstMZlcCgzOeB9ntxdcXg45AAUc0yo?=
 =?us-ascii?Q?58nblfp9fckqtyAdSCFB4qtzzY40AvqU3kHZmmNrpX0/xCexZ0B14C8AB/T3?=
 =?us-ascii?Q?ImuiybCfkq3cwcUD4lwTeqQilmr12Ee2UMYC2MDDf/s5PzJqdCColz0Y5xd1?=
 =?us-ascii?Q?QTob2aXvIiG87OPKAKQqIMu3K7T9/TTDVlBKtoLeXQpkToTLsT2Mmx4Y2Smh?=
 =?us-ascii?Q?4FhuzEguYl6QQVGBw9m4jHgiteQ/N4tsNl34PSD8oC18iRPKR7Zp1X360H/u?=
 =?us-ascii?Q?sa0OOlbJnAM99BnJJL+H5sLJWG1wa8jexAWoiDPmFEIoKGvMdfw+wpzGfqOO?=
 =?us-ascii?Q?Kwo5ajwL6+wXlizm9VqxXMF08Wkr+jexI+oYp8uPDClsmBgaguz++zmBLHs6?=
 =?us-ascii?Q?yisNOsBd4HqXHpR2KQsWCk1Q+dk38bWCzOmDsn4erRAmXhHNp+RR8Fqy8/Of?=
 =?us-ascii?Q?2p7un8MafIwEPp83kTh9/iXNem5DlJNxdzy67v4wAnjI/RrRK3sngiChi0cj?=
 =?us-ascii?Q?j5/Ku41FlQK56e0v0OlIHRMnpYONuLxe8H764S4o6xRWXnsMAfYytA7xVPC0?=
 =?us-ascii?Q?T4oAhPgnl5+rkISSWGgD29qEWXhtebhr?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a0ce177d-29a5-4b8e-846e-08de0b063556
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|35042699022|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+nRLzbqkRH6TyBTZE0WKyHfN068Mk9CR024/WTmAftIjwYKcNBXbjcyPBRCW?=
 =?us-ascii?Q?5ne+XD6AwdUAPQ/NxixO77bm8Qxf64da29R7IIXikVtxg/X9KUnCjAl5DYsB?=
 =?us-ascii?Q?vvh6NyZ4floYk/h3D4EL1RKCxNvZbzeUzddsP7Z9x5KcYSfK+dZOz1gp0/ue?=
 =?us-ascii?Q?lgC4eorsoMbmiwN3QVXhxufLqoIZcFN5MWdpzniw4i3CWd0t77/ALmvp2dbp?=
 =?us-ascii?Q?to9lmiLoHFMswbxS3YT3FkKFmMcB5NQN4iV4jAVJBHt06Xkz2OfXcX9qm70f?=
 =?us-ascii?Q?N+EbGs8WRgXzDt7FSARSrzVEh19H44aOIMTH0TJXmCS9hvBiy6sqHcAZIYYA?=
 =?us-ascii?Q?OoLLRvcH+oPyCfIfGC3p4NYHKeEfdwGwjknkx9vOzwCQrpx0mju+tesoRbIA?=
 =?us-ascii?Q?echZwxaohYn3UOteesyebIwGmQgjEbBugYFTWNmSMmlEJzRqJjCPZ79WCiFu?=
 =?us-ascii?Q?ogbkTtDU5oWwWkHYWVgit+Sm11nPnE56LJExrbGSiaAErl/gczmhga5YlVJ6?=
 =?us-ascii?Q?KgZIIjZ4s9lDpp6nU5CwHF1dwTgr4HMyqhPQBCnkBlHMo7AEe6+SuNZ5LO/F?=
 =?us-ascii?Q?Ct4PWkiMOwYTDuDP2rQIbBAhZ85YdmnpKoKvUIieprJy5wulUGtpB9GkaRGq?=
 =?us-ascii?Q?RvBn5DDLyxA1WZ0EnhB1A6oGxhoh0MkJrAnGRQNoXRxsUMXbNiwU2MDpG7JZ?=
 =?us-ascii?Q?Ibd8Gjl0k1RSoQwYsAeg+ZiYbgfoAAApvbkAzQsBf83wBNzJNAP/iuh4h+0R?=
 =?us-ascii?Q?hNfTUG3x3movWCCB52+SP2cC6p1aE4FZxNvtFwlLT6p4oc26cG49HMBWTeQK?=
 =?us-ascii?Q?N5wQM/IIQ38YU/mObE9IfHEKxdjxwGX43VRKGIK1Ty2yg7frmBo5+AJCuHsC?=
 =?us-ascii?Q?HJcWNdqJbUnkmrY7QrGh5JeOeVBX4ZTjHLuWOnwjBtbkJxVEiJ82MkmxiTu8?=
 =?us-ascii?Q?EsIm2PEOoQhT98mVM6ir9fB5d7qbh7OAbDcU4wPqEV/V+U5GEDdrxxNlZfRq?=
 =?us-ascii?Q?hSQKOvnBWAwPU0xckQ8AZ+7ctPMgXbid6GOPJ/jym2dOzDPykhkd0WfqBCC0?=
 =?us-ascii?Q?U/5zyaXTXKBi3jwWmkgmcgyrJvcor96IgADLPa2xpdCyHRug6e7adE8wTKPo?=
 =?us-ascii?Q?XT2cCi0jz4ADMZHEtpvjeqnOset3Pz6lSo/87sJbWFEX9zIA2c/smtm0lPb1?=
 =?us-ascii?Q?OewKJsl2rbsRNX4DdHGjHVInLuiABsH+uwfr0GLMsxbCXMo4iZxQ4YT0UCRH?=
 =?us-ascii?Q?jyLrQQ3jhYPVT2HJTfeuKsGNDD0NidK2/TuYqu+27+AvpTnfnT0SSRdMpnWf?=
 =?us-ascii?Q?MciympbAG4VyWIM9bIRsN+uvQh9+0RBkiBrFUK+37aP8hGMcg66ONWqOmtQF?=
 =?us-ascii?Q?Igpq5sie3VsCktJynQKUvPcKnNnAla/0dT/xwbql7MvPU1A8iG6Kl5qeF5w/?=
 =?us-ascii?Q?oRfKa39Cqf0TNbQO9MJoWtUecZ7wBoL89cYCwPV8MDGs0avDNod18TNNzXhE?=
 =?us-ascii?Q?McKJ690ELLvTNIpWQJiOzelB3HU94zkvdR7YymE+krtFYtaVCnu+nNA7XxXA?=
 =?us-ascii?Q?jIM/Zl5dPr8Ii+2s4/I=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:35.7796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb51c262-8d76-43c9-a216-08de0b06492f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9010
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

This patch adds the framework for binding to a specific panthor_hw
structure based on the architecture major value parsed from the GPU_ID
register. This is in preparation of enabling architecture-specific
behaviours based on GPU_ID.

This framework allows a single panthor_hw structure to be shared across
multiple architectures should there be minimal changes between them via
the arch_min and arch_max field of the panthor_hw_entry structure,
instead of duplicating the structure across multiple architectures.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++
 drivers/gpu/drm/panthor/panthor_hw.c     | 49 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  6 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a764111359d2..1457c1255f1f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,6 +26,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -122,6 +123,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @hw: GPU-specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 326a9db0b5c2..b6e7401327c3 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -8,6 +8,28 @@
 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
 	(((arch_major) << 24) | (prod_major))
 
+/** struct panthor_hw_entry - HW arch major to panthor_hw binding entry */
+struct panthor_hw_entry {
+	/** @arch_min: Minimum supported architecture major value (inclusive) */
+	u8 arch_min;
+
+	/** @arch_max: Maximum supported architecture major value (inclusive) */
+	u8 arch_max;
+
+	/** @hwdev: Pointer to panthor_hw structure */
+	struct panthor_hw *hwdev;
+};
+
+static struct panthor_hw panthor_hw_arch_v10 = {};
+
+static struct panthor_hw_entry panthor_hw_match[] = {
+	{
+		.arch_min = 10,
+		.arch_max = 13,
+		.hwdev = &panthor_hw_arch_v10,
+	},
+};
+
 static char *get_gpu_model_name(struct panthor_device *ptdev)
 {
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
@@ -116,6 +138,29 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 ptdev->gpu_info.tiler_present);
 }
 
+static int panthor_hw_bind_device(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	const u32 arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_match); i++) {
+		struct panthor_hw_entry *entry = &panthor_hw_match[i];
+
+		if (arch_major >= entry->arch_min && arch_major <= entry->arch_max) {
+			hdev = entry->hwdev;
+			break;
+		}
+	}
+
+	if (!hdev)
+		return -EOPNOTSUPP;
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
 static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
 {
 	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
@@ -133,6 +178,10 @@ int panthor_hw_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	ret = panthor_hw_bind_device(ptdev);
+	if (ret)
+		return ret;
+
 	panthor_hw_info_init(ptdev);
 
 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 0af6acc6aa6a..39752de3e7ad 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -6,6 +6,12 @@
 
 struct panthor_device;
 
+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+};
+
 int panthor_hw_init(struct panthor_device *ptdev);
 
 #endif /* __PANTHOR_HW_H__ */
-- 
2.49.0

