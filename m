Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646BADA953
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E274110E27C;
	Mon, 16 Jun 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Eo2uOLLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B554110E031
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 07:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTGS8Vv5Yzq1yPI+AYMogliNfdXW2ldvV9pIJ4bWhjUXgLYxcOJQtqJvA4DUVd4BTm6sEG3ntrV+R+F6rTW2r2GK4O9iYMQrG8m7BpDnh5WtlSJxj2ewrwYbdIh+qT2qa2hwMmEhZ6hfnwu0GzfXVvU+/Wcn1pA6LM7eI5vDfTmniKPSzFWD45ednPGmfmnpiHPn6AR6AbDFYwcf8454YlhQYSkXmHmQBX+I0BthIHe4CLCHxHwclLFFlxB3wk3HFejBCADlluTTIYgJ7WBLmRXXowtclJdLAa+ZlMYNvRsIRIjr0sJ/gpRWz7/XmvlJegD+8pKt9BTDimF8XGpPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdBYGxmoGKpUYwHiS+FQkuM7JzYCWqy3BWmscjFCs9A=;
 b=CpTXXrw6YO3UkilbbDrdb9D2cn/9nGmTfW3bjyiqNvSps1zHLMl4dSF57NsgB+hAzKRDPM+LgwZ5h42NpLHUYczsLhnLPI+zy0DthT24AJm9hNxQ62DOIjQeqgZXEhJZpu9BKgQor1ShI/kCVgWls8eEUSEQr2pM9dEMC/VL5V1wbkwTZ6n4mbtYy8WYHk1lQcIj0E+jSBExYdR6AWQaM/TVtJxjA8AJeunaGjjeDu97k8JGjd8qhsx1nZ1XYFhQvpHNFid4MoT8EQ/6roFzMDz6OJWo688ns6WwfJb4w5eFvGrDhXucJK/ZFL7vzPHgix3PQksvv9jjY3I/eCRRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdBYGxmoGKpUYwHiS+FQkuM7JzYCWqy3BWmscjFCs9A=;
 b=Eo2uOLLhBxZ+hTUZoAijMdqQoF8fM0jraCKSTa6SO7uTyyyBlrp2ZdSMjN6yCyQlYjn1oEaGs4yOhUt/k9uG1/SrTGgKNPNKuG+S50FmMsJAysKgw2WHXvv1YHWt2nAv7p/6nXSCbc9M8geV1c5BICN+s6SLmOUcvZC3SZtt1T8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Mon, 16 Jun
 2025 07:24:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 07:24:42 +0000
Message-ID: <7636678c-d5fe-439f-a86a-4f038e7cf692@amd.com>
Date: Mon, 16 Jun 2025 09:24:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: DRM scheduler issue with spsc_queue
To: Matthew Brost <matthew.brost@intel.com>
Cc: dakr@kernel.org, pstanner@redhat.com, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
 <0b0b8367-abd4-4982-aeec-08f8b95a286a@amd.com>
 <aEx3zmQ4T1n5wdKO@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aEx3zmQ4T1n5wdKO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0304.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a4eb9c-fa6f-4719-ab2d-08ddaca6dc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFJSWEk2cWljcmFZRi9jeHIzTXkxallUVE84ZzVhTWxDTmNHeXFNVTR6d3Nt?=
 =?utf-8?B?R2h6RDR1NTNQRDFOOTU4bVY0ekE1MUxkRmdXUVBQNDArOXRlcS9tR1lqeitq?=
 =?utf-8?B?WXpmOWViMk5Wdit5eWsrSktaUTBpOStEeTBIZGppWXRiMFBQUGFXR0lFOHlI?=
 =?utf-8?B?NWtkbzZ1cmxVWUY5Y25BU1NwdGFWRGlQdzhSME0vOUNZa0dWZGtyenAzQ3ZD?=
 =?utf-8?B?K2x3bWRYZUJmUXJPclcyZDFEUWFNWjBrZVlORFNrTXZJbXphSllkS1Vub2tt?=
 =?utf-8?B?Z08rUmVDTERlMHpxY0VLby8rK1RQaDk5NmRaSEY0dkZLZzNHaUZDdkk0K1M0?=
 =?utf-8?B?emk5V3Rld2g4ZEk4QW1lTTYwaXNnUGZ5S0UzaGlGbmVaYmhoY1RtSWZ2UEJl?=
 =?utf-8?B?U2t0eHdGTGVhYURLYTExWDVVTDdYYWpkenBzQkpQWlQxN2N3d1I1UUtDYXhR?=
 =?utf-8?B?YlNuNGo0dTlxSEt4Z2RqdDg5U1JVTldqUW12N214bC9VdFBoMzR1ZFA4Yk5v?=
 =?utf-8?B?dUVYVG85ckgwUUNSaU5MTzVSWnpZdEYvSHVNQXI3ZU9jQ2QrNDkyRFkvMzZy?=
 =?utf-8?B?bDBUVnM5ZkttK1EwQmVRTUQ0REs0dzhsVmhkRUJuV1lOem1oekVzVE1YRHNP?=
 =?utf-8?B?OXBsZkZMa21LYk1neHZBQTdCaitVeHQ1ZzV6OVBBcEdHRmppNy9OZzJ2Q0dC?=
 =?utf-8?B?dWZ5OEswMDBuaEFhYTVZYzNwN2xTS0VhZFNJRzgyM3dVT24zb2Y4Qk8rSEtl?=
 =?utf-8?B?QTcxNUN6NWFBSDVrb2kva1ZaOXYxbGZMZ1RpQmZCQ2NIam5Tb3kzK0NwdjF1?=
 =?utf-8?B?Sks0VFdMakNybmQ5OXQvRHlmVXE1R0xlSnlQdnFENU4wK1JPdHJnaVBZbVhP?=
 =?utf-8?B?RGtmUWxGMC9xR3pOMHpaaDVhVDRMY1lWWDBFclh6bDVDc1dpcjAybVdZYThu?=
 =?utf-8?B?cFM5N3krbWgwVlRuQk44QmJ2VTlDNU9md0E5bDBOdlQ0K1UvRm8rcWM3YVN1?=
 =?utf-8?B?eHhoUnQ2N0hmUENkNEVaTzFRRHV0bm9TL1hpOG1QakM5bklab2M4aEJwNGpS?=
 =?utf-8?B?bTlhRnc0TWd2bE0rMW44Z2RmVlRUOFdCcnp6L1ZCRG9BSXZ3RWcraUhjakNs?=
 =?utf-8?B?d2QvNVVJR09IaWVYNU9zbmRTa2EwUzlzOHMvU0VqTjJOdytORHVsQ0VBclVR?=
 =?utf-8?B?c3BjSXRadmdTM2hQODB6c0E4VnAxbGFKckQ5Yk5iQVg5WC80NHhzN0dYcGs3?=
 =?utf-8?B?US9DSHJrdWN5UTNyYzEvQkpITUpkbGtzc1BjakRmRlZZM1V1TzlDVloyZ2xv?=
 =?utf-8?B?NnB2NXVKOHpGVjRBMEdZeld0Nnp2dWFmS3VDSnkrWTBrMithR0ZjeEdILzNC?=
 =?utf-8?B?ZjByOTNLVG1ialZYQzd1RjhXRThOcXJieVBkTWY3RndyZHUyRDBucjdKeHBX?=
 =?utf-8?B?T1JPeTR5Mm0wbWZXRXRvQ0Ftdi9xbmx2VlJUR1Fic2paS1QvU2lGVDdYZzZt?=
 =?utf-8?B?bkthYzR4TnNoVFdVMmE2c2lab0QyaVhuVktyczFqSk0yOUpsb2FudlhlM1JY?=
 =?utf-8?B?YTZ1b1h1NG82enVtSWp5eFhjUFFjeGFuQlFObTBIM0MzV3RvM3o4SklxWm1a?=
 =?utf-8?B?cU1zOXFNM09pL0ZHbnh5UTF6Vi93SFVnRGFxRFpnSnJraGJLS0tIV0VkSmpw?=
 =?utf-8?B?dzVDU01tbk11VHkzQWhXMUJub09QWG1PZTNzSCtqd2JpcUNuYWdkdDVoSUVr?=
 =?utf-8?B?aVFVNmw4NnZzeWRIWnZiOTNmR3AwaTJKVU5Bd3d6TGppaklFZFNVS1BJUDc5?=
 =?utf-8?B?V0xhbHdsUnpnNzE2UmEyczZEcWE3TDFQei9vZDZuY1RSaW40dFkzZmRFbHZS?=
 =?utf-8?B?U1RrR3d4alFzZ3V6dmxzaWRWcnltc1FnZnB0VFZiSUdZdXpDaHFIZTlzS00z?=
 =?utf-8?Q?60o+yKJjwK0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enpHdGgwSWlZbzR3Qys0VHFNNDFpSlpmd2w1VW10RDYvT0hxZFZqM0lycmZl?=
 =?utf-8?B?Z1I3WHdzMUNzck1pbnI3RDlvb2pzYnhGSDJpZEdYcWVvQ01EeFduZklvUXB1?=
 =?utf-8?B?bUpZZHpSbkRKL0dwZWI3b21xWkNVL3UxZTBTN1AxSXdTSXZuTUg4dGozdWVH?=
 =?utf-8?B?N0lKYnZOZFZIcDVHdmFTQlNYVGE0Skl0dlRsbklSNFBEaGhMMkpweWJNYmx3?=
 =?utf-8?B?Q0d5cE1TaGtOQUY0WHJrSjU2dm9kN25CQjBqTHd1L0J2aXpnNzZRWmJ0MUcz?=
 =?utf-8?B?NjRGMXZoTnN3U2tKRWtvQ2lWeFRITGVZa09IS25qaHhQK2YrK0gxYmx3YjNV?=
 =?utf-8?B?TkQ2L0Y3cEZzTXVKV2JpUEU3c2crNFhHVnREZ1ZqcDJ0dGhDZEZRYitvZ25n?=
 =?utf-8?B?eXdTcVdsamRNTVgyL0Y3aHBNSy81OVFPRlJVbEZtOE1nSUVmSDVrQThzUmNO?=
 =?utf-8?B?SDQyWm80cDQ1TlVZMkg1Vmx5aG9DZjJIWVBjTGlVSEI2VlJRNXc4TkhZYS9N?=
 =?utf-8?B?dk5xdEJHWkVaYzJRSmIwckpjZlZIbHYvMnM5RXE5WWxVT0VUbHUvUTR4R3B4?=
 =?utf-8?B?bFFKS2ZzblpuQ1U4VncvT1F1SDNmTkdONTBzVjMyd1d4YlRLa0E0dDBTK0oy?=
 =?utf-8?B?RDJFaXRON1h5UzFDeWRPMXFwb3FUU3FnK292VW9wYzdXZmFhZDR6UVhiU0x4?=
 =?utf-8?B?L2lqZldjTkJwRW1GUzl1cXdXNmtLVmNzWmJpZ3N3OTU0bExFT09IU0V1NFpT?=
 =?utf-8?B?NGN4RjNZM2VSZXh5Z0hTQTRKaDk0WGV4Q2J2Y0o2NHlTUTdpUVZ4ck9HUUlv?=
 =?utf-8?B?am4wZ0prMUJscnF1eU9CZ2U2eER5TDNkRmE0eEdIVUJ1Y0pHb0UxVHdDL0R2?=
 =?utf-8?B?R1djbUtvUUFrVDhYMXNZS0hqVlFyMUV0c2RWSEpvM3NyRHpYLzg0SXRtOXEy?=
 =?utf-8?B?akU5Y2JIeTE5WW1NenE0WEVON3JFT1pFOTBFanU4MmVWYy9XYUIrYXZ0TXJa?=
 =?utf-8?B?WGhDRnNOSDZMenhBSStjdkZTL3BDTmhtMy9acTZFNVh5M0swZ0tiaGUvanhk?=
 =?utf-8?B?SjZRNlA5RXB6NlFtVVpGNWlmcE9TVW5YWWNDOE9XYURJSC9VNERCZHNXMDBT?=
 =?utf-8?B?S3h1Njl3dVArb0VwenRaS285d0JYSXJOL1RsN3pZVlIrK0RZbTgrTlM4NUJo?=
 =?utf-8?B?WkNkbEpOMHJtSzN5b0lZWUs2S3B1aEgrK1FNYS9VWnhGbzMyQTFkRFZPMGxz?=
 =?utf-8?B?eUdJN1MyVCtaK1B5ZElQMkFDYjN0bXJYMEExNklrTXYzUGhIdDNPdlpKQmhn?=
 =?utf-8?B?cHQ5R0s5RmIvc2V0bS9mYlQ3RHVwR2JBUmhBcHBwN1BEYUtBN1k0NFl6MTBh?=
 =?utf-8?B?YkE0cFZDK0NlWDVhNWdTTEQ0UjlCTzRNOXplVzkxRURhRmIxQURqc2ZxVk9O?=
 =?utf-8?B?TEtkNVZ4REV0V2MyN0dJQ3JKMEI5QmZ3TFhNSDFjMG4wZVRBT0ZtNlN3aGIy?=
 =?utf-8?B?TE82RnlDRk9JWmVKUW9uTVZ3WC9VYTRIazR5K2cwM20zWHBiYzVqZGQyMW9R?=
 =?utf-8?B?L1NBbVZiNFlRMWZGdW1rVWRIUlJlc0lJZFdzcllucnBaK3JnaFljOGhqSEQv?=
 =?utf-8?B?N2ZFSEVHZEFSS1dYNFJtQkZDdFdPcVRUWTRyenVRNFQrck1kMWVBTURNQ082?=
 =?utf-8?B?c0tXL0RJV2FaNzlDamZYNEZ5QWtrekhSSHk3cE5lbnBnWlA3bGRiRXhsdUpN?=
 =?utf-8?B?ZDBld3Brbmx3UjI0QTR1MUgrOXBNUjZBTDBhMklsQ3ZSakMrNFgrMGRvY1R0?=
 =?utf-8?B?bFhxWVJZcmZNTEpHTjYzRXo5eGdxV1JtVFhTeXdUM0JZdkQzYmhkRWU5dmlL?=
 =?utf-8?B?VTN0Yk90VFFQcExHU1cxOGFZeG5BK290VDU3Y0JhSGhVRmE5RVY0bzhmQ0Jv?=
 =?utf-8?B?U2JKMFF3ZUhZTGI1TWVHVjlQN2xzME5qOG1iUWwxWURRUDNpUUh2V0ZXelo0?=
 =?utf-8?B?dURFK0YybnFqYXY0RVlIUE1uOFduMGJNRGdaY3lkbmo1Mm85dmNlb3ZRdTdy?=
 =?utf-8?B?ZGdhczc1eVE4bXFXNk8wenNxbFJEQUxrNGM3UzZheS9ZcHB0U1ErSU56T2d3?=
 =?utf-8?Q?+oI8yawZC9DnFaaRQ25TjoKFN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a4eb9c-fa6f-4719-ab2d-08ddaca6dc64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:24:42.1855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ua/B8SxksQfNEldg80WT2z9atV5ZWDZ871BR350USrhWzA24sKSuNBa8IW+Y0z/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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

On 6/13/25 21:11, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 07:26:22PM +0200, Christian König wrote:
>> On 6/13/25 19:01, Matthew Brost wrote:
>>> All,
>>>
>>> After about six hours of debugging, I found an issue in a fairly
>>> aggressive test case involving the DRM scheduler function
>>> drm_sched_entity_push_job. The problem is that spsc_queue_push does not
>>> correctly return first on a job push, causing the queue to fail to run
>>> even though it is ready.
>>>
>>> I know this sounds a bit insane, but I assure you it’s happening and is
>>> quite reproducible. I'm working off a pull of drm-tip from a few days
>>> ago + some local change to Xe's memory management, with a Kconfig that
>>> has no debug options enabled. I’m not sure if there’s a bug somewhere in
>>> the kernel related to barriers or atomics in the recent drm-tip. That
>>> seems unlikely—but just as unlikely is that this bug has existed for a
>>> while without being triggered until now.
>>>
>>> I've verified the hang in several ways: using printks, adding a debugfs
>>> entry to manually kick the DRM scheduler queue when it's stuck (which
>>> gets it unstuck), and replacing the SPSC queue with one guarded by a
>>> spinlock (which completely fixes the issue).
>>>
>>> That last point raises a big question: why are we using a convoluted
>>> lockless algorithm here instead of a simple spinlock? This isn't a
>>> critical path—and even if it were, how much performance benefit are we
>>> actually getting from the lockless design? Probably very little.
>>>
>>> Any objections to me rewriting this around a spinlock-based design? My
>>> head hurts from chasing this bug, and I feel like this is the best way
>>> forward rather than wasting more time here.
>>
>> Well the spsc queue is some standard code I used in previous projects and we have never experienced any issue with that.
>>
> 
> I can quite clearly see this not working on my test setup. I can (kinda)
> explain it a bit more.
> 
> Look at this code:
> 
>  65 static inline bool spsc_queue_push(struct spsc_queue *queue, struct spsc_node *node)
>  66 {
>  67         struct spsc_node **tail;
>  68
>  69         node->next = NULL;
>  70
>  71         preempt_disable();
>  72
>  73         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail, (long)&node->next);
>  74         WRITE_ONCE(*tail, node);
>  75         atomic_inc(&queue->job_count);
>  76
>  77         /*
>  78          * In case of first element verify new node will be visible to the consumer
>  79          * thread when we ping the kernel thread that there is new work to do.
>  80          */
>  81         smp_wmb();
>  82
>  83         preempt_enable();
>  84
>  85         return tail == &queue->head;
>  86 }
> 
> Between the execution of atomic_long_xchg and atomic_inc, the submission
> worker could dequeue the previous last job, reducing job_count to zero,
> run the job, observe that job_count == 0 (drm_sched_entity_is_ready),
> and then go to sleep. This function has swapped for the previous tail,
> so it returns false (i.e., not the first, and does not requeue the
> submit worker at caller).
> 
> The race window here is tiny, and I would think preempt_disable would
> make it impossible (or preempt_disable is broken drm-tip a few days
> ago), so I’m still a bit perplexed by it. But again, I assure you this
> is, in fact, happening on my test setup. My test case is an SVM one,
> which involves all sorts of CPU/GPU faults, migrations, etc. Not sure if
> that contributes. I can show this race occurring in dmesg if you need
> proof.
> 
> The change below fixes the problem. I'm going to post it to unblock
> myself.
> 
> diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
> index 125f096c88cb..ee9df8cc67b7 100644
> --- a/include/drm/spsc_queue.h
> +++ b/include/drm/spsc_queue.h
> @@ -70,9 +70,11 @@ static inline bool spsc_queue_push(struct spsc_queue
> *queue, struct spsc_node *n
> 
>         preempt_disable();
> 
> +       atomic_inc(&queue->job_count);
> +       smp_mb__after_atomic();
> +
>         tail = (struct spsc_node **)atomic_long_xchg(&queue->tail,
> (long)&node->next);
>         WRITE_ONCE(*tail, node);
> -       atomic_inc(&queue->job_count);
> 
>         /*
>          * In case of first element verify new node will be visible to
>          * the consumer

I need to double check the code path once more, but that we got this wrong while could certainly be.

The code originated in userspace and atomics are also memory barriers there. Sima had to point out that we have to manually add smp_mb()s here to make it work. 

>> This is a massively performance critical code path and we need to make sure that we move as few cache lines as possible between the producer and consumer side.
>>
> 
> Well, I can't say I buy this argument. If you can show me any real
> workload where using a spinlock here vs. going lockless makes a
> measurable impact, I'd eat my hat. Also, FWIW, this code seemingly
> violates the DRM locking guidelines we're all supposed to follow… But
> anyway, I'll go ahead with the fix above.

I probably have to take that back, see another comment below.

> 
> Matt
> 
>> That was the reason why we replaced the spinlock with the spsc queue before.

Well we replaced spinlock+kfifo with spsc the for round robing peeking implementation.

Background is that because of the spinlock even a "peek" transfers the cache line as write to the sheduler thread, and when you do the "peek" even on the idle entities then that starts to not scale at all.

Since we now have the FIFO implementation and avoiding peeking all the time into the job queue of idle entities that might as well not suck that badly any more.

Regards,
Christian. 

>>
>> Regards,
>> Christian.
>>
>>>
>>> Matt
>>

