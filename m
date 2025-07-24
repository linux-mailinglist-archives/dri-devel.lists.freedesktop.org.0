Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC0B10601
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A3910E909;
	Thu, 24 Jul 2025 09:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="CwQR2sXM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CwQR2sXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012006.outbound.protection.outlook.com [52.101.71.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942E710E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:27:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=om6/135OfwVV885/Ek4AuxPG/tC6lu2kEedMLmpn/2EVjbY2/qLC1brBHFfnZCi98RdyZNWtONanBDm2YZlpLikrLd30A+Jj8w9AL4CmmrVenGQhL7Vs1EnujrfU8GbntXgwQNtj2RNKb/aJHN1S6eXhRZ+gnywwej1xV3efbMB/I5SMEJ/CZHAGr7eOWX3KY09GYBHnWZTgftPUZ2tPTHEZmSCcRZ23vFBbsYZnIe+4Zs3jf25ceojhPJtFBiBAb/gPrHqZ6C1bHjlzTOlUvyF193m2SA3fCyhLXt+9TwBjH6nsaLI/3KM2jzA+umKpjRHY7nIOTirIVlL/axPKBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6w4NmSCY0O02ZcmBXxClmrkRf+IUmCfbsHVAaXx0MI=;
 b=M84NrEbSGaImP+UuEbC8VyO6lxESnRqfNFzZQFRUyXocL+uj9fx4FVZcAMPRioctCCZ7btUVxCzq2OQpr94liPbvdAMtcJn+BkN34Vf2rh8wojDg5NpYQCtRQU0iMIElJL9gHxryisXL4DrAOa/9wWZJcl4LBAe2UJgqbr+xUZ+B5cA9a4tsvILYj9xbymT5uo1FBJ+neMKKrR9XV8C7xJ/RwCXRZGc5iF99M3IDtPLoDLe/Hu+e4AYPOQg10sBg1rbmefLm/y8WujgOuVzS+TVaoZvGUlxntmVXeNItAkZfucyafdNc9ClDQ4k2O/gU+iLmdNC7Z4sN+akt/yrnxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6w4NmSCY0O02ZcmBXxClmrkRf+IUmCfbsHVAaXx0MI=;
 b=CwQR2sXMUpB8EBrn4/m9qoZ8/lZ4c7NKD8E9lxNl1kaTXXYN1bGxwXFJ4pb3KhkMjHxbHW5TuKdfAXFwqE6widlDfEogBNuMrj5c0kG7JoXkJ1I6nJSc0lF3T9Cdsa/+vogXJUigGsZEDcE6nGF0tE1PipXLcsq3MSYY/1uc8JI=
Received: from DB7PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:10:2e::35)
 by AS2PR08MB9449.eurprd08.prod.outlook.com (2603:10a6:20b:5eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:27:12 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::f9) by DB7PR05CA0058.outlook.office365.com
 (2603:10a6:10:2e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 09:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 09:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRrxswgr88Ry0iqoTfqah1P8Da8CX0UkiUaWpVBsZYzoCti6S3XFNpXOc9407KCR9yfe2JCWu/D80qo07pZbCSr3LCSAOS0gAnhpuoWNyhI8HmOje2H4SbV2PmDSB/2qYiQ9KoAdXkCe/1P4X7+ja9SB8D//YzdN9rDqc0jIntTr9WXOMH6/FXvjdiGJhDp27QFX2Av+U5ri0xfVqGvE5e8QxL6ajvkQ2MnhQOKz+jB7ToG06kNFOpCMdnT/jewquxvQMbDMuBfKCj44h3J8QHS9UNKLLc1z+Otqhq2T5MqTjJ5x3tqiseWUPU3wTNS92LgOhdhafS06rvCTbDHCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6w4NmSCY0O02ZcmBXxClmrkRf+IUmCfbsHVAaXx0MI=;
 b=PADCE4r9UC3k+2Jn95Y6kVSx+k+QTr4FLQDJLIali3hw+lkVp8wFyIBa2VZdB542VCPtgTlq+fHpZxyTDSyXHaP+K1Zc329k+c8LgGqffHT/7aDEsFqzVg3CrDCmicU4wGINRUxhQgQcKDv0pEIy9WXKvnAZZauFOMm1zZIXwI8KxTAFKXYfR4drytHuSLdzG0twuRfCsdMRGcc5Ukl9ULNfM3tTRSP0cm+cipmjQ0ABxe9lFvaXvuZXlSt8xUImHV3rfkHcKD6ubqNHN6zwZajlcKnSP6Kj1ArzPUrGKiLBGDq3+bHYv1vqI0Rd7AaTT4KguyREZBi5FhJ9TWfI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6w4NmSCY0O02ZcmBXxClmrkRf+IUmCfbsHVAaXx0MI=;
 b=CwQR2sXMUpB8EBrn4/m9qoZ8/lZ4c7NKD8E9lxNl1kaTXXYN1bGxwXFJ4pb3KhkMjHxbHW5TuKdfAXFwqE6widlDfEogBNuMrj5c0kG7JoXkJ1I6nJSc0lF3T9Cdsa/+vogXJUigGsZEDcE6nGF0tE1PipXLcsq3MSYY/1uc8JI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7951.eurprd08.prod.outlook.com
 (2603:10a6:20b:577::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:26:39 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:26:39 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v7 2/6] drm/panthor: Simplify getting the GPU model name
Date: Thu, 24 Jul 2025 10:25:56 +0100
Message-ID: <20250724092600.3225493-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724092600.3225493-1-karunika.choo@arm.com>
References: <20250724092600.3225493-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7951:EE_|DU6PEPF0000B61D:EE_|AS2PR08MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d34ffb-332e-445d-1f36-08ddca944524
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?/GcOSCHUWNY6BqOwhVyTwuN+z5O0gZarwAKcddOcKhhkak+7wOzMezbNORDd?=
 =?us-ascii?Q?P+ZtjcXZ+62+sZCUUodTSvTv84+jTSBwhDJf4gNaERYEoBw2YMECGchKEdtk?=
 =?us-ascii?Q?4FxqVg4ca0S/WEhg+MMWP3VSYiOqSNudEm1Y2Lgk+80zQz65zS38dCXk5rQt?=
 =?us-ascii?Q?peVyf0opt8DRGQzl+RGIGSutUD9sk9a8ic1tYuL1ESigdbvj1vME4sj7ud5B?=
 =?us-ascii?Q?RUBf57NWzuCZO3YZoKyiddFqT98A8kQ1zc6XpxAXhNt9q2n8pIGrPSMg/Ttl?=
 =?us-ascii?Q?nivF+w0iY32oRKEL0ro0dVirM1x0v1MQOPOguii4bqKgfXqBSlkkwRA/XueS?=
 =?us-ascii?Q?Qx2JsrtC0dJ7kOTo2BO8MRXOyhYIUMeb6cU4FGazeo/hSuhljqnNSW9e6iAA?=
 =?us-ascii?Q?Yo4DKtALUXFsbZoMT6knU8SEcBDCLw08zDNS9+mXCb9SsDjoKuFEmrG6qYDv?=
 =?us-ascii?Q?9z1KxtWnSAdgg5109VqtF4jo4CZ265/RAB1Vi7LL74TEQijGAhQOuZn9AjME?=
 =?us-ascii?Q?wzJiU4CSv3MuXCzwLnImBwhcE8STBOlrpJlhkbdjocgUHu9Cgje/oG9GERUt?=
 =?us-ascii?Q?c4qi4KgwbRHvAMlLs64uYTYKiR8SuAHF2grVyMCUuPjGLQMbMztZvK6wfG4G?=
 =?us-ascii?Q?N4SdbeAoFUgLX2PnzgvGeNGMNuTo/Oi2/+XZ6IVXv2vEqgOMKLu4+CMLnm8Q?=
 =?us-ascii?Q?LWwgYDJL7y0FuOe7Q/U/454Y6kmR5MkVpUa7bwop6SXsghF+AzxG7ukO34Pk?=
 =?us-ascii?Q?6ik/LD1P9aFV1Y4/jyOzoe3HhgN+XwOWtlR0GVHihomx/7/33vmZQXVnzISw?=
 =?us-ascii?Q?mz0q1ajK7fKXDmZh32k1WDCOd6wEvDVzN/3+ajBc9k+TyjGlWixB/gIJm7zd?=
 =?us-ascii?Q?7XQz+LeO4XQkRHO0dcFEwfXTcoe0lmFWyTI7NEd6ptDxKW3UeXBaDnaVzRoV?=
 =?us-ascii?Q?NyeWnmlAG5udZjSOr/9tjDMJ6vXFhBEDBgKKgIt6Vp16rx/5GWUoNiem0Yd+?=
 =?us-ascii?Q?nFldwUZKATUYEsh0iZl3PZbIhomqWTnaj+vf2aNoGDjdJHmS9X2cjyNQ7VYR?=
 =?us-ascii?Q?mdvNk5LRRVrKECttxqHk1zNunz06GUL/xMEsk6SO5qHl4IG/RGTVDp5Yev0n?=
 =?us-ascii?Q?2Div7ItcLp9LtyGIkJxmzteA059EjwHoO6f7wnN7iv5oy9IN63iJHtkhtuVB?=
 =?us-ascii?Q?EzBzB+aKhGeSJM8v/HUaCnTJCIIhs+EskUZyyDVy+MiCwM5FReKDg5YoOaRt?=
 =?us-ascii?Q?kROhN6z67HwD+MAgfXqsUGU3rM/m36oJqgsVyO973MNwUwfxYQBZU0cKYsty?=
 =?us-ascii?Q?nuBMNuMhpF4vLFyVrbN5v22cSVXAfnHwBC8I4eYdO7PaqkYGIlzXolZN1pzf?=
 =?us-ascii?Q?OWHeJeAgbmt9sBsSBYK+Q1Pvx7BkXdRx9gUskPkqoO6OC4hzRQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7951
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 37b8ff05-8273-47f1-7b59-08ddca94318d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WvmuyuvmMcTaIZgSa70VfvIYoC07Ucp5C/2q4hAQognKO0zn5LzvD0ky6I/i?=
 =?us-ascii?Q?L3BoNrrYCAcarceJQTQgO09TXVtr+CogJd9j3svtXUog9RHOr6CVJzT4d+oj?=
 =?us-ascii?Q?wRzjmd2OpDnzMJZsX94k7pXHdXZCrPoLX1+e9/edXFhoE2zzTDJsWKPGFwbz?=
 =?us-ascii?Q?oMj9XNdT98VL4WCAco8rxSo78/cKwDOxfwgwuJzbCNfWu4phW84OYki7Y/xV?=
 =?us-ascii?Q?p8pN0FVSIN5aqVgBXzRTLniK/ZkFNi/jLoHrejdcwyn5dR758yJRjpSteLli?=
 =?us-ascii?Q?/mWmpIve+yDd90BqIqb254VmJrAnaqKqtzqTwJZYRrv8TiuLt/I2pP8NvvPr?=
 =?us-ascii?Q?scMf8IFni1c5bDGgIJIOjsMtKzoj+ZPTKM913l4+T6uEHLH6aRfkSV0QjoBb?=
 =?us-ascii?Q?ditBJVIFVTzpySFN0QksNzYUzUMnG1UiFA2OEmT5K8Jhe2V6YR+FCAti6KBO?=
 =?us-ascii?Q?WiPxDgjXuWMqA6kvd6kBz13QtCHdVCW0ojHdpIt54M1sI3pV+CJxEniiILOb?=
 =?us-ascii?Q?yKEIcNRYk6MgcsQZ+3PbCjhCo8VlkDh4c0Pu20AVD3uSDmeKoQ4eY+6yKLLh?=
 =?us-ascii?Q?DLPz1crTCVRuxm8xnwuwDwF4DJlslcBK2PVxj0PRvf9rrBairXfXlL+p3H9W?=
 =?us-ascii?Q?QBHSAkmEJGezi6FIG3yq2IMD+km5wkV20VJVaIsirz07JCQvTXZafKggvrVj?=
 =?us-ascii?Q?lpOS/dr217gS5MXgKdo+br/g3NqBBN1fIQSIKQb8xWhx1zDtxK0m2OMvz1Y3?=
 =?us-ascii?Q?Ki1mJwvLfGA123b6oOJLeqS4yTRlsH0hvHIjUMbbbAv5rR92iI/W7iE1FEGT?=
 =?us-ascii?Q?JKHubsnkM7pby8EEqFDdZjfYBkjp/pkptu+LlVm9NXGwfn7XkV6su1IIoBp+?=
 =?us-ascii?Q?Xs7gkYHZFqjFI0jCnMrU5L3d8Lz2TcGW6eKCQxMHVcA0oKKl8XvsMlLMcMS5?=
 =?us-ascii?Q?dQCkI5JBl3EE9wTS7M+lYDcim/oLdDHTT5oX6cYeQXtvivYjExw3m25NFs5B?=
 =?us-ascii?Q?astrt8+GVbTx0nsP3tzNr7aKuLVFE420qXv6rFgwkCz8EFj74t9d/1E4CucC?=
 =?us-ascii?Q?6fhbdnKadHETYswK8k2verCniAIOpyNnQLExwXJYo1jPU8Gm/J/WMyAo5Zaj?=
 =?us-ascii?Q?YNLqcUc3kvpmdNB3g0gmLt1GlBSxYtydslWmcOLTFVWdeEI8V0f75g7FBm1d?=
 =?us-ascii?Q?cO0fwMP4i+ziAQNPrnc61wt28vCKSSOsmN6UqOEKH9lujrCBUPCIyykH/eRy?=
 =?us-ascii?Q?KZaX+wrntfAid4tEP2+J2df37HC0zCo+FL1+jrIwzVoRwgrgobtgOO2vo3Ag?=
 =?us-ascii?Q?C1ad1bLycZcxTtMHLToAU3y9tQQdcQS8GH3+jXv6if7xxUdhbxM9GxByti/T?=
 =?us-ascii?Q?NeybR7obWnDw0yeYcaQq0VyotGM9kfwFCeLAk/9tHsK0k5tdDqHKVsJvOa9X?=
 =?us-ascii?Q?aOscrIPaG6CCC1+y1f7mYwKZUOCKScMJDC5+0THvNgMRh4hXnGYbkX+dlqsE?=
 =?us-ascii?Q?WSwdOVY9rBXqFX9Bub3C7e3jPy60lLyMCLxQ?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:27:11.9452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d34ffb-332e-445d-1f36-08ddca944524
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9449
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 61 ++++++++--------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 3f7175cb0ab4..f39010c0ca86 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,39 +5,22 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
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
+#define GPU_PROD_ID_MAKE(arch_major, prod_major) \
+	(((arch_major) << 24) | (prod_major))
+
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
 
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
+	return "(Unknown Mali GPU)";
+}
 
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
@@ -68,27 +51,17 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
-- 
2.49.0

