Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB659A47D5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7EE10E38B;
	Fri, 18 Oct 2024 20:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LZ9dPzOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50C110E387;
 Fri, 18 Oct 2024 20:23:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9a1x/1TidZZVSd3xwHY4RGplmwnqMpZwQoxzrCsC8LQF9huBq2mT6y6+aXPU/9rFOLsXT2vbFhZr7D5f+rWkipPxUsRVQ1rkveV6Q1KOJRcyui86AGsAzNtgnAhY9QPEYaC+396iNmzEowl5ugC+onqRhrOG0UQFNsr+JZdLJ5/cl9IXGX77fpb0uZmKcLOLz93MmFOZgSa2fAkKh0rG8rzpHhl3Jn6Kefr/d4mK6ovKlcOBIZO2bSElOu814XDO8nzGYOWxU4xTZdDkR2Hm3UPSXvasVMiaoIDtuzbfLcoqsXCaZ9Kiv6QLHJNzgyT5bqFNBxOj/5awqeURLlQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrMcM7/Pd9ugsG0kur0a1smZ0skUCfuFVZ/idlnoZdM=;
 b=LbSB51LThxoEoj9u+CuJ4PyMjkAms3WETcLmR7mMUg9Nar7lFfSx2MZKbHRnAH87sfOGPSE+QEhLaD071wT1DdAQaJRvmoLNu/xBJXydfzhfyrU66el9WnaP3W9saUS+qtUDVDQcS6xo4U0FuKywV1hF08jh79yuEdKzenrQNx9Dq0owyCmK93XxESf2NhzXjgMLvUxQbFA3ZfaIYmnZGHkroDVwBoovfIL6mJ0/hn8igM/7g0UUOnZCwwMQ02/9AVL7C1WT3gzCGQww8YVh3kYNYgTS7Jp0WYWHiU6qNzx1s1SSm+XSULO4NOF3hsBp7Mk81YKKhZTZim8EJZ7GpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrMcM7/Pd9ugsG0kur0a1smZ0skUCfuFVZ/idlnoZdM=;
 b=LZ9dPzOoS6q8py3WvzFpP61Nmy6hY//XLt3T1D2ohGZvyJI4riBwBjRI7s6DUE+UAv5re/mKaBH+iClS3zMwBTK95SFV+ErZEzaxi8HR97MvemL5j1kWsgGpSxoNC3Y9E6zSyyhpinmUBrYySNTQ1jOLpe3yPPwTO8BmElt7MYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 20:23:44 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%3]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 20:23:44 +0000
Message-ID: <b02828e1-cf14-4968-9739-7961b910315b@amd.com>
Date: Fri, 18 Oct 2024 14:23:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 42/44] drm/colorop: Add 3D LUT supports to color
 pipeline
To: Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-43-harry.wentland@amd.com>
 <W3Axn6bFNOkhZFPsRFRYAbmZno5mB1cyoecUKsIjsKIK5PRuT5cqddb9rHDFqg5fTCU5m9wT13G4Bt1GNR4DVpSHrAFXVX1FR83pedIfzBs=@emersion.fr>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <W3Axn6bFNOkhZFPsRFRYAbmZno5mB1cyoecUKsIjsKIK5PRuT5cqddb9rHDFqg5fTCU5m9wT13G4Bt1GNR4DVpSHrAFXVX1FR83pedIfzBs=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::9) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: d8baeb2a-580d-4db6-0bf5-08dcefb2c391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b09nZ2NPNUlyM3M3dHlJN3h1VnVGMUZxcXJTWmtyelRxUnorZmU5akFzbU9z?=
 =?utf-8?B?YWVjalEreTBOeWc5L0JEVmtiNEFWUytmZFVvT0JiN1EycFVEMG5mTzFITTEy?=
 =?utf-8?B?QjBmNlVwbHFubWZodFN4TFVqNjR1OU0wZGJuaEVudnp0SGxlWG5CSlRJaGx2?=
 =?utf-8?B?YUJKamxKclFWRmFZNGcvaXRmbWdwVm5zaUpJZ1lOam5qZzVwekROK1lnYVVI?=
 =?utf-8?B?OXFyWmxyTHpKN3BYWG5mVmNUNFIzWGgrdE9Wb1F6UytNV21SS0pXVE9QNENR?=
 =?utf-8?B?WkR1QUd4amU3QWloVFJmdldsVG1jeHZxbm80Y05vK3dqaXJuc2JqaDEwUFlx?=
 =?utf-8?B?WnJaOE9TNG9PTDdFK2dBcGh2MGdVeWhsdDg5eXdhZGVEWDIzdXV4ekgxLzM5?=
 =?utf-8?B?UW9KWklVVGJKaFNIUWxoeUJqZWp6d1EzK2JXeG1teCtoL3BpTTA1aVJhSDVi?=
 =?utf-8?B?RDBZSzNERmZYVFFQM1dLN3hLd0ZPR0FUNzZJcTRvS25PVFg2aEw5RjBqVXl6?=
 =?utf-8?B?aDNhSDRoTmNLTkJQSUpEd3YxbzdCNk5ZdEE2dDJTOEljWm84QVI1RmlVYUZm?=
 =?utf-8?B?ZkFhNGJEbFBucVY4RmlLVzdCTHVEY0gzR3MvVVdUNG1tMVd2N1pjRzIwYjRo?=
 =?utf-8?B?dVJxMnIzNHJQVDNma2hzTFp6N01ZVC85bGQyRHp2V0prUzVBYVQvbXNVK3pC?=
 =?utf-8?B?NDJqejQxVmVSdVZ4aDJEZmxjVW9CTTA0WjVDVEpjQThSNkdjVHlsZ1oyc2lh?=
 =?utf-8?B?STBnZmlQclNtc2VVc3haS2RUblpKc1REeG9iTktWc2ZGQmVPazIvb3FnZzcv?=
 =?utf-8?B?YVVsWTJWeVduYVFRSGpzTnZScXR3elYvY1g1VjJqZ24vdFZrSUVTU0h2MHRt?=
 =?utf-8?B?SEdhaW40bVVXbEMvSjgweUhpakV5NktodDA3NEVveUFiUUEzZCt1UzJMUzBx?=
 =?utf-8?B?Qm8vTjJISzMzOS9MZjlTbTZDZnhzTlNvU0FyOWJPTzRyYmEzUndkVkFrYTNQ?=
 =?utf-8?B?QTVYMkwrZzhleG9TWWRoNVlSVmdtVXRNT0pOTFg2aE93OGpUYW5Gbm5jYkd0?=
 =?utf-8?B?LzJ6WDlMSExHd0NpNC9salF0WitWeEttUkw0bTRIMmFVNkp4cTBjcGsvT1p5?=
 =?utf-8?B?QjFOemp0aWJvOS9Ka1psTjNSZW9UL3ZNYUlzM3g4RVVqM0t5S3dUM3JlRUNL?=
 =?utf-8?B?V2luVjI2WFdNd2NLSTRNeWRIU3RpY2dadG5jaE9pUFVLbEtsSktMTGFIaWw1?=
 =?utf-8?B?azlQNXkvaFVTUUd5VXhxWjF4cENTQVhXK0laUjk0QkYvalFqRytIWGhqOCtG?=
 =?utf-8?B?dGF6VmMxMit6elE0QjRtUXNmU210SFh4NXVCeVhvaHRYSFRqcUsyTXpicjN0?=
 =?utf-8?B?amNsenNZL2lBNGY3bDBtRTlKMUhJa3lCTmRJc0FlcmJubHI4LysvcEd6cGRi?=
 =?utf-8?B?S1NTMitaUlQ2N0xVZnpaYlE1ZG54alpHRkdITmJKNzlJeHhkS3NaYmc5a2NQ?=
 =?utf-8?B?MUFRS0NMSU1ZUmg0enUyVEhLWGVPOGdKeVFsOEVuV1d2eGd2V3JIcll2NTh4?=
 =?utf-8?B?WUd4b1RUVnpScXFBbkM5WmJpTWV1TElyYlY5azBvbUpqM0ErYzNoeWVyRFNX?=
 =?utf-8?B?bFhxcEpOeHUybzFkNDRXZEJvZVRoYkxGeGtJVGxvQWtNUm8rTDJkY0VPWFcz?=
 =?utf-8?B?MHI5SXN5WVhqQzEyYXBvNHNhSXQ0YnNkeWdBRlBBUG8xUmwrSWpETmZRdTh4?=
 =?utf-8?Q?619gz8pznohshXcc8ovOwYU/JyrFxw51yMy5ee1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUpiZnpoWm10MWFVenVkbzlKaUFVNnA4U2haK2Z3VkcrMU9RbmJqNUMwbDZn?=
 =?utf-8?B?a2hxK3hKUEt5T04rMHQ3b0toK3lDYndxMGw3OWwxSTNpZU83ZjJrbHQxdFJN?=
 =?utf-8?B?RENob0I5NUdKak4vendJSWZyQ1ZmdWFibWdpK3pobjJQRVpYMnhjeGsrdjRu?=
 =?utf-8?B?TVkyQmFlOXRSVmFjSzhqbXJlNjF3NGRMbVhyUjJaMFgyTXdxTmo4T3B6bEtk?=
 =?utf-8?B?UkNodWt0bXdubGUrOHh6K1I3azBNWXhzZXZJdERPWU1La3JFNUV5a214Zkg5?=
 =?utf-8?B?aVlJekxvdGtUeUdZcnZWdk5QUmFkRFovVVh4Njc4VDh0ejY3UERqR2xWSzQ3?=
 =?utf-8?B?VXR1dWhXUFF3SnR5SlVoMXVjWkszbGhCckRCVUROeGxpeVlsQndWdjBYcjNl?=
 =?utf-8?B?eFpuWUNkTUFMYk9nMVdFVjlucDFSQUhCUHFXS1B5MjdZYmxCYWlNMDBoK3ZL?=
 =?utf-8?B?eVJyWWhGNnJIbHNYaW5QcktzM3c1WHRncTJDNFNBUlk5QVZEbkw1UjdGT0xq?=
 =?utf-8?B?cktQS2NjQWZDK3FwS1hBKzcwamp0TWtZUVVhc3N4Q0xKVlArclVlR010Qksv?=
 =?utf-8?B?WEVRU0VidkFjUTdLbFhXUXJWOWNPTGs2QzZkYXFqNFBBZDRIbmhKR0pnRTZi?=
 =?utf-8?B?YTZwM3hEQzMvVkpLZHA0K2M0SlpZelR6OFg0eEJob3ZuRWVuREVZRmlVMG1r?=
 =?utf-8?B?VGVGeVpVRVZ1ZWJsSTAvVCtMcGdQYnhjZXBoWXR2eHNpelVFYjJGbEVEOWk5?=
 =?utf-8?B?eHU0QTRXbkl6bHl5S2krdDlnd3pGNWxSbjN1YjZmcklmbmREcHpQSlExM2dC?=
 =?utf-8?B?eUladDBNMnh4WkFoRGFodU1aTDhIbm1GT3VDdUQ5anB6WDMyOThxSFEyVFJB?=
 =?utf-8?B?ZVhzNkN2WHFBTDgxRmhKZWx3U2E4cnl2dDA5ZjRRamZDMUJ6eHFwT3RCOTVP?=
 =?utf-8?B?emF3bmxDbHVKYVhjei9YWmF6ZTdzbm0yNGhlZWRWK3QxdmcyRHFrK29xQm1P?=
 =?utf-8?B?VlRWOUowdHpWSm1Oa043TzhMRHkyWUxJNXN3aTJ2QmFZMU0ySEtxb2s0S3lZ?=
 =?utf-8?B?SHBYZlVycll1dTIzRG9xZ2lnbXdJRnN6NnZEbm1sYWxsNmw0UlVtN2x3Z1dG?=
 =?utf-8?B?Y1g5QnVTbThXSk5xNUFxM0M5ZVRsakwwSEpwMWZ2eTQxbDA2N1NYUG96a0JB?=
 =?utf-8?B?ajlhKzkyZjFSZVRFc2NXM3FsUWlaYkhPekpVNkpYVGJDUGRPSTBZTi9zOFFC?=
 =?utf-8?B?MUNGaFE3Y2RrUEZURDN3N21sdVZBNUNUdUxWSG4wd2Z5Q0Q3bEpCTjVrRVR2?=
 =?utf-8?B?RFVZemxFNGhEZ3RvbFRQZEJBWjl1ekxDdHZjaUp1T0YxcmpqY2NWWEtCcnBV?=
 =?utf-8?B?dDJYOTkzSGZiQlhoZnVMTWlGLzdCNWlqMmlqaHIxS2VQeWhrc1A2clpGSndR?=
 =?utf-8?B?T0g4TFU3aDJJQ294N3NpYXAwems5Q3kvcTk1NnFvWHFKdVh2UTVwMUgzZ28z?=
 =?utf-8?B?bCtVeHFkVlNXUVNVS0ZHblVubFhIdU4xZEN6SzJsQlZ2MG4rSVo5TjNvSXAy?=
 =?utf-8?B?cEp0SFdGV1hHVlNjTk9BRUFjcXUyQTJoU2Z1UWZKdm9ML2dPeUdvclczRFRL?=
 =?utf-8?B?b0pPN1kvSHZxUEFJdlFkN1RvalRJV05YaTJIdnF5cEF4MDVabDVuS2F2azZw?=
 =?utf-8?B?NzdtS2lXd0pwV0tZVW52SUp4ZmZKNFBDWFI0TFRaTDNVNDljSzFCb3g5eS8y?=
 =?utf-8?B?NktPcEliaVlNdFluczV0aWRvamhFSUFXb2JuMG1aNVpIcllxQTB0SVAvczg4?=
 =?utf-8?B?c1FlZyt4aTJnd3Yzdm1xMmJMcHFhMEQxeDZWbTNJYXlwQTk1cGxjWEJaS0lW?=
 =?utf-8?B?enFKNFJaNzVJNm5OMkJJMjI4UlJrbWdpQVZ0cGxuTGV4VkZwWlA2dEJvOThM?=
 =?utf-8?B?V1U2ZWh3SUkwN1VyY3dBcFhZdjVJcTVQcnVxNWh0aXBLV3FkM2FYTmlTVE10?=
 =?utf-8?B?M1hCMlYvQS9WYVpzZVZrWmVSbDZ0dUFxM3M3UEYzSi9PNXY5bG84d0E3QllO?=
 =?utf-8?B?RXBENnhUbFRDQjdTMENjbHdDM2VDdVZ4U3dkRFdqcDZWWlVnZ091YmpPSXJL?=
 =?utf-8?Q?67y0ulCK3RhvZ8hqWo1iK+oBr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8baeb2a-580d-4db6-0bf5-08dcefb2c391
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 20:23:44.5726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o31xUBuozA2wzNgXabQT9ilzhgw/pfuoJRRlBxKc4sKjJ8/BibVEhRBPu/Hom1j/jlcjHWIK0VxV5VB/uI2gxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349
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



On 10/13/24 09:58, Simon Ser wrote:
> On Thursday, October 3rd, 2024 at 22:01, Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> From: Alex Hung <alex.hung@amd.com>
>>
>> It is to be used to enable HDR by allowing userpace to create and pass
>> 3D LUTs to kernel and hardware.
>>
>> 1. new drm_colorop_type: DRM_COLOROP_3D_LUT.
>> 2. 3D LUT modes define hardware capabilities to userspace applications.
>> 3. mode index points to current 3D LUT mode in lut_3d_modes.
> 
> Do we really need all of this complexity here?
> 
> User-space needs to copy over its 3D LUT to the KMS blob. Kernel needs to
> copy from the KMS blob when programming hardware. Why do we need a list of
> different modes with negotiation?
> 
> I've heard that some of this complexity has been introduced to add in the
> future BO-backed LUTs. That would be a nice addition, but it's not here
> right now, so how can we design for that case when we haven't actually tried
> implementing it and made sure it actually works in practice?
> 
> It would be easy to introduce "modes" (or something different) when the
> BO-based 3D LUT uAPI is introduced. There are many ways to handle backwards
> compatibility: new properties can have their defaults set to the previously
> fixed format/swizzle/etc, a new colorop can be introduced if there are
> too many conflicts, and worst case new functionality can be gated behind a
> DRM cap (although I don't think we'd need to resort to this here).
> 
> I'd recommend just having one fixed supported format, like we have for
> 1D LUTs. We can have a read-only props for the size and the color depth,
> as well as a read-write prop for the data blob.
> 

That's a good point. I will simplify DRM_COLOROP_3D_LUT implementation 
and remove 3D LUT mode. It can be used for future BO-based 3D LUT if 
necessary

In summary:

The attributes to be kept now: lut_size, interpolation and color_depth. 
The rests can be fixed and documented for userspace.

>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index 5ef87cb5b242..290c2e32f692 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -913,6 +913,90 @@ enum drm_colorop_type {
>>   	 * property.
>>   	 */
>>   	DRM_COLOROP_MULTIPLIER,
>> +	/**
>> +	 * @DRM_COLOROP_3D_LUT:
>> +	 *
>> +	 * A 3D LUT of &drm_color_lut entries,
>> +	 * packed into a blob via the DATA property. The driver's expected
>> +	 * LUT size is advertised via the SIZE property.
>> +	 */
>> +	DRM_COLOROP_3D_LUT,
> 
> User-space docs are missing many details I believe.
> 
>> +};
>> +
>> +/**
>> + * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
>> + *
>> + */
>> +enum drm_colorop_lut3d_interpolation_type {
>> +	/**
>> +	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
>> +	 *
>> +	 * Tetrahedral 3DLUT interpolation
>> +	 */
>> +	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>> +};
>> +
>> +/**
>> + * enum drm_colorop_lut3d_traversal_order - traversal order of the 3D LUT
>> + *
>> + * This enum describes the order of traversal of 3DLUT elements.
>> + */
>> +enum drm_colorop_lut3d_traversal_order {
>> +	/**
>> +	 * @DRM_COLOROP_LUT3D_TRAVERSAL_RGB:
>> +	 *
>> +	 * the LUT elements are traversed like so:
>> +	 *   for R in range 0..n
>> +	 *     for G in range 0..n
>> +	 *       for B in range 0..n
>> +	 *         color = lut3d[R][G][B]
>> +	 */
>> +	DRM_COLOROP_LUT3D_TRAVERSAL_RGB,
>> +	/**
>> +	 * @DRM_COLOROP_LUT3D_TRAVERSAL_BGR:
>> +	 *
>> +	 * the LUT elements are traversed like so:
>> +	 *   for R in range 0..n
>> +	 *     for G in range 0..n
>> +	 *       for B in range 0..n
>> +	 *         color = lut3d[B][G][R]
>> +	 */
>> +	DRM_COLOROP_LUT3D_TRAVERSAL_BGR,
>> +};
>> +
>> +/**
>> + * struct drm_mode_3dlut_mode - 3D LUT mode
>> + *
>> + * The mode describes the supported and selected format of a 3DLUT.
>> + */
>> +struct drm_mode_3dlut_mode {
>> +	/**
>> +	 * @lut_size: 3D LUT size - can be 9, 17 or 33
>> +	 */
>> +	__u16 lut_size;
> 
> Are "9, 17 or 33" just example values? Or does the kernel actually guarantee
> that the advertised size can never be something else? It doesn't seem like
> there is a check, and enforcing it would hinder extensibility (adding new
> values would be a breaking uAPI change).
> 
>> +	/**
>> +	 * @lut_stride: dimensions of 3D LUT. Must be larger than lut_size
>> +	 */
>> +	__u16 lut_stride[3];
> 
> It sounds a bit weird to have the driver dictate the stride which must be used.
> Usually user-space picks and sends the stride to the driver.
> 
>> +	/**
>> +	 * @interpolation: interpolation algorithm for 3D LUT. See drm_colorop_lut3d_interpolation_type
>> +	 */
>> +	__u16 interpolation;
>> +	/**
>> +	 * @color_depth: color depth - can be 8, 10 or 12
>> +	 */
>> +	__u16 color_depth;
> 
> Ditto: reading these docs, user-space might not handle any other value.
> 
> It would be nice to better explain what this means exactly. Are the output
> color values truncated at this depth? Or are the LUT values truncated? Or
> something else?
> 
>> +	/**
>> +	 * @color_format: color format specified by fourcc values
>> +	 * ex. DRM_FORMAT_XRGB16161616 - color in order of RGB, each is 16bit.
>> +	 */
>> +	__u32 color_format;
> 
> Do we really need to support many different formats?
> 
> User-space needs to perform a copy to the KMS blob anyways, so can easily
> convert to an arbitrary format while at it.
> 
> Is there a use-case that I'm missing?
> 
>> +	/**
>> +	 * @traversal_order:
>> +	 *
>> +	 * Traversal order when parsing/writing the 3D LUT. See enum drm_colorop_lut3d_traversal_order
>> +	 */
>> +	 __u16 traversal_order;
> 
> DRM formats usually have variants for all of the supported/desirable swizzles.
> For instance we have DRM_FORMAT_XRGB16161616F and DRM_FORMAT_XBGR16161616F.
> Can't see why we couldn't add more if we need to.

