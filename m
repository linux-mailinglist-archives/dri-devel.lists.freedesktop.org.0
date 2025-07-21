Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2A4B0C0CB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078F10E4C9;
	Mon, 21 Jul 2025 09:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Uzo/okXQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Uzo/okXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DF810E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:58:52 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tregEvnhcLYOxh+i0J/wplLryCEyFLS5YmFYAXP/M7CE8z86Ixlzr1AFymOzMf5nm+LrMUGe/kJljksPqKLZ95q00LQDVm0rI1AqjHhlss3bUDI+T5X3G5wUOMqVg95tSGZuliGPhzRAwBOK57S64xaygW+WzU6YNApWpsW3j8b0StHR3xJtSnAqV8N8NpKIrKVNFsBkW98/x0Jg9MuebrMqYVMpVxKZa5Xv41VIGpt8tgbFUVKo8CFSkCM3rHeMOI2+UhuuZdTEIMKepguEmfuiM/IgVHefuWjdev5PBTye3DxoBU2HP5djrS2+hTg9q+iPJVt95E7t+ixfZ6/LEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxBKHJTyJq5H5WV93CZXLHOijb7vd84vAwV29LTDBPc=;
 b=QV9kFs35TfDcBxnoGBUKDyj9TuQUSt5O/P2yRECtZMTzswfZ/sTytSXcWpCJAovdJqSviyE/tiPSdRpUZOzTnvaxhUX7O/o4Y1gsuF1B3+L0b8eNzG9v9XQKaH0xFukgPAxfw6TnEdgjptcACmSUA83s8aEf8BMEK2TXrfjtZWEFb/DeYNdnTtfNnmxtAuRtIAg5E5At4r7lr2+c7iDXp0/0qUXCAlVzlATmsRAicvphFgK6mt57UYnqiaUtX9PhdyLZTl+04/hS090ZEV6u5jcNYDVRIhnJxBZ5JvrCIum2cPK7fOwUhvxGDvxu3ZLz/GFVJqwYBlFfJfoRNhUeuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxBKHJTyJq5H5WV93CZXLHOijb7vd84vAwV29LTDBPc=;
 b=Uzo/okXQPyXp3zpIjch7JFgx6HrxgN7ezUUt6seYO2oxOBR3JJV4XeItJgDJ7TFLJrnjuak7GfOapJW3k8H/GFSX4NXm7hBH6kCzeOblTu6/hmj8RgK41g9IwZB2kLxgIglfu9fjT+axZ99t2zPGCwA9o2hPr4NLqNs43WuJ5LE=
Received: from DU7P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::13)
 by PAXPR08MB7335.eurprd08.prod.outlook.com (2603:10a6:102:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 09:58:48 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::76) by DU7P189CA0022.outlook.office365.com
 (2603:10a6:10:552::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 09:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Mon, 21 Jul 2025 09:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhCeyvUSZFUs1uF1PvrFeuXy2ttBBwH0J4WC9Nf8WMM9cnxvozqszTW4fAkKOKN444Im7/bfZvzMwnzWuo+OPqIq+r4CjLbClzyItahV6S5ZWKUDiCGwiZ1vQQIfO+4p5UDWqZfHynnfKpJ0sQahJRsDHIPOcIDCNV17Pi+DzdPFwZ59wZUOFW7l3XQ/xvKHjWC0cSADmUvpH4TuwcMbXCaO4Vxn4Rah7/io6RZ2Hpji9asI20GT0KbxOumwpM5pPqQSAeiVn2jgAW3OIRUrt9OeI1eOsBL0MROvbvehazN1D7mKhmjr5a87CwOSoAWuYM/yRj5X/fwoB8um/slKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxBKHJTyJq5H5WV93CZXLHOijb7vd84vAwV29LTDBPc=;
 b=UeX/tl0zjNUg9FMFMhi354kTUoGE2xjusYWWLqmzbwD4OA+HJN0nja6fI07Kjf65NB+OOOGG6UedyGxm6Ts5Q48gSoDbzSFXq98M4+YmEHCxGgYAUnhAWIXB/cIF5xPpXHDpV1PYfqAA39/YHrwuTrrc4TGqFeWCXPgib2H6ba74tyXzFb9vrRrcsc4XnoBovoCMV9ac/4awXkAORXohMd85i3K6n6CxiS0LICDlSgTPV+jDHE0Qc93DcZ/F/+NZ7H7V1JJCD5f9+igmB0dAbrZA8VeQQvWLgRkr1qYx5XABoxPGW2zELFrjyvvzTu5VhZr8cNoAK9ZpnuOO3bkxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxBKHJTyJq5H5WV93CZXLHOijb7vd84vAwV29LTDBPc=;
 b=Uzo/okXQPyXp3zpIjch7JFgx6HrxgN7ezUUt6seYO2oxOBR3JJV4XeItJgDJ7TFLJrnjuak7GfOapJW3k8H/GFSX4NXm7hBH6kCzeOblTu6/hmj8RgK41g9IwZB2kLxgIglfu9fjT+axZ99t2zPGCwA9o2hPr4NLqNs43WuJ5LE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by GVXPR08MB10716.eurprd08.prod.outlook.com (2603:10a6:150:149::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 21 Jul
 2025 09:58:15 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Mon, 21 Jul 2025
 09:58:14 +0000
Message-ID: <637d9eb7-9d84-4540-97c1-ff38709a2c43@arm.com>
Date: Mon, 21 Jul 2025 10:58:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
 <057bf373-7860-4b93-93c2-218adbff61a2@arm.com>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <057bf373-7860-4b93-93c2-218adbff61a2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::11) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|GVXPR08MB10716:EE_|DU2PEPF0001E9BF:EE_|PAXPR08MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 8031c986-460e-4da3-6c50-08ddc83d2fdd
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?b1ltTnVoQWtaeitnbGZqOGVrbU14TVN1VUFWUnJpZ25FbitQVXNhc1Foanc5?=
 =?utf-8?B?U1lIZ21ZeCtNK2tSTXFodVJZMmlGcGRyQW02dDhKbGdScUdZRUc4SUQ5TGZH?=
 =?utf-8?B?dlhiSm1nSnY2K0tvRTFLZFBZb0NRNFVRNmR2c2hMaDY2ZWZXbzAxeEdtTGtG?=
 =?utf-8?B?SWZ1NGczQnJJSHlraG1lRXFtcm9pR0N4eTdrT0tMbmhjTWNJVVpYRVNlSWRN?=
 =?utf-8?B?dHNucFAwcjFRcFJ1VHhyTkF3SHI5RFdqbTdwdlI2aWFrLzI1Skg5YWpORUdj?=
 =?utf-8?B?QTQzbzhrSUdPZkNhNXFQQjg2R1kySUltZWpVaXpZY3I5eHRaTHZ4N0NVWjlq?=
 =?utf-8?B?bkdqOG93L1YxZGg3RStEOUkyWXBianFuaTB5QWdneWVlOUVWa3NXWnoyaFdj?=
 =?utf-8?B?bjJya2ZweEk0OWNsRUQzd3M4NnhDSVNXV2RRZTlrUFJxNDFFeGM2UEZxb2ZN?=
 =?utf-8?B?NXlZOFExWTVLMGh3MUFtalBuSWlFUENFc3RGYUdtSUdDKzYza2Rya0ZxcW9G?=
 =?utf-8?B?ZGJPcy95VTZsVUJ5ZHFmb2Y0WjVIanV2Z2ZRS015Q0NsNEZHelk1dFFzZFRZ?=
 =?utf-8?B?dmZNVyt1Vjc3UEM3aWUvSjBSUDlwVFFFS2huYXo4aEcwZTMraTJReGJpQzNs?=
 =?utf-8?B?THZURDdzOWlYNjFCblNTNmZVaDlESFd6QlRDZkRQM1l3NHlzWFJlUVV1LzVJ?=
 =?utf-8?B?c1M5cW5iMWNaalpiWGFZQi81c0FUbFFrbkp6cjBHUjZSVE9zbWRINXk0V2VI?=
 =?utf-8?B?VXJuZlN2ai9oVEN1T0Ivd2xsU2ZIUFJaamNJR3hSUzBnZGYrOUpiWldXd3o4?=
 =?utf-8?B?VndpWEZzbzlVUDFZOUNlTUhiZ0JER3VXbGdUbDlxNWhpTDdLSkU5bVJiQklG?=
 =?utf-8?B?YXpMVkxIWTNSaUtkK1M0NWhaWnZLZm5aRWlOcHc3R20xZWFGYmYyK3pZTWlr?=
 =?utf-8?B?c3R6MFdUY0c3NUR6WXhocVFOOGdkNU5MQXp2U1JFMm11TmZxWHdJbVJKNGIw?=
 =?utf-8?B?b1BLVjdXbC90eklMT3ppK2FpL282V1hpaXV1bEo3T0VzZ295aGgvQmJ6ZXhi?=
 =?utf-8?B?dk9rSytnMzBLSXA3eDhPeDFUVE9LdnBIbjJaSGRyZWl0ZzYzUXhvQUJheGVw?=
 =?utf-8?B?RHdtWjFBMDdHbi9Qc2hyMG9xc25oeElqemJqRUJSdm5DMGwyNCtaUmlzT3Qv?=
 =?utf-8?B?MVh4U3RqQ3dZUU16QzZtVjZrQVU2Q2NKanhEdVlNdFF4Y05MeisvOURYOEFk?=
 =?utf-8?B?dXExdytUcEo3Z3gwYTFoUTIzbE1UUXVJbU1oNjBjaHJvZmhTcVJFM3g4alJH?=
 =?utf-8?B?OFh4bTU4Z1JJMDJQTS9XSjAzU0xOMk4yZTAyZ1VSdmtrU0ZHM3pxMThTRGRX?=
 =?utf-8?B?NE5pQko4M2FRVjhVbm1WUDBRZ1lVMHVOS0dON3gzNGdzOFo4TXhPajlNZ3VB?=
 =?utf-8?B?NUxWM0ErRXl2M2VQQ0k2UzhIb29mbFE1cXZUTGpqNGJKMnlNWHB4VXpEWEp6?=
 =?utf-8?B?cWpBMHRyTURwVzhkM2tnYlBZMVN5WW5HU1NSRDh3bkxGeVcvU01vL09XYWxG?=
 =?utf-8?B?ZzU4RklVaGhGY2VmK1RySlhadTRDVEhKaG1IcCtxeFU5VVBmd25vUWJzOG4z?=
 =?utf-8?B?c1k4RkFYSGRWbnNTSnJvM2s2NUpITmZXZ0xsd1VnSThnWjZJZUo3TVZ3Yi8r?=
 =?utf-8?B?K2ZKMnNwRExkSnF5M3JRM0VSU1V2M1hVTjlTbThlbGJVMkZYbEU4aUhsSDBH?=
 =?utf-8?B?V1dOR0kwbU9uN0lsN3RUc3F5b2RQZUI0cjk1bmQyRzJ4eEkvTTNlVTJJYm5u?=
 =?utf-8?B?clIwaFhVNmhZYzBBVCtDOWN5eHZPaXBST0F0YWtCeElNbDhJQjBXdXI1RVZZ?=
 =?utf-8?B?aENXdVlqWmN0ZUJqM1FoV2tkVWprTmx6SXRuZmppWDVMT2hadFRrd2txd3Ri?=
 =?utf-8?B?ejdaU1NWUTVKSUEyWkV6Qk1rRTFITGtTMkVVN050akNVWVMxSUhWeVUxQzJs?=
 =?utf-8?B?TmZoaEJCNktnPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10716
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ff5b369-6ab3-427a-38c6-08ddc83d1c04
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|14060799003|36860700013|82310400026|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDdzWXlBQklYNHpjVXFLeUpNa3dXTzVDQTdVQWJmUGFRK05kZUhFSDloeW1W?=
 =?utf-8?B?WHJKZE9UcU83aGgwTXZKSmUzSGlLdDBFM2N3aFVEOTZoVU9wSm9NYmQ4QlNK?=
 =?utf-8?B?bUhFNWxTTjRpbTNNYTR1VktRMFhiQ3oyaHlDZm9sR3Q2S2ZHRCtJSmlPTVdO?=
 =?utf-8?B?dWlNbWhzTzUzbm5mWTFOVytlZzRqb1dlYkc0VFRYR3ZaVkxERDFEVEVOS1NQ?=
 =?utf-8?B?ejZLSWY5bW5jNXNJem5sbzVhbDNhRHdBWlFjSUxKTjIwQTJKTTJzZkg1bms1?=
 =?utf-8?B?SzFvaGdvR1MrZHlaME1qWXlzd3lpaXdXNGsyWWk2b1VZUkxJZU1UMC9iaVVH?=
 =?utf-8?B?aTJBSWJvTW52TDI0L1N0d3dzZlI2ZjBsYm5MUU1HamFHL3JkWGR4QXJxVUVO?=
 =?utf-8?B?QVBTRDFaQS9nZjZ1b3BlRmVjWURuNEtHeHlqWjR3ajdYSy83OUhlb01WVVVP?=
 =?utf-8?B?Rnc5UXNqc2lJTzArSG12SGZUNWYwTGVIUTViNjYzR0lWTlV1aG1Qd3pIMEtV?=
 =?utf-8?B?VW1OZHA5M1BBNEsxWWo0SkxkZjhyeEJ4WGsvQjN5TWJLNkQ0SEl4cDMzeTY2?=
 =?utf-8?B?QlhNR2p5UHBOVFl6bWRPcTRpM3lUa2FoN0NBaHZUeFEwRDcrT2VRZXhJZ2U0?=
 =?utf-8?B?Ty84SXE2bXdYb2hLWXdwRFRJOCtnMkhycE4wRFBVeU1BRVA5V3FCZER2WStQ?=
 =?utf-8?B?T2FpRjcxeW5WZnVzU010RTRGWVVXMTdGb3FWcW1sRVQwQ3FERXBlUHpTTita?=
 =?utf-8?B?Z2dQb0VYbmxWVkVHMXd6T0hBRXcvVzc2Q09sMnhuV3lSRWhFVFcwNE9za2xZ?=
 =?utf-8?B?OUhwZEY5T2dONjEzT0Z1RUp4bDhVTXhHa2puUS9VcWhHQ3J3T0RQYVo3N1hK?=
 =?utf-8?B?cndyY3hjS3FjaEJGR0s4QTl2WGt0dGh1TFJpbG9EaDdvM2sxb0tSekVXRFRT?=
 =?utf-8?B?cGFHd3RkWkhkMktUYlE0NmE0MTB4TndwSkFyNzJUMTZUVW9aK2RkbFNxKytj?=
 =?utf-8?B?eGhzMUl3eHIydDBEWUdJOW92ckVoLzgyNlVkL3ZZcW1QeVNuM2MzOHh4NzBu?=
 =?utf-8?B?T0RJTE51UjJGK1ZiQ0RpU1UvMWFpSkgvUzZLanpGVklidDkwdkZkWVRFbmJ4?=
 =?utf-8?B?V3QwNjA2K3V6OTB3RVZhQUYrRWdvSWRoeGpLUk5UZ2FGZ0ZKT0RxNGNtL25E?=
 =?utf-8?B?SGh5Ujg5dStUWkdtQWF6Zmt5Znk4NFVaK0xtb2s2MmZJNDJNVENPOFM5YTkz?=
 =?utf-8?B?b3N3VGtnS0lsaVQ4WjdTZnhuSmZtK3RkUGRGOTRqVFlWUDNZZHppYlE1bVRv?=
 =?utf-8?B?eWJtZzB3d3ExSHl2QlUrQ1lTVHg0NEhud3ZPcWFIUnorajhRWWE2c29FeTBU?=
 =?utf-8?B?NDY4UDZRc0xyMTZoeGZieFQvaW9VRTJxME5JbHdjeFR5TDlEWDNESHNuNFhD?=
 =?utf-8?B?NER4bVBDOGRvTlNadzQveDcxTzFOdFdnUWFvREJLYi9LeHI4aEptZGV1R2k0?=
 =?utf-8?B?eDB5RmF3U3FQd1ppVmpPMUdMWkJJWmZwdVc4eEkxejhTUEJ5ay9rVFdSQmdM?=
 =?utf-8?B?R2pPMDcwcmUyUzYwY2o3ZVNxUXd4L1lGRWFzVmNHS29WMFFnUGJBK21mVDY4?=
 =?utf-8?B?Q0JieDk1RHRDWXRDaFp3V1I4dkdCWUc3TXR3SnE2ZTMvVjVXWmVZeVNFZ0Fk?=
 =?utf-8?B?NVlKYXU4WlFxdkk0Vlk2Qm9oNDJQQnp0M21tbC8xRTRNVmRTT2RNZzloRWdr?=
 =?utf-8?B?TkUvWDlIVXd3VVNXVCtvMktoQzF3OUN0aDZhY09WN0txMEJ3UTI0TXkrRWtz?=
 =?utf-8?B?Nzl3WlUwWktFMkZXd3RVcXVJR3hhbWpsOU96V0ZKRUVBQ0NXSlF3WW9FL0NN?=
 =?utf-8?B?WG9QaWhBQ1dFSTBUR2ZBZExXVVA3b1JYaVA4WHIzV3hJMk41QXc1bHNFRCs5?=
 =?utf-8?B?dUY1UVlzQnRXZVd5Vy9WSTMxNzF5dGVUSmE4NGJUc3BEOXp6a1ZHQlJYUkdJ?=
 =?utf-8?B?dlBYWHpZcExPSFZieEVhVXFESmVBZklLRG52ejdYMWtSQktFaEI0TUIyWmRH?=
 =?utf-8?B?NGN4Mkt6V0tjcnJVa0kzY2RpSEFaVEhXcjhTZz09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(82310400026)(35042699022)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:58:47.6625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8031c986-460e-4da3-6c50-08ddc83d2fdd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7335
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

Hello Steve, 

Thanks for taking a look. Looks like my rebase wasn't great, and I missed a patch
removing some of the GEM functions. Will get that fixed. 

Kind regards,
Lukas

On 20/06/2025 16:28, Steven Price wrote:
> Hi Lukas,
> 
> I was going to try testing this out, but it doesn't look functional. See
> below.
> 
> On 16/05/2025 16:49, Lukas Zapolskas wrote:
> [...]
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 9365ce9fed04..15fa533731f3 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -2,13 +2,177 @@
>>  /* Copyright 2023 Collabora Ltd */
>>  /* Copyright 2025 Arm ltd. */
>>  
>> -#include <linux/bitops.h>
>> +#include <drm/drm_gem.h>
>>  #include <drm/panthor_drm.h>
>> +#include <linux/bitops.h>
>> +#include <linux/circ_buf.h>
>>  
>>  #include "panthor_device.h"
>>  #include "panthor_fw.h"
>>  #include "panthor_perf.h"
>>  
>> +/**
>> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
>> + *                        to the maximum number of counters available for selection on the newest
>> + *                        Mali GPUs (128 as of the Mali-Gx15).
>> + */
>> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
>> +
>> +enum panthor_perf_session_state {
>> +	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
>> +	PANTHOR_PERF_SESSION_ACTIVE = 0,
>> +
>> +	/**
>> +	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
>> +	 *                                 counters during the last sampling period. This flag
>> +	 *                                 gets propagated as part of samples emitted for this
>> +	 *                                 session, to ensure the userspace client can gracefully
>> +	 *                                 handle this data corruption.
>> +	 */
>> +	PANTHOR_PERF_SESSION_OVERFLOW,
>> +
>> +	/* Must be last */
>> +	PANTHOR_PERF_SESSION_MAX,
>> +};
>> +
>> +struct panthor_perf_enable_masks {
>> +	/**
>> +	 * @mask: Array of bitmasks indicating the counters userspace requested, where
>> +	 *        one bit represents a single counter. Used to build the firmware configuration
>> +	 *        and ensure that userspace clients obtain only the counters they requested.
>> +	 */
>> +	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
>> +};
>> +
>> +struct panthor_perf_counter_block {
>> +	struct drm_panthor_perf_block_header header;
>> +	u64 counters[];
>> +};
> 
> I think something has gone rather wrong in a rebasing. This struct was
> already added in patch 2. So this causes a build error (that the kernel
> test robot caught too).
> 
> [...]
>> @@ -72,6 +236,122 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
>>  	perf_info->sample_size = session_get_user_sample_size(perf_info);
>>  }
>>  
>> +static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
>> +		*setup_args)
> 
> There's some code style mis-formatting like this - which is then fixed
> up in patch 5. So it looks like you've applied fixups to the wrong commit.
> 
> Also this series will need rebasing because there's some upstream
> changes that it's now conflicting with. The base commit looks pretty
> ancient now.
> 
> Thanks,
> Steve
> 

