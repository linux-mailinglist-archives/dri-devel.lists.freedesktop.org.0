Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF258B51713
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594C210E917;
	Wed, 10 Sep 2025 12:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ML5XrCTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8E10E913;
 Wed, 10 Sep 2025 12:37:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDXKF4uCTajS392UBfHRcX0iAjO//E+UMHalbbjyfjvV67Phh/u4LCqBngyRa2Alr0cEvrDsM6WYC/YenSU1Lv3sR9EWPAeuhXAwYNsmyevN7iI8LmXJylN8IZwUrztnBvsWRlerReDvya5wb5HyBUgRy3YuClpZhHJz+nJ89UCF6jP4QNn0OI5gRhy1oiXN9cQ0NFua6LkAg27DiujahDyMXchak6DztU7TP+buqDFNzuTLzBZaixyPFw8y/TNo7bcpldBR+YjdqrTbqYJrtnYs7oD3edPsoy/8cT3Hr4zwQZLogrJXmItOUmlFcf/B02FjLMF4c4OQyW0F5eM/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pezDzvrAEMX2SgWXu2ut3sqPut9VVMjycqpYjBPmwZU=;
 b=kDnNi6CUHcssaeO6n7e+Ve86HC3yNYJ3nhQOgyu+5BVmQQHM0Cwg2iTG6UiZvanJMvKDR3YGNryqCd3IWPWUO+C3MW6lrb4VM8GbseNnkZ+EBDwIBLufqEJFJ9YBAg3UHpt9hGREdrBSj49UTTRAI1mQKSh2kISGDjmOIs/5DvJZgD+0JuNGoQwQah+f2XAtIaKkQx4V6SICMrJIhMyUC40jmRwTqkllc1TfW4Mpbvcb9x1M8JU1xrBlv5LvVT9uV/VZKYpm5W7mAmFfq+Rn4uiwE8IH4B9DEDmkVQEY0AK5puqe/meWqHCXo66fsndNgRICAUKnB1DXJBwtH6qACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pezDzvrAEMX2SgWXu2ut3sqPut9VVMjycqpYjBPmwZU=;
 b=ML5XrCTCrX/cMZKJ5w3GvW4pPJ+jG2Urtzobk8VBm8lYlDMPWROvH4bHlx4sBs3S1mBbc65huwqplTLnJzGOHRQ3CwDUJIhxWjDIrVwt3DIzkr/wHXMtFojCUaF7juzkr+6uWJPP9Zlku7+rbATf1NCvJfjacRUBsnd6imkLeW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DS0PR12MB8766.namprd12.prod.outlook.com (2603:10b6:8:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 12:37:21 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 12:37:21 +0000
Message-ID: <fcbf6ae8-f9ab-4723-8df4-16d2f0f62c3f@amd.com>
Date: Wed, 10 Sep 2025 18:07:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: matthew.auld@intel.com, jani.nikula@linux.intel.com,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alexander.deucher@amd.com,
 stable@vger.kernel.org
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
 <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
 <20250909140519.GK4067720@noisy.programming.kicks-ass.net>
 <106c1a36-c104-4eb8-b928-d11b8ca9b599@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <106c1a36-c104-4eb8-b928-d11b8ca9b599@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0088.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::7) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DS0PR12MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2ca3ba-005f-4d6f-557f-08ddf066c947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFVkS1Z1endEQjlHenJiQ1dyK1pRSzU3SkF1cndRWDhObi9NcnB6bUJTRFFL?=
 =?utf-8?B?cWo4bmtITlZ1LzVYUDVqc1ZsNG5OZStKNHM2L0VMVHZxWWNER3k2bXlpbmZX?=
 =?utf-8?B?dk11V0o2d3RBd3A0U1pwWjJ6Z0RqSVhnQTZOUDFCWGlxU0UrQkd3dWxBc1lF?=
 =?utf-8?B?Q2o4VHlycEVvSG4wNGpocEwrOUx4NmE2dFY0UUt1My9OekltZEtONWRIZ2dN?=
 =?utf-8?B?TTFHcnM2c2x0K09YUGloNnM5NEpaeVJlY2xqUEU1Q093clhFeVhieERDa1Ja?=
 =?utf-8?B?Tzk0Vm45V21TUHBHcFdJOFlCRlplODVVZ2gyWlVCWnBmV1dVNEpLcXNhVVlD?=
 =?utf-8?B?Y3BkR29QU3gySVQwVEZ2U1ZFWVlicnBOZUo0dzluQisySjF3ampPSUhYRFZ2?=
 =?utf-8?B?RkpWSjJlczlhYkNjSlJhMFFNeVhERDN0NjRSVEF5djBvdnNVWllkRkVhZmEr?=
 =?utf-8?B?R29kTXVFclhlTkxUODhCdFkzZHQ3WmFpeFJjbG9RdUd6UXFiTGtMbHJqRllu?=
 =?utf-8?B?aVZBL2VuVHBEMEJtNTdCVHNTLytQS2ZUck0wZHNwZlpXd2lKcllXYVR5L0F0?=
 =?utf-8?B?QWZFR0diVHZoS3k3QW9PYU05c3RUZzFSSjJ2QlR1MGhyczV6R1BTeG9jY3Fw?=
 =?utf-8?B?TmhQYjZmekNNQ1NrMzk3am93RzVaaGNDekM4ekRKc1cveGVQNkVnT3hqWFZT?=
 =?utf-8?B?aUQrK0hQQVozSVlMM0Q4bGZNUlB1d2E0OVlZNEZlOUl0b004SGpIeVI4RHZV?=
 =?utf-8?B?NjM1Z3pHSDZodU1uQjdYd3VmbTNGZ01yalRGQUgyQ2tvaTBIUjRsMmx6WU1V?=
 =?utf-8?B?U1A1elVqQW1ZVFhyNTFlOTMwRzYwc0ljV3hSejRhcE9BR29tSmRqU3hWNmQ3?=
 =?utf-8?B?QVNmUzFGMkRDWENsdy9BR3JmRnZ3YkVNWEpDaCtvcEwwUzJ3S2pXZW5ocHBF?=
 =?utf-8?B?TjVQYUF4OUZYc010cW1VbndRWFh1aHh3WG8rTWg3L2pucTh3UDVId0l4Zjgy?=
 =?utf-8?B?UDRsYStlMnE4dHRNSFNVbmNUVFpjK3IybFVmWU1lM3RMc3paUGsrSDdCZUZU?=
 =?utf-8?B?OWoyUk5VUnVMWlkzYWtKbTRWb0ZjWWVPMGtkWEJIYWl3OEQ4RmdFUmRvY09E?=
 =?utf-8?B?b21tQ3ZNZUM1bVRuZE1pSk9MQ1VqUGxoTjBHZ05aT0s1bUhXeGJzZHVpdmlw?=
 =?utf-8?B?QkhYQ1lEaDRNeEJ0S0s1Y3VXL0xDMGptQVNRWUZFMWtod2E1Nnk0TUVxN0Fi?=
 =?utf-8?B?ZG5ORXNWWktHdlppaTdIVy9SUWdadmdIaWlHSjM3cFFoQTBldE5zNit0V3l1?=
 =?utf-8?B?bXZ5OHhCU0xDTUVZeWh2WEl2cXlHTG9CTnJ4THhnSW9IZXpaeWZMRzBtUlRS?=
 =?utf-8?B?YmdsejdDRkltcFAxRkk5ekpvMWNnekgvMTA2ZzdRV2lnd0pjalV4aWlSa2Jk?=
 =?utf-8?B?Y3hBWHJQVkRXSFZPbjRsSit6RmswMnp4ekorZUR2dnRLZ1MwNTVQTGhsL1ZU?=
 =?utf-8?B?N2RaRUwzcU05Q3VzMngzOXJhNHIxVG1YME9nYUtEMndUTHNRN0dqc1R6Wkx0?=
 =?utf-8?B?YWllWlcvUHRLL0JnUk9LaUt5em1nOEhsbW96VFRXd2tTNjRTc2NZU244bUY4?=
 =?utf-8?B?dzNJMVNQUS9UZVFYZThEZW40ekREcGUzeE5FTm5aRk5WMXpPSXFRcGpHRkZZ?=
 =?utf-8?B?MlFDSXJlWHhSdUxjV3NxRThzVjlNV01YdjNUR091MUUzelk4eTVZOFJRN2kr?=
 =?utf-8?B?bXVvZFpQTklVUlNQMUZaa3JCTWVVdTMzanlaYXR1dmdhY2FOak43cGwxZmQx?=
 =?utf-8?B?TG5iWENnWnBJVWxFbTJDUGhxRUs0dzRNZXFEUEgwYWtacVZ1SVRlc2o4dlcv?=
 =?utf-8?B?dXVXKzZBMDJvdDRXbGx6UUtDYXM1ZDVEd1FqeGZybXkzRnF3Nnk5bG5zaURq?=
 =?utf-8?Q?KNYU2sGC+To=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzdpZ01JSVp4WksyVFNPblkrSVU0Ujk3RkNRbDY1L2JKcE5tYmUxN1NWTndF?=
 =?utf-8?B?OU1iRTJLWWV1R0tzN21JMW1DNEpFem1raFhoMXRTTlFRWUFUeTlrMVdoa3VZ?=
 =?utf-8?B?TGRVSUNJN1BDSW1qSlYwMWdUZVhHNmNhOUhoYmthV2M4d0lYNUxJcGZFNXly?=
 =?utf-8?B?bzB1L2J1eUJSVEpIUzZ3S2VkMG5Ra3NBQ3hGVlVneU12K1AwZThERFNsSDls?=
 =?utf-8?B?TjdRUXNWZm1WSXc4RmoyV0dNc2YrYXNCeVVvY0pkYS9WTXZJTXlGdS9TeWp4?=
 =?utf-8?B?UFVrbDBnWVZGRzVQUWw1WGtYMUdRV1ZCenphbGNtMzZlR0F3VGdMT1RpUW85?=
 =?utf-8?B?V0F6K24xUGI3bW1iTUF3ckxBaXBxQlkrVWdqcXpIVkZpdjUxczdqUzhMb3FQ?=
 =?utf-8?B?Vzl1ekZwelZ5ckdWVHdHYno0d3RCY2ZyY3BGUlBGbzBPS3kxMDN5cnFoOWJL?=
 =?utf-8?B?R2IrUXduZjlZMVp4S1NQT2lCUDQ1QUVHM3RwU0lCY3hpTUJDV21BamNTaHY4?=
 =?utf-8?B?ZUpGeXhCMitDZXgwMkNjUHRDY1dOdlNvQ081aktGcWcybTZ1M1YxSFlxQTFS?=
 =?utf-8?B?WUtId1RoTEhIMTg2Y1BxVTFEZFAzZDIyZURCaEthcmpSSjY0MHdLVlhyOHUw?=
 =?utf-8?B?aFNacXB0cTRacUwwVVZOYnpTYytlZ1dXeDQzaytjS00vS3lmMW91UVIwZWdV?=
 =?utf-8?B?ZHRvWitSWUtRMUZMYk9aKytoWnUxSkhwVVBiZk9WS0ZqWlNlcmtsSytGY0ZJ?=
 =?utf-8?B?V3o2TnRSYUx2VTlJeG13WmtNZkVYaXMwWDZ5TkZIU3orNE9RWlh2aHVyekpi?=
 =?utf-8?B?U2E5cEpZZVc0WTBsUVgzcm01WDdmQ1dPeWtHQXFZWXVrRHRlYTJweGhuYmsz?=
 =?utf-8?B?MnJ2am1nRW90RDRjZ09jUmEyZFhvNS9lQ3FzdHpPN0RYMkt3Y1VTNEE1S3lB?=
 =?utf-8?B?NTZXUGNZNE5vMW0zSGxwUlBkdWpDQ1lSUnNLdlN5WC9YeTZQdnFxWnVHMFFu?=
 =?utf-8?B?SVBSV3Y3VlpFYzZXRFA3MVRWaUtlQWtSM0tVRDdKRnN3UytLak9TVnVSd0dY?=
 =?utf-8?B?YWFkVVlwcHgwV3VSVVBQRndqaTR1aVFRL3FUVWs4UGQ5SWZLN2ROa0N0N1JO?=
 =?utf-8?B?cmd6NGlITVlRY1lvaUs4VitkV2xhamNBQlNJcnk4WWVvU0sySGZDcC9pbnZ4?=
 =?utf-8?B?TlNnVEZENHk4U2h5bDhWb1FzVjZURVVhcndYYnB0YmNOTE0rTzVFdzdwZE5I?=
 =?utf-8?B?RDRHbzNJN1pJazh1ZnFNeEt4bWZhK3hSUndEcHpCVFlpOVFwc29SVFJISWw5?=
 =?utf-8?B?R0hwUUtPR0RyMjhYNXZoaG9aOEl5RkZtUFY5NHdhRjNIbUc3WDlQRXJsdUND?=
 =?utf-8?B?UHlMVEFzd21KUzU4TjFrYS9oY3k4bXg0d1dkK0wzeS9POXltblNxTnBWQnY2?=
 =?utf-8?B?ZnVMM25BU252N3dORkphTXNQVU9qYnppTGZWQnBjZUdsenV5LzhpTmorSTkw?=
 =?utf-8?B?UVdPM0hoa1RCWDhTbmlsbnVpbWtncFVvRGw1T0FNeTlteWtheWkreDJoblBW?=
 =?utf-8?B?a2FEYWRRcE5sRFNWTCt1b3BlanJzbTBBZzlrTm9XeXMzMVhhM0RBMWpyTEwy?=
 =?utf-8?B?Z3lsTjdrb0NDUXlWbGduNGw5cUxYZ2lmM1V6OUhsOFBEcERZKzBSK0pLWUFr?=
 =?utf-8?B?bUNBc0tkSWp1bTlRVG1TVFl5ekZiNmQzODBHVFhMbGRoMWIrMXh3Ny80QzRC?=
 =?utf-8?B?VmRURHhEYkg1dmhlbUpEbkE4cS9rRmdUVE9wM2Q4TmF1a0M0dmNteTV4SUZh?=
 =?utf-8?B?OThwRHEzNlRiVWc0YVlXM1h6dTV2dHN0bFVlQ3cyWk41d0ZOUFNXRFFqNklt?=
 =?utf-8?B?MWN4SWp6OTEwVldpenovWVpwQjhQb0ZvbTJFRC9qSmdMOTNEMWdiL0tmcEJk?=
 =?utf-8?B?NytLTTNqTkN1UU0vQk5vVkJPY0dyK3ovWUxLQmhrcnMyQUhPekcwS2tSYUR4?=
 =?utf-8?B?UDN5d0p4cysrbEQ4dUJIdTNTbHE1ZWQzS2xoc2orQktBcndSTStyRlpVUHZt?=
 =?utf-8?B?Ykl1alZJb3VsMGFnSGYraFpzVVpEcXQ5ZnBoSkZnZm1LWXQwSWFWUStwK3FI?=
 =?utf-8?Q?m2a1YHS3kIX9Dsmoja+RKxbfr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2ca3ba-005f-4d6f-557f-08ddf066c947
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 12:37:21.4702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4fEFTuscoNBxvjrUHSzv126Njes/YwYhdEU56qnbOhB8zXXQiqbPr1EpceyZCgumY2sDam81ee4Pog8uJaibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8766
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

Hi Christian,

On 9/9/2025 9:55 PM, Christian König wrote:
> On 09.09.25 16:05, Peter Zijlstra wrote:
>> On Tue, Sep 09, 2025 at 02:04:30PM +0200, Christian König wrote:
>>> Hi Arun,
>>>
>>> On 09.09.25 11:56, Arunpravin Paneer Selvam wrote:
>>> [SNIP]
>>>
>>>> +/**
>>>> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
>>>> + *
>>>> + * @pos:	the 'type *' to use as a loop cursor
>>>> + * @n:		another 'type *' to use as temporary storage
>>>> + * @root:	'rb_root *' of the rbtree
>>>> + * @member:	the name of the rb_node field within 'type'
>>>> + */
>>>> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
>>>> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
>>>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
>>>> +	     (pos); \
>>>> +	     (pos) = (n), \
>>>> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
>>> As far as I know exactly that operation does not work on an R/B tree.
>>>
>>> See the _safe() variants of the for_each_ macros are usually used to iterate over a container while being able to remove entries.
>>>
>>> But because of the potential re-balance storing just the next entry is not sufficient for an R/B tree to do that as far as I know.
>>>
>>> Please explain how exactly you want to use this macro.
Thanks for the pointer, yes, this will not work on RB tree. We need a 
reverse safe variant for use in the force_merge() function similar to the
list_for_each_entry_safe_reverse() macro in list.h. The reason is that 
in force_merge(), we remove the block from the free tree before invoking
drm_buddy_free(), which merges and frees buddy blocks to form a larger 
block.
>> So I don't much like these iterators; I've said so before. Either we
>> should introduce a properly threaded rb-tree (where the NULL child
>> pointers encode a linked list), or simply keep a list_head next to the
>> rb_node and use that.
> I agree, something is clearly fishy here.
>
>> The rb_{next,prev}() things are O(ln n), in the worst case they do a
>> full traversal up the tree and a full traversal down the other branch.
> Yeah from the logic that is exactly what is supposed to happen in the __force_merge() function.
>
> The question is rather why does that function exists in the first place? The operation doesn't look logical to me.
>
> For drm_buddy_reset_clear() and drm_buddy_fini() we should use rbtree_postorder_for_each_entry_safe() instead.
>
> And during normal allocation __force_merge() should never be used.
In normal allocation, the force_merge() function is used when no free 
blocks of the requested order are available. In such cases,
smaller blocks must be merged on demand to satisfy the allocation. 
Mainly, this does not involve traversing the entire tree to
merge all blocks, but only merging as needed. For example, if the 
requested order is 6, and the minimum order is 5, drm_buddy_alloc_blocks()
will first attempt to allocate an order-6 block. If none are available, 
it will try to allocate two order-5 blocks. If those are also 
unavailable, it will
invoke force_merge() to merge lower order blocks (4, 3, 2, 1, 0) in 
order to coalesce into a higher-order block of order 5.

In drm_buddy_fini(), force_merge() is called to ensure all blocks are 
merged before tearing down the allocator. This guarantees that all
mm->roots are freed and not held by the driver at shutdown. If any 
blocks remain allocated, drm_buddy_fini() will issue a warning.

In drm_buddy_reset_clear(), which is invoked at device suspend/resume, 
it is an ideal place to call force_merge(). This ensures that all
possible blocks are merged before resetting the clear state, thereby 
reducing fragmentation and improving allocation efficiency after resume.

I tried using this rbtree_postorder_for_each_entry_safe() macro in the 
force_merge() and it works, but we also a need a reverse variant
since in normal allocation we dont want to disturb the lower addresses.

Thanks,
Arun.
>
>> That said; given 'next' will remain an existing node, only the 'pos'
>> node gets removed, rb_next() will still work correctly, even in the face
>> of rebalance.
> Good to know!
>
> Regards,
> Christian.

