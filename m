Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CC9B8583
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 22:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1720110E934;
	Thu, 31 Oct 2024 21:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="aX8Ix0an";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aX8Ix0an";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6E310E934
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 21:42:49 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u2JLTCnudjWy4uJAiDGAf8SmrG70NmrKUW4FniUgrqObsEt2ddnToFeupqzZrvv8UqgPrZTtNmzUseLsd2A4uWnazVhOUYrBvLO5GpU2S65aTbZxPK+aS7vHwLxfSjzwO3P8k92u3OkBA0WNo1T9uxDUF1XefR9+K995ru38IJuMEX8qBX+mzDgu9X71bZAQzQdQBjQx9BY+vA/c6omEXqtsMAmlJrn0EiMziAsuzHGPqj+ddcz58lXHCS0FCyC+N6RjogF9/5REKAuqzboowlHtu+4wjqcjcDy+KtxW9mFInYMR/z6Hy65LhKX+GMJgUXac3kWX7l8869h/Hg4h2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCADoZ455RolCYiQWVnT0/TWSNe5edXG3KtHO/T9nFM=;
 b=e2yWHF6Bg/VXASQaSI7uudMSyTUHpYdBdEwt/e1GB6/EQLLAlh2rFPZth5YqUCegQ8pVdT2jo9zBeJU2Vu89lZpzYXras8oQZKHF47dT2ehPFGgofLWkwvn0BfN+eu47PRoribfIwFgahwHVkSfys5oEDDjB/cE97aroehJ5B9hX1mZocg6dvNtOcFDMOMtVTb6k9/cB022xlz2BSZYsNQYmC600tBL2DieHCJniup7oaO5ssL+baadINv8oUYGi/X6i/s3/c1Xjyb8NSdI0E4PA3a2N7Tp2Sc06XjgbXXz3TPPzjyQd2rwCQmMCD8/w5ArIzALEWW6v1+M5YqKdPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCADoZ455RolCYiQWVnT0/TWSNe5edXG3KtHO/T9nFM=;
 b=aX8Ix0an3NB3RgjXSqUI8OWkAEa6Opo4VmO9GZA2OvtFedxTG3lbtXy/EBQqbGSxBeVB5WbL/WqK4JlfKM6AQ1z0NrwjmvB0ntgXCRf/AhNFZ4LxrhNio3qhzG8WgDqsBrQZWp4jict+QFi/TRf/EPH67fWUTdPdrdpKqCCdkd8=
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by PAWPR08MB10994.eurprd08.prod.outlook.com
 (2603:10a6:102:469::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 21:42:46 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::84) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Thu, 31 Oct 2024 21:42:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Thu, 31 Oct 2024 21:42:45 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490");
 Thu, 31 Oct 2024 21:42:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6aebf973e90ad25
X-TessianGatewayMetadata: 0L1o5m9Ht7KnrRi+C4Usfbdm53YL6i5afXyRZiTRHlqPy3aBfs28CaCAFE28SxTzH5EU7Kp3ZXR9D993iLx6+nap1jLUMBvDC4i8RXWAp1Z4mfPlSAfbZfBAnLJbg9Ng6Xna9t/L3SaNOkXMwEaBQ6Oa157h+Zf/+isVFKodWUw=
X-CR-MTA-TID: 64aa7808
Received: from La8c72a85860e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EA383CB-4653-4CA6-973A-6D7E38CC9303.1; 
 Thu, 31 Oct 2024 21:42:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La8c72a85860e.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 31 Oct 2024 21:42:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkmiPJBXppFPO/liKZR1taalovcGEM0rP3SR7QT+qobxl620otOxJddfPNbOtUKJ7GGc0GhwAA9m8a6k4o/Gv3urM24bd70HvU+hZQ/Ir+xCR0W+dviLlUDX7mE7hdbQ2QSGw25K4XZjiOeWV2RNiIM4/RZKWaU5+nZ3Ks/HTb4/FHKJERC+FISi40lgWPmd0RuwT+UPMVVkbTAOgi7uHprE6Arbe34rElvEg+MXJ2a7C3QTw0Bm9/vx0Q7JruPJ6V7BpD1u0mJKuZZVBnMi76oNWEozdZAB451sF6T//YP+bvGLa//ALpV0QZtTbELs51gDDvB/2eqjnrFmZSs/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCADoZ455RolCYiQWVnT0/TWSNe5edXG3KtHO/T9nFM=;
 b=a+M94EgLfmpYn/3OIS/s2NgVdGuvAk7RT2Z8lAcAUt+qmkKi6j5mY4IvPR65oekUoeou33O/wxne15XcrTc/b9ZmwgVart34noHK9MnxlF/oK54U+sDYvaR0dtshm9Ump6YME/CU867WPmcYSM0fsIMnV0elPQr5H9aaZI1wrVk/Pkq7p8SrU+8y9uzx1B/ymf2MVodPPTRZB4FMzqhhAff1FXoaeCrCTZRAwxBzIrqJfWGAkcEsW3wvt75gKuBrX7NiRLhfBwd8FinqrW5uC3yass4fCJjPi0Up/Yw9Cmj5PAmZ+AeDtjRD4EqtqLYV4Msdl931vkYixn8SjiTyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCADoZ455RolCYiQWVnT0/TWSNe5edXG3KtHO/T9nFM=;
 b=aX8Ix0an3NB3RgjXSqUI8OWkAEa6Opo4VmO9GZA2OvtFedxTG3lbtXy/EBQqbGSxBeVB5WbL/WqK4JlfKM6AQ1z0NrwjmvB0ntgXCRf/AhNFZ4LxrhNio3qhzG8WgDqsBrQZWp4jict+QFi/TRf/EPH67fWUTdPdrdpKqCCdkd8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DU0PR08MB7922.eurprd08.prod.outlook.com (2603:10a6:10:3c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 21:42:30 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 21:42:29 +0000
Message-ID: <40c9a0a3-81e4-4ecc-b9a0-d55523f5f594@arm.com>
Date: Thu, 31 Oct 2024 21:42:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panthor: Prevent potential overwrite of buffer
 objects
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20241024145432.934086-1-akash.goel@arm.com>
 <20241024145432.934086-4-akash.goel@arm.com>
 <20241024173935.6430159e@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20241024173935.6430159e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0151.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::12) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DU0PR08MB7922:EE_|DB1PEPF000509F5:EE_|PAWPR08MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ce59bb-51c7-4e9a-f3ef-08dcf9f4f4b4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?OFBFOHE2eHNzbmppWFZzRzNsaUhEeHRBZUJ5NTFibDRjamJZMlNTVGpseUpp?=
 =?utf-8?B?ZFVINnkwNjJ5QWpOVHhLb2tKcW80SjBhbjFsQ0JTV2VhRFZ5ajluZ1JBam1N?=
 =?utf-8?B?M0V4TE9mNmV6MGZwRklOQ3NwNHpGOXVyNUFlZGtRVlJRc2E1Q3pBd3hQbEhN?=
 =?utf-8?B?Z1ZQL3JaY2c5b1NRMWVpeGxCT21UeHk0cTBxYUZlTk81bGw2N004OEZVNHFa?=
 =?utf-8?B?WHU5Z3d5STZISktiUlZGZG9JeVkrODIrOTRYR094cWxSbG90S2czZk8yZkpH?=
 =?utf-8?B?RitmOUNoYzBoV1hyOGVpNzdJSTltMXFBblFJSERGRWIrcVRUdFU5MFZaRU55?=
 =?utf-8?B?OGFKSFZyemRlYkRsZjMzaGFONkxYSUhXWkpTV0dkaVJhUEFEeGhVNU1pR1Ra?=
 =?utf-8?B?emJGSDdGR0VWaEhtQTc1S2x2WXZ0V0tKNldrc0luZFJnOUc3T01hSGt0ZWxP?=
 =?utf-8?B?b0h1WnB1bWY1WWhMVmJXWHp0Mkdxd1A0clB6akdFcnBSYWxBamVzVTVCeXdw?=
 =?utf-8?B?dURqcGRoam92Vlh6UXcvRzFkd3FpbzhzNVJFZXIxa3dOV3g5bHdncXEySDZ4?=
 =?utf-8?B?VnFpbUVEODlmcWpBZmQ2TThSc0VZd1d6dVJMalBMQytOc2JHYjE4ZGM3M3pr?=
 =?utf-8?B?M3dIWENYd0M0bXJNSEo5VjBFR3dwYUF1bXdiWDBsclU4R0xCdEN0UXgrRnRm?=
 =?utf-8?B?d25CWSs2RkZrbGV4M2R1MUh3Q3VRU04rN1lxa0hIekdNeEZaSXBKRWN3Wkgy?=
 =?utf-8?B?bTJpRVNOVG83RDlYSGxQTTdQRFUvSXVXSTFYZUZrZTV6RERCdVh4d0FKVTlL?=
 =?utf-8?B?MDJHd0U4NG8wQk1OSDRiUzhMV1pOMGd2TlRkTWFNWjdkalNZUkRWQmcrU2Rx?=
 =?utf-8?B?a1lReUN0SFJGdWpwcS9Id0l1ZVpKaVRvdURtMTdNK3ZRRE8yNCtUOEpEdWZm?=
 =?utf-8?B?LzBRMFc2UFBFTzUvelBPRGV2dVFBUHVnVmN3QTk3N2UrQzRubjVlQU03ZmNM?=
 =?utf-8?B?SDdvYVZ2T3JpdlN0OUI2dDd5bEhzeGhIdmthc3pnbXZ1OVphaU9ueFFmYlcv?=
 =?utf-8?B?a2VpQzRzTDNLL29KejU2dUNPbWVOSnpQdzRqWlJEbWsxd0tQLytONXpDZUxw?=
 =?utf-8?B?b0NnS2xsdTNRZkRKM1BRelZjYmJmQkN5K1FrS0xRNmtQaW9yOEN3OXE3NG5H?=
 =?utf-8?B?L1VlbGh4S3BmL0pYVUorZHNQNVpuem13anppQUozK2ZDOEVTemY2Y1V3VVZT?=
 =?utf-8?B?UWdwUllUSUZ5YWQ2RytkZVhLMk5WNklkTm4venVESEJSZlJSOFFmZ3lUa3dN?=
 =?utf-8?B?S1gyNjRFOFNnSVBBdWgyRTNRbFNRMGhIQy9FajVHeE0wcjJPTWFUbHpDQ2FT?=
 =?utf-8?B?T1NVdmUyZkFpbWxtWG1VTDJ3SGF4bUZiKzIzYXRwbzc3UkY1SEs5QkR6bitC?=
 =?utf-8?B?WVJrSU9nM2NxVDFUeW00QXdFc3g5Zk5WaHlNTTNSZm9iV0hFZFJMK0s1SEQ1?=
 =?utf-8?B?UXdnd2dFMlF3M2pUdUdhbzdxaXVVa2cvWjluQnFTVnZMZnNyWVJiRzNad2t4?=
 =?utf-8?B?VExxekJxRkUyOThJZ21hdWpxRkdXaWJhZzJ2RkVDN2NnZHludThzbVZYeVZx?=
 =?utf-8?B?bVpueVdHNk5LbE9UYVVtanZxMmNTbWVjVU93V0NISG5ZZDA2ZVJ6U0I2TFZo?=
 =?utf-8?B?dHgzd21KY2w3U0w2TnVsUFA1c1hiL3BpRGxUeE9JUHBJVi9zQmZIYUFTRUFk?=
 =?utf-8?Q?SzgySdYHFmRO260OoAOX0kC0ErQoEL2UkEvGc7i?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7922
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9f9ed8a2-1361-4ece-8f2d-08dcf9f4eb6a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1hCU1piNS9SbGZTOUZtUnVjS1Fta3dDR0tRZUNwTHdQbUVWQVV6RUlYbDlz?=
 =?utf-8?B?bktvVTRPQlhVbGFobWNSeFh6VTJ5azVyUDU3UlJEZ2ZweFNWUmIzWk9zWS9j?=
 =?utf-8?B?Q21UZG1KMzBQMzRaTGlYRmRLOTI3ckxhbXhwL2N5Ti81VEVJZUN0eEp2OTRU?=
 =?utf-8?B?WnZRNmVKRE5KTXB3UTNhZFlEdEFnb3RScXdzdTVsWHB1ZW91bW9QSWdFWE9N?=
 =?utf-8?B?RVFudktEd2dQdkxPVnVjYWlXbThIaVVuNzFpOWYrdEVMeFR2TXFuWGw1UGM5?=
 =?utf-8?B?ZytjdkJNcVJMUVUvUWU1eWZhLzJLVVRDeEdFc21Mb0l2QjNmSytCQy9tT2pJ?=
 =?utf-8?B?bmtmUEFSWW01cEJKYnZqUVY4WUpoRjF0MFpMMWg4QngzU3N1MXNmdVk1b0U4?=
 =?utf-8?B?ZU94N3BHTU9hTXB4VUtNeG5SYzM4OUYxNUVyZHVEb2ZlakN0UVpQclcrNEpP?=
 =?utf-8?B?TDNZS21obUdReE5uWG1qTzZDV3IvVkR0ck5Od3hjTDdHck5NNE16akw2OFR4?=
 =?utf-8?B?aUVEbU8rMnhPUERTRzdXdytkNVhPajRMVDBBa0kzTDRSNmF2Ym1ST0R4dDdP?=
 =?utf-8?B?YnFweFhEaUhQK3RWZHo3SEFLZlNNdnZ3YlJtWER3Z0p2MDY5T3haTWE4RlJR?=
 =?utf-8?B?RDB1RFNqVndJdVQxSTI4enJtcGF3cGhEb2ViaWFiekFxcjFKbkhzT3loSVlO?=
 =?utf-8?B?eWMvYmZEbzZuN1dMMGJaUTIzamxKUEJRWGxON2swSlNMNGtqbzh6OWJQS284?=
 =?utf-8?B?dklvZWVRYkIxclhLVitaTmxXYXBNWGFRdFMrNmRVSEN6VjRTcEZxQVY4Z0ta?=
 =?utf-8?B?aVllazlBZVhuQXdFb0dHTm5oaDk5SGZCMnM2cE5laTU0cW5qUkNGL0NNejh2?=
 =?utf-8?B?K2Vuc0xwWEVYSEpHSlZyNXlMWEt2MUZLRjN1dGRoUzE3TUg0N1dVS3RYeTRv?=
 =?utf-8?B?bmpkOFRMczFBVFVuMXQ3eW9jWFBzVHRWb3lnOUhVQzFDV2d5Sk9DVGdvTWJi?=
 =?utf-8?B?VHVVZ2I3ak5SNzJ1TkVYTCtqZWpaSytxK3hGTHhFUmw2S0QwRW9QeWhiWDZD?=
 =?utf-8?B?aWpZRlNjOElETlVLZVh6MVhVWkhCRGg2emdhL2FoRldlSE5ZSVFLWDZzcEZ6?=
 =?utf-8?B?Y2lRTHI4a3c1US9UWkNpMDhocU1UUkoyMVVMNTRKNE9jbHQzZTlWcG41b2FT?=
 =?utf-8?B?WVhkRENrZzIrMm5IV2lYbWlwc3lhcER6S3daRWFWdVVrZSt1Q3Z4Mzl4Tk9o?=
 =?utf-8?B?a0hYZHJZOE0zMHEwMHZHc2NGYi9sSUFrdmpVUmNyS0szZWlXS1Vob29sckFH?=
 =?utf-8?B?ZThVYVNESm9kakNIZ2liRS80NWp5SE1Sa3RwY1NOejQySXhlNTBmSnRWdFRt?=
 =?utf-8?B?NlhBcGJCa1krRmxtSGVwbm1RMkNNVDFwV2Y3ZkdTbkp2M3N1SGU4ZXZQTHdT?=
 =?utf-8?B?TWVuaU5BbGJWTmY4akRJWHJJd0pRSzFya3k3aHBpU2llTmk2eElyaTg5em0z?=
 =?utf-8?B?enJWTUxXMnQxRmFMekQ1WjhUNnNLb2NyVVBQMCsvSU1PUGQwQk4vbEkzT1Er?=
 =?utf-8?B?dE9mM2NoTWlEQ0lDREFhWnlpQXdsUHZMUG1wZ0p6K0l2eWpjVit1bWdxMndw?=
 =?utf-8?B?alpDK1RGYXIvZmZyQ3lkSm9EalFCY0xUWnJRYXM1NHhwV1FYWmlmUlMrWnN6?=
 =?utf-8?B?YllueXkzaUtzQzNUdTlRdGdXV0UzV2haSXZuYzdvUjRLYkNPQ3owQXBPbkNO?=
 =?utf-8?B?NzVYa2YrOVEwUnFZd3dwK0IveTJIV0R4SXlJZHhFN0o2ajNUbnRNMnFOWkh3?=
 =?utf-8?B?eXdHRkcrZGRvaXdWSmhIL2c0d3M3RDhRdVVxL3lBb2pjYzVZY3ZqeUMxUjNm?=
 =?utf-8?B?SHV4YWFlRlY4STl1SXRCcW9TbFRyNDVmKzVNd0lyZ0k5Q3c9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(376014)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 21:42:45.2603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ce59bb-51c7-4e9a-f3ef-08dcf9f4f4b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10994
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



On 10/24/24 16:39, Boris Brezillon wrote:
> On Thu, 24 Oct 2024 15:54:32 +0100
> Akash Goel <akash.goel@arm.com> wrote:
> 
>> All CPU mappings are forced as uncached for Panthor buffer objects when
>> system(IO) coherency is disabled. Physical backing for Panthor BOs is
>> allocated by shmem, which clears the pages also after allocation. But
>> there is no explicit cache flush done after the clearing of pages.
>> So it could happen that there are dirty cachelines in the CPU cache
>> for the BOs, when they are accessed from the CPU side through uncached
>> CPU mapping, and the eviction of cachelines overwrites the data of BOs.
> 
> Hm, this looks like something that should be handled at the
> drm_gem_shmem level when drm_gem_shmem_object::map_wc=true, as I
> suspect other drivers can hit the same issue (I'm thinking of panfrost
> and lima, but there might be others).
> 


I am sorry for the late reply.
Many thanks for the quick feedback.

I assume you also reckon that there is a potential problem here for arm64.

Fully agree with your suggestion that the handling needs to be at the 
drm_gem_shmem level. I was not sure if we really need to do anything, as 
I didn't observe any overwrite issue during the testing. So thought 
better to limit the change to Panthor and get some feedback.

shmem calls 'flush_dcache_folio()' after clearing the pages but that 
just clears the 'PG_dcache_clean' bit and CPU cache is not cleaned 
immediately.

I realize that this patch is not foolproof, as Userspace can try to 
populate the BO from CPU side before mapping it on the GPU side.

Not sure if we also need to consider the case when shmem pages are 
swapped out. Don't know if there could be a similar situation of dirty 
cachelines after the swap in.

Also not sure if dma_sync_sgtable_for_device() can be called from 
drm_gem_shmem_get_pages() as the sg_table won't be available at that point.

Please let me know your thoughts.

Best regards
Akash



>>
>> This commit tries to avoid the potential overwrite scenario.
>>
>> Signed-off-by: Akash Goel <akash.goel@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
>>   drivers/gpu/drm/panthor/panthor_mmu.c |  5 +++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
>> index e43021cf6d45..4b0f43f1edf1 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gem.h
>> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
>> @@ -46,6 +46,16 @@ struct panthor_gem_object {
>>   
>>   	/** @flags: Combination of drm_panthor_bo_flags flags. */
>>   	u32 flags;
>> +
>> +	/**
>> +	 * @cleaned: The buffer object pages have been cleaned.
>> +	 *
>> +	 * There could be dirty CPU cachelines for the pages of buffer object
>> +	 * after allocation, as shmem will zero out the pages. The cachelines
>> +	 * need to be cleaned if the pages are going to be accessed with an
>> +	 * uncached CPU mapping.
>> +	 */
>> +	bool cleaned;
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index f522a116c1b1..d8cc9e7d064e 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -1249,6 +1249,11 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>>   
>>   	op_ctx->map.sgt = sgt;
>>   
>> +	if (bo->base.map_wc && !bo->cleaned) {
>> +		dma_sync_sgtable_for_device(vm->ptdev->base.dev, sgt, DMA_TO_DEVICE);
>> +		bo->cleaned = true;
>> +	}
>> +
>>   	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
>>   	if (!preallocated_vm_bo) {
>>   		if (!bo->base.base.import_attach)
> 
