Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDACBF5315
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F0310E58C;
	Tue, 21 Oct 2025 08:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ryvqzO8n";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ryvqzO8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013047.outbound.protection.outlook.com
 [52.101.83.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BD910E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:12:30 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tPE1rZqsEGmHq/r4YFNz7XX9eKjmDiuVQseyxG2mXjJPFmWKdIuW2V04O6jYC0jARGFCck6STDhEf3XmvbdQbpX6Quq6BCOoqc77dfg3Iz9Zqy0Vzc0PkJjDoWpg2dNU27A8FszCXmktU4ev/OTYNE5kk7yOKVgQ/eYXndXOhaAjEngEwcIRdrpJhnEpfid8tjzH0r7gA2VA9S5rrPJslkRB1N7J5rjpk7Pb+DNcRQA3JPWDITOOr6B2C5fuLLNtQngiyvj8Ouf19Ur0RBueqNVRrdAmmmUAAfxt8aMlhir+as2bvwTDYPHCtT16qa3ryAgkkmJQAniJ4M8f38jvDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDmmU8Vs2vhqi92nj31X4IkYCYIPTo7kcJzjeKR6nRw=;
 b=esbfY+ZD5UCNQH7TvQzAbXfzqumcMGs71kj2ThpkTJL0H8bmcO0vYdvSe0/uDIH33XYv8iVi6s8pgt9UFKWUCVRiREfa5MxndqXitxOzhx1o9YNiocXx1HZnXesOO+HzFMf7Tq3l+DtJs5DNDsncRxG/C3zeDiWyMqu3C7EYRBfMRt0L1xcaXbBxcm+j1W3DztTOaC0XEf6swQVl8qWKyHBt0LVY4lrnAiK9yA9Z3n4/hFDFOF+DrLlFl4kK3zD4eMDK+iklOaviIOa5BHOX7Ko0xwNcDxO/OJQKxD8ep62iuJJu7t6sLHawJWWf9H7r3ITcVLeKcm4ESATSRfLMGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDmmU8Vs2vhqi92nj31X4IkYCYIPTo7kcJzjeKR6nRw=;
 b=ryvqzO8n8kqFLaf1A7O23LUTmatPm7rEGtaodRpzqKmYeKw1SQH6EepSKoh+ZhdySJLiOFKdN1+dnh9jqo7+JDg2Lv7ku+Kris10DyiIa0khLS/w0kwkkwYyDnbRj5SaClNetlWwJjpIUuMGQwNVr3m6vEXGBc1GajgIh9T13s4=
Received: from DU6P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::10)
 by AS8PR08MB7717.eurprd08.prod.outlook.com (2603:10a6:20b:525::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 08:12:22 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::b2) by DU6P191CA0060.outlook.office365.com
 (2603:10a6:10:53e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Tue,
 21 Oct 2025 08:12:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Tue, 21 Oct 2025 08:12:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4aGvIEUYf557f0F/0Sak1qS8jH75mu+7mDQf3w1BaNyWBVbi4iO218casZlocko8RrJrBWea/pXI0p1/jAmbLO6l+ZS2c05mXnExU7S4g3qJ0afswB7VaqoJLiYJ+iD+gjvVhXLfmwfvFEk+hQD7kt6oH07NAJDUC+v6jFlq2iWyFFUYXXbRPb42qeJbEL35fmXF+xMx2uu1t1kiGnP8Ktf1QrSFFjp1uMPAyhfto3uoE92hW5NCM9k3WCUSjA2rgotji61pqvtL+eCiP+R25zaxlBXTjGmnTQ27RSlQgdzmv2o9ATAVONVgJhXoh68Y2ir2K+0I1/H1milK4+ANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDmmU8Vs2vhqi92nj31X4IkYCYIPTo7kcJzjeKR6nRw=;
 b=vKX0M6+PW/FPZwZTPu+e2mkbzNWb0lN7v1B6vOylXlRkIGDUcnOQyxe4d/pxkj22Ti9EVXiwPbrDJhgCnfZdhENewfx7ULo+j1Gw2xBVv3xPh1lo7Ogs4TMeHYSdQElt/R1KkubkRVC7ipEI8cMYogH1FDIIqyxW43oux9jbCOrEhKw7C1zBNNctMtF0t04Mg4XiXuqJNTIIHHMf/QLqKlHT6a739/qlG5PahJENwNx/84lMHmOrNSVt94pmEDrUA8gTU6pyTHI4INBYPboEVxwokA1TyV92x05MeilC9T9EC/Fsk40oJEBSambJv3HDRcvPwpGdVfnnVnsEjqx1sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDmmU8Vs2vhqi92nj31X4IkYCYIPTo7kcJzjeKR6nRw=;
 b=ryvqzO8n8kqFLaf1A7O23LUTmatPm7rEGtaodRpzqKmYeKw1SQH6EepSKoh+ZhdySJLiOFKdN1+dnh9jqo7+JDg2Lv7ku+Kris10DyiIa0khLS/w0kwkkwYyDnbRj5SaClNetlWwJjpIUuMGQwNVr3m6vEXGBc1GajgIh9T13s4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by GV1PR08MB10750.eurprd08.prod.outlook.com (2603:10a6:150:165::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 08:10:45 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 08:10:45 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v3] drm/panthor: Fix potential memleak of vma structure
Date: Tue, 21 Oct 2025 09:10:42 +0100
Message-Id: <20251021081042.1377406-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::8) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|GV1PR08MB10750:EE_|DB5PEPF00014B9D:EE_|AS8PR08MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eadf42d-e63b-438c-46c9-08de10798eeb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?YO48Ve+ALccJZBSZGRHWHTE0QymBT3dcldI+q2p1Qx2zj8Nf5uCxiQodc0Q+?=
 =?us-ascii?Q?o0TBuykP54ByW7e0HeKY4SaS28DDvAW6ncOvHeRIf/ymDQoT1ffLGznqLoIT?=
 =?us-ascii?Q?/dzvPyUPoxM5R8mzF2eItIKdVBiCK3S14/W93hJRBJi4cgiMXimlhfLjt+4Q?=
 =?us-ascii?Q?Z8sd9QcwD1i4Y6hKZzMXYv0MpN/bHg2Y3FakkOWJT6J+EaBQB8p+5QIKFnc5?=
 =?us-ascii?Q?3OwfAkdzmQOkL3uOpB1g0GuXOSDNhiNLAOGmYidkIONKAHrZBLJBpFadg7VQ?=
 =?us-ascii?Q?eeCBLKUfkJwYfqmsVzdzj51xvElLomJQrG7ikGUNkLXY946yJ1f+vyRA1XI8?=
 =?us-ascii?Q?0ZreXifWVWej+uxmz3pAD71o+746K+9aom1SgyqKro1EYYbhrW2sFUccRM8B?=
 =?us-ascii?Q?hFO5r1iQpffwT30jXl7e7zxALGmHZo3xJlzAqulXyksetT7pQJuY7D/EmrLy?=
 =?us-ascii?Q?MsA+0oxzSdx1A4CG7x1+KYsD54MbDgMFSMlr3MyhClslMlYTWRy9KNaqKCEQ?=
 =?us-ascii?Q?ZwxHKJAT0rvZcagQlWaHR6F7SUfv/Nz4q20DYXW/9cp12sU2jdDBSHwsStYs?=
 =?us-ascii?Q?Hd2vEOJKPIWdTWX2zyu4svjFWweuVuqrnFVyday+FyANVASYCrVE5QYLG77p?=
 =?us-ascii?Q?AhtHiWKSU81eZv4DhUDgWcbVQbsPzUxI8/RcVIN5FNrLpBwz28JwBwD9oaCl?=
 =?us-ascii?Q?mExKK+uOhCac0NBuzBekvRYVfWKACK/CZbpG2JOoRbVgSPheLCUyawQi2mYR?=
 =?us-ascii?Q?ne4LeWUl+anIVXDkH36cSCcqq9mIDHFXK8AvoZxLEZKZTJPKIw3zbU8w4/dF?=
 =?us-ascii?Q?Z2CSshlJu1Xd6Ckc316HlbuegLPLa896CVJ+drRw+n3OZIIQAkQ7xhFY1yKL?=
 =?us-ascii?Q?g3kOWm11bBLPPms4MIX/R9/Hza6nr/wWqQ3UYlVmZdWFRV11qs0A19TL4QPU?=
 =?us-ascii?Q?r/Mv9n4Zy2JIG9f7RRlM4E0r1gwZbXUE86qSLnd807t/sMOzEayfrNDTPEzg?=
 =?us-ascii?Q?m4oF5JPazHJs+87j8Q2ks0uq4/IOLKVyatX4FW7+pldOzdEzPaVWIZU2ytqa?=
 =?us-ascii?Q?8Z7IdwXwxyv8xOL44wJAXX9tDlDDKkIazrKXdG6jmA61RmA9SpId1k400Gqy?=
 =?us-ascii?Q?v5sNq53tehX7Cs1E+iaLKpOu8HuWqzTezAg7F7Y0zNIR9/b+m4pCTQMTe2gy?=
 =?us-ascii?Q?F6Cbg1Jh8QxTTAUzgd8Q86qyPFvBKLazSt11wzovMsmTVt/1deme3B1xm3Ss?=
 =?us-ascii?Q?y3CRW//yoO9wvnpUR4ciorlOaDony+rtmVgIEhVZbR1KX5i2oCL3j8Xm3eER?=
 =?us-ascii?Q?D2/9YrE26zH83aZyUqWPozUaKUFr/OmEX9Sfxav8dRsjSdZgJjG6ft1K62sG?=
 =?us-ascii?Q?dvXouXFgQTY2hTyCLSRxGGjQNFWMEiZe6BqO+qgMjTOC6xL1o50KpjhgjgA9?=
 =?us-ascii?Q?XYTRtdviHzc3jEqQsIh4rIYw0u6cWDYG?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10750
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d8d8987f-17e9-4555-8c97-08de107955c1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O7lVuC2ujaff2nH1cd1LYrCIVl8dkjehMsIsMfK2ul6Md1JzG4/1gYLU78Zi?=
 =?us-ascii?Q?4S9dsrqB+IJkYrh6WmavP94AnMmrW9v4uKVUS0TmoaQ8tUNOwuWp4rN4kbde?=
 =?us-ascii?Q?TULQfgx+KdHD+4mCDlMhgxgdY2LzRqanUUOesbkQZav1IgYd8jwd3tYaPSlr?=
 =?us-ascii?Q?Y9COpGr4bqk3IWfHlQ8TYsQxCrOYFmI7PYfDjlS7v0aMKdLL6TX7JsbtWmxh?=
 =?us-ascii?Q?og9c8GAVz6B4qVdpKSSX/9BwkA2IMVkvIHa335m+osx0yYwgw+P05K0ofG/s?=
 =?us-ascii?Q?ylZ208CeLwwFAdlief/3OyHxJTes9Aqcw+IJTyeAPawJuV0pKz+91PL8rb1i?=
 =?us-ascii?Q?gkisu8Hbip0E/Nj/aT7qP1rFAWb8sG3oGseZvxcNebmPwQvqrrNbT3sy4d8W?=
 =?us-ascii?Q?I5H+8tDt8S2HC7x3U0eu8FUCUfMjrRUiJn+0KtgmKwk5KFBO9SXVv/cp0cc9?=
 =?us-ascii?Q?6jN+JvKq9afeqXwrKQgfaE/vnnDFDgiyVIGuR6U+6WXh2vKnWb6lNXSxO5CC?=
 =?us-ascii?Q?JpcEvb02q1fnLi8VWK0hQHLQHu5Zi6G0wgn/ugmYyCQGYqi5+dqK1IXyB+Ll?=
 =?us-ascii?Q?KSyQSlnTRVXEUvHYTtDy6rHmnGxIuf6P7JXP4p/zjO5gHfmGnAj3AmET6lZV?=
 =?us-ascii?Q?tEUL7ySLcMn+QbCAbWhH0WT6PVb+yAuAmIUR0OIUoNvfytWY3tRGz485CCKK?=
 =?us-ascii?Q?drA0RSubjTMiM2SDc7rZ74ff8ehnWdpAgLTGd5HGjgHVGu5EnV0artZG6d9Z?=
 =?us-ascii?Q?9f2IIKVIx65O14/P4Qtg4fo2L9hGKHAn1iIwfK9/Ahr6tsVR0LHdFdwTcDGL?=
 =?us-ascii?Q?W7nb4fxkVknKKx+ZVqgB3+wHRd39HSA3cVK7GGQ9SX+EndmTF310s4U22B26?=
 =?us-ascii?Q?qg1cpNOnxmC2mAkwnGFMIELx7/ZmNSh4W/Xa8T3CMpXcK484g//22QRH3bYf?=
 =?us-ascii?Q?oesJH01QEXWW4gr8WProDgrtUbtkhYqIkClWjXmIaYfZG0VZ/pXE3jVPHZ3x?=
 =?us-ascii?Q?BwXoBTb6mz5QprXiuAGzZb7DUpUUL+WZ+cwFBHCr1WkmxzI1+5tfhuoyaFgH?=
 =?us-ascii?Q?6zRiIg2zS9pVbiJJvj9bpeqFe3AhaUcsWYCeQZmQ1B9RJazsmW0CfsPHd+mO?=
 =?us-ascii?Q?HXvJETaGALBeuCmvHH/lkyl4k2VxA1wUej52xP6K5tnX2W0TuaE1gSPXRuv8?=
 =?us-ascii?Q?Ct+6MidEggTE90OzHgodbIS3YPp6YBybtFkQ7tY9lUf3PwL/PErumhgZ7gvg?=
 =?us-ascii?Q?PMeJiTVtc/33zsNixICAiBsmoEKfdgnQOX47Wq+igaE886LjBGaLUAHF8lL0?=
 =?us-ascii?Q?QPDuuezSQPxqrlRkiF56kkS302qH/YL4PScZWKwkWn38spYJRKHx5MSUJtty?=
 =?us-ascii?Q?nPzHZ3Ww3AcWtUEyS2lGhUhR2z1rVl9whOIXiKv56u4UbYhDBEL3LKtpCF9x?=
 =?us-ascii?Q?HfX8KGa6d8KLhIAjGKAsGPCltTyadnodJ1DeCZrgZ5/czuZtPRA6M1iM/Lrz?=
 =?us-ascii?Q?T328GqmUDr0RAjqJw6axMhqIsp/0S2GHOaMlN5kk5UJU7z6Ozqghjyslw56b?=
 =?us-ascii?Q?tCmn2Hh3GQTSoHrhUSc=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 08:12:20.7016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eadf42d-e63b-438c-46c9-08de10798eeb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7717
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

This commit addresses a memleak issue of panthor_vma (or drm_gpuva)
structure in Panthor driver, that can happen if the GPU page table
update operation to map the pages fail.
The issue is very unlikely to occur in practice.

v2: Add panthor_vm_op_ctx_return_vma() helper (Boris)

v3: Add WARN_ON_ONCE (Boris)

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Akash Goel <akash.goel@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e378..56a53d70f3b2 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1146,6 +1146,20 @@ static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	}
 }
 
+static void
+panthor_vm_op_ctx_return_vma(struct panthor_vm_op_ctx *op_ctx,
+			     struct panthor_vma *vma)
+{
+	for (u32 i = 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++) {
+		if (!op_ctx->preallocated_vmas[i]) {
+			op_ctx->preallocated_vmas[i] = vma;
+			return;
+		}
+	}
+
+	WARN_ON_ONCE(1);
+}
+
 static struct panthor_vma *
 panthor_vm_op_ctx_get_vma(struct panthor_vm_op_ctx *op_ctx)
 {
@@ -2081,8 +2095,10 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
 				   op_ctx->map.sgt, op->map.gem.offset,
 				   op->map.va.range);
-	if (ret)
+	if (ret) {
+		panthor_vm_op_ctx_return_vma(op_ctx, vma);
 		return ret;
+	}
 
 	/* Ref owned by the mapping now, clear the obj field so we don't release the
 	 * pinning/obj ref behind GPUVA's back.
-- 
2.25.1

