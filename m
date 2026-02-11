Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOlwGOaEjGmfqAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:32:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076A124C8B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D7010E5B3;
	Wed, 11 Feb 2026 13:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bemMK//e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B9F10E124;
 Wed, 11 Feb 2026 13:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmMdwJTFO0MTvGMuJ+ZgYl9Up8NhTd2T26NuU5XvAlq5FCJ3Cg7+oVqd4Zm0sYtmiiwggvg8CxOWg2jlmf9SJCmtUhuXN80yltEk8wLP0q2lXHH+aJsSuRZyG2ItPfvILESzG8hwmOLNZMy6lBBmGna2kvEzY6MEeehYr/VXrnSj9ofNz9Yax6apYNg0hsqey8FkVgb3m74AZCylWg+8Qzz1xLuH3zhjcojNkh8rg2XhFF9KyK6c5AMzekOSvUC1QzAiiFINHftEqpA9oBtES6pWMDwT2sWDCFpoBKxla0Ayb4y6gcDIHGc8wDq6k//fAco5xE9bSqcG4M/cse2oKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8dTah1RqMV6IRNSmJ26Pf5xHv0APieBzEA8/vWhj74=;
 b=X46Nns+no12ZTIv8DxC/dU6fvLuls2UgtteT+EVJEXp4oudstUZ0W4ay2fVPXXATgVz+JrP4GMGXoYAZnfexKI1bb3jWy8geW4zz7KZAxfEuuQ637cy0HP+iCibZQZ0pJO16gLPnwbDYwbxzMKRM7i/VAk2pORJTWIvt2Vq5XUPS1t8LO0KHCDDmwoW95SjmliPI3FupJGx7umX4LxPSaScAlchOaM1rT8rueq4kykO5HsMGMsZ6wKmSszigsTAj256AADsBHECMUItnpwgS8SM+xTUNtInMcDbMvo/RAT5hlbvHZLsbkx/YwGSIvaGK6L8NNpi1uvQhOYJlbi12ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8dTah1RqMV6IRNSmJ26Pf5xHv0APieBzEA8/vWhj74=;
 b=bemMK//eQ/4mOJBCNsm4BoTMuSfPkAv1RKnJsZ5Iqm3Zc+tsK/CCP3n0fXXHvZ5Qia+l7ll3is3cl7g8J4Y+Q83S9uDlJTvaIea0auqFmdP8AwqjJQgDk7XKOVnnuGpjlrIt+nOXVIYB0WpmVner/lSFKmwxTsi4V7y8BBT/FRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9548.namprd12.prod.outlook.com (2603:10b6:806:458::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 13:32:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 13:32:12 +0000
Message-ID: <ce40a3ff-6f99-4626-9320-f71156ac77e3@amd.com>
Date: Wed, 11 Feb 2026 14:32:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/sa: Split drm_suballoc_new() into SA alloc and
 init helpers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
 <20260210105929.4089794-6-satyanarayana.k.v.p@intel.com>
 <e8ecbbc26d195868bd56825da4aca503521300df.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e8ecbbc26d195868bd56825da4aca503521300df.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0216.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b557b73-ed5e-48ed-7059-08de6971f6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmNYR1hJWXhzRVFXQVc1N3psY1pXUDIvMjBoTjRqVmFESm4rYW1tblg5UU9M?=
 =?utf-8?B?a254Wm1FZFlFa3hQMEJKbTZraWRreUViclNDM0VMT2R1bnlGaEdhWG9DZS8z?=
 =?utf-8?B?NDROQVRaTmZZblNFOXZ1czY2Y3VuZXNOZTliSXpWZS9KVnkzVVlKZlJrczdT?=
 =?utf-8?B?YVhTTCtSTUpTdmJabjExUlFic3BEbFRNNWhUdU5yckRSOS8rWGltR3RpdlR2?=
 =?utf-8?B?Mmhhd2lnd3p5cWFOMlpwVkFxVmk1MnRpa2hsQXViZVB1c1VoZnJobDJLak1L?=
 =?utf-8?B?OWh2YUQyWFVXSEZhcmk2RXYyUEx4UDYrdFR5YXM3Mjk1elpFYU84TmYxeGti?=
 =?utf-8?B?ei9IUGYzR2s1K2h5SFJlb01XTW9ia2NhRjZ1R2hpSDJaS1ByY25JNmY2aFBI?=
 =?utf-8?B?TnQ4Zk96UVhuT1VnTjNyZSs5cmNOTnVQd1VTVGFuOVFhLytwT0dBdTdVSWNh?=
 =?utf-8?B?YUZHemtLUUpWemRGSlVObjVlOVcrU01Xc0xJblZ1TjJMMkhUbXpTR2kvcmc5?=
 =?utf-8?B?S2hlS2lLaEZ0VlBNVmhzamZKQjc4QlRhZGVPV0gwVG1HcGF1RHR5cFp3N3Er?=
 =?utf-8?B?UFZqUVhWa25rN2ZxMU9uTnFRd0svNkpSaXpHRTc3VkxVVkdnNkl2SFIzK0Ey?=
 =?utf-8?B?QWIvZncrWDZrdmpDL2wzd29ReG9kcStwdUhRTE5haEJzUVFGUXlnZlI0Nklt?=
 =?utf-8?B?N0pVRGZJRmNoM1FaOERKVXU3MS9teFdtdmwwNi9HMUNBQ2lKL001dEFhNDc3?=
 =?utf-8?B?RTBjRGs1eWdGczNlOHdJMUw4VDVPalA5clI2QU81WStwQzZFS0RwN2FWOUtu?=
 =?utf-8?B?NG1oM2J5Z3BkS3JHQVl4Q2hJS0ZxTjhUK2FOa2kxaS9YUnVEY1FvamFtVHZI?=
 =?utf-8?B?eXBpSDgzQmNzcXNidzM4OS80UVBJeG81NEs5Ym4vejYzQnM1L0hiVHhYdE9K?=
 =?utf-8?B?V1k4MzZpWm8yY2xPd1N3QUlnVmlqZ2V3MGVRc2kwTDlmUFI4ZTVPSU1oeDgv?=
 =?utf-8?B?blBDWDBNSXYzZG1POG1uNHo1YjQ1UWRHNWgwN0RqY2hHUExkZEJ6WFN6NjVv?=
 =?utf-8?B?SHVDMjNCdk1aTWhaWVhqbkNKM0UyejlGK015dHFKc0U3NDJNKzdreEVwZ0Na?=
 =?utf-8?B?V0x3YmJUYXUvenJlaG45czBtQlUzRTVSVGVOVTZwVnVJVUR6SXd6NjdFa3Ry?=
 =?utf-8?B?azYxdlkrMnBaZ0x3WXdLNVQ2L0RrRW1GZlhUUlM0bFpRMm9nYWg1SWpvQ1lp?=
 =?utf-8?B?L01YRWFIekFPYksrdE1mZlpFL1R4S3BJYldFMFlqS0Jweit2M1pDWU90RndS?=
 =?utf-8?B?aXVyb3EwRTdNYU5US1gzb0ZFUjBHUEpjRkxRRUZxek8vVUVqRVN0V2NLUE8z?=
 =?utf-8?B?VUFZU29Yd2sxdHNqNVVxblc5NjRQQldNVDlDZ2EwTG1qdXl3aHhFSXZsdkQw?=
 =?utf-8?B?SVZiaDZXbzV3b1hYWjgycFNPL29wM29EeWk4S2tISEJuUUV0K3NJdXNNT1Jz?=
 =?utf-8?B?U01FM1dZeG5lRDdEUGxJU21DYVZRYW1CSUtCcDBuaGx1bE9xTWRrUitpeUhm?=
 =?utf-8?B?SHFCNEdqVy8rcDhQOEV1M3BTZThmOGNPMXlzdjZRL0kxWXlScTJRSEFjeVo3?=
 =?utf-8?B?MGtTNXdiRnE2VGhiOHVDc0xZMDhjUnRaWmluNy8raHZrR00xeEpvL1BRdW5E?=
 =?utf-8?B?WkJsc2NEd1lhSkZ1RnZYMDlmUWkyZmkvS20rcWYzL0lDNVc4ZUpIRUFxVFBT?=
 =?utf-8?B?ODJEcWliYUtIZlZNV2F4WjBWSmpFdC9pZktnRTFSVlB3M0JndFd4dUF4WVk1?=
 =?utf-8?B?ZDd6Mjl3SDNJMWlBMFhqOEV3NXExTGplMFFESHZaMUpwVmtxaWEyMjNpaDVN?=
 =?utf-8?B?bzB0L0V1QjhkeGxtTG9kbkw2dzVTRGhwNjhsS3Z0TkpCMUtUR1p2VnQvNVJi?=
 =?utf-8?B?WDlOcFppNVJxaTJGQlNBMjByM29CRVp1WjdhQTBsbWczOHdaZDk0d1lmKytM?=
 =?utf-8?B?bi9FRzQ3RGxSUWkzcStIMkRLNEY0SGhXbnhWSVd0K2lvemFmTWZoODJWN3ZO?=
 =?utf-8?B?Ukp6R1dERWEzRlRtZkdOTzlqaFc4S2syT3RpNzVTUDR1SEl4bnJDZnliVmpL?=
 =?utf-8?Q?CVWs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NitQQWxEcWhHU0RRR2FWQU9GZ2dIdXBmSXZubUdQNWo4ZkZuY2plSDFmQ2N2?=
 =?utf-8?B?TmdSWFlNOEdjTE5jekFGcWN0d3lTN2drRUdyUHNyVDIwTnd6MUs3VGZYUm5J?=
 =?utf-8?B?bUtidG8rZlJEK3ppNXlDSFVIUzlIKzY5TUhvSnltSWtaWGxuNFJhYWZJRVhL?=
 =?utf-8?B?UllaaTFaM0pDbVkzZkJZV0wvUHVPdTcxcGpPOEl6MDlZRjYzMkl2eVNKRW9Z?=
 =?utf-8?B?WkJIOGlRUzNvN0tqTWYrNk9aMTkyeUZCWFZEZnVrMEwzdi9NTFZQRjBZck4x?=
 =?utf-8?B?Zjd2WEtBTUxpeG8zTDlkZjBiSENBQklPdm91SGhrcjFkbE0veTVDS0hFZXN0?=
 =?utf-8?B?NDRVd2E3NEwvQUlvZDdKS05rbVQxZkdROEt0S2YwcHhZUDk0NnhyL0p6TVQ3?=
 =?utf-8?B?WDlTTzcxQTZlOEVlOXdsRERlcjRxZGpMZ3d0SnQ2a3pldHpLbjRNT0RUNWR3?=
 =?utf-8?B?ZlZFQWlVY3g5Rkgrc3ZwVFg0bjhlTTBFSUtwQ0JFV3c3M0NRZW11aEIzSHJ1?=
 =?utf-8?B?ZE9zaG1mUWVVZkE0UXRVK2Y5c3k2bi9KbTI1YTRZWG5lL2xkOTZpSG81bmpY?=
 =?utf-8?B?WWFwdnlVajRETDlBN0ZqcDRVdG1uMEZKd1lORHZEczVkWXMxaGNWTnN5SHg1?=
 =?utf-8?B?TzFSaU5aVGFhYkdNd1pUcWJJL1FJcEJkZ3B1RVhLNHpQd2xubUtrTUI2VjFx?=
 =?utf-8?B?aE16eis0THdzZTVyYXg3TDY1RXhmTURwRVlITUNHL3JrS3BnQitFczljclox?=
 =?utf-8?B?c3N2VGI3TnRsUVV1VzJKVGE4bWFUZml1RDlxZ0JOQnZVUmxETVoyNlMzTk9Z?=
 =?utf-8?B?TTh2aWlScmZvTjB3MDJJUDJwc1FlMUV6b1BYeFl0SkxRK0hOVWNxdnhrS1FB?=
 =?utf-8?B?cE5KNWZlMFJlaHNXV0MyZ0U3LzBqWHRRSkJ4dGppVjNCNFJYMHE5cU1laFBo?=
 =?utf-8?B?T3hnRGZHWjNJcmJXL0ZscUNQenJjY2l5S1RsUG1BTHp6Q21KWDNQL2ltV2JP?=
 =?utf-8?B?SUx0Tk9UUHJkVXJUek5BYnFyYUU0TkNMTHVnRXZjcUZNTzQ0V2prNjRLQXQz?=
 =?utf-8?B?RW04UTV2bkRBYzFXMlNRRm5wbHpObXBxSnVzblIycFZFbUlCL1NSUll6ZzRn?=
 =?utf-8?B?UzZEZk1GWCtwUGo4RThZVTE2cmJOMEVFOVViTUNSdHlEWjE0WmFPSm02UE1J?=
 =?utf-8?B?RzJRVGNLczNQd0lpd3pBYjZHTWVxM0J3WTNnU2NNMlJvWmRMM1hHZ2RvVUNo?=
 =?utf-8?B?bjYwRUduSlFac1o1R1lqdkQvWGRvTHhEVFJQZk1DMUFMdHdoZWdzS3NieVJk?=
 =?utf-8?B?Z3lINlczOGYrcjNJNzZkNFZjTHJWZnlyTWJGTHJ5clRudm5PRW1WWU40bVd3?=
 =?utf-8?B?VWhNRk5xamx4NjMyUzVSVlZrNVB5N0FERWdNR1JCOE5IWGswaUx5OVpxT1p0?=
 =?utf-8?B?TmwwZFRaWVdoU3dWNVFMTnVQTGhYdmF1UHNUVjd1aVRwSzFoaDRSTzl2U285?=
 =?utf-8?B?eTBPMjF6Vk1KWVY4TlBaamlaUHIwZVdDZGZTT0VQN3VDN1poV3pjSGpPR01t?=
 =?utf-8?B?em9nMTVtUnNFL0VqdW5mZnd0SVlKU29GRjRlZVZER2dlUjN0M3Uwei9Pekxt?=
 =?utf-8?B?NlE0bkxFZEgxbXVYSXl1cEwybkhsODFkSGRjU0szN0d3L2pGUWFGbUhvZjZs?=
 =?utf-8?B?ZGhnb2wxV2JIZTlZTkd1eGs1QUFXYy94V3Babk9ML0JRTWVER1ljMUw3V2pP?=
 =?utf-8?B?dFNVdVdOZHFYNE5IdjdabEN6U2RWNzVEOFdsUXRJV1BycEpwSHRqeWg1cnJO?=
 =?utf-8?B?aGRzT3hJVmlaQzV2cmU3eHZTdC8rRjJCcWRQSSs4VzdaN0hNa3ZhVDFlSHpH?=
 =?utf-8?B?WktBWVc0a1FXa1dHYUZ3eCs1TzcrTjVsU0pSZ2tIOHF5c1JUakZnUTEyNlpU?=
 =?utf-8?B?ZUE2clQ1bjQyNnZORlRsT2RRZ2p1Y1l2L3hBbVhIL1NuaDNSUGlPaUFDZGRh?=
 =?utf-8?B?em5waEx5SjJFa3lBeit5eWFVbGFQM3RhcmFuMWF5VEhCWGJ6S2JRWUdkWDhw?=
 =?utf-8?B?QVZKMEVid1Fxam1YZFhacERLOWVTSUNFR0FWY3NRWVdWTEljSVV6aE1Banlx?=
 =?utf-8?B?MjFaTnhTTDZ0RVVSelNhM24vNkc4Y01vWWw0V2JWWHVkZzNYYjY3eStObjVN?=
 =?utf-8?B?VHpwR0paNC91bDZ4eld5YTVHN3cvTFNYMk1oSlNMaVJyMitrNHFLd3owTW5w?=
 =?utf-8?B?RDNOZVVZNUhVVVdQajJFQk9JbTV3Sm1pL1hvbVM1cmZkcHJmTlBVY0pMcTlh?=
 =?utf-8?B?YkkvNjlsNFdHYkpUL0xYTzJKeCtvSzA4aGZQRFo2Qy9EUXdTdkVqdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b557b73-ed5e-48ed-7059-08de6971f6ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:32:12.5661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvS7Owdsabh/D90Ym/EewbdrwsWwX+fFIg3DNGC6V2Y7AMnxSFOwNbwK14dVW6iv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9548
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,lists.freedesktop.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8076A124C8B
X-Rspamd-Action: no action

On 2/10/26 13:09, Thomas Hellström wrote:
> On Tue, 2026-02-10 at 10:59 +0000, Satyanarayana K V P wrote:
>> drm_suballoc_new() currently both allocates the SA object using
>> kmalloc()
>> and searches for a suitable hole in the sub-allocator for the
>> requested
>> size. If SA allocation is done by holding sub-allocator mutex, this
>> design
>> can lead to reclaim safety issues.
>>
>> By splitting the kmalloc() step outside of the critical section, we
>> allow
>> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring
>> that
>> the initialization step that holds reclaim-tainted locks (sub-
>> allocator
>> mutex) operates in a reclaim-unsafe context with pre-allocated
>> memory.
>>
>> This separation prevents potential deadlocks where memory reclaim
>> could
>> attempt to acquire locks that are already held during the sub-
>> allocator
>> operations.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
> 
> LGTM.
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Where are patches 2 and 3 in that series?

Regards,
Christian.

> 
>>
>> ---
>> V2 -> V3:
>> - Updated commit message (Matt, Thomas & Christian).
>> - Removed timeout logic from drm_suballoc_init(). (Thomas &
>> Christian).
>>
>> V1 -> V2:
>> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
>> drm_suballoc_init() (Thomas).
>> ---
>>  drivers/gpu/drm/drm_suballoc.c | 110 ++++++++++++++++++++++++++-----
>> --
>>  include/drm/drm_suballoc.h     |   8 +++
>>  2 files changed, 97 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_suballoc.c
>> b/drivers/gpu/drm/drm_suballoc.c
>> index 879ea33dbbc4..b97ffcd98d45 100644
>> --- a/drivers/gpu/drm/drm_suballoc.c
>> +++ b/drivers/gpu/drm/drm_suballoc.c
>> @@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct
>> drm_suballoc *sa)
>>  	list_del_init(&sa->olist);
>>  	list_del_init(&sa->flist);
>>  	dma_fence_put(sa->fence);
>> -	kfree(sa);
>> +	drm_suballoc_release(sa);
>>  }
>>  
>>  static void drm_suballoc_try_free(struct drm_suballoc_manager
>> *sa_manager)
>> @@ -293,45 +293,74 @@ static bool drm_suballoc_next_hole(struct
>> drm_suballoc_manager *sa_manager,
>>  }
>>  
>>  /**
>> - * drm_suballoc_new() - Make a suballocation.
>> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
>> + * @gfp: gfp flags used for memory allocation.
>> + *
>> + * Allocate memory for an uninitialized suballoc object. Intended
>> usage is
>> + * allocate memory for suballoc object outside of a reclaim tainted
>> context
>> + * and then be initialized at a later time in a reclaim tainted
>> context.
>> + *
>> + * @drm_suballoc_release should be used to release the memory if
>> returned
>> + * suballoc object is in uninitialized state.
>> + *
>> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-
>> ENOMEM).
>> + */
>> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
>> +{
>> +	struct drm_suballoc *sa;
>> +
>> +	sa = kmalloc(sizeof(*sa), gfp);
>> +	if (!sa)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	return sa;
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_alloc);
>> +
>> +/**
>> + * drm_suballoc_release() - Release memory for suballocation.
>> + * @sa: The struct drm_suballoc.
>> + */
>> +void drm_suballoc_release(struct drm_suballoc *sa)
>> +{
>> +	kfree(sa);
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_release);
>> +
>> +/**
>> + * drm_suballoc_init() - Initialize a suballocation.
>>   * @sa_manager: pointer to the sa_manager
>> + * @sa: The struct drm_suballoc.
>>   * @size: number of bytes we want to suballocate.
>> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL
>> but
>> - *       the argument is provided for suballocations from reclaim
>> context or
>> - *       where the caller wants to avoid pipelining rather than wait
>> for
>> - *       reclaim.
>>   * @intr: Whether to perform waits interruptible. This should
>> typically
>>   *        always be true, unless the caller needs to propagate a
>>   *        non-interruptible context from above layers.
>>   * @align: Alignment. Must not exceed the default manager alignment.
>>   *         If @align is zero, then the manager alignment is used.
>>   *
>> - * Try to make a suballocation of size @size, which will be rounded
>> - * up to the alignment specified in specified in
>> drm_suballoc_manager_init().
>> + * Try to make a suballocation on a pre-allocated suballoc object of
>> size @size,
>> + * which will be rounded up to the alignment specified in specified
>> in
>> + * drm_suballoc_manager_init().
>>   *
>> - * Return: a new suballocated bo, or an ERR_PTR.
>> + * Return: zero on success, errno on failure.
>>   */
>> -struct drm_suballoc *
>> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
>> size,
>> -		 gfp_t gfp, bool intr, size_t align)
>> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
>> +		      struct drm_suballoc *sa, size_t size,
>> +		      bool intr, size_t align)
>>  {
>>  	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
>>  	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
>>  	unsigned int count;
>>  	int i, r;
>> -	struct drm_suballoc *sa;
>>  
>>  	if (WARN_ON_ONCE(align > sa_manager->align))
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>  	if (WARN_ON_ONCE(size > sa_manager->size || !size))
>> -		return ERR_PTR(-EINVAL);
>> +		return -EINVAL;
>>  
>>  	if (!align)
>>  		align = sa_manager->align;
>>  
>> -	sa = kmalloc(sizeof(*sa), gfp);
>> -	if (!sa)
>> -		return ERR_PTR(-ENOMEM);
>>  	sa->manager = sa_manager;
>>  	sa->fence = NULL;
>>  	INIT_LIST_HEAD(&sa->olist);
>> @@ -348,7 +377,7 @@ drm_suballoc_new(struct drm_suballoc_manager
>> *sa_manager, size_t size,
>>  			if (drm_suballoc_try_alloc(sa_manager, sa,
>>  						   size, align)) {
>>  				spin_unlock(&sa_manager->wq.lock);
>> -				return sa;
>> +				return 0;
>>  			}
>>  
>>  			/* see if we can skip over some allocations
>> */
>> @@ -385,8 +414,47 @@ drm_suballoc_new(struct drm_suballoc_manager
>> *sa_manager, size_t size,
>>  	} while (!r);
>>  
>>  	spin_unlock(&sa_manager->wq.lock);
>> -	kfree(sa);
>> -	return ERR_PTR(r);
>> +	return r;
>> +}
>> +EXPORT_SYMBOL(drm_suballoc_init);
>> +
>> +/**
>> + * drm_suballoc_new() - Make a suballocation.
>> + * @sa_manager: pointer to the sa_manager
>> + * @size: number of bytes we want to suballocate.
>> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL
>> but
>> + *       the argument is provided for suballocations from reclaim
>> context or
>> + *       where the caller wants to avoid pipelining rather than wait
>> for
>> + *       reclaim.
>> + * @intr: Whether to perform waits interruptible. This should
>> typically
>> + *        always be true, unless the caller needs to propagate a
>> + *        non-interruptible context from above layers.
>> + * @align: Alignment. Must not exceed the default manager alignment.
>> + *         If @align is zero, then the manager alignment is used.
>> + *
>> + * Try to make a suballocation of size @size, which will be rounded
>> + * up to the alignment specified in specified in
>> drm_suballoc_manager_init().
>> + *
>> + * Return: a new suballocated bo, or an ERR_PTR.
>> + */
>> +struct drm_suballoc *
>> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
>> size,
>> +		 gfp_t gfp, bool intr, size_t align)
>> +{
>> +	struct drm_suballoc *sa;
>> +	int err;
>> +
>> +	sa = drm_suballoc_alloc(gfp);
>> +	if (IS_ERR(sa))
>> +		return sa;
>> +
>> +	err = drm_suballoc_init(sa_manager, sa, size, intr, align);
>> +	if (err) {
>> +		drm_suballoc_release(sa);
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return sa;
>>  }
>>  EXPORT_SYMBOL(drm_suballoc_new);
>>  
>> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
>> index 7ba72a81a808..b8d1d5449fd8 100644
>> --- a/include/drm/drm_suballoc.h
>> +++ b/include/drm/drm_suballoc.h
>> @@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct
>> drm_suballoc_manager *sa_manager,
>>  
>>  void drm_suballoc_manager_fini(struct drm_suballoc_manager
>> *sa_manager);
>>  
>> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
>> +
>> +void drm_suballoc_release(struct drm_suballoc *sa);
>> +
>> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
>> +		      struct drm_suballoc *sa, size_t size, bool
>> intr,
>> +		      size_t align);
>> +
>>  struct drm_suballoc *
>>  drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
>> size,
>>  		 gfp_t gfp, bool intr, size_t align);

