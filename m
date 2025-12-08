Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30195CACAA8
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8655310E3F6;
	Mon,  8 Dec 2025 09:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kz5Pz/MK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010028.outbound.protection.outlook.com
 [52.101.193.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EAE10E3FA;
 Mon,  8 Dec 2025 09:27:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKbU8qaDYExOAC/iWeCg8QXMBThMsPL0jrsqH2a4YGNYFuNCiu1DlS30r6lpp/9HRS3eF5gAiU2Rbw2tzSFC6k+PzW8tU34C0mUkoZHMhrQM2lMJPC8eluOkVUYEmwvgSVWaLNZ2OJdmAh54rN8Ayd2OxrK40TLb/yQVPAglhp+9O4L8mkJYj4PHz2Ral3RLz8Vk+OgtDW+EP/WCulg0NtigyBhNrafLM37R1W8ZybC9ehmRL3h75u9H7WZoLNfxX5mwikWVzeEOgPI4JCVH9pDqeUr1TIQDo/1guOHkfvwczR/ds2dZsAjxtSKL/AgAf57bo8n6mFKKENq5w3CVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7teLgg6EgsF8N9fNRuAG7SdzMg3mcKymiOvBWy5SMug=;
 b=GDyW6Li6UFPAv7jhVXYWVWf1VSFO1AW5ZorT5NGgw3nU9sXNctwMGIVoSbv3WYEKySXhcBg1bjHX1YIXljHcgrT+o5Wl+TUxdenPTnECz6Q6kd4WZsFOFfXPF2ApKXbtKR2UFcO4CWLM6QCfIt7gsLn4kimTzGW5UJ11AGukCY9WaaM4e4QRa6FgP7FwurnE/yhTGy8B+Vythp6mE+Z/4s7TyTH/nIvf/vGDPVZC1kuRfhYlEk1b1rAv7Kc+o6mrxrwiX7GQ+4BntcMgzjXH7yvqVu/USMMq0PGYiOvNI450D7gBNHl9Yb71zzRKoItIE0iWZ/dvyNp7oPVIh8HNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7teLgg6EgsF8N9fNRuAG7SdzMg3mcKymiOvBWy5SMug=;
 b=kz5Pz/MKBLxhxV2WFIORrToDk3n9UxAqOfUT3oa7Z3rsV4WbPn85bV7AbzITkQj6CXhblFImajjq+dpK+sywZEO5gK0oxl0kkV/T7P4+OSFSpCEUXiGv4ji9/x9CSYcGGSLhHHQHePeeyjX38fSf0iZBI6Q2hoHmkOmc/d/c9lx/SJMvsUIo/f9APd51gDWcSC86iqo8/ewN/mxpN2cm/BT1kaVL7a2Dpt11KxI1zucVq+D7+uQ4kMK4A07PBJaD+nGfjk9SbCitPeoo1gquZWnDAxEpB9asIoAUjcZkzkYUs0gwv7IYSD+akI2HRacroYgq/HDwqEGAXQdF72SM8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:27:00 +0900
Subject: [PATCH 8/9] gpu: nova-core: use core library's CStr instead of
 kernel one
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-8-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS7PR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:604:250::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b9ee85-8fa3-460d-87b3-08de363c0783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N28xNDFraWZrZmtiZWczUVI3bnJRSmJKU2g1R3A1amEyUHNLOHFYZ3dMcHdv?=
 =?utf-8?B?YTdPckFnQnNOY2t2eUhCVzJMa1EzZm9uVlhEZjBRZEhaSjBBMGdGang2V2Mw?=
 =?utf-8?B?OE5xd2pBdzVrcCs2Wnp1cGQ4REtiNmlPekJUSDRiYThnK1JpK2lZTkJoU2Fo?=
 =?utf-8?B?TXlsTHhOTGRiQVJJR1dmbzNvT2N2b1doK3RHbVZWOTJwM3BQYW5qb3VwbWk2?=
 =?utf-8?B?a1B0SWEwZzdZdkRrbTVOdHpIblIwakFFd2lGQTU5RjA3bXUyZVFFOGc4YVk3?=
 =?utf-8?B?MEZaSlBrWWR6dnMxMXNpY2JDdzIxMEhUZmlGTTg1WW15a3BwRnV0cXZMb2gy?=
 =?utf-8?B?MXhaK292dDRFd0IzSXlzZklqZU8ydmtZSXBzSTkrREZvRVdjVGE1c2U3VnVK?=
 =?utf-8?B?R0xZRHo5N09tT3pTQytMVUNQYmcybnpsSGpwZFB2d3Vwc3lFRHkrdHpNWCt6?=
 =?utf-8?B?cVREeGh2U1QrVlppZTc3YytKN2xKL1V6NFZRWHBMQUNVTVNtSFdXa3RXUGtZ?=
 =?utf-8?B?ajdhQ1FPZlhJRWhmQXFJR3UxV21JZ3dlZURuUkViTHpTZzZjY05vZTMrVUpr?=
 =?utf-8?B?ZDgwR3Q1ZVp5eHgzQ3JHL3RqQ0RKSW1XdW5XQmlvaElMVlVWendyTGRRNGFm?=
 =?utf-8?B?Y1l6aHpNSnY4L24waStjU1lrY0ZYMG40cEpxbDhyVGlHcTliOGRvMGE4dEVX?=
 =?utf-8?B?by9YNWxiZGNLM3hZaFE0MUdpMXprN2lDOHAyQjlHclRET3VzbzBRZGdCemJx?=
 =?utf-8?B?bGFhekIxL1VXTXc5eGQ5K29YTWtYdW5ER3cwOWl4MVZzMEpybW43NkRRQ2Er?=
 =?utf-8?B?Tmd3Rm1MYnNwcTdIYUdqenhLenVvcjU2blBPdGVKOEJRWXlSdllNSTRMTmxZ?=
 =?utf-8?B?U215YlgwaytncUtwRHJVMUwxN0c2NzdoRG5aQmcvN24yb1M1cWdRYngwVkFl?=
 =?utf-8?B?cjNtK2d3b0hxU3FTUlI1bTFaYUloaW9hQWpXclM0R0JCT2ZhcExSSmRKODRi?=
 =?utf-8?B?QnE2Y2pPeWZhWTJmOWRMTFBUTldpNWZ3Nk5tWmFlUTN2WTB6QStiN1cxczRl?=
 =?utf-8?B?eW5lTlo1YzRuaGYyWkVJelFSZnNxMzhmRStzOTZFNFg5RkNPNUVtQUlyWjZV?=
 =?utf-8?B?U2dwUjBrQmlkaVowMXNEQjZodGZHYy9NSVBpWlR0dno1M2ZMZnViRlMreGZL?=
 =?utf-8?B?U29BYWo1SGs0YStlUWo1Y1luVWo0cmJvN1ltVlVzK3NtTUVicWNxQTQzL2xE?=
 =?utf-8?B?TVdBYnJPajlvbElOOThneWRua1dpT0kzWkVrQXJYZE5vbWtmM3RBenJMamdP?=
 =?utf-8?B?dTVnam1Xa0VGMVVNOEF4RDQ5OVpNaDFFcnM4MTczaW94ZlFHWnlNeHVDQTM2?=
 =?utf-8?B?MEJxUWVPUkFFYTd6RjVsSXhnTk53VWxQdnlpY05uZjI2YXgwQk54eE5KbS9x?=
 =?utf-8?B?dEtFUmRwNk5Pd1g1V3dqUmxLZzJraVF5OWVVMHhURWJhZ3RGUDJmMGxSdkZW?=
 =?utf-8?B?dE5BTFIySkJsUnhBSWN4aW9mTDNMbWFzTXUzYUdua25TLzd2WUdyam5CNzBs?=
 =?utf-8?B?R0x1OTRYR0pNWUZqNDFJenpHSlZjdjFSL1NnS2hUMXRsUlRQeVlxUkhhUmhY?=
 =?utf-8?B?MG9XRDl1NDgzSmRuVm9JSUNnSy9MbmFQbjlRUlpQWkJVc2ozMjQ2eGhZbnlj?=
 =?utf-8?B?aEJoQU9jdnRieWdETThycHptUUtsSjJFbVlUV2VhVmt6WHhndG9pL1NZNDBJ?=
 =?utf-8?B?amFta3ZUa1VIV3JNNUVyUm9CRVZWcEZCSHRLMllRTzFOU0cxalhzeVMrN29L?=
 =?utf-8?B?SEJjZ1FQWC8yVkpDZ0kvck56NkpWcktidXhZUzRMbHg0TlpIc2JzdHl1aXB0?=
 =?utf-8?B?UkxBS3lhVkRPbjJ5N0xXaVo4dFBXSTVZbUVlU01qcml0OVBEc3RwbDljdkVT?=
 =?utf-8?Q?cVVdPMGLnAUMldeM/WhhoWZ0+W70docD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEJLUGhRMjBLMitoUWZqZCs1Ry80QXYzVjF0UHc1TUpTYkh1c3VTQy9MeGhG?=
 =?utf-8?B?Vm4wbHdqenNsSFpjVGc3aFJ6QU94T0JWZHowYXVsa2xiWWVZWU9RTityNVpi?=
 =?utf-8?B?MjBlajBCT2JsVWQ0bEZZNWx5aXZjaVV5cmQvMGhmUVdjaXhvckNMU0h4bmxk?=
 =?utf-8?B?S1NSa09yaXQ5Q3lWbzVPb3lpRXFncnR6dVVKRGlCV1pKQWh3TTlFV3JST3BT?=
 =?utf-8?B?THgwWEZhSWdoc0ZZNEw1WW9EOGVoejBSRFRKVm9GUnNWNmFrRkhqSnprelRr?=
 =?utf-8?B?UW5UUktDa3BSa3RFTEJjV0JreUIyVmZhbGlvcEpybTFJOWR1SVpUZEtOMVF6?=
 =?utf-8?B?aUxqUFVxTWpVM3BlZGxWSHlTUlBicEV1anE3N3NxY2tES3RMeTV1M1ZnNS95?=
 =?utf-8?B?aVVrMCtHc1dTLzVxWHF2cXB2dEVKWnRnV2FZOCs3c1BhMFUzVzhJN2pweHF3?=
 =?utf-8?B?U0dkdS9WeGowUFRyZDUrRjdkM2pqa3VaZWZZdWhvclFUZHY4bExoWmxUSzdq?=
 =?utf-8?B?b0thcEJmc1E1VHRPMlRmKzZZSmJBbVV2KzB3S1FzWkgvOW1LTlhpeXdVOGN1?=
 =?utf-8?B?dzhGc3VsNDRkNHNXampCWHcwNzVvckZlU3p4a3JrclRPOG9JTmQ5SldOVG0v?=
 =?utf-8?B?dHoyNzhlV2tuK29uZGo1OGQzWDh3V1NSNGlDY0RIZ2R3VmtGaGVNUWR5eDdG?=
 =?utf-8?B?T1hVNzcxV3UxZEtNa0VDTm00amNJaytXdXladWJ1cU82VEx4NWV6aDl3OU9m?=
 =?utf-8?B?VjdqQm42VVdwaWlIbWxZMXhmVU9XZDVjSTBzMWs1WmloVzcwRE8raGlRRk9l?=
 =?utf-8?B?disyL0xxV2tIaitVcjdWSWpGZ1EvTGNKMk9NeXFNWnNOZVlFSHJUblNNdFJT?=
 =?utf-8?B?amVPQzg1bnprWGtkTE9ieHhHNUhSM2MvSDkwOElOVGdrOXJTSVZBditJaU1I?=
 =?utf-8?B?eEtnMjJBNmpoQVN1RnBvbjVaNW1scnlJaGdGVTk0VFV6QlVMUlo1YXFVTUNJ?=
 =?utf-8?B?QzNycEpOcWxxQlpITlJnUUtLZ1M1aWlRZ1Jlc1JvUmY4emltZTV4dWFDYnVU?=
 =?utf-8?B?RFp4b2gzdXF0bFVPdlA4YW1hdmdDRTg5WjVRYm5KQmhJckV3T21MOVo0ZCtp?=
 =?utf-8?B?SXZWcEMxdERkUlR6aEpQVk50QW5WSkJjR3pEUTVjK0JLdmh3OERRUFRub25J?=
 =?utf-8?B?cklhcmRsRFFNSVZJeW52ZkJObHZJdGNibkhqRjcrSFR4NjRsN3ZOUDY3Sjcw?=
 =?utf-8?B?QXJwNnFsbExZT2ZmenZuL2Jxem9pTkFDeDRMOW9XZEJBNFYyOTR0U0I0WnlZ?=
 =?utf-8?B?RkdUaEc5ajE3Si9RcTBEM0ZOSVI1K0ZTZ0tpWDRtVHZOR2ZOSUFjWU9JK2Zx?=
 =?utf-8?B?ak90dnRSK3dZMHdSYjFMU2RNZGFEa05xbWdSYzd1OW5HeUZrak96eGo4Mzlu?=
 =?utf-8?B?K3pyVlRTWnRJWHVocGdIL2VjVmxhNUU2QXN6cS9mV3M2SVN5UjhaaUIrTkVi?=
 =?utf-8?B?WGJXaFY4anUzNDJyKzJBUzBWZGM1L3RBQmg3ZmdkeU1GdG1TSWI1MVFseUY3?=
 =?utf-8?B?QnM4UjlFVmZHYlJXOXhCSjdnRUVpS2VicCtMWUJ4M1pvZThrMTNGK1FUa2s3?=
 =?utf-8?B?RVlpb0poWVN6WHNLejVDMjAzUlhuQW1INDdEYXREM1V4bnc3M0xtOUdZVkFH?=
 =?utf-8?B?UW84dk5aMXRyTk5XbGM1Q2RvVmNlS0lnYTVVUHBvNU9ldmQ3YmxweVd5WnBM?=
 =?utf-8?B?MUdYZ0p3K1B6aWxCaVlCYkdLL2x3Zk5tRVFVUFpIdGtQTWJHM1M5VGZRMTlj?=
 =?utf-8?B?V1M4QUxvUlBQQjcraWZ1ejZLNEtpNVVlZnVyV0J0d1luOHhJZjYvdHF2eits?=
 =?utf-8?B?dkZuWjRpVk10bThQNldEZUFwYWlMQ2V6Q3Y3MW4rWnB4ck1ZZnFIN1FGWi9j?=
 =?utf-8?B?b0FxRGw2SUV6dVVVNHN1azZvOGdLaVl0YVFNTlpSb1V4SXNZOGJEclVaL2xQ?=
 =?utf-8?B?UCtFejB2cXhBSzViMmdzZVljMmFkWFlOQ3JxcHpBOUIreGZNb2Z6b1VjSEtE?=
 =?utf-8?B?OFhLMTdRbWZyWDBEeVo1ZDlGL3JpSVM5L3NHQk5XS014NTUybkNpdk1lL2gx?=
 =?utf-8?B?aGF0cFB5NW5hWWRQQnhBc3JUMUpLb0NFcVBMNE1JUWpXeHQzTDFPdU5sOFk2?=
 =?utf-8?Q?mCaAousKNwNXjkwIvASvZbg5S826MIiWYmUKNpcs5Ul+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b9ee85-8fa3-460d-87b3-08de363c0783
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:38.6548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wQ7f93xcH4dZeUW6HOkMIvXbFWqwGbbUSOrKSwuLgexsck7ktuAaMDBk8UmVtcH1DamRGLmniq13CuwYiNktw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

The kernel's own CStr type has been replaced by the one in the core
library, and is now an alias to the latter. Change our imports to
directly reference the actual type.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 2 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 6 ++++--
 drivers/gpu/nova-core/nova_core.rs    | 2 +-
 drivers/gpu/nova-core/util.rs         | 4 ++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..672f6cd24d4b 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -229,7 +229,7 @@ const fn make_entry_chipset(self, chipset: &str) -> Self {
     }
 
     pub(crate) const fn create(
-        module_name: &'static kernel::str::CStr,
+        module_name: &'static core::ffi::CStr,
     ) -> firmware::ModInfoBuilder<N> {
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..53fdbf1de27e 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -34,10 +34,12 @@
 /// that scheme before nova-core becomes stable, which means this module will eventually be
 /// removed.
 mod elf {
-    use core::mem::size_of;
+    use core::{
+        ffi::CStr,
+        mem::size_of, //
+    };
 
     use kernel::bindings;
-    use kernel::str::CStr;
     use kernel::transmute::FromBytes;
 
     /// Newtype to provide a [`FromBytes`] implementation.
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..3c26cf0b7c6e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -19,7 +19,7 @@
 mod util;
 mod vbios;
 
-pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
+pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 4b503249a3ef..8b2a4b99c55b 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,10 +3,10 @@
 /// Converts a null-terminated byte slice to a string, or `None` if the array does not
 /// contains any null byte or contains invalid characters.
 ///
-/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
+/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
 /// slice, and not only in the last position.
 pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
-    use kernel::str::CStr;
+    use core::ffi::CStr;
 
     bytes
         .iter()

-- 
2.52.0

