Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E567497CD7B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324B210E744;
	Thu, 19 Sep 2024 18:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z6AaPi+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C86010E744;
 Thu, 19 Sep 2024 18:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFvsPhTseOqz+WSSaRjnB/vlDEXINZIuu++Sa42keE3d7Gfza1sBshJbbquSSTAwS9AnLUchIS1SLeQ0tvdyaj22qWdmiBCwk2dQB/Cpx4EVrjtN3M5wp4HcaDS1Oeo2/lWuNDOs4Fpuhd4jtA7a158074D3+0OzGir789lcdg2GU4vnZ73FNgTp3mvEFal3iz/Y7MuZeH4H6pCLnZ6EiBUOLyA5LJS0EvU5KZLYNatSs077tXx7GlevBTGmPrESF03LfPPhltcpcqc3Gsla74xRZWzMO4jz+XffMGn+aEV0Ve4JnZMlXUjsDbeYUcE1LO8cWY79PpbBVc1t095Ykg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dN3gKUQdATKQ4H5LNV7yzfm/9ojKKvPChDmwMoIs33k=;
 b=Bu9Niz7UDN5/uQ+/1sfPGUSBlVL8NSo/5LQxB6/zCsNIyNg/hts0N1iLu7fPOuBeKiyGQhM9X3sFXzZsl2X8oW+RhlvewgBn1rtKCNJF0HjcEWAMvNp3JUOEns6Dl9qMlY0wKT9nMdS6+NpstEF5FiFrHfMk+R/5nn94aSqN284nQ5/2pKX1H9XJ/LqnhWRzUq8zSJfFuPEMFQugH9oLUphRyVq/5Q9w2BZJl48DwJ5IwXlxTzKrz+jlVQcB08qSTazzuqJWZc9IFyZhK6ubmKiknw5NQUE5ZSPyQ53Zs6cYPL9ldr6ZhwxJxe5JZF07Gjl6kU/y+JDQpYDdubaAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN3gKUQdATKQ4H5LNV7yzfm/9ojKKvPChDmwMoIs33k=;
 b=Z6AaPi+zRcXnVwOdddo4wQNxOlnHV+ItEOXQYfXX6tUIcgmp0Iakxb+3rwIQiqHhQhSTst6xuJLn82X4onQF65m+AIHg2wDeQl3jUC5dXU3l0WBhswfPo/ogz7amI+kPhU91rebR3WFJ3YOi4NNNOK3bjxZFKR8O3TUaAG/b9O0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 18:14:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 18:14:33 +0000
Message-ID: <45931284-8fdc-453c-b038-326375da14e6@amd.com>
Date: Thu, 19 Sep 2024 13:14:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen
 <mwen@igalia.com>, kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-11-mario.limonciello@amd.com>
 <77b34bd2-3727-42bf-aa0a-4f24ad7232cd@amd.com>
 <e879e296-9453-4a76-a879-52b33143261d@amd.com>
 <CADnq5_P78bmWA+xWt0fq6=oSFt33K2TToEFDTx2CudTEuDuAoA@mail.gmail.com>
 <c369fd86-ae54-4d72-9447-2b91a5877a5f@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <c369fd86-ae54-4d72-9447-2b91a5877a5f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:806:121::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: 690c49cc-437a-465f-8642-08dcd8d6e9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1RQb1E2QzkxOVVaMDBqdVVYTDVqcmN5TERmQU9TN2hlcUlucXkxT0JQTm5G?=
 =?utf-8?B?UzlvbHpQMnlQSGJ1dkZzUjEyNUFYL3M1TlFWcDQwYy92ZkVTRkpVeHIyc2ZT?=
 =?utf-8?B?eHZaMjlCbnFYbkFRS2R6N2JyVXFJN1RrSi9zUUJNSzNkb2lLcCt3MjdxeUJH?=
 =?utf-8?B?N3pKeUNnZTAwcnBwT3I0SnQ3TkZrdUxBVHFqZEZmMkFsRXh1bkZkUzRPeGRn?=
 =?utf-8?B?OHpQNXc3SkR1VVhGSzE3YVdPaTcxbmRZQVcyOS9mM3NydjNId29BWVFEa0U3?=
 =?utf-8?B?bWYzWm9sbzBZVnU5WDdDS1gyakYzaklLVkFmMnQwbTVHSnpYcjQ1TjBFUTVM?=
 =?utf-8?B?S1NKWGc4dENmbDRJbXFmNUtaUm9lTC8wYjB0U2kxVVZOcWp4NlB2S0d3ajkx?=
 =?utf-8?B?eTZDc29hekVSSDFlR3o5Z3AwZmRkM1Fyc3M0TElHRVM5NURCNUwwb3ptcXd1?=
 =?utf-8?B?elAvbnFhclEvVnJ6M3ppU0dHT05PeklOdWFsQlJ0blh4VXhFMmZaYXpYT1gz?=
 =?utf-8?B?MEFWeHRUMWxhbVA1ejhScmkzQUE4QnluQ3JqczRpUXFYU01yOXJScGlaYWta?=
 =?utf-8?B?S0Q4SjRwWXRzUDdVTXBmMDAxV1RFOTVoQ3kzYm11aXdPdWhVdnFmczJsc2Fp?=
 =?utf-8?B?MUpJdXFsdXcrVDAxNnJkQWFBa2t6TzV0dmxGdTk0bmRsTXZHc2hTa1lrNity?=
 =?utf-8?B?aVEvVTdGMU4vdm8zUnFJdHhDVy9GRUdlOURJWmM5RXlENjNVY3FPMjhoVzZ1?=
 =?utf-8?B?SXZrelVEWUVxdmRSK3d6cTdrcHdtNHUxeDBPMUtHa2xuOSs2d0VpNDh4Rkcz?=
 =?utf-8?B?NkdRQTFEeEZrYklvOExBY1lpNUZIMGI1eDlwdmxISENSd0I1L25wNHBkb0dZ?=
 =?utf-8?B?MWdyK1dSVjVCUDV3N0NWUklVZnpoSS9HNHk4TURURThteFVmc0ZrdEhIRllB?=
 =?utf-8?B?MElDQ3h4b0g4ZGhINyswTHEvVFB3WEhWNmc4OEdJNFp1U2d2eVRGbVhzekhs?=
 =?utf-8?B?aXZ1UDJYZHd4VHdmT29mSVJlaUo1TGJmdTkrS0ZHSm5FTWFMeWVpT1pmSFRY?=
 =?utf-8?B?SmRMRzBjWUZ0M3hmWEVnWXZGazNjajE4K05rMnNQUWhxdTNPRlo0dmJMakEw?=
 =?utf-8?B?TTQvb1hwWG91UGhvRVdZM004YTB2bnVXSjlqOTRZQ1V1cnZmUmg4eHhiRHA4?=
 =?utf-8?B?NDhoSlphbzFsemlNem5sREd0blFaQTNzVFR0blVJRXEvTjA4S3pkN3plYmdW?=
 =?utf-8?B?K3NtekUyNXl4SWRJSDNCWWhYMkJZZXNuZ0U2RzlJbndRUzh3eFYrRXJwSVJ0?=
 =?utf-8?B?S0Fob0tHcmpHQzlGQ2N5QU9jdW8yd3hLdGFLTjFBMDVFOTRYdXV1blYxbkhh?=
 =?utf-8?B?UllsdGN3U0kyYlNELzhnczdaVXFhK2RWdkI4NVVvZUt5eWNqVHQ1cGZTaklC?=
 =?utf-8?B?aFpFWC9yYis4cXV2WTRmME1nQ3pXSWFYSEVwMUdlYnNKUTNVUXpTZ3QyZXNZ?=
 =?utf-8?B?NFlLUkxIc3RkK3cwdzJjbUc1b3NUcjUyQTBERjRBcE9yNmorYmtiYzh4OWxZ?=
 =?utf-8?B?MjE5czYyM2lHaVlheDBySERzOW02YTg0RzYwTVhuYUhrdllNT2poU3dObS8z?=
 =?utf-8?B?K2tJcTRmWmVJV2FabUF2Nk5iRkdvMEFzQ3c2amNwSis3cXlHT3ZKS1A2d3Vz?=
 =?utf-8?B?MFhjK2RnMjN3SzRaczZaNng5RzkzMHdjSnpvKzYwMDhHVHJlTkxXWWJEK0pu?=
 =?utf-8?B?YzlqU2QxaHM4d0NQTk1razdCdDNnMmE5dXIvYzRqbDU4b3l0UnVIY1IwM2dv?=
 =?utf-8?B?UUk0Y1FxK2tQdGNSUWEzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkdEemNIcHZ3R2xDdEQrL1Vkb0dkSGFLVDFOaHlGbmIwS1pDMzkwVU41d0NT?=
 =?utf-8?B?S1BjdUNTaXBaRmFyaFpRL3VOcm5rVU9UM25GRy9LaFBodjRmNFN0Q3d3Ynhy?=
 =?utf-8?B?OHRGN2E2clpkaGlwMjBzQ0p0TXdqODYydGEvei9IYXMvZmJPb3ZDRlYrbHo1?=
 =?utf-8?B?YVFtc1hPb0ZjT1dMZzBhU2N2Ym9tSnNDNFFJNjlBUVh0ODZHZGt0VFZ3RU43?=
 =?utf-8?B?bmJjT1lnK0JTMXR6RkJ6NkxLK0lDdW9hQUtFN3g5UzduV25hRXZhdW5xMWxR?=
 =?utf-8?B?MTBZTGt5cHhQbjJEM2ZVY2J3M3MyK1Y5N2NsQm4zUmhrSWpxWkdpUnFqbjlM?=
 =?utf-8?B?aWRlTlpvV3Npd1F4NVBWRGdhdHZMNVRkSmxPRHlUak1lZjQrS0VITmFUa1NV?=
 =?utf-8?B?OVRiVk9tNkpTMDVNUXlVYzE5QllLQ2NQMGw4bU5WV0d5MUhKMUwzTEQ0dFlx?=
 =?utf-8?B?ZitLVS9rekp0YVFqWkl1SFF4dUQ3Z0lxaHgrYjR2STEzUlJuTHRnOFFkUDYr?=
 =?utf-8?B?ODR6cmthWkZNTGVPbWpaN3pSZkhJZ0tCZHZkQy9FdW9hais1Sll2R3BzNzZa?=
 =?utf-8?B?K21rWnNKVXVLQWIybG11dHdDbHJvbXc0RFgrUzBwK2R4NERUM1ZWdWo1UFBV?=
 =?utf-8?B?L3hUMmdISXQ1Y215SDFqcjVWV243OGhFL2F5Wm0zYUoxVnlyOVJFM2tVbEIr?=
 =?utf-8?B?WHZzQTJydjdZU3VWTjl0OVpwZGpPdG9TWWMydU1lMzRBYkFHak14MTh0WGIw?=
 =?utf-8?B?aVNpaEVYU21NdVpoOGwzdEh4ZFdFWUIrSzZNaEFDbWczWTRCYWF0SUNYUXV1?=
 =?utf-8?B?RnQ5K05rMnNVajZDLzdGVUpFZGJNQjFKRVc1VjNScG9US2dvSlZVbENqUTNW?=
 =?utf-8?B?ZWUvOFJ4Z3psemxKYm1qZS9NN3BtVmwrbk9sT0VMN2ZhKzc0STBkUnU1SkRw?=
 =?utf-8?B?TDJ5enBSQS9IYkNha0FURDZYUjJXM0VlMWxpSmFLenplNTlZaFVWNSs0bnlp?=
 =?utf-8?B?b2drcEF0QkF2b0VoSzQ3ODE3ZjBVelM4RkJ5SUhjOGdjTVEyMk9kKzVTUkND?=
 =?utf-8?B?RVk5aGZFQktLNkxHN2psMERyZG5DR2ZaU09sUWd5dk1sanMzS1FUK0hiZEFs?=
 =?utf-8?B?d0NwUCsxTjJTZFFhMm5qUG93bXd3NXRWSHhIV2gyeVlTSStRVkQrSDB2UHR6?=
 =?utf-8?B?ZWlxeS92MGtBeHdPNENTVnR2SElJcmdiZFQySWQwRXEvdXp6V0czMXlXMXNN?=
 =?utf-8?B?WEhuSEFkYmZkVVk2L28vSWp4SEJ3eTIzUnRJR25KTXJ0RHAyR3VYQ3cyT08r?=
 =?utf-8?B?UWlDdmc0OCtDUTV6V3RWaXZUZTJpMWVId3h4b2IwS0tPY3QwY2IraU40ZGZ4?=
 =?utf-8?B?ZHNnak1xQWwvRjRSL3MzR2tEMmpjUWpxa3lGdUlyMFRYQVI4eGw3Ui82QVRx?=
 =?utf-8?B?WG9xZ1VLM3RVcVVIMVVsK25yNmZ1YmNPeFN6bmFERzBIRU9FamR4M3Y1M0Nk?=
 =?utf-8?B?d0JLeWI2UnR3V3dFdTREZ1N3TTJWOGtpYllGSGxMVUJIUlJRN0YxVDRCQVZL?=
 =?utf-8?B?Y1l1d3QrRGhyeVpROENWaDVkYTFVaVUrVE40S2ZhRzF3Z2JGdlZWWjJYV0Uv?=
 =?utf-8?B?aERackNtWk9JY1l0L25EVWFQWGVwKzUwMTBUYXhneVE3WUtjUjJuT2dHYVlw?=
 =?utf-8?B?NjFZUXdhRERmWitkWHZjcG8xL3E4VUc3d1dJSG1HQzZ1ZE1ueUkyZVpTRU56?=
 =?utf-8?B?V1ArLzY0M0hJTlNwV1lyTHVPOElnMTBIVGZLU0NkdVpValM5SE9OcERLYVhK?=
 =?utf-8?B?RmdzUW9WaFdhZ1ZWUU9aSXg3QmlrNG1vdS83ak4xbHlVQkRlS21yVTZ1cE42?=
 =?utf-8?B?WHUzdGZvQ1RFeGpFRVZPY2NHNnA5TTlhVUtkMkNBQlhodmJHUVIrL3ROTzgx?=
 =?utf-8?B?V2JVRFB6NGlnS2kreWVKL0FaQnB4dlpqamZUY0hOR01Xam1taW56ODBOQkov?=
 =?utf-8?B?WWtmeldQaHFiU2ZTUVRFS3FsRlo1OHU2RmFWeC9IRTExU2xwWkduZG1iV1A4?=
 =?utf-8?B?VWRBTWVZNCtPNjNTVFM4RC9zNUExMUNKQ2YveEdHUU8wN0h1WStERWhHSlRP?=
 =?utf-8?Q?o8ZEkS9L85wJFT2vIAedeDXPb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690c49cc-437a-465f-8642-08dcd8d6e9cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:14:33.8201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlMmvKUoBrsWf0taNOdiH4v9fk3LbS7TlZTAyCnKQYyzhWDRGhLXzB2KarnClOc5J7sLaLBcNU4MGkm+MHpjTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883
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

On 9/19/2024 12:36, Hamza Mahfooz wrote:
> On 9/19/24 13:29, Alex Deucher wrote:
>> On Thu, Sep 19, 2024 at 12:06 PM Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>>
>>> On 9/19/2024 11:03, Alex Hung wrote:
>>>> A minor comment (see inline below).
>>>>
>>>> Otherwise
>>>>
>>>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>>>>
>>>> On 2024-09-18 15:38, Mario Limonciello wrote:
>>>>> Some manufacturers have intentionally put an EDID that differs from
>>>>> the EDID on the internal panel on laptops.
>>>>>
>>>>> Attempt to fetch this EDID if it exists and prefer it over the EDID
>>>>> that is provided by the panel. If a user prefers to use the EDID from
>>>>> the panel, offer a DC debugging parameter that would disable this.
>>>>>
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 62 
>>>>> ++++++++++++++++++-
>>>>>    drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
>>>>>    2 files changed, 66 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>>> index 8f4be7a1ec45..05d3e00ecce0 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>>>>> @@ -23,6 +23,8 @@
>>>>>     *
>>>>>     */
>>>>> +#include <acpi/video.h>
>>>>> +
>>>>>    #include <linux/string.h>
>>>>>    #include <linux/acpi.h>
>>>>>    #include <linux/i2c.h>
>>>>> @@ -874,6 +876,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link
>>>>> *link)
>>>>>        return dp_sink_present;
>>>>>    }
>>>>> +static int
>>>>> +dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block,
>>>>> size_t len)
>>>>> +{
>>>>> +    struct drm_connector *connector = data;
>>>>> +    struct acpi_device *acpidev = 
>>>>> ACPI_COMPANION(connector->dev->dev);
>>>>> +    unsigned char start = block * EDID_LENGTH;
>>>>> +    void *edid;
>>>>> +    int r;
>>>>> +
>>>>> +    if (!acpidev)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    /* fetch the entire edid from BIOS */
>>>>> +    r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, 
>>>>> &edid);
>>>>> +    if (r < 0) {
>>>>> +        DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>>>>> +        return r;
>>>>> +    }
>>>>> +    if (len > r || start > r || start + len > r) {
>>>>> +        r = -EINVAL;
>>>>> +        goto cleanup;
>>>>> +    }
>>>>> +
>>>>> +    memcpy(buf, edid + start, len);
>>>>> +    r = 0;
>>>>> +
>>>>> +cleanup:
>>>>> +    kfree(edid);
>>>>> +
>>>>> +    return r;
>>>>> +}
>>>>> +
>>>>> +static const struct drm_edid *
>>>>> +dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
>>>>> +{
>>>>> +    struct drm_connector *connector = &aconnector->base;
>>>>> +
>>>>> +    if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
>>>>> +        return NULL;
>>>>> +
>>>>> +    switch (connector->connector_type) {
>>>>> +    case DRM_MODE_CONNECTOR_LVDS:
>>>>> +    case DRM_MODE_CONNECTOR_eDP:
>>>>> +        break;
>>>>> +    default:
>>>>> +        return NULL;
>>>>> +    }
>>>>> +
>>>>> +    if (connector->force == DRM_FORCE_OFF)
>>>>> +        return NULL;
>>>>> +
>>>>> +    return drm_edid_read_custom(connector,
>>>>> dm_helpers_probe_acpi_edid, connector);
>>>>> +}
>>>>> +
>>>>>    enum dc_edid_status dm_helpers_read_local_edid(
>>>>>            struct dc_context *ctx,
>>>>>            struct dc_link *link,
>>>>> @@ -896,7 +952,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>>>>         * do check sum and retry to make sure read correct edid.
>>>>>         */
>>>>>        do {
>>>>> -        drm_edid = drm_edid_read_ddc(connector, ddc);
>>>>> +        drm_edid = dm_helpers_read_acpi_edid(aconnector);
>>>>> +        if (drm_edid)
>>>>> +            DRM_DEBUG_KMS("Using ACPI provided EDID for %s\n",
>>>>> connector->name);
>>>>
>>>> It is better to always output a message when ACPI's EDID is used 
>>>> without
>>>> enabling any debug options. How about DRM_INFO?
>>>
>>> Thanks, DRM_INFO makes sense for discoverability and will adjust it.
>>
>> I'd suggest using dev_info() or one of the newer DRM macros so we know
>> which device we are talking about if there are multiple GPUs in the
>> system.
> 
> Ya, I'd personally prefer moving amdgpu_dm over to the new(er) drm_.*
> family of logging macros.

Thanks.  I've adjusted it to:

drm_info(connector->dev, "Using ACPI provided EDID for %s\n", 
connector->name);

Also there is a debug one used above that I adjusted to:

drm_dbg(connector->dev, "Failed to get EDID from ACPI: %d\n", r);

> 
>>
>> Alex
>>
>>>
>>>>
>>>>> +        else
>>>>> +            drm_edid = drm_edid_read_ddc(connector, ddc);
>>>>>            drm_edid_connector_update(connector, drm_edid);
>>>>>            aconnector->drm_edid = drm_edid;
>>>>> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h
>>>>> b/drivers/gpu/drm/amd/include/amd_shared.h
>>>>> index 3f91926a50e9..1ec7c5e5249e 100644
>>>>> --- a/drivers/gpu/drm/amd/include/amd_shared.h
>>>>> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
>>>>> @@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
>>>>>         * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the
>>>>> time.
>>>>>         */
>>>>>        DC_FORCE_IPS_ENABLE = 0x4000,
>>>>> +    /**
>>>>> +     * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
>>>>> +     * eDP display from ACPI _DDC method.
>>>>> +     */
>>>>> +    DC_DISABLE_ACPI_EDID = 0x8000,
>>>>>    };
>>>>>    enum amd_dpm_forced_level;
>>>

