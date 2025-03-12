Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE6A5DDDC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 14:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836A610E184;
	Wed, 12 Mar 2025 13:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UKDJUCbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8B110E182;
 Wed, 12 Mar 2025 13:24:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVl/BFWQ5FJg/J+RzNagY0AXxy8K9e7PXsO36dSOrG78biEB8Qp5l8wbPyXEwG3IQLsQqxYYw8VBXJ3DoZXueDb48eILVxROZWCB3Y3tWZm1J4F5T9mbSK+lI+w4H2l08ypkJ19kenIfi+nmmt7Ko6WpdlEv5jyBsOWE+nPbedKB9OdZ8BEr0de4Aj7FRV6ctL74Jr5ZnWJqJ1KozFnOwacJQ/6rWN5gcMJ/zNHjEBPgzXfC8nnAgz/x8Ophv7yd8DAnlzjMsB+bm6hjzjZSQzdhZAACjjwHa9LKmHrnKWtZqgTNDhEmN+WpT4hxlWnxLOeJjJdkRUDHz79KVWRriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjOZtu3HwXt8R6E4ctOjTz4oPDRscpM8jEFGBd1Blr4=;
 b=mPs8m4QXA/BZjS40rL+Trm2YhY0m9h3JLp96BDBeDxZLJ5uk85q3cgcENFwADuqyv8vu8EKZ8597c9YY8PmFPVuffW6lExKTZrUEZ7jXf8tL8kuB7UzICus2j8cLUVVPZxkRnAAdqNzzRLxIDetI3CeZRZhDgdDIy6+9j+q4c2t/V2GQlyEYjxtcMhPNz1tk5KRGlIvteH8UzN1ea3d4Ol8JzFPkKeEZtWwX96f1blpv0RxtPO7ysrCmSR1ec1ou65irLjX+m4vFDZVAqAi6wN2xLa119cw9kZDjy4C30yPpnX7OkiCiL7vsFMB/A3ZtHrbcMJ1hoQKr33nzJHAtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjOZtu3HwXt8R6E4ctOjTz4oPDRscpM8jEFGBd1Blr4=;
 b=UKDJUCbh2Pv43iLneYNR50wEk8rOA+mbZ/TqFpzbJLsHkc/ZwKcFeuiCLfZhzQTA8GxEs825Gk4RZGiQ0j4UFMBL5NOJd6OUir4BgNuyFSex7yXjuZMXImCDmrw+9aGu21FcedKiIvOvIAmFLKUUc1OwRTHgLoa0j0X47FB1wXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 13:24:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 13:24:05 +0000
Message-ID: <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
Date: Wed, 12 Mar 2025 14:23:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: prime: fix ttm_bo_delayed_delete oops
To: Chris Bainbridge <chris.bainbridge@gmail.com>,
 nouveau@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, lyude@redhat.com,
 dakr@kernel.org, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <Z9GHj-edWJmyzpdY@debian.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z9GHj-edWJmyzpdY@debian.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed5e5a9-d3f2-47bf-9482-08dd616929a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHBWeGFKMndsUUtHUnNjSS9DTmQ3aGlFYmd3cm9VRUtOb0dHeW9VVUc2RERh?=
 =?utf-8?B?MjFoR3cvZVJNRzdUdzE4SjhreDdsNWJKVUxVeElnR0pQMUJYZnI0NW4wR3ov?=
 =?utf-8?B?LzEzNVBWL2VYUThSQTZMUTR5ZVR2bmN1aTBsYS8wUkx5aEFjRW5pYndLOUpP?=
 =?utf-8?B?cDlNSTNFYzc3TkMvUjNib21SYU03SEZDSDdlQTNKUW9mWnF2UzVIWWlaOUhw?=
 =?utf-8?B?L1lRN1lLclc3UGN6R3c3LzduTWdLVjRHSXFqZUo5NkZ0aVlNUXdJN1g1bUpL?=
 =?utf-8?B?M1NUQlhVZlQ4QnQzdGdTYnE5bWNSRjg3VVJ0eDhaQnFVdHNyR1ZORFRndkNJ?=
 =?utf-8?B?Z0hWOTJicjZlRkpjUUtVRGFySm9LckVjZFZLZlVGb0x0NVIvdVlORWxVaEpn?=
 =?utf-8?B?OHJ6NWdCdk85RXJpME5TTWpPOGl3dzMxUVlWeG45blFqL0JLbG8wUHloMG9n?=
 =?utf-8?B?YXhxd0ZXcndsS1BwakdQUDR1emZseFBBeGVGRVNUWk8vVE5sc1Y5L01ya21I?=
 =?utf-8?B?eURaU0c4YTI3RHNRTXVqdE1SN3A2Y3YvcmtsVFR1ZnlJaDlGYXJsd3JFcDk4?=
 =?utf-8?B?dWtUZTFkZURGMEM5d1c1eVUzN0ZPVHJXZU41NHU3V3Y4SXhQYi9HaTZPVzkv?=
 =?utf-8?B?eG50Y2h3cjUxY0paaE5mdy9PcXQ5ZlRuZlRWcHo4M3hMMFh2dDZHc2RDaFFU?=
 =?utf-8?B?eHZzTkk5N2MraXlkQm13bHZKdzVORlo1ZnNGbGJVMFA2RWFHWnVBWGVyQ2Yx?=
 =?utf-8?B?ekpxMlp1TzllZnBxSHdwZ2xDN0hXVnplSjU0ZWtMaExzYlBVdEorU3NHZ0dx?=
 =?utf-8?B?SVBSTVpjcURjUXpVcEpxVGRLbXpOT2NlYmhqMGQ5QVNoR0I1K0NkWXczRExT?=
 =?utf-8?B?WGg1eFRiZkhLd0RxYzFmbmorQzdJaS95TnZVRVVqR1dKMXZoK2R4Y1R6eU9G?=
 =?utf-8?B?NDROdDk3bWkyKzFuT2s2Y3htK3ZhcGpqUFpNTCtpeHpaQVFmSkdTQlNmZlYw?=
 =?utf-8?B?bDRQVGEvNWpxcFI1SEsyOEZ1UnBZYVUvcEZrSDN1aWhSaVh2ZlRGdklKRmRo?=
 =?utf-8?B?dTlaTDhESHRlVlUxdXFUSXpHM2xUVG5DcXRjVmdpeEJqWFBZUDIwdktNb0Vz?=
 =?utf-8?B?MU1QMjRzREc1S1Rua2lRQmx6MS9BR0NtazZoSVR1QTdtZ2tZWlRtem1GYlIy?=
 =?utf-8?B?SWxKK0NwaExJSitvYnlyL3RHb21iWDdvdmoxMHFKWERBVngwRk9qWGhtYW8x?=
 =?utf-8?B?UXdMbStyeVJvd0N6YlUrdjhtMlQ1T3cyV1VhV2VRRzluOUw3MWdJeE9TNVhB?=
 =?utf-8?B?T3RsWU9xSEZQak9VQ0pHS2tvVDBESm1XMVJlRnhZVFR4a2dJVEpZVEdKeU1w?=
 =?utf-8?B?dW9uNG80ZVVCcHl3aFpqb3hud3Q0cFAxK2V1blUreEZIR2lBSkFEeUFxQ2tU?=
 =?utf-8?B?Tm91TzRqOC9BWloybGMwZlJUZldsYyszV3NhTk44U09LZGs3eThDUWZGYVgy?=
 =?utf-8?B?QVRSdEFxNkNSQkczMFhFckg5UStRTitZRUliRG9pSkVEanY0bG5CSDlqOG1K?=
 =?utf-8?B?dFdCUlk2QzZXUW82OUZRZHB3Rkhhc1N6aFYzVnpRNnh3VTQ5TUIrSlJtb3NP?=
 =?utf-8?B?Q01HYzMzN1JEcW5CWmxEaVhmRHJFTlg0MGhsZkVDa05vZ01nNSt1T25JQUh2?=
 =?utf-8?B?S2c5U0JUYkpMTnA3UnpLMmZpVDlKMWlrVjZIWjJwOU5uZ2VxbVh5OUhPdjVk?=
 =?utf-8?B?ME5KR0FaNVZsRjZ2UlRnM1JQUHpWNUtqbFdqR3E2NmxydkQwSlJHbitVWHNy?=
 =?utf-8?B?Y2J1WnVhbk4wazYvdnZ5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBIWnAvU2xFU0VkUmMwUGN3MUFMVDRJN29WVTV1UFBNSFU5L2FGbGxXK0hs?=
 =?utf-8?B?Uy9PRFJtZVg2aStEU0xuRGwwU0E2bTFuRWsvbmtXWXozWFpRS3pZSnhvZzM4?=
 =?utf-8?B?L1JYNGVLWnhEUHJrUjVVYnlwaTVFSXJwQjI5Nk9wR1NrWUxMTlU0UWgzZkhG?=
 =?utf-8?B?K0NSNjE4NmJqR3VXT0MzWCs5eExPRmxMckMvRjlrb0d3TnZuZlNmUjNmbVFN?=
 =?utf-8?B?WmM5c3dHNUdRTG9oZE96bTFZV1Fza1pBampVd0VQY2I5Uk1Nb29QbFVzcHlK?=
 =?utf-8?B?ZWtxNXZ1dE0xTVF4SU5BTkhXb0JRU2tFU2dnUzl6SERqdWhwU1dVQmxsSW4z?=
 =?utf-8?B?R01UNGNLM3gwQ0tFZUZrVWVVZnJNUWc2STlMRm1TU0NpdE5EZ0U5UVVFK2RY?=
 =?utf-8?B?Z2lsQ0JrK2grVU56ZG1yYXhTTU4rZ0w4S3JXMDNBb09TNjZodFJFMG1qcU8r?=
 =?utf-8?B?cjNUaExmd0lHWk5oT1ZCbXhXWWYvc2dYYzdpNXhSM2IrS0Q2SzZTUlViT2ly?=
 =?utf-8?B?V0VMWmRZVFBXREE5NWh6UXRJMDJ1eFY5Wk1KemRXQngzOE1GdEl3aGM2d0xE?=
 =?utf-8?B?UHF3OWhoQXBCM3g5Z0NYZHFSeWcwbUlveERhVmZUN3dyVXZhemx5TUZPVlJI?=
 =?utf-8?B?MFFKRnpJekpTSm1IMTJJWGVZQXpFUENyMUtEWkt5VWlEZ2JDTDZJbDQ5MFNQ?=
 =?utf-8?B?R2IxRERMY3dybzduSjZxVVdWYVQ2NGFpWHZ5RDlKbFdiSXZmVkNWK0lMWEM0?=
 =?utf-8?B?bmFvQjJaMkNITEJSWlNYZjl2VXVpbHlENjVZeHZXcGxYdFZPS2U0bmlESXRk?=
 =?utf-8?B?cW9NZlNGNUUvSlVXN3R4S2F6TzdNSXdKTHQ4OEs1VjNtRWtnVzJSZ3JiR0Ra?=
 =?utf-8?B?MFlldElvN3RVVW5Eb0lwd0NIeFpYWjVQNU1pUGtLN0lPaFhKWEh3YWJsNktR?=
 =?utf-8?B?OXhhNDAzUzJHaGUzZ2poSTNRTTc4Uyt6OTdZdXg5TDZvRXBXOXhuc1JUSFVj?=
 =?utf-8?B?dmFSQVdxOGp0eEdBcWswOC95V0tkV1VHRmpObUh0Wk1LMFVJUDA3YjY2dis3?=
 =?utf-8?B?dWMxM1dYL0IzQVdIT3U5N3JNWE1zcWpCVDc3WkZETk5kMW9NaW5Cdm1qdW9N?=
 =?utf-8?B?YXdqR1BZckxZYmxndUhkYm1iYVNiN1dQcEZyaTBlRXdUOXIxT1dnMmJuZ1Uz?=
 =?utf-8?B?QmxmbEt2T3dlMTlvY3NuOWpFblFLdXBhRDJ4T2hxQVNzRnR2K0tsUlVDRHZy?=
 =?utf-8?B?dVdCSHpxcW1jMUhpR3Q0MVhUNFhUZE9WMFl2am51Y1UvNDI3Q3RwcytuVGJE?=
 =?utf-8?B?K0UwSzlXMnl0bVNsVThKMzI5K2JzS3RQVjN5R3dtc2FCQmlwVDVmMDY1ajND?=
 =?utf-8?B?OGxJUEpVUy9kRjB3cU9sbFNtQmlLR3h1QWtISExyWGtuNEQybFY5ZUt6RHBu?=
 =?utf-8?B?S3NobjNId2xWTitZUWkxS1ZlZEU2S2xNdXR2ck50TXo2d2VtclFEM0taRERT?=
 =?utf-8?B?TVF1ZGNFbUVxc0dlaHFzZVIvd3pFK2YzWUw4VUlvZ0xuMDc5ZVExMU5NVWJz?=
 =?utf-8?B?WXlTNHJmc3JsYml2Q0x3cmtsdXRSUXc2WjlraEFjWUI2aWV3S1hmWVhWNzl3?=
 =?utf-8?B?bVhmTTJGZUM4RHhJSlVHRVg4Z2tpaVBta1ErTVIxbTBmSGtwSWE5eFdWWEJW?=
 =?utf-8?B?b3YrK3ZvZkJpdE1mMlpDSGNRT2JGMHFPY0lLOXFBOU90QVI1RXNLUitzQ255?=
 =?utf-8?B?eERSR1NBbllqQ0JVbXFyaUgwNVg1SFVxMXBCekl2cm1NN3NWYll6SWpMemFa?=
 =?utf-8?B?Qnk3eFY5a3FpTkJZY1EzOXJXbUxhcGpmdFBYMFFOZHRJbzdRVk5oOTlrUy82?=
 =?utf-8?B?dy80dmtoV3l1QnRlbktBWnI1QTh2NVJvY3A5TU4wMkRXeVhIUklvUW1FUDBq?=
 =?utf-8?B?NC9RYm5kM09Uc0g5ODdmSkd1eXE0ZWF2TTQraUZGeVhqNXJjaTJxV2R3WDJY?=
 =?utf-8?B?S3U3cGJ5emt4NDNoUDZLVGlhVDRMR0g4WXprM0U4Y2xidFljZlM5Y3NvMWND?=
 =?utf-8?B?Y3Uzb2V0RWtPUWZTWFZWK3Bzc1d1bFhycnJpbUlyRmhCdVRUNkZJc3R2bith?=
 =?utf-8?Q?8Jxd8oNM4AN4V7PmikiSKVEUS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed5e5a9-d3f2-47bf-9482-08dd616929a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 13:24:05.7249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdQZ9IRO6Kc6pMVQanKACbpFgaEREVhDUDr0JCyU4O8+zeLuZgoJtauimgWTOQiC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940
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

Am 12.03.25 um 14:09 schrieb Chris Bainbridge:
> Fix an oops in ttm_bo_delayed_delete which results from dererencing a
> dangling pointer:
>
> Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP
> CPU: 4 UID: 0 PID: 1082 Comm: kworker/u65:2 Not tainted 6.14.0-rc4-00267-g505460b44513-dirty #216
> Hardware name: LENOVO 82N6/LNVNB161216, BIOS GKCN65WW 01/16/2024
> Workqueue: ttm ttm_bo_delayed_delete [ttm]
> RIP: 0010:dma_resv_iter_first_unlocked+0x55/0x290
> Code: 31 f6 48 c7 c7 00 2b fa aa e8 97 bd 52 ff e8 a2 c1 53 00 5a 85 c0 74 48 e9 88 01 00 00 4c 89 63 20 4d 85 e4 0f 84 30 01 00 00 <41> 8b 44 24 10 c6 43 2c 01 48 89 df 89 43 28 e8 97 fd ff ff 4c 8b
> RSP: 0018:ffffbf9383473d60 EFLAGS: 00010202
> RAX: 0000000000000001 RBX: ffffbf9383473d88 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffbf9383473d78 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 6b6b6b6b6b6b6b6b
> R13: ffffa003bbf78580 R14: ffffa003a6728040 R15: 00000000000383cc
> FS:  0000000000000000(0000) GS:ffffa00991c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000758348024dd0 CR3: 000000012c259000 CR4: 0000000000f50ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? __die_body.cold+0x19/0x26
>  ? die_addr+0x3d/0x70
>  ? exc_general_protection+0x159/0x460
>  ? asm_exc_general_protection+0x27/0x30
>  ? dma_resv_iter_first_unlocked+0x55/0x290
>  dma_resv_wait_timeout+0x56/0x100
>  ttm_bo_delayed_delete+0x69/0xb0 [ttm]
>  process_one_work+0x217/0x5c0
>  worker_thread+0x1c8/0x3d0
>  ? apply_wqattrs_cleanup.part.0+0xc0/0xc0
>  kthread+0x10b/0x240
>  ? kthreads_online_cpu+0x140/0x140
>  ret_from_fork+0x40/0x70
>  ? kthreads_online_cpu+0x140/0x140
>  ret_from_fork_asm+0x11/0x20
>  </TASK>
>
> The cause of this is:
>
> - drm_prime_gem_destroy calls dma_buf_put(dma_buf) which releases the
>   reference to the shared dma_buf. The reference count is 0, so the
>   dma_buf is destroyed, which in turn decrements the corresponding
>   amdgpu_bo reference count to 0, and the amdgpu_bo is destroyed -
>   calling drm_gem_object_release then dma_resv_fini (which destroys the
>   reservation object), then finally freeing the amdgpu_bo.
>
> - nouveau_bo obj->bo.base.resv is now a dangling pointer to the memory
>   formerly allocated to the amdgpu_bo.
>
> - nouveau_gem_object_del calls ttm_bo_put(&nvbo->bo) which calls
>   ttm_bo_release, which schedules ttm_bo_delayed_delete.
>
> - ttm_bo_delayed_delete runs and dereferences the dangling resv pointer,
>   resulting in a general protection fault.
>
> Fix this by moving the drm_prime_gem_destroy call from
> nouveau_gem_object_del to nouveau_bo_del_ttm. This ensures that it will
> be run after ttm_bo_delayed_delete.
>
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Co-Developed-by: Christian König <christian.koenig@amd.com>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3937

That should probably be Fixes instead of Link, Link is to reference discussions and not bug reports.

> ---
>  drivers/gpu/drm/drm_prime.c           | 8 ++++++--
>  drivers/gpu/drm/nouveau/nouveau_bo.c  | 3 +++
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ---
>  3 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67..4b90fa8954d7 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -929,7 +929,9 @@ EXPORT_SYMBOL(drm_gem_prime_export);
>   * &drm_driver.gem_prime_import_sg_table internally.
>   *
>   * Drivers must arrange to call drm_prime_gem_destroy() from their
> - * &drm_gem_object_funcs.free hook when using this function.
> + * &ttm_buffer_object.destroy hook when using this function,
> + * to avoid the dma_buf being freed while the ttm_buffer_object can still
> + * dereference it.

Looks mostly good to me, but I would write here:

Drivers must arrange to call drm_prime_gem_destroy() from their
&drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
hook when using this function,

Since it is perfectly possible that drivers don't use TTM.

I also skimmed over all usages of drm_prime_gem_destroy() and except for i915 all other drivers seem to do the right thing and call the function directly before drm_gem_object_release().

For i915 the code is not straight forward to follow, but since it isn't using TTM I'm pretty sure it should work there as well.

I'm really wondering if we couldn't add the call to drm_prime_gem_destroy() into drm_gem_object_release() and call it a day. It's just one thing less that drivers could get wrong.

Regards,
Christian.

>   */
>  struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>  					    struct dma_buf *dma_buf,
> @@ -999,7 +1001,9 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>   * implementation in drm_gem_prime_fd_to_handle().
>   *
>   * Drivers must arrange to call drm_prime_gem_destroy() from their
> - * &drm_gem_object_funcs.free hook when using this function.
> + * &ttm_buffer_object.destroy hook when using this function,
> + * to avoid the dma_buf being freed while the ttm_buffer_object can still
> + * dereference it.
>   */
>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index db961eade225..2016c1e7242f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -144,6 +144,9 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
>  	nouveau_bo_del_io_reserve_lru(bo);
>  	nv10_bo_put_tile_region(dev, nvbo->tile, NULL);
>  
> +	if (bo->base.import_attach)
> +		drm_prime_gem_destroy(&bo->base, bo->sg);
> +
>  	/*
>  	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
>  	 * initialized, so don't attempt to release it.
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 9ae2cee1c7c5..67e3c99de73a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -87,9 +87,6 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
>  		return;
>  	}
>  
> -	if (gem->import_attach)
> -		drm_prime_gem_destroy(gem, nvbo->bo.sg);
> -
>  	ttm_bo_put(&nvbo->bo);
>  
>  	pm_runtime_mark_last_busy(dev);

