Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7B8FBB86
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 20:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26F410E5B1;
	Tue,  4 Jun 2024 18:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XyAZ/vt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4936110E49D;
 Tue,  4 Jun 2024 18:25:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iX5GgwW21QUQVGXvyqV2W16YmD3nB5VU/QDF5h7+Ux/XnOKPhlVvd0ZEWFr6h6LPZvnaAYFT+61FjPrmLx/pBc3LpIV+01ScJjIIqMQlLtqX94EV1uu+NLOY7zyX5lenKrA8LnGNvz6C618vHeyGSNNH7A3jbPNIRMuoPGp/eMrgS8Q7PRomSWSRa2ifcCAlMbFFEDBRu/bibSe/3zTbswCBmK0sAhDPE5+7S2UyoWM2cGzS9hWDDKGBaLwS5ryKgEm7MNa62HczpT6b1kjvsetwAExSfZvp7aoRrdkHnJxhU49SrIhwa0RCgSsltLhjJWmRFg5akzMDp1MEdUjq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfVT+Qtelt/0P6ZYgUhCX8egF6X4zv+tadLWYWYLnzk=;
 b=XrwcGT8Tq+BetylZm3F58jhr0kg0UXDUqiLybIWyvF9sf1eD47YiIQTwp4O7eFJFSXu1ROBBLJ7u+xlJ3MuKzs6eFV03Xy4SkljGkRKnOjNdf6iPidQ8XX3l+EWevZ1gqXIS4dMT5DQmnf9uQRweElh4BUfml7cr+3hdu8EGG7IE9PtcIDZfOuqCm1L7JfSoykbh4aJ7hvylF/azzzZaJuxEsF4iYXk2EqoBOngWaoptYRRvw1uBTi8jPJz+6Q3j8mrcitA43yLLANhry4obVXhBFtFanVLAjb1dF3H6Yr8EbjB/bdsL2H42q+ykJPaO/It6hzlHOgSjx+Lgha0qBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfVT+Qtelt/0P6ZYgUhCX8egF6X4zv+tadLWYWYLnzk=;
 b=XyAZ/vt10KDBs0bsC+wDwJxVKy72bUWHfr8lbUgMh7SRCFvXYItpPoNUqYcXJA9D3CMP9IYk0W5ooL7IZqNsfh9GncZOB++jv+jsVNqOersPCODnBXsu/i9xWaoJ3beELB50j8vG3LezqSCkhxehAE1rV6RlOXe2BXFU6pnYsts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 18:25:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:25:01 +0000
Message-ID: <33295481-6977-415f-abff-472bc6f24b9b@amd.com>
Date: Tue, 4 Jun 2024 14:24:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amdgpu: init iommu after amdkfd device init"
To: Armin Wolf <W_Armin@gmx.de>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, gregkh@linuxfoundation.org,
 sashal@kernel.org
Cc: stable@vger.kernel.org, bkauler@gmail.com, yifan1.zhang@amd.com,
 Prike.Liang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240523173031.4212-1-W_Armin@gmx.de>
 <663b8003-3970-4293-930e-e19dce054e01@gmx.de>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <663b8003-3970-4293-930e-e19dce054e01@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0284.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: d324109b-c6bb-4ec8-f176-08dc84c3a5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJ3cUpiYzFNU2dMODg4WnVBUkNmZ28wZXRuQ1RyQkUvWnFEZFJMOVdvR1I3?=
 =?utf-8?B?Y1M1YWcyME51RWZhQXM3cnpSZzgwdzNpcmRvT3JaNkNqL1hZb1dxeGhJRVVE?=
 =?utf-8?B?d1dxS0dZWVRmbnZhQUFyeklNSGJhZ2djZlFKR0YxTTlmMjN3Z2d6UHJleXVw?=
 =?utf-8?B?TnRxRUxHWjRDWE54QkxxdG5YWUlqYXFwNElNL0dQSzh6MGtGR2JXclp2WGgy?=
 =?utf-8?B?NWQ1MFFENUxaY2tRZmFkeW9KQndPR0ZoS2ZScUlLSVFNY2hlbFZkOXpENG1Y?=
 =?utf-8?B?dzlESjYrZW56VVVkeCtucm1STjhQbUJNRjdlNkpkVERtUkx2TlNlQkM3anNu?=
 =?utf-8?B?TzRSYTY3bWhTeVloak1pWEd5cGhEQXdEa1FacVgxeWZNMVRyNlF6NG9iWTdp?=
 =?utf-8?B?cUZPdno4b01zeTZiUGhrdXlNQm1Nb3dnaitCSXpkQmZRTUY0Vk9ucjc2Wkdu?=
 =?utf-8?B?K2N5SW1wWVFQd3R0YU81c2lmczFtUkJrSlVia3lrWUxqSDUvSWNmNUxjTE5W?=
 =?utf-8?B?V1JqZ0Z4ckY1aCswQ3ZGWDFTVFdFOFZZL3JjSWMrdUJ0TC9wa2w3K0ZMVThs?=
 =?utf-8?B?RVhMZnpjekRmQ1Q4eFBNNlhQUzhld3pKMll6bHFvcmxSZVFPd0ZRMjdRZEFu?=
 =?utf-8?B?ZGFiUlB4L2tkSzU3dCtkTDFvV2RubE9OY0NpM2ZWaHg2eE1kOGd2bWVMZy9n?=
 =?utf-8?B?M2FEZlpyUlFnSXkwdFhoYWlwdFJpUi9wMldWMEpLUHdDeUt2M09uQmR3SlU5?=
 =?utf-8?B?cEF4dVJWRXlTMXdEQU9GUDE1N1ordEgrYi9HdU8xT1ZpcFpXWlRiSDJVWncz?=
 =?utf-8?B?bnEyQ2ROQ3Z4ZjJqL1BEZzJxcjVNaS9zSFg1ZGpCMXYxRk1YUjd6NElXKzUw?=
 =?utf-8?B?Rk02S2QxblNFa3laRHUwd0wzb0VGRW1Xd3JVTjBJLzZJVVBCYnFDanF4MmxL?=
 =?utf-8?B?YkFjcVgyajMwM3NENVh2NXppV0VpTmN3YzNEWk5yenRuV202cCtITEE5K0hN?=
 =?utf-8?B?WlIwbTYveFBtRnB2c3NVbENySW0zTEdxWlVIaDBpalRWRmZ3ZVl3YTNkMVlR?=
 =?utf-8?B?T0Z2eTMrSGlFTjhuQ2JlL25JcHJiNXJmcGU3TUE4YWIrUkg2MVJSa0hBVExy?=
 =?utf-8?B?UHBhZG1sU0VKUEZYWFVTYjdkRVhkYU4vNEd3blkyaDhvckg4TFMrWER0TXdn?=
 =?utf-8?B?TlpNdnF6Z0hCOG84aXNvb3p2U0dTaVVjL0U4czN5eEN0SUI3VEQ0SHlkdkxR?=
 =?utf-8?B?OHJueS9IVGV5djFrck9uWjUyZjhDUzFtTjd0cGN2eS9YaWNZQmNwZEg5Tzhp?=
 =?utf-8?B?STg5TUNUZTNEaGJrbng4dlMxZ1ZWWWtOMUJleUU5NitQOVZYYWk2SVdVYkhQ?=
 =?utf-8?B?L1FzNHVWREpMSUNjVTEwa1h6UnM1c0ZqN3lyejdsNlRhcnErMlpCSks2MGRv?=
 =?utf-8?B?TDhVOThLNzdrUkkzMk44bVRuT2RjQXIyU0lhck80NWZkRlRpOFRkNDF1eEhZ?=
 =?utf-8?B?VTVLUko1c0VLS05jTmF0SVBsNHdPYUUvT25iV3lONXNtYlM5ekNJSjhuZWNB?=
 =?utf-8?B?RWJHSmhGdnRBYjBkU2hzc2NwQjdFdDE1KzZURkhJdlVHUHJqZVJqNHZBdWhx?=
 =?utf-8?B?Um1NUS9ST2JaRlNnV3YzUHd4d3JaZGh5T2JYQU5Ca3l4WVQ1YjZoLzRzUUt3?=
 =?utf-8?B?ZHhYSVdKK09lSURLb3JlSndiQTllTDFGSGRkU0k4WEEvdTRTZHFhTC93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmxzMi9yQThwZlNJRUZoQnFkd2o0LzlNc1lsRGV2OEJ4UlM0K1Nya0hsZEIz?=
 =?utf-8?B?L0FoeDIvcDBmcDFpbG1kUVViRHhzVXd2TFU4TGYxd28zMDJacDN5TlN6Y0Zt?=
 =?utf-8?B?bE1BRWsrQ3p3eWs3dEpha0NRR2JvSkh4V3grbkdhWmpmRGsyVEtCT2FDVThl?=
 =?utf-8?B?eS8wT2FrTnA0TmU2Z0loL2RpWjZYK3ljS1hMMkRvNmI3TVM3WXRqa3c3QWZj?=
 =?utf-8?B?VTNNUy9aUHhQWXNzbExrZ1ZlSHVCWEtTMTJQR2N2NFArbW1ncmYzcVZDa3ZL?=
 =?utf-8?B?dmFxVVR5R0lZdm5tSVhIaE56N1Q3SHhzWlpsMUJFYStadm10bm1oc2VHRVVO?=
 =?utf-8?B?V3RiaXBIU0s1UVRZV3RlUWpSNzJiOUxPKzN5VGhZaG5NOHpXVHdlWVBVbkxj?=
 =?utf-8?B?MzY4UlhZWVZ5WXk4eU9MNU8zdldqY082WDFzSmZDenZuRzBra2Z2ckVtd0Zu?=
 =?utf-8?B?R3dhWXJ2YjRFRG9XWDdqeU1MYXFpcnNCV04wREV3dmo1UlJSQzFrR0FaZy9Q?=
 =?utf-8?B?aDU1eXYwaEdXUlo2MGNwSDRTZmtPcnAxNCtEb3BJcjRjOHRYSzlJT3lGenla?=
 =?utf-8?B?amhpczVJNTZhdWpQaElYQU1OZTZYdXkvZkFXYVZvRSs3cjcwV0tKc1pLd0xK?=
 =?utf-8?B?VWgvenMwZ0J4UEw0Ri85M0FRMktwY3hUbGhFNy9pd09EMU5TVk9ROS9aZFU0?=
 =?utf-8?B?amRPWW9MWlVTRE9JdHZybUtISmZEQ2VmWXVnU1o3N3ZBdFc3d2lSc0ZpZlla?=
 =?utf-8?B?dkgwa0FlTS9Xb09jNzNzdG5FV2NkY1QvS0VMMVViRS9sSlhBNGlWNVYrNW9B?=
 =?utf-8?B?MzhZL2pKMHhLTW5GVTVWQVpwT2tVVWNPWnBUaWZrSi9IdStKL2t1aEViN2p6?=
 =?utf-8?B?cDBLMXJMNHpKVFRKSUpvZFhpM2tNbkc1TVlJbys0OUdIeko0SjVmYkFBditI?=
 =?utf-8?B?V2RsMDBEOHdKY3Nycm5nclFVMWVFTW9ZRDYvK2paSUxGOEJWN2E0VENWbTE2?=
 =?utf-8?B?SWRobFhpK2xZOUtrN2FxWkhwVkFQNU9TSXNxOElMaWNvUzVBRVpyTkxpNUU0?=
 =?utf-8?B?MndoYmdHbUZySFI4TVFKemV5Q1BjMWdtOFM5QThudEI4d2RpY1IvR0UrL1NR?=
 =?utf-8?B?TXRIcHNicnNsbTlabkp4ZGlTbEFJSkZBa1JieFNkRjZZejRjbXU4TmcxU2hK?=
 =?utf-8?B?SnZKUXN0WTh6U0dDSXpqQjFzakVtWWl3TDdWZTRnRGFzTGQyZGtPaTJHcmhl?=
 =?utf-8?B?bkwxNFNjdUx4NHRZZUUwb29PNnVTUlVkMmZUQy9kbExQQUIyN1RUMDVFWU91?=
 =?utf-8?B?UnlMQWl0SjBPQWRUa0VjWHliM2dvNFA0WVVpMU8weTZiU1IyMzQ5RHNTN0NK?=
 =?utf-8?B?SENTYjhmaFVPZ1l6bWR4TTBZeStlcXN5L2JnNHYyOUtmK1k5RlJkUlF0NVln?=
 =?utf-8?B?YW9CTXJQS2RpcUhWQlQySWFrV2VJMHg5T0VnYXVzMWVBTnZ1VFNzakFBL2xL?=
 =?utf-8?B?Um51YWU2S0pJVFJsd1E2dTZTcFA1eFVlTk45RlNwR0lrb3ljbjBaRDVaWnk2?=
 =?utf-8?B?eFVqTzlkZFRpd2o0UVliSXZsZHYvTUQ5cDI2TEY1b2FWWHJCemM4MmJrcUFu?=
 =?utf-8?B?eFRLaTJzQ1F6UmN6NXR6Rzc2aE9wNllzY1VwQURzMjF0OERaYm9SbEdvRTFk?=
 =?utf-8?B?Z1Nmb2lWWVZTMENvQ0hMYTJyOS9uTm9GRHlMa3QwNnNZOFp3SjVuNHJEeTFy?=
 =?utf-8?B?R2FPWHh6MzJubGw4Rjl4RGZYWWNNeGlGS1VMR293Z1g3QzFlUEIwQk4xMm55?=
 =?utf-8?B?TWxhMGhtbVZOYTd5ZzRuRkFkN3JtWFpPSUVvRUcwRWREWEFpbDFkNUZTL0Rq?=
 =?utf-8?B?YU1FRVI5cGlzUC96YkJNNmIvWnFJenlZNWV4c2Q5bU9tdUUwZVdBMmZzN1pO?=
 =?utf-8?B?RW5IUjdOOGQ0SzM5MThraFNhZmpXd2VNTjFwSlZjYUsxUjFLdFhtV0dJZDNp?=
 =?utf-8?B?T29vakFTMjg5a0d6VDFIamxyanI3dGNVNS9ZSjA0V3NnTmlyVDhzU3FFdW9D?=
 =?utf-8?B?VFdUMDBoUzZsSjRPZTU4MW1FYzkvdE9UbjVKOXA5UmRGZzBDOTdYNXNNM3pH?=
 =?utf-8?Q?zEzMdxAwTp7LQMygzvQ/qDLTd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d324109b-c6bb-4ec8-f176-08dc84c3a5e5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:25:01.7465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/nHX9G+8zyuFgoeIEAfVa7PKLrgpc+fRLbvW6543LrdwxXFLOFaN49+/WI0zNvun+bE3RZSBAe89sKH2gQ0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908
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


On 2024-06-03 18:19, Armin Wolf wrote:
> Am 23.05.24 um 19:30 schrieb Armin Wolf:
>
>> This reverts commit 56b522f4668167096a50c39446d6263c96219f5f.
>>
>> A user reported that this commit breaks the integrated gpu of his
>> notebook, causing a black screen. He was able to bisect the problematic
>> commit and verified that by reverting it the notebook works again.
>> He also confirmed that kernel 6.8.1 also works on his device, so the
>> upstream commit itself seems to be ok.
>>
>> An amdgpu developer (Alex Deucher) confirmed that this patch should
>> have never been ported to 5.15 in the first place, so revert this
>> commit from the 5.15 stable series.
>
> Hi,
>
> what is the status of this?

Which branch is this for? This patch won't apply to anything after Linux 
6.5. Support for IOMMUv2 was removed from amdgpu in Linux 6.6 by:

commit c99a2e7ae291e5b19b60443eb6397320ef9e8571
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Fri Jul 28 12:20:12 2023 -0400

     drm/amdkfd: drop IOMMUv2 support

     Now that we use the dGPU path for all APUs, drop the
     IOMMUv2 support.

     v2: drop the now unused queue manager functions for gfx7/8 APUs

     Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
     Acked-by: Christian König <christian.koenig@amd.com>
     Tested-by: Mike Lothian <mike@fireburn.co.uk>
     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Regards,
   Felix


>
> Armin Wolf
>
>>
>> Reported-by: Barry Kauler <bkauler@gmail.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 222a1d9ecf16..5f6c32ec674d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2487,6 +2487,10 @@ static int amdgpu_device_ip_init(struct 
>> amdgpu_device *adev)
>>       if (r)
>>           goto init_failed;
>>
>> +    r = amdgpu_amdkfd_resume_iommu(adev);
>> +    if (r)
>> +        goto init_failed;
>> +
>>       r = amdgpu_device_ip_hw_init_phase1(adev);
>>       if (r)
>>           goto init_failed;
>> @@ -2525,10 +2529,6 @@ static int amdgpu_device_ip_init(struct 
>> amdgpu_device *adev)
>>       if (!adev->gmc.xgmi.pending_reset)
>>           amdgpu_amdkfd_device_init(adev);
>>
>> -    r = amdgpu_amdkfd_resume_iommu(adev);
>> -    if (r)
>> -        goto init_failed;
>> -
>>       amdgpu_fru_get_product_info(adev);
>>
>>   init_failed:
>> -- 
>> 2.39.2
>>
>>
