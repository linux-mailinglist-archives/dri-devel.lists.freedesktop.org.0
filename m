Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCCA719F4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EEF10E6F3;
	Wed, 26 Mar 2025 15:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Hqg/xQbx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Hqg/xQbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F1E10E6EB
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:15:04 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xx4xtLrG7DSlCdS+Vfb5nqRB+6F+CoqXS98CvHBSK+q0rkafR3JVFUw8k3n1kmWdXDwBfNdYtX6tBrA+suDqxdtct2Xc2D52n52ozduVrqE6Xc1Cx/t7gJZ4fM3honaoOz7XG8zQcC6KHBfHiSc3qhn/oe8xGgNRvm/zhneFCSemx6nUIhoR5dSzVmdmpKCGUTx7MA9xQxISc1tiK1IRX2aiO0kRAJuhy/heZS6OXpx9r+Z7S8gR4zRDege7npbZBQI1Uawvnb2Lle3YEE4aI9WXAHBG0lWp7hyuQngZLaemdUKZXzwS+4gAn9Seh4s+klnJG2GC/rOiLjKpQJN0NA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UanVdIAXGq6bvcnH/Fq1ongLHj4xHhDGQknBs5HVt9Q=;
 b=VtC4FCzLPDvqYVywI/lzvUl8vqHxsmb/CCnj8cbjC1SuS5ZAcy7+Vx/8lvihamvz0Y4jcauOArgksizFpLgo6AQdqBAUk9hN8nueqi6JHKZLCaSFelW+aQ82+Fp12wDMatHzYgVy7RmT5cR0WI4ezmozXL4qhFDmDbsSuPUxhwWRkoKMrOw90mXwY6XoqfYZvafdWdwisBVAakrzUHD+hwwuW8r7J2ERATDM0JhUYp+YJlsELhTmQ562k/qSdpj9hhC/aOS3lcf3szasQa6NHtPQL8olqGYFfLnrB8iylelbWL1PWrK79MSvxxq4Rdr9UniqTVvblzrkUEmT3p38Ww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UanVdIAXGq6bvcnH/Fq1ongLHj4xHhDGQknBs5HVt9Q=;
 b=Hqg/xQbxOaGFy9wApQgZhXhdloScIWYkEuVrnBMcJF+P5LhAcD6vv5cdU8f2f7fQJMo2mTzfn9gLOLBYeo6jUkPj+PqzvF69jkB4NLowl/VNcSxYQ2iIILwvxt1wMbYml/sxR3iRsqpmvJefe8ghcIwXc6/u6Sp3bQhqtHMd0dk=
Received: from AS4P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::18)
 by FRZPR08MB10949.eurprd08.prod.outlook.com (2603:10a6:d10:13d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 15:14:57 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::dc) by AS4P189CA0032.outlook.office365.com
 (2603:10a6:20b:5dd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 15:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 26 Mar 2025 15:14:56 +0000
Received: ("Tessian outbound 93207444acda:v604");
 Wed, 26 Mar 2025 15:14:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba9bf2a0cc623c32
X-TessianGatewayMetadata: qRG/9FDe+ceoX22PBeKTaGrjcM92DreZHPHNLPQ7rr35cfzs50vIBdeiPFI2DTgrlsoB2iIS4E1pR7LkrtSoeioUBRyAY8/LO6E97bNC0m9Rsa5MU9DRU0TdQTShcP9BHeUZRxGJ8vBD/ZPtI7nXhzrKjKWmNu6gESMMN1zG/uQ=
X-CR-MTA-TID: 64aa7808
Received: from L5edabfe6ebd0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E678EA7-DA37-4566-8F73-EC39B706F444.1; 
 Wed, 26 Mar 2025 15:14:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5edabfe6ebd0.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Mar 2025 15:14:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCXnCzh4uPuv36ANyZqPBdAwpqdsmxmZjdkp0vlNDSPRwu8nFhtcZAotGM3sE+mulvdzl+/7edhSvPAm0R/2wtjPRad44S4EcO5XRDVH8toiT/EVvRgzK98U2F2lCDJ1FT+3Zcin4o+YsQUaoF3mnUlyqv6UBXZZahXjRMLM2ufOeXIILPrANx52Ulw1Q39KQiMUbpbQYwt5l5a6mJ48CLDPucaon1OreUyQIjft/GkrX4KNz25uNmhCQVKf4OMm4BC5b92nkLtaIAIRD5faU3BFonRIDtVWASr/2YR5ytQRjBz8A+bZqjK3XtIxU2AJqPHdYqzW6TQJKwZ7zgKwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UanVdIAXGq6bvcnH/Fq1ongLHj4xHhDGQknBs5HVt9Q=;
 b=fwBdmEwQeYmbJWzoobpA08WXLURWa9O5osrGu3vMxah/bRZXG8iZoMalTqccqxPqW7RhUd0rPa6+rDHHBbyZYgBb0P6KRd7VdQUYB0D5o/2zr9W7r1Ce4hDnUfuGhqSZE2JbMcFqQm3zj3fU7VHybMHtowhFq7exKeIoxnhd2M2jcXlp3zzUqREp8tiRh4RkPfkpaogf87QHCOE3qUt3COErBmCbEhQmxP2rhvZYQDxq4Rt9cC062AFC+K+GiEmQbWn69woPQ34JXYK3hs1E1Y8AUBmJ1KzEO78nADePu5xkhqM06k4mAY7ENVhh+nE/TE5WigHptRcLOT5Bhf4FTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UanVdIAXGq6bvcnH/Fq1ongLHj4xHhDGQknBs5HVt9Q=;
 b=Hqg/xQbxOaGFy9wApQgZhXhdloScIWYkEuVrnBMcJF+P5LhAcD6vv5cdU8f2f7fQJMo2mTzfn9gLOLBYeo6jUkPj+PqzvF69jkB4NLowl/VNcSxYQ2iIILwvxt1wMbYml/sxR3iRsqpmvJefe8ghcIwXc6/u6Sp3bQhqtHMd0dk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by PAWPR08MB11196.eurprd08.prod.outlook.com (2603:10a6:102:46d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 15:14:48 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 15:14:48 +0000
Message-ID: <9901bc49-2e1a-4912-a37b-94eb3f5c35e2@arm.com>
Date: Wed, 26 Mar 2025 15:14:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 5/8] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-6-lukas.zapolskas@arm.com>
 <6vnoxwsc2wy3spnm6w4e53usikceemy5bz5frbqsmwc53atyzn@r2tbbdqoojx3>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <6vnoxwsc2wy3spnm6w4e53usikceemy5bz5frbqsmwc53atyzn@r2tbbdqoojx3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|PAWPR08MB11196:EE_|AMS0EPF000001A7:EE_|FRZPR08MB10949:EE_
X-MS-Office365-Filtering-Correlation-Id: f523f8b3-5f44-4c9f-14cb-08dd6c78f7c7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?M0JOVWlEbDlRNGZOQmIwTE5NTkV6TzNaVGc0enRsVnpsVEwwczR1Q1NKakY4?=
 =?utf-8?B?OTVmZEdxM1RybngxMGVIYnZpa2FmczdNNFp0RHc4YTc1d0poZURqYy9veHhx?=
 =?utf-8?B?eGZDeXZFblZlcnIzTkMwS3BvSC9HNWxoeWNsKzRMR2tPUVlCWkI4V0FmKzVO?=
 =?utf-8?B?OURnV2FHZnZZWWVWL0tzckFJVlZIYjZkNjV1UklvSmUvZm4zTXVKdXk3TmZD?=
 =?utf-8?B?dDBKT0ZsV04rcm10SjJFNkFvVVd5V0VNalZrL2Q3Z3ZLQVduWHovYVJLWE9z?=
 =?utf-8?B?K1pXUVhHb3RMVkh6RXFtanV2MDlQUWUzRVVmUTBRRFdsMkxqZnZCTThHYWtP?=
 =?utf-8?B?OElybU9CRVBFU0wrdVh1dGNRdElsd1g4Nk9jTUJHRXNnaEcwRUYxM2tKalM5?=
 =?utf-8?B?eHpBTmYxWHA2bVNzbTFpVllSaVRHY3E3R3ZRWTB5dmxLc2FrQ2hseC81ZXNY?=
 =?utf-8?B?UG40ZUc0cnJpZmdJMGhiK2doZWppR0tBb2hOTnlmeUxUcnViWlozbGs1cU9M?=
 =?utf-8?B?MEkrZjgwZFZZYXgyNndBTDQzYVNBVVFhU1dSMFZXM0NaVkI0R0lBcDM3QU43?=
 =?utf-8?B?MmhTdmRVYXhIWjNzQTAxUm15WUFaRmk1NGNaWU9mTGU2SW9wamQ4OGhOWkZU?=
 =?utf-8?B?UThGaHFVWjh1aFppeWQ0U1NBWXlGSDBlbjlxaUZWQVlFbTRQeUdPWUNsc2ho?=
 =?utf-8?B?TzY5bHdSSU0zd1BjbHhpZXg5M0hKSHpObzNoSGZZUC9uVFdoMnhENmZzVWpX?=
 =?utf-8?B?czVVVHNIR0g5OWgyRiswbzJYSEhKOENWY1JGU1NwUDNpN0E2ZFdYd0E5MlND?=
 =?utf-8?B?dkZKWjRlWU04MURiMVpwMmEybFFPMmRNdzZoWS93MnAzczJZRFpLQjczS1Q4?=
 =?utf-8?B?a054UmpPdy8rWlZLeDNJUTQ2T2tqZm83MWZKaGl1WEl2bTlURmltNzlyVWRV?=
 =?utf-8?B?WFBnNkwycW5QMFhOT08wVTFkS1dBTE82d05qTWx1SXJhS0hhVXArK2tUY2xl?=
 =?utf-8?B?c0hENisrb0hMYUhFTE1Ib1U2MUsyVVR2eHc2ZlA5OEw1RXBtRFhvK2JUeGg0?=
 =?utf-8?B?NHpJZUVMK2llVXVGZkhEa2xaT2NFM1NMSnA4ZmwyQTFYQnQ1RnZFa2cxRFk4?=
 =?utf-8?B?b2luMWs3N0Jrak1Sd2drd2hUTlFkMFVMb0lZdkMzUnE5WHkwQjgvNXZqcnFC?=
 =?utf-8?B?eUphMHZwWHN3WVNQSStrVUhlV0NmVjAzWC83Znh4NFRZS2hFVFFrVjlRSW1X?=
 =?utf-8?B?MFZ1c1JkVVQ5MmFFNVd1RkdTYTkrdGNvSnplMld6OVpFRkV6VDhDSWhLeUE3?=
 =?utf-8?B?T25Rbjh0WTVYUlAwVkJPN3FQNnFtVG8wUWxkanVmYU0zdGh3amhtbkgrS0k2?=
 =?utf-8?B?MUo1b3d3enM5QXRDcE81c2pCWEtoWEVBYk9FZnYzbWpLQXl5aGEwSHVIRjcx?=
 =?utf-8?B?dURHOHZWb2lPM0VrWnlidXgxNkZMY1VGL0NxdVlUdWJTQVNwekZTRjFZRVVv?=
 =?utf-8?B?bzVLaHN0c29DbnkxQ0Y4NlV4RE9sWTdwUXNEb3dEejVPM3ZBYXFUcVdOOG43?=
 =?utf-8?B?YTFOaVhCQVRITHhma3IrU1h3elppU0syekZwdFc2OXdYNGlyckVkNkY3RFJJ?=
 =?utf-8?B?T0FjbEE5QTFpMG1aVm5Pem5XLzZ6cTFKbmY2Rlh4TjZEb2FBN1htWmVudnF1?=
 =?utf-8?B?MmkvTTlBU20wc0M0Njd2VnEzTU5sVS84V2JSU0lseGdWaDZlR1hwaW1MbWZq?=
 =?utf-8?B?U094ZDJ2a0kzeE1PNzdyZEUrNzg4NGl2Sm11TmxScU1qclhPTC90WEhVUVpG?=
 =?utf-8?B?WVpVY3NOMENsaHdRWGNkYkY0cTNuOVRuYkVIOHhZWDBBNVR0ekYySkNtTTYx?=
 =?utf-8?B?MS9jMG5ZRkY2eng0S0NROEsvQytZSkZRZXhLcUJLbWxrREE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11196
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: afba6391-0d3a-4962-99a2-08dd6c78f2a9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|14060799003|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmswY3lhOSttV3JIeWlxWTNoT0JxYW9GUXFRUkw0QUs4R2lnWDBzRm5kWlAw?=
 =?utf-8?B?STFBOFlCamMwVThNNmZVdXVFLzI1WTZzc29TVS8rZEdZQjFKZlg2V3dyYWcz?=
 =?utf-8?B?OTJYeDlacXNvZ3pEc2lLdFZnOEQ1TjlGYjhVUXpRYk9VNHFUQ3NDVzZlWjZy?=
 =?utf-8?B?MXRqc1cvUW41Y3JrRnNTY0NpWWkvaGtoT1J5Nm1zUy9kV3EzLytHWG92SERv?=
 =?utf-8?B?WEdNMGdaMkpCbWd6QXBsclZSRElibmNybUllTHcrbnczRStSWThCWGNaeDhW?=
 =?utf-8?B?U1NNem0ydExkM3YrQ3FwNHNOYXcxZmVaSit2dGZJUTNjdjBlbjkzK3VFbkZT?=
 =?utf-8?B?Wk1rQU40ZGJ4SklLeUhCR3JzNVFHTWhXVWgwQjc2dU1oSUpzUG1MNEJ3WVR2?=
 =?utf-8?B?YkQzUHZ2WFhzUE1IZnVUMERrWTMrWVJoRXM5b3prd1pNS050TWNlWmRxWlIx?=
 =?utf-8?B?S0xPa1dCcGppYi9jRjVxdmVhZjRYaThlWTlOSEhzLzJUTGRYeGhtUGQ4REhH?=
 =?utf-8?B?N0szY0s3ZVJNdFkxbGRkWnVPSXFJRG1LWTBISmtzdzZwMmUrdlhUL2IrTXdH?=
 =?utf-8?B?MXMvQU04dW54TjBxSWdYUGZjMkxSQktjczlYNGpvYThFRWJGdHE0bTd4blpG?=
 =?utf-8?B?dEhlQklOMG9WUE1FanpnREkrSUtCNTV1RTVCNlZ3NE1MMkl5dnNjRE80NmxH?=
 =?utf-8?B?NmFhZVlwMzkrM3BmT1NSQ0dMUHVpN2M1bGdFN1Z0V3NYdGNFM1BwKzlqNGsz?=
 =?utf-8?B?WDFQUi9iY1hpZFd3NGNCOGNVYlRjOEFhOWh6Y1NQNzlDcVNiNFdJeFN2SXVI?=
 =?utf-8?B?bWMxU2N0YUtaWlZDZXJxdEJaY1J2bHlnN0tXaDZ0NWFhSTFEbXd6U1NwVXB4?=
 =?utf-8?B?czYwR2w5eUU0RzZlMk5tSUxMdmhtdDRheG5Mb3pBYVZVblBHdzRtNUsxdXRk?=
 =?utf-8?B?ajM4S3NsczV0Y3VaZFVVc0tHaldLUW1xN1FlSEhOc3VuUG1XdUx6ZUtKQ210?=
 =?utf-8?B?TTBKdEZ4Ynp6STR1cERxSUo5aHd4dnlsR0NtSnZ2d0VEQzF0cUh3Z2cxWlp0?=
 =?utf-8?B?WGp3SWNxN2VmNndWM3pWUFB6WlIycWdNS1lOTStSRlNFdDA3U0IzNlVsTjNY?=
 =?utf-8?B?NEV5ZHo3emJXenR6b1llcG1FYk9nRXdNRjQyYjFLOVV6REo5eVpXMGRzdGFZ?=
 =?utf-8?B?Y1d3dHRtUEtjZGRtU0hHRE1PWmJIYzEwSHU4WXE1Rys0bjQrYmljV0JwV3ha?=
 =?utf-8?B?d1VVSTJnS2EvZnQrbmlpUlQyWmZQUllBeEdsRlRicGtqaUp5ZlhTelJFWUlI?=
 =?utf-8?B?UW9JQ0pud3h3amRKQUloWk5rWEZ3NXFrdG9DWkR0QVJxNk14dWR2bWdSTlV2?=
 =?utf-8?B?Zi9jeGRFcWV4SXd4MU0vZmFrWVZQdmROYStsR25FeVVrUFJ6SUpmcUkvZ3di?=
 =?utf-8?B?VDdhRUZncjJLa0FtOUo4eVlCbWcxak5zdzVOcmNVcEhEV2FQTVlaM1p2NDJu?=
 =?utf-8?B?akRDVmhUc2ZkYXRvTnZtdmlCNG15L290bWxKVDdCaU5sWEM2UXJGVzNOZ1hE?=
 =?utf-8?B?OGNLZFE4TExLWGZyNG5aSDdWOTJxYUk0aStDQm1KVWhpajg5THNvd3dWbC9k?=
 =?utf-8?B?ZWN4Sy9DazdYdDBVVmxYOWF0MVZqYUtCRzgrdmtoamtWM0FUNWZwUmpWNGIv?=
 =?utf-8?B?aWhwWHY2dVQ2eWVxUkxvRWpLdkd6RHp4aVQ2bEhiWTZSdU01c05wTk5hbWto?=
 =?utf-8?B?ZndKRkNJRXBWd0Zmak1WVHVqaXZxcS9xUGdVNldBVXFTcitzanNwYmhiY3lX?=
 =?utf-8?B?cW1UQlp4cFVWL0tOQVZvTUo2bGpNNExjUFJTVU56UGgwOWhINFRidTZjckhB?=
 =?utf-8?B?ejU4TW5sK2N6aGNpZ3d0dld0eHJoVzIzVnUyNnNibDRrODBnaDBMMy9FRThm?=
 =?utf-8?B?NmtpcXBvZjRQZWQ2cjVhQ0RqYzVSMXk3OGt3YVJTM25CUzlKdUl6T0Q2VTJD?=
 =?utf-8?B?ZENubFR6czlBPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(14060799003)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 15:14:56.4591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f523f8b3-5f44-4c9f-14cb-08dd6c78f7c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10949
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



On 27/01/2025 15:43, Adrián Larumbe wrote:
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> To allow for combining the requests from multiple userspace clients, an
>> intermediary layer between the HW/FW interfaces and userspace is
>> created, containing the information for the counter requests and
>> tracking of insert and extract indices. Each session starts inactive and
>> must be explicitly activated via PERF_CONTROL.START, and explicitly
>> stopped via PERF_CONTROL.STOP. Userspace identifies a single client with
>> its session ID and the panthor file it is associated with.
>>
>> The SAMPLE and STOP commands both produce a single sample when called,
>> and these samples can be disambiguated via the opaque user data field
>> passed in the PERF_CONTROL uAPI. If this functionality is not desired,
>> these fields can be kept as zero, as the kernel copies this value into
>> the corresponding sample without attempting to interpret it.
>>
>> Currently, only manual sampling sessions are supported, providing
>> samples when userspace calls PERF_CONTROL.SAMPLE, and only a single
>> session is allowed at a time. Multiple sessions and periodic sampling
>> will be enabled in following patches.
>>
>> No protected is provided against the 32-bit hardware counter overflows,
> 
> Spelling: protected

Ack.

>> so for the moment it is up to userspace to ensure that the counters are
>> sampled at a reasonable frequency.
> 
>> The counter set enum is added to the uapi to clarify the restrictions on
>> calling the interface.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_device.h |   3 +
>>   drivers/gpu/drm/panthor/panthor_drv.c    |   1 +
>>   drivers/gpu/drm/panthor/panthor_perf.c   | 697 ++++++++++++++++++++++-
>>   include/uapi/drm/panthor_drm.h           |  50 +-
>>   4 files changed, 732 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> index aca33d03036c..9ed1e9aed521 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> @@ -210,6 +210,9 @@ struct panthor_file {
>>   	/** @ptdev: Device attached to this file. */
>>   	struct panthor_device *ptdev;
>>   
>> +	/** @drm_file: Corresponding drm_file */
>> +	struct drm_file *drm_file;
> 
> I think you could do away with this member, wrote more about this below.
> 
>>   	/** @vms: VM pool attached to this file. */
>>   	struct panthor_vm_pool *vms;
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 458175f58b15..2848ab442d10 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1505,6 +1505,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>>   	}
>>   
>>   	pfile->ptdev = ptdev;
>> +	pfile->drm_file = file;
> 
> Same as above, feel like this is not necessary.
> 
>>   
>>   	ret = panthor_vm_pool_create(pfile);
>>   	if (ret)
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 6498279ec036..42d8b6f8c45d 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -3,16 +3,162 @@
>>   /* Copyright 2024 Arm ltd. */
>>   
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>   #include <drm/drm_gem_shmem_helper.h>
>>   #include <drm/drm_managed.h>
>> +#include <drm/drm_print.h>
>>   #include <drm/panthor_drm.h>
>>   
>> +#include <linux/circ_buf.h>
>> +#include <linux/iosys-map.h>
>> +#include <linux/pm_runtime.h>
>> +
>>   #include "panthor_device.h"
>>   #include "panthor_fw.h"
>>   #include "panthor_gpu.h"
>>   #include "panthor_perf.h"
>>   #include "panthor_regs.h"
>>   
>> +/**
>> + * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
>> + *                        to the maximum number of counters available for selection on the newest
>> + *                        Mali GPUs (128 as of the Mali-Gx15).
>> + */
>> +#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
>> +
>> +/**
>> + * enum panthor_perf_session_state - Session state bits.
>> + */
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
> 
> How would a client normally deal with data corruption in a sample?

At that point, the client will have to effectively restart a sampling
session (either stop/start pair or re-create the session). In practice,
we haven't seen this happen very much, but the combination of a fast
MCU and a low sampling frequency would have that effect.

>> +	PANTHOR_PERF_SESSION_OVERFLOW,
>> +
>> +	/** @PANTHOR_PERF_SESSION_MAX: Bits needed to represent the state. Must be last.*/
>> +	PANTHOR_PERF_SESSION_MAX,
>> +};
>> +
>> +struct panthor_perf_enable_masks {
>> +	/**
>> +	 * @link: List node used to keep track of the enable masks aggregated by the sampler.
>> +	 */
>> +	struct list_head link;
>> +
>> +	/** @refs: Number of references taken out on an instantiated enable mask. */
>> +	struct kref refs;
>> +
>> +	/**
>> +	 * @mask: Array of bitmasks indicating the counters userspace requested, where
>> +	 *        one bit represents a single counter. Used to build the firmware configuration
>> +	 *        and ensure that userspace clients obtain only the counters they requested.
>> +	 */
>> +	DECLARE_BITMAP(mask, PANTHOR_PERF_EM_BITS)[DRM_PANTHOR_PERF_BLOCK_MAX];
>> +};
>> +
>> +struct panthor_perf_counter_block {
>> +	struct drm_panthor_perf_block_header header;
>> +	u64 counters[];
>> +};
> 
> I think I remember reading in the spec thata block header was 12 bytes in length
> but the one defined here seems to have many more fields.

Two different block headers: I believe you are talking about the header
coming in the block sample. This is an additional header synthesized in
the kernel to provide more context about the block.

> 
>> +struct panthor_perf_session {
>> +	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
> 
> I'm wondering, because I don't remember having seen this pattern before.
> Is it common in kernel code to declare bitmaps for masks of enum values in this way?
> 

I saw it in several places, including drivers/net/ethernet/sfc/
ef100_nic.h (the first example I found when looking).

>> +	/**
>> +	 * @user_sample_size: The size of a single sample as exposed to userspace. For the sake of
>> +	 *                    simplicity, the current implementation exposes the same structure
>> +	 *                    as provided by firmware, after annotating the sample and the blocks,
>> +	 *                    and zero-extending the counters themselves (to account for in-kernel
>> +	 *                    accumulation).
>> +	 *
>> +	 *                    This may also allow further memory-optimizations of compressing the
>> +	 *                    sample to provide only requested blocks, if deemed to be worth the
>> +	 *                    additional complexity.
>> +	 */
>> +	size_t user_sample_size;
>> +
>> +	/**
>> +	 * @sample_freq_ns: Period between subsequent sample requests. Zero indicates that
>> +	 *                  userspace will be responsible for requesting samples.
>> +	 */
>> +	u64 sample_freq_ns;
>> +
>> +	/** @sample_start_ns: Sample request time, obtained from a monotonic raw clock. */
>> +	u64 sample_start_ns;
>> +
>> +	/**
>> +	 * @user_data: Opaque handle passed in when starting a session, requesting a sample (for
>> +	 *             manual sampling sessions only) and when stopping a session. This handle
>> +	 *             allows the disambiguation of a sample in the ringbuffer.
>> +	 */
>> +	u64 user_data;
>> +
>> +	/**
>> +	 * @eventfd: Event file descriptor context used to signal userspace of a new sample
>> +	 *           being emitted.
>> +	 */
>> +	struct eventfd_ctx *eventfd;
>> +
>> +	/**
>> +	 * @enabled_counters: This session's requested counters. Note that these cannot change
>> +	 *                    for the lifetime of the session.
>> +	 */
>> +	struct panthor_perf_enable_masks *enabled_counters;
> 
> It seems the enable mask for a session is tied to the session's lifetime. In
> panthor_perf_session_setup(), you create one and then increase its reference
> count from within panthor_perf_sampler_add(), which is not being called from
> anywhere else. Maybe in that case you could do without the reference count and
> have a non-pointer struct panthor_perf_enable_masks member here?
> 

When working on the multi-client handling, that is exactly what I found
as well. The reference count was overcomplicating the lifetime
management of it.

>> +	/** @ringbuf_slots: Slots in the user-facing ringbuffer. */
>> +	size_t ringbuf_slots;
>> +
>> +	/** @ring_buf: BO for the userspace ringbuffer. */
>> +	struct drm_gem_object *ring_buf;
>> +
>> +	/**
>> +	 * @control_buf: BO for the insert and extract indices.
>> +	 */
>> +	struct drm_gem_object *control_buf;
>> +
>> +	/**
>> +	 * @extract_idx: The extract index is used by userspace to indicate the position of the
>> +	 *               consumer in the ringbuffer.
>> +	 */
>> +	u32 *extract_idx;
>> +
>> +	/**
>> +	 * @insert_idx: The insert index is used by the kernel to indicate the position of the
>> +	 *              latest sample exposed to userspace.
>> +	 */
>> +	u32 *insert_idx;
>> +
>> +	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
>> +	u8 *samples;
>> +
>> +	/**
>> +	 * @waiting: The list node used by the sampler to track the sessions waiting for a sample.
>> +	 */
>> +	struct list_head waiting;
>> +
>> +	/**
>> +	 * @pfile: The panthor file which was used to create a session, used for the postclose
>> +	 *         handling and to prevent a misconfigured userspace from closing unrelated
>> +	 *         sessions.
>> +	 */
>> +	struct panthor_file *pfile;
>> +
>> +	/**
>> +	 * @ref: Session reference count. The sample delivery to userspace is asynchronous, meaning
>> +	 *       the lifetime of the session must extend at least until the sample is exposed to
>> +	 *       userspace.
>> +	 */
>> +	struct kref ref;
>> +};
>> +
>> +
>>   struct panthor_perf {
>>   	/**
>>   	 * @block_set: The global counter set configured onto the HW.
>> @@ -63,39 +209,154 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
>>   	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
>>   }
>>   
>> -int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> -		struct drm_panthor_perf_cmd_setup *setup_args,
>> -		struct panthor_file *pfile)
>> +static struct panthor_perf_enable_masks *panthor_perf_em_new(void)
>>   {
>> -	return -EOPNOTSUPP;
>> +	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
>> +
>> +	if (!em)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	INIT_LIST_HEAD(&em->link);
>> +
>> +	kref_init(&em->refs);
>> +
>> +	return em;
>>   }
>>   
>> -int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
>> -		u32 sid)
>> +static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
>> +		*setup_args)
>>   {
>> -	return -EOPNOTSUPP;
>> +	struct panthor_perf_enable_masks *em = panthor_perf_em_new();
>> +
>> +	if (IS_ERR_OR_NULL(em))
>> +		return em;
>> +
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
>> +			setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSG],
>> +			setup_args->csg_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW],
>> +			setup_args->cshw_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER],
>> +			setup_args->tiler_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS],
>> +			setup_args->memsys_enable_mask, PANTHOR_PERF_EM_BITS);
>> +	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER],
>> +			setup_args->shader_enable_mask, PANTHOR_PERF_EM_BITS);
> 
> To save some repetition, maybe do this, although it might depend on uAPI
> structures being arranged in the right way, and the compiler not inserting
> unusual padding between consecutive members:
> 
> unsigned int block; u64 *mask;
> for (mask = &setup_args->fw_enable_mask[0], block = DRM_PANTHOR_PERF_BLOCK_FW;
>       block < DRM_PANTHOR_PERF_BLOCK_LAST; block++, mask += 2)
> 	bitmap_from_arr64(em->mask[block], mask, PANTHOR_PERF_EM_BITS);
> 
>> +	return em;
>>   }
>>

I think that would work, but I think we may strike the right balance
between repetition and maintainability here. When the enable masks are
converted from userspace, we can use the enum values to iterate through
them, saving a lot of repetition elsewhere.

>> -int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> -		u32 sid, u64 user_data)
>> +static void panthor_perf_destroy_em_kref(struct kref *em_kref)
>>   {
>> -	return -EOPNOTSUPP;
>> +	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
>> +
>> +	if (!list_empty(&em->link))
>> +		return;
> 
> Could this lead to a situation where the enable mask's refcnt reaches 0,
> but because it hadn't yet been removed from the session's list, the
> mask object is never freed?

Hopefully not, but will be dropping the enable mask refcount, since it's
not necessary.

>> +	kfree(em);
>>   }
>>   
>> -int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> -		u32 sid, u64 user_data)
>> +static size_t get_annotated_block_size(size_t counters_per_block)
>>   {
>> -		return -EOPNOTSUPP;
>> +	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
>>   }
>>   
>> -int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> -		u32 sid, u64 user_data)
>> +static u32 session_read_extract_idx(struct panthor_perf_session *session)
>> +{
>> +	/* Userspace will update their own extract index to indicate that a sample is consumed
>> +	 * from the ringbuffer, and we must ensure we read the latest value.
>> +	 */
>> +	return smp_load_acquire(session->extract_idx);
>> +}
>> +
>> +static u32 session_read_insert_idx(struct panthor_perf_session *session)
>> +{
>> +	return *session->insert_idx;
>> +}
>> +
>> +static void session_get(struct panthor_perf_session *session)
>> +{
>> +	kref_get(&session->ref);
>> +}
>> +
>> +static void session_free(struct kref *ref)
>> +{
>> +	struct panthor_perf_session *session = container_of(ref, typeof(*session), ref);
>> +
>> +	if (session->samples) {
>> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
>> +
>> +		drm_gem_vunmap_unlocked(session->ring_buf, &map);
>> +		drm_gem_object_put(session->ring_buf);
>> +	}
>> +
>> +	if (session->insert_idx && session->extract_idx) {
> 
> I think none of these could ever be NULLif session setup succeeded.
> 
>> +		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->extract_idx);
>> +
>> +		drm_gem_vunmap_unlocked(session->control_buf, &map);
>> +		drm_gem_object_put(session->control_buf);
>> +	}
>> +
>> +	kref_put(&session->enabled_counters->refs, panthor_perf_destroy_em_kref);
>> +	eventfd_ctx_put(session->eventfd);
>> +
>> +	devm_kfree(session->pfile->ptdev->base.dev, session);
> 
> What is the point of using devm allocations in this case, if we always free
> the session manually?

Not useful in this case, will drop the devm_ in the next revision.

>> +}
>> +
>> +static void session_put(struct panthor_perf_session *session)
>> +{
>> +	kref_put(&session->ref, session_free);
>> +}
>> +
>> +/**
>> + * session_find - Find a session associated with the given session ID and
>> + *                panthor_file.
>> + * @pfile: Panthor file.
>> + * @perf: Panthor perf.
>> + * @sid: Session ID.
>> + *
>> + * The reference count of a valid session is increased to ensure it does not disappear
>> + * in the window between the XA lock being dropped and the internal session functions
>> + * being called.
>> + *
>> + * Return: valid session pointer or an ERR_PTR.
>> + */
>> +static struct panthor_perf_session *session_find(struct panthor_file *pfile,
>> +		struct panthor_perf *perf, u32 sid)
>>   {
>> -	return -EOPNOTSUPP;
>> +	struct panthor_perf_session *session;
>>   
>> +	if (!perf)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	xa_lock(&perf->sessions);
>> +	session = xa_load(&perf->sessions, sid);
>> +
>> +	if (!session || xa_is_err(session)) {
>> +		xa_unlock(&perf->sessions);
>> +		return ERR_PTR(-EBADF);
> 
> I think we should return NULL in case !session holds true, for panthor_perf_session_start to catch it and return -EINVAL.
> 

What would be the reason to prefer -EINVAL in this case over -EBADF? I'm
not sure if this is standard, but the intent was to provide unique-ish
error codes to help userspace debug potential issues on their side.

>> +	}
>> +
>> +	if (session->pfile != pfile) {
>> +		xa_unlock(&perf->sessions);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	session_get(session);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	return session;
>>   }
>>   
>> -void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf) { }
>> +static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *const info)
> 
> Since this seems to be the size of the sample given to UM, maybe renaming it to
> contain _user_ would make its purpose more apparent.
> 

Will do.

>> +{
>> +	const size_t block_size = get_annotated_block_size(info->counters_per_block);
>> +	const size_t block_nr = info->cshw_blocks + info->csg_blocks + info->fw_blocks +
>> +		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
>> +
>> +	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
>> +}
>>   
>>   /**
>>    * panthor_perf_init - Initialize the performance counter subsystem.
>> @@ -130,6 +391,399 @@ int panthor_perf_init(struct panthor_device *ptdev)
>>   	ptdev->perf = perf;
>>   
>>   	return 0;
>> +
>> +}
>> +
>> +static int session_validate_set(u8 set)
>> +{
>> +	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
>> +		return -EINVAL;
>> +
>> +	if (set == DRM_PANTHOR_PERF_SET_PRIMARY)
>> +		return 0;
>> +
>> +	if (set > DRM_PANTHOR_PERF_SET_PRIMARY)
>> +		return capable(CAP_PERFMON) ? 0 : -EACCES;
> 
> I'm a bit clueless about the capability API, so I don't quite understand how
> this is the way whe decide whether a counter set is legal.

There are two different notions of validity here: this validates
the request from userspace. In the context of multiple clients,
the likelihood is that all of the clients are primarily interested
in the first set. In that scenario, a single client can deny
access to the primary set to all other clients, so the request
is restricted to only those processes that have elevated
capabilities.

In terms of what sets are valid coming from the hardware,
neither the hardware nor the firmware provide any information.

>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_setup - Create a user-visible session.
>> + *
>> + * @ptdev: Handle to the panthor device.
>> + * @perf: Handle to the perf control structure.
>> + * @setup_args: Setup arguments passed in via ioctl.
>> + * @pfile: Panthor file associated with the request.
>> + *
>> + * Creates a new session associated with the session ID returned. When initialized, the
>> + * session must explicitly request sampling to start with a successive call to PERF_CONTROL.START.
>> + *
>> + * Return: non-negative session identifier on success or negative error code on failure.
>> + */
>> +int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> +		struct drm_panthor_perf_cmd_setup *setup_args,
>> +		struct panthor_file *pfile)
>> +{
>> +	struct panthor_perf_session *session;
>> +	struct drm_gem_object *ringbuffer;
>> +	struct drm_gem_object *control;
>> +	const size_t slots = setup_args->sample_slots;
>> +	struct panthor_perf_enable_masks *em;
>> +	struct iosys_map rb_map, ctrl_map;
>> +	size_t user_sample_size;
>> +	int session_id;
>> +	int ret;
>> +
>> +	ret = session_validate_set(setup_args->block_set);
>> +	if (ret)
>> +		return ret;
>> +
>> +	session = devm_kzalloc(ptdev->base.dev, sizeof(*session), GFP_KERNEL);
>> +	if (ZERO_OR_NULL_PTR(session))
>> +		return -ENOMEM;
>> +
>> +	ringbuffer = drm_gem_object_lookup(pfile->drm_file, setup_args->ringbuf_handle);
>> +	if (!ringbuffer) {
>> +		ret = -EINVAL;
>> +		goto cleanup_session;
>> +	}
> 
> I guess this would never be the same ringbuffer we created in
> panthor_perf_sampler_init(). I don't think it can be, because that one was is
> created as a kernel bo, and has no public facing GEM handler. But then this
> means we're doing a copy between the FW ringbuffer and the user-supplied
> one. However, I remember from past conversations that the goal of a new
> implementation was to avoid doing many perfcnt sample copies between the kernel
> and UM, because that would require a huge bandwith when the sample period is
> small.

Rather than doing any copies, we want to be able to avoid as many copies
as possible. When multi-client comes into the picture, there has to be
at least one copy into the staging buffer (FW -> kernel) and either one
copy to every session or one accumulation for every session (kernel ->
user). Going this route, rather than copy everything every time, we
try to elide as many of the memory operations as possible, including
skipping empty shader core counter blocks, and doing on-demand
accumulation into existing sample slots.

> 
>> +	control = drm_gem_object_lookup(pfile->drm_file, setup_args->control_handle);
>> +	if (!control) {
>> +		ret = -EINVAL;
>> +		goto cleanup_ringbuf;
>> +	}
>> +
>> +	user_sample_size = session_get_max_sample_size(&ptdev->perf_info) * slots;
>> +
>> +	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
>> +		ret = -ENOMEM;
>> +		goto cleanup_control;
>> +	}
> 
> How is information about the max sample size given to UM? I guess through the
> values returned through the getparam ioctl(), specifically sample_header_size
> and block_header_size?
> 

Effectively, yes.

>> +	ret = drm_gem_vmap_unlocked(ringbuffer, &rb_map);
>> +	if (ret)
>> +		goto cleanup_control;
>> +
>> +
>> +	ret = drm_gem_vmap_unlocked(control, &ctrl_map);
>> +	if (ret)
>> +		goto cleanup_ring_map;
>> +
>> +	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
>> +	if (IS_ERR_OR_NULL(session->eventfd)) {
>> +		ret = PTR_ERR_OR_ZERO(session->eventfd) ?: -EINVAL;
>> +		goto cleanup_control_map;
>> +	}
> 
> I think eventfd_ctx_fdget can only return error values, so there's no need to
> check for NULL or ZERO.

You're right, will need to fix this.
> 
>> +	em = panthor_perf_create_em(setup_args);
>> +	if (IS_ERR_OR_NULL(em)) {
>> +		ret = -ENOMEM;
>> +		goto cleanup_eventfd;
>> +	}
>> +
>> +	INIT_LIST_HEAD(&session->waiting);
>> +	session->extract_idx = ctrl_map.vaddr;
>> +	*session->extract_idx = 0;
>> +	session->insert_idx = session->extract_idx + 1;
>> +	*session->insert_idx = 0;
>> +
>> +	session->samples = rb_map.vaddr;
> 
> I think you might've forgotten this:
> 
>          session->ringbuf_slots = slots;
> 

I did, caught it in internal testing later.

>> +	/* TODO This will need validation when we support periodic sampling sessions */
>> +	if (setup_args->sample_freq_ns) {
>> +		ret = -EOPNOTSUPP;
>> +		goto cleanup_em;
>> +	}
>> +
>> +	session->sample_freq_ns = setup_args->sample_freq_ns;
>> +	session->user_sample_size = user_sample_size;
>> +	session->enabled_counters = em;
>> +	session->ring_buf = ringbuffer;
>> +	session->control_buf = control;
>> +	session->pfile = pfile;
>> +
>> +	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
>> +			&perf->next_session, GFP_KERNEL);
> 
> What do we need the next_session index for?

When next calling xa_alloc_cyclic, it starts searching for a valid
session ID from the next_session index.

>> +	if (ret < 0)
>> +		goto cleanup_em;
>> +
>> +	kref_init(&session->ref);
>> +
>> +	return session_id;
>> +
>> +cleanup_em:
>> +	kref_put(&em->refs, panthor_perf_destroy_em_kref);
>> +
>> +cleanup_eventfd:
>> +	eventfd_ctx_put(session->eventfd);
>> +
>> +cleanup_control_map:
>> +	drm_gem_vunmap_unlocked(control, &ctrl_map);
>> +
>> +cleanup_ring_map:
>> +	drm_gem_vunmap_unlocked(ringbuffer, &rb_map);
>> +
>> +cleanup_control:
>> +	drm_gem_object_put(control);
>> +
>> +cleanup_ringbuf:
>> +	drm_gem_object_put(ringbuffer);
>> +
>> +cleanup_session:
>> +	devm_kfree(ptdev->base.dev, session);
>> +
>> +	return ret;
>> +}
>> +
>> +static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +		u64 user_data)
>> +{
>> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	const u32 extract_idx = session_read_extract_idx(session);
>> +	const u32 insert_idx = session_read_insert_idx(session);
>> +
>> +	/* Must have at least one slot remaining in the ringbuffer to sample. */
>> +	if (WARN_ON_ONCE(!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots)))
>> +		return -EBUSY;
>> +
>> +	session->user_data = user_data;
>> +
>> +	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>> +
>> +	/* TODO Calls to the FW interface will go here in later patches. */
>> +	return 0;
>> +}
>> +
>> +static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +		u64 user_data)
>> +{
>> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return 0;
>> +
>> +	set_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>> +
>> +	/*
>> +	 * For manual sampling sessions, a start command does not correspond to a sample,
>> +	 * and so the user data gets discarded.
>> +	 */
>> +	if (session->sample_freq_ns)
>> +		session->user_data = user_data;
>> +
>> +	/* TODO Calls to the FW interface will go here in later patches. */
>> +	return 0;
>> +}
>> +
>> +static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
>> +		u64 user_data)
>> +{
>> +	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return -EACCES;
>> +
>> +	const u32 extract_idx = session_read_extract_idx(session);
>> +	const u32 insert_idx = session_read_insert_idx(session);
>> +
>> +	/* Manual sampling for periodic sessions is forbidden. */
>> +	if (session->sample_freq_ns)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Must have at least two slots remaining in the ringbuffer to sample: one for
>> +	 * the current sample, and one for a stop sample, since a stop command should
>> +	 * always be acknowledged by taking a final sample and stopping the session.
>> +	 */
>> +	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
>> +		return -EBUSY;
>> +
>> +	session->sample_start_ns = ktime_get_raw_ns();
>> +	session->user_data = user_data;
>> +
>> +	/* TODO Calls to the FW interface will go here in later patches. */
>> +	return 0;
>> +}
>> +
>> +static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
>> +{
>> +	session_put(session);
>> +
>> +	return 0;
>> +}
>> +
>> +static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
>> +{
>> +	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>> +		return -EINVAL;
>> +
>> +	if (!list_empty(&session->waiting))
>> +		return -EBUSY;
>> +
>> +	return session_destroy(perf, session);
>> +}
>> +
>> +/**
>> + * panthor_perf_session_teardown - Teardown the session associated with the @sid.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the perf control structure.
>> + * @sid: Session identifier.
>> + *
>> + * Destroys a stopped session where the last sample has been explicitly consumed
>> + * or discarded. Active sessions will be ignored.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf, u32 sid)
>> +{
>> +	int err;
>> +	struct panthor_perf_session *session;
>> +
>> +	xa_lock(&perf->sessions);
>> +	session = __xa_store(&perf->sessions, sid, NULL, GFP_KERNEL);
> 
> Why not xa_erase() here instead?

To avoid race conditions with session_get/session_put. This way, we
serialize the session handling by using the XArray lock.

> 
>> +	if (xa_is_err(session)) {
>> +		err = xa_err(session);
>> +		goto restore;
>> +	}
>> +
>> +	if (session->pfile != pfile) {
>> +		err = -EINVAL;
>> +		goto restore;
>> +	}
>> +
>> +	session_get(session);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	err = session_teardown(perf, session);
>> +
>> +	session_put(session);
> 
> I haven't made sure that reference counting is balanced, but noticed session_teardown() is already
> putting the session's kref. I'll have a deeper look into it later on.
> 

The idea behind the reference counting scheem was as follows:
- session_create() takes a reference
- session_teardown() drops that reference
- session_{start,stop,sample}() take a reference for the duration
   of the function call.
- when requesting a sample, session_sample() takes an additional
   reference to put the session onto the list of sessions waiting
   for samples.
- the irq bottom half then puts the reference after emitting
   the data.

This way, even if a user terminates the session while it is
actively waiting for a sample, the lifetime is handled
gracefully.

>> +
>> +	return err;
>> +
>> +restore:
>> +	__xa_store(&perf->sessions, sid, session, GFP_KERNEL);
>> +	xa_unlock(&perf->sessions);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_start - Start sampling on a stopped session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * A session counts as stopped when it is created or when it is explicitly stopped after being
>> + * started. Starting an active session is treated as a no-op.
>> + *
>> + * The @user_data parameter will be associated with all subsequent samples for a periodic
>> + * sampling session and will be ignored for manual sampling ones in favor of the user data
>> + * passed in the PERF_CONTROL.SAMPLE ioctl call.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_start(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_stop - Stop sampling on an active session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * A session counts as active when it has been explicitly started via the PERF_CONTROL.START
>> + * ioctl. Stopping a stopped session is treated as a no-op.
>> + *
>> + * To ensure data is not lost when sampling is stopping, there must always be at least one slot
>> + * available for the final automatic sample, and the stop command will be rejected if there is not.
>> + *
>> + * The @user_data will always be associated with the final sample.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_stop(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_sample - Request a sample on a manual sampling session.
>> + * @pfile: Open panthor file.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @sid: Session identifier for the desired session.
>> + * @user_data: An opaque value passed in from userspace.
>> + *
>> + * Only an active manual sampler is permitted to request samples directly. Failing to meet either
>> + * of these conditions will cause the sampling request to be rejected. Requesting a manual sample
>> + * with a full ringbuffer will see the request being rejected.
>> + *
>> + * The @user_data will always be unambiguously associated one-to-one with the resultant sample.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> +		u32 sid, u64 user_data)
>> +{
>> +	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>> +	int err;
>> +
>> +	if (IS_ERR_OR_NULL(session))
>> +		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
>> +
>> +	err = session_sample(perf, session, user_data);
>> +
>> +	session_put(session);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * panthor_perf_session_destroy - Destroy a sampling session associated with the @pfile.
>> + * @perf: Handle to the panthor perf control structure.
>> + * @pfile: The file being closed.
>> + *
>> + * Must be called when the corresponding userspace process is destroyed and cannot close its
>> + * own sessions. As such, we offer no guarantees about data delivery.
>> + */
>> +void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf)
>> +{
>> +	unsigned long sid;
>> +	struct panthor_perf_session *session;
>> +
>> +	xa_for_each(&perf->sessions, sid, session)
>> +	{
>> +		if (session->pfile == pfile) {
>> +			session_destroy(perf, session);
>> +			xa_erase(&perf->sessions, sid);
>> +		}
>> +	}
>>   }
>>   
>>   /**
>> @@ -146,10 +800,17 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>>   	if (!perf)
>>   		return;
>>   
>> -	if (!xa_empty(&perf->sessions))
>> +	if (!xa_empty(&perf->sessions)) {
>> +		unsigned long sid;
>> +		struct panthor_perf_session *session;
>> +
>>   		drm_err(&ptdev->base,
>>   				"Performance counter sessions active when unplugging the driver!");
>>   
>> +		xa_for_each(&perf->sessions, sid, session)
>> +			session_destroy(perf, session);
>> +	}
>> +
>>   	xa_destroy(&perf->sessions);
>>   
>>   	devm_kfree(ptdev->base.dev, ptdev->perf);
>> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
>> index 8a431431da6b..576d3ad46e6d 100644
>> --- a/include/uapi/drm/panthor_drm.h
>> +++ b/include/uapi/drm/panthor_drm.h
>> @@ -458,6 +458,12 @@ enum drm_panthor_perf_block_type {
>>   
>>   	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
>>   	DRM_PANTHOR_PERF_BLOCK_SHADER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
>> +
>> +	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
>> +	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
>>   };
>>   
>>   /**
>> @@ -1368,6 +1374,44 @@ struct drm_panthor_perf_control {
>>   	__u64 pointer;
>>   };
>>   
>> +/**
>> + * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
>> + *
>> + * The hardware supports a single performance counter set at a time, so requesting any set other
>> + * than the primary may fail if another process is sampling at the same time.
>> + *
>> + * If in doubt, the primary counter set has the most commonly used counters and requires no
>> + * additional permissions to open.
>> + */
>> +enum drm_panthor_perf_counter_set {
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
>> +	 *
>> +	 * This is the only set for which all counters in all blocks are defined.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_PRIMARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will
>> +	 * have the UNAVAILABLE block state permanently set in the block header.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_SECONDARY,
>> +
>> +	/**
>> +	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
>> +	 *
>> +	 * Some blocks may not have any defined counters for this set, and the block will have
>> +	 * the UNAVAILABLE block state permanently set in the block header. Note that the
>> +	 * tertiary set has the fewest defined counter blocks.
>> +	 *
>> +	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
>> +	 */
>> +	DRM_PANTHOR_PERF_SET_TERTIARY,
>> +};
>>   
>>   /**
>>    * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
>> @@ -1375,13 +1419,17 @@ struct drm_panthor_perf_control {
>>    */
>>   struct drm_panthor_perf_cmd_setup {
>>   	/**
>> -	 * @block_set: Set of performance counter blocks.
>> +	 * @block_set: Set of performance counter blocks, member of
>> +	 *             enum drm_panthor_perf_block_set.
>>   	 *
>>   	 * This is a global configuration and only one set can be active at a time. If
>>   	 * another client has already requested a counter set, any further requests
>>   	 * for a different counter set will fail and return an -EBUSY.
>>   	 *
>>   	 * If the requested set does not exist, the request will fail and return an -EINVAL.
>> +	 *
>> +	 * Some sets have additional requirements to be enabled, and the setup request will
>> +	 * fail with an -EACCES if these requirements are not satisfied.
>>   	 */
> 
> Is this what we check inside session_validate_set() ?

That's right.

>>   	__u8 block_set;
>>   
>> -- 
>> 2.25.1
> 
> 
> Adrian Larumbe

