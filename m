Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B21194BB87
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BC110E6CF;
	Thu,  8 Aug 2024 10:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="G+G6CyJx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G+G6CyJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C3510E6CD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:44:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YLfpdjppCoD9IyQQbmHLQ7TlADXDUXEQ66/u/BPk9D1j3BrW7YOOHhxWAggTwmYCvMDnC6vguI26i3m+MY41yn2AhZZjb3vw5Qy3EVO+byd3truRV1PDZvHqTmVuqsSo4gSe7Iw17d6nQm8/rl8DFRGMe5S8aehxxzGRbI0csorfGjQdi7b35OIYX8NiYgVqIjuE4/qPQvUphdFeyCVSbJPUEZpoo+q6JiMLtop1cgydQ1ffC3PrBPmt1lroYqUDUqW2UBB9kqdKQDCovZzAVrm9c6JZhBxYLtGkdtDp2O4I7HU8u1HGAulGss6joId6M5kYdsDx50Me6V53Y2pz0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjrEQRszpjdpC5DlWlofPLq9rFsTvc08FV+A6Sfl91E=;
 b=tjIERyow34lS2ONHNvf3MY2BO4woVEXO+wdqO7up6sQvLRlutmArOjS4i7u7IZvMP/nX9Al0K8PL/h9PGvuY6UQYhC+/T+6P+ReUXt2Oy2vPXy5G7WIT6Zcm/tYpnLyzbKwSQsrDfpMIt+eEjrObQccdxwM8LjvBf8snTNGveGstbZJCs1zoz426WBv/agXHxmC6jjL+oQiYnzQR763QMVqLd1gm+zUWRkkFKgA2M0rR8RxuPXSX2R68ROhBO6Ova6gB0EB0HLLDHE6pb8GjqdnUqkigtSLcl1BdwwJB9GJL7rtRcTq2BkoQboMVbasNt8UXYdIWi03KGn9i6BlPxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjrEQRszpjdpC5DlWlofPLq9rFsTvc08FV+A6Sfl91E=;
 b=G+G6CyJx/s69bPCygAksRBUCtQhGQVhIlfig7KzZzxJqb1WXOdgF7N7bEs3iIbpOqW6H2m6CZ7153oO8m25SUKMtgmc5Ug6YfSuZaQ9yya4GdD6981rRwp7hhZTnBciPlKhABOs3DygDsFdLaVcO5+uaSXaeT9MPjqNVNzI0Icg=
Received: from DUZPR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::12) by VE1PR08MB5855.eurprd08.prod.outlook.com
 (2603:10a6:800:1a2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 10:44:11 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::83) by DUZPR01CA0069.outlook.office365.com
 (2603:10a6:10:3c2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Thu, 8 Aug 2024 10:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Thu, 8 Aug 2024 10:44:10 +0000
Received: ("Tessian outbound 0842327a015a:v365");
 Thu, 08 Aug 2024 10:44:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 855aaf70e9152197
X-CR-MTA-TID: 64aa7808
Received: from L45cc0c0202f9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98A3DF7E-DCD3-45BB-8E45-F5379CB850C4.1; 
 Thu, 08 Aug 2024 10:44:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L45cc0c0202f9.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Aug 2024 10:44:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lral1N87L31CKQeQwHlG5ytuE4HywX27cZAPvAdK0ww8Kb+YMcURzz9Em/6daHJrjoKuAerjfEg+uYDjztvPG+mMWHYgM7H09T6ksVo7bV+W0gtnPrucMKrw3+omY8z5xriZUC3O8HMeNbsCy3wYfr9bUCNACmYrKX0KP8vzuudpDo3KacWdvMa2+I9NiNEyIuqaoAoX+UE958xkJWQCjHUQEh0llaPyDOnsPa4wb0VOS17bhaTztHeehzEYtJ4Pcz1X91t+6vMyx9ZENk1LU8O11jAfbpEuIjjVWkVW4QaECaKm5L2QM7EHez2kzH/QuMhQt6x4gNXQ7kx1Uxdwng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjrEQRszpjdpC5DlWlofPLq9rFsTvc08FV+A6Sfl91E=;
 b=IcKEMMhWZwL1sLCwbEzYNwBx5X97mnWLIDdVkl8vq0PbpiR0ff5e5wIBWWO4xZ+HyLg+JRWj6qHtR5r5xg0jB61D0fXAInneXScowV0eV4pJIB+lPHRr36iB5YhFJ4aGXRSw6135YsoKBP/2UKHlJGwM2fruMCnJ85mTDWQw1gAOblhpFnSatTHuWLjkEA/gGYVlPgsbO4JEY8z4ljJDgEG6cmdFyHZpcB+sCf0qTDHBXHG5JSVVf75/m4qxkXt/b5O4PFYmapQIendZGWE7xpQXp9K8tDupjEy/7rcqWjKQelDPtt9ZT8eSWQydsDe5hOlMG5ZeX1slXOsyE/h3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjrEQRszpjdpC5DlWlofPLq9rFsTvc08FV+A6Sfl91E=;
 b=G+G6CyJx/s69bPCygAksRBUCtQhGQVhIlfig7KzZzxJqb1WXOdgF7N7bEs3iIbpOqW6H2m6CZ7153oO8m25SUKMtgmc5Ug6YfSuZaQ9yya4GdD6981rRwp7hhZTnBciPlKhABOs3DygDsFdLaVcO5+uaSXaeT9MPjqNVNzI0Icg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by GV1PR08MB10717.eurprd08.prod.outlook.com (2603:10a6:150:170::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Thu, 8 Aug
 2024 10:43:58 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 10:43:58 +0000
Message-ID: <f452327d-b035-42a6-8b78-d2d4d2c96e17@arm.com>
Date: Thu, 8 Aug 2024 13:43:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
To: Mary Guillemard <mary.guillemard@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, nd@arm.com
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
 <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
 <ZrSc87IA0U9WPNYW@kuroko.kudu-justice.ts.net>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <ZrSc87IA0U9WPNYW@kuroko.kudu-justice.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|GV1PR08MB10717:EE_|DB3PEPF0000885B:EE_|VE1PR08MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c812f7b-aa28-42f7-510f-08dcb797099f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?M2hDaWJkSzJjZGwwOVpzYVFLUTVVa0pQUFcrQk53YTU1bEtETWZqb2dHRDQ4?=
 =?utf-8?B?QXg1b3F4cGhwRHpMWE5Kazg2Y1EvQ3hXYzFZKzI3Y3B3OHJvem9uSTNBWTlW?=
 =?utf-8?B?NTQ5Y1FWWERPTmhBN1J2UTBSWk5nbnFWZ3lDS2Q5UWg4YktkbDNhRHgvUzVz?=
 =?utf-8?B?N04zQWNGdzZtcG4waFo5RHRQUVE1RUk1Wmk4SFJvemJCbGJhQklCSUZmbUMw?=
 =?utf-8?B?aytyL2xCcEZ5K09OdXdyYnRHM0Rad293RGlQT0NEUUZtcDJhMFowZkFKVE1U?=
 =?utf-8?B?b1Ewb0NieEtZWXdXSjdsOE0vd3NXYnZBa3dZelpmTGJ0Z3pzSTJ4VnBCYURm?=
 =?utf-8?B?VEgxSlNQR3dOZzRySlBOSEUzVFZKVkJoMzFKTGYvRHgzL1Q0MnJDbE0rYXFq?=
 =?utf-8?B?SzZ3RmZYei9Sek01MmlBcW9SQ0xzeHo5ZU5vam8xRUF2aGhyZ2NxVW5hS0tz?=
 =?utf-8?B?b3h3dk1GV004YlAzSmM5bnIvem5kRzB4MDBJcWNQcXlNUkpEd1V4UDIvcmpY?=
 =?utf-8?B?S0FvZU5UUzRLT0I1MTgrWkQ5S0tJeW14VWxsaFZBTzA3R2YzUVJraUx3bUtR?=
 =?utf-8?B?WWhFb0ZlTEl0WjBwTG1LdU0xc0R1Ti9OTmJlR250YmdaL1RZcnJieEZ6ZEFM?=
 =?utf-8?B?V0d5OU4xcllqZEpxQ0FnRU1YZ1VtcCtkaGpDS1MyQnM4bmZmaVI4dkduMkpt?=
 =?utf-8?B?b05nRXBLeHE4RGluOGc1dWlIZUxEZ0hpU2QrY1c4UUEvTWt4RExIeDZjTU5i?=
 =?utf-8?B?QXNzSmw5Q1ZEODBZNHhsOVZiVFFSaTlpTFo5VnFrM3JPemRleUVNWGdQNG9E?=
 =?utf-8?B?MEN0RldNNTU3S0U1TlN3RTByMUdEMFVaa25yMjF1dElha29FTGZMUWpEVDZ2?=
 =?utf-8?B?Q3pwOGVpSDY0Y2hPMU1pcDEyUlpYVlRESmpZZ1NQS2ZKcmFpYVlwWUFaNFhC?=
 =?utf-8?B?VThjaERMdVlWdUFLcitsWVhrVm42b0FZd0xxblRYZjMzUTBhT2Y3UTBKQkt2?=
 =?utf-8?B?NHFLaTdrYzlMdTl3YVQvQ2xkZTFzVXlzUzJEUFRmNDRnM2dlYVVkNEt3RkpH?=
 =?utf-8?B?Q1F4cW4wVlJpN0I1VnNRZzk1TnF3NjRvKzZ4ZEZzT2dVNG1QYzg4WXkyQU9J?=
 =?utf-8?B?RUI5NEplbDFUUkNkQTk5MHcrT0ZhbnpJeXViNFNkN2N4VUdxbXRSeUZVanJE?=
 =?utf-8?B?TUhGc3BrUk9kSUpIWWlHcEhtT2dzdmVpcTI5TStlcjhkZkZIWVgybTRndXdD?=
 =?utf-8?B?MlBRc0ZIUW4wWGsxeVNNOGQ2ZmFNUEhkTEZqNzV0MU0vUHhmYndyS0ZhalF5?=
 =?utf-8?B?UE1qeDNoc3hQRkZLL0lDZXJ3ZmF4UVF1K0ZOdWVtSC9FdzVKcWNsWWw2VGRH?=
 =?utf-8?B?WXRuRGgrRjMxMTdoQ2o5VXROdFJldWpZUmJSUVNOTGNZODVreWM2WlU1Q0dN?=
 =?utf-8?B?NXZHTHZFM0VQVjIrNmlUYTBWM0IzSzI3aTgrM0NMczlzeEpZekNMNVJqT3k0?=
 =?utf-8?B?RlpRRHIrSS83SzVDZ1ZYVjJ5ZjNzUHFucG0yZFp5cW80a3JRUlhWRjJvenNB?=
 =?utf-8?B?TmNHbTlrM0hrckxnUEhZS3BIZDYzV1pZL3U1VFFwV2VXL040eEpYdmNrbzA2?=
 =?utf-8?B?UUxqT29kTTdHQlhnOGpZek40UHh4MnIrc004TTJVcElvTmJ6UUdsbDBrTGZE?=
 =?utf-8?B?c2Q0VDNBbzQyUHlLNkNBRDlxWWdrd0FRUHdSanBtd28zamtTemxFamZVR3Vl?=
 =?utf-8?B?K3k2bFFRN1Ntek1KOXg4NkJpTTZKcmRNOElRYldGcEZJOG1ocHAreUQwVURl?=
 =?utf-8?B?QXlsTlYxWWtWRk16SWVhUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10717
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2dfd8a71-2c95-4bce-5236-08dcb797021c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|35042699022|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3p6TkNhUzlJemFEWjByd2YvbWJkazFQTGI4T3FsSE5pOG8rUERnS2szVWhO?=
 =?utf-8?B?UTVRUDFSSDVFOUQ3S0JOS1hiVkpOS2RVQXJpMWE3ckJBajJIdEgyelJKY0ZG?=
 =?utf-8?B?RERoOTNmSDFyRlVmU3NjRTVDR1V3ZFpBM0JxWVJudWg3TXEyS2dIT1hYK2Uz?=
 =?utf-8?B?UGlTR0kreXJhWEsxcy9idEpWdDV1Y0FYY08yWjFiR3hObEZIbGxvNHArMUQw?=
 =?utf-8?B?Q2REY0F3YnZiVXEwMk1mSUJzWEg1VkYzckhpRjVKZ2RycGtEWVprZzhkbitE?=
 =?utf-8?B?TE1qOUpUclFZaGphaVN6eG1RS3pyZXdqZWFtTEY0UTVLQ3pxQjlJWEUwWktn?=
 =?utf-8?B?bHJjaHRoYnBBT1ZJZWJuWXM4bitXUkZySFZqQW8yWDcycFVTay8yWTQ0Z3dm?=
 =?utf-8?B?UGFzblBRSGtMVDk0RlgzeEdGTitHNkdQNjlsdUJGejNjSVd3MW5TTHJQTUhY?=
 =?utf-8?B?bDBvY29JemR2THYyM1BYc3hwSk1yK1BEV2czeW1wMG4xRUlRbjl2dU1Jd1pR?=
 =?utf-8?B?MnozQk5mY05pMnU3aWg2dzRNNVRHblFnNEZ2d1Bod2xkZUkraGdBQks4QzJ1?=
 =?utf-8?B?OUIrUWpMdTUxUVJtdVU3WXZZK1hxczRSRWVZMW40M1ZzM0ZwU3BmUXJ2cE1p?=
 =?utf-8?B?TmtaWGNLRmF3Z1d6NWdybmZIc2ZnRjliZ1k2ZzYvRStQZGwyTkJpYUIrVU12?=
 =?utf-8?B?R2dxZ0l3bmx6bi9UOUhEc21OZklnZHZxekpuT0piUitIbGExREc5UW83SXl1?=
 =?utf-8?B?dTBjcmtWVUtsTTJDb2ZLQnVJbEM0ZUo0a0pzVjdNcU1Jd3JneGFiMEtKK3lQ?=
 =?utf-8?B?V2FOdlJMNFBldnVjOXFkemhPWXRxa1ZCMGZzUW44UU10ZHN6TWQ4NjdQYlpB?=
 =?utf-8?B?L1BqTlM4alR5aTRvMEQ5WnFmbGFpOFhDS2NEK0ZzWnhOdUJDZWdwc1lMcGtC?=
 =?utf-8?B?ZnVua0VaV0JBa1V2MlJ1d3FiUzYxMWxpRHVWV2s1WmRJVEJYVXFPVHJzaGFv?=
 =?utf-8?B?cUVOQXYrVUdBNFdQMU9UTTFJMFhvNnRTYmEzbzFtV1F1YmM2NWNSK3hteENH?=
 =?utf-8?B?UWNZa0c0TXdiK3dyRU1FbC9Tdm1ZS0pUdVFjb1RRYVNUR0dLSEdTY3p1NTBk?=
 =?utf-8?B?cjNhKzR2eDYzaG9MS1BobmpXWlhGSVUvajQwRzdjZENNcXFjUndxdjVHQ0pB?=
 =?utf-8?B?SEVhalorWE16RFBHWDZIMTVNME9kaVV4L1daaEwxbkUrRGZ1anlhNDI0eVRF?=
 =?utf-8?B?c0pXNkpZdHZIcndTZmV3SDBKUFZQU2RZb1A3QmJDdkZmUS9sb2l4dkp0czM0?=
 =?utf-8?B?c0U0cCthR1F2ZVI4WlZHS0RpK3NZaTloNWwvMHNDdFRZL0pyaDgzS0RtZFUz?=
 =?utf-8?B?Z0pnWmJsdVZMUkdCcWxWZ0NVay9ISmR5bitXSXVCaU1Yc3N0R2RrYmh3d3Fo?=
 =?utf-8?B?ckhtRnNkbWs4dDFVUVMraGlQWEZHMlFIcjZOSS9vUXZWU1VoV1M2VXZwNVl1?=
 =?utf-8?B?QzA1TXorQnN0cVNYWjRORGxIMVE5Qjh2WUZqUFdjdXRxczBOT1BsM3BEdzk3?=
 =?utf-8?B?TmV4UldMQ09WV3JxdnZ4OFA2SDJhUk1PNDB6UkFCMndaVElZR2NqVm53TElx?=
 =?utf-8?B?b2NNTFZ6NStXSDV1OTJ1OXV6d1NqanYvWFdrUlZrTlMxOW1OL1phcVZLTFpC?=
 =?utf-8?B?R3hoMml1SkhIS2phN013VHBtTm1WYWJZWi9sL0U3MWo2QW0wVkdmYnVCYTdj?=
 =?utf-8?B?a2sxVlFTZUYwTTdMZTNNRW56SDdvaDBqYitQazVPL1h3N2xrSllMa29YRlZD?=
 =?utf-8?B?WFBLN3llY1Jlb3VQbjJQK2dSbC9KaGgvR0lwbkJucU56ZkhNQUlmRmRWT3hZ?=
 =?utf-8?B?aVUrbzZBN21KMEV6cmtWMlVwSlFQWkNHRVNrMkQxbDVBNllaS0dGUFFSQVpR?=
 =?utf-8?Q?VLByTbU4VlVjT2CDX5mebhw8Cv0Tjhgq?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 10:44:10.8835 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c812f7b-aa28-42f7-510f-08dcb797099f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5855
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



On 08/08/2024 13:24, Mary Guillemard wrote:
>> As it stands, this query has nothing to do with the actual GPU so
>> doesn't really belong here.
>>
>> It'd be more valuable, and can maybe give better calibration results
>> than querying the system timestamp separately in userspace, if you
>> reported all of:
>>   * the system timer value
>>   * the system timer frequency
>>   * the GPU timer value
>>   * the GPU timer frequency (because it _could_ be different in some systems)
>>   * the GPU timer offset
> 
> I see, I missed those registers... I will also fix this on my v2 of my Panfrost series.
> 
>  From my understanding, the GPU timer frequency doesn't have a register
> so I suppose it would be wired to cntfrq_el0 if CONFIG_ARM_ARCH_TIMER is
> set, am I correct?

Barring any HW errata, yes, that's the frequency the GPU timer should 
tick at, too.

> 
> Thanks for the review,
> 
> Mary

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

