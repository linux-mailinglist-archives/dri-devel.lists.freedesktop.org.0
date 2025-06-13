Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C7DAD9490
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A472210E930;
	Fri, 13 Jun 2025 18:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SyBWFaMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2086.outbound.protection.outlook.com [40.107.95.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE2D10E3DA;
 Fri, 13 Jun 2025 18:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7wjnZCUtOnoqMppoCh8leM2S8NsszGxVBdB2zWdNB+UJUdNUmhI8wnQ6//0bA7DO4/q3RtTJ/hf4w4liiR7ocotyGLWHGK34RHMzkF/6pdbVYzOUESmDtFsujU6MJDhkAqGokLYgcnX8wh+uCZrcc/mG98rT6oOwkGN02ClItUMTx0eAVwARzeFP3HPCPOhcglSslXHwcjbAl4fslUiv/TQBIQVcwSAiWVADzHhjezA6wfXaXLNgamU1Sk5gtzIC2j5u3jYO+WbWFsQiDvNhTnEGE9NvvWEcXlDHgxN8zmRdalJYENVdWJLWDIizLwB13SHp1rmoT7FzjPZgRdWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFYFzXqw0wHtS2cJnZMgRJNrxnibB5HIJoahOvusYNY=;
 b=OzXomhKrphEMmonI8zMaqcXMYhElt2ty1X/2PSl28V9C+hgMK0xkWB7gz+JhQ78oXCvv+bj9ekn1XXftRUhDxvsIBannz80Wb5K6eoMXwQIzTSpExs2DYDTpay8wYvuhFbUoEoN533rzc/SuNuR4ys0kHuE+yE7bRIWKvqF9RtViBB0H7bNhs9kh6Qm6ZqKZI+LzPV7bDl9pRMa65erFWQtFyxcokXDCU3VAH/QjTiYqAengbCedABEbMm47VNUM/YlpfMeHIrMgykebsCvBtJgbhNDlQHMBjvAUx9NUHME42/CTNPuNbe0pA1Qq0G8TuvZVV7sSC5QeK385SthlaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFYFzXqw0wHtS2cJnZMgRJNrxnibB5HIJoahOvusYNY=;
 b=SyBWFaMg5tKgO48gMA4RSYG0BwFdIZwhA9s9zrsPnJU+E2yfMlOkOw3eAt/sETk9JinpP+IWQsnnDrWTH7pvBvOGhFmuRJVcwhvItjlT8RvEKeoMQdfZ0ZxpY9Q0/n0XBENz4/ehJMr4r3yWkj5OC/mt4ZeRh6PAeRla3955gJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 18:38:57 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:38:57 +0000
Message-ID: <a2d55d42-ee5d-46be-a725-3bae6b6fb220@amd.com>
Date: Fri, 13 Jun 2025 13:38:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/14] drm/amd/display: create a function to fill
 dc_sink with edid data
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-12-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-12-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:806:27::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 7391c279-5d09-4888-7353-08ddaaa98ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dE9UNDZMVGoxa2ErMlNqRXZMajlWYUNJd0ZtSGsxWlJ5UDZIZHhjenhPMHNZ?=
 =?utf-8?B?WFRsbUpHVjhGZURweEk1SnRhWVZWZCtlanNIYlRwelBGeUs4amlIMGhoMy9a?=
 =?utf-8?B?TmsyVkJrbU80d0JrZlA0T0VJRW9ZQmZGcnVYcTg4aEtrMkZmdEU1QmRSMGFu?=
 =?utf-8?B?bGhCMkxCNTA5ODd2UVhGb015bEJBYjErODJYaUpJenBETC9va0JkTlpZUk5Q?=
 =?utf-8?B?eTJkaUNMcjZWbDE0UGp5VVlzNGJSSVBOb2lydGFITTQzT3E3R1laNmp4MDA5?=
 =?utf-8?B?OER4ZmlnTThNM050TG9pcFhFOW5QaXpXTjBnREpzMUYwcjRKZE5BSSs1NUE0?=
 =?utf-8?B?Qkk3UHB3L2FIY1hLOHNVb3d4WUg2MW1WOGpCdkZBVmpZQWlyaitRaHR5UGRy?=
 =?utf-8?B?ZmlHVjduMDAzc3Qya0hQME4rOWlDTGdXaEJFVzhlU29WVEN3L0g1Z1p0eFRv?=
 =?utf-8?B?Q203cExoMjliVVFhVmVBUjI1TFh1d0pYYjZpdU9ZV1RMUzl6OTRya3I4SVMx?=
 =?utf-8?B?cDV6cjFiQS9VRHJmZG9hZ3kvN1l0SVErWTY4U3RSN1ZZWm5memdPWEE1ZWRF?=
 =?utf-8?B?RlhmNHc1RTBuT2tmbmFMc3VTelBWbkkxbG0wOEdWYkZHcFVFa1VvT01RdGs5?=
 =?utf-8?B?UjFqY0lvQzJ5dHRYR3l4ek1Wdk1rbUdmREExcThmd1ZKcHRZRTJrT0J1VFJ0?=
 =?utf-8?B?MG5uYUF3aVNDbEo4V00rNjFlbGtqbDhLN28yKzlOTkttSTI2TG1La1lXc3Zt?=
 =?utf-8?B?UnJ5ajZZNE0wRTR5MWpyRHIyejFQam9rdkVwRGRFWTVjSCtlOEtYZDhRYk1O?=
 =?utf-8?B?UnUrWlFSYXRXcVg5NWRZR3ZLUWpqQUNFMWZiNFhGRkN1K3QvRlJsUzNiSjE0?=
 =?utf-8?B?OVhiTk83N1VBcEdGTzZkSHVYRkhRK0srTTZaNkx5VFhrRDZiUHFlTVpYb1d5?=
 =?utf-8?B?aVdBamg5ZFA3TDhxM1F3d1ZmUzJJUzVqZVpSTm9BSkZmNDcxTDFJQm42eE04?=
 =?utf-8?B?THNoS29pRWc4eDZKZGkwMWtpUlczMHhHbTZBaXg5K3I0ZFcyK1BKQkEza3Bw?=
 =?utf-8?B?VHExVy9nRVhxeVRSWWh1bHFyTUJjSG1RSjlhZDQrVWp3cVhXV0FrdU1mWll6?=
 =?utf-8?B?L0xiNTZsNTNnMTFCWHZvaFlIMUgrbHBJYllpSDduQmFYQkxWS3NmMnlmaU5Q?=
 =?utf-8?B?WEV2bzVWZ3BZUWRvd1RaaitSeEZQNDJvQXR0SktuWFhEUUw1SGpidnlFMnZE?=
 =?utf-8?B?VjErekRBczdtUU8ycTRURFN0cmpvTlFETFhGdmRxWkhHN0FtTHBTVGRXRk45?=
 =?utf-8?B?bk5RdjdkdkU4LzFFRi9FL1NFT01acGlrMmtLbTBDSFI3ejdIQ0J4Y2lYalZk?=
 =?utf-8?B?eFVudWxhdFpjakYweWp4eEVNMDRJbzM1OEU0L0RjdkZBaFhQRXNiMUVQRXlS?=
 =?utf-8?B?alliU3ViQXhrdWRreXZPOFJyQkZJUDZEd1JlZ05HMHEvODBXVVBQRmJ5TVRK?=
 =?utf-8?B?cUlsVkRaYStKay9rMjlVaWxZQnc0UXFYTXZkTGNQeEhwUEpheTJSYzNnei9z?=
 =?utf-8?B?ZVJsVjA4dE5jajhyU1IxclRGQ2dSVDltT3RvbVlyQThzbVJmNGRzbmJMbENz?=
 =?utf-8?B?c2R4TDNTbERPdEx2Wkw2bnBDUmVNcVY1aVQxc05OdWdWM1hERHloVFNXM1My?=
 =?utf-8?B?MGEzbno4SkIzUFVtWU9KZDUxZGVieVRGU3JiZjA4b0lMUGtZeVBZN1djSEU2?=
 =?utf-8?B?YVBFNWd6RW9rZTg0VnZ3MHZYUWpRelpiTkhtK2xEVmdkc09HTlVjcjFBSEtC?=
 =?utf-8?B?Mk1reUphOFJNY3FSV1pWS3o2endZV2MyOXllbEpkMEZvMEQvT28va0tZa1hZ?=
 =?utf-8?B?NWJzeHVZRWp1WWVKOW1aT0xUZ1pFbEwzd3A0SnJsRE1JT1pMUDJ6UVZkUTFa?=
 =?utf-8?Q?3n45fZq+sdI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmpuaERWaytpbGZxYkdTa0xLSGtZS0lRY3dQMkY1SlJkbG9SV1JBSjBKUnRv?=
 =?utf-8?B?WS8rdXNpRjVXUWc4dXZaOVBBUytPRzJMbEc4WXVDYmxyQU1icWpFRTArWWdu?=
 =?utf-8?B?Wm9YNWVIbFQxcDRPaytWdHJjS3h0RzJMK0hJTG5wc210UFFRTmhNbUxRTnp4?=
 =?utf-8?B?dWRlVVNUZEwvdnJHQzNQU1ptd3pNVit0OVlrbzVLRGhuYVg2ZUNneE4xYk1w?=
 =?utf-8?B?UkUxeGJMZWRJSXBjSzE4NXpPSXpZUmw5T01ZK3ZWRTFSTEEyMDl1djNCV0xx?=
 =?utf-8?B?SkY5QTNYSGNlZnJqOVV1TVl3UW5sT1dxVmVYWUZMRmhPMW85S2prU04vcjFu?=
 =?utf-8?B?ejU1SUlFT2o4dkxTM3lTMnZGUXFGT09mKy9tSUFVR2Iyd0tYSEFnd0dlWGRZ?=
 =?utf-8?B?YmpwUDAzaGRFVXNZeVZtam9ha01rbVlNc2lxNEZHRU1zbm92VWxEbDExS2Ew?=
 =?utf-8?B?Z3J1THJ2TCtoRDM3NUpoTnVlWjI5UW1jTUFMelM0VzBRZm1rZXl0dy9TSnA5?=
 =?utf-8?B?dk5BVm4wcjkzeU9SVDlJcE1yakpqRFRoUkRjZkVXc29iK0xURCtEMEZpOTQ3?=
 =?utf-8?B?S1B3QXJ0UmpJRWZVaGlPeTdTU0JuSllDeTdyYTJOYmRUdk8zUWxSQWl2N0di?=
 =?utf-8?B?cFhTTzErWnhxblAzYzNRaStrWGZYbUVqNWVWbXdRUmdiVklTc2wrTnRDbDNB?=
 =?utf-8?B?YkpWVlZtTFRxRDllbnFyc1BwYndJTUt2cUxhUndadlllSWpxWi9OdklpL3FD?=
 =?utf-8?B?WUFzNkF2STRYNStadE1xdU9ud0JKcE9NU3lYOVFtZUk3NlFBUHBVYUpaN0lH?=
 =?utf-8?B?UVh4eEhPRzVqejJWSjQvcVVSTS9ITUZBREZrMjZKV3ZMTFFDaU9lSHpDRlM3?=
 =?utf-8?B?eVJuTnNEck1IaVllL1p3K3c3Zlo3SWI2aW9wN0FzLzk2bitzOHNkVkd6b1Mv?=
 =?utf-8?B?bTliYU1XaXJ0YVIzSzRGaG1SdmtEYmhzVEZtd2R1OVdGRFNJVVQrNEZ0Q3Qv?=
 =?utf-8?B?VEt6R05SZkpFY0hmZW80ZUVmUjBtTVlPL2NzWWFNS05pVWUzK1d2VExEQkVM?=
 =?utf-8?B?MlUvQVJFU1RMWE9DakppdUhkekxRSUxQMTlmOGlOYkJZb21OM3BhTXRGQkVN?=
 =?utf-8?B?eDVpbFdUdTJxVVRmRWZETDRIMkp4R1QvNGRwTVBXMFhVM1orOEZkc0pLWVZM?=
 =?utf-8?B?T2Ura3F5YWsrSDZZcERsRXAzNmhBdEtYR0htcHVHY3BqdSsyWVdZdGhGWE9z?=
 =?utf-8?B?YmNITFJyQ0h2L2NKYmNkMndsRG1UTW5LUnRwdDRwK3RReGNPQzJQMndtbVRX?=
 =?utf-8?B?bkdlMzdkNTFjV1U1MnFQTDRHR1RZeGJOdXo0YXdqNklNeGU4VmsydG9TM3Y0?=
 =?utf-8?B?Qlc5aE9scTMrY056UlRnUHpyLzJtNk93UHdxMWlTc3l5d01BemhHU0NJeVRP?=
 =?utf-8?B?YWQwV1FrUlAyODg1dGtRakhiaFp2cmVBSTlEYXJBMEt0WkF3N0VKTXdOS1Ji?=
 =?utf-8?B?NmlSV2ZHendMMTljMjg2bWJhMmRsTUxnTEVZN3V3TkltQTNZOWFmOHcxUURC?=
 =?utf-8?B?d3YzektvTUVjWjhHbzJqeThMOHFsVEZDc0svR2xQSlJrTEhURGNTSkpGRTVr?=
 =?utf-8?B?Y3hJczdZQnlXeTVBUk9xRU5ra0dPZUhGc1FYY0VESEQwQ1lkajlQaDREcXQz?=
 =?utf-8?B?SDhrNTNlcjYvdzZJMXlpRCtmeHZ3YXRlNU5JK2wyVCtxeEt1bXFrSHFURjgr?=
 =?utf-8?B?TEFZUDQ0SHNZUE1lT1ZoS0poZFB5UTNDaldaZFozUDFWM1pUcGtydVZPTmQw?=
 =?utf-8?B?TUZuZEp1YXV1ditLa0Q2Ujh5Y21FR1pHLzZHeUlpRzlGLzJydWxxMmxNaWFC?=
 =?utf-8?B?S1N6MXFjMGI1UUYzbW9FWCtmRnB2elJCU043MXNsYWRhcWRGR29RWHhaQkND?=
 =?utf-8?B?Z1BobmRYcUxFMS9JODVZcFJxaG1oZ0NSV2FndUIva3FHVVVPUDh3cGNaMVJC?=
 =?utf-8?B?Vzd1WS90T3c5c2JWbWZLWWJhTnNPNE5udlNndkpLQUVTdjZwUDlCU0h6cGd5?=
 =?utf-8?B?b1YxcWRyT3lJR3c3emFuN3hCQVc2UmpPL1B5RGpzUWZycTNIRGVGcUlsL1d2?=
 =?utf-8?Q?yGOOR+wZneQ/MvIf46QbvyBAW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7391c279-5d09-4888-7353-08ddaaa98ea9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:38:57.7777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uvfwdbf6tVU9Ezh0MGhwNZECqvmkyQk0fqKgwKAYqpPHSdl3xdUVJsCR2XBXHjEXhGQM0r9IuLtxAIu3wWkD6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175
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
> From: Rodrigo Siqueira <siqueira@igalia.com>
> 
> As part of the effort of stopping using raw edid, this commit move the
> copy of the edid in DC to a dedicated function that will allow the usage
> of drm_edid in the next steps.
> 
> v3:
> - remove superfulous cast (jani)

I don't think that changelog needs to end up in the eventual commit 
history.  But it's useful while still under review.

Could you put the changelog below the cutlist (---)?

> 
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Co-developer--by: Melissa Wen <mwen@igalia.com>

These tags are wrong.  It's "Co-developed-by".

> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c      | 8 ++++++++
>   drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h      | 2 ++
>   drivers/gpu/drm/amd/display/dc/link/link_detection.c | 3 +--
>   3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index fab873b091f5..a90545b176cc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -17,3 +17,11 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>          return (memcmp(old_edid->raw_edid,
>                         new_edid->raw_edid, new_edid->length) == 0);
>   }
> +
> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> +			     const void *edid,
> +			     int len)
> +{
> +	memmove(dc_sink->dc_edid.raw_edid, edid, len);
> +	dc_sink->dc_edid.length = len;
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index 7e3b1177bc8a..f42cd5bbc730 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -7,5 +7,7 @@
>   
>   bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>   			  struct dc_sink *current_sink);
> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> +			     const void *edid, int len);
>   
>   #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 344356e26f8b..c28072f980cc 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1401,8 +1401,7 @@ struct dc_sink *link_add_remote_sink(
>   	if (!dc_sink)
>   		return NULL;
>   
> -	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
> -	dc_sink->dc_edid.length = len;
> +	dc_edid_copy_edid_to_dc(dc_sink, edid, len);
>   
>   	if (!link_add_remote_sink_helper(
>   			link,

