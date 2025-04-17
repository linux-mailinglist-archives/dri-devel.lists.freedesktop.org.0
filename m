Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3DA91874
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A390D10E1A7;
	Thu, 17 Apr 2025 09:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HMn0yTZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACE410E1A7;
 Thu, 17 Apr 2025 09:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfK1mRebhULGqyul4LHyoBe52aA3RikYnvwmSphRVA3RJx5q/srHx3U5CLnfr9LfdciFdOlMWM88gFBgoxDCJKdInvc40e6pKg+0krAerewjSxRWNGp5bp0mPd5eyV2x/Y42yNtsmlI3P5J9Lwy7HWPky9+7wOHnFqcW+s2gLKnVAoxcEpe5rrDfbfKIT2GYkwm/mAbTFZF6T7F+JM6rX2s71DtVlfP11mAjZy3Och0y7sZ9k4Q1Bk6uiXon6WIV5zHrYSbxt8xa3vzxoaigt7XnVxqDdYxpzk/QiM9QDYhAqP6EV80fyuC6uwrAc+PutefeW2tBO6n29VO2SH0bdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDZv/D5Y5uPbQOc37dwMIneBMyOQVlMcVr1bM0UG7UI=;
 b=C5mIncgVGXMj6rKitqS2GLNP6WgsuyrelzJnpv1C4V3yvRZZxSr0CUS9TuNFNM6WbxEaPbb1Bvw09ZSP6eC8HAf+rNXeaKKPYN30g4XoGUUNacn9wzE3l+NgDVTGMw3TbTEf6manHTcOR+mQEow7sl583xkyZIiEM71Qn5TF/5m8XCSFfcTSObN+E7K5PxOG4sVemQVPGnU92TAjhEnAOqTNxIDg/lEbrAhW//IkjXMLrA5R126I0yjPmIFm/o4yOaQBQPp7D5yA0OAc0vAnU/ouXlPe9aXbIGOZ9kPX/tvr5uLMb1x2MZIfD2aQBCVoUVAGa6I5gk9kfXFeWR1VzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDZv/D5Y5uPbQOc37dwMIneBMyOQVlMcVr1bM0UG7UI=;
 b=HMn0yTZPxP7huDabu9wDoR2Us80DapIrk6l3ZV1ciAY2lbeWIuHhpsyXHonHfjS0l4jJYsXNe7Xu9/jxyZVzuPFup980dNHpRXuyTeJh+d74k8mUgAey5uUZZIttmoLzlLYOmubqETcGbA9CQsSvEPEA2RehshzjN2g2MRMA++E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7074.namprd12.prod.outlook.com (2603:10b6:806:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Thu, 17 Apr
 2025 09:57:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Thu, 17 Apr 2025
 09:57:27 +0000
Message-ID: <05d7ba43-28ff-4c76-9b63-782b8df0f9f6@amd.com>
Date: Thu, 17 Apr 2025 11:57:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm: add macro drm_file_err to print process info
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417091355.2240384-1-sunil.khatri@amd.com>
 <874iynp1uw.fsf@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <874iynp1uw.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 7959fe69-3765-48e6-e8f9-08dd7d964247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2ZvK1d5SDRSbGkzenNlOW5oVjlXTVB0NzdJVVNxZjV3UXhSSVlzTmRQYmFN?=
 =?utf-8?B?c1A0Z1pBZy9mUHY3dTNLbDZNNzQvbTFaV0VvVm9qaFJ3T2o5bFIwTmc2R1V3?=
 =?utf-8?B?anVGVzFZd2RhUmR2M1FVZGVRR2ZVckFPNGxWcm5ObitYUkdJVHliR3Rkd1kv?=
 =?utf-8?B?L3pYUXFXQlZQMGI2OXZOODZrL2pIU2svR1pPeE5EM29HVkwrUWhKVmpaVCtz?=
 =?utf-8?B?RmZhVjkvMmRWVk15Y3hCNDFMdGtJbnpGd1hKK1NxM00xMnlxbkFIUTFFUlhJ?=
 =?utf-8?B?ZEFWREhlRDRhYXlFd3FCaDZ1elQ3TWRkenlheSszeTRlcHg4Y2R2b0RzOC8y?=
 =?utf-8?B?ODZzNmlCenNsRGsxcFZYTmRYbkJpRG9Ob2xOa216WWI0THJnZno3UlBvZkoz?=
 =?utf-8?B?dUt4UVlIWlh3WllNcnptempxUk9OT2l3UXVwQ3lVTC9LZy83c0g4WFVDWmJa?=
 =?utf-8?B?eklQVzB0Y05LbGluSG9zMnNGYUNteElRNGx1S2JKa25kUDY3emRSY21oVUI2?=
 =?utf-8?B?Qk1Tb0oxUU0xc3ZFNjI2YnhUZHltYUx3SmVybUh3TGUvdXRVY3hYMGJKK0Nk?=
 =?utf-8?B?b2NEa2J5VjVyaU9rSWw1UDRITXVJblhvSFVQWlNNektRY1BRKzBkY1U3eCsy?=
 =?utf-8?B?ZjIyQzZoc255VkZFNHArTDVWeFJCR0krZ1hYQXl1Q3prNW1lTHZVKzAweVhO?=
 =?utf-8?B?MVNkejEvd1ltdkhBcnBDeXR2bjVjWHN5akVGams2ZE0zOHI5QUtWemFUczZJ?=
 =?utf-8?B?TmNhOW5rYkFGcTVjNnFvZ2cvREFlTnhZTXk4OXNXcFJpZDVzcUxub2hHOEtm?=
 =?utf-8?B?T0cxOEZHN0lEQzQvNW0zbkNTeDRna0VWOG45WEw3Q2xaWGpLVU5ZcGxXQk1N?=
 =?utf-8?B?WmNyV2VUTU5GQlJSZ2IwNitJSGFGeGcycWpWT1hZaDEzdzR6NTZqYmhKc3NI?=
 =?utf-8?B?N1o0NjZnYnc5dEdVTWYwdWkrekZjNk14YWxKdFRLRVI5MnlaQlJGeDBXTlhK?=
 =?utf-8?B?SngvbTlkZWNZZ012TkxRK1VKdFk2UlZSOGJKbEJrb09XQmhKRm1iNE5ZUnZr?=
 =?utf-8?B?N0VvbGhaZDZNbVhqSkFzK2l6K1I4NEtOZDJaT0dTNys2cGYrSlJxQjIrZTlF?=
 =?utf-8?B?UDlEMS9WaHBOWGUzak9XQTVKZ2Jabk5uR0RndVNYVzB1V293OHJ2U0xLdmFL?=
 =?utf-8?B?WFF4bzV1VlZPYTZWbmF2cm95RVdjZWFLeUhMano1cmhYNHBTc20vY1pTM0R4?=
 =?utf-8?B?S3E5eWNqVytkZG9DUFpiUDZtQ0UwT2RjQ3BzV3hMNmlwaWdhKzhUbnhtd3Bp?=
 =?utf-8?B?blA4RGhDdG9CaFd1M3RaMDZLb2xJcFRrZVNNeU1EM1hkaURKcmxsMEprUHh6?=
 =?utf-8?B?bThKOU9kdEh2S3ZkQXg3YnUvM01xaWF0SWhwbElBb003VkhKZ285OE9sZS93?=
 =?utf-8?B?QVh2cjB1Yno0QXppNHoyYkZ0L2RSdlE0bHIrY2dmdWJmV0lkUUpUek0rZ1ZX?=
 =?utf-8?B?eXA4VTY3NU5SZC9yL3pOVVpSYWhVMHFsaWhrZ1BKZkRjMlloNGkrUnRvbDZT?=
 =?utf-8?B?NWRRMytCTFdjZlJtckJWeWNKSURlSzdGNUZnYllVSlliNGYzY3JIVkhwYnBu?=
 =?utf-8?B?bGlVaC91cWw1MFY2NWhlY0hxS3V3U1RhcThNYWNmZFR5VHJrMTRabWNqZklr?=
 =?utf-8?B?NFRkSUh2UHdvQmxWRXY2WEMwbS8rZ2daZHJmWGVOc2ZaQUU1dno0UStvU00r?=
 =?utf-8?B?azRTbjNwVFBxbmZxelpXMnpVL2hiR05tek9iZ1NFUEY2aExKUnlDVjZzTVNu?=
 =?utf-8?B?d3hnUUpjbDl6RnRqTmFGYlhNQWRPYlhmRk9BOHpqZ05aTVhMR2tvZ3JmNlpD?=
 =?utf-8?B?dWRESGFxbkVXNzBYS080aVdSM3VhbzN1Yk5XSWxUSzlHa3dhWUNONElWUnYw?=
 =?utf-8?Q?BjyJR0zMaBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBnRXh0c21XTkFwUDZqUzFwUndBVHNLcnJYelBiY1BuRzlvcmpsR1dZNGw3?=
 =?utf-8?B?L2ptTnZGQmdlekJzNk16ZzZ4UHB4YUEzcTdCV1hIeE56RDFsQ0t2Q1dSc1k2?=
 =?utf-8?B?bWI5K211WDBGOW51MmpPUzhKdWJVNnN1YzYvVFFSUC9YMkRwaWMzNnBvOHE1?=
 =?utf-8?B?ZW1IT0FpL1VIcXErRkY2Q2ZuZFdGRllWZ2MrZVFoRzZTcS9HS1NwNlJ1VDh1?=
 =?utf-8?B?Q1BTWTRLdnNQb3BUR3lUdm14ZkVtMCt1dU5FNWFJTTlUMTB1SHVuYnlUQldL?=
 =?utf-8?B?dVp2ZTlsZ1B6SFYxQW5GbGRXUktWaVh5U2xsT0Y1MHpRSUdKNnNOZTRjZUV2?=
 =?utf-8?B?WWdzSlhCakxteDQwbk1ZUklRaU5tOWNwcndUdkNUVzA3VXRKbzJma3p6cmRI?=
 =?utf-8?B?dU5CVzM2Uk54b25BZ3ZCNkErUDBRbUc4YmlrTEw4SEs4TDVLRWh2bHVNek1C?=
 =?utf-8?B?VHhneWJJY3NqNjFsOGRwbkswV3o5YTZoY0VDRURkbVIzeEozLzNJOTlZcjlT?=
 =?utf-8?B?b0hERzRlaytYbkRQTGhvZmJDQVQ1RWlOeUFmRm5iKzhsUDlXazBhYzEwMkQ1?=
 =?utf-8?B?bXJWRWFTOTdXRjZUUklJWmRrWGVkWVhUV0hFTllCSThURlpkRmtZdU5WZm5M?=
 =?utf-8?B?MDlVNDVDUkw0ZG1QRmJNV09BTGJ2YU9zYS9kaTJiaFJYTlRVdHJuUjVvTkxY?=
 =?utf-8?B?WVovNUhwcmZjNmRTWkhlVmtkUmp0anNYOUlWM2Y2VmdGbm5sSlF5dmRKSnhp?=
 =?utf-8?B?Kyt3UkdhVXI0cVd5WTVjTmFzclhjakJpTk5vMnpINkVyTUVzMFl3RTdUcnJM?=
 =?utf-8?B?emt6U0NkYXZxd25VZklxaTRxZnJjOFNaOU5DR0N4TzNmZGFvMSthZG53WkJU?=
 =?utf-8?B?VTNJTllKL0xYYzBOMW5McEhZQ3JKWUtxR2xZUUZTcnpkWU1wQzhWTStGaWJa?=
 =?utf-8?B?YlJiMFJBaTU1R1lZeUg5Vjh5bHg3ekJNVWs2Y2dmZVc4dWE1TkFWWFJkU3Q2?=
 =?utf-8?B?WE5IV3JvNlBtTWNVV25XMkQ1QWcrajY1L1R1WHZXNFFncmxwdWVraFJ3TWJp?=
 =?utf-8?B?NTJFOFFTTXVzZDgwRGJ6aXdoZ05qYzQ3cDRwQU90RmpFR0JSNXVZTXRVNWlN?=
 =?utf-8?B?NGZIdlpEWXNsNTI1VmdKRllNMGhrV2hWMWtMOUZqazNHb1RuR2tFVEtlWnFT?=
 =?utf-8?B?cjlHbWxYSXVqaEpZOVNaMkVWb2YwbVR6am5JeGV2cC9abnpXQlRlYXlBV0xs?=
 =?utf-8?B?aHhPQy8xcFE3cDlyUUo1WlNRY2hkaG1yWWZ0cEJuelZmcWlqVGlNTzhpRVZM?=
 =?utf-8?B?dVRTWGc1ZXBnRkNabVVoUVVXalRCSkhIVzZFc2F2am5wVVVFb21pckJQK0Zt?=
 =?utf-8?B?RXE5NXh4M0JVQ0JDS3cyNGlPRlYyOW1xSTlYbVcxS1NlNloyTFRqVlIyaWx2?=
 =?utf-8?B?K2tZdkpxR3pkcDdDMGx4Ympmb2NPbTkyaUlUQ1M1N1Qyc1NhYmtyOXR3bGdv?=
 =?utf-8?B?Q1lyRFhCSWhqTXlhZlZhNWZEK0t6bjFjaURIakFjUjFPaTFLV3lmNUxPcFEx?=
 =?utf-8?B?WDEwSkRlVmQxR0h3bWlERy8rTUcwdXc0NnBoeW9vRUphRDlMRXlNOVVNMmRo?=
 =?utf-8?B?SEQ5c0dxNzFhbVFXSlNkL3FyQTFybzJsL3ZWak5hRUJPbm92Rzg2NkVmM2Rh?=
 =?utf-8?B?REJLK2loVXZUeC9MQzhLS3c2aCtPV3cxZTJPR3g0TmpOcW5xVDlZQ0xJTVUy?=
 =?utf-8?B?eEZob09YMmZ4SnlMN3JXSno2eEtnYnByZUU1SDdJU3Q5elFqNXNNMUxxRlha?=
 =?utf-8?B?cWIzV1dOZFVxK2VoY3lGeUFmZ3dSYVpjY1lDTmJlR1N2ZnNTUzlpRWFjc1Bm?=
 =?utf-8?B?eHg3ckI4REtZbVllcEpDbU1kL3BYQ09vV092RzVMaVlwdm42L1lDTUpZczdL?=
 =?utf-8?B?WHEzWHFyV3EzR29OQnRuc3B2MUFQbE1VcHF2R3RoV2c4dUhvQXM0MVpDWEM3?=
 =?utf-8?B?TDJYNDF0S2JQVGlqSFp3Z3ZUNXJWRWJ5WFNFbXVNZ1RBV1RGQzc0YVI3bkRV?=
 =?utf-8?B?REVzNjlyL3BVM1ZUNUMveXY5NFVLb1dlU01oMGtydzN5N1d1YThtQUh5Y0hE?=
 =?utf-8?Q?QAnPFWVpOx96zdkNYZAlqRHap?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7959fe69-3765-48e6-e8f9-08dd7d964247
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:57:27.0139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hSYbbxXs0eq3Vkj9EP6XPHBgvAog6vGmq7NyXsMsW/Q+XDnlWoXVhjcWrFIK86x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7074
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

Am 17.04.25 um 11:35 schrieb Jani Nikula:
> On Thu, 17 Apr 2025, Sunil Khatri <sunil.khatri@amd.com> wrote:
>> Add a drm helper macro which append the process information for
>> the drm_file over drm_err.
>>
>> v5: change to macro from function (Christian Koenig)
>>     add helper functions for lock/unlock (Christian Koenig)
>>
>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>     remove drm_print.h
> I guess I gave all kinds of comments, but in the end my conclusion was:
> why does *any* of this have to be static inline or macros? Make
> drm_file_err() a regular function and hide the implementation inside
> drm_file.c. That's the cleanest approach IMO.

That won't work. The macro is necessary to concatenate the format strings.

But the drm_task_lock() and drm_task_unlock() functions shouldn't be in the header. Those can be perfectly in drm_file.c or drm_print.c

And we should put drm_file_err into drm_print.h instead of drm_file.h as far as I can see.

Regards,
Christian.

>
> BR,
> Jani.
>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>  include/drm/drm_file.h | 37 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..856b38e996c7 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -446,6 +446,43 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>>  	return file_priv->minor->type == DRM_MINOR_ACCEL;
>>  }
>>  
>> +static inline struct task_struct *drm_task_lock(struct drm_file *file_priv)
>> +{
>> +	struct task_struct *task;
>> +	struct pid *pid;
>> +
>> +	mutex_lock(&file_priv->client_name_lock);
>> +	rcu_read_lock();
>> +	pid = rcu_dereference(file_priv->pid);
>> +	task = pid_task(pid, PIDTYPE_TGID);
>> +	return task;
>> +}
>> +
>> +static inline void drm_task_unlock(struct drm_file *file_priv)
>> +{
>> +	rcu_read_unlock();
>> +	mutex_unlock(&file_priv->client_name_lock);
>> +}
>> +/**
>> + * drm_file_err - Fill info string with process name and pid
>> + * @file_priv: context of interest for process name and pid
>> + * @fmt: prinf() like format string
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>> + */
>> +#define drm_file_err(file_priv, fmt, ...)						\
>> +	do {										\
>> +		struct task_struct *task;						\
>> +		struct drm_device *dev = file_priv->minor->dev;				\
>> +											\
>> +		task = drm_task_lock(file_priv);					\
>> +		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
>> +			task ? task->comm : "", task ? task->pid : 0,			\
>> +			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
>> +		drm_task_unlock(file_priv);						\
>> +	} while (0)
>> +
>>  void drm_file_update_pid(struct drm_file *);
>>  
>>  struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);

