Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D89B17761
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5216810E7EB;
	Thu, 31 Jul 2025 20:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R7+u9Z3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D969510E7E8;
 Thu, 31 Jul 2025 20:51:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xd9R6iuNEdectXfgZFxBE/dqBCkXJ+YuenaEa11YfxPRdusTP2N3NWiC13rMZZwmzIoRYQQOeU2HJLoJ1cAqr09DseCMJMkN8hPHIhug0eAsJbR9qk5khtkUAr5xmbrbjqWQN1qm0YxI0A9GwI75dgTOWXBvRHQTr8ZZdZFHIh9Sz6bSj3kix7y84B+M4WhCxBAYH86W0ExHNK1MHwOe8WY99rXEayR49JEh524dk6CWnTvRT/cCc36Pg+K27YyxL0gLeBqEvdRWzOPlFXwa51Nz1I9zekyMGpBg7fNIVfQW8ohyETUHZaOdnRqpFTGuxMGYpSHEKQWf1SdsEFzy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdooOoVa43c/ezIHa1LmbDGlXcYlt/vHTjU80eGE0eI=;
 b=FVx/p9RCaLg9Y9MuMo5WCu/fRWfKFIiYnyNLwvqIbotjFCBqjRQUqwJO0gDV+Nv0Ya7vfB/8KpHQDzp42JUOWdE0wI9tUfSIQugYNSCIGsHYWpEKAqUV47WRlETuUL+HQ1X+RCacX3IcJ/aSyRy/bpMd0DsPWgLOwE4ply0x33vkDUYDvlyBmL4xHkpuu3OjOrqXC4jO2GyJHJS8aj1SA0SvJ3dAiM6ZVJtQOAdax60vrfsEJzdbF3rTmymiER5S5uIVGaE5aNvmv0hElpCJoZLvu6WKsAnQDkB1IhYCsD/22V06v8nKLWevOmwpZiR8l/M5Vs1ZX7m7l+YE+G4feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdooOoVa43c/ezIHa1LmbDGlXcYlt/vHTjU80eGE0eI=;
 b=R7+u9Z3NoU0Fc6bWIFE6m9w+q1vy6EiJ4u//C1Zi9aMCJb0pY6iJa3ZpLWjeEjaHeGek0JDCu2BW7VQR/hXNVO++fqFfTobv+gcacLuRhPGbXvLSIqf4KtZfFmeHrd1GY+bd5731WFseJR0piNEi3ShI928EZthcTvNOZB+kOBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY5PR12MB6033.namprd12.prod.outlook.com (2603:10b6:930:2f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 20:51:38 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 20:51:38 +0000
Message-ID: <84a221e1-5675-4aca-a068-6f9408b96e40@amd.com>
Date: Thu, 31 Jul 2025 16:51:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/amd/display: Update HW_DONE_DEADLINE property
 value on modeset
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Leo Li <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>,
 Shankar@kaveri.local, Uma <uma.shankar@intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>, victoria@system76.com,
 David Turner <david.turner@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250724165220.1189129-1-michel@daenzer.net>
 <20250724165220.1189129-5-michel@daenzer.net>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250724165220.1189129-5-michel@daenzer.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY5PR12MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c50b539-f828-4f43-a46a-08ddd0740b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXRzcVBQcXZvdlhhWVlHZUovM0tOTm9hbzNtQ2c5b1pxK0ZSTGRXMlJkWUxS?=
 =?utf-8?B?QzF4VjNJMFBEN2xEUlVROFZ4UnhVLy9RL2VDeVNQSW1UNDYvZ2N4d1FYREww?=
 =?utf-8?B?NWNRTEtxMHJ5QlkvRWlORW9TdjRsZjVoK0N1dDZHeFBpNU1hSkw1N0ZQVWl6?=
 =?utf-8?B?OVFBTVFING4xK3pXa3oxdjYwa3llQ25wMXYwVTFLQmlxZ0lsWTlGTktDZlFy?=
 =?utf-8?B?QmtaZnFOUDZEWm5ZN2ZFMFFnbHhyanVTQ1duNUh4OFhOTXRpNU9KYlkvOVBr?=
 =?utf-8?B?cDJNR080QzFja2ZKYkVyelNzclArdzFNQ2Jqcmp3MWJrdys1VW1VTFNiaWNo?=
 =?utf-8?B?WXZOOGNDb0VrMkRlZUp4ajVqVENWR0h3UGhoODJ1bnN1dVFMaDM0RVdjQ1JV?=
 =?utf-8?B?bFpVOUNlSnF0TkJOK282VlYvMjJLSElrTC93UFpDYWtjcnQ3Vys4REdPaWll?=
 =?utf-8?B?MzdVby80eEw0NHVqMkJUZEhFVElaYVNSUGwwWmhycDE4d1BnVnBLa0xEaE1D?=
 =?utf-8?B?d0xzemM2WjZOSGZJRUd6SWZVK0FUTkwyUGVnYjIzVnpkdWhUQXZMa2d1TFd6?=
 =?utf-8?B?YUJpL2J4SUtEK2ROd0RSWUE3WFBTMXVhZEFhdlNsUklvNC9SYS95VnFUT2NE?=
 =?utf-8?B?OTljYzlXWlBQZ042YnAwNjk4U1l4elIxNnBnL094Q2dnL1RPV3lYemN4bzR5?=
 =?utf-8?B?RFd6bUYramhsekF2S2dnWldKUjRJNkFzV3BMZTY2a0hxYnh2ZitZQVJhRncw?=
 =?utf-8?B?T25RcHZLNVhqZDBkcTNlM09kRUlNYWoxWFRsZ2hNRUhyWGtTZ2d4Sk1lQVlV?=
 =?utf-8?B?amllemtnSUNJL0dHMkd2TnFBdnFtYS9zVmt5VXI0M1cyaHU2Qmplc3hmT0NG?=
 =?utf-8?B?MzhCOG5ON3lYQmJhWTVPbU5RZmlab2dyMTRJaUNIMDVCWWZmdGpRQTlzSVlu?=
 =?utf-8?B?aTVqU1JndFFRT2ZYU1dYRWVXb0RtNEsxdTlOVVAyc2VNa1VyVzdpNVRzZmlD?=
 =?utf-8?B?Rk1TdGdGbktzb0llbG1ITnRSaVRLcmtHWkFOZmoxRDZZQk5DdW1OOTB5b3Bh?=
 =?utf-8?B?Ukp1eXlIN0RSTThFOWN2YkVIR2JpK3ovZXFwbzY2T2h6V0U5RXpuMGpPeVZQ?=
 =?utf-8?B?NVJvOUljUHpkamE0TjUxekpmQVlXVStINTlqOHRBMmRHVnpXNjNDTDVYRElx?=
 =?utf-8?B?TUdiYUxnQTgxcE4vUEViNWtid2ZGWU85L2lmTTZ2Y2swRmxOd1NkRlBVRWRi?=
 =?utf-8?B?UlBtcWJHSm05MnhYY2FDNVNJS3pid1RyMDNVaGJmUnEvNExMbE1hS2F5UXhn?=
 =?utf-8?B?U3BzQVhJcFpJWWxMbHVnUmdqTVlMRk9OT0Ribk51K1pvNk1QTk5sSEREZE1U?=
 =?utf-8?B?cEFCS3lpQ1pndTFpYmIwVXQ3bCtORS9ZaEVzR2VsaHNjTnJYUERRREtOdHl3?=
 =?utf-8?B?a3pZaS9pdTBxUzVEQTlXZmtWMUJOQjRpZ1NTa0Z4QjF1bWlZT2g5VXZXaGN5?=
 =?utf-8?B?eStjd1VETHQ0WlpOZnB2TGZXNGEzK0RuNnJST00yWGg5QjZ2cnVvNnViYTJP?=
 =?utf-8?B?cFRnTzFiVXljVXhWZkQ4eGg0RnlabmZ6dStjQ3FlcWJUOEkxOGRMdFU2bGln?=
 =?utf-8?B?NEJJU0tkWWlZajRXbmV4Wlh1VExTUjlUZWJmaHpYaXpOSXJaLzJQRWdOWjFv?=
 =?utf-8?B?Q1FGUDRSLzdkbzV6KzZ3Kys1S1JOOEFyVmlGaVlGSzdHTTRqcVNqTHorMmk5?=
 =?utf-8?B?TENzdllrNnlXYkh3d2VMUnBGVWN3NmtjK0FvYzRoeGNNVEYvSW0wZVQrak53?=
 =?utf-8?B?aVBuNVAxZVI2MEltVzJtYkVhVlB5bFVwbXVudE03Z3BIdTcxUUZxTnFYSkpT?=
 =?utf-8?B?c2dZL0pGNWEyWWUxd2JiRWIyM3VKejZtcCthcVo0Y0U2ekZxRGQ4RlBkT2pn?=
 =?utf-8?Q?EMGc1xaCY9w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXN5M0tuMVV0Y2JXNjhlNjN1U3NlRHArM2w1dzlJUVdxazczWU5FeUgrUmE3?=
 =?utf-8?B?TVk4ZFBERTJmV25sOUdyd0UrRGQzbTgraGw4QnJDeGhLTWE5Vmd2TjRSUmJi?=
 =?utf-8?B?WWwwaCtuM0FMMTNQL0tHWU8zRDZHaGRISlNyVnNxbGU3dXFUT0FxSytXVUpI?=
 =?utf-8?B?RVdHZ3dXTml2OUI4Z1l4U2FzcjVUazVZa3piMFNReE43U0pqZXNTV3RNU3V5?=
 =?utf-8?B?U3hCa25wM2t0REgycXpCVSthZGYxWEZFeU1LUWtHOE5DZ0ZGMHZodzhYOVRh?=
 =?utf-8?B?TFlhZ2pnR0txWTA1UW9pZnpSNW9MMTFHVUl4eGtlbWF6RnZaNHduSmUwa1No?=
 =?utf-8?B?MUhVSU1HWGFyOXV4TTRhWGMyT3pWTU1OdTBydU1pVEVYNWFUQ1RoamxNdFJX?=
 =?utf-8?B?cGorZjhicXpyVFJQdnZyVHV4ZExMYjl6S01mQlJVTmhvbGpiNExkNlcyc2RN?=
 =?utf-8?B?cVZ6WDA5a1BNdVRuVWNTdHZvUjVWOElGajlVNnZVQXQwWXhKeS9pMTlvZTNJ?=
 =?utf-8?B?TVl2YUxQV3ZvTUxKMllzdTM0S1daMEhMQnlUTkVOYnBqcHNYLzYxOGFmbHJt?=
 =?utf-8?B?VUlaSVpnRHNrVVZuYzFCWDNONy9Va2dqREVNaGVlYWNFV3V3OVY2d3pXZEdj?=
 =?utf-8?B?TmVwbU45S1dJRnNjNkhhTi9HTjBZMzBRejJVMDh3NzBiM0V1UTJBM2hxWUtu?=
 =?utf-8?B?T2tOTHJ3TlVnNXBxdjFKY1F6ZVJVYVd5UHpLZGt6c2hrdWpBdVRwbHRCVHY4?=
 =?utf-8?B?UGZhUHNJaTAxZ3Q1SXdYLzNGYTJTL09hZ2RUdEFDRXMwSVAwMjFSQ2JsK29V?=
 =?utf-8?B?NDFFMzNNTGVPL2Y3YUF3MDlJWkxhbElzYmxwQmhrUkJ1QTU2c0U3QlUrWTlq?=
 =?utf-8?B?bWw5TS9XcnZpSGVVYml0dGJqK2RnWndCNlRCZDcxVHMwV01icDlKYm5waXAr?=
 =?utf-8?B?NWM4eTVIMmY2VlJCT0xsYWhSeE53dm1IeDNLYUNuMzNGZ1BGaEJsU3Y4amRS?=
 =?utf-8?B?Y3hwcFN3VkxlRVRsTkszeEJhR1ZpamxVanRWd09kVHZSY2VYbC9jUmtpZHha?=
 =?utf-8?B?QjAvSjlvcG5JWTJETGNRMzR2enl2OUJCR0g1VVZ2dHJWS2pSNWV4VGIvWHBn?=
 =?utf-8?B?TUQyenRubkVlWTE2MVBJVWJYTE9pd2J6QitYaFBUbXJxVWtQWmJTY1pXSnVN?=
 =?utf-8?B?SzZSWStSMDVVZFZHUENvazJYcnNpdW5pYlJWbEZ4MlF5VVc5MGkxaUp1UW1L?=
 =?utf-8?B?cDVRY0JNcTZWdGhHL3ZwTE4xMWNjVkpSRlY1UFpIL1FmaDlUeXNidjBjVFpn?=
 =?utf-8?B?cFYzbWhQb2RIZXhLOXpCbG5HQ0hxcVVqVkVHQUdpWWdpS01RZmZTOFcwUlZ2?=
 =?utf-8?B?NTlUcC9RMDEwYXVuN25TRVhXcFVWa0NSSlhvRlVEaGRmMDhzeUhhQlB0R0sv?=
 =?utf-8?B?aXNGRE8zOHFRWlBBMnVhd1hxRithMjY2VTJ0aGJQa2dLM01sOEJtOWEzR2E5?=
 =?utf-8?B?VytPWlFHQncwekEyVFlKSS9EYVF5WWhBU2hTeHVFQmNlWmc1Uk96NmJPdklZ?=
 =?utf-8?B?RGEvU0NEQVUzd1FaZGlhY3RMQ2IrUDIzbDd3VnNMNnAyVW1oN0REZkRTc1By?=
 =?utf-8?B?azhjY3h0c2pEc1FYSWI0Zk1MYnNFOG9mNFk1Um5ZUU1lYktPUU0wZ1Z6RlRk?=
 =?utf-8?B?NVg0bDhZdWtHT2l3SUkrNVNUdkFqaFovS2hqL2xxeTYwTlZNTS9jL0RYQXYv?=
 =?utf-8?B?YTQ4b0RyRTdiQk5GM0NsTGgxcktlaVJ3L25iaHNhWXRJNDN3bVJId3p5bjgv?=
 =?utf-8?B?d3IwYVE4Vi9tMWxKeENuOTBMcGZ4bmdDUHJRVEpmTWVQMUlER3huM0lBUG5x?=
 =?utf-8?B?eWM1SkpNMnhOQzJPTXVwSmtoTldwMlZoRHFEdm4rZTZ5b1NleXV2NEZtM3NO?=
 =?utf-8?B?T1VEQmJDRVRVcHJFeFRyTFpoNmlsd09kVkFHQUZoelBFTW9VZFZiYzBQZE5X?=
 =?utf-8?B?Uzh1N0NZNEFDNEpqaUZWc1ZBQmkrOG0zNmNSMTM5Q1BhSzVHc215dVJ1SFlu?=
 =?utf-8?B?UVVKUlZzQStyMFRmK2x6YVdEalkyTEYySUY2SWpoRy9iOGJUR1Q3Q2cvdmxP?=
 =?utf-8?Q?yTgnYJtkSrgitslKaxLFJG0IU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c50b539-f828-4f43-a46a-08ddd0740b15
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 20:51:37.8766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OjasDO6yrsnCnhKBVbCMbWrdrPDnpXsHDkvHcsrhX7kiDGP0OzECdmJNx8G9gtR8rxGjYk3eeEKsB7DwuN0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6033
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

Thanks for the series. It makes sense to me.

Below are my thoughts on the deadline value on amdgpu.

On 2025-07-24 12:40, Michel Dänzer wrote:
> From: Michel Dänzer <mdaenzer@redhat.com>
> 
> Set it to the end of the front porch.
> 
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0b8ac9edc070..e78249b55345 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10021,6 +10021,21 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
>  	drm_writeback_queue_job(wb_conn, new_con_state);
>  }
>  
> +static void
> +update_hw_done_deadline(struct dm_crtc_state *dm_new_crtc_state)
> +{
> +	struct dc_stream_state *stream = dm_new_crtc_state->stream;
> +	struct dc_crtc_timing *timing = &stream->timing;
> +	struct drm_crtc *crtc = dm_new_crtc_state->base.crtc;
> +	uint32_t deadline_lines, deadline_us;
> +
> +	/* XXX: My guess, AMD display team to the rescue! */
> +	deadline_lines = timing->v_total - timing->v_addressable - timing->v_front_porch;

This works on DCE. On DCN we'll need to take the offset into account.
This diff on top of your changesshould do it, but it's not tested.
The dc_stream changes probably fit in their own patch.

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 629fd21a611f..314074527216 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10082,11 +10082,19 @@ update_hw_done_deadline(struct dm_crtc_state *dm_new_crtc_state)
        struct dc_crtc_timing *timing = &stream->timing;
        struct drm_crtc *crtc = dm_new_crtc_state->base.crtc;
        uint32_t deadline_lines, deadline_us;
+       int vupdate_offset = dc_stream_get_vupdate_offset_from_vsync(stream);
+
+       /* note:
+        * vupdate_offset is non-existant on DCE and function will return 0
+        * vupdate_offset could be positive or negative on DCN
+        * vupdate_offset depends on timing and HW bandwidth requirements
+        */
+       deadline_lines = timing->v_total - timing->v_addressable -
+                        timing->v_front_porch - vupdate_offset;
 
-       /* XXX: My guess, AMD display team to the rescue! */
-       deadline_lines = timing->v_total - timing->v_addressable - timing->v_front_porch;
        deadline_us = DIV_ROUND_UP(deadline_lines * stream->timing.h_total * 10000u,
                                   stream->timing.pix_clk_100hz);
+
        drm_crtc_set_hw_done_deadline_property(crtc, deadline_us);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 4d6bc9fd4faa..ae8472a65247 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -1224,3 +1224,25 @@ bool dc_stream_can_clear_cursor_limit(struct dc *dc, struct dc_stream_state *str
 
        return can_clear_limit;
 }
+
+int dc_stream_get_vupdate_offset_from_vsync(const struct dc_stream_state *stream)
+{
+    struct dc *dc;
+    struct resource_context *res_ctx;
+    int i;
+
+    if (!stream || !stream->ctx || !stream->ctx->dc)
+        return 0;
+
+    dc = stream->ctx->dc;
+    res_ctx = &dc->current_state->res_ctx;
+
+    for (i = 0; i < MAX_PIPES; i++) {
+        struct pipe_ctx *pipe_ctx = &res_ctx->pipe_ctx[i];
+
+        if (pipe_ctx->stream == stream && dc->hwss.get_vupdate_offset_from_vsync)
+            return dc->hwss.get_vupdate_offset_from_vsync(pipe_ctx);
+    }
+
+    return 0;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 5fc6fea211de..792a7e8b2ee7 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -601,4 +601,6 @@ void dc_dmub_update_dirty_rect(struct dc *dc,
 bool dc_stream_is_cursor_limit_pending(struct dc *dc, struct dc_stream_state *stream);
 bool dc_stream_can_clear_cursor_limit(struct dc *dc, struct dc_stream_state *stream);
 
+int dc_stream_get_vupdate_offset_from_vsync(const struct dc_stream_state *stream);
+
 #endif /* DC_STREAM_H_ */

Harry

> +	deadline_us = DIV_ROUND_UP(deadline_lines * stream->timing.h_total * 10000u,
> +				   stream->timing.pix_clk_100hz);
> +	drm_crtc_set_hw_done_deadline_property(crtc, deadline_us);
> +}
> +
>  /**
>   * amdgpu_dm_atomic_commit_tail() - AMDgpu DM's commit tail implementation.
>   * @state: The atomic state to commit
> @@ -10419,6 +10434,13 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  	/* Signal HW programming completion */
>  	drm_atomic_helper_commit_hw_done(state);
>  
> +	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
> +		if (new_crtc_state->active &&
> +		    (!old_crtc_state->active ||
> +		     drm_atomic_crtc_needs_modeset(new_crtc_state)))
> +			update_hw_done_deadline(to_dm_crtc_state(new_crtc_state));
> +	}
> +
>  	if (wait_for_vblank)
>  		drm_atomic_helper_wait_for_flip_done(dev, state);
>  

