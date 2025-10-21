Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21384BF4E40
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AE110E56E;
	Tue, 21 Oct 2025 07:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="rn9ogqs/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rn9ogqs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013018.outbound.protection.outlook.com
 [52.101.83.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5B210E56E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:16:29 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AbRjiOI0APSsIRW6L2OwOP2fGVvdzF4XlG9MC9UowiJyw+tjAfFiXgsbRWJb2jrT4jarJ6+l3ax8gd5v36CR6+WNGKV4Fe4rcUcCkI2Mq96i+m5/79rd2VXL8HP11D9QpXWAwcKSsPX6k7WPA0/qt5+ktBMuxJyOIcIqotissHm5EOO0G07+FzEBdPWbIAfEnqh2eSLT2H4UcB5Umr89IFU4ibOiLvqQmCmVgmh4lq1bRlo6dYGLlDG8PZy0B7utuG5A7JqB6oq4H/NthbxR7AE0MiUymgTXqcGspgNqy7xieqRt6gSPeuqeZiJ9n5Uh+o2heq0byPvhYlzQ6q7PhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIUMtbAvuZdBriJUxsQ8/pgUtau8NxrqtFmyHYwMcj8=;
 b=MrWp7BOimmwl/4tWTTNWWLFlJWGbAbbA13FHgprE56KbG6FYWyevSOwsDqaEQATLTZb2KWLiosDlzbRrbfzSfbbz3tYHCf9tLp1Yq91Xuyl8bsoKvlj/OuZZNbjVlcJVgagv5DZNivazFNsGE+DOcO8llLqDC6DbYQu0nQG/dGD+kvMbvnA4mbSQC8Ks3fySZbwn5pFz4eefmZtR8c3qn9oI7QN0HChVIqlBVkgmC0DAr6/EZRS9EEm+NcdIuaEBl3GBrgphuaFqOA7xNfr/MJm6b0WDKEZmbFeQotNVRgmWMJTlbitHkk4bGVE9P5Ov21ZagBDNVfZkGDG9P0h/5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIUMtbAvuZdBriJUxsQ8/pgUtau8NxrqtFmyHYwMcj8=;
 b=rn9ogqs/cxaoA8DWET09Q/BU6xF5pboYWTdeSsMwDQCeCPsk4WDm5NnXTlKgEw0fmM8gmqpsbAvvL8QDXVviMYHErufYjhGSH+adJfSBQmSS0szBbRD8XO8CQZYBuMOSRhZer2iXCEUE7qOGNSwcqqjppPxQsS9BYD5e+T2N8Dw=
Received: from DUZPR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::14) by DB4PR08MB9264.eurprd08.prod.outlook.com
 (2603:10a6:10:3f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 07:16:22 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::fe) by DUZPR01CA0066.outlook.office365.com
 (2603:10a6:10:3c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Tue,
 21 Oct 2025 07:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 21 Oct 2025 07:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPU8ruLFGvxkl+jQI93tl3/h/MBu23mlobdxjkgkXURIZ6asoDkeuRUUS6S3qEj1X4J11L0+OYovlOosbrX1gOg3w1dzKblLl8476hXVyoEu/rIBErsiPoWSm4iu7kVk6JIg906KgEJqGBNHKhVNcEUUan22isQwFdCllkzXw48Axm1wYy92ZflJ/xX/0qvJHxcsIejG2TobXRgwfRq3KXXZBfQ0uNGs2C6HIL81WaWMWERYA7wn+vrUKCqB4DAEQ5Nxf1fPrpxaf9tqj+5BfWnT1AJfojiM43yU9jMRtm0cY7PIkofIc7jHHRjGu6f3vDsUH5R3t0piYB7/Bo+eLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIUMtbAvuZdBriJUxsQ8/pgUtau8NxrqtFmyHYwMcj8=;
 b=bMw6NL9nNJQkV5XTU537RhvXr1/EPzzHq5vjad3vx3ZLbLnSnqJW82+J+hVytQbWFdJfMefElo2NPNgZYjSttQHr2wY2pWcADcFii5oM8BAmIEHp+qC3P9ofpeZfG81hKfmphX/Bw2oPoY8+SUgdmxA5dRn1ZxE/aziKGxuFDSCoMFIncX05H8Isp7tQg3ZSneEhvEdt6o81IuHmSvnXvtISjL6X1biK93bwaWUnIuGVTBDTtFOCH2tnoOhmUamqfptoWhwoL/MmfTUbxWmVWyr2ExzcWiIrm3YnXT6dOnOlw44kyiymQOnbbhQT/HB5b1QaZfyRQWvQ+jLxtZH7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIUMtbAvuZdBriJUxsQ8/pgUtau8NxrqtFmyHYwMcj8=;
 b=rn9ogqs/cxaoA8DWET09Q/BU6xF5pboYWTdeSsMwDQCeCPsk4WDm5NnXTlKgEw0fmM8gmqpsbAvvL8QDXVviMYHErufYjhGSH+adJfSBQmSS0szBbRD8XO8CQZYBuMOSRhZer2iXCEUE7qOGNSwcqqjppPxQsS9BYD5e+T2N8Dw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by GV2PR08MB11342.eurprd08.prod.outlook.com (2603:10a6:150:2ca::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 07:14:46 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 07:14:46 +0000
Message-ID: <4c681d1f-cdfd-4bad-a859-4181e2b91871@arm.com>
Date: Tue, 21 Oct 2025 08:14:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix kernel panic on partial unmap of a
 GPU VA region
To: Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20251020060028.1262648-1-akash.goel@arm.com>
 <95c053f6-bb90-4eca-beff-0b46ef251a32@arm.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <95c053f6-bb90-4eca-beff-0b46ef251a32@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0442.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::15) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|GV2PR08MB11342:EE_|DB1PEPF000509E6:EE_|DB4PR08MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 508259a2-4a72-4daf-2b66-08de1071bcdd
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eGxnUUJmaFR6SnJzWHc0aGx1TVdsUnJjeGkyUnhEU2ZvaGJrQ001TE4zcFBZ?=
 =?utf-8?B?K3lyZHBZbnR6bnhkRG1JU1ExbHNRRTJqTWxXZkluNnF3ekdzWTcreHVBNndP?=
 =?utf-8?B?RCt3NSsvNFFZdEh1SDZCYzFHMWIxRHV2dVhEN1BUZk9welhTclF4UG9LMC9j?=
 =?utf-8?B?UVBOdU9CTWJoUitXTUwrQ2lVMzgzYStIekd0WUREdENFSFVPQXFzdjdERUVq?=
 =?utf-8?B?a2dncjZWdWVZZGZ5a3dkbHRTanBhcEU1ZGw5WXhKeUs2OTJGZU1obk1oQTV6?=
 =?utf-8?B?ZHh2Q3ZXTmpBY2hPcnY4UFdLTGhJU3BBTmhyNndlN3FJK0JRV2xHQzZzVWE2?=
 =?utf-8?B?MkdNWGdySWJ4SnYxeC8zeHBzYUQwZDJHVjBON05Xa1pEUTlHdVhrMVJhNlRX?=
 =?utf-8?B?a3VLcEFPVUd1N2J6Y09iM0pvQ1FvWThhNEdlMktEU3hkQjl3c1ZtL0lLM0JV?=
 =?utf-8?B?Y0tVdGp4eEFVLzNYU29mNUk0ZHZZNXRXTDdzeTdCR0tvVUlKZTdtcHl1cWs4?=
 =?utf-8?B?bFMrMmU5UytPclZyOGxQaDJ5RWUrY1B0QWpPSmYrOXRkcUlhRTkxUVVYQ3A2?=
 =?utf-8?B?M2lacGlNS2VwcFlwMDRJVjVsaXlzeXhMSVhPUEo3VU5acFpXN3h3OTZQM1BC?=
 =?utf-8?B?RTNaV2trZ0hSZEdpVzNzZjQrcFFOM0lvMUdoT1RHVFNFb2xVMXVnU2tRN1VH?=
 =?utf-8?B?M2FhZy9QYzNDNTd2N0hNNHhsRXN0R0lJYkxFcnZ6c2M3Um92SVp6MXdNL2lm?=
 =?utf-8?B?bzN2Sk9DTCsyb3Y5MnN4YUZIajI1VDZ6QlZBNXR0d3RPc0VlRFh3blNnNTNp?=
 =?utf-8?B?bEZmeWhVOEdJbkNFdm96RDc2VytHcktia3B4TXdndWxqbVpzUnF5VVkxL0xH?=
 =?utf-8?B?bTdwaFdhMGpkRDdOVUk2dk4zbE5nb1ZnbHlBWTdTRWE4WXhKMGlYM25SMjBF?=
 =?utf-8?B?MS8xRkt0OWdYSnFXVFZNS0xJQzdHREJPS3NBMVVBbm9SOVVERXIzcGswVVpQ?=
 =?utf-8?B?eTIwRzZ5dVl2TVorbksyUy9lR2w4VTh1ajBndzdycGtSckJ6V3dmQ3orbFhp?=
 =?utf-8?B?VTlLVEl0NUhsZlRrNCswRW5EQ3ZUQ0ppckdaQWdsNVpVOWY2L0FOS2Vwb2dO?=
 =?utf-8?B?ckNRWkloZzd1Z0J2WWpiN3JxSVN5NkxFQ0loYXNlLzZGVlF1ODNuWEY2MXBB?=
 =?utf-8?B?S2Jmd1Q4Z1d4WnJJSTVqdk41ek5tN1VSakU3ekptNldVcE96M2I2VTlnTlZk?=
 =?utf-8?B?LzlnMHM2NkFSdGNpektGVGFQbTdHdGF2Q2NYWE91OWZ2SEFXWDZEck5MMHRi?=
 =?utf-8?B?ODdOYjFJZHo3VkVGbU91ZHJXV2t3c0toVG1wT2ZPRXZSd0VBdmVXbElndmVy?=
 =?utf-8?B?Z0dmQWpWREVQeTd4V0xQeDQ4T21YRThEWFUxRDNiRmJ6a0lxbjYvMHlQY2t5?=
 =?utf-8?B?K0VjOWJQQ2VhU0RPSGFRWVFzS01sSnZGS2doNkFBaTA0RE9FR2pFeUNhSWht?=
 =?utf-8?B?ZU9sdXpFREp1NXNxMjZLY2VDWEg0VXVuRlRkSEgrQXFmN05EQ2tHYis2dGxM?=
 =?utf-8?B?c2NtclJqK1FRVFhyY3pVUGxoRlZlZ2JYRmtGbU15TlZ6cEs5b2dzRXpWd3ZZ?=
 =?utf-8?B?RHhTaC9JZEhLVTNaMCtQUnduWnNEZk1DWmpFY2RYNDRPa2FLQlF2THlHeXh2?=
 =?utf-8?B?RWZZUExCQ2d4T2hSOHhqOFRGSTdBQ0FDVzU1SUpxNE00UEJzQ1BmeDJxL2pG?=
 =?utf-8?B?eUVMTjEvUUVsRXRPaTFjVHNiTlA0RXF3eHhnRTVPQXpzWE5FNDg2S2ppQjMw?=
 =?utf-8?B?aVFCdHd2VlhFWUhDY1VneFZGNjM4Q1JXSTltZEJVN1pnUnBnMEwrclZlTWQ2?=
 =?utf-8?B?VDQxc01zOHR6aFgxUTJyU2FyS3NuOU5uaXlZTVIyREJuakFickFyTDU3S2Rp?=
 =?utf-8?Q?R0bN/SIImPy7VpeTSDvWp2yhnRZ5vSom?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11342
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a8588dfa-2972-4431-3808-08de107183e0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|1800799024|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGJFMGRjbnMydUFETEFKQ3NVaUROWXM4UElLNGcwcFFEQkoyZUlxSzYxb0Rp?=
 =?utf-8?B?QnUrUzgwaDdqbko3UVVEZytQZFRZdXlkTDQvSjZ0UE5sSmN3UHoxRWg2ZVM3?=
 =?utf-8?B?Q1NqSFJjQ0hLWWhtQVJLanEvckdFWTNYTEt4ZWIwa0JBT0h2Mmd1Vk9TVmJ6?=
 =?utf-8?B?WVRIZWdRZ0h0TXlKZW1DOUEwbkR6Y2xWanFOUmpOMkwrcGZqcU9RT3BPTkho?=
 =?utf-8?B?VHV6NVgvQ2k2bzFQc05ybG14ZWp0Ujg3QmwrV0J5MjAyM3BEZUpxOEpHVi9V?=
 =?utf-8?B?WGlhZUI1aXhmazdrcStxNFlGQUZkSUZ3UmpyNWZOVG1yQW9XZVJYME5CTmpF?=
 =?utf-8?B?TmtEU2tja2ZFdCtUM3g4bWlRT1VMYi9ERnY3bGtHUXFReGxkTFNDZ1F0UjNw?=
 =?utf-8?B?aGVWOXJCVjUzRjZqVmVldkdjdlgxbmVoMmd6V09DY1JDMlN5Wm1uUnNSR0RZ?=
 =?utf-8?B?STRxdEFMdlFiWWtYUFM4Z1kwK3l2bkxlVDNJMTJTRUdEQmg3TUtWekRzMDFL?=
 =?utf-8?B?MFhEY0ozdjhhS0Jka2xTUXhYWlpWeGw5VmJtc2hWbVhhS3B0dWJtdUJBVG1h?=
 =?utf-8?B?MkNHUWZpNEtiai96QytwNXY3ZlRrRGVyQjdQaTExdlUyWXFnTmVaY2dpVXFp?=
 =?utf-8?B?MGtZMmR6Y3hDaGdPR1pidWN6K2ZoV1QzU25sYTJJQnNXUUp5NThJT2lKQzVt?=
 =?utf-8?B?QWkrSTBpNmh3c0ZyeTBlOXJwQ3UxK0FyRWFzazVNY3lYZE5oK3lEVDZpcm5E?=
 =?utf-8?B?bm5rMk5Nakl6Y1BObWpSOXZReVVaZVN3QldPeTlCaWlNUllYWStzL092S3A1?=
 =?utf-8?B?WUdwM0JNUUV5SDZUeU5hOFZ6S1RBOC92a0xSb0hXVGx0UFpRb2VRbGh1V0hC?=
 =?utf-8?B?aDFnNm5BazNDTmFJREtrSklpaUNBMkVSdXZMR3pmaXJVRGZhanpWL3Q5Kzlt?=
 =?utf-8?B?SWoyaFk4WEROdnp2VjdSbFJWUVpqR1V3cFdUS1hxY3ZnajByWkhJUE9xNWJY?=
 =?utf-8?B?SHRjYTZhYlloS205Q0c0V1ROWnhPRkRhOGdHYjlXeW85YnBFVk5uNWVzT1c1?=
 =?utf-8?B?SEx4VnFzd1JGQVg3aHo0aERpU2NTdHlIRDF3ejRKdG80N1NZNnB4SHNYU3V2?=
 =?utf-8?B?dlF6dnI3amY5VHltOE41YXFvSWV6L1pYL3A5V1VDbXZubEE2djZ5RFhLazFB?=
 =?utf-8?B?a1UxU0pHb2JFQkVoZDR5SHNRQ2o3ZzJ1dDNIeTZoam5sUWVEQy9yS0JwQmZI?=
 =?utf-8?B?NXFNd3oxNFp3N2EwbnVRSThZajg2UGQ4dVVyUmdlamlvTEdYUjN3UXgwbHdi?=
 =?utf-8?B?M24zU3Z5ZEcwQlBYOGZyR0VKajhGWjE2NHNvV29vRFJFMzMxTFJZdkhUVzAx?=
 =?utf-8?B?NWxlRlZvZ0pMa2JyRFpSMjNUdk0xY1AzL0IrNEFxaERhbWlPV2k4YUlONDcv?=
 =?utf-8?B?cDlvazlrTDF3R3NZZ3lNckZuQWN5OC9BdXcrWlhnQzZDWmlzMWNZQ29SK25M?=
 =?utf-8?B?eHRqcThYQmc5bEdZT3hUMkMyWnR2TnlHMi9xQ05FQ0REK09FR0pnd3ZtbjlP?=
 =?utf-8?B?azRyQm1vS253TGEzSGdyZlNSTndaL2VzeTN0RDRocElINkJjamdVTndIdU4w?=
 =?utf-8?B?NENvOHEvZUQxVG5WTVdzWVJLaXlJd0xadkprS0pRMHhaekJXOHQ2NTI1bmJM?=
 =?utf-8?B?SDVDYUNXUlVUUTI5RGpoaHllOUNuaW5wKzZpdzdBaDlma1hqRGw5SkJnNWhT?=
 =?utf-8?B?dERMeW5lSXRtY1pLSTNKcDNZOVExWW9OaUFHSlpLRHhRKzhWdUYrN2tHanlm?=
 =?utf-8?B?MS83WGdwUHprR2ExaWJOSU1Kd0xTelFNTlB3dVljOWlVc0N6THQwM0VLYmZU?=
 =?utf-8?B?SG9ZUjZXWG1oTlRkeHJCZURkL012amhpTURGbDgrNXJmMjRPbEViNVRLOFl3?=
 =?utf-8?B?UitVaWxxTmJhcnlPM0tCSm1KMzJ4Y2NCLzVINndZQkQ0WjQxOGdreklzNCtq?=
 =?utf-8?B?djNXNDNDZVZQYTVScjRhQThFQTNGaVM3eUFXdFF1YnY5UjBvbk9ZWEZydmlM?=
 =?utf-8?B?UEFKNy9IeENZeTIrV29pRTJRRjZpdGtyR1FqbDVyTmVvbFlSZ1ZJUzhuZk9O?=
 =?utf-8?Q?ExXU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(14060799003)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 07:16:21.8047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 508259a2-4a72-4daf-2b66-08de1071bcdd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9264
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



On 10/20/25 16:44, Steven Price wrote:
> Hi Akash,
> 
> On 20/10/2025 07:00, Akash Goel wrote:
>> This commit address a kernel panic issue that can happen if Userspace
>> tries to partially unmap a GPU virtual region (aka drm_gpuva).
>> The VM_BIND interface allows partial unmapping of a BO.
>>
>> Panthor driver pre-allocates memory for the new drm_gpuva structures
>> that would be needed for the map/unmap operation, done using drm_gpuvm
>> layer. It expected that only one new drm_gpuva would be needed on umap
>> but a partial unmap can require 2 new drm_gpuva and that's why it
>> ended up doing a NULL pointer dereference causing a kernel panic.
>>
>> Following dump was seen when partial unmap was exercised.
>>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
>>   Mem abort info:
>>     ESR = 0x0000000096000046
>>     EC = 0x25: DABT (current EL), IL = 32 bits
>>     SET = 0, FnV = 0
>>     EA = 0, S1PTW = 0
>>     FSC = 0x06: level 2 translation fault
>>   Data abort info:
>>     ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
>>     CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>>     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>   user pgtable: 4k pages, 48-bit VAs, pgdp=000000088a863000
>>   [000000000000078] pgd=080000088a842003, p4d=080000088a842003, pud=0800000884bf5003, pmd=0000000000000000
>>   Internal error: Oops: 0000000096000046 [#1] PREEMPT SMP
>>   <snip>
>>   pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>   pc : panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
>>   lr : panthor_gpuva_sm_step_remap+0x6c/0x330 [panthor]
>>   sp : ffff800085d43970
>>   x29: ffff800085d43970 x28: ffff00080363e440 x27: ffff0008090c6000
>>   x26: 0000000000000030 x25: ffff800085d439f8 x24: ffff00080d402000
>>   x23: ffff800085d43b60 x22: ffff800085d439e0 x21: ffff00080abdb180
>>   x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000010
>>   x17: 6e656c202c303030 x16: 3666666666646466 x15: 393d61766f69202c
>>   x14: 312d3d7361203a70 x13: 303030323d6e656c x12: ffff80008324bf58
>>   x11: 0000000000000003 x10: 0000000000000002 x9 : ffff8000801a6a9c
>>   x8 : ffff00080360b300 x7 : 0000000000000000 x6 : 000000088aa35fc7
>>   x5 : fff1000080000000 x4 : ffff8000842ddd30 x3 : 0000000000000001
>>   x2 : 0000000100000000 x1 : 0000000000000001 x0 : 0000000000000078
>>   Call trace:
>>    panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
>>    op_remap_cb.isra.22+0x50/0x80
>>    __drm_gpuvm_sm_unmap+0x10c/0x1c8
>>    drm_gpuvm_sm_unmap+0x40/0x60
>>    panthor_vm_exec_op+0xb4/0x3d0 [panthor]
>>    panthor_vm_bind_exec_sync_op+0x154/0x278 [panthor]
>>    panthor_ioctl_vm_bind+0x160/0x4a0 [panthor]
>>    drm_ioctl_kernel+0xbc/0x138
>>    drm_ioctl+0x240/0x500
>>    __arm64_sys_ioctl+0xb0/0xf8
>>    invoke_syscall+0x4c/0x110
>>    el0_svc_common.constprop.1+0x98/0xf8
>>    do_el0_svc+0x24/0x38
>>    el0_svc+0x40/0xf8
>>    el0t_64_sync_handler+0xa0/0xc8
>>    el0t_64_sync+0x174/0x178
>>
>> Changes in v2:
>>      - Add R-bs and fixes tags
> 
> Sorry, perhaps I wasn't very clear. I've already pushed v1 to
> drm-misc-fixes (with the fixes line and the R-bs):
> 
> 4eabd0d8791e ("drm/panthor: Fix kernel panic on partial unmap of a GPU VA region")
> 
> Usually there's no need to post another version just to update the tags
> as we can do that as part of applying the series.
> 


I am sorry Steve, I am not wel versed with the upstreaming process.


> Thanks,
> Steve
> 
>>
>> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
>> Signed-off-by: Akash Goel <akash.goel@arm.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index 6dec4354e378..7870e7dbaa5d 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -1175,10 +1175,14 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
>>   		break;
>>   
>>   	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>> -		/* Partial unmaps might trigger a remap with either a prev or a next VA,
>> -		 * but not both.
>> +		/* Two VMAs can be needed for an unmap, as an unmap can happen
>> +		 * in the middle of a drm_gpuva, requiring a remap with both
>> +		 * prev & next VA. Or an unmap can span more than one drm_gpuva
>> +		 * where the first and last ones are covered partially, requring
>> +		 * a remap for the first with a prev VA and remap for the last
>> +		 * with a next VA.
>>   		 */
>> -		vma_count = 1;
>> +		vma_count = 2;
>>   		break;
>>   
>>   	default:
> 
