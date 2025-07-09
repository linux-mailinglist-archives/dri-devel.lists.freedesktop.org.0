Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84414AFDEEC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 06:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239A610E285;
	Wed,  9 Jul 2025 04:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0x67JjBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E110E1EF;
 Wed,  9 Jul 2025 04:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adliqVaTSpxDzQzdC5+fmY4r0aFoB5XpmHCJPxJY1EVCHUpwUlgYx0aSAvBlAjAu2y4ejrzhZTe8dgSZg73uh7IpNOVKZlZnRDNbam0SSJdyzl7W/FZCuyswHdgtUuod6kYsUZRznzEwe+kS1U7zrggQVj7R1uoPb7ugX1unriwcy0bKzpak5d643phErOnh87dfbcWqb3WiKfgqA7mKVFO5zbS3ZYxAGTpg8x8yA7/icERoz2+gQ9pTtj6gkLvu/3U7/CiFFopxXC7SqK+PCvAEbCcOkaMxk6VyxkjtP8pcPz/Twu+PJ7NWIQEmSzPS3tIANbgNm9X6LmaHOXUrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oci6RhUkUA+eZa0mFIVsBbRhudreDetlyO06q3zGi/4=;
 b=zH/P9MlA+BdYtA4ZSxK70cPpnaum+4wwVN5AKVR3N18BkUznN+YbNwC2D+Kao1imAtJ+szD8FclYe1zKAMPHwBaixsTJbPC7NJyn8r34x1rtwY5VNnmktn/G0gxTkNG9o55AULEaPJGzYBMEUVzK9Bl2PCplZuNcTcKe4uUJ/9MAPvR6gZJuGZ9ps3lxiBOjNzzo8oZSvu2DlS+NEv56Sgb0vGyp6fi5VLzsJ2GyHC7V/znoErgFLQKcmFeF5S2FYlEHHpdXMu5JffLkSlpCEU5urvJzWUHBq46JtUFWPUG0T/+UiiuN1s4FXpySy2rMe+yC8w9lbRdC4uVqeCCDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oci6RhUkUA+eZa0mFIVsBbRhudreDetlyO06q3zGi/4=;
 b=0x67JjBi9DCnjgoifUYpEVg23Vi8INcM8uc/5yTCBldbk1nKKzMYsF04VFXFEPHp50eiOEsFXFWF3Eig86btG/8u5/vYj/wyxT0DqxYVLTIUugSX/y9fPD1boOLKw+WSB/s6Yuhf5c4kFWUlKhyrFmzwQzUTw2wHBHkESiyeBE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 LV8PR12MB9691.namprd12.prod.outlook.com (2603:10b6:408:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 04:56:19 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8880.023; Wed, 9 Jul 2025
 04:56:18 +0000
Message-ID: <5878b6eb-7961-4ffb-aebd-601868163de6@amd.com>
Date: Wed, 9 Jul 2025 10:26:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "McRae, Geoffrey" <Geoffrey.McRae@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
 <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
 <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
 <BL1PR12MB5144018C868ED8C6566B8B84F74EA@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <BL1PR12MB5144018C868ED8C6566B8B84F74EA@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0053.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::7) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|LV8PR12MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: c778c3a9-f8a1-45bf-81e9-08ddbea4f0fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTlBenp2Wk9OWFR1Z2dvWWtLaG0rckFIUlA4d1lGN2IxZnQvdzlMY1BFbDFQ?=
 =?utf-8?B?VWNlcnFRbncxL1ozbkdmREdYRFVzOVBxc2hmSUhrMWdva1RaUUpwN0d3OGV2?=
 =?utf-8?B?MjA2MmwycklUNk96M1NGYzQ4aUFDem5Wa0FySnhLS1dqRWcwOGRGYmVHS2FG?=
 =?utf-8?B?dUdUZVA2SnhTdGlYM0dhOWhacUpaUm1ZeTNsRTdpU3liQzNJMHR3SFB0NVdv?=
 =?utf-8?B?WUF0eXJyb0ZLT3Viczl3VGxiUEhXaUpNS1VTelhKbnJiQlFUWmpEYUk4MUJ6?=
 =?utf-8?B?TENrbXI0dXlIczlBS05YZVFYSzQzejE0aDAzU1poMVdWbWIvalBISjVXMTVV?=
 =?utf-8?B?ZzN6TzRCaERqT1RualpScjUyMnoyajV4VlE5d3Z0WmFzb0xuRGlOVmEyYWNk?=
 =?utf-8?B?TVk0Q2MyV0lHTEViWVUyS010aC9VRlpOMXAvMk01anJRK1JNZm8zbGE4VkQ2?=
 =?utf-8?B?Y0NkSVBrSVd2QXNwUWk2OVA2c0poTksySHgrbDB0Ni93ekhNUHc4d3AzbmRI?=
 =?utf-8?B?VllDTERUWTdkTVRlSDN4Wm5iMk43R2l5Wmh6cDJzWVVuUlBlcW5uR2hKWTJ0?=
 =?utf-8?B?b3Z6THl0eFgrK09nRkk2UmhJSnlISVQycU54OWhyc1ZOOGU3STdDc1JVSUlh?=
 =?utf-8?B?UU42bWRXcGNGR3JkcTh4ajRucXZhTWdlcTRRSk5lVnlUNGJYYThUeENrLzhs?=
 =?utf-8?B?NGJUMUZmKzBBaUFvUy93SVhyeThIZkFYdXBxSDk1STdHcEp2MW11a1d1cjhy?=
 =?utf-8?B?aWc5anlIMk5PR3A5N0FUL0ZhbUxNVzhNVnh3UFpvVXZSVEVicjZpL2VWRWE0?=
 =?utf-8?B?dEsyTk9Ka2o1UkYxck9DSXEzV3hJUWsxT1BNOVlnamp6M01LSDB5cFdMczc5?=
 =?utf-8?B?T2VIeWJEN3ZVVWVBQ080UmZsNWtZcjdDM2RRV2JlZi9GL3ZmOXNhQ1VNRHht?=
 =?utf-8?B?U2RzSmYxdjdZQTczbnFKMEhPY09Da205eUQvVUZvSEQxblRVenNJWFlXLzlk?=
 =?utf-8?B?Z01tNHhtblBFdGt1UlFad1p5M01kUkttcVdMY2JTNlJYSWI0UVhXSTBwS0JX?=
 =?utf-8?B?RFE4YXl2R29ReW5yREE5bHpNS3RtZWhRbnVxMTJQTStRWkRBbmRSaUhNeEtH?=
 =?utf-8?B?dzd6SkZxZ3czZXpaWkU1NGthNmpPUCtjNkVGTlcydjNlQ0d3MHVjMzBpUkg2?=
 =?utf-8?B?VWxERm9aRGk0aWpTN0lnS1hqV1U0cUxkK1FCS0tTcjFHS0NkVHJsdUIzaXpj?=
 =?utf-8?B?Z0J3dWNxUGRSeUNlYUZMNHJnME05d3hrcGN2YzB3dkFhTEp3My9BWFpYK3dY?=
 =?utf-8?B?UmFzT0VvWmN0ZUlnczFwdmlhRkdKNXRzSzNtQlYyVEp6OHFKaDZFV0lXZ1Bk?=
 =?utf-8?B?eDdUMUJmSEM5R29nYTZSenhyQ3hBREJmc2NaZDdRQVdFOXN1dkpVcy9mbURN?=
 =?utf-8?B?RFpkV0VVT2x6MkhvYmRjT1JKdGU3am5xdTBRNU9td0M4ZElQek1xN1k1enRB?=
 =?utf-8?B?YjJhYVhNSDN1QnFBRzRqRURsN3JaOWx0bEdIMEJTUHg2ZE1ISkNlbkxzRGRF?=
 =?utf-8?B?U0Z5U0ZJaVJudzlIaDQ2UXVOK3Z1L0pucEZZWlFnQ3o4M0pZL3lub2lEZ3k5?=
 =?utf-8?B?czRGdUxaTUM3UnA3YjBuTXRnRkppTGtqQTFGSisyN3NkTUZPWmhsMXU1L0M1?=
 =?utf-8?B?T2Qzb2J4MGxycEFucVhoQiszQ2RIckxBN2lGWHlLMGJVTmo3UStmZHJ0TUJn?=
 =?utf-8?B?NGFXc1FKaDMvemVEVU14MTZFNm54eGl5YnFjSi9BMlo3dlhuT1kxaHlLN2lH?=
 =?utf-8?Q?dN7dLFQQzxFKkXIBEST1Ix/4u+4fqSdxCHsyI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YSttVVJJUmFxQzRpWkRqRXErbjZJaFQ4d2RhcnFNYjVTc0tlNnNSTHZBZW5h?=
 =?utf-8?B?OFdodS9EanpocGJuK3JGTmFWYVZwVFRma2ZlQzErMWZnYWdhZDQ5MStnRCtn?=
 =?utf-8?B?NGRxc3E2Z0gxTlhVd1Q5VVpBd0tnS1JKdk9UNzR2Qkdad0NSdktRUzBCVlhT?=
 =?utf-8?B?cHU3R3VDWmFnTnQ5UHB2QjZwVUhBZHY4L0ZPN3dQUVhEUksvWFc5QitDME1D?=
 =?utf-8?B?U245UkllL1pNZldZdnNCbHBDMWh2VDVJcFovd1hLbm1vdlhCQVUyaDFjYS9t?=
 =?utf-8?B?Ym14L2ZWTmhGcUVzaXczT1ozeGFYcmVQQVpGeDlSelhyeWl4UWxiNHc3emJF?=
 =?utf-8?B?YkdMK3hQUzFFRUVLdUFTVnh3NkRvalhraUpObHRYREJqSDVidXUrOENaYVhu?=
 =?utf-8?B?MXhMYjB6TnlET0dRd05oZXRSOGFpUFY4Q1pVd3JXeVRNRGgvK3VGK1hVYXl0?=
 =?utf-8?B?b2s2Rk5GREdGdXQxc2tUcWg5RXQ2WmlGaTczaDV4eGNNRWhCZC9HWTBzclhQ?=
 =?utf-8?B?ZDRDVlcyc0UyRkNCKy9DTGFYR0Fyd25Ua0dTWXNqTVExUzBLTlRRNk92eExu?=
 =?utf-8?B?dE0rYmszM2ZmTi9sUUFDY00wSlNwWEMwNXFISjI4WWpEZ05FQUFDVEJjTXVl?=
 =?utf-8?B?RGhrZWUvS2tpdjdtVGRIcEJUa0ZZK2hCeGtaN1gyU2xmUFFzbFo5WjNSTzg0?=
 =?utf-8?B?VXBNSEdrTW1GT2UxVGVDcFpYckVjUXlSdUtROVRIVlliYVQxaTBIV2FUOFQx?=
 =?utf-8?B?Q09OSWNsOEhhamQ1N256YnQ0elUwa2VWRXByTmViUlNsN2Jzay9QNk1Demd4?=
 =?utf-8?B?SHl2Vk5RUEJSNGREK21sbXdNdXVnR3dpSEJtRFNXQk5pOVM3VkRtUU9TcTJX?=
 =?utf-8?B?TXhoZ3JkTUM5Q1QwQTRBVVJNc1dWbGxCT0hrb3RzSVVwS0hHclk5RGFJd0Zv?=
 =?utf-8?B?T3ZVYkJFQ09UUG9xVDlQZWsxdUZXWmpyMS8rT2lSOGpjSUNWYVMvRWdMY0dI?=
 =?utf-8?B?SnoxdDBsT0kwSEtSeWREU1A0V1RQWVZIUnBQb1RPelU4RWtaRHVzUUN0WFAr?=
 =?utf-8?B?dEN6NlRDbGYzMHQ4VU5PbzhNdW5MTjBEQ1NZMFRNc0R1bVRMVUFSZVM3aW83?=
 =?utf-8?B?a3FPQitJMHliSlhsdGd1SnRyNEUwUE00eExXRkdCdElrK1JzTTVUdzZwTS9F?=
 =?utf-8?B?MUdVNStVV3dIV0RGZ1U3cStYZ0JnS0Y2dldHQ0w0WWFaOHl1c3RjaHNPeVVT?=
 =?utf-8?B?YUVoZERzZkt2UUpuUEdTMk0rSVhMMCt4eThOZWhEeU9FYkRUZXI5eHI3QkdZ?=
 =?utf-8?B?cTIvUy9VQlBrZDZmSVFuZlc4aEhkcWJYdm91UC9ZbmV0M2NXL0h4MC9TR01z?=
 =?utf-8?B?YXpVdnNCZUZ2QktPdnoxNGNiVXJvampYTXplaEZ1RGdDaGpkZEpzUHVFYkVE?=
 =?utf-8?B?SVhnRGIyN2ZPc1RZU1hkaGYyOElTMk9kTHV6WVZvbWFCMnpFVGFjZkRXTis0?=
 =?utf-8?B?a1BrT2NRbjBHeHg3MnJqTDRzOE1va1VTN2tzMVRNbnk3TmtQNGZxa3FxR3lL?=
 =?utf-8?B?MGtvUTV0MUpvTnlvbHpJRVUrQldvejlLUTlFUEFNUk1hQ1NqWTZHNDZzQXhj?=
 =?utf-8?B?TEYwdEpPWCthcmEwWU1ZazNSUzJQZDlrR3pNS3VNZUNkQ3pQTVNycmNDMWs0?=
 =?utf-8?B?QUN4RnRLa3kydUxYMDJpcUNieGtLL29iUDVOQmY3WWl4eklGVjZYQkNUQ0ZZ?=
 =?utf-8?B?WmwvdmtxUnN4VUlleW9OMkkyVUNYL0FmTnNwbEJ6enQ5MlphQWZwYjBHVnds?=
 =?utf-8?B?WUpLblVoTHRpRi9sSWpqUEVCRGc5UFU2TWV4VGpoNzJYZU9YTHdRbjhXT3R6?=
 =?utf-8?B?Ulp4bzBUME9FNTNocFp3Y2VuUVRUZ1NrMXlNai9HeWFEL3VsM1I5SWxIeFNp?=
 =?utf-8?B?OVdFUE5HR1FwcmovS3ZrejFhaVpjU3F3ZjlpRWVCZWdiUm1GUmVSQjRpbE5D?=
 =?utf-8?B?Qi9nTXQ2T2tSMFZaSU9jQ2tUbjh4TGxaQUMvTG9RWk1sUkZ1Qmc0OW5EUG1Q?=
 =?utf-8?B?Wk9yWTNSVEoxTWdNN3JUMStaOGtldWlnZzNRQzk5VGh5UzNvN2JveWFnMWMx?=
 =?utf-8?Q?36zdmspcq6kIx5b49rlXwmawh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c778c3a9-f8a1-45bf-81e9-08ddbea4f0fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 04:56:18.8212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZUlyLZDky7LBFSSg4E/e5XglCqkdPv5+xKUxM1/0NaxQmWG/6/gld+G/SXn+Jhl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9691
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

On 7/8/2025 8:40 PM, Deucher, Alexander wrote:
> [Public]
> 
> 
> I seem to recall -ENOTSUPP being frowned upon for IOCTLs.
> 
> 
Going by documentation -
https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html

EOPNOTSUPP:
Feature (like PRIME, modesetting, GEM) is not supported by the driver.

"Note that ENOTTY has the slightly unintuitive meaning of “this IOCTL
does not exist”, and is used exactly as such in DRM"
 
Since KFD ioctls could eventually be supported in drm node, it seems
better to go with ENOTTY.

Thanks,
Lijo

> 
> Alex
> 
>  
> 
> *From:*McRae, Geoffrey <Geoffrey.McRae@amd.com>
> *Sent:* Tuesday, July 8, 2025 5:13 AM
> *To:* Koenig, Christian <Christian.Koenig@amd.com>; Kuehling, Felix
> <Felix.Kuehling@amd.com>
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported
> IOCTLs
> 
>  
> 
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>  
> 
> I am happy to use EOPNOTSUPP but I must point out that this is not the
> pattern used across the kernel, the standard is to use ENOTTY, which is
> also the default that fs/ioctl.c returns when no handler is present.
> Userspace tooling such as strace and glibc specifically expectect ENOTTY
> to indicate invalid or unsupported IOCTL.
> 
> ------------------------------------------------------------------------
> 
> *From:*Koenig, Christian <Christian.Koenig@amd.com
> <mailto:Christian.Koenig@amd.com>>
> *Sent:* Tuesday, 8 July 2025 5:01 PM
> *To:* McRae, Geoffrey <Geoffrey.McRae@amd.com
> <mailto:Geoffrey.McRae@amd.com>>; Kuehling, Felix
> <Felix.Kuehling@amd.com <mailto:Felix.Kuehling@amd.com>>
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com
> <mailto:Alexander.Deucher@amd.com>>; amd-gfx@lists.freedesktop.org
> <mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org
> <mailto:amd-gfx@lists.freedesktop.org>>; dri-devel@lists.freedesktop.org
> <mailto:dri-devel@lists.freedesktop.org> <dri-
> devel@lists.freedesktop.org <mailto:dri-devel@lists.freedesktop.org>>
> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported
> IOCTLs
> 
>  
> 
> On 08.07.25 06:22, Geoffrey McRae wrote:
>> Some kfd ioctls may not be available depending on the kernel version the
>> user is running, as such we need to report -ENOTTY so userland can
>> determine the cause of the ioctl failure.
> 
> In general sounds like a good idea, but ENOTTY is potentially a bit
> misleading.
> 
> We usually use EOPNOTSUPP for that even if its not the original meaning
> of that error code.
> 
> Regards,
> Christian.
> 
>> 
>> Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com <mailto:geoffrey.mcrae@amd.com>>
>> ---
>>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index a2149afa5803..36396b7318e7 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>>        int retcode = -EINVAL;
>>        bool ptrace_attached = false;
>>  
>> -     if (nr >= AMDKFD_CORE_IOCTL_COUNT)
>> +     if (nr >= AMDKFD_CORE_IOCTL_COUNT) {
>> +             retcode = -ENOTTY;
>>                goto err_i1;
>> +     }
>>  
>>        if ((nr >= AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
>>                u32 amdkfd_size;
>> @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>>                        asize = amdkfd_size;
>>  
>>                cmd = ioctl->cmd;
>> -     } else
>> +     } else {
>> +             retcode = -ENOTTY;
>>                goto err_i1;
>> +     }
>>  
>>        dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr, arg);
>>  
> 

