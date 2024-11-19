Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F609D22EE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D3010E602;
	Tue, 19 Nov 2024 10:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EiLwuHnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A48B10E602;
 Tue, 19 Nov 2024 10:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2K1z6u2eTwOTAKH6fVqlTJILGLWiwVR/YsN2Hw6QCzROSams+mwiQXbaTXNXP0m5C9ayZk1vDk+BaSMnVUeUAWo2YQ/WTpYnmXrgh6OYNA9+d4jv8LddRqOE6UXEsNKceeScQ0jEh5UZqIb3VWkm1TZRPOeNe0NgIsw710DDPgp8FuNhGdMdQf4EaDvNk2G0fZiRFdZZLduEhyYB/dN2wiiLXXpom9/RrFjZ849p2LHQcNQ1r1q6ldubdEZTEnrP9YWSjybPySgdp16mtKXg1yDR/BqE7lt420Y+Ea/vkYNgoSNNPbNrU69TqXIO4p0rKwoKOJZdbvN8PnatcVM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smWqY4Mh3B3RT13jASueEYRhgBe4/ugTf/PXZjoY3VQ=;
 b=JgnNbMg9SOBrGnyF6Sn0iKRAFFd8bAV/gBA3S/mBNfeS0jPFJ5oIWNyU+mNotoV3aLyNDjBrTeJVxqbt1FE7F1DkU3xXAGGEBve2quZ0XUFd6qgbb1NHl4s2ENhir2pOr/+Vf3R5G8/EKlf57m12c5hzIi68NItUUyTrt4x/1S7clEteQuD19cn/ssV81MxUS2VLmWSE7Vg4B8nMdbLUFSkwVbdEVLaBfiuDo7OUthyKF2B5xLHjXlTZQ2tqTmT2/R8slbyVEBrfdtHhdpiA01Zy6rV3uPMCNK6n7jbT8Q7/cxznyky30EcbXftHaZEh/whLrpy0i5YGQbqHmlul4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smWqY4Mh3B3RT13jASueEYRhgBe4/ugTf/PXZjoY3VQ=;
 b=EiLwuHnSrMFlScb+f6a5TI9qt9ecC5gCsBoaCMvOkO0UIY7A//3m3luR1DlN5QhK6UPdw4fVCeiXNyhMF6afesHegtWmxcin6Ox/saS8dkupPUV8LVBx3d4e6dmpm5hqb5TExyXUh8PfMkrgWOAmQjqNtzFepC2a2P1q2MqSDrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7751.namprd12.prod.outlook.com (2603:10b6:208:430::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 10:00:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Tue, 19 Nov 2024
 10:00:51 +0000
Message-ID: <ec16da8d-6e1b-4774-93d6-594bc30e2b78@amd.com>
Date: Tue, 19 Nov 2024 11:00:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 13/29] drm/xe/mmap: Add mmap support for PCI memory
 barrier
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, mihail.atanassov@arm.com, steven.price@arm.com,
 shashank.sharma@amd.com
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-14-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241118233757.2374041-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 1168debd-f940-4fb9-a5bf-08dd08810c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnNFcGN0ZnJqd3hzUll5MGFCNU1ieEpmYjJ0bllhWm9ZNG1HcExocGpxdmhY?=
 =?utf-8?B?V3FrWFB6Wk9XMjR4TGgrVDhTZmw4NWFSWkk5MWFaeCtESFJXMmhMU0x0RjVT?=
 =?utf-8?B?Y2M0RlJSOVF4N2prNlNWOHhpS1k5WGhUQVJmcTdDb3ZGQWtLMUZLOGVmNERj?=
 =?utf-8?B?a0pYZmQyMXhCUmIyNXpTUTc5VjJJMVUvcjYvSG9zR2Uyb2UzbXVPOHFZc2Zp?=
 =?utf-8?B?VVc2aWNYT25pK21JbnFjTWJxdklWUDU3MzVFcTM2RkxncjVZeTYzVk1QVWFh?=
 =?utf-8?B?dlVUK01DOW9va3hWK0hnM3V6Y1MxakdFZlZEQUViSWZvYW1YeTVYZitmekp6?=
 =?utf-8?B?dXRBd1VCbkNCbnlHb01uR05YTTJtV09GQUpJYmNFRzJvV0ZBckYyY2FiN3d5?=
 =?utf-8?B?d1M5SWl6SVRZNE9ORVcweTF6S1ZsQUFDUlNaaEZNWUJWeUN5ZWVGRG1zT1RX?=
 =?utf-8?B?M2JnbDh0Z1ZYdFhndDBtVW51b0RhNzE3QWdQcVBnaE1SS295VlBwcFhIcDh6?=
 =?utf-8?B?MHpCMThyRzhJMy80c3ZKRC8rTXFyVFgzODJiQzdUak01c21GN3h0aTZOdWw2?=
 =?utf-8?B?OHcyWVVha2FkYTBhK1R6WTZMblBQTjFhVy9lTjBYbG9pcjc1alc0RG1GMzFk?=
 =?utf-8?B?cFhNTk5YWTF3UVlYQzhJRVZWdnVJd1N3MTJjcStUaUE4QVhxd2ExVDBNQVdy?=
 =?utf-8?B?SXlXVnY2UUZ2VnN4Y2NiZ01XVzBhdGJTd0p1LzUxNFdXZ0VKNzRxeUZZalRR?=
 =?utf-8?B?R1c0UU1wWkpIV1hiSDJlMzY4dlh1UktlNTR0anlBRXpmSlUvZkJydG0zWlEy?=
 =?utf-8?B?cGtHMCtUc3lPTCtOU01RblVTTk5uK0dBQ2RTbU9nQVFhRnJmZnp6ZU9CVEtW?=
 =?utf-8?B?c0JKRjRMTlNsMGRsNmN5cWRZYy84ZzJ2b3BmdExFa2hBKytDcHFwWEZscmg1?=
 =?utf-8?B?VTJ0YXNNamh0bWNiYy83Ty9DcEFWSFVtRllGOTJOZWR1dzVLNTlTbXhKMVds?=
 =?utf-8?B?NTZSdGhDaTd5OXRNVk1mRWU5ZWRTRnViT0VaUFVYZ1lLTFRtTEJoY2NEbnJ6?=
 =?utf-8?B?UkFPVWk3RzUrUXdJUW1RZTgvR2FXdFhxTUhLTmdZQ25jdzQ1aXllc3lhcjFF?=
 =?utf-8?B?U2VPdjhWdWNuZW5mQnJPZytHM3B5UC81cG5kSmkzTU85QUJOM1Z0T3o5TU5t?=
 =?utf-8?B?Z0FwamoxdXRicERxanZRVC8zV3l1N3JSeTJKdURpa3BwWUdUV0t6UTQvOVA4?=
 =?utf-8?B?NVpRdEFxZ0cvRXdoblB6NTdTTFg3VWlkYlJNN2JFalZCcFRJYXYvNi9YcW1K?=
 =?utf-8?B?UmRvKzNmdGFrZW5NS0Zvdmx1MEY4WFk0VG5tVUJoSi9aUnF4dU9oZHJQTjVh?=
 =?utf-8?B?SWlRWmxsM0pHWUozNHdQZjIwREZ5R2w3YlluOVVhbFF4QXlMcVRndnA4Vmlw?=
 =?utf-8?B?K0RFTjdMWkhWN2kyZSs2UUFMYUJjd0ZoUjlQWWp2bHZBYjBXakptVDhYTmx6?=
 =?utf-8?B?SWZpVmxlNTVDbVJpcTIxQUpSVkNCZWdWLytWWmF6TWp6djZWM3RFMzU3eTlL?=
 =?utf-8?B?ejRJbFpQeFlGdmZJYm1vTDdnSDNXenNrWlhadUZnVGdna1V6M3h4bU1ra3Mw?=
 =?utf-8?B?dmxqYTRzajdqcnpjLyticGpJYkw2ZWNBczBpNG1KL0QwRDZqcnF5ZU1OcW9L?=
 =?utf-8?Q?1ro5m9d5R1ik5L+zRPNx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c25ZdTdqT2QvSWJlUTcxU1NUeHU3eCs1VStRU2hCRlI5ZlJsTnB3c0JGUlpW?=
 =?utf-8?B?OXVxLzB1bGc4MVR6WW9uY09FK09NWXFtaThzRjBEbXdZWldraExhblU4cmt0?=
 =?utf-8?B?blBaU1RiTzRPZTkwT1UzeGZ4dzFjQlF6eGlkOWRPcXhJVnFYek81c3hUS3Nv?=
 =?utf-8?B?VGlDRHVySys0ZDgrZ1RXSU54MkExemppdXE2b3FlelJ3aXYvbUk1blhqNDBF?=
 =?utf-8?B?Uk9LTkU1QXlkVktEN25OTnZxdElpVGlUV3R0b2k3NW0xRXlRUHcvTFVQUzRj?=
 =?utf-8?B?cE9LaDN4Z3VVZlZZU3B6Y3pyclZyNUFyWmZyV0VaYm9BbjlqcWMwTXhuZ2Jj?=
 =?utf-8?B?WDZQSlllZHRxZW9EblNhWDA4d3ZqS0pVZjBncm12WDVudklnMGtCVmswM0hk?=
 =?utf-8?B?OTErT3NDaENodGpYd0JOWi8xK084QjF1enZQdlgyRFdEQ1JjcXVQdDZHZm0v?=
 =?utf-8?B?cTFGdEpXbEdzNVhoV1Ywa2kzVENpMDRrY1hsMWtKL1FYaUZLeGYwL0Zkc3M4?=
 =?utf-8?B?QnBvVnMvYVQySXlzVUN0a0VyNXhJS1BZaFk5R016VGNMK2JpRk1lRDlxS1lK?=
 =?utf-8?B?dDJCNWNQY1VoOXRQeElJclA1UlVqYk9aQnRyM1BBQitzeWR1M2o0OWljQWNl?=
 =?utf-8?B?MjBEU3pwMWFvL2dZTnJsRUFweGNWNERBMmt4VEJRaEdacFhqT3NlRmtSblAz?=
 =?utf-8?B?YmRndjF5UnNkK1g4N2VPRmJ1VlJ2djczK0JIZzg2cWgxaDFYMUxxK21zR3o4?=
 =?utf-8?B?L1lYM2VHS3FRVWNzbDltZ1RIcW9Xb2Z2ekc4TEtpZWU3WTd2WURnOTdIckZz?=
 =?utf-8?B?Qm5TekVrTU5jd3FsWC9UM01wbUZnMkdsNVI5YUZ2WENqN0F0aUh5Tk5hV3Uw?=
 =?utf-8?B?Ukx4SldxeFF3N1BXMC94MU50V2hmU2V2ZkkrZUkya1BwTHRzbVp5NXhHenNa?=
 =?utf-8?B?WWI4SDgrZGdadFBFS1JEdkxDVTVabGc5TlpndGpSWU1GOHdvSjBUTVA1NnhT?=
 =?utf-8?B?WEh4aklERDI0VEtkeEQxSUV0VlIwb0F4THN3cDJEc3dXQ29BcXA2bmphd2dx?=
 =?utf-8?B?Mm44eEJJWlR5bmtvT0lobkVOMDU4akx2RzlEWm5LcCtISjhQVDZkTmVLcTdo?=
 =?utf-8?B?QkR4T05Ja2JSai9ORDlrL21WNUFRZitRVWpDZG1ZWUEwSWxJYmNmZ01EVDhp?=
 =?utf-8?B?UWRhSXJRQ044a0Qxa3hFVXNZZks3NzRDUElscHNzYVBlV3BZMTVUMEtDNkZC?=
 =?utf-8?B?VDJ3aGFncVcrR3lJRU1tUkdrL0h4VlFnQ2hkVEo5NjdCbW5LTzFJZE9Nc0d5?=
 =?utf-8?B?eUhyWHRXcjJQSy8xL25MVy9IQWpieWJJQnJXN0kzSXFpc0krMHV5VTYzMUVC?=
 =?utf-8?B?VkZyQXBtU3NaeVk2SnQzbHREQVpKTTdzOUdXZTNoZGFyOWFvZGZVM2dLOTl4?=
 =?utf-8?B?Ylo0a3lkbytLekIrR3pPS0EvNVdETjgyK1FKZ20rR3ZMbVd5SWFLaFY3MDQy?=
 =?utf-8?B?UnRXNG5wU3VVcHUyMDBHUWNCaHY0TmNycnI4NjM2ekI2dVllYWcwM1RTbWFy?=
 =?utf-8?B?RnFLU1ppZlVpMVlNRnQwMWo4UXYwWWV2OEZkNTBQOGt4VnNZSjVxeWcvN05r?=
 =?utf-8?B?cnFyS2RuRER6Vk56Mnp4c0xHNE4ranE1bUNCSjFsTGp1aUZxQzM3TjUwUm12?=
 =?utf-8?B?eTdJY2ZXZ2t2eUVCZUUvQXdjUkhYSEw0OCs2bWRhVTNtK0pVM3JYc0pJcmE2?=
 =?utf-8?B?a1B3ZGdQOHcybzVKaUlEQ09zVEVIM0djZkNNTlcwN2tUZGRjYU9RaHRnYTlk?=
 =?utf-8?B?alB0N2FINWlKODcxdkYzR3UyTXRZbzVJRXlieFUxcWJoZlEwd3UrOGQ2a1Bz?=
 =?utf-8?B?enpRT3Q5aEZYNDRqZkhzUkVZVDN2L2pFOHA2bnhEUUZhOExTekxtOFhMeEoz?=
 =?utf-8?B?SmVSRTBMd0xkNTlSYnVVbkhycnZLSTlPcnpIUnFYNUc0MCtteEw5clhlRWln?=
 =?utf-8?B?RDBDMXRQSEJGM09USy9iNlRHZ09ZckFQdWhsQmRKMis2OWZCM2Z5YmNWYTNl?=
 =?utf-8?B?aVBaYk5HTWIxWG84bllHTXJFbHUra3hCaGUvZWFvK2NSWEpQaGdjSUpUNGph?=
 =?utf-8?Q?qFjBK4uSJ9eVJfyzX9vb6oI7o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1168debd-f940-4fb9-a5bf-08dd08810c91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 10:00:51.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdsVc11j9OKWShbDEfpQ7Bd1kAjfeKk34UlmShq+vFuczLRQmXUhYSmmZSFylohr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7751
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

Am 19.11.24 um 00:37 schrieb Matthew Brost:
> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
>
> In order to avoid having userspace to use MI_MEM_FENCE,
> we are adding a mechanism for userspace to generate a
> PCI memory barrier with low overhead (avoiding IOCTL call
> as well as writing to VRAM will adds some overhead).
>
> This is implemented by memory-mapping a page as uncached
> that is backed by MMIO on the dGPU and thus allowing userspace
> to do memory write to the page without invoking an IOCTL.
> We are selecting the MMIO so that it is not accessible from
> the PCI bus so that the MMIO writes themselves are ignored,
> but the PCI memory barrier will still take action as the MMIO
> filtering will happen after the memory barrier effect.
>
> When we detect special defined offset in mmap(), We are mapping
> 4K page which contains the last of page of doorbell MMIO range
> to userspace for same purpose.

Well that is quite a hack, but don't you still need a memory barrier 
instruction? E.g. m_fence?

And why don't you expose the real doorbell instead of the last (unused?) 
page of the MMIO region?

Regards,
Christian.


>
> For user to query special offset we are adding special flag in
> mmap_offset ioctl which needs to be passed as follows,
> struct drm_xe_gem_mmap_offset mmo = {
>          .handle = 0, /* this must be 0 */
>          .flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> };
> igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
>
> Note: Test coverage for this is added by IGT
>        https://patchwork.freedesktop.org/series/140368/  here.
>        UMD implementing test, once PR is ready will attach with
>        this patch.
>
> V6(MAuld)
>    - Move physical mmap to fault handler
>    - Modify kernel-doc and attach UMD PR when ready
> V5(MAuld)
>    - Return invalid early in case of non 4K PAGE_SIZE
>    - Format kernel-doc and add note for 4K PAGE_SIZE HW limit
> V4(MAuld)
>    - Add kernel-doc for uapi change
>    - Restrict page size to 4K
> V3(MAuld)
>    - Remove offset defination from UAPI to be able to change later
>    - Edit commit message for special flag addition
> V2(MAuld)
>    - Add fault handler with dummy page to handle unplug device
>    - Add Build check for special offset to be below normal start page
>    - Test d3hot, mapping seems to be valid in d3hot as well
>    - Add more info to commit message
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c     |  16 ++++-
>   drivers/gpu/drm/xe/xe_bo.h     |   2 +
>   drivers/gpu/drm/xe/xe_device.c | 103 ++++++++++++++++++++++++++++++++-
>   include/uapi/drm/xe_drm.h      |  29 +++++++++-
>   4 files changed, 147 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 96dbc88b1f55..f948262e607f 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2138,9 +2138,23 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> -	if (XE_IOCTL_DBG(xe, args->flags))
> +	if (XE_IOCTL_DBG(xe, args->flags &
> +			 ~DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER))
>   		return -EINVAL;
>   
> +	if (args->flags & DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER) {
> +		if (XE_IOCTL_DBG(xe, args->handle))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, PAGE_SIZE > SZ_4K))
> +			return -EINVAL;
> +
> +		BUILD_BUG_ON(((XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT) +
> +			      SZ_4K) >= DRM_FILE_PAGE_OFFSET_START);
> +		args->offset = XE_PCI_BARRIER_MMAP_OFFSET;
> +		return 0;
> +	}
> +
>   	gem_obj = drm_gem_object_lookup(file, args->handle);
>   	if (XE_IOCTL_DBG(xe, !gem_obj))
>   		return -ENOENT;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7fa44a0138b0..e7724965d3f1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -63,6 +63,8 @@
>   
>   #define XE_BO_PROPS_INVALID	(-1)
>   
> +#define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
> +
>   struct sg_table;
>   
>   struct xe_bo *xe_bo_alloc(void);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 930bb2750e2e..f6069db795e7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -231,12 +231,113 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>   #define xe_drm_compat_ioctl NULL
>   #endif
>   
> +static void barrier_open(struct vm_area_struct *vma)
> +{
> +	drm_dev_get(vma->vm_private_data);
> +}
> +
> +static void barrier_close(struct vm_area_struct *vma)
> +{
> +	drm_dev_put(vma->vm_private_data);
> +}
> +
> +static void barrier_release_dummy_page(struct drm_device *dev, void *res)
> +{
> +	struct page *dummy_page = (struct page *)res;
> +
> +	__free_page(dummy_page);
> +}
> +
> +static vm_fault_t barrier_fault(struct vm_fault *vmf)
> +{
> +	struct drm_device *dev = vmf->vma->vm_private_data;
> +	struct vm_area_struct *vma = vmf->vma;
> +	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	pgprot_t prot;
> +	int idx;
> +
> +	prot = vm_get_page_prot(vma->vm_flags);
> +
> +	if (drm_dev_enter(dev, &idx)) {
> +		unsigned long pfn;
> +
> +#define LAST_DB_PAGE_OFFSET 0x7ff001
> +		pfn = PHYS_PFN(pci_resource_start(to_pci_dev(dev->dev), 0) +
> +				LAST_DB_PAGE_OFFSET);
> +		ret = vmf_insert_pfn_prot(vma, vma->vm_start, pfn,
> +					  pgprot_noncached(prot));
> +		drm_dev_exit(idx);
> +	} else {
> +		struct page *page;
> +
> +		/* Allocate new dummy page to map all the VA range in this VMA to it*/
> +		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +		if (!page)
> +			return VM_FAULT_OOM;
> +
> +		/* Set the page to be freed using drmm release action */
> +		if (drmm_add_action_or_reset(dev, barrier_release_dummy_page, page))
> +			return VM_FAULT_OOM;
> +
> +		ret = vmf_insert_pfn_prot(vma, vma->vm_start, page_to_pfn(page),
> +					  prot);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct vm_operations_struct vm_ops_barrier = {
> +	.open = barrier_open,
> +	.close = barrier_close,
> +	.fault = barrier_fault,
> +};
> +
> +static int xe_pci_barrier_mmap(struct file *filp,
> +			       struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +
> +	if (vma->vm_end - vma->vm_start > SZ_4K)
> +		return -EINVAL;
> +
> +	if (is_cow_mapping(vma->vm_flags))
> +		return -EINVAL;
> +
> +	if (vma->vm_flags & (VM_READ | VM_EXEC))
> +		return -EINVAL;
> +
> +	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO);
> +	vma->vm_ops = &vm_ops_barrier;
> +	vma->vm_private_data = dev;
> +	drm_dev_get(vma->vm_private_data);
> +
> +	return 0;
> +}
> +
> +static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	switch (vma->vm_pgoff) {
> +	case XE_PCI_BARRIER_MMAP_OFFSET >> XE_PTE_SHIFT:
> +		return xe_pci_barrier_mmap(filp, vma);
> +	}
> +
> +	return drm_gem_mmap(filp, vma);
> +}
> +
>   static const struct file_operations xe_driver_fops = {
>   	.owner = THIS_MODULE,
>   	.open = drm_open,
>   	.release = drm_release_noglobal,
>   	.unlocked_ioctl = xe_drm_ioctl,
> -	.mmap = drm_gem_mmap,
> +	.mmap = xe_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
>   	.compat_ioctl = xe_drm_compat_ioctl,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 4a8a4a63e99c..6490b16b1217 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -811,6 +811,32 @@ struct drm_xe_gem_create {
>   
>   /**
>    * struct drm_xe_gem_mmap_offset - Input of &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> + *
> + * The @flags can be:
> + *  - %DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER - For user to query special offset
> + *  for use in mmap ioctl. Writing to the returned mmap address will generate a
> + *  PCI memory barrier with low overhead (avoiding IOCTL call as well as writing
> + *  to VRAM which would also add overhead), acting like an MI_MEM_FENCE
> + *  instruction.
> + *
> + *  Note: The mmap size can be at most 4K, due to HW limitations. As a result
> + *  this interface is only supported on CPU architectures that support 4K page
> + *  size. The mmap_offset ioctl will detect this and gracefully return an
> + *  error, where userspace is expected to have a different fallback method for
> + *  triggering a barrier.
> + *
> + *  Roughly the usage would be as follows:
> + *
> + *  .. code-block:: C
> + *
> + *  struct drm_xe_gem_mmap_offset mmo = {
> + *	.handle = 0, // must be set to 0
> + *	.flags = DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
> + *  };
> + *
> + *  err = ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo);
> + *  map = mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> + *  map[i] = 0xdeadbeaf; // issue barrier
>    */
>   struct drm_xe_gem_mmap_offset {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -819,7 +845,8 @@ struct drm_xe_gem_mmap_offset {
>   	/** @handle: Handle for the object being mapped. */
>   	__u32 handle;
>   
> -	/** @flags: Must be zero */
> +#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER     (1 << 0)
> +	/** @flags: Flags */
>   	__u32 flags;
>   
>   	/** @offset: The fake offset to use for subsequent mmap call */

