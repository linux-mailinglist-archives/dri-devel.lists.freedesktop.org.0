Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1819AD94C9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA4610EA40;
	Fri, 13 Jun 2025 18:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MwyLz4Rn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA01210EA3B;
 Fri, 13 Jun 2025 18:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwIPeMw45kb5OT8W6vR4SeybSYF+5OoyEJm7Igcm28Onu/GbL1RHJSVC691aCWKC818CljI3NR1A7oii2Nv6p2l1MT4nV9PpnV0JEKzNJW066mgnuQWkqJuXYp3ThW3H34ws4Sxihk+ySiOBIr3v4vKmxY2+01ee5pzvf/6WgBLFuoIs2dQkdKKs1ZaAh/Dns60/Qr2jdpVihiZ/LI6KFnxAo+85gHun70O+kogMqOrZO3jrNwTY8ItPFc6HcUQQ9cKWFo3nDUPK2NRILXXAdKxBjvOqbOmpTMYkPGA8DhIoNnefhlgXeIalE+f0ENrXcB7+JCwtC0EtBNdSEe71Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27zChiFPTKWyP+7kITWejAG1En9aCYIqVtZWNp126Gg=;
 b=zA+rCzwCVM4uWdM2/o6Eo5t3ZueTkRGNnQPoV+qtCxLZndI8TmzK8c9jQbW1AbK9KFQfkph9TKOXIhhopTuufFMCXnUF053F22z3jqj05uyCD6TaHVTTCSn+9pK4dN1aZHuKIyvhdSaVrieVv4lckoCRmO2F9MGYlBY+95lQf22ODY8vqeQn0ytrvDNyd0dujCpUbtRnIhv6FoaFjUJpRCzZLoDF5gsnbydrhW+kHlaydujspeT0jLhW04avhk6wn7qEYlxGcZsoi7TgWGvZkd2RikHG08ktSP0koqPsudkc5m/zkjMFrG5ZIF91XR1oWJFC/UniES87MzXxS+ZnjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27zChiFPTKWyP+7kITWejAG1En9aCYIqVtZWNp126Gg=;
 b=MwyLz4Rn7I/HxyoiV9Z7tXvGTbNNV9abxzkYlf8s1AaLW5KaY5SGdDkqdPi1iFXO54xPY0mr+80fK4OXZ4/ZS5c8Giz6z2TiDGRn72eQnCYFS0tGXrFfnPWjqUYOO5FlbbVDLIpNmVqP3U4FTHvibkHGsqa2c1WJ5ySIx8+wsgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 18:50:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:50:55 +0000
Message-ID: <242fd6e3-aad6-4704-8817-6ab4e45aa493@amd.com>
Date: Fri, 13 Jun 2025 13:50:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/14] drm/amd/display: get SAD from drm_eld when
 parsing EDID caps
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-7-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-7-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:930:8c::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: a48ae875-915d-464e-9285-08ddaaab3a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1JmOWVlWUpuWmJIWXg5REIxalFqaHVkc0tRdUE3K2ZvbUJGcmZOY1VsY3c4?=
 =?utf-8?B?NllHNWh6cEJHL1hUMmZTYnpSL1ZyZW1rdHZ3TktIalh0b1VPWWxBZW1pZ3Q2?=
 =?utf-8?B?Q2xKUDl5NkNmUDR4NXpndy82L0tPUnFMUStlZmVqVStBd2VGTWFmeDNQeExx?=
 =?utf-8?B?SGluUWZ0eVp5d1lDMThseC9iQlVBVEU2UkNLVlZUSDFlLzBMT2ZMTEpvQlh4?=
 =?utf-8?B?alBTNi84SVlLSURDUS9wOWlpZTRPQlhrd3BiUmNnY3ovZXYvV2RTSm11UTB6?=
 =?utf-8?B?dm41QjlNRXJKc2ZnMjVNajMrL3RLdWlDM0tiN0NQSjJTdzhPcTVmR3JISHVN?=
 =?utf-8?B?bnB3ZjE2KzFCM1hVRVlmZGRwUGNseG0wSEZBRkx5K0VCWUY0UWZFZm9SdmhO?=
 =?utf-8?B?WHJKSmh6bzVRTnNaakIzMTNheDg3N2wyQUQzTGxrSUxTKzZ6YnhmSUhyQTZm?=
 =?utf-8?B?UnRKdDB0d2xKcDBXZlJaVjNvUEVXaHdmejBjUTAvZCt4bEpTYVJiVjhiM2Fm?=
 =?utf-8?B?TGkveW4rQ1BnbkFDMFRyRVU2TmFJL3dnRlgzdFVjNzNQS0llWnBLQ3I3VjFT?=
 =?utf-8?B?cHlEeGtubFJ0c28rME80d3lqWFAyR1RzY2lrL2JTQkJWajFxTzlWVGJCdVJk?=
 =?utf-8?B?RlpOZFFxL2IvWnF2MU4xcjkxNnJZejJKRjJkMFFhZUkyTUxqYk9yVTdDeDVl?=
 =?utf-8?B?ejNlTTFDb3hWdTNISHd6WkhBc0FwZFl3UXl4dmwrUzBwTVpmSngwMy8vM0VI?=
 =?utf-8?B?QUtpUWVidXh0QlpZYXpQWEVvL0ZrMkJCbDNSaVZtM2p2RDhlNzhvQ3hFaThG?=
 =?utf-8?B?N2s0WHNXc0JFNVJmQ05iVW1ucTE3TUZlTENVUlpTSUhySVkyQVJGMVhYY25Z?=
 =?utf-8?B?SUdycUhFWk0vU2Rzcm9uOUdsZjZrVEhJV2Z3WmgxMEVKTk81bkg1ZkxpckNq?=
 =?utf-8?B?OWFzdlpkaTFVYzNjRkRSZWtTZlhpU21vaHpCVnFWM1JkdE4yOVhGczE0YW1I?=
 =?utf-8?B?K3lPQ2s5K05xVktPS2wxMTdKREtwZng4eEJ2KytwMENtSkxibjhObHlCcndZ?=
 =?utf-8?B?ZE9UakxicTEvc1RXVWZRWk5LeHc0WDhscnkxbDRlcUVxQUcvQ0QrbjZCL1Ny?=
 =?utf-8?B?VHVlU0dOTWJYS0xWdmQrTnllemt0U21iSUFVbk1sQTh1U0Nqc1hxdlhQRDJa?=
 =?utf-8?B?bXpKVTJIdTh4R3czZjI5Q1VLeW8zNkpWbDVLUzB1Y0ozWFZZZFJVQXdWbGNC?=
 =?utf-8?B?NG5tT212bzZRUmd2ZWNlcFNHQ1d1OWk5MysrN0VBVmpJTVRZSGMza3ZsL1hT?=
 =?utf-8?B?SW9QTDdqZWdDZlFSWXZiT2lHN3dOSnByWVp3Zm5TYzlsRVZSRFZjaWdVOW5X?=
 =?utf-8?B?OUdwSzlNU3k3cFJxNHcydXpNMUk5b3hHR1NhemxsKzdtb29SK29PaDVDMndG?=
 =?utf-8?B?OGV2QjBYUkVjMDJBZ2l3M1ZKWlhDeEZqQVVxYm4rNjlxN05xUlNTVGYwa09j?=
 =?utf-8?B?Ty81NXFLMVZWRGxSVXZKbXE5bVZjNVM2L280Y1VuenNrcU94VGsyTVFkbzht?=
 =?utf-8?B?VWlPR0JJdGFCOUlhekpXTXBFeEQ0N2VUN1l3SWNtVXFKS1g5bTZ1UzlmYWtB?=
 =?utf-8?B?YVBGOW8xZHVpY0RJY2JpLy8wa1c4NmJUREFGT212WEZ4b2pwWDIrQ0QzZDNG?=
 =?utf-8?B?dWxpc1AyRnVBQ0trb3pmdnlwK1k3M3RqR05DbzlscEFFQWVmQmFSTUVxY3Vy?=
 =?utf-8?B?djZ3Y1l6aHh5QitzTWpFTlVnSnZHTXB4R3RJMHRQVHY0MS9ySmpBd0JCUmlt?=
 =?utf-8?B?eGY5Q3NRTVJYVml3d0ZrRzVMeGhhaEgwbG5FT1ZJeHd4dzdFVlR0Wk1VSkxu?=
 =?utf-8?B?cmU5S3lqcnlna2lnV0ozbXFrcnBpM3Fsc1YzSFdRblcxNUhXOHg5ZC93a0JD?=
 =?utf-8?Q?6k2RdfjCPlY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czZZVTdzdVl2ZVA0L1JaclY3WnpUYi9qZ1pVaUZuZUhybE1Kb2h2VmZtemhk?=
 =?utf-8?B?aUFnME1tb1psd3F5S2RUcmFCWEZqYU53Vm5oYXNZa1ArZlZXdmRNa2VKcEVw?=
 =?utf-8?B?NndGVDVna3h0U1FtSVVYOXN6aSszMTNySTFYdW13YkhKMytNUWhoemU2QnpF?=
 =?utf-8?B?VGtEdGtTV0JiYkZrbHRWSVUzVmdCTXhLdmlZSDdLQjFrd0V1WngxSEV1RXVh?=
 =?utf-8?B?N2FvVVp4dENURVVEQmJJaEY5dS8xNGY0NjZoaXBoN3cvQTNRSDZJbHdER2hj?=
 =?utf-8?B?ZUJHZlJWTlBsYTBxK0pkUldsM0YyaHdJVTI4YURtMFR0eDVRU2lrUGFmR1Yy?=
 =?utf-8?B?bDJIRHIvZ2RESUFXUmNGRUVIQU1mcG5mTlRDWHkrR2tON1ROUXZveG5ldW1l?=
 =?utf-8?B?am5KRWNCOFJlOGJERFNwaE9xUk1oWXlsM2l3bTFTQlVuR0RNa2VLU1k1b1ph?=
 =?utf-8?B?Qm54dXJZelEzbURtWnJTWUt1Vm5POG9qV2ZtZ2kxbHd1ZDluL2tseU9sVDZk?=
 =?utf-8?B?WkJlamNFV2FxRldWN0UzMWtmUnVpN0NxQ3cwb2Y1R3ZybWdFUVBzV09ZWmhj?=
 =?utf-8?B?RzlzSGJkTm5RZEFIYWZscTdhMy9oMUVaUTE0N3JId1dOYTYrUVkzbUoxSXZ4?=
 =?utf-8?B?YSsvS3QzQm0vYlZLdGZYd3hJNE1Tbi9Xd3l2Y1lmczI0ak9WM0xNOWl5ZG1X?=
 =?utf-8?B?ckMrTWR0YmNPQ21mQmlpVFBxOER0bGFDVFVQalZSSS9zKzh1Y3FkOUd2QkVH?=
 =?utf-8?B?ZVNjNUh5NUFIdHBpLzFVeEk2cGx5YkRPM2JTcFF6d0ZzaFg0ZXNabU9ycXE3?=
 =?utf-8?B?eFl5R3Qram5IbklnbGFVOEFOWGFXdHpRZEtnaW9qYm9vN2l6NUhReXAxa05q?=
 =?utf-8?B?WDNUeUVxcjl2NDMwd0RCLzBPNjZMV1RuWnAwQVlYV2w3RktMSUJUVFNuNXQr?=
 =?utf-8?B?NEt5SDJpL05LdnNvZkFHMHk3R24vYWhuME1TVVBZenJWRU93azJibW42QXFS?=
 =?utf-8?B?TlJ5MWNXeG9yeHFMbHVLbmthUExtUlpNazV1TE1vd1hYL2d2ZnlTbWdKTVNu?=
 =?utf-8?B?SXd2ZlR2NnM1V2E0NUV1UTFoR3VSRzlubThxNDFjVzZOZlY5THRXRUFXVVhM?=
 =?utf-8?B?bnpWMXlINTdXV2xqR0oxK05vQnJ1M2FzTC9DS2dpVjBZblczTEZuTVJjaEd0?=
 =?utf-8?B?K0Y1OG1HREJtSGtvaFBPSGppUVZLSmVJRUQ4aXpLbE5yelU2N3VFL016WFFs?=
 =?utf-8?B?Z1hxaG5wQ1pmVjFUd1k0R01IWXNGeHhYbndpSlMxTEh4SngvOXo3a1pLRUhx?=
 =?utf-8?B?WVJwcU5qbVJ0STgxeWM2SFVoUXpkdU5VOHJLd1g0OGlBSTZhRllXVDdzZVRF?=
 =?utf-8?B?OVNHQjBhRFlWUmxmeGdJbTY5UHZIWGlRdmo5eXNmM053S0xob2poTjgzakFr?=
 =?utf-8?B?R3ZXelhJZUh4WHZESzJhUlB4cm0zNXBLZlFSc3pzcXpkTEdYZ0wvbVh2dHZE?=
 =?utf-8?B?eW95VldHSVZ6bUo2aFhEQlFjYk04SHV1ZTJqOXBLS1dGV3ZqcTJIRGt4ZEI5?=
 =?utf-8?B?VUhBMDBveG5WaFV1ci81MXgvbG9MQ1duWkF3RmRnVjRneEFGQWlybEhLSloy?=
 =?utf-8?B?ZUtQQVI3cysrY0FtYlc5ZEJSQ054RHB0YXVqck0xblh5T3ZoUUJ3Sys4cXB6?=
 =?utf-8?B?YkpYd0I4elBsRmN2elR2Z2lZUSt3Y3hYc2ZHejZMWjBocHJiZy9YUWZMRzRz?=
 =?utf-8?B?THJpOWhwSmdlbld6SmV0Z2VtVS9DMldFU25Wd2xMd0t1dGFXMGV5cnczSndZ?=
 =?utf-8?B?aTdEazlkUUl0ZzFtbCthaHBhVmo0dkRMVEpRaGkzMkJxYTYwVERmS2Z1WDNt?=
 =?utf-8?B?b3lOVUptcnJrTlU4YW5HOU8rSFNEOXg1cDlneGJ1OXBPVzd4VDF2TXdBVjlp?=
 =?utf-8?B?eEFJTlVNN0ZaWjBzcjhuSzlrVzBmdWJEVjdiZjdNZXJuRU9zOU9GZ0dXc2JL?=
 =?utf-8?B?RGh3Q2FRcVdnR1VqbHR3WXdCT0xISGdUY3diWHVONmVtb20rcVJwYWs3ekhD?=
 =?utf-8?B?eTQvYlZIV29OWGo5K050YUZaZmFPM25SWkgzS1gvcUpWV2JqdlF6SGdHc0Ju?=
 =?utf-8?Q?PlpsglIXUJWzBf0/MHZnXw/W1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48ae875-915d-464e-9285-08ddaaab3a5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:50:55.3466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkpnXdtTaR9qehGhIRh/O2leF5P9Zw7h8EPfwhJy3WaZiWNZ7d4cwoNzczq8cT1J7uGIBel/CrkyoRWWwgHGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578
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

On 6/13/2025 9:58 AM, Melissa Wen wrote:
> drm_edid_connector_update() updates display info, filling ELD with audio
> info from Short-Audio Descriptors in the last step of
> update_dislay_info(). Our goal is stopping using raw edid, so we can
> extract SAD from drm_eld instead of access raw edid to get audio caps.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 22 ++++++++++---------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 760da13612b9..10af9db47c39 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -33,6 +33,7 @@
>   #include <drm/drm_probe_helper.h>
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_eld.h>
>   #include <drm/drm_fixed.h>
>   
>   #include "dm_services.h"
> @@ -105,9 +106,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
>   	const struct drm_edid *drm_edid;
>   	struct drm_edid_product_id product_id;
> -	struct cea_sad *sads;
> -	int sad_count = -1;
> -	int sadb_count = -1;
> +	int sad_count, sadb_count;
>   	int i = 0;
>   	uint8_t *sadb = NULL;
>   	enum dc_edid_status result = EDID_OK;
> @@ -121,6 +120,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	if (!drm_edid_valid(drm_edid))
>   		result = EDID_BAD_CHECKSUM;
>   
> +	drm_edid_connector_update(connector, drm_edid);
>   	drm_edid_get_product_id(drm_edid, &product_id);
>   
>   	edid_caps->manufacturer_id = product_id.manufacturer_name;
> @@ -137,7 +137,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   
>   	apply_edid_quirks(dev, drm_edid, edid_caps);
>   
> -	sad_count = drm_edid_to_sad((struct edid *) edid->raw_edid, &sads);
> +	sad_count = drm_eld_sad_count(connector->eld);
>   	if (sad_count <= 0) {
>   		drm_edid_free(drm_edid);
>   		return result;
> @@ -145,12 +145,15 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   
>   	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
>   	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
> -		struct cea_sad *sad = &sads[i];
> +		struct cea_sad sad;
>   
> -		edid_caps->audio_modes[i].format_code = sad->format;
> -		edid_caps->audio_modes[i].channel_count = sad->channels + 1;
> -		edid_caps->audio_modes[i].sample_rate = sad->freq;
> -		edid_caps->audio_modes[i].sample_size = sad->byte2;
> +		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
> +			continue;
> +
> +		edid_caps->audio_modes[i].format_code = sad.format;
> +		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
> +		edid_caps->audio_modes[i].sample_rate = sad.freq;
> +		edid_caps->audio_modes[i].sample_size = sad.byte2;
>   	}
>   
>   	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
> @@ -165,7 +168,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	else
>   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>   
> -	kfree(sads);
>   	kfree(sadb);
>   	drm_edid_free(drm_edid);
>   

