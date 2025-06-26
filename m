Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ADCAE9D01
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 13:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201CB10E8A5;
	Thu, 26 Jun 2025 11:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ngmanM3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5DD10E8AD;
 Thu, 26 Jun 2025 11:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raa9/G4HMs6CvLIsiMnZ3bG7mD7a/e98pnpU9oUNRilbJTvvrOlQwnUK/LmFSUM9AuE3qUxqIHNe73aIpMKdxnFQ/hxeup9mbk7WN2eMS5AisabIWOWfGepOrqAT4i8oOvH54GwKkiHM0kyf+qcSw2MAFl/cEpeJyD5oDOsdKoEj6JTyqxgT5eizJkfYkwgdSjzq0JJXnykw8+r9QtlW8CAa1jdE+RClXXYLfd6uPHwqLRNV3DSHY4ABJulyMBxxVAht60gCuOMiv0qfHJ6nwsVb3slpSUQhACCen5Hsw9+t5CpYaFulgs+ejIOuqisrN9Flm2GIMrtBTDmGOHZx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLrT5rBQ3HG18xaT5ykxiE64uUNvoClqzB8Jr20QTb0=;
 b=d1uEpo78rJvhB2vH+3QnZbbTPbnuLdz/YktBEZydnMOFNTExNCC5JrFjJE7lJ45fBKjcouKzcPLOhAWxI0dQg672KG6HYDQJz2xeaMBPQR0xR7QGaORNg5BhGnlnPuH2esBDBu1fKD989BrRw04BFJAtRm43kRkPH4Yo7EuRiXWfTeNQO/Qu5Bsu9dO6GCnwGMn+9yTMsXVgahdvq/89nhVrp4Tbqky0hyaAr5Qtg/PsMOPbQQofsiFGfpJ5TNDLjmBC4uJLW2vZNqWT0Zx9LG86jRCer+Zg1SbZyNMX4AtgTN+XGaat9WKsp2ZE4KzzLa1ySAm9K7M/zldeLRiSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLrT5rBQ3HG18xaT5ykxiE64uUNvoClqzB8Jr20QTb0=;
 b=ngmanM3cibqRj9TRpW8dNoNmaONFbf5reRdN68VPXkXfDSm4AeuSE5KuU2i0F6F6UWfxNePKg7kZqajAl9bZtR32jNKVDm8XZueYpiSfVcCRUeVyHkmNSjo4r/tZaxs8sB77ayk28ufaOX/e+QKgvI0mVpHT3J9mO5NxrBC9F7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Thu, 26 Jun
 2025 11:58:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 11:58:57 +0000
Message-ID: <c8ca63e2-41b3-4eb9-9ce1-25cc5cbc3f8b@amd.com>
Date: Thu, 26 Jun 2025 13:58:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-2-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250624113454.2322935-2-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb9b015-d6a0-4202-7df1-08ddb4a8d497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TktDLzdQWVV3UXBXaEhud3BiZlgxL0M2ZW9sazVycGdNT2dEaXdwVlg5Rmxa?=
 =?utf-8?B?OTcycUQ2dnR5eFB4TlZ2UXRLYUhZQm9mVmdPNysyeTJsdkhPdXYrWmxxMWp6?=
 =?utf-8?B?K2wvbEtBOWtIaDhkclVaQ0QzRUI0anU5cWxLS0RHZS9GRU52SmhtN2xsRUQw?=
 =?utf-8?B?dW9Wd3Fuam85RS9TWWc3NlJIQnVGUi8vanl3M0diVGtscEJaMDFmQTRES0tt?=
 =?utf-8?B?aXJhWjVCdDUvN0tnQW1TTUoyRTl6R3V6bGV2b0w1Q09wRnY4aE5XZjRMWFVN?=
 =?utf-8?B?azV1VG9PUmJTSUxES3BVSFpEcy8yUVRiVERsOUFpQUNSNUF0TGVtWlh1dkdm?=
 =?utf-8?B?UkVwb2VyU0hjNFlpN0syRmNhOERJR2ZQa3BGcDlmd1hCTjUzSVFhR0xBalFC?=
 =?utf-8?B?MEhiYmRtdU9mTHhYbVVBWEpUL1dvdFhmV2ZtVHdiVURuNXFhR2U4dmpMYU54?=
 =?utf-8?B?cUovWk04aGZyMzZsWUZTK0J0N0I0WGdLQnc4cmU4WkJ2ZmNQVVAxbk1MSm1E?=
 =?utf-8?B?MGZQazB6M3RCYU50UmMveUlBOXdKOVZ3a3Ztc0hMZGtTNDhDd2FTUE5NdnFM?=
 =?utf-8?B?TkJUZVZ5RDBVeFhNRE43ZDkzRXVvZE80R3VtYml3WWVyUk5SdWY0eHViL1gx?=
 =?utf-8?B?TzdOV04wOUhqbVY1eERrTVMxZGZpUWNId0w2d3AwVW95UGpvTzFSRUNXWi91?=
 =?utf-8?B?MmZTWmFwZnVXdFVPbEVhRXZhazBxajdMYkhuaVlXV3dTZGdEdmtnOXBjRnls?=
 =?utf-8?B?ZkhoQWFrZXJaVFlneDN2MHRqYVZRSkxKVmwvUUdrU294TXVYQUZKVHozclZ6?=
 =?utf-8?B?L0RSMStlYjVGSnVuWXBPUUNmWEpkdmpadGdld3pJRTRhNTFseFYvTmF4Q01w?=
 =?utf-8?B?VTRYSHVmT2xqV1NyL1IxUWtldXlzSThPYmxxM1JmaitWQXhGSUVVaW9hQmNr?=
 =?utf-8?B?OTZVU2I4U3MrbHRHcGNUZ3JjaHNrMGpjSUZKbHk2eXNzSjBkWlRuNUJVYnRQ?=
 =?utf-8?B?SWRuR1dPalhiZTZheCs0c2dmL2xpUVhkM2RsbnNYd1B0VDdyRVBOL0pWaVEv?=
 =?utf-8?B?b2FUbkk1TGo1b3gvSDM4ZFVPZ0lkZkl0N295ZkdndURlSmNUbnF1Um0rbkVG?=
 =?utf-8?B?TERiYy9NV0loSWJDSjdJSFFWY0dxazIrTjR4TkZNeWlDTEVWOEZmNmxCRndB?=
 =?utf-8?B?elQ0aFY5SGFSd1llcHcrNVI3Sk9JclJJOEQyRnZ3d1VlZjZGRXBIeEJQWFVZ?=
 =?utf-8?B?NkpWZFFCNWg0ajQ1cS9rWXJEaEZOMjJMdm45NDVuNzhKMG1JbUEvdXoySmdO?=
 =?utf-8?B?Vk5ZZ1NXL1F6RkVFRXg1eHM1Yi9XRDZXWG9OZXJKT0R5MGdwdElOUnRwREJz?=
 =?utf-8?B?LzhndDY0bjA4ZGFEOWVMcG5NRTN2WjlCR1RabkFkVTFPU1FCSTRNNll2WmVv?=
 =?utf-8?B?U3FuVllFeXMxTCs0UGpVTElIYm55M2c3cjAreUU5ODJqcjRtdkZtV3BhNlRY?=
 =?utf-8?B?d0FBak1sNlF3K3pnUWRjcW5ZVGdkc05ZSDM4bHB5TEd6WHhPQkJiMldQaG93?=
 =?utf-8?B?SHZ3RHlwUjJRbXcxd3cxeHdUZ1VyN2t6amxUank3RFJRRytxRk1hdGE0M0tp?=
 =?utf-8?B?dHhuY1V5UUJkVmQzUFEvY0YyS0kwK0kreU1uZnlZZ2NYMjNjMXpWR3g0TTdF?=
 =?utf-8?B?WDUwS0t0K1lTMlBSUWtTZmdHc0pyNDRlbDdIUHp6WjRqN3lPak9GV0dUbFlV?=
 =?utf-8?B?L0w1Q1RTV000b1NQUWhkSEo4ZThqNXZrNDVjb3d0WExtTGRHTnhqU3lNT1ly?=
 =?utf-8?B?THRUcHZsV3JKaVpVcHR6aFl4SU5RR3BNWXU1VU5aTzgwckFaQ0szVHN0cXlM?=
 =?utf-8?B?a3ZGTlFYbGMxQndxdnJac0FPWEFrRWVtS0ZTZ1c0Y25EVXg1ZWdwam8xYlF0?=
 =?utf-8?Q?eL03RdyfN88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHhCM09jdUZpRmV6RWd4YzRST25sbVc4SWNPaThNSFdvWGpibFoya2Qzb2VI?=
 =?utf-8?B?REQwaU00dUpJZThjQ09rUDQ5NnlDdGZSemRoelNMZnN2UG81eTZwQWJwR3dJ?=
 =?utf-8?B?bThiZjg2MzYwVllUTTRVMmJPa2VOYzVydkFrVVE5bTNTVjQ4L1llSWpKNkFM?=
 =?utf-8?B?STNIOUNxMCtVSjErc21DZ2lqWm1GN3hJNklDZ2twejRwVWNQd1hrMHVkYVNW?=
 =?utf-8?B?MDcvT2FQMDlIc3ZCRnYxNVBzT3ppVzE4dUMrQTczdHQwRnBBY2QxWWZTK3VN?=
 =?utf-8?B?RXpGdytZOXA5WVVGbVpMOXR0UlhiK1hOSHVjWXRYcVpWMm5uSzV2empNbjl3?=
 =?utf-8?B?WUhvVTZ3b3IyL3NadkQ5eEdmY1V1QXh1TGsxSFUxQ3hrYzJreGtFdk1tcmE2?=
 =?utf-8?B?K2tqTEJyOC9UQU5wTkxENWh5ZVpEaFN5bHNmdEtiMGw3dWRZdHZHT0J2aWtX?=
 =?utf-8?B?amYxampDWUxKb3hKSGJGNVUxRzdHanEvbC9vMHN4b25BNzMxcDlFUTgyVnd0?=
 =?utf-8?B?TDZPT1g0MXkrUlhXMmErbFFzcWJrMEZJYUNkbjFkTEwvYUNwaHVnaGIrUG5a?=
 =?utf-8?B?T1lMSEVta051SWx4RFRRM09WMjJqRG5ERWR3NTZmQkFVUDRiNHZueDlMUWNL?=
 =?utf-8?B?aUJFU0wwODZ6VDEvZVNiZFhIZmRhc0UxbjZSZGIrSU90blA2QXpsdEpZZjBV?=
 =?utf-8?B?SXBiSXMwa2F5MDg2WjlrQVhxYU1McFNBcTI5T3Y4S240UWlnOUhPMklLTUZy?=
 =?utf-8?B?ZzVrcDZUbCtRaVFscHlGd1V1amV2d0Nsa0xaVW50NnlnYVYxRkFRVVNkZ0tS?=
 =?utf-8?B?YmRMS0lEUmNXeVBST3FyZHBuMzAwZ3krK2tVLytoUmU1c3NZaW5md0NiTGhu?=
 =?utf-8?B?dTVGSUFLUytPV2ZETSsyd0xxVHhyU0RSS2N4ZzBCOEhuMGh0L05YelpDUkZH?=
 =?utf-8?B?SEJORElxY0ZKQ09TTVFVTFVudEY4OVBBZjAxa2U4cS9ua3JLVWdhaEZBMUU3?=
 =?utf-8?B?TEY0UWNOcEpHR2FoMEZXbXhHNXhYdjJtcWNqS2c2RW93OTI0REdXTnFjU0x1?=
 =?utf-8?B?VVEvUStSN3JuUndIUEZlbTl3ZjE2d0U1UkcxdXBIMXRZY1B0YmMvek4yUUpi?=
 =?utf-8?B?N3d5TGExYVFNQStqWlVvMXlKbTFwbnk0dmhheEhNajhQdnZqSEVjSmxkMERO?=
 =?utf-8?B?TEdENHg1QzVVMzkwcmlFZWhXbldIV3BCRFpMR054d0pFV3RhUmFLdGJiT2lU?=
 =?utf-8?B?QnlFYXg1a1dwSHBEdG5GVFRqam9lZElCMDZ5dFN0M3dzaHhlNFdrZlZ0SnYz?=
 =?utf-8?B?WWtGeGNBR3pIV21iVGtMVjlVTGdIeVpyOXRnTjkxUDBLOGUzTENyQkQvZW1o?=
 =?utf-8?B?d1RjTktzWnMvZFJ1NlE5dHlYcDkzVktVK1hZSE5iblYzZW1Cbk9WNVgyWTM5?=
 =?utf-8?B?SWppbUd4WjcwV3dwOUhuUHptc2duM0pmRzdyRlZpRVhDVExOTThnSGdxZENT?=
 =?utf-8?B?N2Njb1lUZHBhVWd6anhMbDBKa2RHd2sxSjNuYTJCQ0JMemlCa21kSURNNWRF?=
 =?utf-8?B?VW1sNkpycE4wdWd1Q1I3cmlKbDd0YSsrZWkvVGJSWVpnZ3I4SnR4VVY4aUk4?=
 =?utf-8?B?b05QK0hZY2UzY2NMUUxhVkxUR0UwUWxaTG0xZ3RzQ3N4V0FWeFY1MnBGaXU2?=
 =?utf-8?B?VWN0N3E0NlBDOGJMVlpPZnNkVSs3MnpUTTBvL3FOTkNQRTgwUmZWOVhGejZn?=
 =?utf-8?B?MWt2V1pWRUVYUmZyVWMrUXErWVlmUkNmbDJ2dUZBU3FEZDVsQjJ6RFdqVmhp?=
 =?utf-8?B?cVJYcG5TN0xaT1BDWXJ5d1ZLcGpYVmxDL1FRd2I5bnlkZXV1b3d4TzRwMWNT?=
 =?utf-8?B?aWZialdoT2lPU25XNVdiL1ZiMDRhTk8wdElFdExqQWZLR3BhMjhjdDg0aVhL?=
 =?utf-8?B?bUtSK0NnLyttek51eWRTbmRGZk11amF0cW5HS2x2VVhUWS9PTzNBcHBWWUpq?=
 =?utf-8?B?YTRXZXpLeHdzUnc0TVl6cDBoWkR4UG5aQ2R1cTRHRDhyRmtERS8vajBpdmxT?=
 =?utf-8?B?aG9iN29ZRGZJRWEycWNzdFpKTDNHSGhXU0RnTTB0VlZoRmNrM1FRR25MYnhP?=
 =?utf-8?Q?YI86AAnLSJ6Z1USsz9ZFRT4QV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb9b015-d6a0-4202-7df1-08ddb4a8d497
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 11:58:57.2678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOhIX2rwRudFg9NIaMC5s1RWhH0+ir+ckLLRzxKAR0XIsmvvAXXZhLfAUCPRrLoW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
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



On 24.06.25 13:34, Sunil Khatri wrote:
> move the debugfs functions from drm_drv.c to drm_debugfs.c
> 
> move this root node to the debugfs for easily handling
> of future requirements to add more information in the
> root directory and one of which is planned to have
> directories for each client in the root directory
> which is dri.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 37 ++++++++++++++++++++++++++++------
>  drivers/gpu/drm/drm_drv.c      | 19 ++++++-----------
>  drivers/gpu/drm/drm_internal.h |  6 ++----
>  include/drm/drm_drv.h          | 24 ++++++++++++++++++++--
>  4 files changed, 61 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2d43bda82887..a227903c29c4 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -44,6 +44,9 @@
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
>  
> +static struct dentry *accel_debugfs_root;
> +static struct dentry *drm_debugfs_root;
> +
>  /***************************************************
>   * Initialization, etc.
>   **************************************************/
> @@ -286,16 +289,39 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>  }
>  EXPORT_SYMBOL(drm_debugfs_remove_files);
>  
> +void drm_debugfs_init_root(void)
> +{
> +	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +}
> +
> +void drm_debugfs_remove_root(void)
> +{
> +	debugfs_remove(drm_debugfs_root);
> +}
> +
> +void drm_debugfs_init_accel_root(void)
> +{
> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> +}

I think that this can be done in just the drm_debugfs_init_root() function. No need to split it into two functions.

Apart from that looks good to me as well.

Regards,
Christian.

> +
> +void drm_debugfs_remove_accel_root(void)
> +{
> +	debugfs_remove(accel_debugfs_root);
> +}
> +
> +
>  /**
>   * drm_debugfs_dev_init - create debugfs directory for the device
>   * @dev: the device which we want to create the directory for
> - * @root: the parent directory depending on the device type
>   *
>   * Creates the debugfs directory for the device under the given root directory.
>   */
> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
> +void drm_debugfs_dev_init(struct drm_device *dev)
>  {
> -	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
> +	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> +		dev->debugfs_root = debugfs_create_dir(dev->unique, accel_debugfs_root);
> +	else
> +		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
>  }
>  
>  /**
> @@ -322,14 +348,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>  		drm_atomic_debugfs_init(dev);
>  }
>  
> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -			 struct dentry *root)
> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>  {
>  	struct drm_device *dev = minor->dev;
>  	char name[64];
>  
>  	sprintf(name, "%d", minor_id);
> -	minor->debugfs_symlink = debugfs_create_symlink(name, root,
> +	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
>  							dev->unique);
>  
>  	/* TODO: Only for compatibility with drivers */
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 5d57b622f9aa..db19aef9cfd2 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -69,9 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>   */
>  static bool drm_core_init_complete;
>  
> -static struct dentry *drm_debugfs_root;
> -static struct dentry *accel_debugfs_root;
> -
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
>  /*
> @@ -184,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>  		return 0;
>  
>  	if (minor->type != DRM_MINOR_ACCEL) {
> -		ret = drm_debugfs_register(minor, minor->index,
> -					   drm_debugfs_root);
> +		ret = drm_debugfs_register(minor, minor->index);
>  		if (ret) {
>  			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>  			goto err_debugfs;
> @@ -752,10 +748,7 @@ static int drm_dev_init(struct drm_device *dev,
>  		goto err;
>  	}
>  
> -	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
> -		drm_debugfs_dev_init(dev, accel_debugfs_root);
> -	else
> -		drm_debugfs_dev_init(dev, drm_debugfs_root);
> +	drm_debugfs_dev_init(dev);
>  
>  	return 0;
>  
> @@ -1167,10 +1160,10 @@ static void drm_core_exit(void)
>  {
>  	drm_privacy_screen_lookup_exit();
>  	drm_panic_exit();
> -	debugfs_remove(accel_debugfs_root);
> +	drm_debugfs_remove_accel_root();
>  	accel_core_exit();
>  	unregister_chrdev(DRM_MAJOR, "drm");
> -	debugfs_remove(drm_debugfs_root);
> +	drm_debugfs_remove_root();
>  	drm_sysfs_destroy();
>  	WARN_ON(!xa_empty(&drm_minors_xa));
>  	drm_connector_ida_destroy();
> @@ -1189,13 +1182,13 @@ static int __init drm_core_init(void)
>  		goto error;
>  	}
>  
> -	drm_debugfs_root = debugfs_create_dir("dri", NULL);
> +	drm_debugfs_init_root();
>  
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
>  		goto error;
>  
> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
> +	drm_debugfs_init_accel_root();
>  
>  	ret = accel_core_init();
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..d2d8e72f32d9 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>  #if defined(CONFIG_DEBUG_FS)
>  void drm_debugfs_dev_fini(struct drm_device *dev);
>  void drm_debugfs_dev_register(struct drm_device *dev);
> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -			 struct dentry *root);
> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>  void drm_debugfs_unregister(struct drm_minor *minor);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
>  void drm_debugfs_connector_remove(struct drm_connector *connector);
> @@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
>  {
>  }
>  
> -static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
> -				       struct dentry *root)
> +static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>  {
>  	return 0;
>  }
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..7964dd878144 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -566,9 +566,29 @@ static inline bool drm_firmware_drivers_only(void)
>  }
>  
>  #if defined(CONFIG_DEBUG_FS)
> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
> +void drm_debugfs_dev_init(struct drm_device *dev);
> +void drm_debugfs_init_root(void);
> +void drm_debugfs_remove_root(void);
> +void drm_debugfs_init_accel_root(void);
> +void drm_debugfs_remove_accel_root(void);
>  #else
> -static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
> +static inline void drm_debugfs_dev_init(struct drm_device *dev)
> +{
> +}
> +
> +static inline void drm_debugfs_init_root(void)
> +{
> +}
> +
> +static inline void drm_debugfs_remove_root(void)
> +{
> +}
> +
> +static inline void drm_debugfs_init_accel_root(void)
> +{
> +}
> +
> +static inline void drm_debugfs_remove_accel_root(void)
>  {
>  }
>  #endif

