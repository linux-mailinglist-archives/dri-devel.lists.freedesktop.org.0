Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451FAFCDEC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF66110E676;
	Tue,  8 Jul 2025 14:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uH5R3MYc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79B910E662;
 Tue,  8 Jul 2025 14:40:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fihEw9TVHmW2j19lf0zQXDiMFYIJNlSKXh8agNx0XuFwCIUKywA8//WqrueOeXzKKPVk8JlohX44cQa+7FxNiSSFyvOJun6rOk9guVI1WESvxRD5VgrfB5kg0rvfHsAqmySisGIT6db+jAcjKDlvu5Z4pJQT6ZyAGtgY8xs1C4kKtzjkF6oK69OVBd3jpPNV2hnR0SgRLBfTNOtkpQ9T4UfdXwzzoKz6csh9yDtklTJPOuPQylFPfOpfx/Lzi0QtZ2yykTWqJX1N4sEZUFQkZjOOiIQn5U00msqjzDrTFdKxCT4cbSogeY5H1obnvTb7aSkW7ll6iK6dvWJbX6/TJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q01eD6iiHAHvjNC3slmkZd/eJluU8Zcf45p5kJ9sceg=;
 b=VgQlwdzfzozPn5kJds48mucK5Lkhz0vhQTZLLyicCdsz1np5XFny8tDDaAK2TdJONUJWO7qqL6RglaNKea+zrXfBbDeD8LkqUavRP8sfau7TvOu5E8k7gnW28iGTylCmDa3KUOfmqvdsv05i4Hj+UkN38X34SOosnO1n1G+/YBqLysgSy8bUzyKrfx7szxPtkMAW1Fo5SVbzA0KfIHofdtuV9i4hdaDDVIlVSW0rMTuOQYRrG+g8iH07Ytjg5w8SJIF98Y6n7o3H76m2dEKY/idyptTGOUDRQS/7EHdCEELUWgUzVWImRuUSwPNTvpGND3qiB+cE4bki4jPStdJqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q01eD6iiHAHvjNC3slmkZd/eJluU8Zcf45p5kJ9sceg=;
 b=uH5R3MYckdNbCiOwe3hbvs3nR6I5S7kVkpOQhklHELUUZy8cEe8XHhrrBK0pF6IEwP+W5JxrNzBjL80x7dxMABW/9MpvTCYtMUK5mUTsp1keP+3WSWPgMTSq2mHMEEkXkr8fhbWA6YZTbcwKnYdMc4VGRZupPV4vP7RbKI+TJNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 14:40:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 14:40:06 +0000
Message-ID: <a23ee023-3e70-4d49-8f11-7d5798ca7576@amd.com>
Date: Tue, 8 Jul 2025 10:40:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-6-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250708074248.1674924-6-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0370.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e679f4-d411-405a-138b-08ddbe2d5486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkpKV2MvRkoyVjRoUGpFbW5MTzRuZUNocFlFYWdueXNLQzFraEQvcUNJQTF1?=
 =?utf-8?B?VUVXS0w4VnJxZTc3TUJ0UHo1TGdyYjJyZmpJQy9IMU5HMzZQUm1LSW9SZjRZ?=
 =?utf-8?B?T2RWRWw1aUtTNWxKcEowZ0lzRjhEYWYrY1Y4amt6M1pTOHFaVHhWbHRQcWhW?=
 =?utf-8?B?djVYUjlaMTFoV2VsbGt2OWFSVkhJS05nTFJ3Ri9hTlJqMXJoNGNLNnU4NWZw?=
 =?utf-8?B?NnUvQWhwMFpORlpFUGpvY1YvNll0OFVxMTRtWURheUFrWDBKeDdITHdSSjY2?=
 =?utf-8?B?UUhmRmVLdEt2SjZoVzRDaGErUjk1ZVdTYjRJTFVYWGNTekkySHQyWm9aTTc0?=
 =?utf-8?B?QjAwSm43dlQza2hiZFlxbXdwSjFRbDJmd1FxdDJXb2k5dmNtN0hGYnM1NGpk?=
 =?utf-8?B?QjZwWGlxdGxTdmxUMFFlS05RWlEvcUYxQkhvOGVJekFlcWFNcjQvdzlDSDFo?=
 =?utf-8?B?N0NNRHlLQy9BMEsrS05FTkcrM1RyZ0NQOFpUTklnUFZwYzc4QW1uaFlkdGto?=
 =?utf-8?B?U3dBQ0hqK0FkNldPeDV5czNXbjV0aVB2bEc3Zmh4UUNSams1VTBtdUw3eGgw?=
 =?utf-8?B?c0NiY3VaS3cxNWRxSmZhQ1RrZklXZDlScm5RQ25DaUhVNzBGdU9oWlNFcGpX?=
 =?utf-8?B?UXk2RU1WVm5RRzNFK3B4VFpTWjdWeGFua1dSQVlGS2dzM1R5VTloL1NNWXBQ?=
 =?utf-8?B?bzUvWWQvQkpWSnIyWXdtRlI3L1hPaXdQMEcwUFMycDZ0UnMwODRqMFV1RFcy?=
 =?utf-8?B?SkU0c1BvWjBURExIUW1UVEorU3QvVEVURjZzSVVvSElVRXFEOWYrbTV1dDdY?=
 =?utf-8?B?ZGVrdCtMa3NxMHVFUHpuRXNLUjRSUzM0L3pCblh4QS9NRlpZSDJDSG01a0JT?=
 =?utf-8?B?MkpkU0Q0dy9qVHBmL2ZmUGlOWGROUzNpTjg2WDJSR25YS2dxeFlzT3cwU1ZE?=
 =?utf-8?B?cnEvdzJOUGc1eFVxUTA1RkJ1bDRzejU3TENKakFXQytsWUp5M0syNlFFMkRB?=
 =?utf-8?B?RzNYTmJoMlFYK3YvcVNqbzdlOUFESERsNWJ4d2V1L1h6UkFMS3loOUFScVZJ?=
 =?utf-8?B?c1dPQ2I5NlZvb2NzMWpKOThwTC85NVkybm5WRk1DS0ZTOUlId2RMWEhiKzkv?=
 =?utf-8?B?RW1EeEo4U3pmZVpiTkJpT1NZREljUzN2b09SRVBSMysrekMyUDc4Tmc5dHky?=
 =?utf-8?B?L2VKZml5eXZHYW9mb244THZHby9xZ0RMRloxU2FzZXdMNE1jb2V2d1ZYN1FT?=
 =?utf-8?B?alc4bzFMR0J6Q3gyUVNTaklmRHliQ0tWZGFGVVI0ZzdweGY5ZTZRaUVwOVNt?=
 =?utf-8?B?Ui9vbk1DUHpXenV6N0p3K3p3dk9qSHp3bzBVR1NadGN4aFZzb2xRWnBrMStE?=
 =?utf-8?B?OElsdnZQeU1jMVgzc2ovSEVkWTFPYk1GVFJFWEVYNytoN0lOM1l2YnQ3VlNX?=
 =?utf-8?B?NEVCS1IvMVRabUdGbVdnMDFSaWFGTCtWSndmMTE3ZkxWYWxZcnlabUs3Wkpw?=
 =?utf-8?B?Y25VM2dNNVFWY3dYT0lSZzlqVEljbnBxbVlFcGtPbzJLSGF4TXRnU0N3Q0tS?=
 =?utf-8?B?UjBwS05PbVJGTU1wajdVT3FQMURIT2ZkRVRrRGhobCsxWFFELzA5OUVXSnRn?=
 =?utf-8?B?RGJsSlAzNzk5QTVPUXhsRXh4YmcxcEFDZWhVNzBlOU1xUkhvbkdVNy9LbVB6?=
 =?utf-8?B?MFF4VVBzS2JPWEptQlYvS0oraG5jRkd3TUE4OFgvclZpUEgxTWk1bk54RDNh?=
 =?utf-8?B?dWdwWW9XaStIQ0dtdVFVekhKSUdwS2cxWDFtbUtYandXckgxeDRTalF4cUla?=
 =?utf-8?B?NTY1Q3pBMVd0c1E2SGNvTE94bjB4b2dUUE5CRHRLUXE2QkttdUJYZEVVN2NH?=
 =?utf-8?B?SjhaOTlsZytvbGFBMmxOYXhSWUJTVWltekZXUUNHVlR0bnl6Z3VNRFEydlhI?=
 =?utf-8?B?NTNpbDF6TmRQVHVXMC8rMmVJZjZwa05rQTlZTWkzU29ZMXV0K0QzdXUzUkxi?=
 =?utf-8?B?b3M4eDdkNzNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHljMUdsa2N5Z2ltWFhNTDI0eWhlSElKTWQ0ZmVHWnpFbnVYYk4zNEp0VGlY?=
 =?utf-8?B?ei80ZGVpUmdHbGNwcnpqYlB2Tm9QbzVkazZWSEZsT2E5NGxFZVhSLzlqL0RP?=
 =?utf-8?B?bFFxRFZ2SExIVVZqSVM5ME9BaGZ4NnFYa1V2WkJDTVBQQUl5N0M5ZkZTa0dZ?=
 =?utf-8?B?cU1sUlZKS040NjZOWGpkVCs2RWMxb1BsbzMreVpLSUpZemhwc2JNV29GSzBX?=
 =?utf-8?B?aTRGOWFsMHhURWt2NkdGdlJJTm9GdDhIdnlDWmRwVTJHQlZ5K09NdUtrNVdv?=
 =?utf-8?B?LzNBRUpOcjQ3L1JYOXVwNWxoemtVSnJKWHh2azhxbnJBY2NFTUZDdUhCdFVV?=
 =?utf-8?B?N2hwRE9WMnJRUjcxRjNZdmpkOGVscE04TW1pbzUrdEdINWVFcGtxM1BadWlH?=
 =?utf-8?B?d3I0bXZWbzFNOU14YU82Y0hIaEpDWHB2ZVdFcjh5dTVaRkdJeXpUTmlnVW03?=
 =?utf-8?B?dUJPdG9DRWN3RE5ISTROZHRPMUl1RXQwQ0NSckxCSkRsOGV2REcyWVl0Yzgw?=
 =?utf-8?B?djk1ZEhCN0cxc1JsU2ZKM3NVcTFuVHVTUzVaZjRxeFdNVjZYdVBnaUYrT084?=
 =?utf-8?B?c0dJaTJtR0hSOVQyb2FRcXdQT3dkZGx2a29yRmZoN1RBeThlY1JyTHBuRVk3?=
 =?utf-8?B?dTYySkhwcFlqU2RkRTNQNXhlZDk4eWo2b2Y3amdreEJjclZQbFpaTjhjQnhN?=
 =?utf-8?B?S3hETHZvNThGYk1aNEpPME1qQTg0UHNqYTM4OVZHZ1lLcWl3L0JmZkhVdjBk?=
 =?utf-8?B?VVJSRFRWLzZPai83WUtVV0M5NUVXQllnamhkSXprZVEvMCtIVlJqd21QNW1y?=
 =?utf-8?B?VW42dHRRNzVEZjZZWmlxY0sxVFNPanhNcXp3YVRFcGU4TEpQQ2E3bnQyb09Q?=
 =?utf-8?B?eE9Od3ViS3Y0WHBjbFZsUjlWVmJjZEZIRFdiZEZoYjk1emhrSGtGQ2ZwcTZm?=
 =?utf-8?B?RUdMMXovdTJjcnJRRmpvRy9BM0FJdkdOc2VpcExzN2VaMEZRR3dsdFprdGx4?=
 =?utf-8?B?T09JNGEzd1hPY3JhQm5KWEZ2TmJ0eElhelJGaWRvTkJiNjRVSDZJU0Z2a0FQ?=
 =?utf-8?B?L1p3dlNFUzR2YmUzV0pXVVJqTHVxTzB0eVhuMmRlMjVDNituQ0ZRc2R1N1cr?=
 =?utf-8?B?bFlHd1IzODViZVNZL1o4R05tVVBmWk0xRUcxYUZ3cHNyTmV5T2h2WUVrWjYz?=
 =?utf-8?B?Sjd5U3NrR243S3BqOEhNTDNmQUJraVZ6NmZRdnNjSGFqcFNMcG9JQWxLdmVh?=
 =?utf-8?B?SFNSR2R6eGhjbnRCQ2pkM3NxcHptZ2JRd3ZRRkJZYVI5KzdhTmJ0RlhJTFRY?=
 =?utf-8?B?STRDZWs0TzJaSWR4bElMS1Uwdkt2SFhwMDR3VE4wUGRZVFkrM0dVYiswNkl4?=
 =?utf-8?B?V0FKcVIwdXZqeHIrUnV6MXd0cys2WFJQUHJxRm1qajBjT1VadTduK1BXR2VX?=
 =?utf-8?B?b2FsZXJMeXdMOHdpOElSMHhuK0hBWE1kb2RrL0UyOU5GOTZOS25ubCtlQi9t?=
 =?utf-8?B?MHZHdXlwYzY1OWV4d3Y0RmhPeVhJb1VlOUpieDBjYjBxcmdtNkt2RUt2RXZk?=
 =?utf-8?B?SEdKNS9hdmhXdXBZM3JTb0tMaGNMM0gwRWtheXF6WDNEMWhYeWRwYWhaQjZS?=
 =?utf-8?B?MTJ6U3hwRnZad1MxeGp6N1hrYUVGWXVtbnZjWkw5Rmc4R0xLb2N0NDB0L2V5?=
 =?utf-8?B?MU1OazJKN1NRUjFIOXcxZUxpQ2NoZDIvQy9ydTkxOVNjeDRTS0Q3T3BPYXRN?=
 =?utf-8?B?dkgyb1Q0UnRYMkpWNzF6ZUdkOWpPdTNrV2lYOVJFR3IrRW5lUUVuWXhSV0ov?=
 =?utf-8?B?aXlMTkYrVHcxaFI2dmF1UkhwajVNTjRhZ1RxTkVVcWhncFErWEhuYkhvN0ZH?=
 =?utf-8?B?QnZUQ0UvS2d5Q1kxM2djZDAvb3ZvcU1rWmUwbnhXM0Fjb08xMklxeDRoN1la?=
 =?utf-8?B?eWxlYnBhQW1Gb0tjblRVbmpXODJicFEwMTBLSnhMb2pLVXlxUlRhc3dWeHB6?=
 =?utf-8?B?b0dxdzlGL0YvMTJSbjdqUXl1TXJWaWFaT2NYUEFONHQ0WDkvTE1IVjV3cGVN?=
 =?utf-8?B?SEgxcVIyRGZOdFY0U3VTQnRDQW9tQS9IZ1V6ZmJTNDdmellaTjY0VWFSTmxm?=
 =?utf-8?Q?1X6W7H5H91TMUnD3EmuvFZklK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e679f4-d411-405a-138b-08ddbe2d5486
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 14:40:05.8921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvYLqr4ESARJ6fp12fgveh2berPQbPq9aGsIWe2Gupd+W60YXG59PExgbpy8h6oWhCZRJWQ0S6MCvBeM7vftmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655
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

On 7/8/2025 3:42 AM, Samuel Zhang wrote:
> For normal hibernation, GPU do not need to be resumed in thaw since it is
> not involved in writing the hibernation image. Skip resume in this case
> can reduce the hibernation time.
> 
> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
> this can save 50 minutes.

If I'm not mistaken this will also have the side effect that display is 
not resumed in the "normal case" too, right?

I know the GPU you used doesn't have a display, but I'm just thinking 
about the callpaths and implications.

Would you be able to test this series specifically on an APU with a 
display connected to eDP and no compositor running (so no DRM master) to 
make sure it works as intended?

> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4f8632737574..10827becf855 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>   	if (amdgpu_ras_intr_triggered())
>   		return;
>   
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return;
> +
>   	/* if we are running in a VM, make sure the device
>   	 * torn down properly on reboot/shutdown.
>   	 * unfortunately we can't detect certain
> @@ -2654,8 +2658,17 @@ static int amdgpu_pmops_freeze(struct device *dev)
>   static int amdgpu_pmops_thaw(struct device *dev)
>   {
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +	int event = pm_transition_event();
>   
> -	return amdgpu_device_resume(drm_dev, true);
> +	switch (event) {
> +	case PM_EVENT_THAW: /* normal case */
> +		return 0;
> +	case PM_EVENT_RECOVER: /* error case */
> +		return amdgpu_device_resume(drm_dev, true);
> +	default:
> +		pr_err("unknown pm_transition_event %d\n", event);
> +		return -EOPNOTSUPP;
> +	}
>   }
>   
>   static int amdgpu_pmops_poweroff(struct device *dev)

