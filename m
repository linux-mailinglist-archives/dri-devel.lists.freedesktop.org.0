Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4183AD9C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 16:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BDF10EA43;
	Wed, 24 Jan 2024 15:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337EE10EA60;
 Wed, 24 Jan 2024 15:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHmwVK05WXgy8Lh9FlXSoJmL1FVCivTMo8TJicI4YoUMVe3/BfPVkJFnB67UJTkNQ/9Ed6VEP0voVZu3qqXmkv5Uw+C9BlpfdNK8SUjzMEpVYtp7pY6TZToviJpO1kqdpNMIU6a+HzT1cl7MlyL7gJpwgRDZq7EvrOt0BwbrwSjQr/55/ut513BbgC2M5Ib+J75M1ZPxPQ+xhnbC9+aIgup6sTT3lNadeu7qSS/a/QI2JIifQZkGdKWH0uVmBxUNRt3DrhFwcYhFuxKCJmk42QHLVc58qPkEvUfChgOMdObWibLi4JIdzChgv8bjsR0NjIk4Oo66HOonOU8lMlepqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEBMLzVEW9gnAACPL3twQBipvAdh7Si4lMtRNqj8l6Q=;
 b=EzZhjId8F9a1vsoQ8gPJSlAntqs+5B/q4adZ48qOHbkayLWQh0iy43UpBz6FjUjkrPUCjfMQDD2tcC9xDHxWa6/U/0LFPdR+UU6iYrWeBwohSLSY6S7pFeszd4ltDFmohUgPTa0r6LQE6Ex5EtxdO6t8kmUncHocSJoS8J/BFI3WPH8Qfj/5FWYT3kHjQ4LEfyjk8c1Lp0f5NZYnZWDTevfvC0AtWHqfQwc5LSGHv7cZrehQZnkCClIEUZZ1Ekn99LgYFEDxAhrX751dAmeuanrk7gBiXsCo7shskDrwOI5j5G/vGB3WtC6FAG9lDdTeqo9aQJi+Wbm+u63xVfbBOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEBMLzVEW9gnAACPL3twQBipvAdh7Si4lMtRNqj8l6Q=;
 b=IZU4FLg/sr8G3RAJbDVnFxcAWWgXLrqAKbcOM8rJJqaU6Zz/2YtecmjFR9b59A0piIDer7f9iA6iomWB0lcFkqj2nGm98jW5SulraaC+juEO32bfjnlM2uy+llAezVbpRxH+isQV53rijHchVytmgDDC9SB6W+8IXbXJjW8BoiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4928.namprd12.prod.outlook.com (2603:10b6:5:1b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.24; Wed, 24 Jan
 2024 15:43:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.039; Wed, 24 Jan 2024
 15:43:12 +0000
Message-ID: <3669170a-f04b-4f7e-ad16-b62c20ee5838@amd.com>
Date: Wed, 24 Jan 2024 09:43:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: regression/bisected/6.8 commit
 f7fe64ad0f22ff034f8ebcfbd7299ee9cc9b57d7 leads to GPU hang when I open GNOME
 activities
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, matthew.brost@intel.com, 
 ltuikov89@gmail.com, Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
References: <CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com>
 <CABXGCsNz_B+OFBcp=fuC+Kzd-PN+dNM+z=x9e=ePVN5RiahD3g@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CABXGCsNz_B+OFBcp=fuC+Kzd-PN+dNM+z=x9e=ePVN5RiahD3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0074.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: b1994cc0-3b00-4536-cd60-08dc1cf32bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xlyYLjjLqzLeKejgX61qj7uQnR7FgBgQ9g8CxL+XJLOzMePoPXxuIqZ7lQpwj9e00h3SeZChST1JPx2kFArz5ZA5gjtYOZdVlokn6Gb9Ll6XqeaIk/IqzQSKs+n4nvx/j0CqfMFkaXGsbvxODen2XqhqE3TAdO8omxEhPmANIOlm+iuFYtrwRKR0lpcxHitBoySU5Et/hvPc4zAXPwTVxEUiMLSzznulxqM++t1cDJt3GHW7bZP8gglFIL4VnB2ZHhbmK74TpMcOdNNKLpOnq4ts7VHebUe/P3xZuh2hN37MabOPu1SeNxa2y145JR1lRjj82Oeh8XDFyMPBXSoQIQznVfj4aHdxfphOYsqZrapbSDWJeDTvuSX/4SM3+K8xyEZ6d7qSo3Q4gQTf7o7kRtdyN/o8F09gcN5KSQH7gQWeopStSlkFfNuwDuvtK/0q7rt+1936ThSy37140d+TWYRmt5Bc/uUrKrp+Md1GYxTzW8N5D/35mIGXcpjY6WYGCXkH8pH+REiENBuP5YEMDTLM2EF3UzUZLCrshWskL3SQrgMCgSZo1SGO7IzvjEeueqIOTU8lGj48HwEdIbG8RtBfMGYgos4RtOyir4noaNCCtRJkTm2immIxt2HkXVAE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66946007)(66556008)(66476007)(110136005)(316002)(6512007)(6506007)(53546011)(2616005)(41300700001)(26005)(478600001)(86362001)(6486002)(966005)(36756003)(31696002)(38100700002)(83380400001)(6666004)(8936002)(4744005)(31686004)(2906002)(5660300002)(44832011)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnFMV2tYQ3llV0pJUDNsamhqYmUzKzRONFF6WTgxUStsaktsQzd6a28yOTFH?=
 =?utf-8?B?blFBREEwZHpMVTJSaFRZcG5RaDlNUjdOWnJERTRFeDZEZUtSL2ozNUlJeHZI?=
 =?utf-8?B?aFpsTitsU1pQbHl6TVV0d05QN2RMTnJBZHllZEdTeFU0NTZ5blhwUSthOHBp?=
 =?utf-8?B?T0l0Y3BIS05JckZoN2UvMEplbjR5UHMvNklXMmNKMjkvV2tWeXhqeTFTbjlu?=
 =?utf-8?B?VTRwcWlGYXRPOXRUWGhTL2EydlFpZERvbFVXcWhIVmE4RC9MbEtjRU1vUUNU?=
 =?utf-8?B?SGFIWnoyVDQwQy9iZGFXR2V0VCtPOGtyeklvMHdLelh2TVl1bmxtaGM5c0hD?=
 =?utf-8?B?Ky8yNWJ4T2ZxU2d3d25sc3luY0F5aEc2TncvdEwzTlRqekVPVDR4Zy9QdmFr?=
 =?utf-8?B?M0hzKzlEVkM2bGVoVXdCU0I5MEZJcTYxK2VMOUFXNDVaNTFEN1V5UVc4eW1E?=
 =?utf-8?B?Q3lLVFloUXdzTDZ5UmYyWS9aN2ZOVlNKM29pZjlQUEpFSG5uRmUyR09kc1NX?=
 =?utf-8?B?ZmlZTUJMWTVocERzaXkvRDJ3dTZmUGVxOVhYSUQ1Q2ZZZTNLZlhrZEs0cEZH?=
 =?utf-8?B?UWRIdm5RUk9BNXZLc1pNZzZHZnRZYlYzRlRjMjdqZE5WT3ZsRHFqcUxRek5W?=
 =?utf-8?B?WFN5MTE1aVdYcHB5bHBCZ0FSeXdZZHZjc2NxWENtUk01bnBJTnV6ZE9ULzFu?=
 =?utf-8?B?RVQzNTcydlBBT2FnMjl3RzB0cEEwRUZGaU1SaFB2TzNqR0Z1VXg4a2xrYkZR?=
 =?utf-8?B?MXdOODNtaTBxQWU5V1BYMjJna2t0M0R0MjVVWkwvR1pWczZIRmlEWDlNb01j?=
 =?utf-8?B?MU9VU2p4cVU1VnJHWEpvNFB4UHBiYTFobHN2RnlYa3Npb1R0bWZQMXBFaDVO?=
 =?utf-8?B?Ni9WK1lZSUZuZDRldWgrMjFmWnRNVFV2TndkTUJqL1R1WFgxT1RtUm9odDdm?=
 =?utf-8?B?cWY0Z2JXdkg4Ky85ZGwxYjJsUzVIOVJpZzFiYmc0bUVzbDhZYzVSeEJwQnhV?=
 =?utf-8?B?SVZ5emh1bU9aUHdiWHhPWFVCZ0xPYWkwZ3dGenNwOUJkTllmNnZPREZqUjlK?=
 =?utf-8?B?NVJMNm91Qnl6Qmp3WFI3M2dCZEpxQ0RwOHZEdVFldThlQi96T2hqanRGS3dM?=
 =?utf-8?B?cVdVNWhqazV2L050MXVQTHdZZWRqOTk3QVM0NnVTRFlGTlZNeExGM1A4S2RI?=
 =?utf-8?B?WmRFYnJLd0NRLzcwZE9KRUlmUFRwbThJeW1mQ05KQjVuVEx3Vm52RWMvejYr?=
 =?utf-8?B?dGV6c0c1WjJtY1NHci9YMGloOS9wUXU3Z05kVjM0QXU4alIrclNGcUx0dUs2?=
 =?utf-8?B?Y1NJckQrRFF0ak9hNlZJRHp0WERKTE5ib3I1d1NiSjhQbmpvdWNvUWFjdWpC?=
 =?utf-8?B?cUFUTFRvNlRLUUEyZDlyNUltYTNvbkRMWnpBWkVxakFMT1lrbEhiQjBFOFg5?=
 =?utf-8?B?dWVUUUtSdmVmV1dtalUzYUNRNmVma3E3NkQxSUpVWTJ6RFpOR1p0T0pCOU5E?=
 =?utf-8?B?QjdMQ1h0NVIvT3pLc2VjZEVTRUNRV3ZzTFlzeTZldzZkWGxVQkxDSThNK3Qz?=
 =?utf-8?B?MHhlZEhSSmw5Zm5GMUJRNURCN2VSYkRIWDBRSHRQNERRZXMyK0F6L1NwTkIy?=
 =?utf-8?B?NmQxemtkMklLeVpHNGg3aDhEV3hsUVNRR3Ftbjlha1ZhQ2RBdGMvb2hzaGJ5?=
 =?utf-8?B?OHlZdko1ZjZFcEIvVzJOSkwrbU54UmVQZDlBWUtIWXJtbU9mVlFMRmIyWCtS?=
 =?utf-8?B?bktTYSt0ZkYra1FVS1hVOVpQclBMSDM0aVh5VzlDbjFyT0VnN1ozYTNYbWpS?=
 =?utf-8?B?eWV1dndERUZhbloyZFN2SVB3ZldtQTlpdXlEK1JmcHNBR3hpRUZaR1NuZVlU?=
 =?utf-8?B?RzFBVE1ncld3bE5LS0lRZWlOZ0l0RCtWQVJXdnZNZjhKM2VpU2RXUUx3NEhr?=
 =?utf-8?B?SDE3c0VXdk55SE1lOFBCK1U2QzNsaFlyWEtIVFpjaUpQYUt4alhqY3h1cm1X?=
 =?utf-8?B?UitCZ2h5a3l0Q0N5K3RjdXZuNVFWWG1xQW9wcmdTbmdWdS9jZGtsRWtVNWFO?=
 =?utf-8?B?b2FRRUY4cmZLU2xhOVhyajFleXA4cktYb1FlcFVPUC9QQ3hRUVFueHJJZGZB?=
 =?utf-8?Q?4j+Z198XSLRjQhCciTe6Gr3ka?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1994cc0-3b00-4536-cd60-08dc1cf32bde
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 15:43:12.0265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghiNaaQPJ6gyWiDl6YDWG69JQvnyGxcXKd2yY2l/xgpOax+uARXTfxsyVTOOG23R6IACzNtVXKD9bmJ44ifrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4928
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

On 1/24/2024 08:37, Mikhail Gavrilov wrote:
> On Wed, Jan 24, 2024 at 7:19 AM Mikhail Gavrilov
> <mikhail.v.gavrilov@gmail.com> wrote:
>>
>> Who could dig into it, please?
> 
> You decided to revert it?
> https://lkml.org/lkml/2024/1/22/1866

It's not a straight "git revert" on 6.8-rc1 because of some other 
contextual changes.

I posted that as an RFC specifically "in case" that's the direction we 
go and don't get a proper solution together.

Matthew also posted a debugging patch here for use with ftrace and the 
GPU scheduler events: https://gitlab.freedesktop.org/drm/amd/-/issues/3124

I reproduced it with that as well and posted my ftrace results.

> 
> Also I forgot to attach the kernel build .config in the previous
> message. I'm going to fix it here.
> It may be useful for reproducing my bug script.
> 

