Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CDDC07429
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500CF10EB09;
	Fri, 24 Oct 2025 16:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dxOOrx0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECD710EB08;
 Fri, 24 Oct 2025 16:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJgJofDI2bbm4MZ4tSScnC0Q43Qd762SM7Qx2e8UKE+Bti7gwBKYKwZBUtSp+YEN1+w3+9BFf41OHBG/O/Vwn1zIIIkQnC7rQhgri9O3839sBt/LBKsqezyHPNbruhjsebt5Y67ELgta5ho8KNYtaZ/H8P5fZcxDBHPDseE35PpePM8keS4RuSQkAbDtCkxCLFjMF42XXhNH5MhoRgBFOMO7/4hV2P7YjGTwyvjobNnP8F1BSFCD+LMhSB8gxHDPFfM6eSxfQlOj76WnxnCF4Y3rtXUypMT/0fEuY8Oizo12mGvzO8edk6TbGJfRVCAtR2dMJM/LS1FB/oYU+3qzzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D357MAsxIY9szf58j5P4OjN0Lw67Zd9z0yAx4Pc8eN4=;
 b=nxnqtv8C0mzMSMzXQoN9dRb1tQhcrDGN4jmrBxVUw1XvjZi4y1w72TGt5WFzWd3sz0U13s+ch1Ec10DI+k4KVAOfXdc3ReQGGusxWJ7eCKlMOu/4tdmz8jKTE/faxzW1ekVcoGKJ0eY8YyPmfJcWRt+Xt0foMDov5Tfacy1bCNeiT+y1tTkdh5gXUWHxg1Yu5KKjNuioVwguYUa68W5+ijuZXZGH+1CO2y/X0///wMhk/XEhsDgEviyrNVLDnsO70SwRJJVkscZpnrGRXWN46quV4nyyO1QFRhC1ESS3InFzMtNyWBQITtFZZM3YJi6wWagZFIFqlsQZmWav3Z5zkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D357MAsxIY9szf58j5P4OjN0Lw67Zd9z0yAx4Pc8eN4=;
 b=dxOOrx0QaMCT87Ql7M4Hh9xZk6CVGbV2tA7NZT1m7Z8oEaVHX7Jim2KEfAS8pKhcYwYFZod5fswpzdyEI97/+dywehWPihSR3PJt9vnskFaz+SsXaw0qgvrtCs5qDQxTMUwu2v5pALGFLGbynNb7VAcQAFmWOv1on/4lIhrc870=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8846.namprd12.prod.outlook.com (2603:10b6:a03:549::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:20:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:20:34 +0000
Message-ID: <27439123-98aa-4096-a4e4-3c8eecb3aaca@amd.com>
Date: Fri, 24 Oct 2025 11:20:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] drm/amdgpu: only send the SMU RLC notification on
 S3
From: Mario Limonciello <mario.limonciello@amd.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan <perry.yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-4-lkml@antheas.dev>
 <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
Content-Language: en-US
In-Reply-To: <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:5:80::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 2462b5d9-4a43-4c75-7a07-08de1319428c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXg4TGN3OERQVFh6bURINXdqOVJKTGxrQmNCcGFUS2ZheE02RDl4NjltcjZX?=
 =?utf-8?B?RVByYWcwTmh4RTY4R2Q3ZC9kOGo2WVEzMHlqMEpGdXBhcEcwNkNhblR0Uldo?=
 =?utf-8?B?OVNYU1ZqZURiL05FTStrbVFyVkg2ZjFsOXAyUldidS9BaHRoQkQ1dlBUYlZI?=
 =?utf-8?B?NkdHd3ZCRFlMQnZQaFlIVVl6SEtJdWJNSnB3S2gvRWlTZ25vN3pUR2FXUmww?=
 =?utf-8?B?RzE0YWZtSmlCbHZob0Z1N0FWV0I4Zm12cjdTZXVoOUgwSmU4TjJJQUNDZUlK?=
 =?utf-8?B?ampYZ2gwWW5pMklYZGtWUitpTXpSYmxhL1RQbllkMGVTVTMwTzl4MFo2eEhV?=
 =?utf-8?B?dlRHQnVGVEcvUGIyV0VWZmZCenJrdS9oeGlXcE5tbG55Tkd3R3ZNdFVlMjZH?=
 =?utf-8?B?ZDhITHptNXMzU21TS3FiazcvRExiTVJJZ2pZcXhLRmVvQ01lQ0M3WWppTmlv?=
 =?utf-8?B?ejMvK2NScUlMWWdkbUUrYWNiNFZMZURCWU5kajZGWFp4eXlJb0dkNGN6VDNF?=
 =?utf-8?B?RVFzL3lua01PRzAwV1NWbmp5a01ldnF5ZEZORWJ4cEhVTnR5Q3VrM3kyNHVW?=
 =?utf-8?B?RUNoUUVrZThCNWhkS3F4OGo1NTlQai8xZVR4aUNpb3hyVWhxVndkODVFdnpr?=
 =?utf-8?B?ZUxMcDFWMHhYNHFnUHJvUktKbWxROStQaVlqVUdvcDRCQmRIcUhudmJOVXdE?=
 =?utf-8?B?VUluRm5zQzAwMkVCd2I5enB0WFdvMGw5TDh0S2dONHgvaTNzSHIwVmlRWXZz?=
 =?utf-8?B?ZDBOVjlRcHgycGwwNU16dFZTaTFwYW5oTCtwQTB4Z1d3VHJHdDFPcFNoaito?=
 =?utf-8?B?Rk13VVdEVUdTU2tDMkR4VFY3T0xwVjl2eHR4U1prWnRjV3ZtbmUyWWhzeVRN?=
 =?utf-8?B?YXc3SUMxV2xDRnJCS2V1dUdzS2RsdzE5T0NMRlNqdmk5UnB5bDlXRnpSbXR5?=
 =?utf-8?B?dklqRTJnQTUvVXlFY3dCMnlIMmdDVXIyMHZqRzBTY01QRU1oTktDS0FocEFW?=
 =?utf-8?B?K3N1YWUvejFtYlZUV3J6K3ZQT2orVFFTZXhPeFlIMkh0Q0tRS2UwUGlsdktp?=
 =?utf-8?B?WlJLaGJnZ2xFWGdUWUMrWlZ0bGl6V0ZLQjlJUTlRMkZTd1JmNlZpemZmV05D?=
 =?utf-8?B?aDFBWndMNUZWeGVxeitKTlhRTktkcWorZktXdW00d2hHNjVZWkEwRjNDaXNX?=
 =?utf-8?B?bDJCNFcxNUptTzd1MW91eEZiclN5WFVWYWxqMmFMN2ZDQ1lSMWdyVmN5cndL?=
 =?utf-8?B?N2xqaVJ2ZmVlaWNQa2xoWlJieU44VTZLbjg1eHMrbzNCbFRNUkhqVEVsYVpp?=
 =?utf-8?B?TEFjYzdzbzlFbDF6bldldlo5QUtlcG4yUzhuRFZHWHkycTdpUVcvbmtUL3ZQ?=
 =?utf-8?B?M292Yjd3VjRjTlpibUxLQTBBTitCdUJvQi8xMi9uWitRV3dHYlVzWmh5aDJt?=
 =?utf-8?B?WDNuN3Ryc1VydGpxdGxiOFpMbm00YkI4Z1AxYXpMWGJ1TW95RXp6MVdIZDgx?=
 =?utf-8?B?YS9RWDRHRXVscUNmWkcvTHBETDlYditaNXpXRmhNNTdlSThMUFh1WHhxdkYz?=
 =?utf-8?B?UytXTHpNM1JvdllZcUpnMFY5THJWOGJSMGJJOXJlb1U3RmVURFZXSXB6ODdG?=
 =?utf-8?B?T3JpczE1Tk44emVSVmRVVUxmT2ZtY0s1L2IrM2I3SGc1WVZPcVZwZDdlVFdk?=
 =?utf-8?B?RUYvemVBaTVCamxWaHc4YnlmTURybzBVZlpkMHhMWEwvbnRXQ0NJUlNGRE1l?=
 =?utf-8?B?QTZkc2Q2dmtnYlhxUmVEZUZNTW14VWRwZUJIdklNOSsycnQ2aVBxcWM4QjBo?=
 =?utf-8?B?dS9ncFZXZDg5WDZlR0ExMkp2cVYwOUNTQkNhNXYvQUlnM2VmWGNCc2FDcFhs?=
 =?utf-8?B?d3lYRisyV0FNWHo2bGlzZEc4WUw0WENvcWZVYzd6TGFKcnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3FNczZ4N1dUWXErVUJEWnFxVmxxTFBSYVU0bTY3ME12N25qUitnemxqV3Rm?=
 =?utf-8?B?S20vaEVPc1h4bDVMTVlPNmJaNCs4SlNsM0R4RjJ2dFZ5UmpWeUJWTWJNV1h6?=
 =?utf-8?B?MlgrY0hwc01ab3R0RlIyMm04OFByUFhpUUZhWVpFYWI4aCtzaFpHSDJvMlor?=
 =?utf-8?B?Vit1YSttUlJwbisrejVwNHowaS9KWnhsbzZYMExRdHMvekFpN1k4eWNTQ3Y3?=
 =?utf-8?B?dFExSE81eCttYUJVSVo2TWZlVjAzdmtvWWxIaXJhSm1RWTBVcFJha3F5R3Zy?=
 =?utf-8?B?NFFUaTAyZEg2TGs3MC85YTNTUGFDemJFdHdOVE80ZndNUXJNenpxWnRmVnph?=
 =?utf-8?B?ZDFwc3RQVFZVZG1FV0xlNFNOdnhEYVBlYm5GMURNaEpGRkYwbG5hNm16Q3U4?=
 =?utf-8?B?RWIxbDNLNmRyTU53RWg4RVVucmpsYW0vbHVIc21xYmp6UHNseGEra1BYVy9W?=
 =?utf-8?B?ZWt4a1IrWUpSdHkwQmtybWhhcUdkc2NYMnRVS3FNcXhtV3ZpTHFsMHJRZ0dG?=
 =?utf-8?B?MDVyQ2xidG9ndjdMeWdwbWZOR2Z3VzFWalhsWmdsM3lEUkpMWXZVWWUyWmdV?=
 =?utf-8?B?MFEweGxMaENIY29WRldqeWpkSVRTTTVGclFQc3RYTTdTMTQ0OCtBMndobkUz?=
 =?utf-8?B?UlQxZ3lhQkVzOTlqZTRrcjBIWGkrVmhnNFVkRXBEclF5dHJVUzFLZ2RtMy9Q?=
 =?utf-8?B?YXloMU1NSU94OXVPOWhXeUpzRlhxU1dXNzJ4U3RzVWVwS29KSFc0c29LWHg4?=
 =?utf-8?B?anlWMVE2REg3ZnFvTWtBV2ZLR3hGRWNFTDJyMElsZzdGemhMMm9BYktUMG9K?=
 =?utf-8?B?bkJyUGt0UC9qaUtXd0swMC9rRzNmOEpMSlZKalRGU0dXTmxGNjdOazFUY2p4?=
 =?utf-8?B?VGFkSXRLMTB5c1ZBeVZ3Si9vRlVpSFhRQ1hqVTZLK3Q3QnhOTFJtcEtueGZ4?=
 =?utf-8?B?dDdHaEVQZHRKSGJZTWNoanVRZmpaWFZYMkticEF3QkIwYnpHUGY2RkpZaXJo?=
 =?utf-8?B?OFNJemVnUmVJamZvaXk5OGE5TEZITXkvVjlFR2lFRGlmMndkYUE2SE5Tam01?=
 =?utf-8?B?ZlB3aG9oUUEwTmJGUzF4LzA1WlpwdXRlbFhhRlpxVnZmc1p6SEMxMERNejhq?=
 =?utf-8?B?V0l6azJhL2VVNXhNcUxrd05XUEtZZ3QvN3dJZHdHS1VISnh5UDRBdTllYjNT?=
 =?utf-8?B?SDhvV3VzZnZqNUV2RlpiaTRWeVIvWXcrWWxLUFVDekVsdnMxRmRMb2pTZUlH?=
 =?utf-8?B?SWFkWTg2clcyMzZEMzIrdDFlRkJlS0hjNjZSSkdhNHNiditEbEpzVHZQOXpL?=
 =?utf-8?B?Z285aUJpWGxkck1HRGtrSVB4WXRObDZIZFV1UWQzOGhGc284WEJ4TEJ1YVlZ?=
 =?utf-8?B?bVFiZGNvWFhUeHhYRFRUVjNQeXdnUnIvZkV2MUZsdGhnbnFlcDJrTjMxTDhD?=
 =?utf-8?B?SjZsN2Y3NVZkRjBsREdEWEpWbVRBUnpERkY2WEtJN1pEVzdlWTFBTWVBcDJH?=
 =?utf-8?B?SUJyQUEwUmdhb01VbzBSb3FNaXR3cHBJWEhSblBleXFUeFVyWXJYQ2NZb1Z2?=
 =?utf-8?B?bDNrOFB6dXlCcjB3bzRiaGVNQmFoaHRTKzBJblp6MHhIaXJwZVdrY1pxcEpF?=
 =?utf-8?B?YWkxeFdZNlYwWWluSGpuVGxCVFlNMXVtNUpvQm5kVGxXVkFzem84YXcvRmE3?=
 =?utf-8?B?czBreUlycnE5bGdlMVJaSHgyWWJ2eDV2dGNuWEMzdVBKc3Y5RFp0MDZEQjRO?=
 =?utf-8?B?Qy84REhEYmpZSFpyL3FYS21JSVc1Z3N5VTFkVGptdHBRYVlIMXFtSVByOXFE?=
 =?utf-8?B?emE0bFZjai9sa09tcWNWbU9xTHBCaDl6ZmpDQkJVZzN1YUd4ODZxWkRhR3U4?=
 =?utf-8?B?LzZHZGFpMjNDNWhKdTFmOFcwd0pld0ZRNmJOcGFscHVheTc4VytOanpZNHdF?=
 =?utf-8?B?d1pRMUxmTFpRTmZvZFI2K01CbnBUaUVVdnVkSDBvRHhZaUpnN2VVU0gzaEIy?=
 =?utf-8?B?MkE5eXJ0M1pEUVZzRURQQnJySUo0UzVZcElscDdKTm1rdDR5OER3ak5hQS9J?=
 =?utf-8?B?NHZFV0NrL1FHb1RPWWQxd2VTZmtGVDZUTlRhdU1lSWc4SG1JSXA1YTZFc09V?=
 =?utf-8?Q?0h2bocfuyqojHs/muyBKi8KoM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2462b5d9-4a43-4c75-7a07-08de1319428c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:20:34.6890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qsw9FUJs55zJR+Z5XUWaO83aV+wlCL8bRkAE/cOHu3GubmRke2U94blUJbb2I/2fRvwX7sCGHTCwJtOdMS6XDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8846
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



On 10/24/2025 10:54 AM, Mario Limonciello wrote:
> 
> 
> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>> From: Alex Deucher <alexander.deucher@amd.com>
>>
>> For S0ix, the RLC is not powered down. Rework the Van Gogh logic to
>> skip powering it down and skip part of post-init.
>>
>> Fixes: 8c4e9105b2a8 ("drm/amdgpu: optimize RLC powerdown notification 
>> on Vangogh")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
>>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
>>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
>>   3 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_device.c
>> index 3d032c4e2dce..220b12d59795 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5243,9 +5243,11 @@ int amdgpu_device_suspend(struct drm_device 
>> *dev, bool notify_clients)
>>       if (amdgpu_sriov_vf(adev))
>>           amdgpu_virt_release_full_gpu(adev, false);
>> -    r = amdgpu_dpm_notify_rlc_state(adev, false);
>> -    if (r)
>> -        return r;
>> +    if (!adev->in_s0ix) {
>> +        r = amdgpu_dpm_notify_rlc_state(adev, false);
>> +        if (r)
>> +            return r;
>> +    }
> 
> Just FYI this is going to clash with my unwind failed suspend series [1].
> 
> This is fine, just whichever "lands" first the other will need to rework 
> a little bit and I wanted to mention it.
> 
> Link: https://lore.kernel.org/amd-gfx/20251023165243.317153-2- 
> mario.limonciello@amd.com/ [1]
> 
> This does have me wondering though why amdgpu_dpm_notify_rlc_state() is 
> even in amdgpu_device_suspend()?  This is only used on Van Gogh.
> Should we be pushing this deeper into amdgpu_device_ip_suspend_phase2()?
> 
> Or should we maybe overhaul this to move the RLC notification into 
> a .set_mp1_state callback instead so it's more similar to all the other 
> ASICs?
> 

My proposal as such is here:

https://lore.kernel.org/amd-gfx/20251024161216.345691-1-mario.limonciello@amd.com/

It would need some testing though to make sure it didn't break Steam 
Deck or Steam Deck OLED.

>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/ 
>> drm/amd/pm/swsmu/amdgpu_smu.c
>> index fb8086859857..244b8c364d45 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> @@ -2040,6 +2040,12 @@ static int smu_disable_dpms(struct smu_context 
>> *smu)
>>           smu->is_apu && (amdgpu_in_reset(adev) || adev->in_s0ix))
>>           return 0;
>> +    /* vangogh s0ix */
>> +    if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 0) ||
>> +         amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 
>> 2)) &&
>> +        adev->in_s0ix)
>> +        return 0;
>> +
> 
> How about for GPU reset, does PMFW handle this too?
> 
>>       /*
>>        * For gpu reset, runpm and hibernation through BACO,
>>        * BACO feature has to be kept enabled.
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/ 
>> drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>> index 2c9869feba61..0708d0f0938b 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
>> @@ -2217,6 +2217,9 @@ static int vangogh_post_smu_init(struct 
>> smu_context *smu)
>>       uint32_t total_cu = adev->gfx.config.max_cu_per_sh *
>>           adev->gfx.config.max_sh_per_se * adev- 
>> >gfx.config.max_shader_engines;
>> +    if (adev->in_s0ix)
>> +        return 0;
>> +
>>       /* allow message will be sent after enable message on Vangogh*/
>>       if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
>>               (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
> 

