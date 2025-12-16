Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5715CC1D8E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF9F10E753;
	Tue, 16 Dec 2025 09:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5NS+1V75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010030.outbound.protection.outlook.com [52.101.85.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FDE10E753;
 Tue, 16 Dec 2025 09:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVVLAPI5QZADduJW8N8fbmzPfsV9YSM89XpT/myz2q1vXcBD3BFu040NgJUq1Wr+PwXBn5hCIIQmIQA60rikLqvkz7eToj8/c6AxdfKEtKmZy7wphnN41wRroYoOknbp06O6E62V6dyiAmTzfq4df3xcghaLrelq6fCFNZeaBhrE4FI2rybb4N6sipkhe4bPTgfaX/Lh4HfJnE5vVop5OQ4RObRu00vreecEbGAQd+Pbx7OoB9Z2h1eMfWpIW/nWTY6hr7lk8305UG9yPHau06oNVrIhzmS+oigsUb+rL7I0+Me0p4+Lj5tw6rYDowc2kF0/GaQM/S0sRZwMi8E/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de6VYCDKblq46nJjiRvypEAJkLKpNjJokKGCI2pvzDY=;
 b=Yv3d/f8hDmUqqbtG8HnH150uYSIsPIYWsZBYAQmMkIvd4Zt/1HDyMIvF43km4bck1/ctgvZzVwDsvlcyFW6tFDMwbAmhWivUdO1KB1lkAK/sn/o9HBk1dSpWMXlf1XVK3TQlKrmVpLNN+7JVlVVMJvlksopoiN7opmQk9S28OoiT+x7kBIoSjpKHc89ypjvoPcrWy79KyeaDB9xQgNB58l865D4TdzHh3vLYK3dDKBc7Da4oIA3UmIAzc21IMGC9TY7OP4AIftba68TJf+TXR2aiFk6iTkuSk3wzx+PtC/RvQlnxbv7ZCETIOfSsZf59mb6GWMfTsoium0qvLrylaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de6VYCDKblq46nJjiRvypEAJkLKpNjJokKGCI2pvzDY=;
 b=5NS+1V75H4U2S9uqfeaLGsYAb46gh/mIr49Z9U5f03MlxDBRD0hEiLbwGpqCqZEwsierkmdbO3CDWKc/faopVCdsb2LuAzdzJdMpztf+/BGeOjuDqqykdb2CE/qirS5hoix2Q0iDIUqNgjKYTY9Hx3Q5C+SAK7FX12hwGs6ERuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by IA0PPF7D094C5BF.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 09:43:36 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:43:36 +0000
Message-ID: <1d54ce3b-fbdb-4d1a-bd07-576a6ed85ea5@amd.com>
Date: Tue, 16 Dec 2025 15:13:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
 <20251212-vram-carveout-tuning-for-upstream-v6-4-50c02fd180c9@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20251212-vram-carveout-tuning-for-upstream-v6-4-50c02fd180c9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::12) To SA0PR12MB7091.namprd12.prod.outlook.com
 (2603:10b6:806:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|IA0PPF7D094C5BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b42c63-99c0-429d-b92e-08de3c879548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEV6d3BNNnVkOTdmY0xkVGJjazJFMVdBUmpJTmV1WE96WEh4TDFqeFNiakpK?=
 =?utf-8?B?V09zU0FPR2xGcHZYeUxVdExNZUc4MTRtd0hkWHpqcGNpTlNsekR0MTJtVlJ1?=
 =?utf-8?B?aC92MCsrZ09yVGZkSkMrWksxNk12UG5JVHBkMnpURlVlOERqdmFocXRvZU1Q?=
 =?utf-8?B?YXVPc1RFaWtEMWRHK2dFTmhuRTFuZzBqU2J4RTRCbm1OQ3dITWFKdGdkWHdT?=
 =?utf-8?B?Qi8rSkZWcGRnK281eFZDUUtsZ1kydG8xNDdGU3hUa3lia1lOT3ZWOEttbFVa?=
 =?utf-8?B?QklDaWdqeThEUGdQbGRrditjOHhRWFhqd3l0VTJGN04xWm00WXdxSDB3dTNI?=
 =?utf-8?B?MW1relhmUTNKM3M4alJjUmRvZXgxbUNVV25McmdzdlMxdTRiUVF3Z283VVN5?=
 =?utf-8?B?QlhWTTkwQUhTMmUxcXpJSWk3eFdieGh4MjBYblVQdlMyT3kvWGJpWE1uZEhi?=
 =?utf-8?B?eDRybngwaWhhTS95RmllcjNOZzRBTTdPQ0owV1p1TU9ENlJHcWJNSkljdXBk?=
 =?utf-8?B?T3ZUVXNtcjBwdWpFU25jWU5USEtvMDJFcG5FY1ZuQS9kQkEyTUhZYkZrRlRF?=
 =?utf-8?B?UzVLWHFCNURmdnZZbXhpaThsR3YyeE1uTUFaTit2M0xrWlFqMmgvN2NQcmo5?=
 =?utf-8?B?aE04K01QOTE0M3BUUHZjYkdMaGM5Y0FBTjRrZ0hnaFAvNDJXeWc1dHlwMEFK?=
 =?utf-8?B?aUE1bjdxSWYvRFlQQ0xlSGZpYi9DRHpmWjl0cnhQM1g0K1M4NnZ1dTBJRTA2?=
 =?utf-8?B?ajRMa0YwTFZxazN6enNVUDM0RmtkbjNsT0F1SnZxU1d6OG9mTFR5c2cvcG05?=
 =?utf-8?B?K0FnbFA3dGlwbllsV1VxbWFudXZ5dEM4QlFzbDdwb1BPaXhtbVlBWE9mQW1B?=
 =?utf-8?B?bzRNaWkyWGEyak84UVVCN0UxMjJUUFNwWW96MUh2VEpSeWUrSENFbVg2SjlF?=
 =?utf-8?B?Z2hkOVorUmd4ejFQMUFYODFUbU1jSmJWTXU0MWxKekNmRVgwYjkwa1NCNFpm?=
 =?utf-8?B?cENOTmQrbHlheXZSRjYxbENFMVZpLzBQV2V6QnN2eDhYMUI0VXRtbkx0NG1r?=
 =?utf-8?B?SlcvMkI1dnRYYmFwM3hzbGFqV2hsbXZ0VkV4R1ZPM2RmeGdhYnRUUGQ1TGFJ?=
 =?utf-8?B?Rk9kL1R6QXNjM3VXZ0lJMDFnbmxPT0VyOGxwaGkyak00WVBBcG9FZytTU00y?=
 =?utf-8?B?UXplakpHanBoZWRQNncrb0I4UnM4VVRUTC9OejJhby95SEI4d0VTL085c3dL?=
 =?utf-8?B?M0p0c1RJMWtseHRNRWlZY1dnYmpJenp2K084QTJTMjlVWDVzaVhNZDVkNlBy?=
 =?utf-8?B?QjNHSVViN3RPWlZ0VmdSNm9CZUs0c3lHc21sS3ZXSHZNeXpmamp3UUpBRHdn?=
 =?utf-8?B?NS9sWXpLYWZvenUzNUg1aGxvWUpFQ01kb0xkd3grVzVqSFl2RFJrV1NtK01t?=
 =?utf-8?B?MUhiMytpNXNYM2MzU0FWS2paRUsyY1Z0dmNFaGpCT1g2QW1BSEU4cHR3NC9n?=
 =?utf-8?B?cEY2OGxUYWM1L1VCTVZhNVpuQXRNRmpERm0xQVJkN0lBS1M4MzdZa0dTUmtF?=
 =?utf-8?B?RTQvZ09NVnJhdHpjZFl2dGx3YUJhby9OZFhKa1VJZDNycUxqcWJza25kU3dU?=
 =?utf-8?B?WTVGa2ppVlhMNnpXdzkrbTYrMjlzcmt0KzBocTQwN3R1TDA0a0pObkcyb0Jt?=
 =?utf-8?B?bnlZRlpsMXRXUVVJTzYvUXJ0U0dIeHc0dWxrWGFnRjdkcDNBdC9pVUhsQkpJ?=
 =?utf-8?B?QnBXa0ErTDFIV0pRY0FKUUJ1VXBMWXZLeGp3bXhSL09XK2xKSGJzS1JqYjM5?=
 =?utf-8?B?OHhtZy9TWDk4N0NENFVMbFNlMTdJOG16WFB2MExFNC8wbXNFeHZGM1NyUHdZ?=
 =?utf-8?B?TXAxMjdDYy9QSE1qMXY4UGhwOFhoSGtWUi9ORThRZ3FHYWRYdDZ0dGlPQkky?=
 =?utf-8?Q?vMoPR91atMU2FppcKDcPM1gCWm5KGnUy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmN2N3d6VG5DUDIwMVlEZldmQjNxS1V6M2pjbmY2SnpuaGhzYWoxdTBWdmw5?=
 =?utf-8?B?MVJoajB3UVBlZ2dzdWF0SXpHdnVlR0FoV2pHSU10M3ppUWE3TWxtSWptTUdS?=
 =?utf-8?B?MHEzYjdxbHljVGN0cG14RlhpMFZVc2t3QWJrMFR6MXVOWFVDN3I0N0hZbTBV?=
 =?utf-8?B?V2dhNnZYcTQ0RXd0SHJnRkJRb1R4VjZrOEFCZytSaDJpZ3J6cHJkNUhCc291?=
 =?utf-8?B?N2d5UmI5QUs2VGd1ekFBV3M5TjYzWTdUOVB3aDdvTDhRdzJPM0ZJenhuMU5F?=
 =?utf-8?B?NGJpQ0hkUkhRK2p1dkduTEFwK1lMeExOeUwzUk4xaFdxekZ3N2hiaVVUa3N4?=
 =?utf-8?B?Y0JsclhWK3pSejB4bjRFYitvVzZhQ0VVM0pGS1pWOVdpaGpDMUtJVGphbSsz?=
 =?utf-8?B?VEJRR2lxc2hHNEpOWTNxM2tXdDNyeCt1WnRNRHk1ak0yeVJsUjNwK2VhbUNE?=
 =?utf-8?B?MCtQQzRjM3NMYUE3MzFvYkJyTURjQWo3R0hITERSZ0RaUjEwQkgzejN2VmtB?=
 =?utf-8?B?czBYNk9mTEZjcFRmRlZpdDJUSE16eEovMGprNHNoWS9Ha0VYVFZBUGlLZitB?=
 =?utf-8?B?dUt5TUZ1N3JWenNMRFJWclVrUFRnWnVncUVvdjhoa0lBTHd5ZU00RXVYa3dx?=
 =?utf-8?B?RU0vQ3h0RzN5UWwvU1EvV1M3WWVaUXR4NXB0RUg4Nkd3cDhCQjh4UFJVd1Yy?=
 =?utf-8?B?THdDZGkxRUprMUxVQnI3cXdlZmhPck0weWVzbm9UVWNLK2E4cmhyamJ2blRW?=
 =?utf-8?B?K3VXRWlpbkVEV0Y2UUEwVlMxdmJZOFhNZlQzeW04Y0Z6TXFZZmZCVXlUL0Fv?=
 =?utf-8?B?V3d1VlNsbUdCM1cvTCtJNXFud25iQmJua3Bwd0g1aUtMeVpnbmZ1dXNscGpl?=
 =?utf-8?B?TkdINmNNbUVmcFpUTWRBNE9LUzFHbTlEMmt2blQvYVc4ZVY2WFpFdG9HL21Y?=
 =?utf-8?B?L01MYkdLbkNNajVDM3Y5MVZRWE0xdWI0MlVqVmtoWnNZdWFFUks4aEF0RU1l?=
 =?utf-8?B?NHhsQzkxTjd1T2EwWWhoOFRCU0hjWGpETnNFNEZhWVJNVXZFd2JPanFkSWU2?=
 =?utf-8?B?M2FMMHRzVDczTFR3TUorT1RlWDJic3hQUURBQXpHZDdMY0pjeW12UUN4Ym5V?=
 =?utf-8?B?R1RNcEUwSy9ObjI5dk5UV29wYlVjTnFNbzlWS04zOWp5QXpoWnFkZ2Q5RG1n?=
 =?utf-8?B?dmlKb3Z3VUZRWnd1RnhhbDNXZUJ1dEQ5NDYyaUZKTE1VSDR3SU9CUEFVcTNB?=
 =?utf-8?B?SStJWVlBejFqMHZOZnNyczRSTlhGNElkbnNPOTlYK1h0WUc4ZHNSeWR4N0Mr?=
 =?utf-8?B?SDVzeGhxa0JWVVhrR1BFOHM1clB5TVdJbytmTmJsb2xwV2NTV3JLYmszcjFF?=
 =?utf-8?B?Ykh2NVF4MyticDlhSk9uVzExU2hBUTUvdytBcGkvdWk4SmNOTms0czRsK3Vp?=
 =?utf-8?B?NC9UTkNtVTB4cy9QcVhnbDlNcU9wZlhVRzdSQXpRUWdDWnNJVDBMYmJlWDNa?=
 =?utf-8?B?QWoyVGxNL09CYy9UNHpOSzRlOG1oRHR0bWFBa3Y3bHhVUnJNUmtnVmxvV1U1?=
 =?utf-8?B?Z3VlZGJjMzkxY2NrTU12TDBCNnFmMW9RZkFFK2FyZktTNXZUS0RId21tQ2gw?=
 =?utf-8?B?RGJjRWZkaGM3RU5qYzVjaE5FYmVWR1NUZUJnTmNaSm9kT1hPbXZ2OGVvYXow?=
 =?utf-8?B?VnRxdWlabnpPVzBmYnNUQUNqMTdSVWtiUlNybTgybXMwVmtMWWxvc2o1VS85?=
 =?utf-8?B?UWNJbklkOER1RzhkeEMxUUg5NkE0d3FrYUNDZFdjRTRTRWZvLzhPT2xRZGFX?=
 =?utf-8?B?TUdBMjZVdnF3V3U4T3QrbmFzNXVOUVpWeFpVUjdKM0h0RncyQ2drTE5OSGNL?=
 =?utf-8?B?MDYyYW1hdGFPV2FkbjYzV0dRZzQ4K0RXclI0U3l2OFowRzVRQmFTeS9JNmlW?=
 =?utf-8?B?Ky9STUZIWWNiWE1GeGo5S0dKNStpTTdVNEtSVzdNd0lZdkJIWGZiaDFobjUx?=
 =?utf-8?B?UkUweEhWYUMrTkdwUFVZeXh5YkxVdnQxSTZucy9TZWhubnF1MFNhWTlBcEtX?=
 =?utf-8?B?b2w3dUlMazhUQlRhRkF4Z3BHK3ZFSzRuYWtadmlCT25EZVYzVVRPZXZ5NUxj?=
 =?utf-8?Q?6GUeTeI64mkixApOny0rUKMn/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b42c63-99c0-429d-b92e-08de3c879548
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB7091.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:43:35.9554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/yYp375Ua5wmbEnHXANCNWVXCdlpD7Q0/Y7WWU8qaFJrBXFPAxbACWRBes0FrBg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF7D094C5BF
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



On 12-Dec-25 1:29 PM, Yo-Jung Leo Lin (AMD) wrote:
> Add a uma/ directory containing two sysfs files as interfaces to
> inspect or change UMA carveout size. These files are:
> 
> - uma/carveout_options: a read-only file listing all the available
>    UMA allocation options and their index.
> 
> - uma/carveout: a file that is both readable and writable. On read,
>    it shows the index of the current setting. Writing a valid index
>    into this file allows users to change the UMA carveout size to that
>    option on the next boot.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 143 +++++++++++++++++++++++++++++
>   1 file changed, 143 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 903c4706040d..e78e6982312c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -36,6 +36,7 @@
>   #include <linux/pci.h>
>   #include <linux/pci-p2pdma.h>
>   #include <linux/apple-gmux.h>
> +#include <linux/nospec.h>
>   
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_client_event.h>
> @@ -417,6 +418,146 @@ static const struct attribute_group amdgpu_board_attrs_group = {
>   	.is_visible = amdgpu_board_attrs_is_visible
>   };
>   
> +static ssize_t carveout_options_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
> +	uint32_t memory_carved;
> +	ssize_t size = 0;
> +
> +	if (!uma_info || !uma_info->num_entries)
> +		return -ENODEV;
> +
> +	for (int i = 0; i < uma_info->num_entries; i++) {
> +		memory_carved = uma_info->entries[i].memory_carved_mb;
> +		if (memory_carved >= SZ_1G/SZ_1M) {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved >> 10);
> +		} else {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved);
> +		}
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RO(carveout_options);
> +
> +static ssize_t carveout_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +
> +	return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);

It would be better to show the size along with the index.

Regardless, series is -

	Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> +}
> +
> +static ssize_t carveout_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
> +	struct amdgpu_uma_carveout_option *opt;
> +	unsigned long val;
> +	uint8_t flags;
> +	int r;
> +
> +	r = kstrtoul(buf, 10, &val);
> +	if (r)
> +		return r;
> +
> +	if (val >= uma_info->num_entries)
> +		return -EINVAL;
> +
> +	val = array_index_nospec(val, uma_info->num_entries);
> +	opt = &uma_info->entries[val];
> +
> +	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +		drm_err_once(ddev, "Option %lu not supported due to lack of Custom/Auto flag", val);
> +		return -EINVAL;
> +	}
> +
> +	flags = opt->flags;
> +	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
> +
> +	guard(mutex)(&uma_info->update_lock);
> +
> +	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
> +	if (r)
> +		return r;
> +
> +	uma_info->uma_option_index = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] = {
> +	&dev_attr_carveout.attr,
> +	&dev_attr_carveout_options.attr,
> +	NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group = {
> +	.name = "uma",
> +	.attrs = amdgpu_uma_attrs
> +};
> +
> +static void amdgpu_uma_sysfs_init(struct amdgpu_device *adev)
> +{
> +	int rc;
> +
> +	if (!(adev->flags & AMD_IS_APU))
> +		return;
> +
> +	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
> +		return;
> +
> +	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev->uma_info);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
> +		goto out_info;
> +	}
> +
> +	mutex_init(&adev->uma_info.update_lock);
> +
> +	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
> +		goto out_attr;
> +	}
> +
> +	return;
> +
> +out_attr:
> +	mutex_destroy(&adev->uma_info.update_lock);
> +out_info:
> +	return;
> +}
> +
> +static void amdgpu_uma_sysfs_fini(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
> +
> +	if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
> +		return;
> +
> +	mutex_destroy(&uma_info->update_lock);
> +	uma_info->num_entries = 0;
> +}
> +
>   static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
>   
>   /**
> @@ -4492,6 +4633,7 @@ static int amdgpu_device_sys_interface_init(struct amdgpu_device *adev)
>   	amdgpu_fru_sysfs_init(adev);
>   	amdgpu_reg_state_sysfs_init(adev);
>   	amdgpu_xcp_sysfs_init(adev);
> +	amdgpu_uma_sysfs_init(adev);
>   
>   	return r;
>   }
> @@ -4507,6 +4649,7 @@ static void amdgpu_device_sys_interface_fini(struct amdgpu_device *adev)
>   
>   	amdgpu_reg_state_sysfs_fini(adev);
>   	amdgpu_xcp_sysfs_fini(adev);
> +	amdgpu_uma_sysfs_fini(adev);
>   }
>   
>   /**
> 

