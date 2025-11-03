Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C93C2E129
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 22:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34DA10E48F;
	Mon,  3 Nov 2025 21:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="YKhG5LqL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YKhG5LqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001010E48F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 21:01:37 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b7mYLcmC8M0vpd3vkzuGtj7UB35T6OIMFMSnUf7pJoLjdKmAdieZUfdREyMa9lwBNP9wtMcGyemWLeCRCXQ+jIaFkeyIeCKCG5WGvwACCLm7DokzSA0LcaCgYmVUMNGupa9qb25jE1cXAG8Auye/aEWSY5fZWQWRPJD85f4cOWk9YxFIv3ixNll77azTLZ1wf0ia4nGe/MuCyxH0EJr1YBHLo9WN8NkwoliquzYbPUrNirKAzziDXLc/l8IeLu2kPrmBSV9PvQA2Gj25U0pp4ngp7X4qd3obDllRmo71BpFicDXZ2lCSQvxeZt+ksJVlRuAPz8D3IJz+hZwNu1Ag4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4qzLEVdx9Gh37FO+cNz+LuOmX8ZhFmK/DLsyFxrNqM=;
 b=X4f+W2tB8YyYURY9rdQRXWCiL24Wb7qDjq5qu3zVNf8ab8NJBWfEzwiY7Mo3JQBWZvmzhPG3Gnd5AeJgz/hcPw3+xEEoNDvrSNXBH51gRMs/9YYRb33pFO01aDaI22IFkK+zJo2lYnNA/C970yJNBByxSyUV8rT3JiSPEPIdj0WW9XnxG7H/LArEYCWEIp1dyczPu6QJ08fsSXOFkjmufp1p0rGGrK3kWdZ3wZwJjxgxPogmtQ/PkLTuHz2OcWDyKaG55R6A1vTaIzZg26CbZ2SdmajG/9TnapsPJj+RHBRd1nJznJ/5OQ+8skvvfGC1WJm1EVlg79iAj5uPMV4bdw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4qzLEVdx9Gh37FO+cNz+LuOmX8ZhFmK/DLsyFxrNqM=;
 b=YKhG5LqL8aFMpiVJqaN5cgvBSXaKohgn22jYIwUfsg0asYMAVLaf1VUDxXjQfsnEu9sop+CRl9rhUaXgOZTwBD+Bi5xHLETIDJLR8RebHi0y2B7VXyti/TttDuoz5kbr00jsJsxgSzGDADtKsCm+wpU2y0ddTHv8+MdCPST5DRM=
Received: from CWLP265CA0498.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::12)
 by DBBPR08MB5945.eurprd08.prod.outlook.com (2603:10a6:10:1f7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:01:32 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:400:18b:cafe::62) by CWLP265CA0498.outlook.office365.com
 (2603:10a6:400:18b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 21:00:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 21:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yq1KeP14XROTqPRIM/z/BZrVAKPE33bjzFRCs+0qStle3LTYDcfJwTbSyJSXIBK96erLHHcffZjsiPnnNMQN1S0QVItUkj73SR36KOGrJ5JaY6ImvFi0cev0bUeR3zk1nJtRlWioWnvK05QoIVGeF3vAUSQu+EWdwYjR2U+gqoaKIotWvGd4WQLxa96NcTBOa4v1pb3kM5f6l/2N0kRRCAA6+APuux/J+QDokBw1ly5P/kciF8x8rwQYwvFCk5wH9W6RgTXJnqlZyF1Y+YXfhVvpzL57+ERMF7j3CytJldrtTx+ZDAzncVJK5YZnBHqC+cF1Z4QCbdIcG9knXjGNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4qzLEVdx9Gh37FO+cNz+LuOmX8ZhFmK/DLsyFxrNqM=;
 b=W/tbVQk1GY60OmxHlubGusUOi6+UHMbJPsyO/0M4eQaK2T5jkhkIhB/SBj827T0yxxyTbmQH5Tx8WU5NLJ9MUGZCV8NkEFknVSa11nYfm14ALoeyo2PkpYc93mgbVevct2S9avU+KK8pGVcLgs74BbmFIgGhm0Rxdv+yqTGSYfK9e7FGQ6z+V4o2ofS75RlZpz3wks4vfl5YPj6qJt0/bP9n66G0tmCjayVTWrF9WZF3d+uyz5YTetim7ggPpL7nWccvMk7HGc/qPRcN6bhaF7Qt1+H5P/1l/8dWrWnAZKae+9De7mhxHXKxbYrdNKN1pI4pRq7uuTcbx39LaN+Ocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4qzLEVdx9Gh37FO+cNz+LuOmX8ZhFmK/DLsyFxrNqM=;
 b=YKhG5LqL8aFMpiVJqaN5cgvBSXaKohgn22jYIwUfsg0asYMAVLaf1VUDxXjQfsnEu9sop+CRl9rhUaXgOZTwBD+Bi5xHLETIDJLR8RebHi0y2B7VXyti/TttDuoz5kbr00jsJsxgSzGDADtKsCm+wpU2y0ddTHv8+MdCPST5DRM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB6184.eurprd08.prod.outlook.com (2603:10a6:20b:29c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:00:59 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 21:00:59 +0000
Message-ID: <dedbbff4-0c06-4d6d-b3dd-73cdc592a98e@arm.com>
Date: Mon, 3 Nov 2025 21:00:58 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/panthor: Make panthor_vm_[un]map_pages() more
 robust
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Lars-Ivar Hesselberg Simonsen <lars-ivar.simonsen@arm.com>,
 kernel@collabora.com
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-4-boris.brezillon@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251031154818.821054-4-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB6184:EE_|AMS0EPF000001A7:EE_|DBBPR08MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 130b2042-9c80-400d-72bf-08de1b1c2a9d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VjRGajJWblU0UDRRUVJuV1JUUWk5a1JMTE1NUUtPMGpldXAwZllSZWYycW1o?=
 =?utf-8?B?dVRnVFZ0NEdKeTFRYUE5NVFhNlpiaER4M0tueUVqZUdTZ1NtdHV0Vno1R25p?=
 =?utf-8?B?SHhheWpzSWVaUkxCMHdLVjcvbk5vWlFVekt6R2VHNkV1U2ZmYUd0V2QwREkr?=
 =?utf-8?B?aGgzWG9ySTRBSEV1NEUwMGlOdFRWcEhXYm9CazR5K0JMSHd3TytYZ1k2ZnpH?=
 =?utf-8?B?UFZYc0N6b25OZFVSeWtabjJYSkRRcUFjcFZscjBNTnhNb0VBUjBSbTF5SmQx?=
 =?utf-8?B?OFJLNVdrd3FiMUEwdk9NQlNURWt1UkgwMzNqb1ZPbEFqN3NYTlljTnhWRktu?=
 =?utf-8?B?bkNrYWptNkN1bzNMUUt0VXJxdWtHUVU1VnQ0WldENXNCL2M3TzlYQzFKY2ZM?=
 =?utf-8?B?MC9HTmxJWGQ2T2owQU1CTXF6dE5TZVNMeUpRaERzVGhVcUJkQVRhcDA0TTdJ?=
 =?utf-8?B?N3ZvU29SdThEM1hlaUFCbGQzSFlRVElIUE9FTVFQQ0U2NXlPUGVMNE9KUU5I?=
 =?utf-8?B?MnlnWkErSk42N0pNTktNdmd5eFkvWUpJWkMweEx3WWJmcG0wTGs4U0ROd0tZ?=
 =?utf-8?B?MlM4Ykw3VytrcFJJZk9VTmN4ZXJJSjZldUtEL1dWR2NxMlVndVg5NW5scU0v?=
 =?utf-8?B?U1QrZk9UK2UzSjM0UXY2NEJtUGtFQ3liOVY0amhHRGtxdkNYdjFISTlqOG5P?=
 =?utf-8?B?WjZiWkdyNWpET2wrdUNnWGllSGlQdEVuTngxendvZTRnUVVvbUhyZWNaZnQw?=
 =?utf-8?B?YUdpYkppV3FyY3FoVEdVTDRFNW5KaXNibVhEWDVTeWVFUWxZMDhDZE4rRUg4?=
 =?utf-8?B?ZFZkakx6dDJrTVM1UGZoWXFjUGZ0NFgvVmduRE5qc0Q0Snc4U3p2Q3VWSkZU?=
 =?utf-8?B?Mlp2WFRKcUljT2R1RHkrVVZPU1NqbVJ6Vko3dWE5WEFBaDVIMGdWSlZ5aC93?=
 =?utf-8?B?Y2NWOXFvN20xOFZoU2szQVFYelQ5WXU3eXJ2TCtxZ3NyVkxWM3VCRW51ajNN?=
 =?utf-8?B?ZTZqaEZFY3EvR2ZocCszenp2Q3VYVVAvRmx4WSswODJ6Z01nKzhJalNoNVZv?=
 =?utf-8?B?Y2VMYk9MKzRNdTg3NE1VdUdMUDlsem1Xd3RQRVpuampyamtCaVlGajhRMTA1?=
 =?utf-8?B?Zi9WOFhXYm5kZmhCeGd2bU1uWUV5K0xFak55MnhGUXNZZ3p0YTAybWNRZzgx?=
 =?utf-8?B?a3hnZ1Buai9NSVJLblVxaUhVWEdvMVVVNDFzcDl0L0tYTHlqd2ZwUi93YUo3?=
 =?utf-8?B?M3FOdGQ0ZmNjd21XdzAvVzNjbTg0UGluY1A5cmFPUG9OYkF2UVhGNFpZNVVs?=
 =?utf-8?B?eFpUQ1V1cFZPc0k5YTNJc1pxaU93dWE5bWVzczlrNENhNG5QVldSRkpFWXpK?=
 =?utf-8?B?R2NlKytGbW91a3JuU2xXd2RsOFF5ZVZmUWlkUnMxck00KzI2MkJBTHAzdGlG?=
 =?utf-8?B?T2ZNd29UV2JVcTRjYzdTREF0WWpkdVY1bm9YR04xZWpEclZCQzJQc2t6N1ZT?=
 =?utf-8?B?OGgzZWJxOTZiVmlaQ1ByUGdiTU9TTi9MdjZIUmNwVTFzU3JoczkxMEtFK0RP?=
 =?utf-8?B?a1gyWTlZaG1aUlZybHN3UExHSGM2RXBYR1ZldVUvUU5tbHY4S0NWaDJnNmJ6?=
 =?utf-8?B?RGxNR2phL3V6akxoRUZaOGZmTVpRZURrTHZWUmFpbllUdDZsYTZsUWIyZEp5?=
 =?utf-8?B?OTREbWp3QlgzQ25pZHViWDJud2xKTXNyZEdZdFI3dTR4QVVqbzVCMHFyQmU4?=
 =?utf-8?B?c1RpZXZlYWs3WENTMWhpUjBHUDBuaXp0elJMMW5EdnM1REVVUG9aOXY2VE52?=
 =?utf-8?B?cjcxT0IreXovYTZSaUdHcWlGTnBoS2x0aEx1NUxvcU5OTzJGcXh5emdma0JH?=
 =?utf-8?B?Z2NQb2ZtQ0tocHFtY21XemlQa1B0c0VIdXgxWXhQNjBIUjBCQnp6YUR2U004?=
 =?utf-8?Q?03jfCi0ot8pszCJJnnSM/YkrVm388uPu?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6184
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f6fc87d1-3259-40cb-c6fb-08de1b1c1722
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|14060799003|82310400026|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEtZazhNckJ0b3dIRUVSZzNwTE1LbVFmSDJ3aDVDSTRoQTFiRkFrYXhBV1F6?=
 =?utf-8?B?T1B3Qy9yd2JndzlkVE5HWGcrWE9relJHcTR1c0lWUklFOFhydGl4Q0Mxa0VD?=
 =?utf-8?B?ZktXa3hmVEErTTdUdG5BcjhMRUpJY1hSTy9lWFA4RnRTV0I4UnVUNnlmYnJ2?=
 =?utf-8?B?bjc5b3EzSk94SEh6UStTRDJvUWxZNGRsblR6N2pKQmNqeDUwWWdTOEV6dnlK?=
 =?utf-8?B?RFg4VkZ4clZEa3dOMFk1V0txMFVqUUhhTlZZT2RQdFJOeHJZZENsTm9VRldR?=
 =?utf-8?B?RDdqZTJPaThpajloczVMRnIyN1F1dnEzc055RFhNOHdZTGlLb0JjWWNSQ0cz?=
 =?utf-8?B?OWRTNExIakZoa1c5NElJbFJFRUQrdzkrRWZRVWNnbU1PZmdtTThyYzAwVkRR?=
 =?utf-8?B?VnNGd28rRU9ud1E1NG9yUStKOHM1WkMzVFVSYjlVY0JtVlhkTVZ3VnB1VXFT?=
 =?utf-8?B?U2x3QU9OWXdoYXZTNmhWSllHdk93c0kvREdOMDJ0SHlJdkIvSnJHZWl3aDdL?=
 =?utf-8?B?eHNaM0xxMnJ4dWZtTjNsN3UwMDVJU0Z4TU1QOFZVQWxGa3VHQlBSdEJWbGxh?=
 =?utf-8?B?dGJCTFg1N2hWY0VOK0hibUE5cjJjM0hENXdLU211WDBaQUxudGhCZEhqVGRE?=
 =?utf-8?B?Z2ttUURVU1p4cjl4U1FZYnFoM1lvTFp6UlNMTzU1QXNESlVWRXF6aksxNzZL?=
 =?utf-8?B?TVFDUk5TQ0I2Nk40akE0cjYrb0plOC9EeTdUaWh0cWRvYnJKL0pSU0Z3VUFw?=
 =?utf-8?B?VG5FWktSZGFvR3Z5SExvM1F4TFl0WjRCSi9WTFdnT0FxcENGYy9sdGh0M1lQ?=
 =?utf-8?B?b3lZdm1KVmtmMEdZeDdYelE4UFRCQnkreVRtQnRmWDMzMkQwUXltRlYyaVpP?=
 =?utf-8?B?dG1WK1dWY2dYWTJ3S0h6YTRaT3AxaFljT3NjRHhaRU95VENNQ0xWODZ2eTRn?=
 =?utf-8?B?ZVZsUnJPbUN2L1YyODZqanNSUitpOTBOOFJGR0d1UVdhQXNVdFpzZXZidDJR?=
 =?utf-8?B?dVdJZXhSNWNXZWRLdk9vSTJ3TG5KRVRPZ0pqdTQrWmlydzJjWHVsbC9qT1Vz?=
 =?utf-8?B?dDBUSm5rUVphT1hUWmE0Z0JUYmluZS83TnlxczdKdGFzbmxobTFVS04yRmxZ?=
 =?utf-8?B?RGYxbFpnT2MzMUF6OUZXMm9PckZ0dnZBdHAxK3dDTlhxQ0JtcVdweWw3T1dZ?=
 =?utf-8?B?TFJyRzJYOTdGZVhRSGw3RHQ4aWZzbUIxNzFjbXhOcTl6OEVEWmY2cWdxeml5?=
 =?utf-8?B?TVBFbzdDRVd4YUhhSkpYMk5aVllUdHZBQVB6aEN4ZnpaNFVlOWlzQnF3dkRk?=
 =?utf-8?B?QkVQT0U1eldVSVJzRVd1UThLODFqek9Cd2llaFFLUi9uYm8vM3NwZktyaG9q?=
 =?utf-8?B?a0kzbzVBSHhPTkFzdjIzUk01WGsvM0NjclNUYlhnOU8rejlMVWxXeGRoNHBI?=
 =?utf-8?B?eTNsekZDV3lZWWMyRmZFM2hPbHk4RUlYc01uRTZGMVdmTnRTU2RzRzdpaWgz?=
 =?utf-8?B?UkU2SkZyMGprTko2bXpPVUZuTzMxeXU5azI5a3FRNEFlSGJacENlUk1LNE5j?=
 =?utf-8?B?Vk52ZHhtUWFUWm5MYms4WVJYZGphNktFSURUWXhTeENhZkxhZ0dHb0pDNXdm?=
 =?utf-8?B?b3BOczQyTEc4RDhFY1RPdmlGOVpNZW5zUHl2cDhhdjEybmoxZWdjV3JQWmdS?=
 =?utf-8?B?NmczcCtzQ3IyZ1JmUFFxdExDQnJsZmNuUGd5dTBTNjNpWktUQkYxdUVweGY3?=
 =?utf-8?B?bEticWkwWTdEWE1XMUpMbjdHK2x3NEhPeEJsQ0kxa0RoYXZhNWdHWmlnT0JG?=
 =?utf-8?B?TlN2TWNOYXp3MlJwZnhidXRHWHAvMTd0VFNNYitueDl2bWh0L3QwZndiNnEv?=
 =?utf-8?B?UHUzelczMmRSdFBtZ1JOTWtjanQvNEZuWFpVbmg2VUtPNytoS05NMG9qaldz?=
 =?utf-8?B?dmZnTTk1MkJDUWJ4QnMyU2tOYzFPb3VtR0piY3JNSmRMcnNNNEp1dVcrOHQz?=
 =?utf-8?B?MWNsUmRQS3FjVGI1eVE0SDEwU1FlY1lHajhBbTdXZGcxTFJmTXBlTXE2YXk5?=
 =?utf-8?B?NG13VkMwNGpXMU5qZThJa3kzUlBkdTh3MzBRelp5VG5idXJPQmdsSGlWTXJh?=
 =?utf-8?Q?hmIw=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:01:32.0169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 130b2042-9c80-400d-72bf-08de1b1c2a9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5945
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



On 10/31/25 15:48, Boris Brezillon wrote:
> There's no reason for panthor_vm_[un]map_pages() to fail unless the
> drm_gpuvm state and the page table are out of sync, so let's reflect that
> by making panthor_vm_unmap_pages() a void function and adding
> WARN_ON()s in various places. We also try to recover from those
> unexpected mismatch by checking for already unmapped ranges and skipping
> them. But there's only so much we can do to try and cope with such
> SW bugs, so when we see a mismatch, we flag the VM unusable and disable
> the AS to avoid further GPU accesses to the memory.
>
> It could be that the as_disable() call fails because the MMU unit is
> stuck, in which case the whole GPU is frozen, and only a GPU reset can
> unblock things. Ater the reset, the VM will be seen as unusable and
> any attempt to re-use it will fail, so we should be covered for any
> use-after-unmap issues.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_mmu.c | 82 ++++++++++++++++++---------
>   1 file changed, 55 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index ea886c8ac97f..a4f3ed04b5cc 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -846,12 +846,32 @@ static size_t get_pgsize(u64 addr, size_t size, siz=
e_t *count)
>       return SZ_2M;
>   }
>
> -static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 s=
ize)
> +static void panthor_vm_declare_unusable(struct panthor_vm *vm)
> +{
> +     struct panthor_device *ptdev =3D vm->ptdev;
> +     int cookie;
> +
> +     if (vm->unusable)
> +             return;
> +
> +     vm->unusable =3D true;
> +     mutex_unlock(&ptdev->mmu->as.slots_lock);

Please fix this. Need to call mutex_lock.


> +     if (vm->as.id >=3D 0 && drm_dev_enter(&ptdev->base, &cookie)) {
> +             panthor_mmu_as_disable(ptdev, vm->as.id);
> +             drm_dev_exit(cookie);
> +     }
> +     mutex_unlock(&ptdev->mmu->as.slots_lock);
> +}
> +
> +static void panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 =
size)

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
