Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D8AC9804A
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF3E10E06B;
	Mon,  1 Dec 2025 15:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4t3W+wOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1112E10E027;
 Mon,  1 Dec 2025 15:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWaljll/bbnerdZv5/7XcCf07/sPmF90vX5FhkJ+5+JpqWZdPt/VYSAC8yb+rxWC+qZNKucowiHADD8NOo7dI+HLnA3tvuUOcR3g5P5wfyyTB35TX2RRSBDhWEt9cBDWseLSjoAbENT+YRYTV5vnKz0lGJuUZma4iH4aedR90UbeAapfZJKNb6lIOrPUEnyYsK2V9hOuWv7f6mqi27AYgaW5nSYdGHZzhcBvyOWwm1bPVDq1PhzxEes84tFpIn/kdiln9p6tZ3U+ddb/A+1J9Rsib3xenK3caQXWmagFCRwNo1IrhEP7d1PRBwPY6WYm0CnBeBKHnkfrKwV9OnKFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whZKASbc99CQXbbJjIq8vK2md+w4vEY3A/cg3RVV5PA=;
 b=J6ow5ghYk0CJ7xAN0hlafoj1BPdrHWUV7MoEnArBp0b1qZOb30LNFZ3dUZ0BY0/q1Xx6TaPYnFDYziHwYhIyJd8WuXEq4eK+xnA4yI3+XlVN7/YSpFluWB1CsPwVpvKuDGjba3H2OqGdc4x1LVtx8H3B8MJ8j9gIwYH5eL+TI1WwCtLnFcizn71CibkLTUstPOipUL2P+qrTOPaBk9IxHmSco+aXcYlF2NdYpbzjzAS543udSfBG+bpua0PWo0yq6LJ504gVluOCj8bEpGtZNZAXo89cqxzcSWMo2JHTOC4+AsXaLHBwpDrI5XU/K+n7KC3yED/AHr5YCkAjTIMPMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whZKASbc99CQXbbJjIq8vK2md+w4vEY3A/cg3RVV5PA=;
 b=4t3W+wOcWCo7XBoEfHH6mKaXEYb96kz4NPvr9gxxzOwRij+l3WLgyACVMwjy3G3JRAV1skPHveS2ypm5hSTkG5Ev7qDcKvOqNnp9W9ZfCMYb3sECJOoy0OeJvGVEXsAnzyHT3LBJ3n5+EBubf+zyUcGQDwTB5v3b2QgwmvZtezQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6129.namprd12.prod.outlook.com (2603:10b6:930:27::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:20:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:20:32 +0000
Message-ID: <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
Date: Mon, 1 Dec 2025 16:20:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
To: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7332b1-0a2f-4135-888f-08de30ed2afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ykw4Vng2YTNxdWxuNUZSU2tTN25kQ2svMTdTUXNxL2pwQnpBMk5qQWZLQURv?=
 =?utf-8?B?NjN1RnFnbmJqakRVclJ2ZHBtL1dEdGgxcGlHQ2ZMc0tNZk4xWTVaanh0K240?=
 =?utf-8?B?azhLbmo2RSt5RG1obUlaYVZ1Zm1YcklnRXlxZjNqRzY1WHgzeHFPSHJtVzdQ?=
 =?utf-8?B?SkdaSFNVbnNIL1ZhRWZmK0pKUi9uNXJFSEhsdTFYdHY0bktzMjZxelFJUGVU?=
 =?utf-8?B?NHZwWTVadFMzV08vZVNidmpBSGZEQjB6WkszT0JjaUk1ZTNmZVR0a0ExR3ox?=
 =?utf-8?B?eSsyRlNFaE90aU91NXhHODZFdGprdjBycXcwczJQOUhpNEx3ZURIMVd5OHE4?=
 =?utf-8?B?emtNRUhQK05ZaWY3c0c5Ym12SlFib3N6cE8wZnNmaExyU3hhaXdkK2h2VEZz?=
 =?utf-8?B?blo4Tk1IZnF1OG5MYTM1NTYrK21MQTVnOUs0akxlak03b0tQZDJtVlByU3FK?=
 =?utf-8?B?d3l5RnBUZHB0bHphbGJJTWdRKzNDckRlRFhUMGlPRjNDYlM2SVpWWDlCOCtJ?=
 =?utf-8?B?eFEzTVQyVXhtQVVrMnJtWDI0TkdvbVB1UVRKR0ZGcDdGZlk0Q3JJdlVCd2Ro?=
 =?utf-8?B?NWx0QWoxZ2E1NGFwMlBRMlRFZFFMbmo4NG5pRDQzdzB3d2NUdXVMMGVUL1pX?=
 =?utf-8?B?dWp3dmxIUDA4QTQzckl3S0N3RlBYVEhwWHBxUlM5TmozVzR6ai9kM3hzS2Rh?=
 =?utf-8?B?Z2NJbGQ0ekVLZnVsWEt2TDRhQ1NmdFovY053NHpkR000WGdHaTYrMGxSdlVu?=
 =?utf-8?B?Wmhld3RpS3dXQ0tWVDFuTWNta3oveUc1ZDJpdFdWZjVvRVg4YnhNdGFnTXBV?=
 =?utf-8?B?RitKU2k2TG5YMkUvek5qUUh4L0NrOEd0VTFTYXRtN21WSm5UVmNjZnVQMWhk?=
 =?utf-8?B?TG8reXJsS3VwUFI2RHJQZU9NWXJxc2M3dlFtMHhRVnU1NlpVZ2d5VkY0UGNL?=
 =?utf-8?B?YU5KeDR1K0IyQnMySTdFUUlNVlNvbGV6MGxuVTdmbk1vdytWakd4MTJPbE5R?=
 =?utf-8?B?a0IybUU4aGhuNjg4UkpOakMyVFlrMGVZVGNkSmU1QSszN1ZxdmtGKzFlOFBF?=
 =?utf-8?B?dXVGQVA0QUJxNkhpajdDYkVpSTgxZ2UyK01Udzd5aE9IMDRldEwyWTBoMnZH?=
 =?utf-8?B?MUdQTkZSVXJwWnkrZTdoenR4b2ZxakErb2IzUERJK0IyTlk3QTd0RDdVZkJh?=
 =?utf-8?B?dTJveGpSN0lKWC81NTlRbUVkVE8rUUNWaGU5SjdMS1dJTWV1emZUa21BdnB6?=
 =?utf-8?B?dHJ0SXNtUXRkc0daRmMvejlxVng5cWdUQVlYWWE5T2dhZDBnK3NQSTNLYUxq?=
 =?utf-8?B?L1o1dWlzZ3A3MzNEeWt0eGpMSWxVZmdYYVVEajk2cGVYVU83VExNaGJKMHB6?=
 =?utf-8?B?MGhmVTZ6RmxMMlJRbmk5aW90SFNVWmQ1cnBSYWQzd3Ewd2ZtV0RKUVZ2YXhw?=
 =?utf-8?B?bG9TWlR6WnpqWXJWTTc2SVJPK3E3RXhLUDNMQkRldjRlRVp6WHI0T1NZZmIz?=
 =?utf-8?B?YnJEYXp3REcvT1VZVzFxVWpzcGRWL2ZOM2puVFgzcWR1OE9QdUJPOEtRVjJC?=
 =?utf-8?B?MC8zVjdmMFMzUHl4b05pa0krZEpIMFRraTg1SURrTUc1MzRTbG1vU0g5cTVx?=
 =?utf-8?B?L3BadUpHeHlvT3dDVllRWjc5Si9SNXg4WHl1eTZTS09MdjJUTGtpZjB5VnZR?=
 =?utf-8?B?RlkxWUx6U1g2aFJWOFpFVjMrRmNHWlpVanFJTXRxYzM2cnJuQUFraXRWWXd6?=
 =?utf-8?B?VEtCMXBLRWNlM0VBTkREZWJRQkNkbUUzUWluUitpTXJKK0NQbkNsUDUwVUFN?=
 =?utf-8?B?aXRqcmpQVmFtN0RLZ0JtU0xJQjFiL2JGMTNKMzVvYVpKWlRpYmtGL0lTVGVV?=
 =?utf-8?B?UGhQYjRRS3BSTVhETUxONE83Nk90bVh1dWdLMmxzR3BDZWNzZ29YMm5xOVlp?=
 =?utf-8?B?VmZGS0cwZlIwWEpLZDcyYm4xWURSdXFiVFBGTklTRkpySVBqRlM2QUo3VDRO?=
 =?utf-8?Q?lfUdjXcSOGBKpns1Ki8bU2Vr8LcCzg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUF3MC9saU9YejdOd1dtVWZpOXltblU0NDR3T3ZNUGlvVkhhYitOalhwVGpE?=
 =?utf-8?B?cDVNSzFmdlNvWHYyM056NzFKUGRQYjA4bDdnOEFCZ2hxMXpWanpqU0FKNi9o?=
 =?utf-8?B?Wk9zL0Fpd1ZBTUpUTFByM01EVk5HaVA3S3gxRlNNMk1SNElvdFNvZWN4S1NT?=
 =?utf-8?B?c2V6WTh2QmppN3BCekt5ZVV4V1VEeWc2RExmRVQ3enZ1dkdERTdZemZnaTlr?=
 =?utf-8?B?TTFWOURCOTZCMC9mWE5uK2c2WStoU21Cd3gxVkVLWUFYaVJmSWpJdCtMRmJM?=
 =?utf-8?B?ekZpQ0lraUVxTnZVRlZ1d2RhdnIzbExRUkUxbkxqbGtLdEVxQWlKb0ZFcmVq?=
 =?utf-8?B?SXBKNGFQTzh5V2ZUQVFsaHRGYVBpbHUvK21WN3ZSWVJpczBJWmIwYkE2K0NG?=
 =?utf-8?B?QkxYbVFmWmFweS8xR3VuU3VVZUFMSE5KUlExbWYwQllNZVNZY2dIODBIdTRw?=
 =?utf-8?B?dHBsbmJYMUJtR0ZUN2tWdDdEVEIwc0k1OVg2ZGVlajRVTDhEYW0veGdUYXU0?=
 =?utf-8?B?SzBCa0MvWVJwRDlxbmZzRDFwaWFKRDBjWkpnZE9VREZtZjdPN0F5U2FDZ2RD?=
 =?utf-8?B?Uk5SdGlDZCtETVM2akI3ampiZG84OXdET1FJVDVWclhCeHpiMTVGTGhneFA1?=
 =?utf-8?B?WXQrOWxvVE1vdW9IWk5walg2UzNVUCtja09NazFXNjFHZU9BbTNZcnRKcVA2?=
 =?utf-8?B?b3FJRUxhbnJRUmlITjJZc3BWcXl4OVI1b3RvQ3NOUEo0UFdNTVRjVXB5Z2po?=
 =?utf-8?B?SExITmVOM0drTTlVMmpyZXM3RmdWVUdPR0lZWG9hakdUVHdBR0ZMMWxjMy90?=
 =?utf-8?B?bmgyODBMR2NkeEdBTXdDQU9GMUl0eXRxT0pPWHJWc0hHbUM0NndMTzUyWVVt?=
 =?utf-8?B?WWlzcjFUKzNFRWVoMFpUVUc1MEoxUmlmamZ6eVhYS2dsWTJBMHdoYTlieUNW?=
 =?utf-8?B?bTRSd0tuMCtJUlZFQWt1aFBvMlR3K0ttaGdPUlZyZUtaRTFqUHhTWVdMc09Q?=
 =?utf-8?B?dStIaG9oSWRQa3NhdjhPNDJGcDdMQ2dHRDhXK0lkWTJGd1FBNmprRm1FN0FC?=
 =?utf-8?B?L0sxcjFtS1lMMnMrNmdxamxqaC9HVlAvcUpSWFZlTWN0VlJsV3ptcElNR3dn?=
 =?utf-8?B?Q3Q4ZS8zU1FDSHljM2xESUNOR0owR3NNZUNmUmM1aVhRWkd4S2ZHYklVWTRx?=
 =?utf-8?B?S0tZTXdqdU5RdmdPY0pXclNpOW8yeTAwZlc0RnNPcTF3N21vcmNKaFRPT2JW?=
 =?utf-8?B?clh2b3UvUFFBa0JxSkR1Rnp3Z2VYWU9Wc0dycFJmVGlTUFh0THNVTkptRm9L?=
 =?utf-8?B?QjlrN3dmVEJFVkN0RkNlVEl0R3pCL1RVK2JXS1IyWjM4ZTF2VytGV2xmOHNw?=
 =?utf-8?B?TWFZUmFmZXcwelBoZFdlRWdmWDVNQ2tIa2VRRURpdXNqUy9uNnZkeUhobjd6?=
 =?utf-8?B?RFVmd1ZsWi9VbGxhSDIyVlM5SlE1WTB0Q21qSHUvNVVPSE5MclNpWjNxUU5N?=
 =?utf-8?B?Tk5sdjZkVnAvN1NYT1BmSE1iaEdaZy9sSVh0UW95R1cxdVNRTUZiS080VjJW?=
 =?utf-8?B?KzI0ZlppSHZyT1BVWG5hTGRhcnpPMlpIc25Pb2wza1VhalJKSVZPVytucFFQ?=
 =?utf-8?B?c1owQkIrRnl6ZzZPR2s3bUtyNlZIeUprTWFjbExBVFNpc3NRWnQ2SUhvVTZq?=
 =?utf-8?B?R1B5ZzVPdTM5SVBXSG10aTNEUG45cmtWYUpFa05Tc09DeW9HS1NwUFluWlBq?=
 =?utf-8?B?N2diTTlTSWhTWVlkRkpLcVQrWHJZbEpwS040c0lZRGsrU2xqVHYvWURJWVpZ?=
 =?utf-8?B?VHYzUktMUnB4SitNcUVIUkplK04wa3B4WUFxa1luZTd5Zkx2SWViNmNidmkz?=
 =?utf-8?B?b1d3akxMdW93cTRqTG9OT0daQ0R3d3YzbVkwVU9zbDRZVTFNSFkrV2pWeUFX?=
 =?utf-8?B?ck1EMTdSVXJlUXJlV0puOXpWTTczT2JXaW1hT1lCdEdxRkZINzIyNXRvMGVC?=
 =?utf-8?B?c1Z5QlA0a0JzRjlRN3dUTDZyK0tCMUk1UTFvL25aVlpieHBnME11Y3ZTYWc4?=
 =?utf-8?B?WU03cUpzZFROTGVzdFBzS3p0L1h4ZFlCZk5rTjN6SzRNNlpXTnN1OG5HbTVG?=
 =?utf-8?Q?lehy+RVOWoPixy+k60/gwAccb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7332b1-0a2f-4135-888f-08de30ed2afd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:20:32.3493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXQtk/dtlyx3bXjC6Le1/FYM1CmbaR71Sa5Zrh4KBM0xGUWsx4wf7SNrIqNeNvOY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6129
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

On 12/1/25 14:55, Philipp Stanner wrote:
> On Mon, 2025-12-01 at 14:23 +0100, Christian König wrote:
>> On 12/1/25 11:50, Philipp Stanner wrote:
>>> The overwhelming majority of users of dma_fence signaling functions
>>> don't care about whether the fence had already been signaled by someone
>>> else. Therefore, the return code shall be removed from those functions.
>>>
>>> For the few users who rely on the check, a new, specialized function
>>> shall be provided.
>>>
>>> Add dma_fence_check_and_signal(), which signals a fence if it had not
>>> yet been signaled, and informs the user about that.
>>>
>>> Add a counter part, dma_fence_check_and_signal_locked(), which doesn't
>>> take the spinlock.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>  drivers/dma-buf/dma-fence.c | 44 +++++++++++++++++++++++++++++++++++++
>>>  include/linux/dma-fence.h   |  2 ++
>>>  2 files changed, 46 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 96d72ffc0750..146de62887cf 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -445,6 +445,50 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>>>  }
>>>  EXPORT_SYMBOL(dma_fence_signal_locked);
>>>  
>>> +/**
>>> + * dma_fence_check_and_signal_locked - signal the fence if it's not yet signaled
>>> + * @fence: the fence to check and signal
>>> + *
>>> + * Checks whether a fence was signaled and signals it if it was not yet signaled.
>>> + *
>>> + * Unlike dma_fence_check_and_signal(), this function must be called with
>>> + * &struct dma_fence.lock being held.
>>> + *
>>> + * Return: true if fence has been signaled already, false otherwise.
>>> + */
>>> +bool dma_fence_check_and_signal_locked(struct dma_fence *fence)
>>
>> I'm seriously considering to nuke all the unlocked variants of dma_fence functions and just make it mandatory for callers to grab the lock manually.
>>
> 
> You mean "nuke the *locked* variants.

Sorry, that wasn't specific enough.

What I meant was making the locked variants the default instead of the unlocked ones.

> 
> Why, though? Aren't they enough for most users?
> I suppose you have all those subtle races in mind..

Yeah, exactly that.

> 
>>> +{
>>> +	bool ret;
>>> +
>>> +	ret = dma_fence_test_signaled_flag(fence);
>>> +	dma_fence_signal_locked(fence);
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_check_and_signal_locked);
>>> +
>>> +/**
>>> + * dma_fence_check_and_signal - signal the fence if it's not yet signaled
>>> + * @fence: the fence to check and signal
>>> + *
>>> + * Checks whether a fence was signaled and signals it if it was not yet signaled.
>>> + * All this is done in a race-free manner.
>>> + *
>>> + * Return: true if fence has been signaled already, false otherwise.
>>> + */
>>> +bool dma_fence_check_and_signal(struct dma_fence *fence)
>>
>> So I think we should name this one here dma_fence_check_and_signal_unlocked() and drop the postfix from the locked variant.
> 
> postfix?
> 
> Well, now, IDK. Can't we, for this series, keep the _locked() variant
> so that it's congruent with all the other dma_fence code?

Good point. That thought was not really related to this series here.

> 
> And then later if you want to force manual locking you can add that
> kernel-wide in a separate series, since it'll be a discussion-worthy,
> bigger chunk of work.
> 
> That's cleaner, and my series here won't prevent that once merged.
> 
>>
>>> +{
>>> +	unsigned long flags;
>>> +	bool ret;
>>> +
>>> +	spin_lock_irqsave(fence->lock, flags);
>>> +	ret = dma_fence_check_and_signal_locked(fence);
>>> +	spin_unlock_irqrestore(fence->lock, flags);
>>
>> Could this use guard(fence->lock, flags) ?
> 
> guard? You mean a lockdep guard? Do you have a pointer to someplace in
> dma_fence who does what you mean / want?

E.g. like guard(spinlock_irqsave)(&fence->lock);

Regards,
Christian.

> 
> 
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_check_and_signal);
>>> +
>>>  /**
>>>   * dma_fence_signal - signal completion of a fence
>>>   * @fence: the fence to signal
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index 19972f5d176f..0504afe52c2a 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -365,6 +365,8 @@ static inline void __dma_fence_might_wait(void) {}
>>>  #endif
>>>  
>>>  int dma_fence_signal(struct dma_fence *fence);
>>> +bool dma_fence_check_and_signal(struct dma_fence *fence);
>>> +bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
>>>  int dma_fence_signal_locked(struct dma_fence *fence);
>>>  int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>>>  int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>
> 

