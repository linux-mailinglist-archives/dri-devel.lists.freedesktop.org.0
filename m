Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C873856C3E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 19:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6428A10E24F;
	Thu, 15 Feb 2024 18:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gigoEh5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1185C10E214;
 Thu, 15 Feb 2024 18:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKK9HiZkLuckb2AXBxv/k5P1+3PhCMxBsica8HKGBMQb2kq3UceF+w25dNYT+Bdw52fehT1hVVuxsCv1sYiE+VWuEIWcs12MhdDX4r2+rEYVZ/vQAKprUfT1yWMCceLamH5nBF4orsO4rbjFrgYptVeCOQSWR/A0uOtjpuAyZMmA+Uy14wSWdhDVFOMun6BJ6PDNgSpZk1bQ6ck3FoiwMBKY36zvMFEEXsM7POKfixfvOXCq/ncCPPdcIjrR4G5WLFlxGLm3NhSHLPRtAETyQD56IuxDlLDhbMch89YqIBTbLfrrcjG7J9GOqxq7wo/JRRZVHUyptxy7phesTETmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=318PDEa2SACcIbQ6jobDcfbPri2Rp1xh4l8GIMJ7Gy8=;
 b=mYmk+zZQj/YQ1KKtujioZb+9t3HkkREodJC6tBix7hjV7aPun6y3myVsy0SDRWcTyAtmSIfHp3BuMW7OgooqEmv3Mxf5fIJetiAT6Wm60GlsYz6rzH+OTPh+BxfONaetXdEVBYMzXAI2l/bfEhZPnnAiU9DjDrcDb9i5zJahk9jwcFmhViIwRLxV82nPnS1L7qTLMixkMVhNkPt+tbZDswG7uuwJiAUfTG9/zwU6jyMAkyblg7l5dX3VQCWO0sKlcrLEbH7AVMR4Q+6kqfd+BjTCoVCs/UAZ04Y88sYmQqbhPksikSYZwxR+HeB/O1XET9PqrH2aMefRGRb6sZAcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=318PDEa2SACcIbQ6jobDcfbPri2Rp1xh4l8GIMJ7Gy8=;
 b=gigoEh5X5U1DopE84THajkQdQgR/rzdLE57VHQBVOwuaTzXg9l24WXF2YKY5ZPI7hL8NWx2vquptBXQgTL6LYualWKNxiK8NiyrhKV7ypRQSgJDGsrn/+a8kmlWLTGmNdqUTCrjgsitROYaMwoXO7g3IKw0hz5UXbD4KbHk3Z8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.11; Thu, 15 Feb
 2024 18:15:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 18:15:11 +0000
Message-ID: <a1d2749b-8db5-46d1-bf60-7820902cfc8f@amd.com>
Date: Thu, 15 Feb 2024 12:15:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: add panel_power_savings sysfs entry
 to eDP connectors
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202152837.7388-1-hamza.mahfooz@amd.com>
 <0b94b25a-9ffa-41a5-b931-ad84e1892d36@amd.com>
 <b117ccc0-6569-4753-9cb9-c304f9e50d30@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <b117ccc0-6569-4753-9cb9-c304f9e50d30@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:5:334::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff70b53-29b4-48c7-8409-08dc2e520c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZ8JtP+1BWWuFpOnesrPVEux76ULJQJDsJEfXAE803kSiX0zfBjInh353lst2CvxsktrYfHT6zwwV79BTnXp5k5Ml3AonAhhZnpS7oQak2G/osGFcrYTPmNGMYFWv4T8Y4efq283zB0lSiW56ZRQHOYI/P+Wh+qxARgYHodcSxBDojgatfKR8nZTFxNtBvYI2m1h0ZtA9dVnpnJrC6qE+CeEdhfnRbbzi1Ncjq/DF1zFI3cLtT/4w8adZ2Jq/QNW3rD1xfqJJ5pH6j/iPexw7LcHp7g0QehcWz8q2FZmde1DRhF70KzikAIzgFk/5Ca0YXXI7s9wsoQqnmuA26lUbhjtGW8S9wkkug9yVEIxHpJp4dbWik7rODgA3uJgl0UUwh0wK7nGWwyN9mWyOEBiWZjLazaeUm3lG8BK1K+vJh92MZONHpcFmFCSGQTDN0KSkGcWk8p9ETgmjW5IS1C+jBEY9+wF1VQ6TTcTANyYyJF8+VvlPejedJWqJnzHiR4XCTKfScRQQZb5QI0v3WblyupmljL+Al/B2lI50MEg4YY5uQ1Q5G82eBYX4Dqf9fZm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(38100700002)(44832011)(2906002)(5660300002)(4326008)(110136005)(2616005)(26005)(66476007)(316002)(66946007)(8676002)(6666004)(66556008)(54906003)(8936002)(478600001)(6512007)(6486002)(6506007)(53546011)(31696002)(86362001)(41300700001)(36756003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHRnKzVNdytoWTRPSksyaE4yZFR0V3pic0ppeXQ0ZXpqdnhqaDNsR041WStW?=
 =?utf-8?B?dVN6dXVJbWx2NFRJandKa21KRGVEZDJlN2V6QmV1aFpybmI3akZaeTBJdDFL?=
 =?utf-8?B?dTNuc2VLQ0xyV3VwSFY3U21OdW5SZXp1NWJ1bzhaTm5KV21pK3dJelBSZGdW?=
 =?utf-8?B?YXRqWW9lbm54ZkZ6VUZqMzBHZjM0QXRFc1ZFRTNzSTNHS1lvQWdBd2RlMGo1?=
 =?utf-8?B?ZFQzTm1xN1kxZkdBejZWVzdzOTV1VzVIUm45eVdkcitNN25GOEZ6NFoxR1d6?=
 =?utf-8?B?QTFvdDROc0l3SEk4Njg5TEtWUkdPb3RzdkpnbWh2UWlIazg4SjlLQ1ZseUhu?=
 =?utf-8?B?UmdzeEZuMUh2ZXNRNTlLbllFWUVMZVpFTE05T3R2UEVPK1J1eG9hWnp3S1Ba?=
 =?utf-8?B?SDUxTGR4eFA5YVQ1MzRlUmtVYVBxampTVCtLWjRTQ2JXQUpBVGFmcVYwV1NK?=
 =?utf-8?B?RzZNdHR4T3B0RlR4dkdpaTZiTWZHaWR6TFlyYmRUU0JMZmNpUVRZc2ZidTZJ?=
 =?utf-8?B?ZjVJamhCL3lYSHB4N3FoRnZLbUl5b3dtR1owYS83akxkMEpVdjNKRXdIN3Rk?=
 =?utf-8?B?U1VpMkkxV0h1YjJBRDdjbUtJa2ZOL0pCT1ZQSTFUQ0IyaVF0ZGxIbUtLSTI5?=
 =?utf-8?B?aDFOM1JEZXJsZjFEemtKL01vSG9ZTUVQY1lWdk02UWNIdzM4SmdHazBpbllP?=
 =?utf-8?B?aTFBQXpiaFVBZ1Bhcklia3ozZWh2QThRV2cwQUg3VUNqOHI3MWJkbm5FTW8y?=
 =?utf-8?B?cHdBNkZhWjRRS1hRSmpIcVh4SlIwYnNjR09yL1ZEM01hSFpFWk9JRWpLN1NB?=
 =?utf-8?B?dzczOWFoR25oUTA5NFRMRE1UcE9Ec0cvUnBWeDNGallBc3VyM1NteHNQM0Vl?=
 =?utf-8?B?K081V0JZZ1UzcElaQllrTWl1OTZpTHlxQS9HZVp0OHpUZS9DSjZ4bmREVDVK?=
 =?utf-8?B?U0FRbDVqM25wcnBsU2V0bDByVm45SHlhbmFxU3o5L3A0QTJXZ1c4Z2UzdjRx?=
 =?utf-8?B?Q2RqVmY2Y0xudm1CcFdoU29vdUtmTE9iMjlCN2VuRDhNejljdkpjVjFBTWdi?=
 =?utf-8?B?V3ZYUGRUM2gxRFBTZGpnczhGZk9KcXozcEkyQk9vamFGR0VUSVk2c1NTMFNv?=
 =?utf-8?B?QkFucWxGNWZ2SjhXd0FFUWsxRmhpTmRkcm96WW5aTDZ2ZmF0YzdaT0VPbGtx?=
 =?utf-8?B?cUVkSE1hR0xCejI0V2grNURSeUphOU5KQXRmSzhRZ2VCNHhuMnYvY1NZbUJr?=
 =?utf-8?B?Mmt3eWh0OUtYRDQ2cStqc1V4QWN5VGdwVFBobkttaUlyMzU4Vk9mSmpqdU9v?=
 =?utf-8?B?WTNzL2Q5Ujc1VHpBUHdJSUtqbjBsMVprY0lyMTFVbldhQkhDaWtWejVWUUh0?=
 =?utf-8?B?V3BoU0dzcHMxYjZZWjF0NUgwbXhxdnBUN1IrYlBVT01Uc0VGTmhIeWFnQ01k?=
 =?utf-8?B?WFo5MnE1dTIrek1INWdKcUxFWEUzZjB0akpTVUNmL3A5TlJ6TlErM25EZFAr?=
 =?utf-8?B?ZGppM3UxVW55NVM1ZjNsSTI3L21ndW1QaXdQQThYUE5IZkczUTBLSGVZWkJB?=
 =?utf-8?B?Rk0reXNPdEVmc3RISlNiTWcrM3pqMGdGaDkzYXhhNUowOFFDUlVnUkVvZUpj?=
 =?utf-8?B?Q3JsN0Y2a0RvcE0xUXM0T2hDNXNHMnNLZ25remZlS3hxeDRENGo5MDl4SFBr?=
 =?utf-8?B?R2FOK3VPYmJwbEtzZ2ZTTDJBQUVGYUR6cWxUOXAydUxGVlJXWU4reDFacVdw?=
 =?utf-8?B?QUxxQVYwOEJ6bEFjMXJsVCtrUU1Ec0NBVmMrRDN4ZTNlRS90cUtOQVd0TW1S?=
 =?utf-8?B?YnJlWktqTU9IUXY3VERQeWxDd20zS1owNGIzbW9BSThEaHpkR282U2plOVNq?=
 =?utf-8?B?QXRlRmFPNXZraHR1L3dHanduK3NNYWRtZ0tUOXllUm05VTg1bytuSm80UXlJ?=
 =?utf-8?B?RllWSmtGb1lrRXNzM3ZBN25keDZnSVpPbFRhdXN3RVBjUERDNFhVQ0FmNGcz?=
 =?utf-8?B?bGNZUzZGZER5WVR4UUhLN0IyZUluRk9EMDdnOFcxTTg4cFo2U09JOVEwejM3?=
 =?utf-8?B?VEpISnR6UjgxMzloVkxNRUtiWjlqa1hDZnE0cFRoL3FIejVlRXBadXdUQ1FK?=
 =?utf-8?Q?UeWl+eoXcW4VZvq0id60nt5lD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff70b53-29b4-48c7-8409-08dc2e520c44
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 18:15:10.9545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc7BQZtu7K1wcQNyqW1zmz8UNQt+PRsRN+Ywxo2PWcMWb3J8nVAbR+UPwOvftoxLWtuF78RUaji5DekoQqlbRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
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

On 2/15/2024 11:54, Harry Wentland wrote:
> On 2024-02-02 11:20, Mario Limonciello wrote:
>> On 2/2/2024 09:28, Hamza Mahfooz wrote:
>>> We want programs besides the compositor to be able to enable or disable
>>> panel power saving features. However, since they are currently only
>>> configurable through DRM properties, that isn't possible. So, to remedy
>>> that issue introduce a new "panel_power_savings" sysfs attribute.
>>>
> 
> I've been trying to avoid looking at this too closely, partly because
> I want ABM enablement by default, with control for users. But the
> more I think about this the more uncomfortable I get. The key for my
> discomfort is that we're going around the back of DRM master to set
> a DRM property. This is apt to create lots of weird behaviors,
> especially if compositors also decide to implement support for the
> abm_level property and then potentially fight PPD, or other users
> of this sysfs.

I feel the problem is that specifically both DRM master and sysfs can 
simultaneously fight over the value for ABM.

This isn't a totally new problem because previously the user and DRM
master could fight over this (with the user setting it on command line
and DRM master overriding that).  That was fixed in a follow up patch
though in that the DRM property isn't attached if a user sets the value
on the command line.

I feel the solution to these concerns is that we should make a knob that 
controls whether the DRM property is created or the sysfs file is 
created but not let them happen simultaneously.

We already have amdgpu.abmlevel=-1 is the only time sysfs is created. 
I'd say we should drop the drm property in that case and add a case for 
amdgpu.abmlevel=-2 which will only make the drm property and not the 
sysfs value.  With that done it turns into:

-2  : DRM master is in control
-1  : sysfs is in control.  Software like PPD will tune it as needed.
0-4 : User is in control.


