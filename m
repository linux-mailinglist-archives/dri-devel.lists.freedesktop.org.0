Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7009D38B6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 11:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775010E6FD;
	Wed, 20 Nov 2024 10:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p7gKkTS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC1F10E6F6;
 Wed, 20 Nov 2024 10:50:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1tszBULeSw++mVn5tynDOGqFrPlIn2SOndX5Ar35xv3vN1fvnMi1+KrZzJ3SRGwhhYgvHV2LHafUEPxZZMNYrBsP0AMAHeP676R/Nv/usS2ndL7955fW09FcixHDNziXeOhqvOCTWU9YDI+vDcdEtrNi8fiWTAaxEG4x4QMeb5iAh7k61iZapJ/tBONuETTadK6ToTNI9R1GmJcUjWgtwwNJdUdq7dTVNL08SDxt0N3YvoYZroLwnSm5xECfeZyilYYcvfZwtyYQ92+GxZNKaB2Fz6o2qrvCT8EqMA5AlxGSh9AYv7yX6EE71I7Afkf9F4LBL3VSVegC99laH26Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsnurXcMMqWfbjJQeeudCQ3Q+7feGqXg7avVNC05Jy4=;
 b=TjRp0KtxJOoXYRnzBreb2XjWGmFCjaBoUyzOJ9gYh5vGFIfHgqkti7g7xHexsRbo9NRwHA/FXI0s+iInUbcVLPXikpumwkFAR1g4NmUSk4JGp6I+OYjyfee1oHHZcr3BcooopwnyYzYR3/VqbuqyoWRd2fkIyA9qSeSRBetp/C5mcimrh5hhH1J+C3H4wq5M8HGMoPJoKPgvM0QXQypKHSSlHllfMG2Aq/Zw1/xLzXEdqqilqvIS5Z35hK1bsVQi96Uj5a8Z0SmgTAw030VR6rE1ueyKFoc5liWn1/3rhqyf2XLwd+upGoEdnu4GUKiBmAv2axD9xjXeFhA7fiBnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsnurXcMMqWfbjJQeeudCQ3Q+7feGqXg7avVNC05Jy4=;
 b=p7gKkTS9iMr+uh6RUAMfnCYpiwRWbatOUP8LW2ps0kGeBhX3u5+sYVKp2mHy78EOqQv0HDZ2IgegB5pdD1fxb2By8YOdoXK1D3qh4/cwfW9LqtDGE51WCV16RGytVfLajVaNBmnwFOmPjPsFWknP0eoGYhRbTeJP7SbCI9tO7yM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 10:50:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Wed, 20 Nov 2024
 10:50:24 +0000
Message-ID: <560973dd-c125-415b-a1ae-bb3aae8d37b0@amd.com>
Date: Wed, 20 Nov 2024 11:50:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/8] drm/ttm: Provide a shmem backup implementation
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-3-thomas.hellstrom@linux.intel.com>
 <a87503b5-2bca-4614-8816-078ade6d0940@amd.com>
 <7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com>
 <22e11191-c52f-4544-a91f-5a53bc78fae9@amd.com>
 <c6150ee393df840af77afc7f370d74a04cfe40f2.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c6150ee393df840af77afc7f370d74a04cfe40f2.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: f43c5c9c-5e17-45e1-d450-08dd095122cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3E1KzN3ajVHWDZuenlrOWFWYm43WFg3a3B1Rk1xcDkwWXY2eDdReXBaeUNK?=
 =?utf-8?B?c25teTV5K04zSE1IbEh6Wmt1Z2Z6dThBRTZ6N05YbkwrTHhTNEdDNVpvRi9n?=
 =?utf-8?B?bndUWEtjYm9iU1FpTWxUT2NVbVJZNmJjcENWb1p6eGVZSUM5R3gwRzgzd3hm?=
 =?utf-8?B?Wi9OMXJ5VnM2YzJmSzhRTDc5TlhYMFE2Q1JGeUpCT0ZieXExajdJWGVjWW9Q?=
 =?utf-8?B?ZnhJR25LZW00YUU4OVpaa2l5eENTbS9laUZhbktXRllYZlgrQTNSVmVyUEZ4?=
 =?utf-8?B?cEFHVjZ2Q2dkNVhoN2x0NFZxOXRiQmhmeEt2RHJQTVc4em9hNW9WMTVzNGtV?=
 =?utf-8?B?ckVmVlFLdXoxWTlLNmcyMFN6TFFLWDFMUHJaejNLMlRzdnZXTXlwV0I4Y2lr?=
 =?utf-8?B?QVdLdllLaVZRVWlYek1UQkFFK1BmUUZSRldtN00xU3NDczdIcWNPSXhYb0gy?=
 =?utf-8?B?cysyUEFPWjhIZkNIWDhENHZMNjdxR2NhWnZiWnIrR3k4NXptZUkzZ1FwRC9Q?=
 =?utf-8?B?WjFRcEIwSFpOUDFOSW8zclFveUFNR1M3anpCME1zbWNPVGZEaUZuNHFsRGtO?=
 =?utf-8?B?WXlPZmQvWFBlRlhkVmRGTCtjMzZkMmFsVHBhZFZRRFBHMmk3VmlEZ1hqWmdG?=
 =?utf-8?B?bm1RbUpPSkhLV3NPTkdmMzhIdHVReGlhdFF0Vy8xcVRIZ1ZnMFlyVy8vZk9L?=
 =?utf-8?B?aUh2SUdSZDlDM2xOZXZwVzdjSFRuNEZRWnlROHc2UFdDOU5kV0dlOW9CZWtO?=
 =?utf-8?B?cWFzMkwwelR4Sjg4RGNlQTV0cGo1TFZpc2tiMHkzU1Z5SHVXV3RocEpDYy9U?=
 =?utf-8?B?MmhMRDlseTY0ek55aG16N2xDWmpiSzFNdGVwZW5CbXUzNTZzcXAxS1gxbWhj?=
 =?utf-8?B?REkxekR0bW10OHpQbFR1T1JocHdrWm9vaVlyZmQ1N09OQWxjRmdrOWJ0Vzdl?=
 =?utf-8?B?MmtEVjd2T0c4aDREZDVNQ29WVFppMEtmQjdjei83UzE0WUpvem9QVjZvS1la?=
 =?utf-8?B?NldCZlNkd0FSVHptb05LRFUzVTBjSm5LUHVlbGNlamJkZ2toWkV3emhGWndT?=
 =?utf-8?B?cVJTWWVERjExbVNEUmxiOGhMOFI4SlJXQUdBdGM5Mk84OXQwbDV4QmdzRllY?=
 =?utf-8?B?Y2VyZ2FYK01xdnZpYUZtMk4xMUVGT255Qm1HUE1oSUVRNWkwV2FCVzUyOU93?=
 =?utf-8?B?WTVYcUZFallMbk5qcVBWcytlZU02NjEyTFh2RXZnNDNoamVjZ2RIL3FTVXFx?=
 =?utf-8?B?dVQ3WVhPQTg4RzBVR1k5aGlYWnZDaWJHelB5OHE4UUhzZkk4dzFNYThJWUUy?=
 =?utf-8?B?VTZsUXdOZmphN0N5dWl4UEJ3NEpkdFpiWVdNbE9mNlJYbkt2ZzVjQ3c1RXdF?=
 =?utf-8?B?ODE0RHU5QjB3cS9WdTJ4TzU5aWF4a3JhdjVpbEl5UElGMURxNUlvdU1MRFNz?=
 =?utf-8?B?QVJ4YVYwZW9sbkk5VkNjeUt3dHptV3o3MGNFUXpXVUp1WFRLUFExcnhnZEVp?=
 =?utf-8?B?cUs0ajNsdHhYaklQZmdRbnJvdURDUTZFemFSR00rQ3BabzhITmZ2eC96cXY5?=
 =?utf-8?B?eCtoNC8wV0dCNlRRWU9hSit2UEg3VFYyWGJVNnQvdFFObUthY280RXVIdTBO?=
 =?utf-8?B?VitJbzRBamJ6NWpOQTN6RXM5OU8wMHRYcittT1ZvYlh2dFIzTkJ3Ymg5Q3ND?=
 =?utf-8?B?ODhlejhvTDdoeE4wdzJQZG5QM0hhaEhwdldpRXFuR0g0N2VpMzhHT0hsQlAr?=
 =?utf-8?Q?OQRpZrGZy4t0zJktTKncUUOKo6SnMlrPMirsYJ2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0RmcGJiNjNSRG9jNUJnazZvZzBJWmpZNmpVRGJTbDBlNnFmby9abUw2TDQ4?=
 =?utf-8?B?a3BaMW9OOEVaVHljK2liYVRtNVQzb0YxK1hEZnlwRm1mZlZjeXdkamNHTWJi?=
 =?utf-8?B?ZXZRZ1Q0UVh5V2NoS3lySXI3bGc3SFpmWWZkVER4dWo0b1A1WlQwOFkyeWhv?=
 =?utf-8?B?RmJGNDJSUjdpNWdLRXFvM3hXeW92WDUwVXE1Ykh6NzF4N1kvZjdNQzZWQW42?=
 =?utf-8?B?NnUzRE1PTm5VaXN4bWQvTTNLdUFiL256QmxKTnBic0tQNlZEVlJFYXJWZjRT?=
 =?utf-8?B?dSsvdlBvVW9CNGtrSXB5WFpDOG5VMnVjanM2QzNkSEZNNS90QXhLMGRMVFN4?=
 =?utf-8?B?WlFoeUZ2UlM2Q3lTUC95aFNURjJjRGVLSnBvcEtnckVJQnlUeEpTOThCVFls?=
 =?utf-8?B?MmFGR1lCZkRMTDkvVGtZM0tXbjRIMUdOMk5Uc3N5UUE2UmhndjZpTjVlYlIx?=
 =?utf-8?B?ZmZOTGdGazk0MllySm9CSlQ4MGozWmM1N2xXTlh6Z0hzTnc1R3RLYmtmY05N?=
 =?utf-8?B?bjNkT1hHY3lCL2xBY2NFYm5FQUo0UU9ibThjTDJVakQ4ODM1S2hteDFCbGNM?=
 =?utf-8?B?SmdVMzY3c1lEM1VsNzlvMFBVaVpNSDQ2bUI0WXhpWklRK05uSVJqdldQTk5M?=
 =?utf-8?B?a1JCRDhlTzhmUGZJUUtaUVM2MEFvSDFLN09zczZyMmdVUFZtZ0djN1NXeHRs?=
 =?utf-8?B?cVFhczA5bU9hNmwvREU3Vkh6cXZHcTJMZEFPazJCaEdVWnl1SHVHNmJYY01U?=
 =?utf-8?B?QWRqS1JOalJFaGJQeWtVMXJjaE1oZWFzbnBpUmZUNW10bC9leVJEb3ZhK1lD?=
 =?utf-8?B?cWttcmk2RWhUR2ZVTTdxemNvQlUvVkVGWHRBd1d4cGx0MTk3Q0NZdFZvbjds?=
 =?utf-8?B?WFVmeDNXbTErL1hXZ1NJdnk5OXBnVWtES0hSS3BpcFpNcStRYjFNNkdJZS9E?=
 =?utf-8?B?SW42c0ZEOStzUG5NaEN0b1NISVZRaDRZWk92aklGa240c3RYQ0NtekRqQ2pY?=
 =?utf-8?B?SGRreG53a1EvZFJFN3JUYTE3YWtRMFp5cGdodXRia1hyNWdzZUJxZE9WZFli?=
 =?utf-8?B?UmhnWlo5d0RPamJzVkNvWTZqSzBIeHhaTUpHTTY2NUtrS2s0UWVRSDh5Wndx?=
 =?utf-8?B?dFU0KzRhejNtQXFpK0wrZVpwUjVBZjVlZzl1am9pYjFhVXJPNERpdjdnaVBG?=
 =?utf-8?B?NmxHcmVUYUJtZkcyRDMxeHBFS2laZWJzUkdlQUZreWx2cDMvb0h3eWN0WWRn?=
 =?utf-8?B?WHJSY1d6UjQ3Vi81bSsvaGxzSFZ4RWc0RG1ydVVkTkhoSUZCNGY4WHM1b1lS?=
 =?utf-8?B?MjY0T0tKQUtQRWpXTDVXZGtPMFl2dlppK21WOERoRW5wTGdGU0U1ZDVqR0JD?=
 =?utf-8?B?WSt4ajRhTkxNUFlhQ3dFNVhoV3phNW5ENGpkUDdFeTZsUVdiUC9nUVljT09D?=
 =?utf-8?B?bGg1cHcyZExia2llQ2FlRWhMSUlhMFkxOElPMjNkMlFyakprUkw3YUl3KzJx?=
 =?utf-8?B?KzlmTnlKYzk0QU12ci9YQUJuTUk1YXJXLzN3MDBnV2FlM1Z5TjluR0NJWkYw?=
 =?utf-8?B?MzFCVGl4NyswdDIxZDZVOU5GdkhsempyNzdJMFRueTJCaUo0dmN1bm81YTBS?=
 =?utf-8?B?dDVGbjNvaDlLam9Bb3hxRUFISjl0TTFUSkd4eTliYjgzenVKVDZ6NnJ1WHow?=
 =?utf-8?B?ZkJ3M3pCT2NtWTNMQlhQOTVHM3BQVnd6SFRCaWZGcDIwazdEM2ZKOUNzemIz?=
 =?utf-8?B?dFhhRXdac3FUbHcxSWh4MTVwVm5kRVowYkN5dmpieUdZMHovL3dVWWhEUGVq?=
 =?utf-8?B?dGx4OGxCMk9YdHVUTWdEdDRzcWk0MTZYR1NIN2owaFNxa3I0b3JaOWFuZW5I?=
 =?utf-8?B?enhrWVpNOWUxQzFUVExFSWFhbWZ5N1g2TVIyZ3c1bjRmdEJzRGNnL3poRHA1?=
 =?utf-8?B?ZnpQZlcyWFhvemFtSkRPdy8zS0p2MEhUREJwcUVFMFkxVWlKRFRHa2tQVDdm?=
 =?utf-8?B?MUtBQnRUUTNOWWJmRGNDT0FkUTd2UEFlL2VBVnRqOWF3c2xBMVY4OGUzTys2?=
 =?utf-8?B?Z0hzbUFWU0tpRUJib0dJVzR5WldrdUVwUENkK3pYVVBzSXJSZVRFOG10dUIw?=
 =?utf-8?Q?52Nt5XyOfxxiBfRZGMZsM0GAJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43c5c9c-5e17-45e1-d450-08dd095122cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 10:50:23.9570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oW5N7sS4X860otFeyrLYJBn/TibhLpM3DJnpsYNLxC95NEeo//YCvjbv074jcWYt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385
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

Am 20.11.24 um 11:34 schrieb Thomas Hellström:
> On Wed, 2024-11-20 at 10:24 +0100, Christian König wrote:
>> Am 20.11.24 um 08:58 schrieb Thomas Hellström:
>>> On Tue, 2024-11-19 at 14:40 +0100, Christian König wrote:
>>>> [SNIP]
>>>>> +
>>>>> +/*
>>>>> + * Casting from randomized struct file * to struct ttm_backup
>>>>> * is
>>>>> fine since
>>>>> + * struct ttm_backup is never defined nor dereferenced.
>>>>> + */
>>>>> +static struct file *ttm_backup_to_file(struct ttm_backup
>>>>> *backup)
>>>> Do I get it right that struct ttm_backup is never really defined?
>>> Yes.
>>>
>>>> What
>>>> purpose does that have?
>>> It's to make the struct ttm_backup opaque to the users of the
>>> ttm_backup interface, so that the implementation doesn't have to
>>> worry
>>> about the user making illegal assumptions about the implementation.
>> That is usually done with a typedef and one of the few cases where
>> typedefs are actually advised to be used.
>>
> Well wouldn't ttm_backup.h then have to include the declaration of
> struct file plus a typedef that would probably raise many eyebrows even
> if it's ok to use it there?

No, what you do is something like this:

typedef struct ttm_backup *ttm_backup;

Then struct ttm_backup is either never defined or only inside your C 
file but not the header.

> Having the header just declare a struct without providing a definition
> is the typical way of hiding the implementation and avoid includes, no?
>
> If you insist we can drop the struct ttm_backup * and just use struct
> file, but then again if we change the implementation to allow for
> backuping to a file or similar that needs to be re-done, so as said
> unless you insist I'd rather keep it as is.

Abstracting that is ok, I was just wondering about why you do it like this.

>
>> [SNIP]
>>>>> + *
>>>>> + * Context: If called from reclaim context, the caller needs
>>>>> to
>>>>> + * assert that the shrinker gfp has __GFP_FS set, to avoid
>>>>> + * deadlocking on lock_page(). If @writeback is set to true
>>>>> and
>>>>> + * called from reclaim context, the caller also needs to
>>>>> assert
>>>>> + * that the shrinker gfp has __GFP_IO set, since without it,
>>>>> + * we're not allowed to start backup IO.
>>>>> + *
>>>>> + * Return: A handle on success. 0 on failure.
>>>>> + * (This is following the swp_entry_t convention).
>>>>> + *
>>>>> + * Note: This function could be extended to back up a folio
>>>>> and
>>>>> + * implementations would then split the folio internally if
>>>>> needed.
>>>>> + * Drawback is that the caller would then have to keep track
>>>>> of
>>>>> + * the folio size- and usage.
>>>>> + */
>>>>> +unsigned long
>>>>> +ttm_backup_backup_page(struct ttm_backup *backup, struct page
>>>>> *page,
>>>>> +		       bool writeback, pgoff_t idx, gfp_t
>>>>> page_gfp,
>>>>> +		       gfp_t alloc_gfp)
>>>>> +{
>>>>> +	struct file *filp = ttm_backup_to_file(backup);
>>>>> +	struct address_space *mapping = filp->f_mapping;
>>>>> +	unsigned long handle = 0;
>>>>> +	struct folio *to_folio;
>>>>> +	int ret;
>>>>> +
>>>>> +	to_folio = shmem_read_folio_gfp(mapping, idx,
>>>>> alloc_gfp);
>>>>> +	if (IS_ERR(to_folio))
>>>>> +		return handle;
>> Probably better to explicitly return 0 here.
> OK,
>
>> And BTW why are we using 0 as indication for an error? Couldn't we
>> just
>> use a long as return value and return a proper -errno here?
> 0 is the swp_entry_t error value which is the convention also used for
> the handles, so rather than inventing something new It'd be good to
> keep to something that would work even with handles aliased to
> swp_entry_t if we'd need to resort to that at some point.

Uff, yeah but that is an implementation detail of the swap subsystem 
caused by how we store the swapped out entries inside CPU PTEs.

I would strongly try to avoid that here. Was already wondering why we 
use long as return value and s64.

Regards,
Christian.

>
>>>> Just that I sleep better: This can never return a folio larger
>>>> than a
>>>> page, doesn't it?
>>> The interface definitely allows for returning larger folios, but
>>> the
>>> individual page in the folio is selected by folio_file_page(folio,
>>> idx).
>> Ah, yeah completely missed that and was really wondering why that
>> would
>> work.
> Thanks,
> Thomas
>
>>> /Thomas
>>>
>>>
>>>> Apart from those background questions looks good to me.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> +
>>>>> +	folio_mark_accessed(to_folio);
>>>>> +	folio_lock(to_folio);
>>>>> +	folio_mark_dirty(to_folio);
>>>>> +	copy_highpage(folio_file_page(to_folio, idx), page);
>>>>> +	handle = ttm_backup_shmem_idx_to_handle(idx);
>>>>> +
>>>>> +	if (writeback && !folio_mapped(to_folio) &&
>>>>> +	    folio_clear_dirty_for_io(to_folio)) {
>>>>> +		struct writeback_control wbc = {
>>>>> +			.sync_mode = WB_SYNC_NONE,
>>>>> +			.nr_to_write = SWAP_CLUSTER_MAX,
>>>>> +			.range_start = 0,
>>>>> +			.range_end = LLONG_MAX,
>>>>> +			.for_reclaim = 1,
>>>>> +		};
>>>>> +		folio_set_reclaim(to_folio);
>>>>> +		ret = mapping->a_ops-
>>>>>> writepage(folio_file_page(to_folio, idx), &wbc);
>>>>> +		if (!folio_test_writeback(to_folio))
>>>>> +			folio_clear_reclaim(to_folio);
>>>>> +		/* If writepage succeeds, it unlocks the folio
>>>>> */
>>>>> +		if (ret)
>>>>> +			folio_unlock(to_folio);
>> The code ignores the error and potentially deserves an explanation
>> for that.
>>
>> Regards,
>> Christian.
>>
>>>>> +	} else {
>>>>> +		folio_unlock(to_folio);
>>>>> +	}
>>>>> +
>>>>> +	folio_put(to_folio);
>>>>> +
>>>>> +	return handle;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_backup_fini() - Free the struct backup resources after
>>>>> last
>>>>> use.
>>>>> + * @backup: Pointer to the struct backup whose resources to
>>>>> free.
>>>>> + *
>>>>> + * After a call to this function, it's illegal to use the
>>>>> @backup
>>>>> pointer.
>>>>> + */
>>>>> +void ttm_backup_fini(struct ttm_backup *backup)
>>>>> +{
>>>>> +	fput(ttm_backup_to_file(backup));
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_backup_bytes_avail() - Report the approximate number of
>>>>> bytes of backup space
>>>>> + * left for backup.
>>>>> + *
>>>>> + * This function is intended also for driver use to indicate
>>>>> whether a
>>>>> + * backup attempt is meaningful.
>>>>> + *
>>>>> + * Return: An approximate size of backup space available.
>>>>> + */
>>>>> +u64 ttm_backup_bytes_avail(void)
>>>>> +{
>>>>> +	/*
>>>>> +	 * The idea behind backing up to shmem is that shmem
>>>>> objects may
>>>>> +	 * eventually be swapped out. So no point swapping out
>>>>> if
>>>>> there
>>>>> +	 * is no or low swap-space available. But the accuracy
>>>>> of
>>>>> this
>>>>> +	 * number also depends on shmem actually swapping out
>>>>> backed-up
>>>>> +	 * shmem objects without too much buffering.
>>>>> +	 */
>>>>> +	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
>>>>> +
>>>>> +/**
>>>>> + * ttm_backup_shmem_create() - Create a shmem-based struct
>>>>> backup.
>>>>> + * @size: The maximum size (in bytes) to back up.
>>>>> + *
>>>>> + * Create a backup utilizing shmem objects.
>>>>> + *
>>>>> + * Return: A pointer to a struct ttm_backup on success,
>>>>> + * an error pointer on error.
>>>>> + */
>>>>> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
>>>>> +{
>>>>> +	struct file *filp;
>>>>> +
>>>>> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
>>>>> +
>>>>> +	return ttm_file_to_backup(filp);
>>>>> +}
>>>>> diff --git a/include/drm/ttm/ttm_backup.h
>>>>> b/include/drm/ttm/ttm_backup.h
>>>>> new file mode 100644
>>>>> index 000000000000..20609da7e281
>>>>> --- /dev/null
>>>>> +++ b/include/drm/ttm/ttm_backup.h
>>>>> @@ -0,0 +1,74 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2024 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef _TTM_BACKUP_H_
>>>>> +#define _TTM_BACKUP_H_
>>>>> +
>>>>> +#include <linux/mm_types.h>
>>>>> +#include <linux/shmem_fs.h>
>>>>> +
>>>>> +struct ttm_backup;
>>>>> +
>>>>> +/**
>>>>> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct
>>>>> page
>>>>> pointer
>>>>> + * @handle: The handle to convert.
>>>>> + *
>>>>> + * Converts an opaque handle received from the
>>>>> + * struct ttm_backoup_ops::backup_page() function to an
>>>>> (invalid)
>>>>> + * struct page pointer suitable for a struct page array.
>>>>> + *
>>>>> + * Return: An (invalid) struct page pointer.
>>>>> + */
>>>>> +static inline struct page *
>>>>> +ttm_backup_handle_to_page_ptr(unsigned long handle)
>>>>> +{
>>>>> +	return (struct page *)(handle << 1 | 1);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_backup_page_ptr_is_handle() - Whether a struct page
>>>>> pointer
>>>>> is a handle
>>>>> + * @page: The struct page pointer to check.
>>>>> + *
>>>>> + * Return: true if the struct page pointer is a handld
>>>>> returned
>>>>> from
>>>>> + * ttm_backup_handle_to_page_ptr(). False otherwise.
>>>>> + */
>>>>> +static inline bool ttm_backup_page_ptr_is_handle(const struct
>>>>> page
>>>>> *page)
>>>>> +{
>>>>> +	return (unsigned long)page & 1;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_backup_page_ptr_to_handle() - Convert a struct page
>>>>> pointer
>>>>> to a handle
>>>>> + * @page: The struct page pointer to convert
>>>>> + *
>>>>> + * Return: The handle that was previously used in
>>>>> + * ttm_backup_handle_to_page_ptr() to obtain a struct page
>>>>> pointer, suitable
>>>>> + * for use as argument in the struct ttm_backup_ops drop() or
>>>>> + * copy_backed_up_page() functions.
>>>>> + */
>>>>> +static inline unsigned long
>>>>> +ttm_backup_page_ptr_to_handle(const struct page *page)
>>>>> +{
>>>>> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
>>>>> +	return (unsigned long)page >> 1;
>>>>> +}
>>>>> +
>>>>> +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t
>>>>> handle);
>>>>> +
>>>>> +int ttm_backup_copy_page(struct ttm_backup *backup, struct
>>>>> page
>>>>> *dst,
>>>>> +			 pgoff_t handle, bool intr);
>>>>> +
>>>>> +unsigned long
>>>>> +ttm_backup_backup_page(struct ttm_backup *backup, struct page
>>>>> *page,
>>>>> +		       bool writeback, pgoff_t idx, gfp_t
>>>>> page_gfp,
>>>>> +		       gfp_t alloc_gfp);
>>>>> +
>>>>> +void ttm_backup_fini(struct ttm_backup *backup);
>>>>> +
>>>>> +u64 ttm_backup_bytes_avail(void);
>>>>> +
>>>>> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
>>>>> +
>>>>> +#endif

