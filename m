Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C18B1717E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 14:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715D010E273;
	Thu, 31 Jul 2025 12:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="pVa2CmRr";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pVa2CmRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD16A10E273
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 12:49:24 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dQLYkASyVQSgWy+IQbQbp4DluPYquNxMM2L9LaK8g8Sl8gLiro8Uddg+/HMNRHoy+/9Xh7pnVpEaCyqj6XZK3EELgBYdwUnyLdQ644hydKTIZm7fX4Ty1tsgnwKAEWsuCRCOTiOZsqUViVgSODfwCf7lxHkTbeqMkfgI1IfR0jPExp3Dx2KCKDvIVcjwUq6c/z8HWcazA2IzT/iBaNw7KiEyTZnKvMfiRQ6RuzcSVnf50DlyaJTOKATFcjYQJlqch4alVw8SCJP1DpEJ+36YM0K4XJwnjL8FTFFfbtfBbYQCsYEp3NZrzqEqOqlcGnrtjhhlRVgGebzAW+36D/z5Gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0gWgHxaopQCeljAwX2p59bBRgLTqlodmro//nHRUUM=;
 b=foeCEZSpNjQcR4o4zTA5SYMb8O3kWpmGGsUjYewFByIuf4BryizdOIETiI6JWiJuJxRvHR7eQ4U5WqrM8ahTpZfBIdb9pjKdjK+CrqIvlvxgp4Wd19xzEAOS6oRr657x99W6g/nB48fJlBCZEFvSZyeL+wMMumTTwGt/6RpizPU3jF+jv+bCj2b91R94N/me/sMBThtWJF8SdeM9qp1Jlk6475A9ug0eXvpdQlchh/5TGDyKcQOkym3NchWCeggLBWMeyBBuGPORuGZKytYfuit+F6o0S0invq3Lis9aFnpMAuVpoUOYf/79vakXgFhV7V20txPVvkJ9G3c1h/yVBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0gWgHxaopQCeljAwX2p59bBRgLTqlodmro//nHRUUM=;
 b=pVa2CmRrWTrvI4TsnmrW3DRZv58Cuylk2blw13drWkZPLekK2B/HW7Vn+UV8RqANKz3Eh4A8ATLoBAO/z0GGCVLslaTvW0wfSNL4oegTHGCF8A7TlC16OKp3Mh5+4xOUCdud8wCY+G51PRdV7DIrjaVl0NciY0Ek814WCbKh3II=
Received: from DU2PR04CA0296.eurprd04.prod.outlook.com (2603:10a6:10:28c::31)
 by DU0PR08MB9485.eurprd08.prod.outlook.com (2603:10a6:10:42e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 12:49:18 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::72) by DU2PR04CA0296.outlook.office365.com
 (2603:10a6:10:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Thu,
 31 Jul 2025 12:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Thu, 31 Jul 2025 12:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YW5bPG9k1R34yIDE8mXxQl+Y2YYEXmq5anzI/NU87zPp8NCObbjNQBZ14zzkQKJThLWtFf7bqpmZgvqUfCuO0A4g8Xx04/BEcy2Wy814QWZ1zQWDrOfAu8j0fOoQtNpvbsvLd7ero52fKsza+6fu2ORAmShRwK8tZM1GEOMvgr0j/DA8NX++hsRbqQLl++VoGnWQmSJ0SI+oMLK4O/qpq82lyL+4OVUANX/DdwWaxXjOk2c5Z1zuv2jo16U7FtO50YN3zYnXmKIraqIIOUqfUrGz0li0+YoKut8KNJK2MTF7zmqCE1YwmVf2Kl42t4tRpEvb8+YsI46Y3vMwIIPsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0gWgHxaopQCeljAwX2p59bBRgLTqlodmro//nHRUUM=;
 b=fcMPeRxtKcX01qTo657wXQANMbJzWqegcKQE1MViQeJxN/6jjvn9y4cCKjbz2rNJCYSWs/hSiobL9HvTok0KlWun7TGxX1KqF1zIAf9G8WL18p9mh0zSd0TdgSEJaWu7vPH6BBESdjbf1ORyW4c2K7zJcOCEKScAGeh0vROmjw7uF8e7W/4Unnh6TIlvSr8Q5Suj02BA4un4n0Xul4wha+s7W5sUN1Sq11/E/LQtshQnQYXwAps/CJucyRHtrW7A1Nh5TMjPLJ8Qf9t2R9+TXox9ST+zZGankiSkTMTsjcD2yPs9ZR/UdMvvKlKjTcCYn+k6eHZVddsnLHZkcMGtXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0gWgHxaopQCeljAwX2p59bBRgLTqlodmro//nHRUUM=;
 b=pVa2CmRrWTrvI4TsnmrW3DRZv58Cuylk2blw13drWkZPLekK2B/HW7Vn+UV8RqANKz3Eh4A8ATLoBAO/z0GGCVLslaTvW0wfSNL4oegTHGCF8A7TlC16OKp3Mh5+4xOUCdud8wCY+G51PRdV7DIrjaVl0NciY0Ek814WCbKh3II=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8640.eurprd08.prod.outlook.com
 (2603:10a6:10:400::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.28; Thu, 31 Jul
 2025 12:48:40 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 12:48:40 +0000
Message-ID: <216ebb8e-c973-4306-a748-a030eae01e2d@arm.com>
Date: Thu, 31 Jul 2025 13:48:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/panthor: Serialize GPU cache flush operations
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Dennis Tsiang <dennis.tsiang@arm.com>
References: <20250730174338.1650212-1-karunika.choo@arm.com>
 <63c7d33d-c475-448e-a928-570c6efe2387@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <63c7d33d-c475-448e-a928-570c6efe2387@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8640:EE_|DB5PEPF00014B8B:EE_|DU0PR08MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: c310c0ad-937d-4556-c8d3-08ddd030a9b7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MnF1QUtvd2ZmdGZwdFU0NWRLU1RGdjVtVmVna0x2M2xzSGxBZVNFT2gyVXdT?=
 =?utf-8?B?TksrZmRYKzZhZ3RSb0dJNE9wK21WQ1lIeWg3WVVMUVRwNmNVdTRSVXJiclJa?=
 =?utf-8?B?L2xlL1JmZm5QeGVsaTJEeEVZdStEOWJXTXZiNCs0RkhMNVhka3NKaUxSZEJF?=
 =?utf-8?B?N2xGVi9yTTRrWGpHWWVaT0E3d3lnK0pCN3FlT0czZmZtZFEzMzk4WkdWK212?=
 =?utf-8?B?NEp3QlBZUmxsdWRYMjhYWmNqWUNjbnYrdmhyZWxQWi9QaXJoclRoQUN5UXBL?=
 =?utf-8?B?T1dkbkpiVTMwN1JoR055S0pSemx3VmNYcEUwWm80YjM5V0o0R3RzVlBhTnNs?=
 =?utf-8?B?Mmk4a0lMN3hmOUpET3ppSGpQZWoySWhJNVVlVlJ3WUVwZmIzS0dhVEplTHpF?=
 =?utf-8?B?Z1ZpSlN4YmdiRjYvRFZRZ1AvNE9LWVVIMlhRMVFQdE0wcTVBb2U3LzBrd1pz?=
 =?utf-8?B?TUxtNk5ocTRLR2hneDk3WldTV0plckc1QS9BUlZJa1RWY0hybXA0RU1SSlAw?=
 =?utf-8?B?VTJCQ2RnUXBlSTJGb1hmZkpoYzhtOEpXNU4wcG5JNnprb2FKTCt5MWU5TzVO?=
 =?utf-8?B?Nk5xS0Rld1RQSkJ5MjhYNUFsSXQwdTdqZ0lkOXM0Zm1SSHo3OGl6THgvb01j?=
 =?utf-8?B?QTFINytBMHFibWdJMU5UeGxDOGgzbUE4Wm9XR0laTFJNZmxLcFpmcFlNWUdQ?=
 =?utf-8?B?TkhLMVoxTnRjMHlLMXg1TEI5bWxScy9xNW94TW9FVnlnZ0JFWit2cyt6aGxq?=
 =?utf-8?B?ZHBZTHhncGJMOUpsbDlMd1h2NWh2S3lDb2dYT1h6UGNSODkra1FkbGFkVnRV?=
 =?utf-8?B?K0NEV216RTJNRDN6YStraFJWRmdMTWhQVW8zdE0ycHkwTU1jWlEvZnhDY1kz?=
 =?utf-8?B?eXErdHJ4WHAyL3dEK0FtcEN2c2M0bVZPelF3RTE2blRnZXRtbENuSUN0T2FT?=
 =?utf-8?B?cXVtSVp5ZTdmd3JRWFAydktUR1Q4RGp1SkE1a2FxZDlnYmxEQXk2UG8zem9v?=
 =?utf-8?B?NXRWMnBMYkp0cHdhNnVkeEdlQW9adUJEYTFWbjV6bm9NVEhzNFYzaENjQ3V3?=
 =?utf-8?B?blV5T0dnWTdnZk9wb2cwNUVKdXRHN3QyTGl5OWp2QzI2QjRrRjRlQ2c5WUZt?=
 =?utf-8?B?NmxJY2ZVQnJSdy91eWlOSmVyRmcxU2Jjakg1cUQvVTRRMlcrdXdGM3ZrVkIv?=
 =?utf-8?B?STFzM1NDWW5WdVBPZkREeDI4NUoxUW9pRkdCME1sdVpydGkvbkVNYlkwdzVJ?=
 =?utf-8?B?Y3pEcWpsamZRdXpnaVF2YWlabE5BOE9nS2xPWjJPdzN5bzR3T1hURzczbzJT?=
 =?utf-8?B?V3BhM0dDNVkvRzNnays2ZVR5eTVvVEU3ZTlLNUMvbHZtaGM3MVRGL0g2SHJP?=
 =?utf-8?B?R2JFTzZjV3cxeWNqYmNDSWY4dVRuKzRNREJzYkhncUl6dm1BclNrcUFtZG4z?=
 =?utf-8?B?eE5hUzFqTE5FUUhHc3BIWlpSWlNhdHFJdHpSRDZEMkIyb0pWTWtoV2dnU0U1?=
 =?utf-8?B?ajFZZ1BlUUg5TTUzaG5TUFZQY0l1Q1lPblFSS1JHQ2lYMUNocmdyZVltQ1JT?=
 =?utf-8?B?TUszMkdhTkRKK0FPMmU2a0J1KzQ3OGNuejdxWEdqT245TzM1bFF6Rk80d2tO?=
 =?utf-8?B?NXdkc25sdk5pVFc0ZGQ2VlltVlloQ3YvU0NidVFWOTJEVjZZR25JR244M08x?=
 =?utf-8?B?ellNRXVaczhCZGlkbm85Z1F2Q2hNV3JrMFYrZWZiaGRPc3FabHAxekJuK1Az?=
 =?utf-8?B?THhnVVRDTHlnQlhjWHZxbit6bzA1ZlJUMVp3TXJnazZ0dGJDSC9saFI3V0ty?=
 =?utf-8?B?N0EwSE04V0t5em0xK0hneDdiTHdraWpoSWF6NU14QkpHKzd0ZWNtdGZJUXpa?=
 =?utf-8?B?WDcrUnBZRG9qV1pvQmNMQllJSzdOaDNIL2FPVXRRb2d3L0JUZk1jNVhZc29K?=
 =?utf-8?Q?YNCd+fMPCHI=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 215d3ca7-b9d6-435d-5307-08ddd030931c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVRSVXRaMkxhRW5NMjZCVWxtaFlhS3luVU1zQUtEWG5CeGpLVlBjbktrRTg0?=
 =?utf-8?B?U21nNWJ6Z0RUVXB6UWNid3E5U1lkaklVbVhhSjFnOGdqemdhT0FpbE56d1pi?=
 =?utf-8?B?QWxVVjFJYUZydkJKRDNVOVUxZVZ6N01uSGRvNXIwNlBuQkRGb3ZGeWlUdE1l?=
 =?utf-8?B?NWtPR210VE9ZUHlnVGRhUWtYN1BickdZOFdXNlRnSE1KK1Q1cVVBSWY0dWFR?=
 =?utf-8?B?M1VnYVRrZDFwYTQ2TUxkcThIVERveEoyQWFiekt3Z1dxbzVrUlo1YmxnVXZ5?=
 =?utf-8?B?VEw2WC9HWTFSOXE2TEZlbzVQTDN1ZUtMSFJmNk1NQjRIZEIvU2dwWU5WN016?=
 =?utf-8?B?VVVTL3VkcHhnYTZOakk3MUdKTWlUeXdvTmdlVmtHWEErVkxtVGtuU091c1dX?=
 =?utf-8?B?UVBUMlkrTGMzOEFOK1hiWWEvYlZSaG9IVkkvMFcrNHVpUUdVVjZxNjZXOVFL?=
 =?utf-8?B?QXpqeEZxbXZJVWxjbEZzOHZSNG1EQTB0QlhodTdxeldKZFJITGFacGNQT1Nx?=
 =?utf-8?B?b2ViclBCU1VkcXFkSkRwUGh2dUJvRmwzNi82SzY4RGlJUC9wRm1jT1lKdU5y?=
 =?utf-8?B?YXVzTG9yU0IxVHQ0TUlkUU5xeVJUeXJQTFZsTXl5YVkvWUxuUFBGL3FqVHF2?=
 =?utf-8?B?WmhUK1plK1lGSU5EL0tiQUpTOGRZRUMzVzhzOU15UWg0amJ2ZUtCaEI0ZVpk?=
 =?utf-8?B?bHM0NUgvUy80dVMrdjBQWVNmaWVLeVVXYVB3YzJnS3ZESzZtVlBtdXFWOTZu?=
 =?utf-8?B?VStTTXlwcmlKazBCVXlqVXhWenNQaDIybFBtZ0sxQ3VCNmdiME8yUlU4anBm?=
 =?utf-8?B?c0swN0pVYzliUEYyNHpnTlVjRGFVNGtpSUZ2WHEvK05icUFQbXM2RDYwbkhs?=
 =?utf-8?B?SldlSXBYZlZxMjdHa0Q3RjhtL0xHbjJWcWdvUzJpNmV2N1NEZlhuRGNDVU1Q?=
 =?utf-8?B?QXhSbmo4MSs3dW9uamJQYnRZcjJ5bWw2VW0ySVkxemc5aVV6K3lPOXE2eE5a?=
 =?utf-8?B?Ym9IcWoyOFBaSGhDZDdqTWRTSnN0eEJiaVFBakUwM0tOdVVQKzBXME9hWFVv?=
 =?utf-8?B?Uzl0UFJUdHBRMzN6TWRpUDU3NDdJL3BRMGhsbGFEUU9NSXNkaVRPUnl6NXNk?=
 =?utf-8?B?cG5OZmJSNlFOLzFoM29IRXdrSFVNVHgzcXozSGZ0R3lvL2puUzdweEprSlRW?=
 =?utf-8?B?QlpHYnFXVUdudDVGKzJWbTdVUFpVUmJiZTdVZ0k0bUo5Rm5SUUNpenU5dktu?=
 =?utf-8?B?OEovTmk1SS9PYlB3WW84bFEzQVo5RkRkT1pMN2RRNDVKWFRva3AvZlhIVXNT?=
 =?utf-8?B?emZOTzAyVFFRZkhSMU9YbkRzcmEyOFl0NlkrTURYQjI3V29kWVdldlN2dUJl?=
 =?utf-8?B?aTM1N2F1dURXQi94YTQvWFNuWFVXUDZBSHRMb3h2RUh2aUhoVy9qSzJQVndj?=
 =?utf-8?B?R2l1by85d1B0Q1dJQStZcTBYRERNcXJ5NkdGeENTMjU2Y0wxQ2lQRkhObWQr?=
 =?utf-8?B?RXZHeGJ5dFE3SDlWc0JWVjEyNTRtdHNvalpzbjF6VTFHTlZ2ZS9LMkJZY1B5?=
 =?utf-8?B?N2RydEM4Nko1UTIwUEpQQmY5a3JiMTFZK0g3aDg4Mm9hd2xxVmVQOHVQZnZt?=
 =?utf-8?B?TDFxRitGUktlZWQ3NHV2Q2J5MEd2Vmp5Mk5NK0kxeUNCcHFOczBicnUzVGJr?=
 =?utf-8?B?ZjB4dzFzc3Baa1l2bk5qV3o5a2tIUW1oY0g0bU5WSGI4M0RidFdLV1ZZd2pz?=
 =?utf-8?B?MzRYUzRsSmFhaHNuaFc0Yy9wcmZseFZRZWRtWFozbkNxUkNCZTlVQ1FOVEJr?=
 =?utf-8?B?cDFCbUZZc284TzdRQkR2SWxCMDdCWFFkSFRGMGsrL28rQThKTkg4VHMzOVRx?=
 =?utf-8?B?Q1pCOWUva0dsVEtyUXVacEd6bTVsdlBoMXNSd2xSWTh4ZHlUb1plc2d6dFlG?=
 =?utf-8?B?MzIzUTNONkZmOWNOcjQrcldaTGxNdGdNZ0hQYjhqZXJYWnZxVVAxb2w4OTRV?=
 =?utf-8?B?YTc2aDdrMnRGMko3RGdUZE03RDBZQjVWUklhSXV1T01KS3dTQ1d3SGJseUc4?=
 =?utf-8?B?ck1ZNVViTldxMnBQdEdraG9hZGNMSnBUVjF6QT09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(14060799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 12:49:17.9901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c310c0ad-937d-4556-c8d3-08ddd030a9b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9485
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

On 31/07/2025 11:57, Steven Price wrote:
> On 30/07/2025 18:43, Karunika Choo wrote:
>> In certain scenarios, it is possible for multiple cache flushes to be
>> requested before the previous one completes. This patch introduces the
>> cache_flush_lock mutex to serialize these operations and ensure that
>> any requested cache flushes are completed instead of dropped.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> Co-developed-by: Dennis Tsiang <dennis.tsiang@arm.com>
> 
> A Co-Developed-By needs to have a signed-off-by too[1]

Oops. I can push a v2 to add those.

> 
> [1]
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by
> 
> But I also don't understand how this is happening. The only caller to
> panthor_gpu_flush_caches() is in panthor_sched_suspend() and that is
> holding the sched->lock mutex.

The fix is in relation to the enablement of GPU Flush caches by default
for all GPUs [1]. While calls from the MMU are serialized, other calls
i.e. from panthor_sched_suspend() are not. As such, this patch
explicitly serializes these operations.

[1]
https://lore.kernel.org/all/20250724124210.3675094-6-karunika.choo@arm.com/

Kind regards,
Karunika Choo

> Steve
> 
>> ---
>>  drivers/gpu/drm/panthor/panthor_gpu.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index cb7a335e07d7..030409371037 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -35,6 +35,9 @@ struct panthor_gpu {
>>  
>>  	/** @reqs_acked: GPU request wait queue. */
>>  	wait_queue_head_t reqs_acked;
>> +
>> +	/** @cache_flush_lock: Lock to serialize cache flushes */
>> +	struct mutex cache_flush_lock;
>>  };
>>  
>>  /**
>> @@ -204,6 +207,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
>>  
>>  	spin_lock_init(&gpu->reqs_lock);
>>  	init_waitqueue_head(&gpu->reqs_acked);
>> +	mutex_init(&gpu->cache_flush_lock);
>>  	ptdev->gpu = gpu;
>>  	panthor_gpu_init_info(ptdev);
>>  
>> @@ -353,6 +357,9 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
>>  	bool timedout = false;
>>  	unsigned long flags;
>>  
>> +	/* Serialize cache flush operations. */
>> +	guard(mutex)(&ptdev->gpu->cache_flush_lock);
>> +
>>  	spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
>>  	if (!drm_WARN_ON(&ptdev->base,
>>  			 ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED)) {
> 

