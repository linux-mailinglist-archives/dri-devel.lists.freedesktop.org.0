Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D87C05521
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72A510EA04;
	Fri, 24 Oct 2025 09:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="R7JkveIo";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="R7JkveIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013061.outbound.protection.outlook.com
 [52.101.83.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B71810EA04
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:27:03 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gqou3HfXNtzsqew8hcNzEGJx2GJ3mySEO2DgINGTWO07HW3t4vUYyHbziydM3UzRmb0YapdH71n0c5+O2pAk7QW1SzAMqqjswQe7DOLzhCxX1KIernL6gZRTHNLa0aFMWC3XJZw1KCAtcqwm4qYaHFJo264NjGd2sc23vjpw9SY75hl6TnHFIcVcJer8Al1XIgK8KdzKfh3GKbJ1zG0dhU46YIfSimTg7wnkuMPRo5hxdJMBV5UugiYonKpRflrxpa5KgHSi+B5HCCvFgMHyDTZxYz67ukVtdC07WUq7+J3irXqUVfMZr8z71TJ9drYVSDYgOzWU5Bg1xEUzLU/NnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlF0xYLfHFDB3KOua+sXt0KpsbSmf/gzY6+prpUZrWw=;
 b=I//Y2sg4nHz60xAabhIoqX3yu2lt1fCZUA+au0zkPCe6sDQUvj4WEAAik1WBe4DCvbmNnc15tftGJbGErSs4P3puqNZeRpWwGjGrbGAtHBFFIH58TTbkanNLce3kvgrClfEfNlqSgJPvBWqzexW55Gy1f4l7//JjhE08wOAApE3C1kXrGc7z5lauzxGV+M/SE+LmxgzbcN2w7SPcB+saSE2d9HFtPz6UcHuYA70BdNU6uovIARDPv/UTwakyf4/T6sSky+Zu/lCirkcbOYoz2IO+6VmWJsAr2Gmm6Vr8nP4mOODZHWLOq25vwXI3jhLyvUOMtdp0h0Nv0v60qjRz1g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlF0xYLfHFDB3KOua+sXt0KpsbSmf/gzY6+prpUZrWw=;
 b=R7JkveIo9Db0HQu5DKaFgziZZqB3XrEl+iQe2bhP1rCPnWKkUitBDf96IQhDezh+C4y2bwS759j05/Cj258/YFpYZFkV71IYqPuDDEM5QgXC12RbiuQNDje1TBlL7MH7DsmJCcntQM+s4lw09rdRTeT6VGsYbUY5ZP2jGxDry7w=
Received: from AS4PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::20)
 by PR3PR08MB5849.eurprd08.prod.outlook.com (2603:10a6:102:84::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 09:26:56 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::82) by AS4PR10CA0026.outlook.office365.com
 (2603:10a6:20b:5d8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 09:26:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 09:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nw09bRwkZ8P/Cylv3mbfcXDyyvwQU90cjf1NSKK8xiVZTAjjWPhCP9cud7VMRMT506WYI+eqxINFbddQgJ03iGmBxPOnp+xnffbJupiwRS3Vwukpn/7Hg1nxSF8jV1h+GC5A6RYlgjGPMfr0WXCVS8RhMBZqPj8d9wPgoYjm57AJ00hKk7dy3KmUwnZFI0mWkEECupfvUoTurEmSi2hPnykFpgv2PMCxtdmwxI76m3LrsfHy/8Gz6LfVgTDNG5h9CaDnEihZzlxifBJPNDXMz+Y7wtrP+z1QXDikq7UgvwH1oEPby2z2mcB81J1fe2fRXXZSL9Dpt1BxZwPYyt2SFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlF0xYLfHFDB3KOua+sXt0KpsbSmf/gzY6+prpUZrWw=;
 b=SoFf4l6LYZJuG/OVJtj2xQQvm6dBWRfe7lgegz5ABQAqshQxa6mxaC2FkIBU1aX3WZ2kylwu24vdHBoRNoD6ZJyd+yfGqDUNJZVMqDaKmTsk/RqO74pHA53sBJRtZP8/Xj7JViqacjXlS5abga0A0+IsOMGRZtoMFDCJFvg/OE1swIIOW9JQUqHrxXMpFw2svQq0UF0N9u13hY/Acr0yk/xT43S+vf9axubXH7tfJ+l8Jv183TH8+cwhuZByTo7+MuwdkbBfiHEkQidbSTWS6zA8YujWssSWOOk5S5OLytKxTg5thR57sQS9WmPQiGm32dM1HulnrggK152ru67VUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlF0xYLfHFDB3KOua+sXt0KpsbSmf/gzY6+prpUZrWw=;
 b=R7JkveIo9Db0HQu5DKaFgziZZqB3XrEl+iQe2bhP1rCPnWKkUitBDf96IQhDezh+C4y2bwS759j05/Cj258/YFpYZFkV71IYqPuDDEM5QgXC12RbiuQNDje1TBlL7MH7DsmJCcntQM+s4lw09rdRTeT6VGsYbUY5ZP2jGxDry7w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10687.eurprd08.prod.outlook.com
 (2603:10a6:150:15b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:26:20 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:26:19 +0000
Message-ID: <f2a05393-b3d4-47e2-be17-248880d97d49@arm.com>
Date: Fri, 24 Oct 2025 10:26:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/10] drm/panthor: Introduce framework for
 architecture-specific features
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-4-karunika.choo@arm.com>
 <20251024084327.3332d548@fedora>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20251024084327.3332d548@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::31) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB10687:EE_|AM2PEPF0001C715:EE_|PR3PR08MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce5df2d-0b4d-4d94-5941-08de12df7990
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eVg2Q1JxQi9IeE9OQjVHKzVpQUVJOGJWRnc4TmtsTVg0MGpQc0VlcENPbFIw?=
 =?utf-8?B?YVlJNi9vTHV3MmhNRThqNXhqbmxkeXFYWm5EMTZnVytZM093T21UY0NObWJ2?=
 =?utf-8?B?UFpBT3lrRjliZ3VXOGd2MEpUN1dIQ05lT2lpVzEzTGwwMFNBWW5HcGZuWmFG?=
 =?utf-8?B?TzJ2YkNkZ0ZTNm5FaEZBbEZRL29BTExkMTloNzZKajJtRk5mRFlxQUJHOFRI?=
 =?utf-8?B?cnhyV0xlQTIvLzVjNVd1M0RkOGs4blo5YldpcTVjWVdPWE9qdUN4S21vbzVT?=
 =?utf-8?B?dzJvNkNWSTVGUWgzZll5UnhvTWRjOFZsdUJlTHB5cWtaYjlGTTNQSnd5M1RC?=
 =?utf-8?B?cisvK21qRW1KS1YrTWhyUzVUM2F6V01meGRBWXBuM0Z0Vk5vUVZTSXBMSHJD?=
 =?utf-8?B?ZlBjMzRDci9OM1R1MUg4VVh6Rmc0bkg4UDJSMEtkd2JrTkY3Mm8zd25hV1Uw?=
 =?utf-8?B?VnJ3bGVjbXhDZUljbVdqb2dJdTY2T0VvV0ZHUXpNbU9Td1p6allKODRpTUFl?=
 =?utf-8?B?MEdXZzdub1BZMGc4OXkwLzdqRElYbVJUZWRZMmtPWDMyOFRXeFFFWDhUcGxl?=
 =?utf-8?B?SjJGQ1BYVDZQOXFWNWlua05SNk1VREtidSttQU02cFp2dHpQTXlkcmRJdW5s?=
 =?utf-8?B?SjJLdlZ6dUo5RDhWQ0VzSGY3VWdqQWVsRkFLVnF5TzVhempzVUdOcGdHSU5O?=
 =?utf-8?B?Kys5bDdxcWg3d2F1dzcvdG1IU0JZcTkwQWcvVm4xdlo5MnNrMzZST3FnTnN0?=
 =?utf-8?B?RC9KWXdxeEc3VjNVeTJYZ0x4RzZWMi9pNUtzSEpWUW9xM3cybll2L3l5am0w?=
 =?utf-8?B?aytZUm05bVJQYTR6WUFJT2RjdDZJUDh1WFBORE9NVU9lY3AxQXhSS1ZlMGlL?=
 =?utf-8?B?VS9jWlNBSXNWaS8rdzVoTHBrWkJhcnN1ZGg3REpyYnN3RkN4K0g5Qzh6c1Qz?=
 =?utf-8?B?WU5UeGg4N3hvYVBFMGN2TlpBeUFZeThweFVhWTJIajA2ZlBHaER5a0hValRC?=
 =?utf-8?B?MHZQNnZTMkRoK1lNd3BJUFdLZVpQcnJBNE0vWWNNY2tVRVl0cU5McGRSaklW?=
 =?utf-8?B?V2V0WmNRa1VVSXcvYnFHQnkvVWlNMXFuWG5xMXlUcHVWSjVwZXAzQ0RLRUVI?=
 =?utf-8?B?ZEtoTjArVThLMDZyekxvN1M1MWZFVGc4SkRLRnhnL1pqV3hZOVFHV2FxdExp?=
 =?utf-8?B?ZHdTV1RRUllaSTEzQjVzaDhocWNXSmUvb1FURjRVTE9pYU9tL21sSExsQ0s0?=
 =?utf-8?B?elFqdFpVRC9LSGMrQit4OFFadVBjSXFNMTBxVnVPL3pqRm9qVEpMMHN2c1FR?=
 =?utf-8?B?TitvSGVLcVlUbHF4Z1RoUkRCY2RFUkZVdkJRU3A4SGF5YmdyelhIUDdrVjNG?=
 =?utf-8?B?NUl0UWRERWdlQ1ZIS2dGcUxtYStkaDIrRzQrTWZreEtJSFJDd3FuQmZWUVJv?=
 =?utf-8?B?M2lObE5WOXJKRlhBUUVraVd2dFJzRlVUZU5pd0VNZnp5OFJROUpSczB1b0FI?=
 =?utf-8?B?ekJLK0Yyd3RvRHd2Q1VYS2ZLeG5Dci9BVTdTcThQc2Irb1FmdUZLUTRtZTQ4?=
 =?utf-8?B?ZFdDSElXRmhKcTE2ZDhGaEtpT0Y5SDZPM1pDb0lUbFJUY2ZleDdqK2JzbzVW?=
 =?utf-8?B?dnZEbTFrbjYzQ2FiNlk3YmhENnBaYUs4eEVTRCtMaUZYTmQ2RWdGWkRCVHdu?=
 =?utf-8?B?czZpZUJYQkl4TG4ra3V4YWZvZzNlaGlZRXU4K2tPbGw2aXd2RkQrdm5PNENK?=
 =?utf-8?B?d09pUERrN2JURFZ4aVBXeXZGNmtQZ012LytkMjkrckcxQ1BrZDhiNXpwMWdz?=
 =?utf-8?B?NnQwVDlmSVhSSElQQlBqSWVjWWE0ZUZpbE5pL0JUOTNDeEZ5S2diY3c3ZDgr?=
 =?utf-8?B?ODUyN1RVSGNqeHAvNVFvWUVxMkdnRnpMb0s4N2ZoYVRWOVFDWloxb2VSNHpk?=
 =?utf-8?B?cUV3S3dMTERiOFNscDBqaWdQSjBvamFVR2RmYUlmRVpWTmJQL1Zod1krWDRF?=
 =?utf-8?B?eDBCSEdaak93PT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10687
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 72253f8e-8d96-45e0-6b6f-08de12df63b0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|14060799003|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjhhNExjeGFjSHlIRTBmRVhQUHFtTStXaFlEUHA0T0xmMjdYTWZtMjdRcTRJ?=
 =?utf-8?B?dnZ1OEYzYTBBYXpSUjN1bzRQVVJPTGdMMXFMZU5GS1IyTGl0QjEyUk9vMmlC?=
 =?utf-8?B?dE50THRlY0tXMTJZY3gzYVRabGE3WDRJb0FZbU5Kejc1SnUzV29LRnRIbm5j?=
 =?utf-8?B?dTNPVU4wcERUTThYaGFnT3JWSHgvS3FCdXBhRUJyRHlRbndrK2pyRFBtS1M0?=
 =?utf-8?B?R3pkckd1a1FWbUtqbUh2dXJINTBuaFZtT2NuVmJHVnorb0gxTEg2WEhZS1FJ?=
 =?utf-8?B?aHcrWW9lOHR1MXVsV0RqeVlDbStCUWppYm5iMXlzSlZCM3pkbEFiSnlzcTlj?=
 =?utf-8?B?M2VkcDczUHJOMHdlak5zMlU1azhJd1hCK1AwMi83ekxLdk9EY3R2SlFReGR3?=
 =?utf-8?B?YlQrRXZTOXhRY1FIRUNPTmtHQ0NBRFo2emQrdUErYjBaNTFjajRVQnhxNElo?=
 =?utf-8?B?WlZVYzZDMnQ2UmRlR1JDb2NBYnRhKzB3YXJYV0h1Y0tMNExzTncrR20xajdN?=
 =?utf-8?B?YUlFWWlaeUJ4QzdyTzB0UEN4T2VpZ2Z3OHBUcEwxTnM2VVZzTnlmdWtUc2Nr?=
 =?utf-8?B?OXR6S0htRVptOE56WGdMUjJ6bEVmcld1VGtOYm8wSEJuNk1EYnJ0Q3ZuK1Ez?=
 =?utf-8?B?UmlrVTcvMWh4dUJlMk15NnQzTUtQcVZPRThNbEx3THNFMSs2U0FVY3NyZVls?=
 =?utf-8?B?ejAzcDdrVi9vbG93TTdGcUdPc3c1Q1BPOWVtSUNPSlU5Ny95UzR5bXEyVHZD?=
 =?utf-8?B?Y25VZHFxNyt3aXAveUw5U0RaZXRkYzN5WDB1Y2RFZVcweGVOZUtmK0JWRzBU?=
 =?utf-8?B?QjBTemxGaHQ3T2VTSTdxQ1FsSm9pYTZ1c2hVdHkyMTFZb2VadGd5WjBwZTlE?=
 =?utf-8?B?QU1qbWE3VjJoNk5Kd2I1VEVpajVLb2NUZDViVUNMWnQyMEdUZkxNc1hkMm1W?=
 =?utf-8?B?N0V1YmltbFBxd1BLNHVGUVRzQXVsRFNSaEMvSVprc2IvdmdwZkRIdWxtaG92?=
 =?utf-8?B?bzJNdkM0ZVcxb3Z3TjNQOEJRTm1uQTJ5RFFBd3ZZN0Q4OXFEWmE2Y0pwUjNC?=
 =?utf-8?B?d1BXWXNmWEpHQkJIWTljWDR0UTRkWS9VcE1JU0N0SFBPSVJHZnpBa2kwYWVB?=
 =?utf-8?B?bVAyUHJYdURFdjRuRnIwYWtBQyszYlU1eWk0aC9lMFl4N3dmWU5teHMvUzZ2?=
 =?utf-8?B?TEcrVnFPMUJpVlZaOWRHQXR1elNtbjRleFQ1UmkweGUwRHBrSnVnTm56bEpT?=
 =?utf-8?B?L0ZRMU0xcnk1Skl4ei9PYVIrOUZpZmg2d0xlQnRyUFB0SlFJeFp5VTRuRGts?=
 =?utf-8?B?QThrTUQraHRsRTNmbGRucVc4NVo5RjRrRmVVditSQWNtNWUvUDl3M0hTb2Zw?=
 =?utf-8?B?eG1YeHhLVTJNUXhwbEkza3R2RlpkaVN3SlZqNjU5bXVtbWU2WkN3YzZWdDIr?=
 =?utf-8?B?Vm00SWZrbmFTSk5QOVZjajMyQWtDSnRkcTBTUjExc1M3WGdKVy9DS2t5M245?=
 =?utf-8?B?YnRtVmt0RlFxMmpiRWlxNEdGSnVyRmVyYkx2cUNNVldMV1pSWlZBTTRXM3Jx?=
 =?utf-8?B?UnJwQWdsSlllbUVmYUkwNTlPL09SaS9jYTliRlhML29hMTk2bENCQWR6ZEpz?=
 =?utf-8?B?bGUrNVYwdHdnYUJ3bXRvNkdnMktvNVN3S1RoVDdBRDY0ZVhUd2t1b0k3Zkhu?=
 =?utf-8?B?VHk1bDZxRDNBbGpDSXFJUjYyS2h0bHJFK3VPbkxwUmNNSXVmVnhqNm5GMC9D?=
 =?utf-8?B?M0xMQnRVaHFud3ZYTFo2WTB2d1RWQmR6a3hyNmg5RFJETk5vdUR4eDZ5RzZp?=
 =?utf-8?B?ZkgxOXhja0J1SW90aFEzT2ZhbU9nSEpnTnBLZ3Nidkt4L0haUFN2RHZBL0JV?=
 =?utf-8?B?ZnJCSFBDSFYzcVJWV3dRRzlHM3pUWGNWcDdkVm1JdXZOZnpIM2xNa0ZTMWhj?=
 =?utf-8?B?cDBUWnlQN2F6dzRZVFZtKy9aNTNIekdreUJLdUF1bkJMaEtabXN3UzFUcHNR?=
 =?utf-8?B?dEdoN281K0NHYTM1TDVOVEdPQTBlNVhSYnJQYWpFcWZDWUZBTDJDMXlMRkxh?=
 =?utf-8?B?VGtzaTdJR1FSaE5GZmpXdExYWlo4dTlHdWZyZzdNakQ4Yjl5NXkyb0RJN2o1?=
 =?utf-8?Q?aKb8=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(14060799003)(35042699022)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:26:55.8620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce5df2d-0b4d-4d94-5941-08de12df7990
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5849
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

On 24/10/2025 07:43, Boris Brezillon wrote:
> On Tue, 14 Oct 2025 10:43:30 +0100
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> Add a framework to support architecture-specific features. This allows
>> other parts of the driver to adjust their behaviour based on the feature
>> bits enabled for a given architecture.
> 
> I'm not convinced we need this just yet. AFAICT, the only feature flag
> being added in this patchset is PANTHOR_HW_FEATURE_PWR_CONTROL, and
> most of this is abstracted away with function pointers already. The
> only part that tests this FEATURE_PWR_CONTROL flag is the
> initialization, which could very much be abstracted away with a
> function pointer (NULL meaning no PWR block present). There might be
> other use cases you're planning to use this for, so I'd like to hear
> about them to make my final opinion on that.
> 

I see your point — the intent here is mainly to have the feature flag
reflect hardware-level changes. In this series, for example, it
corresponds to the addition of the new PWR_CONTROL block.

Another use case would be arch v11, where a new PRFCNT_FEATURES register
was introduced. In that case, we might want to adjust the
counters_per_block [1] value depending on that register’s value.

I would also expect this mechanism to remain useful for future hardware
revisions, as it provides a clean way to describe architectural
differences without scattering version-specific checks throughout the
code, while still being lighter-weight than function pointers.

[1] https://lore.kernel.org/dri-devel/cover.1753449448.git.lukas.zapolskas@arm.com/

Kind regards,
Karunika Choo

>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_hw.c |  5 +++++
>>  drivers/gpu/drm/panthor/panthor_hw.h | 18 ++++++++++++++++++
>>  2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index b6e7401327c3..34536526384d 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>> @@ -186,3 +186,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
>>  
>>  	return 0;
>>  }
>> +
>> +bool panthor_hw_has_feature(struct panthor_device *ptdev, enum panthor_hw_feature feature)
>> +{
>> +	return test_bit(feature, ptdev->hw->features);
>> +}
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
>> index 39752de3e7ad..7a191e76aeec 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.h
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
>> @@ -4,14 +4,32 @@
>>  #ifndef __PANTHOR_HW_H__
>>  #define __PANTHOR_HW_H__
>>  
>> +#include <linux/types.h>
>> +
>>  struct panthor_device;
>>  
>> +/**
>> + * enum panthor_hw_feature - Bit position of each HW feature
>> + *
>> + * Used to define GPU specific features based on the GPU architecture ID.
>> + * New feature flags will be added with support for newer GPU architectures.
>> + */
>> +enum panthor_hw_feature {
>> +	/** @PANTHOR_HW_FEATURES_END: Must be last. */
>> +	PANTHOR_HW_FEATURES_END
>> +};
>> +
>> +
>>  /**
>>   * struct panthor_hw - GPU specific register mapping and functions
>>   */
>>  struct panthor_hw {
>> +	/** @features: Bitmap containing panthor_hw_feature */
>> +	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
>>  };
>>  
>>  int panthor_hw_init(struct panthor_device *ptdev);
>>  
>> +bool panthor_hw_has_feature(struct panthor_device *ptdev, enum panthor_hw_feature feature);
>> +
>>  #endif /* __PANTHOR_HW_H__ */
> 

