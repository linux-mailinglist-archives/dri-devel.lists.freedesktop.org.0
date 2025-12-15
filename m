Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFCACBF7DF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD01A10E3F6;
	Mon, 15 Dec 2025 19:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="FeRHrCCl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FeRHrCCl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098F610E3F6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:10:32 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=laxDzgPAf4TfFgPmGbzjQ0JvtzelHcnZA1cp1e88MNvEhGUmVLEPQ/LQidwi7hVOU0/8UhzShcTMBMGij/bE3wqgxbNDs3HpGv7b9p3rpYE80kBN0EOwPsZnPTZZjjsHF9S34ksINjc9en739vjpIZ5uPBPdGBOx2tUhTSB6lrwsTCvQkKm3dm0l5JQtep7lqjX7bfldrxF+Oyj9Oxym0MbLJjizdxjDpfse9I5ajwqHpkXpOMlC8L/HLnm8Amvk4OU059a1OjNMTMjTHFFxQa/lodmaO0v2sRRRhpx5MrKDL1yR+2UeDDqchdiD4Eodm1s87pEcZ70aTLfCHfOAbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bbKV7AWmfJt41O8S0aMbleEaWdh+cGoNtjivvuCFAY=;
 b=jUiYxH/T2Biqc0W27uJiANS4JM/KbkF8enHlwpVicHvNm2PPjE9wtIke6FGi7wE50nNI4Ko3/yc8zCrQ+5Tp6Juom9pNOOQvt8uTLlWlU+hsk0XbMK29k2bDOz77ft9NFnpcFayMsZRHK6NIvT5XzT0auxcIB326TpB5KSN3i7JhiYMXF6uV/N4OWFyRpwhPP/M5MOTbnoWiz0qCnu5JgoTy1b3VoRtdZSfNr4Zon0X2dLIaN7E/7pSCgykdBZhyQPpkxxXwZYtjr3J/ptc5IchVUJDi/ICEZUUijkuZ9Mxnt452KXPuPSIaAB2i2MGSrsjMR2YNC2xNk9iYHUb2bQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bbKV7AWmfJt41O8S0aMbleEaWdh+cGoNtjivvuCFAY=;
 b=FeRHrCClEUSvQNN5+rgEeOovN/F8hn3FlJOJEgSpgL9aW/ElR3qj+L6gyXpMoDV6jJkHKjaOVM6SWqPlBDXPvXTgONlPogstJ/5Kn0Z+6HFGzlcRn/EZYUe36SpA7oERsJAX4CqYrItOq7FDJlBG7q5jv7VZfyrl9giQeZw5oXY=
Received: from DUZPR01CA0285.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::23) by PAVPR08MB9039.eurprd08.prod.outlook.com
 (2603:10a6:102:322::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:10:26 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::37) by DUZPR01CA0285.outlook.office365.com
 (2603:10a6:10:4b7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 19:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 19:10:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+6qb4u39HDcqvSg5eMQJh4xswxfoTSsfzgeEWLLbF5QcyenBhZI2k7WQ9+T9Igql+NtbrDESFQFWrfhoWqoqUWbMF4yT2b0ShaKCIQlBSIwT7PW0RKSQ2xx3JjqxW/otVk0ZM5D5QcVU6t7d/0LfW/+riRrn2Z3O8Cw8ScgXd000k8f/XfSxF9cH41GbuXToZjUxuLLlJsGoLhHMwLPiTEuYQGrzdGo6tXKkGqXDabdSi3ATLc1+zZRXXqmvAKEnfvruqhs5a49+vZBlQxVeOecR8z++VSxYyvPPrFWqmiQw+X8Ih3N8qyOYY43TMJiZp9Flz6PWT+IqBq9kuHr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bbKV7AWmfJt41O8S0aMbleEaWdh+cGoNtjivvuCFAY=;
 b=xeKv0IAV9Nucp+sMSCTs/fQpG8JhO98AikKPda4ROsW0FZq1eio1UBrGJhLeUh6oPRAjicuq8nBGTHbf3PzNPzK2z9VMG0/U78EhPW3TR4ggMtKaJGQIxrpPlESW4jXoQIn82rA8aEMyd7lc5rbKWKTpB4l6e8ntiyUH4NXN8CO4798n7ZZsXCj9BmbiG0RTOQUkBuwBqrROpuoIYRCtdhxXjZ32ZO3UzduxFhXpP5QRcWxEZe14Qbup2GnYm4KbVL4TJjIkX0PzOXERixfBi7OvTEM1jvoNsPc/o+uYv30FBOnxSsdS8i/jZdsCKGpe/VW0fwg2ZoCOvrVHdxWbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bbKV7AWmfJt41O8S0aMbleEaWdh+cGoNtjivvuCFAY=;
 b=FeRHrCClEUSvQNN5+rgEeOovN/F8hn3FlJOJEgSpgL9aW/ElR3qj+L6gyXpMoDV6jJkHKjaOVM6SWqPlBDXPvXTgONlPogstJ/5Kn0Z+6HFGzlcRn/EZYUe36SpA7oERsJAX4CqYrItOq7FDJlBG7q5jv7VZfyrl9giQeZw5oXY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PAXPR08MB6591.eurprd08.prod.outlook.com
 (2603:10a6:102:150::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:09:22 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:09:18 +0000
Message-ID: <f2a5f6fc-47a0-48b1-b545-e867e79cc9fd@arm.com>
Date: Mon, 15 Dec 2025 19:09:17 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] drm/panthor: Support GLB_REQ.STATE field for
 Mali-G1 GPUs
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Aishwarya <aishwarya.tcv@arm.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, nd@arm.com,
 simona@ffwll.ch, steven.price@arm.com, tzimmermann@suse.de,
 broonie@kernel.org
References: <20251125125548.3282320-7-karunika.choo@arm.com>
 <20251215160520.55812-1-aishwarya.tcv@arm.com>
 <20251215172559.0de2a329@fedora>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20251215172559.0de2a329@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PAXPR08MB6591:EE_|DB1PEPF00050A01:EE_|PAVPR08MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: 3081bf02-651f-47a6-c4a1-08de3c0d9a8e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?UFpEYnYvd3hCR01FV1gyMFVqZElTTmhmVXFpRmhDU1AwUzlTWnlFY3JiUVox?=
 =?utf-8?B?dFZpNkh2RXlsTnU5bDYyK05leERtclBmclVPcTJHQVY0VncxbnVNWmtobjhY?=
 =?utf-8?B?VE8xY0lyZDh2VFZKU0twOGtmSHBOZHIrczNFZ1N4ZjZOSGhRbGd5WWt2MUxJ?=
 =?utf-8?B?RUZyV0tyWlhGaVJ1djNITkVvcUNQTkYzdXVZeUhJbHlKQWI4SWhGRDQrZEgz?=
 =?utf-8?B?anRYNGs2M3M5N1Bpc0NjUTM3Y0lKSFo3dkpaNFE0TzFtSWZPYmYzYS9VNHZG?=
 =?utf-8?B?VzJNMHd2TUxjb0RpNGt4aWhBbHJWdmxaazlNZWlsUVJHbFVVY28wZUFMb004?=
 =?utf-8?B?d1V6UHdqeGwwaWRqT1FmbHlQb21McnExYWwwV0R3MUhNaC95dk9SR1d4RVZF?=
 =?utf-8?B?Z3B2aE5SdFcrY0xVdjFhYVV2Vmptcms1RjNNcndPQXM4MWZWVVlZR1Q2aHZl?=
 =?utf-8?B?aG5McVRUTURKRmQxM2YvbkttckhsaGRHczVNYjlXdU1sZ0V6WlFFVFEvSGsx?=
 =?utf-8?B?VTQwTG94akkvbUk5YjNqOXJDMjI1ZGIraXpoaUUxNExMQUR2LzJ3MWE2M0da?=
 =?utf-8?B?VThnQ21vcXlrenh3VXJkOWJISVVtazhVT1V3NE9DcmtDTG43S3E4azlEVDdj?=
 =?utf-8?B?Q2o3OWlERmtRN242aTNqVDF5M0U3YVM1MDZVUjFad3YwZWc4R3VIV2QyTDVU?=
 =?utf-8?B?ZGpwL1M0REo0dGJhdFBSNFJPU0czNzFvMjV3K2pRK3k2UDVnNmZFV2JucXlz?=
 =?utf-8?B?bzh4VGFUclJQK2t6cXd6WTlKUGtEM3h1T3hERnE0aFhHVGNKekpwM2hlMzcx?=
 =?utf-8?B?aksyeWMrRUw5RmU0VXd3Z3E5ZmV1QUZkeTZ0VVd0QVZNMm9SWWJrdXhQam93?=
 =?utf-8?B?L1hnMHhaUmlvUlcyblF4ZVVJQkZaYjRMVG1jNnRra0EzdXV1eDlhdjk4bkxT?=
 =?utf-8?B?dTRrWWtTbnVBWjdObFF1RFoxbTBrL1orbjAveGFxTkxwTjdldGJjOVp4TVFS?=
 =?utf-8?B?dWVTQllRa1NYSG43cjk5ZjNTWEZ0ZHJSV1dXTm43cGdibUdIbmFZZnJGY09T?=
 =?utf-8?B?ZjhLcGZxR1J4S2dvcnZ0Z3cxMUh2MmYyWVY2eTlBcjJ1OVFyd1RMcVF2SDhr?=
 =?utf-8?B?SkhCWG8zb0xIU25vR3VoWlJOZ1NOK0FxQWdKMnVrTkpzS0RoTFFZeFZuNGQr?=
 =?utf-8?B?bzF1RDlkdlRoRnl6M3UxaGhoS1QzZDJ3c20vTUU3cjh3S0d2bW1BbFpoOTFq?=
 =?utf-8?B?NDQ2WmhoUjVGSnlJTlV2NEhkNUhKNENWM29GL0M2cUJPa0VCa0RCL0R5ak9t?=
 =?utf-8?B?enJZRVlucXYvQXhvNUtFWFRDcjJFMUNqSGFGdHRPdWMwRFVrRFV1ZjcwNUZ3?=
 =?utf-8?B?Y3l5ZEROQlVJL1EvUWlFNU9ZYmkzWWJ5MzZjUVhJSE14ZHRtdkwwa3IzWGpL?=
 =?utf-8?B?V0YzRnkwT0dFZzd6TitoSU1VRDQ2UmllUEk0Uy9KbkpiK2kvaTFCYmU4UEZt?=
 =?utf-8?B?cjhPMjdXU09nTkRrVUYwa0w1Mm04T2dmcXNLSWRncVpCRjZkRnNwdk1QOEV3?=
 =?utf-8?B?YlNZNjIyL0RZYVd3UEEzaHRkRktTY3hYMjhPUGEvRnlXOThXTHByRHNmMmhX?=
 =?utf-8?B?N3NRV1pHMDF6d3pIelJ5eHZSdUlQU1hJbEpwUGVyT2htRmhneE1laUxUcHJu?=
 =?utf-8?B?cXkwMUExQTUxM1N3RVpNVUIwTkNnWkVZNzlYVlptYW1nYWtBOWxnS1lWdGI2?=
 =?utf-8?B?all2WVd3VEdSL01FUzdaY3o4blVmY3Q0QlI0OFVZRDRkMlVCTVIwNGR2THhC?=
 =?utf-8?B?dm9yY2JyakNwVzloaHFnakZ0MHg1dDZ2WWJNUTZRVmVGRlFicnRKVzBDT3dl?=
 =?utf-8?B?aUUwcW1vbzRDc0p0dWx6QjVnU0xCd0pFSDRkOU9LVmFYSnc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6591
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 89ffc0d4-e9f9-4b87-a9e7-08de3c0d7276
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|35042699022|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3RGbmpSbFdVQ0QrZkNGVDl1K1lGWWRTREFiaVl2dXA1MlNJY0h3ZDc1emti?=
 =?utf-8?B?QmtXdlBZdi9tMnZZSUcvdU9VaGRDc0Mzc2FZYWtwaEJadW1DZ3hxOGVZTmdJ?=
 =?utf-8?B?ajl0cTlFSkJHR3dVWnJWcnc2TkpjQjFlcnVaNm5VQVpHbzhGNWh4QnROdEdP?=
 =?utf-8?B?Z24ySXdVT0d5TVUxNHlVaHlFSTRocFFDLzJLSE05OVFzM0IyMWUzMzJBM3F0?=
 =?utf-8?B?NU5ucGsrL2VoVURhbDJXZXRGbjJKYjFMNWJ6aTBwZkFSMW8xNmYzYXJidHRq?=
 =?utf-8?B?dmFmMXl4dDZmcmc4WVgrRWtBMGhTZXB1eGZSN3UvZzdraXA5bmRzN3oyYW1t?=
 =?utf-8?B?cHRNYzFBWVNNbmVaWjJKSHFkM0VaNzQxNVczVFJ6T2kwdGRPMm5OMUxPNXRJ?=
 =?utf-8?B?WkI5bFY3RWpjTVo4dkJPQ2xRRFJjZUJyeElrTWppUk5OaXVVakw3L1NiT3h2?=
 =?utf-8?B?M28rVGdLejYvRDdud080eUlFNjdYK2FRNXlMZ3MrLzNuTEZHR1BhNk54Ukhz?=
 =?utf-8?B?TjVPbHpPM0tPdUpVYnRSZHcxeFExNDlCNjRmMXFmdUhrTm5MSS85bmRSL2dU?=
 =?utf-8?B?U1JGUDByTlY2cEovNmFmMXZpTzlMVzBxUERaeUlPQkFQd24xS2FxUHRwU0hK?=
 =?utf-8?B?UVE2Nk1Yc1BHMXgyL2R1UDJHcUVySFdPdktHdmFTVVp6bVp0UEJSLzM2amFu?=
 =?utf-8?B?U0pUODIwa2lkN1V0bFRlUnRuaWJYS0dXYnk0ck9COUp2Q3R4cFcxS2NNU1c1?=
 =?utf-8?B?NVEyUEd2bzJxUThjYi85SFAwMmtEcjJKajFldDVaTkpoR3ZiNGFpVkc5RXd4?=
 =?utf-8?B?d2ZaVkVmeXFOYWJqWklROFNaVnZxNEMvTzRTckd0YnZ3dU1kMWg5bWZ0UEVR?=
 =?utf-8?B?K0U0RTZRVGZkMXBxdHdSSkN2TE04QittNS9OT3lscCtKVXptWEIxL3JhcW0r?=
 =?utf-8?B?eGdVbG5JZldwNUF3M3VyaU02RlF2NTg2N0Vpb0FUUmpONXlZRGFqWHZWY3Zk?=
 =?utf-8?B?QTdnL0hNa2pLMFF6dTluR1RGWkdmMXRtNE9xYmI4OHQxY00yY1lkN0Y3eTQz?=
 =?utf-8?B?dDNDZFRtVXlFcnIrRGlxLzFxemQ2dUZmc3JtallSTGNZdjdOdW41bkVvbGZI?=
 =?utf-8?B?dG12bW94RHdqL0ZJYXJKbWs1d3YzeHY2R1hNN0tpSk9ZdlZ5Tlg2aHZJSWti?=
 =?utf-8?B?NlhWWjVkYnJ3TVpGd1k1ZituY0wxME9ORVZZS3kwenVjbXpVYVdPMmVHRUNP?=
 =?utf-8?B?d3FqOXhraFdJRkV6SWhmYVNKeEl4VUJmVkJ6em85MzI2NGpKM1M1M21NL3dR?=
 =?utf-8?B?NjhYbU80a05xS0lVd2xOWVlOZTI3TWhwWVRUZTJqWmpaV1RTeFBYb3ZRRkJ0?=
 =?utf-8?B?V0dPaGpLdzVoZE9RNHMyaVdSVmFzbVBMVGxySXBDT3FPb2owOWc3M29KekZu?=
 =?utf-8?B?TU1iRUcxVjUrTGpWK0NOWC9HYTVHVXUzeVp0ZDZRQTE2OS9TMWd2dmdKdk1P?=
 =?utf-8?B?ckhDTkpYaWM3NXRDbHNpdDIvbHB5aFhQN0hRSFVhTE5zNmM5YW5hNFFtU1Y4?=
 =?utf-8?B?TnZSdzNtZ3FoSkg3Zk1aMElGWjhKMW9VNmlIYmNwbWFyemo2Vi9EZXVKRjEy?=
 =?utf-8?B?b3c4NlJTNXhOSkkxRUVZY1gzVEZQcmtEQkgwQi9WNEd3bTVyM2tqWXFLZ2FX?=
 =?utf-8?B?c1R1RkZyK0h3R3FlbVFLNXNKSlNML21PYlFPOHRpMms1N21WTVordm13U0g3?=
 =?utf-8?B?YTFhTERnUzlpQUQ0QmxaNFRiY05PaUlGMEFmeEQ5dFFBVFJ0T3Z1dnFDRDlw?=
 =?utf-8?B?RnZaazA4ZTlXZjhlODY4Zm1la1FOcE5vSG9BWHlRbEk4eE16YnNmdjBDV0tj?=
 =?utf-8?B?YUphQmNHWXBoYzAwdXdFYjBydEpVT0NwNWpzKzFCM054SkdPMFpIYVM0aTBj?=
 =?utf-8?B?Yy8razZIWDdnb3lOWlVoQnhvamIwemVKMTNRK0NYYkZuSEtUZDdvd1d0L0lz?=
 =?utf-8?Q?22MYzUxJqv5fTyggNkW2alsO20BHiQ=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(35042699022)(376014)(14060799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:10:25.7395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3081bf02-651f-47a6-c4a1-08de3c0d9a8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9039
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

On 15/12/2025 16:25, Boris Brezillon wrote:
> On Mon, 15 Dec 2025 16:05:20 +0000
> Aishwarya <aishwarya.tcv@arm.com> wrote:
> 
>> Hi Karunika,
>>
>> Booting v6.19-rc1 on rk3588-rock-5b succeeds, but the kernel log shows a
>> panthor firmware load failure followed by a NULL pointer dereference in
>> panthor_fw_halt_mcu() during probe. The driver fails to load
>> arm/mali/arch10.8/mali_csffw.bin with -ENOENT.
>>
>> A git bisect identified the first bad commit as:
>>
>> 51407254986501b19681d55531963f1ea58e89cd
>> drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
>>
>>
>> Failure log (v6.19-rc1):
>>
>> <4>[   16.915783] panthor fb000000.gpu: Direct firmware load for arm/mali/arch10.8/mali_csffw.bin failed with error -2
>> <3>[   16.916754] panthor fb000000.gpu: [drm] *ERROR* Failed to load firmware image 'mali_csffw.bin'
>> <1>[   16.917542] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>> <1>[   16.918329] Mem abort info:
>> <1>[   16.918598]   ESR = 0x0000000096000004
>> <1>[   16.918949]   EC = 0x25: DABT (current EL), IL = 32 bits
>> <1>[   16.919436]   SET = 0, FnV = 0
>> <1>[   16.919742]   EA = 0, S1PTW = 0
>> <1>[   16.920041]   FSC = 0x04: level 0 translation fault
>> <1>[   16.920489] Data abort info:
>> <1>[   16.920766]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>> <1>[   16.921269]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> <1>[   16.921272]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> <1>[   16.921275] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000117ca8000
>> <1>[   16.922802] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
>> <0>[   16.923423] Internal error: Oops: 0000000096000004 [#1]  SMP
>> [[0;32m  OK  [0m] Started [0;1;39mgetty@tty1.service[0m - Ge<4>[   16.923941] 
>> Modules linked in: pci_endpoint_test snd_soc_audio_graph_card
>> snd_soc_simple_card_utils rockchipdrm snd_soc_core snd_compress panthor(+)
>> snd_pcm_dmaengine drm_gpuvm drm_exec dw_hdmi_qp analogix_dp dw_dp
>> dw_mipi_dsi drm_dp_aux_bus dw_hdmi drm_shmem_helper drm_display_helper snd_pcm
>> cec gpu_sched drm_client_lib drm_dma_helper snd_timer drm_kms_helper snd
>> soundcore drm backlight dm_mod ipv6
>> <4>[   16.927513] CPU: 2 UID: 0 PID: 187 Comm: (udev-worker) Not tainted 6.19.0-rc1 #1 PREEMPT 
>> <4>[   16.928357] Hardware name: Radxa ROCK 5B (DT)
>> <4>[   16.928761] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> <4>[   16.929392] pc : panthor_fw_halt_mcu+0x24/0x98 [panthor]
>> <4>[   16.929901] lr : panthor_fw_unplug+0x54/0x134 [panthor]
>> <4>[   16.930394] sp : ffff800084cf3750
>> <4>[   16.930707] x29: ffff800084cf3750 x28: ffff000101d1b000 x27: 0000000000000000
>> <4>[   16.931358] x26: ffff80007b36b618 x25: 0000000000000000 x24: ffff000101d1b800
>> <4>[   16.932008] x23: ffff80007b373de0 x22: ffff00010126b010 x21: ffff000101d1b000
>> <4>[   16.932657] x20: ffff000101d1b000 x19: ffff00011b4200a0 x18: 0000000000000006
>> <4>[   16.933310] x17: 67616d6920657261 x16: 776d726966206461 x15: 6f6c206f74206465
>> <4>[   16.933963] x14: 6c696146202a524f x13: ffff800082aa6c40 x12: 0000000000000630
>> <4>[   16.933970] x11: 0000000000000210 x10: ffff800082afec40 x9 : 1fffe0002039be41
>> <4>[   16.935258] x8 : 0000000000000001 x7 : ffff000101cdf200 x6 : ffff0001165f1830
>> <4>[   16.935908] x5 : 000000000000007c x4 : 000000000000007c x3 : 0000000000000000
>> <4>[   16.936557] x2 : 0000000000000000 x1 : 000000000400ffff x0 : 0000000000000000
>> [[0;32m  OK  [0m] Started [0;1;39mserial-getty@ttyS2…rvice<4>[   16.937207] Call trace:
>> [0m - Serial Getty on ttyS2.
>> <4>[   16.937924]  panthor_fw_halt_mcu+0x24/0x98 [panthor] (P)
>> <4>[   16.938640]  panthor_fw_unplug+0x54/0x134 [panthor]
>> <4>[   16.939104]  panthor_fw_init+0x1a8/0x81c [panthor]
>> <4>[   16.939561]  panthor_device_init+0x350/0x4fc [panthor]
>> <4>[   16.940046]  panthor_probe+0x3c/0x60 [panthor]
>> <4>[   16.940473]  platform_probe+0x5c/0x98
>> <4>[   16.940823]  really_probe+0xbc/0x298
>> <4>[   16.941164]  __driver_probe_device+0x78/0x12c
>> <4>[   16.941572]  driver_probe_device+0x3c/0x15c
>> <4>[   16.941965]  __driver_attach+0x94/0x19c
>> <4>[   16.942328]  bus_for_each_dev+0x78/0xd4
>> <4>[   16.942691]  driver_attach+0x24/0x30
>> <4>[   16.943031]  bus_add_driver+0xe4/0x208
>> <4>[   16.943385]  driver_register+0x60/0x128
>> <4>[   16.943747]  __platform_driver_register+0x24/0x30
>> <4>[   16.944184]  panthor_init+0x64/0x1000 [panthor]
>> <4>[   16.944618]  do_one_initcall+0x80/0x1c4
>> <4>[   16.944981]  do_init_module+0x58/0x234
>> <4>[   16.945336]  load_module+0x1c54/0x1c98
>> <4>[   16.945691]  init_module_from_file+0xd4/0xec
>> <4>[   16.946091]  __arm64_sys_finit_module+0x144/0x324
>> <4>[   16.946528]  invoke_syscall+0x48/0x110
>> <4>[   16.946883]  el0_svc_common.constprop.0+0xc0/0xe0
>> <4>[   16.947321]  do_el0_svc+0x1c/0x28
>> <4>[   16.947638]  el0_svc+0x34/0x10c
>> <4>[   16.947940]  el0t_64_sync_handler+0xa0/0xe4
>> <4>[   16.948335]  el0t_64_sync+0x198/0x19c
>> <0>[   16.948344] Code: aa0003f4 f9438413 91008273 f9400660 (b9400000) 
>> <4>[   16.949233] ---[ end trace 0000000000000000 ]---
>> [[0;32m  OK  [0m] Reached target [0;1;39mgetty.target[0m - Login Prompts.
>> [[0;32m  OK  [0m] Reached target [0;1;39mmulti-user.target[0m - Multi-User System.
>> <6>[   16.956742] mc: Linux media interface: v0.10
>> <6>[   16.958944] videodev: Linux video capture interface: v2.00
>> [[0;32m  OK  [0m] Reached target [0;1;39mgraphical.target[0m - Graphical Interface.
>>          Starting [0;1;39msystemd-update-ut… Record Runlevel Change in UTMP...
>> [[0;32m  OK  [0m] Finished [0;1;39msystemd-update-ut… - Record Runlevel Change in UTMP.
>> <6>[   17.034547] rockchip-rga fdb80000.rga: HW Version: 0x03.02
>> <6>[   17.035459] snps_hdmirx fdee0000.hdmi_receiver: assigned reserved memory node hdmi-receiver-cma
>> <6>[   17.038646] rockchip-rga fdb80000.rga: Registered rockchip-rga as /dev/video0
>> <6>[   17.040732] hantro-vpu fdb50000.video-codec: registered rockchip,rk3568-vpu-dec as /dev/video2
>> Debian GNU/Linux 12 debian-bookworm-arm64 ttyS2
>>
>>
>> Bisect log summary:
>>
>> git bisect start
>> # good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
>> git bisect good 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
>> # bad: [d9771d0dbe18dd643760431870a6abf9b0866bb0] Add linux-next specific files for 20251212
>> git bisect bad d9771d0dbe18dd643760431870a6abf9b0866bb0
>> # bad: [2aa680df68062e4e0c356ec2aa7100c13654907b] Merge tag 'sound-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
>> git bisect bad 2aa680df68062e4e0c356ec2aa7100c13654907b
>> # good: [8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88] Merge tag 'net-next-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
>> git bisect good 8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88
>> # bad: [b3239df349c2c2c94686674489c9629c89ca49a1] Merge tag 'drm-misc-next-2025-12-01-1' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
>> git bisect bad b3239df349c2c2c94686674489c9629c89ca49a1
>> # good: [2e640e8e7b9e9fc0f42c1e15ea0e02d00916ad57] drm/amd/pm: Update default power1_cap
>> git bisect good 2e640e8e7b9e9fc0f42c1e15ea0e02d00916ad57
>> # good: [89b34ebed02ee39ae02069dcf2e5728aceec9deb] drm/panel: ilitek-ili9881d: Add support for Wanchanglong W552946AAA panel
>> git bisect good 89b34ebed02ee39ae02069dcf2e5728aceec9deb
>> # good: [31d3354f42c0da34415164a1f621a195caa1f1bc] drm/nouveau: verify that hardware supports the flush page address
>> git bisect good 31d3354f42c0da34415164a1f621a195caa1f1bc
>> # good: [ee31621316cc20108eb2075de5d57f2cbd295677] Merge tag 'drm-msm-next-2025-11-18' of https://gitlab.freedesktop.org/drm/msm into drm-next
>> git bisect good ee31621316cc20108eb2075de5d57f2cbd295677
>> # bad: [e5719e7f19009d4fbedf685fc22eec9cd8de154f] drm/colorop: Add 3x4 CTM type
>> git bisect bad e5719e7f19009d4fbedf685fc22eec9cd8de154f
>> # good: [b1075ae1a3b56fd0b1275caf51bcc633f665bb19] drm/panthor: Add arch-specific panthor_hw binding
>> git bisect good b1075ae1a3b56fd0b1275caf51bcc633f665bb19
>> # bad: [303e9bf147b3a1b48a6d7079f2924b7d43662805] drm/vkms: Add kunit tests for VKMS LUT handling
>> git bisect bad 303e9bf147b3a1b48a6d7079f2924b7d43662805
>> # bad: [ab3490493c73374862e47ccc00d3dbb89228f86e] drm/panthor: Add support for Mali-G1 GPUs
>> git bisect bad ab3490493c73374862e47ccc00d3dbb89228f86e
>> # good: [ee4f9af07933648f2f9337d7b24da5562a594399] drm/panthor: Implement L2 power on/off via PWR_CONTROL
>> git bisect good ee4f9af07933648f2f9337d7b24da5562a594399
>> # bad: [51407254986501b19681d55531963f1ea58e89cd] drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
>> git bisect bad 51407254986501b19681d55531963f1ea58e89cd
>> # good: [9ee52f5cdc45e397fddad2a9ed879c72a8fcfa65] drm/panthor: Implement soft reset via PWR_CONTROL
>> git bisect good 9ee52f5cdc45e397fddad2a9ed879c72a8fcfa65
>> # first bad commit: [51407254986501b19681d55531963f1ea58e89cd] drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
>>
>> Please let me know if further testing on rk3588-rock-5b would be helpful.
> 
> Could you try with the following diff applied.
> 
> Karunika, do you remember why we have to gracefully halt the MCU
> in case of an unplug? Feels to me that we can just pull the plug
> by writing DISABLE to MCU_CONTROL, since we don't care about
> warm boots after an unplug happened.
> 
> --->8---
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 3641829aeb52..2c4e7aa5ba1e 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1266,10 +1266,6 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>                 if (ptdev->fw->irq.irq)
>                         panthor_job_irq_suspend(&ptdev->fw->irq);
>  
> -               panthor_fw_halt_mcu(ptdev);
> -               if (!panthor_fw_wait_mcu_halted(ptdev))
> -                       drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
> -
>                 panthor_fw_stop(ptdev);
>         }
>  

Hi Boris,

You are right. We can just pull the plug on unplug. Do you want me to
push a fix for it?

On another note, @Aishwarya you might need to copy mali_csffw.bin into
/lib/firmware/arm/mali/arch10.8/mali_csffw.bin otherwise Panthor will
fail to probe.

Kind regards,
Karunika

