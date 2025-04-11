Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E3A85D83
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47F810EB9A;
	Fri, 11 Apr 2025 12:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="quDiDx/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A5710EB98;
 Fri, 11 Apr 2025 12:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqE4Mn6P4z9FsvieHy8r99h2CA/O0m8aJN6B6/fNgllIL65aNyygNjAmYWShxxxMyMSwaQxskmAUMgw5ysKx1EEk6uOf3IB/RRJ6IQZTI/Z3zlNBKihWq2GN2DCU9/v8gx2Ph1JXToXIwSVjSbu+WZ273p2RHeOA+/2YzJPCp8K8p8cCHb4Sk75ekFGBci89YbJAjPVfsI6EqmqZnY0TfaP4zPQtb9jknkXJf5EqAzKhSE/zDkAqAY5vZKtHxPwv27iQq4dqD6Pz0tevsuiX58K9lRW9otGvWZPQX4nZmzFZUDAwnENS0IX7PmAwJPW98s2G05sliwyppH5IF3sKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11dJNzXaZLvH7oeHG2XQrLbcGH7jIalpJM3ZMTjb3Lk=;
 b=QZz5U+Tywp7il8AriUqs0Pa/lnfWJRd0z1Y9rd0PMiZvopUQ6/wnLQflVBv6znYTpbhmUskoZl1QCqxA1cbRc2N5aj6CXCPasVHVmDxoxsv4xzCvkRXbOST04GeF+ug1NncSm3qWZ2VxE9cFWIRGnVoSRL8Ka5yx/wJ8mXEXNtQwFRBg8tlzt06gQBZza+k9Svcuu/R7hb5RDwxYybnL5M/Vh60kaVkb8KjzBFCflJIDWQ5JBKvHBMlUsWi+hVql59xWOo+7/kge/+gF2zrGCsPhYJnONNxms+tY8f2r72Fa2QDUXajIFDujsE4lwG5Wk3KuqxxW8CmdeJwpKzphdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11dJNzXaZLvH7oeHG2XQrLbcGH7jIalpJM3ZMTjb3Lk=;
 b=quDiDx/rp9fzJ3FJ50hrNqNYFPyhcGZZjqBvtCrdqBSjcwmCvsCo8ZEv86iqyI4xPCaC1aG+s+RU3Li0Um2i84Z5K3Q+SAEMuU9j86LFWNh84UMXh1Chlfu72UAcZENnT+vkHiA3t1IIlSV5bdloD9GTTXtRW3QdM3g5p93xvTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6767.namprd12.prod.outlook.com (2603:10b6:806:269::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 12:45:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 12:45:56 +0000
Message-ID: <73a28f35-9576-4089-8976-07cd1aa64432@amd.com>
Date: Fri, 11 Apr 2025 14:45:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
 <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
 <20250411140254.042f9862@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250411140254.042f9862@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8e33d6-cb8d-490d-8b3b-08dd78f6cd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cExzNW9ZZTNsWGszell5TWIxelBVc0E5K0I4YVNRUkpreklmcVZnZHVwWEVl?=
 =?utf-8?B?dUtYN0NoWjhhYVhGazVtY3ZkUlloSEJRWVdFWDBqL2RBVDdnUDdwRFl1dzZG?=
 =?utf-8?B?ZGZpYkYxRUhXbFVlWHg1alNSdUduVXpzQ25zMDRqYU1FOW1tNGtyVjhBTVQ0?=
 =?utf-8?B?Z2huQStLd0oyT3hQNG9Gb0o4N1dKTGRvNUFnb1lacnFlVjl3cytMblZjNXJU?=
 =?utf-8?B?cUZVbWUzbXZxVnVEOFlwdUVubjZ1S2YwUDN4YU5FUnRtQjF2a0tpaUpFQ0Fm?=
 =?utf-8?B?OEZ4ZlBPZzM5aHNwMVhzSHlKR3kxMzhad3FpMGNFNE1vdFlNc0M1b05KUWFz?=
 =?utf-8?B?THpaQk9COWE3Z2tXakN2MjhQMWFkeEljTXVYTlNEVDdVYnNWVTVTQW50aHZT?=
 =?utf-8?B?T21jUkNoQTN6ZzdZNkhUcDlxT1RwcW9vRVJUMHdvRzA3TURGL1hlM2xzdG5S?=
 =?utf-8?B?UWJWSGVyUnF2bHpQaFE1N3R6VHBzVzVJUHgvNC9wbkRMT01MVGVpeUVRVHo3?=
 =?utf-8?B?ZnVncUNBcWRMTUgrano3d2hSVmZWRlJLSGNFYWpENllWZ29FcWVKRW0yZk50?=
 =?utf-8?B?RW5sOUZxc2UzamxFOWVQdi8raXM1V3VUcVdMa0VPaUdBR3EzRUlDRitITDVa?=
 =?utf-8?B?dHZ0Y0RDSExRcEd4eldleE9tMlhMdkFNd2JSY3Fyb2FqQ3FEbGdUOXpIZ1NK?=
 =?utf-8?B?TFNpZGg1R1p3VHR2eHZ5dTlaaDI3SW5PSDY4T1hkYWhSbzhtRmVhZjZOTXZu?=
 =?utf-8?B?VTlxSU5iM2lXRjJpWnFtTEdKdTUrSjJ0S1R4MGM4elZPQVh2dS9MOEhQTFRT?=
 =?utf-8?B?cU5JRkwwZFJOVWR4eTRadmUvZm9jN0J2eVFjdGVaU3lnbEk0QVp1STdDd0s2?=
 =?utf-8?B?aHRlNGpiNkwwbGRPcWQzUWtsVVBSbzEyL3EwZUVHOWhRVFo5dTFDSDgxMUkv?=
 =?utf-8?B?VjZscm1xeGk3ZFdzVktqZ3dYbzE4QmErMm9KWGc0NUdscmRPQXRabjllZnBq?=
 =?utf-8?B?NnNxQU9ab3R5QXRoUHJtNVUrQWdxakF5aklLaHlKNlExOWZqZE5DRW00NlAw?=
 =?utf-8?B?ekhSRDIxbHF0dW8vQmtxVHVpUGMrL3lLbm90NHNSR2VaOUlURmVmUjRHN1dn?=
 =?utf-8?B?NVZkTElZWG9PRnptUWpxR1FmcjRMeTdKTUVpdllRdEF5Y1o2SVRNcFh5My9Q?=
 =?utf-8?B?Lzk5VmtEZS9DcitMYU84djJ1U0lnOW9id290YTNZNTVZYVVrRDVmQ0JYSzJ0?=
 =?utf-8?B?YWNyRUdOYVA4UFd0RFNSWlZhNFNTT2JveDlId2hjUEkxcUE3OGZIeXNEckcw?=
 =?utf-8?B?UGtEZHlSQjFaL1dSMFpIRUJLeThZYlkwV3pURjErNmYwTkMvYUZBMWJEYytV?=
 =?utf-8?B?b2RJMHZtc0tFbUpja3hsK1d6alpRNUU1NkpuWGQwd0R5dmg5NFVKU2RRN3FL?=
 =?utf-8?B?bDQ5YnVaYTkyT1NHc2dYbFUzNzVvbWlmUHloQXZNZU5PUGN4SnJWTmkyOEp1?=
 =?utf-8?B?b3pVTHpUVW5BcjZwZW5lK1Blc3gwZ3lDU01IVXpQZy9wWGJtVXFiNlZpdStn?=
 =?utf-8?B?ZHV2YXJFK1FaYVpyQjRPWjhOSDVNUCtqbEMwTXRRL1p6aHNjOFUwQ282VjNi?=
 =?utf-8?B?cXQyRmlSNy82bWtNd1JZcVRPQTVrbFFmMzgya3pEUy92WlNpMktwK2s1QzAw?=
 =?utf-8?B?WmN3MDZ2ZXpmYXo4VkE3c1VseFFudzZFRmNCL2NJSEVYdnhva1R0VXBOVC8r?=
 =?utf-8?B?N2VDZVJ6czIzTDQvRFduZjgxdzNWOUNqZ0FvK3p6N09PVFEwZDNvU3hZUHdm?=
 =?utf-8?B?bHpNLy8wOG5RaGQ5cWlSVGMzQ3J1TDdlTEZESjJHdWtxT212QjdueDJoWE9U?=
 =?utf-8?B?alp4WDFjYU5XaU44L1l2Y05zVnlEMHBFQk1lOG4zY3VBWDFoNHVEaEljVmM3?=
 =?utf-8?Q?bP2k2IEKJrY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R25NUjh1RWk1TDlBUlNlT2hLVlNmQ2FjR2pvVVZYRmY4VXlIbkp5V1g4Z0xs?=
 =?utf-8?B?WkNpMGozR3ordzhkOU1zZGNMU2d2R1VtN1JPbk1CdUgwRDZOTk5jcDRkSUUw?=
 =?utf-8?B?ZnYxMWRCODRzZjF1bXFVR0NrOXU1VHRnS01Od01NN1l5ZyszaTB3UVRUVDBV?=
 =?utf-8?B?NHRhQVJBbU1Hc2RrVUI1cEdiZzgzeHpiQWdMQnBJOEllbFdYekViU05EY09I?=
 =?utf-8?B?TFJ1Snc0eFYzZVl0UlFpUVdCUVB5UDdWUmNKSVVvdDJtQlZjSzNPWDlKVDFW?=
 =?utf-8?B?SFdVaTJRN0x5Q2RmTUZoYUpkWGZodzFFazV5ZldCa214dTNCWTFncDBwdTJL?=
 =?utf-8?B?Tkx3a0x2NEpucHZyWlZHV1F0STlKbXYwUzBzbzVXdXllcWFpUmdkV1o3Vnp3?=
 =?utf-8?B?YzAwOHVhRS9sRUlpL2JOYm9VWS9zRHI1MEFiTEVZWDQyY2dyQXJwQkJsYTFD?=
 =?utf-8?B?QTJDbE1vaVZaS1YxU3QvSTBuQThSdkk4am9WZC9VMlNuaXRIZ1VuWDc4R1Zp?=
 =?utf-8?B?akk0QTNnNVlPaGxaeUloaG9yckhwMnFJQXRpTUIyRTVNeXpGZVRXeSt3L3Rs?=
 =?utf-8?B?b0ZEMnVvZElGL2IvSVk2Snl5OHRvNDBVdk03ODREWWJPK2ltOVBjNDVkVHdZ?=
 =?utf-8?B?aHdZYXVrb0xhMk42NHdKdXY0Z2lNam5TdDc0RkRNamlvNWR0M1d0VDBML1J5?=
 =?utf-8?B?T2UrTTJjMmM1SUFYbUEwS2VFZHVhaGVlWXVTMm0wMkRDWWZmSDJwejgrOWRV?=
 =?utf-8?B?VHJlMmF5SzJ6UDNTTzBuQTFacnJLUi91WjJqbEhCamFnNnFyb0RJTmpVUGNy?=
 =?utf-8?B?QURTeEhMVlNPcXBZWE9PUDdTck0rL2lRS1VzOUhNVko4N2xNZHZuM0grUkNw?=
 =?utf-8?B?NWM2dVUwemNoUDA0TUQ4WEZPK1NhTWF4Q1FVdTJtMXBIUnUwa2FLN0sxTFpJ?=
 =?utf-8?B?N1pNMzNjMWN3Y0NtcEZYTWxZYWkxQlZWa3E2Mjk3WElxamlLVlNnOGhPRnBj?=
 =?utf-8?B?c0J3SkRGdHJ5d2w4K1oxN2pXUkxkU0Z1SjJKVDZqczIwVGFpZjlhSUhOaFVn?=
 =?utf-8?B?SU9sTHl1dEZoT1lvZThOQlptbDM3QXA2NlBLeU5pZDNPQ0tZdjRaVlgxUURC?=
 =?utf-8?B?OVNGS215cjh6MGZ2ZDRIVjBLSXcveFlXbU02ZlFGZmk2Zk0wQm5jMTRkN1Aw?=
 =?utf-8?B?VGFvaXRGTGpWSjliRXFraFEvWngzL0ZUeEtjZmZRSHRGWlpoKytoVy9JRjhi?=
 =?utf-8?B?dmpKTjdNR3ZyQldIRXZNY1o4bVQ0bEtXYWd2Z3pub3BxejhkOTNkU082TkVK?=
 =?utf-8?B?NmpUN040eWRlSjM3NENzUWdKeHhmaVZ3VmNsUE5QNko4TzVXNTVkQ2dSK3Na?=
 =?utf-8?B?ck5CblBJNGdRNzlzbFBvcTFVd2lsZ0NjRTB2d0dadFgxS1RQb2pYd1N6VW1n?=
 =?utf-8?B?TU4zNld6bm5hc2k3R1p0YXB4WWIxOUZySDdpSFpvWkZFTUppNC81N0M1S0dC?=
 =?utf-8?B?RC91MW5kM204R2w4U2ZNV2VxVm5LeFpEQUNGZWkzN1NYMFFZZS9EWitjY0Vs?=
 =?utf-8?B?SUI1R0RnSmp1SFdHUkRHeURLTXdldmZwNXc2b08zZzNBZHF3MFFNMkZiTENr?=
 =?utf-8?B?NXlnQmgzSzhLS0RCamJNbUw3R3RWOHhJckZjRklva1J4ak1VTURHcWJxZVor?=
 =?utf-8?B?OWVNRy92Ty9IZXdkYmFKZzVUUHZMV3JkbzZ6cUF1eTQzc2g3ZzB5WDNyMDFN?=
 =?utf-8?B?V2tmOG9DNXM1UnlyN1FKLzBZRnVWWU9oUTd4TW1oL3NFdE1QK0FEbFdzR1RN?=
 =?utf-8?B?Z1RlTDN5VmozS0FWL2VhNXRHNEpscUZ0RFgrN1VOQWhKWUgvcVF1RGRwaTNP?=
 =?utf-8?B?SEFvd3owczZYeFFUcm9aQkhodlYxSEM3WFBCQktzR3dSUk53VkhydlZVOE0y?=
 =?utf-8?B?bkVMaXdldFduR1kwekVYZkFLQW9QNmczWWhnT1g5dmlveUYyb3FRbW9xRGF4?=
 =?utf-8?B?WnczQWRMNDBUVVlEaFhrdGlkVEVQcEtERVU4UHBUbDJ2RlFpanRpWWl1aHlC?=
 =?utf-8?B?TEl4ei9ieW1oUVBxL3dJKzZnTTgvVzVIMStLeHl2cWxscExuN1BtV244Rmsr?=
 =?utf-8?Q?bZfYzeWX8j9NwA9NKexcMZBW1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8e33d6-cb8d-490d-8b3b-08dd78f6cd7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:45:56.4052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g0w9kNgVZHHMO23OlsCWqUv/10OmLHaE+lm1kDMAFVOh+GO7WWejm5Z7AA1iRgV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6767
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

Am 11.04.25 um 14:02 schrieb Boris Brezillon:
>>> I guess this leaves older GPUs that don't support incremental
>>> rendering in a bad place though.  
>> Well what's the handling there currently? Just crash when you're OOM?
> It's "alloc(GFP_KERNEL) and crash if it fails or times out", yes.

Oh, please absolutely don't! Using GFP_KERNEL here is as evil as it can be.

Background is that you don't get a crash, nor error message, nor anything indicating what is happening.

You just get a deadlocked system with the user wondering why the heck the system doesn't response any more.

Christian.
