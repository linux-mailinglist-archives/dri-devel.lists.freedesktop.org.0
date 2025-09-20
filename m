Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81DB8BE66
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 05:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367A110E277;
	Sat, 20 Sep 2025 03:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4y+tKlRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EB710E117;
 Sat, 20 Sep 2025 03:31:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xV5x492dmkD8WDAQ2oKjLqQMQQnpe/UDF1lT/dsgpYasY9XTD9iHtqnwXxZNrk3dZryWE2pEc+6nrhscZYqFrbF/dCOcUsLXjsOSke4f5btt+s9l/O7nlf5/72z8lEWxQLQ35s+3N6tW4eYwEnhKVVRyXH0tv1m/I7P+LSiOM74RutvzkzrRRDMfvpGFSGT/OCkuqMYMgtOTocSWbov9aNj1ZabxL31WZguTAJv+lLfDjPcfPem4CNvMA538js/zb9tQs2Xp1XFTg/NMz+um5iwD5Wo9Ira0xRfKV2flSujGUKNX6KKSZqYyCE0Q/4pNJQbNcEjiLeeihW3kCLmoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydzBtSSmE/FnRIZOpz1j8ee8S89QZY0W1BW7JsGvTJM=;
 b=oSwk6IRb3wM+pNuJ7ZKZdP22l2LQMUVaSAlNca86AlYzO86YTiIjyZMhELih6DZRdekf2qjNxmYcefXs7wv8SH1w7q2hmqBN5HbSSclly+byL/wrPRpB6lZCWx6fCVj1l8Qm7b0Q3Ofp0CqS6WrAFY2C59YymrjUgB892ga+B7blh87qzq4D2hQKg1GsQwGiqlJ5t/kYuCOv/dtDO5Z4n1wCugih1mbM+pndCB+SJv/QSohm4/1kPTi+NLbTo+9y8F9s4JjyEcrkjs3GzP6qwTtXr52ZCRg9tkXSVm/3iohOEg2YMfn2pjYw6Y+yC5IqcPhbkcUaqFqv+veg8a7Kxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydzBtSSmE/FnRIZOpz1j8ee8S89QZY0W1BW7JsGvTJM=;
 b=4y+tKlRcfdAnAaVx+4YVWPHsNsNz9OEU0NYB+XGun/ZmL217kDGSnlmEGS+HSAVCheqmoZP+swLbIg/5N3Kijrryfa67HjQXL3KHrZrGhel618/mzobQJy4e0w6t5vTVSQPVgnGdsLiMxnUONrbyx4vYDd7FC9JmImvff77Lu/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB6591.namprd12.prod.outlook.com (2603:10b6:8:8e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Sat, 20 Sep
 2025 03:31:41 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%7]) with mapi id 15.20.9137.015; Sat, 20 Sep 2025
 03:31:40 +0000
Message-ID: <a0fd839d-c3b4-4f73-982a-b40bf993d566@amd.com>
Date: Fri, 19 Sep 2025 21:31:37 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 14/47] drm/vkms: Add enumerated 1D curve colorop
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>, harry.wentland@amd.com,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-15-alex.hung@amd.com>
 <87a2f6ca-c398-4222-8b23-d683c5fe6024@bootlin.com>
 <c1a1044e-dd05-4bf0-a903-9e13bfbf0de6@amd.com>
 <3fecacf2e1ea9b9e071cbb95e315a75a1cfb3b3d.camel@collabora.com>
 <73f01810-df2d-4e39-a20b-fc1cec2c5e12@amd.com>
 <034cd9c9-807a-4c9d-a6b9-a75ed0b350d5@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <034cd9c9-807a-4c9d-a6b9-a75ed0b350d5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0176.namprd04.prod.outlook.com
 (2603:10b6:303:85::31) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 396b4101-3bd0-4d6d-3011-08ddf7f6366f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmFnNlV5VlBLWlo1THBCM0NadkpubU9Ba0xmb2lXYzd2N0hhZFR6aW8vNHhO?=
 =?utf-8?B?b2lETWU4YzdIR1R3TVF2VmdBeFRnc2RCZ0NSdnNNTFc1R1pqc29DbFI4OW1Y?=
 =?utf-8?B?dEt3TmFRdEowSjJaemtHMjNlYXJudGhaeHplSkpVdE44M212UjlLbkpvdGJP?=
 =?utf-8?B?YWRyT2NVcXFGelRYbUo4N2NndldWTkxJMFRwRjQxYXRvd1NINm5CU3p5eUJn?=
 =?utf-8?B?c1ZaMTFITDV5cTZDa0xyN3RPbVBMOVJabGxMK1JNK0dmVENjNmlHVDRCZ3U5?=
 =?utf-8?B?dVhEcHVnSG1YVmxmb0p3Tks4L0NNbnkzZExtMnc5SFFzTjBkV3hwWTRyQlE1?=
 =?utf-8?B?NlVxNWpEUWNLcjRrTVhURGxNalBJYk4rNWpsVWVEKzN3c0FzMFlYeG15VmNF?=
 =?utf-8?B?VGxFUHBJdm5vSlhSNFdnQXNKYUxYOXpLL1pNTWlsVlY3NlVRMXdNSC8yY3pu?=
 =?utf-8?B?WFVZbGpNdVowOEJ6cDlCRHdnbkx6c3JvYmRLYWh2aFo4cXRrQ0t1WnRIVUJP?=
 =?utf-8?B?N3RKVFdCbnF3OSs4azl3aEM4MHZSTFF3MU8rWGoreEw1QW8yYUNCVVQ2Ykh1?=
 =?utf-8?B?Y1U4UW96RTVIaDdaYiswdlZ2K1hEYThHKytnMk5NZmNmWHdXSlhxNytIWDgr?=
 =?utf-8?B?YUxlU1pUV3lsZThsSGJnM2VZY29HN0h3L0RSc3ZpQTFXekV2MFZZTk5YbHFv?=
 =?utf-8?B?V3B2NXdCRldjYUx3SnZUVERUdEFmcTJtN2FhbU5GN1dWV2hmS2wwQkZueWNx?=
 =?utf-8?B?dEZ5MmRQRkhzT29nMTRzU1EyMEVyUjZDQkh1OW1lT1hoOTRidDdYbkhNNDFi?=
 =?utf-8?B?eUU2T3Fqbm1sdEZsaTM0clhQMGpQNkFzS0tSNUZnb3ZlMUZqWDdPV21mUDRa?=
 =?utf-8?B?VEwrQ1R3YzR4OE9mODBTcnk4Q3h4OEgrSWdLd0pPL1R0d2FNKytiWVZMeHlG?=
 =?utf-8?B?V3NDcGVIczJrM1NRTGM4SVRZN0dBVEVyNEdMaTB5RDhKK0RvNEJoNnd3bVM2?=
 =?utf-8?B?VUpXOTJhZzFneWZIMHJJK3ovMDlaMnQrYmp3S05XUzd3clk0VFAwY0RaZXFC?=
 =?utf-8?B?djhaMWtIWDlNVUZHdXBZelVOZnRYSnB6OGZxSjUzMStOR1ppMFVwSk1qall1?=
 =?utf-8?B?WThiTDUyUldrY201MS9uWGM1T1kwWHY5cjl1a1FjYm9Ed3l3SVNjTDhkeXhQ?=
 =?utf-8?B?SWxJbGZIN0Y5RmpGdmt6cWhaaWN6YWNLUUNRZFF4a1ZTQlAvaE1tN3YyanEw?=
 =?utf-8?B?dEV3SUpnNUwrbjVpV05YTC8wMkh2dTVjdWQ3MDkrZmhTd21Ickk5Mnd5emE0?=
 =?utf-8?B?WWxqRnNnTG5VOFR0bjBTcElBT0dERXptOGlJNERXMWJhdkNOeXlWbTRwa3g5?=
 =?utf-8?B?VHA5R1pJbTZjZWNBMDhBd2lQSlRVeFR4ZytaYTNFa0lVbTJFV0Yzc29Nd3ph?=
 =?utf-8?B?UzVNbTFHQkVzSE5CR2I2Y2tDcnZxT1NFQW9zV1FwWDNuSHBNRUJ0Q2tqd0dl?=
 =?utf-8?B?UEgza1pISXZRdmw0NnNGMFJkUSs4Q2NENzVxMkxqdW5zdjZKcWczUlAzeGUr?=
 =?utf-8?B?cTlJTkgxU0Y2TkVhK2FJTEFEdDJBbCtkSjRFNnFlcitmZ3hNSElyNjVMWmJr?=
 =?utf-8?B?UVQvM1hWdm5oN0VZVVBFUStBKzQ1Q1pvOWRtRTh0RGxSTlZiYllHWU1ORnJH?=
 =?utf-8?B?b0ZmRHFrMXlxbVlmRDFvTlE3cTRVeldaTUppNEFqMWVZSWR0aHl0T245NmZk?=
 =?utf-8?B?MjQrY3hleHk5NXd2bDFOaEk4cHg0N3V2WitmcGR2REw5T0VoSVZUYzJiaGVi?=
 =?utf-8?B?d2NmWlZtR1lSZ1YwL0dIR1AvNHZmcEtnaWIxRFR2N042ZE9yWDAxdHFENGtV?=
 =?utf-8?B?UUVyV1U5Q1hMODE3ck5COGVpMitMdzdFU284dXpTbDN2M1BJRWV1aW8rZ1l4?=
 =?utf-8?Q?r2sTgC7G7k8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWlGN2FPR0V0VjdsQ0ErTVk5cnZUVWNCNHdnZ0RwQjR4ZDVyUE9tQk9jSzhG?=
 =?utf-8?B?aGRYQkdOK3lHejkzQktMd0xUYjV4QnZudzZtWW05Rm1ORWZDWUpwbm95YU1m?=
 =?utf-8?B?L0F4RmZUTTlEc1pyWTlVdkhxZDB5NERlVmplQjNQUHcrbjVqbHhEcWJyT2Vx?=
 =?utf-8?B?WWVQbklFSXVqbmduYldCdXJCRnk4SE1LMy8wVzFTcGh2MG1vbXJnaTBsNEx3?=
 =?utf-8?B?ODZaTFFZOHNUN2U1RW1SSnRWNlFEUlpCb3hJVGp5cUxidFhaUTF4eFBtQ2Vv?=
 =?utf-8?B?VVBIY2plaWFNc0g4aWhTSVFBNGJHdzFsNDFmaEI3NFd5RG94SmZ2cFRNS1Zo?=
 =?utf-8?B?TU9tSXBkbTRWbkh6QkpHWG9nN3d2UjBrZjI0L3l5RHFabDREc1YxWHpIVzcz?=
 =?utf-8?B?eUdzckZETDh0WDVpODFzYktwdUU0M0tEYk5iOHkxb1RBR0RJeUthMmVxdGxJ?=
 =?utf-8?B?bXZuZVJNUnBYV1Q2V3JFRk5EYlowek95aHlQVSt3cjIvbDQ4MGg2eUYvZXBD?=
 =?utf-8?B?UjBzSEU4OUZmWGhMK3FOcXZ2VzdBTlBGREZRSm00TUtMdXVSck9hV3dUQmZi?=
 =?utf-8?B?eEVLNE8vZVZ4QzRZM3FoblFydzlKd2xpM1Y1RFo5dm16VDlZS1RLQlZGTkJk?=
 =?utf-8?B?dC91eGhTU0x6TU9FK01tYTdRTTVUWEdyeVFVMThwOUdpVUtNdENtSzRWU1lV?=
 =?utf-8?B?VnBWWkpsbnZTSG0xOEFReGQ5UHFQQWE3OHgxZ25neWtjZ1FRdzBjREpyUDhy?=
 =?utf-8?B?MlozdTVDbFNoWmJRVGVlUUNNMHhZOGMwMEtvS01uMWczUERGWlcxdUNrYmZ5?=
 =?utf-8?B?T09jT1h4RnBhZDJWWVdBWjErQ0tHSHdqWEZlUDY1ZGtQSGkwK1JQbC9VVEpp?=
 =?utf-8?B?VjdzcWhodDl5TDlZQis5YWhYNWZYNlJUM25JSFpQT28zcGZMYlptT3RaYmt0?=
 =?utf-8?B?QUEyU3FmZHFjYnRuM0hkeGJHRkVhMWlCd2ZJTTBobmt1aFVvWldGdjNIRjBR?=
 =?utf-8?B?WTBoL1pVUDdWWmo4UStXY3NaN2ZIcS95cUtYVlZqclB1cFNwTERtenpwT29X?=
 =?utf-8?B?MDhXQWRJTTRXQkxRMVJ0LzFCYUU2WXh0dzdjOTNISXlvRXBYamxsaXpYaEtv?=
 =?utf-8?B?aThqL2lyd3lKNGhqOEVjM3FyYlNUTTMxNjdyb0cvaU5oY0Nvd2J0VkNTNkU2?=
 =?utf-8?B?cnk2U0dwU3NFRXJsMEpoc0ZzNzZhQzM5VXZrR0xNVXlZWjJJL1dyYU1yWUxq?=
 =?utf-8?B?UEdIQ2thZUJjQ0EyWFZ6Uy95dXlvMzdoN05nSFptSGUxMkYxQi82WjlheUdK?=
 =?utf-8?B?OWlPK3ZFbUpKenQwTzJhL2NGbnZyckZTTjRuQ0ZtYkRnRzZldDVOY3Yvb0VC?=
 =?utf-8?B?MWNnTlcxNkZiczI5Qm41TVZRNkIrekR5d1dUTmRwNUhkOUI2YUdURytEZ2dH?=
 =?utf-8?B?VnRLSGdVaCtWQngwWFZ6ODllbmlZcFhjbFJjdHpKaUNLVjR5Z0RPaTVPMXRu?=
 =?utf-8?B?VU9kTTBTQU5lblFrbHYzRUNacnp6ek5jcnpJUTNkdWFCa1lPaXJrUkxCN1d4?=
 =?utf-8?B?YmdyV0NmYzlaRkF3d0dQWW9DUmhxdExtNnNvVHM4KzBoN0o1MlVmdXFmUS9r?=
 =?utf-8?B?YldzQ2xsWEtVdGZiellJT0dqbUJQQUx3dXJLSHc0Y1lEcDBjYjkxMlczek9t?=
 =?utf-8?B?U1JLU245Rlh2K1lXZmhncDh3YzNUc25KZ0V4a2FQZDFDREtZb1BnRjdHamM5?=
 =?utf-8?B?TzNJQVppNW90MHlUNEFkaTZ0cnpzT2hxejdWcGRVWFV2WTVMN0FKMitTL1VO?=
 =?utf-8?B?UHZxTVA5cHZadC9uVFlJcDJ3Njhvb3JJMDFpV0xQMmRLeXloOUdXejQzNjlJ?=
 =?utf-8?B?TG5EL3dxMTZONUI1YVdSditiQW5iUzA5dEVBcXpjaEQ2dHZhUHljd1JrMldp?=
 =?utf-8?B?SjBoaGJuQzVNTjFYUWFuWGl5QVh6WnRVZTJvQWFjSUc5a2RkeHlYdkJvQi82?=
 =?utf-8?B?Y0lOdHFiSWtDWjRQVCtXVldmTWhlUVNxZTlqOEo1SzRiT2V5NmQxVlUxNFdH?=
 =?utf-8?B?SjZkNGw2bll1UkJFT040WXczMjRxR1cydEpCdFVsUTJldnNBR05mUi9sZVdz?=
 =?utf-8?Q?jezji3frM0SBh9BA0yzbrcRif?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396b4101-3bd0-4d6d-3011-08ddf7f6366f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 03:31:40.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kJSdkP6vE2X5yhZFr/vn4q3IcpQUobhtRNMCYn8ZE18xB+sZl/QYNKFi8FZ7hmF7EJW3/3jlEVjhrSd784MEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6591
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



On 9/19/25 06:49, Louis Chauvet wrote:
> 
> 
> Le 18/09/2025 à 02:45, Alex Hung a écrit :
>>
>>
>> On 9/17/25 08:47, Nícolas F. R. A. Prado wrote:
>>> On Tue, 2025-09-16 at 19:54 -0600, Alex Hung wrote:
>>>>
>>>>
>>>> On 9/5/25 11:12, Louis Chauvet wrote:
>>>>>
>>>>>
>>>>> Le 15/08/2025 à 05:50, Alex Hung a écrit :
>>>>>> From: Harry Wentland <harry.wentland@amd.com>
>>>>>>
>>>>>> This patch introduces a VKMS color pipeline that includes two
>>>>>> drm_colorops for named transfer functions. For now the only ones
>>>>>> supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
>>>>>> We will expand this in the future but I don't want to do so
>>>>>> without accompanying IGT tests.
>>>>>>
>>>>>> We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
>>>>>> sRGB Inverse EOTF, and a linear EOTF LUT. These have been
>>>>>> generated with 256 entries each as IGT is currently testing
>>>>>> only 8 bpc surfaces. We will likely need higher precision
>>>>>> but I'm reluctant to make that change without clear indication
>>>>>> that we need it. We'll revisit and, if necessary, regenerate
>>>>>> the LUTs when we have IGT tests for higher precision buffers.
>>>>>>
>>>>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>>>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>>>>>> ---
>>>>>> v11:
>>>>>>     - Update drm_colorop_pipeline_destroy from plane to dev
>>>>>> (Nícolas Prado)
>>>>>>     - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test
>>>>>> robot)
>>>>>>
>>>>>> v9:
>>>>>>     - Replace cleanup code by drm_colorop_pipeline_destroy (Simon
>>>>>> Ser)
>>>>>>     - Update function names by _plane_ (Chaitanya Kumar Borah)
>>>>>>
>>>>>> v8:
>>>>>>     - Replace DRM_ERROR by drm_err (Louis Chauvet)
>>>>>>     - Replace DRM_WARN_ONCE by drm_WARN_ONCE (Louis Chauvet)
>>>>>>     - Fix conflicts with upstream VKMS (Louis Chauvet)
>>>>>>     - Add comments for drm_color_lut linear_array (Louis Chauvet)
>>>>>>
>>>>>> v7:
>>>>>>     - Fix checkpatch warnings (Louis Chauvet)
>>>>>>      - Change kzalloc(sizeof(struct drm_colorop) ...) to
>>>>>> kzalloc(sizeof(*ops[i]) ...)
>>>>>>      - Remove if (ops[i]) before kfree(ops[i])
>>>>>>      - Fix styles by adding and removing spaces (new lines, tabs
>>>>>> and so on)
>>>>>>
>>>>>> v6:
>>>>>>     - drop 'len' var (Louis Chauvet)
>>>>>>     - cleanup if colorop alloc or init fails (Louis Chauvet)
>>>>>>     - switch loop in pre_blend_transform (Louis Chauvet)
>>>>>>     - drop extraneous if (colorop) inside while (colorop) (Louis
>>>>>> Chauvet)
>>>>>>
>>>>>> v5:
>>>>>>     - Squash with "Pull apply_colorop out of
>>>>>> pre_blend_color_transform"
>>>>>>       (Sebastian)
>>>>>>     - Fix warnings
>>>>>>     - Fix include
>>>>>>     - Drop TODOs
>>>>>>
>>>>>> v4:
>>>>>>     - Drop _tf_ from color_pipeline init function
>>>>>>     - Pass supported TFs into colorop init
>>>>>>     - Create bypass pipeline in DRM helper (Pekka)
>>>>>>
>>>>>> v2:
>>>>>>     - Add commit description
>>>>>>     - Fix sRGB EOTF LUT definition
>>>>>>     - Add linear and sRGB inverse EOTF LUTs
>>>>>>
>>>>>>     drivers/gpu/drm/vkms/Makefile        |   4 +-
>>>>>>     drivers/gpu/drm/vkms/vkms_colorop.c  |  81 +++
>>>>>>     drivers/gpu/drm/vkms/vkms_composer.c |  51 +-
>>>>>>     drivers/gpu/drm/vkms/vkms_drv.h      |   3 +
>>>>>>     drivers/gpu/drm/vkms/vkms_luts.c     | 811
>>>>>> +++++++++++++++++++++++++++
>>>>>>     drivers/gpu/drm/vkms/vkms_luts.h     |  12 +
>>>>>>     drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>>>>>>     7 files changed, 962 insertions(+), 2 deletions(-)
>>>>>>     create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>>>>>     create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>>>>>     create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/vkms/Makefile
>>>>>> b/drivers/gpu/drm/vkms/
>>>>>> Makefile
>>>>>> index d657865e573f..0b8936674f69 100644
>>>>>> --- a/drivers/gpu/drm/vkms/Makefile
>>>>>> +++ b/drivers/gpu/drm/vkms/Makefile
>>>>>> @@ -8,7 +8,9 @@ vkms-y := \
>>>>>>         vkms_composer.o \
>>>>>>         vkms_writeback.o \
>>>>>>         vkms_connector.o \
>>>>>> -    vkms_config.o
>>>>>> +    vkms_config.o \
>>>>>> +    vkms_colorop.o \
>>>>>> +    vkms_luts.o
>>>>>>     obj-$(CONFIG_DRM_VKMS) += vkms.o
>>>>>>     obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += tests/
>>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
>>>>>> b/drivers/gpu/drm/
>>>>>> vkms/vkms_colorop.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..f955ffb0ac84
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>>>>>> @@ -0,0 +1,81 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>>>> +
>>>>>> +#include <linux/slab.h>
>>>>>> +#include <drm/drm_colorop.h>
>>>>>> +#include <drm/drm_print.h>
>>>>>> +#include <drm/drm_property.h>
>>>>>> +#include <drm/drm_plane.h>
>>>>>> +
>>>>>> +#include "vkms_drv.h"
>>>>>> +
>>>>>> +static const u64 supported_tfs =
>>>>>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>>>>>> +    BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>>>>>> +
>>>>>> +#define MAX_COLOR_PIPELINE_OPS 2
>>>>>> +
>>>>>> +static int vkms_initialize_color_pipeline(struct drm_plane
>>>>>> *plane,
>>>>>> struct drm_prop_enum_list *list)
>>>>>> +{
>>>>>> +    struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>>>>>> +    struct drm_device *dev = plane->dev;
>>>>>> +    int ret;
>>>>>> +    int i = 0;
>>>>>> +
>>>>>> +    memset(ops, 0, sizeof(ops));
>>>>>> +
>>>>>> +    /* 1st op: 1d curve */
>>>>>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>>>>>> +    if (!ops[i]) {
>>>>>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>>>>>> +        ret = -ENOMEM;
>>>>>> +        goto cleanup;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>>>>> supported_tfs);
>>>>>> +    if (ret)
>>>>>> +        goto cleanup;
>>>>>> +
>>>>>> +    list->type = ops[i]->base.id;
>>>>>> +    list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d",
>>>>>> ops[i]-
>>>>>>> base.id);
>>>>>> +
>>>>>> +    i++;
>>>>>> +
>>>>>> +    /* 2nd op: 1d curve */
>>>>>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>>>>>> +    if (!ops[i]) {
>>>>>> +        drm_err(dev, "KMS: Failed to allocate colorop\n");
>>>>>> +        ret = -ENOMEM;
>>>>>> +        goto cleanup;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>>>>> supported_tfs);
>>>>>> +    if (ret)
>>>>>> +        goto cleanup;
>>>>>> +
>>>>>> +    drm_colorop_set_next_property(ops[i - 1], ops[i]);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +
>>>>>> +cleanup:
>>>>>> +    drm_colorop_pipeline_destroy(dev);
>>>>>
>>>>> If it take a device, it means that it deletes everything, which is
>>>>> not
>>>>> what I would expect here: you are curently allocating a specific
>>>>> plane
>>>>> pipeline, and deleting all colorop for other planes because of one
>>>>> failure is counterintuitive.
>>>>> In this situation I would expect either:
>>>>> - error propagation to vkms_create or vkms_output_init (it is
>>>>> already
>>>>> the case) and "device-wide" cleanup in
>>>>> vkms_create/vkms_output_init;
>>>>> - "local" cleanup (i.e only this specific pipeline)
>>
>> the colorop are now in dev->mode_config->colorop_list, so we can use
>> "drm_colorop_cleanup" (assuming it is changed to be available here) for
>> cleanup if removing entire colorop_list by
>> drm_colorop_pipeline_destroy(dev) is not desireable in vkms. Does the
>> following code make sense?
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c
>> b/drivers/gpu/drm/vkms/vkms_colorop.c
>> index 0191ac44dec0..d263e3593ad5 100644
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -19,7 +19,7 @@ static int vkms_initialize_color_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>        struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>>        struct drm_device *dev = plane->dev;
>>        int ret;
>> -    int i = 0;
>> +    int i = 0, j = 0;
>>
>>        memset(ops, 0, sizeof(ops));
>>
>> @@ -91,7 +91,10 @@ static int vkms_initialize_color_pipeline(struct
>> drm_plane *plane, struct drm_pr
>>        return 0;
>>
>>    cleanup:
>> -    drm_colorop_pipeline_destroy(dev);
>> +    for (j = 0; j < i; j++) {
>> +        if (ops[j])
>> +            drm_colorop_cleanup(ops[j]);
>> +    }
>>
>>        return ret;
>>    }
> 
> Yes, that could work!
> 
> I think you need to add a kfree for ops[j], but this code is better: it 
> only destroy what was allocated in this function, no more.
> 
> BTW, while reviewing this series + post_blend, I noticed that the 
> pipeline is never freed on device destruction. Did I miss something in 
> the colorop core? If no, I think it should be added in vkms_destroy or 
> using automagic drmm_add_action_or_reset in vkms_output_init.

drm_colorop_pipeline_destroy cal be called in vkms_destroy.

@@ -240,6 +240,7 @@ static void vkms_destroy(struct vkms_config *config)

         fdev = config->dev->faux_dev;

+       drm_colorop_pipeline_destroy(&config->dev->drm);
         drm_dev_unregister(&config->dev->drm);
         drm_atomic_helper_shutdown(&config->dev->drm);
         devres_release_group(&fdev->dev, NULL);


> 
>>>>
>>>> Hi Louis,
>>>>
>>>> Does it make sense to make drm_colorop_pipeline_destroy(drm_plane),
>>>> i.e.
>>>> in PATCH 13 as in previously V10?
>>>>
>>>> and then drm_colorop_pipeline_destroy should limit to the pipeline in
>>>> a
>>>> drm_plane and should do something like
>>>>
>>>>      drm_colorop_cleanup(colorop);
>>>>      free(colorop)
>>>>      drm_plane->colorop = NULL;
>>>>
>>
>> This doesn't seem right after digging into it.
>>
>>>> We can have same behaviours accross device drivers like amdgpu too.
>>>>
>>>> Hi Simon and Nicolas,
>>>>
>>>> Do you have comments on above proposal?
>>>
>>> Hi,
>>>
>>> indeed that would make more sense to me.
>>>
>>
> 

