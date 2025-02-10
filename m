Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F142CA2FCE2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 23:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108DE10E3ED;
	Mon, 10 Feb 2025 22:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1dawfjcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D0E10E3E8;
 Mon, 10 Feb 2025 22:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiUz9L8PE3F6lmoDP8VVCSXcx9HXi5hw2h4Bnw8Ry4aZL+chk+DL/x4pCGroJaK9AIBMdZrmWGi3Ek8PymSj4JALVyIpqCLjUgpIhRR6OEZOLmOIL03A23a2V7zAYFIIK18s7RwYHr7Uw5wwrhI7jRJ65deo/zWZlogvIwkmztx45KHPBzCtokcebs8PF/yM8AEIdMDqF9sjHtv1frcStdn+EY/L/AkEYZsamwJseLgMiFiBSUbQ8Bf+rmOwU4zpk5k0bmGcTCLyNFCOMFilnoMeaNAZc5XB1gngCEmtVT+YO9TaUX+MR3kaXxyOpIxyN0w5l1AmRmD8Av42Pd/qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuXHx/3pmwDDQ+U2wGdj88wbUDmpJ1PkJHcfWl+XvVs=;
 b=Am7gOXgR1TXWlAQVe5wQuvkIbatWxp29qvWO06IEZCAXGiQTn16b3pknLoPmwJet5jP+wk4Zz7OuWOkuEya2+PpebvNBS6+bBX/BBpfE2EBIDuh2U8/1HNQNgmcSnSZQTAwM6KGhAllWwKSqJB8qmsykDMQXKmAGAr5bTbZSSBBNYRvH7W+lp+3imp3pffsYqAayFjSyIRY4LrBe+FTqJ970V3R7YTM8YdxUC1Tuoj73hZwHRbu9KHhRqtX/wm1L7Wj7moJo+oTsUMs5JMQ2sQ0zscZoeILHz36TqtbugBhqYfIkY7akJFkWCRK4TOB4lPlLoha/u1OjnaOnfe3QeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuXHx/3pmwDDQ+U2wGdj88wbUDmpJ1PkJHcfWl+XvVs=;
 b=1dawfjcrVUfWOKdcVm/YSF6NZRW/doeLzwTK2JMJI/GZhQAyYR0tRLfRrgT9jaRZz60kOVa2Rp8dR5Ur4lCDiDU1GdUMQqvIRzLNDkAkIm/2fzkdAehY5Ova/jWoVnI79geJ+hvmawC+BTG1oRCvdvGW3LVEl3wCX7pYRdfcY8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 22:18:26 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 22:18:26 +0000
Message-ID: <e5dcbd91-bf16-4227-be85-6668d08120f9@amd.com>
Date: Mon, 10 Feb 2025 16:18:24 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: restore edid reading from a given i2c
 adapter
To: "Wang, Yu (Charlie)" <Yu.Wang4@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, alex.hung@amd.com
References: <20250209225843.7412-1-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250209225843.7412-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0081.namprd12.prod.outlook.com
 (2603:10b6:802:21::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: a9cc340a-786f-416d-a594-08dd4a20d6ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2N1R2ZZS01icE9DRCtKWGFoc1Q1UEZtNXdSZW9VSWNiOVpRUlhkNlI2anRJ?=
 =?utf-8?B?alZUSVZ4bCtJazgxRitWQUVhRjI2ZlZabkVHRTNPZkJxOU14b0xPZlAxQlZi?=
 =?utf-8?B?akFkbHZGNWRHNUpTbjB1OXRXSFpRZzhqWEZwK2J4Zy92Z2thV2ZtY2IwcEo5?=
 =?utf-8?B?WVlick1TYVBBaTdYb3hEbEFBL1pZck9uWVhFa1haTFRYaG5BNDF1MlFlRXJZ?=
 =?utf-8?B?RHNhYURmUDdZRFdSekJvZDZ1VHQ0RjBiM3hUTFZDWkRsK2RqSFlwdFBGS2lO?=
 =?utf-8?B?a3JLY05XUVBoMEJuMlBqMXFBL1dWZnMvNUZ4b1dZN0h3bEpLcnB2WjJTZjl6?=
 =?utf-8?B?WkFCY2kvZVByWmVFMlBHb3J3R0V3dTJsdkxqejVGVEpLY3FoVEhUWEs5M2Js?=
 =?utf-8?B?QmV1dnl5RWQ0QU9pNTlPRG1USlV0NURCUGFaajRLK0U0ejJJQ0N0ZWgwNmxJ?=
 =?utf-8?B?YXZzbXNkOFZOSW0zMGN3M2ZacFkrL0xQUC9GbWt0L0Zmd085ajJ2bWpMOE56?=
 =?utf-8?B?T2k2UWFZQ05JMGZWcFl2TitNd0NtVW5SLy82MUx2SlFMS1YxQWFQbFh3TFRQ?=
 =?utf-8?B?ckt6M0lmdkt0TGd0M2R5dXlkZHRYTHdQRFFraDMwdGdkSXBQQXhjUnJ0TjJK?=
 =?utf-8?B?Rm5ncjFTZzN6aGlPM3ZkQWRWWW9JVkVmcGt4T2NVenhaNmdSd3FlVko5M0Ny?=
 =?utf-8?B?S2lSNS9ZU1ZUNGZOWFhQVFR5cmo4bG9GSGY3NDA4eTRGdnN3UXM5cFRsTkl5?=
 =?utf-8?B?Z2ZDOFVveEdaSjlldXBZbUtsYTJZZFByUDM4UStGblVMSXFEN29pL1ZJc3NF?=
 =?utf-8?B?TVNZV2tuaXpZUG9ydXE0UjhuQlJ4OXVGb3hoRElVUW1mZHpCM1g5UWVJS1pO?=
 =?utf-8?B?eHdEdXVHWTFHNFdjOEhNK1Y5WkZWTjNLejR0d2V0anpabHJDajc4dzNyWGRC?=
 =?utf-8?B?S1V2YVRHVk5ZM3ovZDhuZ1dQOHdFdURSdWZwY3dWMm9wZFdNb25pNzJmMDlD?=
 =?utf-8?B?VHFWL05NLzQ1Vm1WVDNkNTNYaW9tMDdUVTh5Nk5OOVRqSE5Yc1JFam9CbXlE?=
 =?utf-8?B?N0NjV29Rc01BTU53SFd3TzdNbUdlWjZaemwxeUxGKzRuY25sRHNtbWZTWWEr?=
 =?utf-8?B?R25vQW5oR2grUDN3c1JtLzZEVTI4SGVmT0ViandPcndNUUJTS2lvYUMwYnBo?=
 =?utf-8?B?NHhKQVlrT0ZlcnpSUXd3Wm5ySFU5bE9ZbXBicnFja25IUnRmNC9PZk8rSDVD?=
 =?utf-8?B?VERkcU8zY0NPcDFyZG8rZmJneEtQWS96TUhIbEw3VDlzZmVzSHJCb3YySlFm?=
 =?utf-8?B?QzlBVkIybDlsSXpST0ZNVzZpUGh4TFEzekcvZXo3RzU3eFRpbVlrMUZZZFkz?=
 =?utf-8?B?eVEwVWJWcjZuWmZpV2VPK0tud09UYVVZa1NMNmRRNWFScFFDTW56dWNydmxW?=
 =?utf-8?B?ajY5MHlqKzF2d3JEYjc2bVZKTjM1MEJkUkk5YUhwWmJYWDVteFZnR2xtSXhu?=
 =?utf-8?B?RVJnU2RXNStGSFY2OVlNMlRsMmljSXVYbDd1bEFhZGFNSkdsYzloUHY3VzZs?=
 =?utf-8?B?cm1VSUFsVW5ZN242RDkvNUhQdjFqK3RrTGI5MnRIbkxLWTk0aG5rMllKdXRM?=
 =?utf-8?B?dzVYcmpJbDFEdStqRHQ5a00wdndweGo3VDZXWUdIYlZqK3Bjc2NqL1MvL2dE?=
 =?utf-8?B?QVlYcWZ3UVJZSlNqbGVSQUFJUXZtRmFLSkxqQk16c3MvdFMvM2pBcFRvUTBN?=
 =?utf-8?B?TTV5M0FUS0VxV3NtbDViK2pGdnJwRVplaFJkbmgvQTUydGtUeXVwVUN1TmJI?=
 =?utf-8?B?TitiQWNkSzdVTEJsWmFTRWJXT2VyYUE0V3MwOTZ0KzJ4VkRMME1oWTc0SXU5?=
 =?utf-8?Q?Dc+Iit2uujWQ1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1BZT0o3L3JkVW1haTVkNUZldzYzQlY4OFdIRllxekppK3ZsUnFIUWNQNXlK?=
 =?utf-8?B?bWR5c2ZBcGFKY2xCTWdDQ3NyRis4OEZ3WGNLZWNIK0dsbWxxYkdveFRPbWpH?=
 =?utf-8?B?eWo4OGJDQVhQZFE1OGtMTHl4MTdtMmprRXhYc1dIbjRMVUpwbEU5MlR0dDA3?=
 =?utf-8?B?RXJobDJhbzQzOFI3UUtwMXRYb2NpUm80Q2k3MGQ2WGlMY2FUdENjdGJ4VDVo?=
 =?utf-8?B?SGZqb3FOdjVLZS9uTFBqbGRXYW41RkZacU80dE5LanIyZlpTNWFIdHBUdFkx?=
 =?utf-8?B?U01VVyt2VjBQRkx1dTJCeEp4aVJXWmtkUmZRZ3dKM2tBekdmU1RPeFdvK1Rl?=
 =?utf-8?B?cVhicVB1eGFLNzN1alI3UU9IWDFYVUFxNVV6V1VPSjF6WHp6T1V0Z0VhM2c4?=
 =?utf-8?B?K0lYUmg1NlVGOFg2cGY4Q0dCZXpUTUdXdTY2aHJhbm1DeG9LV0NkcENXUjlM?=
 =?utf-8?B?RjVNWEpwWVBmdWZQMmUxTXE0d2dvODNZMDJyUlZaamFETXZlNTE3aFlJSDZj?=
 =?utf-8?B?aGJQdlk4d0F5eCt1NkNzL3drKyt2bnpKWnp6TUJSYzZhTGlDTndCdlNIZ3g3?=
 =?utf-8?B?Q2RseHY5SnVmVjdZdUR3NytISnRTY08yME5KSHFxdkJWSkdCQ3oySWg0NEJS?=
 =?utf-8?B?THZoNXhTaG1DamlqSDZUQjZENzFtYzJkZnljOEYwTVVDR3RkNFFYV3lxVjJP?=
 =?utf-8?B?NEE4emRaem1wYkdCbUFIZ2cwaEFKUyt5OHlaTXVMMjM5d0tzS3BkT1JIRGVr?=
 =?utf-8?B?dVZYVWZlTEczSStqN2UvelNrajZaWTY4WDhaemtxendWYTBhTmdOM3N4cW8v?=
 =?utf-8?B?ZGVvRGJzNTlZc2hESG0rT2orUW44MEQrSGZaRXhZRCsrWGJ3cXpONmxXNjln?=
 =?utf-8?B?dDdvTW5OekljanB5bXI5M21oQU1VUnlkNXNpa2g3SFVxdWYxL2t0eEk3cElh?=
 =?utf-8?B?VlU3SEJrNklmZE4zakZIQXFjRWdza0pBTjBrU2ttM0xoVktSRHZGT2J1V01H?=
 =?utf-8?B?YUlSbVFVQlNoMEszVVBoWnFWcXp0RTVCeUVrazVySTZ4eTRqM3Z3V2xZdmN2?=
 =?utf-8?B?c25GOE9FU25KaWdWN3JWR21EYVFsT2lKeFJFa2ExdFVsM1MzYjNmK0V5L1Zo?=
 =?utf-8?B?M1RoTnR4U3BPUlR2R1BKZ3JkRjlWUlA2QU92dXRxY1ZtU1ltMERodk5iMWJY?=
 =?utf-8?B?MTV5UzU4NUhoZHBERmd1SWVlVm5YRnFKSDNEMEtlejlzQktYT0ZZK2xEbmxN?=
 =?utf-8?B?QklkSEQrdWhGVWNCRkswT2ozcXhOZ3d1SXc1QU03eVpTOXNvcWd0cnlSNWNy?=
 =?utf-8?B?WlE3VFN0ZDZjRHpRbXVtS0ZxZ3REOS9kRGloNW9vdTNDME8vZjdEd1N1WEJm?=
 =?utf-8?B?aWdyRjM1RXZSZkFtK21OM2R3aEZTS1c4R3k0Y2tJYUVZN2JoT1JSanNOOGJq?=
 =?utf-8?B?SjFzTEVZbUlYSGVTMkxRUUpvekpXcVJIMTZQRXNZTlhXWkdYZXQ3eURlQkVj?=
 =?utf-8?B?YVlqUkg3VmppSUNKWEV2M0NmWENYT2hkeGU5eUpyc3lhanc4eURKSGorT1Bi?=
 =?utf-8?B?enE0R2kvdkh4V0R0ZmFxbkJ6ajZEeVdYNEFYNkFJa3krdnd5QTNMazBPaG14?=
 =?utf-8?B?eHFJZ25uZjQ1aExqZ0VtYzVXRVFXaitWKzQyM1RQYmRwYnVvbXdnRmJWTUlq?=
 =?utf-8?B?V2VUZkJPSGZ5aUN2ZGk5cDZOVUJqYVhJTWFmL293SDNiTm9GN3FncXh6UWpJ?=
 =?utf-8?B?VThkTjREc3czSVZFcFdwRTRjeFFZUkNKS3Y0TGZJL2thVnB5NzRsOTkrdjZW?=
 =?utf-8?B?UjZ5T1VkY2lBRVNsQ1VWNnhtcmliMXpZUkpwTFV6b2wwWS9IbUY4RU90T3Ur?=
 =?utf-8?B?dlJCT0J5ZmRZaWY2WTZFVkNzbVU4TnI4RExrSWZwaGpadW1JSXNzcytZTENI?=
 =?utf-8?B?UmZrM1BUWFUyaU5ubDIrOVMvSGhJczNtZ0lubXZ4YnVZaExyNjcxN3FBYWE4?=
 =?utf-8?B?UzZwYlIyV1ZwRGVCYXJKR2JNU3VUK1RTVm9PcFRKaTBodFBXbXpkdkRvWDBI?=
 =?utf-8?B?dTVhQlNGMEFTUzZNRnhLYmVpcUd3VGFUdTYxZXU4cFhmQjg4b09TemtDcFRl?=
 =?utf-8?Q?aTzUJYoEl+7CFyW8ZKQ82jz16?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9cc340a-786f-416d-a594-08dd4a20d6ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 22:18:26.3852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1a2rabgQVqa6Xhc8THHdMhoPfKuqDwzipK1fbgvj5WKQ/3ZVKqOf2UYJyLtS4p7Qr3GcTBUcGtTso9dHk2QCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
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

On 2/9/2025 16:50, Melissa Wen wrote:
> When switching to drm_edid, we slightly changed how to get edid by
> removing the possibility of getting them from dc_link when in aux
> transaction mode. As MST doesn't initialize the connector with
> `drm_connector_init_with_ddc()`, restore the original behavior to avoid
> functional changes.
> 
> Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> 
> Hi,
> 
> So far, there is no reports about an issue related to this but I noticed
> this potential functional change when investigating the previous
> freesync problem. I'm not 100% clear if MST takes this path without
> initializating connector->ddc, but I propose here to restore the
> original behavior to avoid regressions.
> 
> Melissa

I think this looks reasonable.

Charlie,

Can this get included in this week's promotion tests?

Thanks,

> 
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a8421c07b160..0cd22a6686a3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7269,8 +7269,14 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>   	const struct drm_edid *drm_edid;
> +	struct i2c_adapter *ddc;
>   
> -	drm_edid = drm_edid_read(connector);
> +	if (dc_link->aux_mode)
> +		ddc = &aconnector->dm_dp_aux.aux.ddc;
> +	else
> +		ddc = &aconnector->i2c->base;
> +
> +	drm_edid = drm_edid_read_ddc(connector, ddc);
>   	drm_edid_connector_update(connector, drm_edid);
>   	if (!drm_edid) {
>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
> @@ -7315,14 +7321,21 @@ static int get_modes(struct drm_connector *connector)
>   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   {
>   	struct drm_connector *connector = &aconnector->base;
> +	struct dc_link *dc_link = aconnector->dc_link;
>   	struct dc_sink_init_data init_params = {
>   			.link = aconnector->dc_link,
>   			.sink_signal = SIGNAL_TYPE_VIRTUAL
>   	};
>   	const struct drm_edid *drm_edid;
>   	const struct edid *edid;
> +	struct i2c_adapter *ddc;
>   
> -	drm_edid = drm_edid_read(connector);
> +	if (dc_link->aux_mode)
> +		ddc = &aconnector->dm_dp_aux.aux.ddc;
> +	else
> +		ddc = &aconnector->i2c->base;
> +
> +	drm_edid = drm_edid_read_ddc(connector, ddc);
>   	drm_edid_connector_update(connector, drm_edid);
>   	if (!drm_edid) {
>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);

