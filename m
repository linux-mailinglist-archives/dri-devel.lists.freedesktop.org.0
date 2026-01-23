Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA3sBeGac2nNxQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:59:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57B781B7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB1C10EB21;
	Fri, 23 Jan 2026 15:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jA6vymOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A8D10EB21;
 Fri, 23 Jan 2026 15:59:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMr7rHLTMZCsOljSkFRr4Pxh5IC7WoeEJ6+vbnXSWb3dfbLuLRqo6tLNDKmapzL5Vc2u5tot5DrxMbUyujRN5fbTcHIO6ixkY7wA2mHejEsJUY/FHOKFZT6jpAmpVEsjxjIULIS7kTMXVfJ+Mdu7iFmwzonqxxRbwgey86x2F27FQk8KPwCLc7C4nFDLDxaI0CJtx9rRDmjqsmxxnmn9NYhA3Ho6njvItnpSc3Z1Ri0VKWcp7+YDI/IPymwtB9gZwyq6RcJM0UEqEZYf1riZVppkhGswG4IztH26j2V9KW6+JRgC8wO+yKGS8uQ2Sox5A9PvcNINKYDGeZIAb3A4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMgIWowwimgjccLcp0y7+7Ts8S1shEiI7PLN6a/5XWg=;
 b=mL1qPCxy5DaaneNXV21IfCaQWEAx58iz7oYfJ+72vv8rkVA4neGi4ch+cs6sIbhue6CuYiYpd+HCvp29UFKk31H4FewYf8nR/xr7E9puYoKh/3xmYZMrXjVpsxKKEWDHazc6TlkLe3JfyK2Z5d8aI+ybY8Rzfx3UjfC7f9CMfCtnDEt7IbYKiM43wj2orC0NRPNFD2Qub3f4G0IgbjRv/aNnoyQUHm9BKiPa6cvhsWEmYY5YY0ppi0dJ63Vmgnyu77GwylrreITc2WHYkkGvYo3rUkEaJ4rmAGEQUax/9yHNSqHAUA0dCr2X0T37hTIwZG5qr+vMCfarou9yPbOUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMgIWowwimgjccLcp0y7+7Ts8S1shEiI7PLN6a/5XWg=;
 b=jA6vymOkegf85msZlP7QUaEIA6DqvxGmz5feeRSjOdlRJ7ZnPNdENo/otErrPyP/lyKfxu7a9TlCVVkHGTGKbqP9rhfr9HLwaK1325PFf52G8byyvpSp32UagA6OIclNs2eTK0/KJlyOPVMGs/ruOQALFvs+tP8dohsc6stnOMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7264.namprd12.prod.outlook.com (2603:10b6:303:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:59:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 15:59:19 +0000
Message-ID: <7025c566-1a94-4565-b085-017646500a71@amd.com>
Date: Fri, 23 Jan 2026 16:59:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
 <20260122170218.3077-11-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260122170218.3077-11-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a99c85-61c1-477e-2151-08de5a985e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmxpaUlNVk9PR1ZXK1Q5RWw4UzZzbHpVaVdCQlIzS0YyNXhxdURRQzNTc2d5?=
 =?utf-8?B?K1JKS3lSMm1BdXV2NjY5eUlnMEZLTXRub29BR1U1ZkZLOUJRVXVsL3RVYkIw?=
 =?utf-8?B?cUU5S1o4a0lUZXpObElZcHdibDdxejhUNEtIbElsSHlyallpL3FkbU85QWZ5?=
 =?utf-8?B?N1g2QWxrS3ByTFNBMXB3cEJVYUpmS2NLSFMzWk9zQVd5N1c3cmdkejF3QllQ?=
 =?utf-8?B?aXhmQmRYRGgrVElCeWZuekZ3RTZTK0ZHSFIxMnNhMlNIaFlYUWRMZ2RlczNw?=
 =?utf-8?B?dFhUTTdPRzFCMVpCeTVhSjQ0dU9udXJ4WjhqeWFiSjhqV1BHWXl0T2VCWHds?=
 =?utf-8?B?d0Y1U1pPejFyY2ZTSVA2OXZtV1ZxSzVHYnNxNDB4NHZBMGIzbnpZNm11QzBG?=
 =?utf-8?B?NDFWbWVtR3lHU29menFsa1FvRndoaTFaclVkVlluVFp0TlFzaEJmUGd1RkhL?=
 =?utf-8?B?NE5ldlBlRUhaaW1VMnVIdkhhSCtRWCsvRldNcldFSlEyZHpTR3hpVFRlN1dX?=
 =?utf-8?B?Smdjanp5NkZnWUliWlNtQk9QUDB2UDd6eUV1SHUxckk0NlRzdWhKdllZZ0pE?=
 =?utf-8?B?NjBMWVByVXBCMFFuM3ZDWDZBT0huUnFqU2crRm1UL1RoTFhoY1BYVTRWQWIw?=
 =?utf-8?B?U3RvSVJNS1VuSkE5dmdLd0hrcVFrTk1KUFd3MElpOXdRQmd0UnNLenR1RUFM?=
 =?utf-8?B?bTZkMVdiR2pncnBCV1E4dUlNRG9oY3dNSElLdElzSFF1ZVY2K2Y2ellFRUdZ?=
 =?utf-8?B?eDAvN2IrbEZnQVExdy8raWdGSjE1Q0FZcjhiM284ejEvUzB6NDZOb1Fub0lM?=
 =?utf-8?B?d0wwZWNlYzJpNnZPOWRsSnNQcHJsdWErM3E4d3VlYVJxOWJTREZRV1NyeUFY?=
 =?utf-8?B?aTJoUVpLZjBmUUp3MFhrK0NqYngyQjRKMGlpVlFPWGVEeVgvSEkvMGxVRVQ5?=
 =?utf-8?B?NDNKbm1HQkl0cFIveGFBK2RhY1N4NkYzaDZhOUZlVHBYNHlEUzZtcm13TklN?=
 =?utf-8?B?V3ZRbnpIUmpDNnZ3ODQ1bU1mZUtaanFjeXBlUmtmWUxlUXB1ZEs0YmdWckxF?=
 =?utf-8?B?ZXNlUFczbjQ5RWVkT0tKbDdydXI1NkVMellKT0VhN2ZMVmxabXhLZTR6b2xj?=
 =?utf-8?B?aHhBTWZVYTFYY2s2VXZQTldDMHhCVmR4ODZXQXo4VEJwM1B0Z0hrb05KbHc1?=
 =?utf-8?B?NmtYWkNoRlRiRUpwZFNQUmFoajdyNjZjb3k2L2VGL2tLeEtKMmRVUHpRcEZM?=
 =?utf-8?B?SXBJL3NZRWUyczNRakl3RkwrUWlFN21jMk1kM25KYVNidXhvK3Jrak1IN3FZ?=
 =?utf-8?B?VnZDZmdlckx6TEtWSklBM1phZEtjVFpjSXBhaktCeEY5ZkVwcXBMandXQjBV?=
 =?utf-8?B?WDcwZzlIUjZhaGpPWnpsblYzckQ4UGF1VnRxNi80eW5UdGk4c211Rnh1U0p0?=
 =?utf-8?B?dUM0Sk95d0Q0Nm1iSHVwbmVJK0dmY2pzNjRSVXVzRGFpdkR6dUh5SHVVN1lJ?=
 =?utf-8?B?VlRCMVpBRGFHZ0RZbWs4SGl2L3d6bGd6MFFYOVNJTWtEbU1SU3NpdmhBZzBa?=
 =?utf-8?B?N2V4WmljQ0FnRk11Z2M5UUVSLzJoMlE4bWJhZWxJTEJ1N3lPVnlWL2N0MGx6?=
 =?utf-8?B?aktFTUttTjIwcXFidk05bzdsaDBEbkpSVU4vczhBb2VuQzlseE1xRldIelRH?=
 =?utf-8?B?NTdXc2hhWEI4WlJvWXNpZkJpWkMzaFJ5SWVZcFdLU08xNDFBU2hUbitPQVhu?=
 =?utf-8?B?SWpZa1JibXlnRFdGLzNqYzZNdGNBSFhadXBaVXNrWFRHbjFmVTJ1NkpLZHMz?=
 =?utf-8?B?VlZ2aE1wV0lTQmQ0Ujcrc25MVWhBZ3p6ZUlMNWQySnovWk0xTkxpcVFHUW43?=
 =?utf-8?B?UTA0OHhuYXlMTHJMcnBQT0lQWkNnWkRudkFDR2pYVWtaY3VESlJZQXhuZU55?=
 =?utf-8?B?TmRKOGVrRXpybHkrRDlZK1pFMURWdlpNWExKUzVQNzV0elhKdk40TXl1WEJY?=
 =?utf-8?B?ejY3TkR2ZUpNUTlld2ViMVJOd1NnNFBsMWs3L01mQzdoMVcrcEJJU2lzdVEw?=
 =?utf-8?B?bUtLa2lLM2EwWU5TZDhudDZXZWdueW0yb2h1VnF4LzR5SVZCa1B4WTRaNWp5?=
 =?utf-8?Q?/O9c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WW0xQWRsV3hucEVqNW1jdjFkRmVNeW03WFk0ajVRa1BnWTFBSzB1RVdhNkxX?=
 =?utf-8?B?bkJIK1VWV0UzS000ak5WNDc3RzN1ZC84WHlDVXVxdXBybUMxNlZiQy80NjFN?=
 =?utf-8?B?eFpPekdORXNOTmFVUms3b3l4KzJWMVdKUUcwYmZWYWFrM3RsZ1pFcW1McGJ5?=
 =?utf-8?B?U25QRWxoKytBWFAxWEJpQ2lzcFUzaDZzK25Ra3NaWGd5Vk5KZkk0MHh6WFJR?=
 =?utf-8?B?WmFDN3h3MnZ0VERER1JXLzhuRzE0Z2FHYlVGVDhiWktqOTZOSEFBNE5XZE95?=
 =?utf-8?B?emdwMWY2L2x4TkhFMkp5U0R1cXMxSWp3ZEF3SjdYVGthRVhKeno1OUQyOFRI?=
 =?utf-8?B?b1hiRWQyS3hPN3ZpV2ZoTWIrOU9pU2w4ZUhsOFJFdDBHUERxbVFMcFNPV1gv?=
 =?utf-8?B?SERSWmt0akxZeHNReEFJR3ZPUmpheE5DblNuYTZNRXE1RXRmMThuOW9vVHVv?=
 =?utf-8?B?djdIUFdiODQ5M0s0V2tsb204R29rUWNlZ0ozMGdVU2hxemw4RHBuL0F5dndp?=
 =?utf-8?B?NmUyQVUzT3Q4bkk2WW9IUm9mVkVMeGRyRm1aYkZlc2JsN0NkaUd0Q1ZNc1RP?=
 =?utf-8?B?bEd2RXFpbzNmNGVaZ28vZlB5QXdSZlNLQ3BDVG5UNzU5bFYwa3JDZktldG5l?=
 =?utf-8?B?Qk9BaUQ1ckMyLzNlWXphVFJIS0h4UDRkczNPL2NvTzV6eFZPNXU2L1JJa0ZV?=
 =?utf-8?B?bDdvZjE5STVWMnozSnNkOVBna0wrdHpMUFlFTGMxVjFNbnpFQndMRGF4c0J0?=
 =?utf-8?B?Q1ZGT28yVm03SmdnQm9neSt0NWMrTlJMeGd4ZFFram45YXdqSk1EbHdaR0VQ?=
 =?utf-8?B?ZXVTcTFJd1ZsYmdHcU1RdERmdWRGa3EwM3Y2RHAwMGNGT3ZmUUc1UGtIb3pK?=
 =?utf-8?B?cktiakJUUTlCRk9jUTk4VlBWSHg0MU1VK1pERG5oTmFQcUVqNU1BZFUzTllr?=
 =?utf-8?B?cWdkVmwrZ2pML2IzOEp1SDZwQnBUNXBlZFdlVmFOMVZHSm1UY1pLMnd0T2NG?=
 =?utf-8?B?MHViK1NTR1h5UzFEeXM3RmppZTBUZlNVK1QrbS9zdnhabkVCa0J2azJpL2hP?=
 =?utf-8?B?WW5LUUttcFR3MGpvZzZucHNDS3U5eW44Q0ZzUkg1N3ZEN3FhRmszR3pCejQr?=
 =?utf-8?B?ZlYzZXV4VnptRnY2endobmphaE13YnVyMDlkWWFndzYza2Voak52RnpQTTdy?=
 =?utf-8?B?dU5WTUhnMHJxNHRxSE5nVTFUSmJCK3B1dit0ZTh1ZkhEbncvbnFMVDRSSzJi?=
 =?utf-8?B?ZmRqZVRDbTB3dFNhTkhiMDI5UFdxR3IzdmhuQ3I3SnhvdkNTczhMNjRvajJu?=
 =?utf-8?B?RHB5S3pjUUNJR09HSFZDQjEza3EvcU5IV29wZE8xcGd6SmNMSTcvcGl2U1I0?=
 =?utf-8?B?cUswdWxGMytxeHZsemR2dldoM3pybnJ6SE1BM0FSVW5PQnFvVGNRVlJ0Qk9L?=
 =?utf-8?B?bXRZem1pd3lSZ3dLQXRPSGdkc2dtL296cTIxQjZwMUREdGZSc0pSREt3SnNr?=
 =?utf-8?B?eWFCTTVXc2RnYVZ5NHVveDhUOEtyYWcxMHRnOVFrQ3huVzhQc044cDdRWENH?=
 =?utf-8?B?TCtQRTF2MHVORzlHaVRqY3dJaFovUlFFYSsyaXIwR3JYSjJkZHV3ajFGZC9i?=
 =?utf-8?B?YnVFMStVQkVCMVd3YkJLdHFveXZKTHRBS0c2bVo2cm55dWZyejd3ZDhCREQ5?=
 =?utf-8?B?a3J3djFBSFRLdkRGU05yZjcrTUZpSFZKdGRhRGlYZytHUU9UQmFxcWltK3B6?=
 =?utf-8?B?N2tSQlBBSmYxZFpVZXNCR2tDb0NXUDJWa3FmUWI3QXVqM0VEUXh4SE9FNmV4?=
 =?utf-8?B?N1JyRkhoVEF3NzI4TFhCVWFqK3c3L2FTbHRiQjhpcno3MU1MZkdoOVFmL0JH?=
 =?utf-8?B?YWE4MldmMHQrMTU4YUh1Y1hhNVFoZTMrSFZ6NDNyQWt4UGRxUzNYT1g3TWlB?=
 =?utf-8?B?Z2hqYnNxalZ0R09tYkxJTVRUVVlnNTJWYi9sekJHck5tcUtSRWxuNUI3MHJP?=
 =?utf-8?B?Yzh0dm1tSXpyRy85ZHJpc0NrUjRYTE9sYXVZL1ZHd3dzM21LV1N6ZWlBY29v?=
 =?utf-8?B?T0R0dTdTangxeDVLa2ZDbUt1VVBZenZYdmNESjVaN0xxMUQwUURDS3YrMEov?=
 =?utf-8?B?TllUVFVmWUVoVkthUVZtUWRha1JoeWJWRTVlKzVvSG94QnMrSEpkK0hISnhL?=
 =?utf-8?B?cDFVbGh4L3BZYUE3SU9oNlNiSUNPY3o4Sm1WbEZBZ2kzL2IrdlVDZU4vMnFI?=
 =?utf-8?B?WitkVnF5d1licGlOdXAzc1dyTmhrazFGeWlKNmZLbXlGeTdTaTVCUVZZNEdl?=
 =?utf-8?Q?m/ejRk487poDQaxHoH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a99c85-61c1-477e-2151-08de5a985e2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:59:19.7390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3hEB38UMIiBei4JEbB9rZ5QfeJZoA2qv7FjlDHeDvFCfovJZ9A8rmiL9lvj3bm8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7264
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,checkpath.pl:url,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: BD57B781B7
X-Rspamd-Action: no action



On 1/22/26 18:02, Pierre-Eric Pelloux-Prayer wrote:
> It avoids duplicated code and allows to output a warning.
> 
> ---
> v4: move check inside the existing if (enable) test
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  5 +++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 362ab2b34498..98aead91b98b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3158,9 +3158,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>  	if (r)
>  		goto init_failed;
>  
> -	if (adev->mman.buffer_funcs_ring &&
> -	    adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	/* Don't init kfd if whole hive need to be reset during init */
>  	if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
> @@ -4052,8 +4050,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>  
>  	r = amdgpu_device_ip_resume_phase2(adev);
>  
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  
>  	if (r)
>  		return r;
> @@ -5199,8 +5196,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>  	return 0;
>  
>  unwind_evict:
> -	if (adev->mman.buffer_funcs_ring->sched.ready)
> -		amdgpu_ttm_set_buffer_funcs_status(adev, true);
> +	amdgpu_ttm_set_buffer_funcs_status(adev, true);
>  	amdgpu_fence_driver_hw_init(adev);
>  
>  unwind_userq:
> @@ -5931,8 +5927,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>  				if (r)
>  					goto out;
>  
> -				if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
> -					amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
> +				amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>  
>  				r = amdgpu_device_ip_resume_phase3(tmp_adev);
>  				if (r)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 7006c58a6992..a441de678a83 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2380,6 +2380,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		struct amdgpu_ring *ring;
>  		struct drm_gpu_scheduler *sched;
>  
> +		if (!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) {

Please double check that checkpath.pl doesn't complain about the length of the line.

Apart from that Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> +			dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
> +			return;
> +		}
> +
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;
>  		r = amdgpu_ttm_buffer_entity_init(&adev->mman.gtt_mgr,

