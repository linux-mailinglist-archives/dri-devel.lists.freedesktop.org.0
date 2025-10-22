Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F901BFA021
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 06:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5710E133;
	Wed, 22 Oct 2025 04:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="icVps4Bu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="icVps4Bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9F410E133
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:56:03 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dTUgHibdvD6qP2c9XCLahcsEYxWXW3UTFJlbHNlteHFbJhrRG1DJMrpqHOm/n1916clEEdWb7HjriBbgpoPnRhHNM8ggacqBYJcQZFCR+kAmf8vDpJZk3X9jsp4MsxpAcNVBxz0JdtQy9/9jFPy5iVIwHgH4MSphrqgjAt7ND7YJ3H9sU0Q3y0d9kB9HAZPEUE538ZGQJiW4HzNnMun3x+4NwFIyKBlHLyBeD+crKpROf2pYAxFZgC+45ZjUo2ixdUu1iXIL9hF1w6DbqtVYl9xuM59OQaCOEgPNtX0PTVbwMlm4MFbzANvJZeAXIyty9YjtxBKtVeEydDH/1m6MRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd5xeUiOcWv+t9g33u1AXi/xkZR2RM1bVtpt6njEdeI=;
 b=N8055ybR1k82kIPNfy8gQg61yM4uD8LqxLRlFZEODxT2Cqdp/5wmvZnT7uv2RJdnPn7hTtz8MFZOa0HS0CvwutjSLiMPAOo3fuYA66IPco80+BlCUkUTLZYqNzrxCM2tO3HnkXyD5RlOMUqmEWjkDK2l3DOFvbPDx0sbQ3S7cMcNJE/nX6hEUjBCUKEjlaWs9JOrGZ9/hVJIvumsB21DT+z+i/2lc1GVS4H1Q9tVOMvnE5QwVrwBArgtHNEDgbqZE+0sLhcfmkauQo/Pp9tGM87E5lg/s3jOBlXwUAJiHnYflZe38yEDogW0BEUC2sIHbng9qujCgE/EHcJVR0nYBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd5xeUiOcWv+t9g33u1AXi/xkZR2RM1bVtpt6njEdeI=;
 b=icVps4BuXv/FfX8YqMAn1KA3o+AwhQmk2P2yiqNSl7dD6VlEOD09kEeGr/2V//hTLngrttMzmIiuj8KCgogsjY0IFh/A83dZwVO9xCSQWlWX2djj4N51zcMbBbiYUupBw2Mqd6imykKbO3qkLjfmKwjOC0up/x8y3SM6gZFfZ+E=
Received: from DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) by DB3PR08MB9900.eurprd08.prod.outlook.com
 (2603:10a6:10:43e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 04:55:58 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::b6) by DUZPR01CA0018.outlook.office365.com
 (2603:10a6:10:46b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Wed,
 22 Oct 2025 04:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Wed, 22 Oct 2025 04:55:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdZEmylrPq2ENsSYu5YUF6vcxtByz+hYqAUMAiSh3xJDVCPHG7PZBKgmjWm/jPlwIyPGh/xYc0WJew9dnnlQR6bpzU9YDvddVtU9CVjC9YwO2+GGRxYE61lmN3I6qvXqWjlggj4ypzEsfYmHfBSneI7KC3yaN3KWqFzzmyTPykPBSVo6Uatygbpv4HPffrnCiOUt8RpsSLWkay7DXQH5OYOyDKqU95kImfVjnUrCa0HFi7+cvHit+bymfIdS7107S49z+6u9ZGGe356OiRVePkrCJimVRKGsVYpEG8CNaYWKBO7F2Fdp7vVMZFIubbjDehmRHQAoS0cRnFhVTUH2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd5xeUiOcWv+t9g33u1AXi/xkZR2RM1bVtpt6njEdeI=;
 b=ZYWB5UaF2+U+6eNCpSt9Kh0qNYAlPnf3vLjRqm5tMfhSoUlsrQeHDPmPfpo43HN52vS/eK29v4AfSlaamB4r5jAXqSqh23XIysd71XxLxkeuHaf9tN/4//V/9iSsh8zyrnkTYzuauU+q1CP35zPb1CF2kNabG0qA6J3XDZb2hpLDCCxJrZDoQEm6pk27/xR/axyx15kKh24CPawae+qoqAINcYe5hBIlpPV4W0wEOn1N9tQDq3ymN1i2kM4KF/swIl7mbK5d5MKm8Hl9/0kVj226DNFWx6AhMWA+VlgQ0QJyabjUzZu3VFHrnfHCvl7DUOX7a+dySFL3e5tXJ61EaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd5xeUiOcWv+t9g33u1AXi/xkZR2RM1bVtpt6njEdeI=;
 b=icVps4BuXv/FfX8YqMAn1KA3o+AwhQmk2P2yiqNSl7dD6VlEOD09kEeGr/2V//hTLngrttMzmIiuj8KCgogsjY0IFh/A83dZwVO9xCSQWlWX2djj4N51zcMbBbiYUupBw2Mqd6imykKbO3qkLjfmKwjOC0up/x8y3SM6gZFfZ+E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DB9PR08MB9563.eurprd08.prod.outlook.com (2603:10a6:10:451::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 04:55:24 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 04:55:24 +0000
Message-ID: <c4639586-1bf0-4571-9e45-707fe7e7ba58@arm.com>
Date: Wed, 22 Oct 2025 05:55:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Support partial unmaps of huge pages
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251019032108.3498086-1-adrian.larumbe@collabora.com>
 <bef0484d-8e17-477a-b4a2-f90d3204ff88@arm.com>
 <20251021180938.7a674618@fedora>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251021180938.7a674618@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0652.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::13) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DB9PR08MB9563:EE_|DB5PEPF00014B8B:EE_|DB3PR08MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d5275d1-04dc-42e0-d633-08de11274a40
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NGxMN3VoWmZqUDY5OGtzTWdEcDUwVFFMVkVBbVNZaUJvYk5HdnlLK0pLOHI3?=
 =?utf-8?B?TU5hS2V0cU5lSVllNnc3Q0plTndWM1lxVXllcTJzeXpZTXlhRmUyWWNhbTF5?=
 =?utf-8?B?L1lZTkxCb2FPcjlob0g5NG1IdjY4Z3RhbU9lbnM0L3g3Z0JjeUtQRmZLOGlV?=
 =?utf-8?B?bXdRa29uQSthbE9DempSMThOYjhHSjVMQ3RuT0MwbWY2V1BhSVl3SzJYOXBq?=
 =?utf-8?B?NlgxQUwvUVUrUEowY09kR0RBdXROekxibFdBRi9ZOWx3RkhIWkpaRUdGVTRs?=
 =?utf-8?B?YkFVdkExdGJlcjJpSlhuUWUzZTRUV2I0QlBLZW5FYTQwcWp2VkRMK1hIQ1k5?=
 =?utf-8?B?cmpaOFdaRVBPVFo5OUQva2htaVlTMDRncFpUTHJSOFUrbmNyZmVXYUhaTDMw?=
 =?utf-8?B?TDZDY05lY2NpNHJaM0VVdXhNZi9WMU5CTmxLTVgyU2FmdkRwRDNVeDc4dzZK?=
 =?utf-8?B?cmpOb2JNMG9SZVZjZERaZ1g3dWFtTGhhdnBteGQ0Q3ZubitnSE16ZWZhYTUx?=
 =?utf-8?B?ZDV5NmxzcUxDNHV0R0N5UTJQY2M3Skx6MkNkT3UvV1h2TEJUSm5BWUJYcktE?=
 =?utf-8?B?UGs0WnFlY3prMlB6YXZYTXcwdE1uaWRqUk5qbXUwTXhvU2kvT3dCNUhrenZ0?=
 =?utf-8?B?RU9RQlF5ejRMS1JxQ3loMFMvZ29RaUxrb1JxekZlaHk1bkNwYXlWeTV6SUxk?=
 =?utf-8?B?amxEMzBNMnAraUFkamZHOEhyNm9UODlIeHIvbEVKcVdDellWNU1ERkpmbytE?=
 =?utf-8?B?TU04MG42OE05anNhaXI5MWxlc2czT0p0bWRLaDFnMzFERHJQcW1ORzN1L0M2?=
 =?utf-8?B?R0ZDOGF3MUcyby9aT2E4ODRHR1E0bUR1MCtydUt6djBOYUw5aWNHazVHRFp6?=
 =?utf-8?B?K0ZPNGxTRGpDUFNDWTcvUXNxUnFMMC9uM25NL3Q4djZ6WEQzVk0xaW15bXJM?=
 =?utf-8?B?QmZzQ08zZ2p0UDR6NG9DVERuTFBIaHF2TnNBZk8xT0p0RzUrTmdLNmhueXYx?=
 =?utf-8?B?a0dvYW1zdkpRTWU4T1ppZzIralJDMUh3NzVjTDFnVTl0MVJUV0thaFBTOGYx?=
 =?utf-8?B?aEd4NDlIUFIxRUt2R0lzK0F4ZmkyaG9LUlM1WDlvOHRseDRNRGhQNGluWjNP?=
 =?utf-8?B?OGNOK3A4ek9YdDdJTXhQQXYzbWxrNTZKYWNHWmxBd1orYmlMM0xrTFZWYU1q?=
 =?utf-8?B?L1lSb0xjRGZuQ2pSSDN5TWhCWmg4aDhpZms2RHdaY3l4WURwN0lhQTlLNi9r?=
 =?utf-8?B?cHVBTTRFZVZJRGM3eGhRWVRvMlFteC9JU2c2aFlBUGlUelgwWTVKSmtjaFRi?=
 =?utf-8?B?QUtPa1lpTmQxTjNqd1FFd2NkNjFveXk3T1dtYzk3YjJyT0NNdVhWMkJza0VJ?=
 =?utf-8?B?R2hsazN4RXpFUC9MdVBYV2w1SDlJeGVjaGsya0FDY3k3NVhPbjd5V1luK0tw?=
 =?utf-8?B?Q0RRUHZBcU9mbzZxWGNzancwK1pBMzVRTlNiaitzK3RVaUh5SmRHZzRHWGZP?=
 =?utf-8?B?QktobnlhWm9MQ05Bc2pyN2FQZmN2ek9TTzNKSGJJSWEyN2lpUFBsUnZtcmtD?=
 =?utf-8?B?MmZLMFJKaFNtc0I4Tkpqa0dtZXBPd283TUs5UE5pd3hhTlk0d2s2Q2MxdDBz?=
 =?utf-8?B?b3JqVUswR0NtTTJwVytYNFJ1Zk5aNnFwdzNkR25xTWhVVndRaXpybEUrWmZW?=
 =?utf-8?B?cTM5QklTa2xrbG9Zb21lT2cvVXBTUDBJbW02V1MvMHVLNGtJWitpcHdPMVEv?=
 =?utf-8?B?UDErNmpYSGN5dDBSYmYyZUNPMGYrMm9HQW1KYjB6aDE5WW1DS1p0S0k1b1lo?=
 =?utf-8?B?T0oxUm1PNkR4TmFJcTNhd1BPYlBtWXdtYWpVZkNiQk0rL1Z4OWk0SEVYZVdF?=
 =?utf-8?B?ZC9jRVlIYzJMdWJsYzdCbGFnTHFuVXlaUXYrNGQ2eVRtZGlBYWhpdDdYKzlM?=
 =?utf-8?Q?rZMDxakHfNPFR0JNY+GVCV1FnLq++1K/?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9563
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c6cda552-f2a7-41b4-d763-08de11273630
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|7416014|82310400026|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGlEOXJhRHRqRGw4bm01ZGpCUW40Ri9zeFBzZUFRL1YxdlB0ZU5ua1Z5SkZU?=
 =?utf-8?B?SEtnQXc0MU5PWEVTN1BmbFRib2FhUE8xVWRWUXJkck9lVWUvb0ZJUVpxZlFK?=
 =?utf-8?B?NXBQTlhqc2dYSFplb05KOHRHNVRCbllPNFlMek54ZTNPOG96aCt5dEVmZi9k?=
 =?utf-8?B?L3RENmNiZnB6YzA2MEI5bVJzLzZGcG9hdGs3ZEFRUDcrTlgyM2E3cEtJRHVo?=
 =?utf-8?B?cHR4Z0dpSHozQldSTFN2c09jc2ZLUEg3ekVsdzM1c3RHUHR2M1dHb3o0RU0z?=
 =?utf-8?B?cHRpUmZPajJIeXZuM05mQXo2Nm1MTktYSzBWb2Y4QzVmVU16c0EyZHF6bEFo?=
 =?utf-8?B?N2tsMDZZcy9qYjNRbXFMTVN6OVFoNVZpSXBKZyt0czg2K1ZlRXo2Ly8yZTJD?=
 =?utf-8?B?eVl0Nngxc3pYbFoycFdYclBmMWhwYXlNTlVDaGpjWTNmM2Qwa1JzUG03VmJT?=
 =?utf-8?B?V2RUcG1PTlMxV1d4eENuOGtvSnJHTUxCWUd5YWpGci9iN2pkWGxIM1pTVUZ3?=
 =?utf-8?B?aVZpS3liOVFMaWZnSEpYZFN4djYrK2VIa2hEYzh1UGpKTWpJbkVBQmo4bWlz?=
 =?utf-8?B?aFdwQ2plZ1RlS2FvK1ZTd3A1SU12TVU4VzFkMlJPMG4yb0l0elBIdWM1aENz?=
 =?utf-8?B?NG54QnZYMVJYcnpUL04zMk1RNVdmU1RTV2RhNEtERDZMNDcveGxBR3d3TDVQ?=
 =?utf-8?B?ZkV0VWdSZy9PdS9Ea0RXMGVPZ2NBbC9NTFZrRzZxdGpYWmJ3aG9pSm5JQlJP?=
 =?utf-8?B?Tk82c00xc2diUG9Ec3hCQ1Y3eFN6czZIQ3d1YVNsbVFidkllL210NlhHV2ZD?=
 =?utf-8?B?d1orOC9OQm95ZXlXYm5UYnVRSjRNeGRRdXQ0Y1g4eHhjVEJYT0I5Y1ZDVUQy?=
 =?utf-8?B?c2NZTWRmREZ5R25od2FQQlhBSm83b3l6TTdYMklKbmZ1MG0vdjlQY1NqSDA0?=
 =?utf-8?B?Mkt6ck5nQ3gyekduRlFpWkVmWFJsZGluN1V5NUh0M0dWUlN5MWpPUEZ2RXJq?=
 =?utf-8?B?MGM0VmkvS2dYeHpJQXFBM1cxRmxPVVFnK0hZTm9RVGVEajRUSmZYRnZJS2Zt?=
 =?utf-8?B?MkhRa0FsVWxKS3p6VzRMTmNjKzV6WUVlMWZ0YVJ3S2owb0FmSmIyNU1GVk1Z?=
 =?utf-8?B?QWJZWUpNT0VZQ3JHdm8wSG5IeDMzM1hWWDBaL0ZXRmV1ekJLVllheld2by94?=
 =?utf-8?B?K2ZvTERnUnVUb1hKRW9reHhmWW1WRG9tNWZjQWQvRnBwTkpRVUQ3T3phSHhQ?=
 =?utf-8?B?ZWdtQlZBRGZaUEFJYmd6TTZVT0JOa1gyeFpEbnlIUHJtTFM1UUlRWitDYzZK?=
 =?utf-8?B?VW1FYUhKcWgwbjUzdE9QNFN6N3FzVWY4L2VnQnNUSXNyck03b2hhdndHZGV0?=
 =?utf-8?B?NlFCR085ZUE5RmRjTTdzWDc2bE1oT3A2eHhZT1hwNVNOQVlYRitLNWF1K2dB?=
 =?utf-8?B?Ums3dXdhQ3VRU0lZaG5CWVMrb1d5TGpscW1vMFNVbmtCQktybDJobjNzOHNz?=
 =?utf-8?B?Y3ZEM2cxbm9MbmdjQ24vcVRiSGJtVXBPYmVFSkxvTUs0Yk9ta3AwdXFYdW9z?=
 =?utf-8?B?dk41MTgrM2EwdG55Q0JoN0JCWUtMdThBdVZ4VU1hM1liWjVxdTNSNGRMeHZV?=
 =?utf-8?B?aHF4QzUzWUFGZ3ZzK2p3TnNKUDRucTBLYURSUEhibzVKVnk4aG9IT25SR3lV?=
 =?utf-8?B?a3Y5Q2xFMWdvdjkxaEJxTUxvQVJYUnNuN1RlSmI4MndLYzJhMU9jdEJYdlBt?=
 =?utf-8?B?RDRIZlNuMzVhbWJLQlRhWm9XQUVocEFORTNpZlBSWDY4WDgrZEM4dWlEKzM5?=
 =?utf-8?B?RkhYKzdwWVhkamJOVXRkL0E3UWRzZk1TNzg1dDE3VlBCeldMMjNQZmo3V3Y0?=
 =?utf-8?B?UGlWSjExMUhBK21CL09mT2FiK2Z3TlBNYURCNkdsSGx3OTl3dGZKNTN0cVlC?=
 =?utf-8?B?ZEZzY3A3clc3YU5HLzIrKytRQXJzbXJxK1U1VjlZTzZ2TkYvU3Fvc25aVm8y?=
 =?utf-8?B?dEprRGFlYzN6cG1MTGVaOWMwUy80SzdXMUtmVnNqcXUyWTd3Sys3eGltYVpq?=
 =?utf-8?B?Rno5TXhMQVltTGJwYzNEdHZHZEZmTTM0NXBDL0RSb1pwWmljY2M1ejNQRmlG?=
 =?utf-8?Q?YLl8=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(7416014)(82310400026)(1800799024)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 04:55:57.9365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5275d1-04dc-42e0-d633-08de11274a40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9900
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



On 10/21/25 17:09, Boris Brezillon wrote:
> On Tue, 21 Oct 2025 15:32:45 +0100
> Akash Goel <akash.goel@arm.com> wrote:
> 
>> On 10/19/25 04:19, Adrián Larumbe wrote:
>>> Commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
>>> behavior") did away with the treatment of partial unmaps of huge IOPTEs.
>>>    
>>
>> Sorry have a doubt.
>>
>> Corresponding to the commit 33729a5fc0ca, can we now remove the code to
>> pre-allocate L3 page table pages i.e. 'op_ctx->rsvd_page_tables.pages'
>> inside panthor_vm_prepare_unmap_op_ctx() ?.
> 
> Well, not if we want to support partial unmaps of huge pages at a non-2M
> boundary.

Thanks Boris for clarifying.

Sorry I didn't consider that in order to support partial unmaps of huge 
pages at a non-2M boundary, we still need to call panthor_vm_map_pages() 
so as to remap the difference between the start/end of huge page and the 
start/end of the actual unmap range.

Best Regards
Akash


