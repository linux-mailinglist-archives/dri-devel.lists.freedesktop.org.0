Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6FBA0FF4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 20:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9410E2CD;
	Thu, 25 Sep 2025 18:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YRRu6s5p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012058.outbound.protection.outlook.com
 [40.93.195.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ECD10E188;
 Thu, 25 Sep 2025 18:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4J/CRDd/XWlfTc1xqCb8lIzf3S5G0o7SpncHw6fI8Da3lQr3RJgV73zl4XInomX7wM6VEPyaW3F2CnRGo6Pzoi9uJRevJNenPdaegp4EFacn7ZlnWB3PBlXFI3MpgHpuHYEwztQgAUvKeLf3DbCY6y/XMeIlQtM726G0iHkJ6EUDL8UoZFGZjVpbbrcDXtin1osZz7cPdx/XuJqU91+WGi0Q7mmSqiITxMbkcLgEHMsbAmGkkqwg+mkv5q3rg3SxFDR51T8HpoSIk/NTIWvf7O+TkLNaHUbTylH1565dA1lcfyes9gvIwslPsqQPZno5nlBZl5jihBTTzya0YzEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHVpVDMbEqrXEcIUeJbKdLlF9oBCd9klDYpxSiSh54M=;
 b=dQqzf0RWumKf9GhHxnH0babMQs4ckWohts/pnq0miCMzbNbcWkuDQIK0Qt1NEcrCvoQef9PTxQY/lbjpQUdFVHhqkFvoXtSgTE7M0y5Rs+c/XBmnWLhbr0qizGz/X4AyKemaZ4XUhos3pO5mxRsUR01LmW1qQgNK7aWjrlJ6WvLutYSxJ0pcYmVwRUrMO8zBMfZf1MWJLEc3+SVYwR0RkOkVvWm5D+msyp9wV5sqWRWfwVj9jOZ84a6TdURGSYEydevB9TG2cVat71+v96jQzhWhC/HpjregQ9DCxFvwadvYztmMGthRGLQ6RVJqEJgigHPXlb6YhIuzrZK79YZ7Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHVpVDMbEqrXEcIUeJbKdLlF9oBCd9klDYpxSiSh54M=;
 b=YRRu6s5pMSeZPXIz0EnAvjxFSfjh7twNhyNfc4ZH54Uys+wOGNbSEOQUsxIQzsCEsJEKPfMMA2JcbWJqEcefKiy2q2CzkCgoZjEpeHFlL1WlWgdqM1hLLZBhX1vqb0FrADJ5i4w91P7xlnz1FK/tOFgjxKKM25Y8nCGiBIqwV50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ5PPFFA661D690.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9ab) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 18:22:52 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9137.012; Thu, 25 Sep 2025
 18:22:51 +0000
Message-ID: <3053c925-0cc1-469e-a7da-17d4ee802742@amd.com>
Date: Thu, 25 Sep 2025 14:22:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Alex Hung <alex.hung@amd.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, contact@emersion.fr,
 mwen@igalia.com, jadahl@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
 <20250826120306.618c275f@eldfell>
 <610215a0-50ad-45b8-b60a-a52441619c73@amd.com>
 <20250918114036.454735e9@eldfell>
 <7abe9596-1d85-4b14-94ab-97bd4dfe0977@amd.com>
 <20250923105918.41f832c2@eldfell>
 <1c7158fc-db72-4ba0-81d2-8bfecf36a2c2@amd.com>
 <b8abcab1-3953-410a-b639-5a74f9d2819e@amd.com>
 <20250925110238.5f872e69@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250925110238.5f872e69@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ5PPFFA661D690:EE_
X-MS-Office365-Filtering-Correlation-Id: b64f2171-ac5c-44df-57c4-08ddfc6089b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S29Hb29JZEp5RmxhdkpWYzQwcTRaNURwTmRON1JJSGxzQVNUNlV5Ti9lZkdz?=
 =?utf-8?B?cERQOWlpZUxhVFE3VFgzVEhPNXVpOW9jK2F5TVUwT3l3TGJ6eUYzL0RCZ3c2?=
 =?utf-8?B?SGtLSGQvNzJoSW9vMVdXTU9SVVdlMU5kR1QzSXFueFI3MHlGSEhiVGFid0ts?=
 =?utf-8?B?L2F3MVh4Si9TVEN2REprNzRNd3JwZVRwVTVUOWtnTG9BbTNlaEU3ODM3STd0?=
 =?utf-8?B?a0dvM3VTK3BURWtkYkRWb0JoTWlIeGQzWWxoNDhjakl5YTNFa2dvcitxWGU2?=
 =?utf-8?B?YWRXT0ZOa2VlMFkyMWxIdUpVd0p3WU82TW5qMXEzeWRVZkh3eVc0OEQvUmd4?=
 =?utf-8?B?aWtIQU1XSGdlTzZBZXVpQnQxMFdsdS9sUWdpdUM4K1FBOHBzbTRKUSt6TUts?=
 =?utf-8?B?ZWFUUWh1dERnaXRBS0dHOTUySzBVNlhiMXRqMlg5Z1p1MHQ4TmZJODUwZ2hC?=
 =?utf-8?B?OEpSQ3dyZFVtSWNVUGhEeEJscXFKMGZSRmcrOWZYU3lmT1lmQ0sxZWJNRStN?=
 =?utf-8?B?WC90TzVTSkg4aEtiNCtFMlpwV0Y0b2NaNGtkcEppVy9WdjhMUmphdVZGR0JC?=
 =?utf-8?B?TFFOS2ZzRi90RU93Nng4KzErdmZzeGFLbGtBUHhBWjMrR1JNRlpWU0hOTjJk?=
 =?utf-8?B?ZG5EdjVvNVBWQ3BTT2cwNUtjODl1eElDR0Y3dEYvZDR5dWg2aXgyd1RZNTlM?=
 =?utf-8?B?YjhzUC8vdjVMektEdmx2Mk1hdDlmZm91dkdYelRMdVFqMlczUzgxQ1ZnSWov?=
 =?utf-8?B?QktPNmY3SVFyY2VQUTJ3bmwvZDNDZHFWaVFPSjI4STRFS1RjL1pPV21IVW5p?=
 =?utf-8?B?QTU5VUhHNFljVVY5dWVGckx2VU5neCtlUkVHQko2ZkgveWk2aERuSWZtSVVG?=
 =?utf-8?B?WHc4Qk1Lb1hHWDR1M3l0SXhEbzFidHhKdDdDWVRhNkZTYkVodk51d2c0Nmg2?=
 =?utf-8?B?Z1VweWZsdlRNeXJMQXBDL3EwNHVMUGR2SDZBSktGWWVRM3lvRXJLcVRxVHZK?=
 =?utf-8?B?d0tHSU1CREdrcllpMUd6WTlHUXVxdm1XRjVLRTJGWVI2aW5sTjRSTGV1Q253?=
 =?utf-8?B?TDF1T0ovTW9QQVVzSkpKUk51azN0UkJFWG5lMGQ0amVSK1pLcUpBZjcvOXhT?=
 =?utf-8?B?ZHNUM0hFQ1d5UzNITXBhTGdhaHlRbWpqckY5MUtEVDJ3L1hWQnM0QVZMOU51?=
 =?utf-8?B?UUcxTzBocUl6bENHRnpQOE5qU0VBbWNWSW1WM1ZPOHJ3SkRkZVpablg5L3pF?=
 =?utf-8?B?cFFYNkorZU9VUkNTWkVvajRaa01PVTJFRG5vd3JyR21xb1dlOStiN2VSbWJJ?=
 =?utf-8?B?bGhjbnZLeXJLVVBpdjhrNzB3SDJPNWhBU0xVVVJMaDh2WHNxQWxrN3kzUzlU?=
 =?utf-8?B?K0tMY1BWUVNEcksvL21kR0JScXZweGRDTzcvd055NlpzZlJ6Sk91UTcrUmhZ?=
 =?utf-8?B?ZWtZKzczNGJ0SG5IV2pNUnp3aVFPZE52RjVEWWRQTGlOcE5XVWFPUEZhcE10?=
 =?utf-8?B?K3B1a3ZqblpIS0F2bDRTeHJtYllSSzloQllwRWZpNEJ2bVYxMlV5ZkdtUDIv?=
 =?utf-8?B?Q3FRSHRRR3Q4YU1OZitQWS9ISmdOYUFRcVNOa244YnAwUlV3eFozVm9FSzcx?=
 =?utf-8?B?d0tzNnJQcEVpNytBc2twYkx3U25TdkJxUmlwTE9yU0UwbEJqNDJyNXpEMUYw?=
 =?utf-8?B?QmJ5bGxzWUZLT3J2Ni9WaDM1dncyeHdPb2ZiT0ZwN21tUEJBdVg2Vk1nTXQ4?=
 =?utf-8?B?M2hNRkNKdUtZelpNa1daa1BWamwxbTBQRURyOXRMbk1hWHdOZTYxc0FMNU1j?=
 =?utf-8?B?OU9ObWNEeVQ0eTZzRFRoOGdvUmwzRjVtVDBqUnhXNHBSSDVkVHlnTnBmVHE4?=
 =?utf-8?B?MXNxZkdKMmdyWEs3SEhYZ0JoQW5wNWpsSy9zRFkxSnFKZWxLWlJtUVNyK2VY?=
 =?utf-8?Q?2LScejPPclgfkwTu/KjnhdbYsPJsuDu+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGRQMkIvVWk3a3NOKys2b0tLTjNzaVpDbUlEdUJ2akVUU3hHRmFSWE9STkNX?=
 =?utf-8?B?VWpWS1lQTFNyVVliK3daeHFwc1R1NnpTVCttMkptOHRxRSs0UXZScHoycU0w?=
 =?utf-8?B?USszY2IzZjhUOFcvUVNTeU8xTFRrTjdHTEQwQXpQYXlRNXVVaFFSd2Ivd1Bs?=
 =?utf-8?B?bnZGUVV1OHJXeUlyK2pwSHVkcXB1OXZhZGFRQ2hubW51MjBLMUhvTW8rUy9L?=
 =?utf-8?B?SldIT1Y5dWFvWnlRWEFsU0djSFY5SzNwMUM0QzVUekFrUVJXT01xajF3OHY0?=
 =?utf-8?B?NTJuK3pRMExmdEI5SGdhMDE1dVRwRnI5eUxNR1hUTEY0VmFqSzlBL3JKSCt2?=
 =?utf-8?B?SFFXMFZoZVl3eG9qc2REV0ExazhnenE3aXhRWC9JbU8vUVUzMFY5eFlkUDZE?=
 =?utf-8?B?ZW80M2dWOWdKY2xGNFVuS0kwVnJ2WG53WDNLRDlxWFVUbXdmbW5NUlJYekdK?=
 =?utf-8?B?TkVDbFBQaHhOcVNhYUVWSm1QeVhGdnpwcXdrN1N1ZHFGcjB3UWZTcXJMck9C?=
 =?utf-8?B?RlFiWVJSOGhPV2UyTEMrV25McS8reVhsVmtXb29ORWZudEtUaVVYQk9DNWF0?=
 =?utf-8?B?dTRlUTVJVE1ZNWptd2RiakovZExWRmxEU3EyN0grdTZiSW4zMFkzQks5MXky?=
 =?utf-8?B?b2RKZXJhSi9xTjhKZEw0SGIrNEtzeXdrc3orVk56Z2srTG5zdnZ5U3NlVGxG?=
 =?utf-8?B?T2xJcW5uRWY0THN4bnBCMEYzZzhsSitZek5ObWpZWWVoS0xrMERpSENCM2ZR?=
 =?utf-8?B?NDgxQjVKMEVveGVjdVZqa2VURE5NTlR2Qm9hS1lSWXlHS3Y2cGhpL25IOFlr?=
 =?utf-8?B?SmFQYkkyVUVVZndCTTRLWWxjaTJwdHBpaSsvQ0tyc3JaOER0alV6bXhlcFE1?=
 =?utf-8?B?RWlIVWhTS2VQajR2SWVMU1VjK0JyYm9meTY1SEk2b3IyQmFmK0ljWXFYb2w4?=
 =?utf-8?B?Wnl5djZBRmNaODcwOU1QNFNDRXFqcnJ5N2VBQjdhenc3dzM0dlljUCtkWkwv?=
 =?utf-8?B?TmE2WmI2Ny94Tis5NDdUT3ZtOXR4eHpjcW42VXJYMVV1RlhKTkczM3UreEJ4?=
 =?utf-8?B?N0dmWXRseUZZUVUrWVZMVFBtTDhKQS91VktCVDlZVFYzK0hEMFVmWXZRK041?=
 =?utf-8?B?dnBGQjNoK0tmZGFocGFRVlhqVUhUeFNnT214Yk5GQldxemZvYUxZdkFoY3RY?=
 =?utf-8?B?R0pMT1RtVkliU1RsaDlwWm15WkN0bC81TzFsWXFPL2pwWTFTTlJvQ1EyaENI?=
 =?utf-8?B?NkZxZUpBdDEvSFk0TmZoS1VxZnlBK3luT2N1RHJJZldxMk5VZVpscUlVb1c1?=
 =?utf-8?B?UVpROU1vSUdRQ213bFpPV2Y3NlVDNWFmYS9uWTRON2t0aWoxTWRKWEhkL2o0?=
 =?utf-8?B?bTV5SG1iNEI3T1hJVEpTNFFjcDJYemRKRWdpendxYzdYWldOMy95ajI2M0xk?=
 =?utf-8?B?ejV4R04wQnMwSFAvTEVUWFpGZ3UreDFHN01XMUV6aGMzaHVLeXlwZ2lGTVJk?=
 =?utf-8?B?c1BRaFRWSmdVMU1pNHVPT2NkZ1pEU1NZMUc1Z2xXZ2UvU1hHSm5BZzhwK0NL?=
 =?utf-8?B?bGV1TmNTUFA5ZDk1UFVhZGcydnF0OTV4Vy94RUw3R0xNT3ZKNU1BRFVrZTU3?=
 =?utf-8?B?dHh3UHRiMGwyVFNVTFBXTlduUWZrZzR6eWRYMGMxSHZ3SG1PYWI2cXNoU2FT?=
 =?utf-8?B?UDNUcjVxR0pCeEdVbDFrZWhUY2Y0R2RDU1pQcldnRUhUVFpNYjNDSzdidEpV?=
 =?utf-8?B?aS90L3h2UEVXeTNwZktBaWFsVlVTZHhINE5tc0VuSi9EWDh0b3Bta2NCUSs5?=
 =?utf-8?B?NnJkN1FERzBXdEo0YXlEOGx6NGlnaStsRmwzMUJWQVFRTVM3NFBLazNhMTlO?=
 =?utf-8?B?Ui96WUZDY0wrTUtNTjcyaGcxV1BuWkl1eEpPYmtFS2lFeGlNNmJqa1Q5TEhl?=
 =?utf-8?B?QjMvQ3B2Z3lOcGtSbk9CYUw2ZUlrem9hYTJ0V2VzTDNqbnBBT0JSbVJaVWZQ?=
 =?utf-8?B?Sk5ic2NkRVpCcGlnc09MWDY5YjA3WWdmdUtkUGxuTy9OZDRtT2pULyt2b1hr?=
 =?utf-8?B?dTJPaWhXb2xna3FrSnE0bHVDUDZraG1zQlM1WmRDVXVpa0V1ZVlLOHFYanls?=
 =?utf-8?Q?bHqzlCE1JzR/Y2GtrWrfUKJbs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64f2171-ac5c-44df-57c4-08ddfc6089b8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 18:22:51.6324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ONY1ODM818o/K6hHnb2yIKTzTcfouxuk02relsmWMcFEabeI/GkNpCrafugJecmFo3iBBxkb9Et0i41ZB6O/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFFA661D690
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



On 2025-09-25 04:11, Pekka Paalanen wrote:
> On Tue, 23 Sep 2025 11:41:24 -0600
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> On 9/23/25 10:16, Alex Hung wrote:
>>>
>>>
>>> On 9/23/25 01:59, Pekka Paalanen wrote:
>>>> On Mon, 22 Sep 2025 21:16:45 -0600
>>>> Alex Hung <alex.hung@amd.com> wrote:
>>>>   
>>>>> On 9/18/25 02:40, Pekka Paalanen wrote:
> 
> ...
> 
>>>> The problem is that "H.273 TransferCharacteristics code point 13" a.k.a
>>>> the sRGB curve means different things for different people (two-piece
>>>> vs. power-2.2).
>>>>
>>>> The difference is minor but visible, and therefore I would not make
>>>> two-piece and power-2.2 equivalent nor have one approximated by the
>>>> other.
>>>>
>>>> They both need their own entries in the enum. Let's leave any decision
>>>> about whether substituting one for the other is ok to the userspace.
>>>>   
>>>>>             */
>>>>>            DRM_COLOROP_1D_CURVE_SRGB_EOTF,
>>>>>
>>>>>
>>>>> It is also possible to add GAMMA 2.2 in addition to sRGB piece-wise
>>>>> EOTF. But if I understand correctly, DRM_COLOROP_1D_CURVE_SRGB_EOTF may
>>>>> not be used at all, right?
>>>>
>>>> If hardware implements the two-piece curve, then there is reason to
>>>> expose it, especially when it does not implement power-2.2. Userspace
>>>> can choose to use it as an approximation when that is appropriate.
>>>>
>>>>
>>>> Thanks,
>>>> pq
>>>>   
>>>
>>> Does the following diff make sense?
> 
> Yes.
> 
> 
>>>
>>> 1. Change "sRGB EOTF" -> "Piece-wise EOTF"

I think simply naming it "Piece-wise EOTF" is problematic
as it doesn't say anything about the curve. It's one of
the curves that are used for sRGB (the other being the
gamma/power 2.2 curve). I'd suggest we keep sRGB in the
name.

Otherwise I agree with advertising both the piece-wise
sRGB curve, as well as the Gamma (or Power) 2.2 curve.

A mathematical description of the curves would be good
but not a blocker to merge this, IMO.

Harry

>>> 2. Add "Gamma 2.2"
>>>
>>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
>>> index e1b2b446faf2..823e39b8f3fe 100644
>>> --- a/drivers/gpu/drm/drm_colorop.c
>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>> @@ -71,12 +71,13 @@ static const struct drm_prop_enum_list
>>> drm_colorop_type_enum_list[] = {
>>>    };
>>>
>>>    static const char * const colorop_curve_1d_type_names[] = {
>>> -    [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
>>> +    [DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "Piece-wise EOTF",
>>>        [DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
>>>        [DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
>>>        [DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>>>        [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
>>>        [DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
>>> +    [DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
> 
> If I wanted to really nitpick, I'd propose "Power 2.2" instead of
> "Gamma 2.2", but I suppose it's clear anyway. And Wayland already went
> with GAMMA22.
> 
>>>    };
>>>
>>>    static const struct drm_prop_enum_list
>>> drm_colorop_lut1d_interpolation_list[] = {
>>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>>> index 3e70f66940e0..3428a27cd9ad 100644
>>> --- a/include/drm/drm_colorop.h
>>> +++ b/include/drm/drm_colorop.hsRGB EOTF
>>> @@ -43,12 +43,9 @@ enum drm_colorop_curve_1d_type {
>>>        /**
>>>         * @DRM_COLOROP_1D_CURVE_SRGB_EOTF:
>>>         *
>>> -     * enum string "sRGB EOTF"
>>> +     * enum string "Piece-wise EOTF"
>>>         *
>>> -     * sRGB piece-wise electro-optical transfer function. Transfer
>>> -     * characteristics as defined by IEC 61966-2-1 sRGB. Equivalent
>>> -     * to H.273 TransferCharacteristics code point 13 with
>>> -     * MatrixCoefficients set to 0.
>>> +     * sRGB piece-wise electro-optical transfer function.
>>>         */
>>>        DRM_COLOROP_1D_CURVE_SRGB_EOTF,
>>>
>>> @@ -108,6 +105,16 @@ enum drm_colorop_curve_1d_type {
>>>         */
>>>        DRM_COLOROP_1D_CURVE_BT2020_OETF,
>>>
>>> +    /**
>>> +     * @DRM_COLOROP_1D_CURVE_GAMMA22:
>>> +     *
>>> +     * enum string "Gamma 2.2"
>>> +     *
>>> +     * A gamma 2.2 power function. This applies a power curve with
>>> +     * gamma value of 2.2 to the input values.
> 
> I'd prefer "exponent" rather than "gamma value" to be more explicit.
> Just in case. There is quite some confusion around the term "gamma".
> I've used to call this function a "pure power-low with exponent 2.2" to
> explain that there are no offsets or multipliers or anything else.
> 
> For documentation it would best to write down the mathematical formula
> rather than describe it in words. I understand that may be problematic
> in kerneldoc, and we didn't do it in Wayland XML either but in a
> proposed Gitlab-Markdown appendix.
> 
> 
>>> +     */
>>> +    DRM_COLOROP_1D_CURVE_GAMMA22,
>>> +
>>>        /**
>>>         * @DRM_COLOROP_1D_CURVE_COUNT:
>>>         *
>>>    
>>
>> Both DRM_COLOROP_1D_CURVE_SRGB_EOTF and DRM_COLOROP_1D_CURVE_GAMMA22 are
>> defined and it should be clear that sRGB EOTF are piece-wise TF and
>> Gamma 2.2 is for power 2.2. Is it still a concern of using "sRGB" for as
>> the original patch?
> 
> Not enough of a concern for me to continue nagging about it. :-)
> 
>> More precisely, adding DRM_COLOROP_1D_CURVE_GAMMA22 with "Gamma 2.2"
>> string without touching "sRGB EOTF" should be sufficient. If a userspace
>> need to choose one or another it can precisely do so.
>>
> 
> As long as everyone reads the documentation, and the documentation is
> clear. I failed at clarity in Wayland, so I'm perhaps a bit paranoid
> here.
> 
> 
> Thanks,
> pq

