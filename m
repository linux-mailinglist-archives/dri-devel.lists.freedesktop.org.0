Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8281AEB7C4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939FB10EA13;
	Fri, 27 Jun 2025 12:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BuJNIbS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488DB10EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:33:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsCwkKb2LjK7oKcN7K3lFgEpGtxFp5N3jX1nB9XUGtcBIiLbYrXDKlM/oIBFAZNvZYhAvhvDtKkC/ycxVz/lKesfQeQaYg9qdhDPEZjU1Phn57excHe38huhl3WLer2fgkzTeKRDz4XxfUICzmaq4ge3Vy1KI/3/2uqvw/BdvzmqRvoXiNoNo/RvRizWIuGJpWcAIdLTyKzeZKMfzlKNF1Ga9855JtcKwUWiWv7+AUA/C8LJfLZNvS5qyRHkz47FTGUtEEsXfc81/KCMc3822X4+qIhR6ogO/lpsTwWVjriitxGacPTWpvM+R2pz2ZFDrNQUocR4Xf9S93lipFXS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGSRDbTlSt7Go5ZBX26AsRPUDf9WqfdmNb+uxyf1jzQ=;
 b=msWaZLBLHhcC/bS7bqRCl+nWjK8rkE4dO997BwfljofuO4MQif1Y+wJqKyFD8Rz3ZuC601SyjoidcIjsMzyVRNpZop38+cvRf+ozuLB1c9/pHwW33pGdlRbpxPbNHlVCXoUHC3JAkBs71XjvorxtBGp47C/cvMche2BWvH0g3iLMtWAV6cEmumaF33iCz0PxgPduXIhZkwPzcUa/Dp0qVopEJRrGW91T5RJWViIclcmaD1irITUWbww1xu0EinWI6D/0MFhvlGEdLmufPZh8KWQY0A84IG7oYwmnQk5cNgOdFrXVnC1y8mERAw9UMSFAoHabo2gu0LtUw1nCyUY2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGSRDbTlSt7Go5ZBX26AsRPUDf9WqfdmNb+uxyf1jzQ=;
 b=BuJNIbS/SDPSb+UKM61iitw+QSGv6mtm3lPsFqaRcF/PXJm/g/HDAUJyul5K/hESn5dRjLnppx9M9CoQqpWsjlIZiF0909wBg5EgNGVE6kZu76nraT+s89A6VQfclD65aP4dr5HZdwDOkZYIr8i5fUxww13hYxovmhRGkx18nQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 12:33:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 12:33:46 +0000
Message-ID: <1d9bd745-fb2d-408c-864f-832b20b395e4@amd.com>
Date: Fri, 27 Jun 2025 14:33:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Acquire references on GEM handles for
 framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>, asrivats@redhat.com,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250627082052.26181-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250627082052.26181-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: cd70518d-b158-467d-aab7-08ddb576dc00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkczaTBYMFBqc3BGRWV0a3lZaXVWc1BoNVhyVEtjQm5Fb3pJMThGZHZpM2JX?=
 =?utf-8?B?ZEt3L2hHNG0wTVB0L2tHemJDOWFvWWwzWS8vQjNkbmtmd1ZnRGNjeW4zRCs1?=
 =?utf-8?B?Y1FZSUFFUXlLOGhWM0QvcWhNdDZTdlQxN3dCUmxpYTFHODFUK0czYlFDL3Vr?=
 =?utf-8?B?MVUwZUFIT0xjS2VJZ0JNOFhlSEZxS0xDWDUwcVoraThaSzlaSFZGRWc5QUFD?=
 =?utf-8?B?eFJuOXJTelZkNzBhVk56UkU1OUhJdVJJaE9MY09MTkVhTXR0WW1sRmIzWEtW?=
 =?utf-8?B?TGdIWEVuVGg0bC9IdlovS1RNcTFWcjVWdXlhWExJT1U1TGNVL3d1R1FFVHh1?=
 =?utf-8?B?ME9nMkZzblI0UFlqTTNsVTRXdWR3S2tNV3VQSy9ZWFNnMTloSHpyMkxtYTJF?=
 =?utf-8?B?VWVEakVHWEFQMFNuMHRoTVhENWVKWGlRRUVrVnNwU1Y4b29QNk94Y3pMRTZV?=
 =?utf-8?B?WWRSbUJXWlptNjJVVlVBYkpRMnQrZ1VkbkE5SExSaWVSTS9WcnBnVTlTWHUv?=
 =?utf-8?B?Q25ZNFgzT2E0OFNNT2pVVTJ3ZkFPVXVnbFlMYmFjS21iN3NzeUE4RkpHZWl4?=
 =?utf-8?B?ZFNmNVd0akVhQUMyMGovWkp6cFBGVUlrM2RDbFFwSUJ1SWFRTFNjdEYzdDBF?=
 =?utf-8?B?SkJPeHZrTkx4czFnUjdvK2ZvTXlsYnlHV3Y4dmgrcEgwTFlIUG9QQ3FGTVUy?=
 =?utf-8?B?SkFybTNDZEFydlkvYmJVQWIyTDJxQVc1c2pkWld1R0VmTFZMc2QzMk9vUENk?=
 =?utf-8?B?VjZHWGJDZFJyY1U1Nk9JNmZQYlRKU1Z0ZlB6WXZ1cGx6Q0JrWFJDT0pqdGZq?=
 =?utf-8?B?ZjYzZ2pQWnRlaDBlTHZ0YmhHVlFrdTFmYjkvRHhicDNieWZEa1pRUFc2RHZ4?=
 =?utf-8?B?WFRTTkh1RkhLc0hMU3VlZlZVc1FDZkxtVC9qM2drVXUwSFdtYWFETXMxMW5u?=
 =?utf-8?B?RDlDZzRDOXVoRTdiOTV5MTZxYnFHU291MGNMUzNoeHpZUlQ2UWFkcDRGRnUy?=
 =?utf-8?B?c2ViTzFuU0tHS25JMFFLdFZ3MElWMXQ0TjNMeHZ2YnhuVDNMTFpsTzF5TVhy?=
 =?utf-8?B?dlpnVG5lZStqOGtKUEl5RFpDY2s2by9PanBjT0FlOGdET2d2QkFxTGhxMDFY?=
 =?utf-8?B?WThFbGpkN2pMdkZtREVVODBheTlXOFhWdWFVeW9zNTd0RHR0UUxNTzRFdmJN?=
 =?utf-8?B?Y0U1ZWNjd1ZJNVo2bmdNQlF4TTJWeWZiWHBVQXlrYnFkTVh4YUVHdnV5S1BG?=
 =?utf-8?B?OXQ2Z1pzSC9lc3ZzcllIY2FidzdsakN3MWxWNUVQZVZ2RGhpdWJCK256UTFJ?=
 =?utf-8?B?cENZcU43dGlQaEdhTlVDem9FemhZZ2UyTzJ0MGk2ajBZdFkrV1k1TitEZExE?=
 =?utf-8?B?bkxVY3M1emZtWHhxZEhBWnR0QU4zQ3FRU1BrVEhpN0RKNmtZWlhsdi9DdllV?=
 =?utf-8?B?dGpmRm91UTFaSW1MZU1BQ2I4Szh2TDNWV1ZpQ1V5emZUUTFidUNGekZiUTE5?=
 =?utf-8?B?SWxnRVZRUkk3VUVrWWlicTZUZ1ZnZ3FjUGZyV0s2d25KT2FxbmU4SVkvc21l?=
 =?utf-8?B?aklCRmxHSnM2SE5jMkhPSGZNSXpIQ2RRWTJobVdSVVRoczZXenY0VU5Na1FW?=
 =?utf-8?B?OFdvdHY2NlBVZEpyei8zalYvWkdFa1l0Q3dzeVhISXc3R21pa3JJSWVaSTRp?=
 =?utf-8?B?NFBiZ281cHRIWEJrMzJqZGJOckMyR0UzT010RkJNMEdVUGdDVHBpVzluUGNr?=
 =?utf-8?B?dnBVbUFlQVhkdDNGL25YRFhEWnVMVDBlbkg1amVPeVBxNmZsbC9LRUY2dzJ5?=
 =?utf-8?B?Rm0yNW1kSTBuL1c2b05VSG1qQWRzUGE1K1FjWDVBLy9wZTNaRVUxSHhpdnVD?=
 =?utf-8?B?TE04OE1RS3VFeWgxZkFxRVU3QS9wbENBZWNxb3Z1a3N0bnV5U2hjYUxFQmRI?=
 =?utf-8?Q?gF5ntvbafOs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVY3S0ljRnExOHo5cS9YemxwOVpybHo1M1pINnV5RjhNL2RoUUFwbi9ObzZu?=
 =?utf-8?B?bEFsUlZTVlBhWTJaUTlLbzJYR2JZcWZWTTFDTjFjWHZiZVBGQXdqOS9idkVQ?=
 =?utf-8?B?NTJaZWtWRHNBeW5EVmZ6M0ZKdG5obEI0WW9RZWhObDVNTlQrckpWb2dIVnZM?=
 =?utf-8?B?V2FRR252cDM4TXUwaFpkK0dlRTgvWEU4TjZTTnhPYUtkS29BdERiMkNSSHZo?=
 =?utf-8?B?RllLN1JEQXN1TSs1K0x3N0MyREFqdXhaRTVOVy93NXVyVFJvcTVseUVKdm9t?=
 =?utf-8?B?UkdNbjlhakZLSE0rZVUyWTVPTEtVeHFUT2U5ZWIvVzcyVm1KQnlVdHFKNlFt?=
 =?utf-8?B?NncwMGFqOXFYWmZTRXJNUVZvbjJpL3h5S04zOXFNQXFoam1UaE9hZTN4TVRJ?=
 =?utf-8?B?b091c2p4OHRjTzZXejBQNFZZMGQ0UzdaUDlGMkVKaWJxbVVtaUR1TkxkNnBO?=
 =?utf-8?B?VERxUDhRMlN5cWJzb2w4aWZLSHUzS2FzQktLYmI5d2hvdmtnUXhzNk1WN2Q2?=
 =?utf-8?B?andINXBrcWNhWDAycjJhSXU0MnhpMkVpZERuNnBqdzYvRUlDZndxTjhjVjNQ?=
 =?utf-8?B?T3R3WVQrTElteEdnczdMYWZRenZtQzd3bEhwQ1pPUEtaL04vMXdXRFA0cEl0?=
 =?utf-8?B?SGpiZmJ5Ujg1OFZ1clVKQXdkMUFTSTlpUHdpUmpYNE5jRXo3MU85d1p1RFl1?=
 =?utf-8?B?L0hUeXpmZXcya1l2Z0lsNldtOTZpS2lwbCtVTjV0aWhITk93SzdLR0RLMVFH?=
 =?utf-8?B?MnFqOWZTZEl6TFo3dzEwbDNHVSt0R0ZvbktvSTdCOEgwYlo4bXpqM09aS1VW?=
 =?utf-8?B?bENmaUhQVFhjdytGVHhBSlJ4YysvWU52TFZZWmgzRnRWaElnOU9ZN2JLOGd4?=
 =?utf-8?B?R25nSCtMRkhTN003VmdCS2RlWitwTmZvc09pODJnT0dEeCtab2xGZ2x0NEtV?=
 =?utf-8?B?d0xYQ0lna09hdjlob0lianNBZmpyMnFRbEJvZE1NYUNWbTlaMEw2SVk1SnJo?=
 =?utf-8?B?Ri9XUkJCSncxV0tWY0syQitsU1R5bFpObGNucDhrUGVFYUhXanVnSnF1VkZS?=
 =?utf-8?B?YVMvczAvYnRrbllkK0lFZkpGNmZNcitxc3VtWGtQTTI5b2VYd2ZYM3pZd2N0?=
 =?utf-8?B?MHpYZ1ZCVi9FMVJVaytwbmNGeng0T29NMnpQYXVQVEtrVzEvblU5U05BSS9U?=
 =?utf-8?B?V3lhZStOeHBwcjBRNlVvYlBGcGlKWCthWkVCSktIMmZMNmxwK2dPR1l6bXJt?=
 =?utf-8?B?RjgwSUdvMjN2YVFpT2RaRWUyRjJLaDZaZ1ZLcmtPa053STNwcEtXZThxZkp1?=
 =?utf-8?B?endNQk5nVFpNT09vS2R6aURvQ2J6azZqMzJkQ0trNjByWjdIME1WVUVKRW91?=
 =?utf-8?B?eVZlL210d2prRFNtNjV2TXBUNngwRGNDUjFWcDFUaHhUSjRiTnR4c1ZWVHZs?=
 =?utf-8?B?U3FPOEg3QUMvVWlEWU43RGtJOUpaS3hGZHRYQytpR2R4TWhyeGdmZm9aSXky?=
 =?utf-8?B?WS90cXZmdzNRK2JpRjUraDBvU04zaVkxWUsyTThYUWNRNDl3YWh5djNvMUZD?=
 =?utf-8?B?V3ZoUk8rY0JBVnVCc3hGYm1yMzZFTFZ2WXhZRWJOOXhpRW54R3lsNUh5MFdF?=
 =?utf-8?B?R1d6ajNxYnhMeUYvblBCMmwwN1R3bDRPR2k3Mnp1WHpzTnNyYjlIdUNWUXNw?=
 =?utf-8?B?U2duNDczeG9uUVhkU242WmJGSFE0aGxnODdIVlZ4a1ppbElvS0V3a3p3TW4x?=
 =?utf-8?B?OHkvMkhXd2kxQ0FvdWhVSmlmNWlPSFA3VXBCR1BhSCsxN01LcVBKTTMrbDZ1?=
 =?utf-8?B?RUJ5cnJEaDZmbHRNUjhtamVhdlpYVGRueDBFWjNkQmNJTld5ang3Y0VvU01Q?=
 =?utf-8?B?byszcndsOUl4WlRlT0kzM01iUW9lQmpOVE4xRkN6REhmU1BjM1VSQjhjeDlZ?=
 =?utf-8?B?QXB5c3dyNEI0S3I2aVpha2cyWUhrVUpuTFQwWjN0M281Z2lsOEFuNm9rWEZK?=
 =?utf-8?B?MzBvWll3eFZUYldKZ1lRR1oydWVlY3c4Yk5hVWQyWVdmQ0NhMlBHMnJaUWNB?=
 =?utf-8?B?b0lBWmdrTkdXVk1wSlBUQUdlblo0UEJZOGlOVHNZa0NiQTZpRHdYTUpVM3lX?=
 =?utf-8?Q?quAapKZcNIJyPKiZ6NqfLXEOt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd70518d-b158-467d-aab7-08ddb576dc00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:33:45.9590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2Fj45XL+OWazIHo07GZFJOfLHNonsDULJtiVFORMHQeQUg2RJIadaA8atHP5HqI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104
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

On 27.06.25 10:20, Thomas Zimmermann wrote:
> A GEM handle can be released while the GEM buffer object is attached
> to a DRM framebuffer. This leads to the release of the dma-buf backing
> the buffer object, if any. [1] Trying to use the framebuffer in further
> mode-setting operations leads to a segmentation fault. Most easily
> happens with driver that use shadow planes for vmap-ing the dma-buf
> during a page flip. An example is shown below.
> 
> [  156.791968] ------------[ cut here ]------------
> [  156.796830] WARNING: CPU: 2 PID: 2255 at drivers/dma-buf/dma-buf.c:1527 dma_buf_vmap+0x224/0x430
> [...]
> [  156.942028] RIP: 0010:dma_buf_vmap+0x224/0x430
> [  157.043420] Call Trace:
> [  157.045898]  <TASK>
> [  157.048030]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.052436]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.056836]  ? show_trace_log_lvl+0x1af/0x2c0
> [  157.061253]  ? drm_gem_shmem_vmap+0x74/0x710
> [  157.065567]  ? dma_buf_vmap+0x224/0x430
> [  157.069446]  ? __warn.cold+0x58/0xe4
> [  157.073061]  ? dma_buf_vmap+0x224/0x430
> [  157.077111]  ? report_bug+0x1dd/0x390
> [  157.080842]  ? handle_bug+0x5e/0xa0
> [  157.084389]  ? exc_invalid_op+0x14/0x50
> [  157.088291]  ? asm_exc_invalid_op+0x16/0x20
> [  157.092548]  ? dma_buf_vmap+0x224/0x430
> [  157.096663]  ? dma_resv_get_singleton+0x6d/0x230
> [  157.101341]  ? __pfx_dma_buf_vmap+0x10/0x10
> [  157.105588]  ? __pfx_dma_resv_get_singleton+0x10/0x10
> [  157.110697]  drm_gem_shmem_vmap+0x74/0x710
> [  157.114866]  drm_gem_vmap+0xa9/0x1b0
> [  157.118763]  drm_gem_vmap_unlocked+0x46/0xa0
> [  157.123086]  drm_gem_fb_vmap+0xab/0x300
> [  157.126979]  drm_atomic_helper_prepare_planes.part.0+0x487/0xb10
> [  157.133032]  ? lockdep_init_map_type+0x19d/0x880
> [  157.137701]  drm_atomic_helper_commit+0x13d/0x2e0
> [  157.142671]  ? drm_atomic_nonblocking_commit+0xa0/0x180
> [  157.147988]  drm_mode_atomic_ioctl+0x766/0xe40
> [...]
> [  157.346424] ---[ end trace 0000000000000000 ]---
> 
> Acquiring GEM handles for the framebuffer's GEM buffer objects prevents
> this from happening. The framebuffer's cleanup later puts the handle
> references.
> 
> The Fixes tag points to commit 1a148af06000 ("drm/gem-shmem: Use dma_buf
> from GEM object instance"), which triggers the segmentation fault. The
> issue has been present before.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 1a148af06000 ("drm/gem-shmem: Use dma_buf from GEM object instance")

You might want to drop this. Fixes tags are often used as limitation, e.g. patches are not backported when the patch mentioned in the Fixes tag is not present in the branch.

But in this case here it is probably a good idea to backport this anyway since the issue was always present.

> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/gpu/drm/drm_gem.c                    | 44 ++++++++++++++++++--
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  7 +++-
>  drivers/gpu/drm/drm_internal.h               |  2 +
>  3 files changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 19d50d254fe6..8be50b3cc9c2 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -213,6 +213,35 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>  
> +static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> +{
> +	struct drm_device *dev = obj->dev;
> +
> +	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> +
> +	if (obj->handle_count++ == 0)
> +		drm_gem_object_get(obj);
> +}
> +
> +/**
> + * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> + * @obj: GEM object
> + *
> + * Acquires a reference on the GEM buffer object's handle. Required
> + * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> + * to release the reference.
> + */
> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> +{
> +	struct drm_device *dev = obj->dev;
> +
> +	guard(mutex)(&dev->object_name_lock);
> +
> +	drm_WARN_ON(dev, !obj->handle_count); // first ref taken in create-tail helper

// style comment in kernel code?

> +	drm_gem_object_handle_get(obj);
> +}
> +EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> +
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
>   * @obj: GEM object to clean up.
> @@ -243,8 +272,14 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>  	}
>  }
>  
> -static void
> -drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> +/**
> + * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> + * @obj: GEM object
> + *
> + * Releases a reference on the GEM buffer object's handle. Possibly releases
> + * the GEM buffer object and associated dma-buf objects.
> + */
> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
> @@ -269,6 +304,7 @@ drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> +EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>  
>  /*
>   * Called at device or object close to release the file's
> @@ -390,8 +426,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  	int ret;
>  
>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> -	if (obj->handle_count++ == 0)
> -		drm_gem_object_get(obj);
> +
> +	drm_gem_object_handle_get(obj);
>  
>  	/*
>  	 * Get the user-visible handle using idr.  Preload and perform
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 618ce725cd75..723f1d652c01 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -99,8 +99,10 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < fb->format->num_planes; i++)
> +	for (i = 0; i < fb->format->num_planes; i++) {
> +		drm_gem_object_handle_put_unlocked(fb->obj[i]);
>  		drm_gem_object_put(fb->obj[i]);

Keeping the handle reference should be sufficient, since that should automatically keep the GEM reference as well.

Apart from that looks good to me and closes a very well known issue.

Thanks,
Christian.

> +	}
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -185,6 +187,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			ret = -ENOENT;
>  			goto err_gem_object_put;
>  		}
> +		drm_gem_object_handle_get_unlocked(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -195,6 +198,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
>  			drm_gem_object_put(objs[i]);
> +			drm_gem_object_handle_put_unlocked(objs[i]);
>  			ret = -EINVAL;
>  			goto err_gem_object_put;
>  		}
> @@ -210,6 +214,7 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  	while (i > 0) {
>  		--i;
>  		drm_gem_object_put(objs[i]);
> +		drm_gem_object_handle_put_unlocked(objs[i]);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 442eb31351dd..f7b414a813ae 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -161,6 +161,8 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> +void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> +void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
>  			       u32 *handlep);

