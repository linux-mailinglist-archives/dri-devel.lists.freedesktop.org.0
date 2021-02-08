Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B2314057
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B50C6E9EF;
	Mon,  8 Feb 2021 20:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690061.outbound.protection.outlook.com [40.107.69.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8796E9EF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:23:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IaGdXgNVoPDGJkZFYz1F27M5Ja7xZ95IQhXgSJJVsene2hZmbhPJ3lgD12tOH5C93wm9JZLSCNDPJr6dcdRmBDp6byytwcH4xmbUJ4ErNIYSZMPxidKJlILp3JpQYBXYgvMY7bUtELR3Was8UIa4ENir03RrI0G1ZN/aVvM2/i2k9425uLBk5poREegSiE+MmDDTcew6o9jE/d3MwxOPjwMvCZK/ZE88L5RpsYB8YrGpj/uUYD6IWa1+tK4qqV+liG/OtHJWVsHpF1thO3HZYnbNQzTWQjKtk48TO0i30jK8vsXYo9DgCXC3svHIOQi8brYX7qZ7sIfNRaFx+12oxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPXYhPqYfEbql6b9W01g09NvScQ51b/FwPWXOw7jrqA=;
 b=d4bklFEzbZLdKJ5Bsubzl+HhbUsEvzGS2OxSsP38QCEt4MNBwdJ3jL5mv4qMZnF0ApqRPemKeS+Aw1BLt7pzRgT6WZmsyUpiWqDVgB2xsrLNA7enCW3b1ij45NMdbJzHEHWQQnfSg43X4cfq7ph1QB34rSJdoau6gWgY9szOLgXxBJXPc4qyGsrk1eGYibgueD+4WOGXiu+Zn7auzWFxH7EpeKFeedDR9n5KtkHd1uD8t1hH+WKNJMLonDSypYkvfz77Se22S/HtcJiEhNoL7As5xZU5kyZ+83PFObvIDClMUe/eY47Ceh78ca2etl2wjOh/RF3ArYGqshI9+IftUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPXYhPqYfEbql6b9W01g09NvScQ51b/FwPWXOw7jrqA=;
 b=ksBuWaPfxNTwXDM660SDbsocfJGFsqKrbSWDByxxxyXFiS/u2KKJdCw5/ndhab08Y4gvH5dvWnEl8w6Eq27UDLJMSHrrvXXEBQZcBil28iqRPuOjIoAFQiP9a+beRI4WA6Ok7MFa8mO9oWwRl9rRyeuvATfLTEz+YzzR0qz5BwM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3776.namprd12.prod.outlook.com (2603:10b6:208:167::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Mon, 8 Feb
 2021 20:23:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:23:47 +0000
Subject: Re: [Linux-graphics-maintainer] [PATCH 2/3] drm/ttm: move memory
 accounting into vmwgfx v3
To: Zack Rusin <zackr@vmware.com>
References: <20210128131604.149660-1-christian.koenig@amd.com>
 <20210128131604.149660-2-christian.koenig@amd.com>
 <ddb5c9c9-173c-1919-6000-b51d451109ba@amd.com>
 <071AC444-2B1A-4333-83FA-CA1A53E35C1C@vmware.com>
 <003b1e64-2510-5d96-be62-f8f45843023b@amd.com>
 <5CBDA1F3-5801-45BA-B84A-A5B83FA95BEB@vmware.com>
 <9CB18811-DA0A-40C3-A719-A9EFAA98D0CE@vmware.com>
 <c0f31c1c-ccae-6441-16bf-2bc25c715f41@amd.com>
 <8d14d1b6-e3eb-87ad-a386-681f787ecf94@amd.com>
 <4E11F79F-685A-4969-B59E-B05AC40578F9@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8750d410-6212-efe2-af55-4974c6cdf092@amd.com>
Date: Mon, 8 Feb 2021 21:23:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4E11F79F-685A-4969-B59E-B05AC40578F9@vmware.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR08CA0031.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:208:d2::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 20:23:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07c94c99-e716-42e2-860e-08d8cc6f706b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3776AF611F20563D63E23CCC838F9@MN2PR12MB3776.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzMiFCoR61WMgrd4doDWd4iW2M//uT+Pm3B49eiyGBh40ipKq/Dp91SORU0+WLJXWGRQbxaBefz78tYeUFltFJQYDKSi/LETe2VDsujdZolqFIR9rBPkuIDnb93nCa0vahN4yRZeXOfecYM8/QLVG79hnWeg8q7LtKIgDzrpKk4bdk5xTwoBONFffKYdkeiv9Qis0f5FZNfxEkZVv0TLju+JYsU7SjjvUq4bZl4IEepLox6R2ZTS5hxiz+ha3GfqfBTDkpf2BB/yPLVmN1LnfBkrqblxXtwyW6qdLOiZysbihaZ/JcpfbCQQQDGTtvp73nxjXzQ0hKKc1VGI3mUT9bfttE5GQ16Wi92kG8Ivct31UMnbO5SBOVdRMFQhat8SnNBGd9GNQwwiQfT/VEX22E91gQDBbCe3XarklAzL31jwVHGkUyRj3hghvQudYMnnzHCNFHAGpyZdUgmEEUJOnovVs5kzkm6MfTp5wiOWuMovpeYMP6UBcyEixVh02KXDz97vlpQOmMsCfYPF/r+SOqnYWfxWsGdcF5sDDwBI5uMlfkOgO1SYDIvLPeSo85t4FqShiKVfAi9Q9UfgdgvvwYmz6979h0SxAk2tiuam94twnmTm/nAVFj8x0XnIKdxP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(52116002)(2906002)(5660300002)(66574015)(6916009)(36756003)(8936002)(8676002)(478600001)(31696002)(4326008)(86362001)(31686004)(6486002)(66476007)(66556008)(186003)(316002)(16526019)(66946007)(2616005)(83380400001)(4744005)(54906003)(53546011)(6666004)(40753002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEM5aGtRa3lOR3lmUU1PcmtWMXF0ajVjb3duTE16bTBMY3A2MUdKZFdNSzhj?=
 =?utf-8?B?WGZRT1Y0YVhMTmhRdjl2WHd0S2plZkYyV2JZUFhHV21tSlliNGtuY2s4NFRE?=
 =?utf-8?B?azZtVFVHajlFUWFhRkk1QmJHYXBZanVZekxOelZ2L2pSRTlkeW9MQVR6ZjVm?=
 =?utf-8?B?Z0JqWm5ScVVCM2lTS1hpK3EyRUQ4RHpGYTQyM0ZsZVhzREpjT1pvaVpUeW1O?=
 =?utf-8?B?ZlVOSmVMV05qWHNFM3V2bnZldjhTRE4zcVJ5aFYwUTNjUmNuTm51OURWMTRa?=
 =?utf-8?B?WjV4eWVqdTR1Ty9wd2dXSkgvRVhkangwT1hRbXIxYXNhc0RuanNJY0JCOER1?=
 =?utf-8?B?SkdXZDRqa2dMSXRyc3pLcGhEbm9GZ3NWcFlRVDN5Uk9yWVFvMmt6QjRkQTN0?=
 =?utf-8?B?ck9RbUVmdFcvZFNYRGNiZFAxMWhBM0ZSS1R0OUJFVXVXQ2tObVFzSjJUWmUv?=
 =?utf-8?B?ZGtxczduTTh3NEVhLzF5eHVoTmhUa3ZWUnRyZ0NjdVExTHpJc2VXUmVYOGJH?=
 =?utf-8?B?LytoQUdlNWR4MDltN0ptK09zbFFPaU1jMjJHa3ltakoyVVR5ektaeVJDdEhE?=
 =?utf-8?B?NUc1Q1dLbEl0SmdrZVo1ZFJjcENGL3pGeEk4K3RDN3g2eGdhSEVlUnRxR0g0?=
 =?utf-8?B?TGhqcDViY0NQQTN5R3NMbGU2bk1EOVp0dzJrWTVZckpSVC9xR0R3SXRQV2Ez?=
 =?utf-8?B?RERwQXRkQzJKcFpCaVdveDJudXRRdkVpNkl2RE1KbmNValBMVUM3VEFsZGhI?=
 =?utf-8?B?UzYxOEV4OTV6MnRmVUQxN3EwTklPYUVIbnpVQlJIUno0Rnc4eGhDcSszaWFO?=
 =?utf-8?B?NzZMTjV2N0hINnJtcFBvRlFSZnByZzJvVXhRVXpmbTVTUHJBdXZFQVBubTUx?=
 =?utf-8?B?Z3MzTmhpY3NSK2E3MzJZeXE5ektsSERVYXNYbjk4M3NUSStzR2liemxQb2pl?=
 =?utf-8?B?aFo3c0ZWSmRyeWFZQ0RWV3lrQmdqSzdhb1AwQVdOaFRuTXlGMTdNZE94OE1B?=
 =?utf-8?B?RVRsRy9hdmI2QWVYZzZ4QW8vQ3diMUFJL0N5cmFyTDJGRENabjFwVEhzUDBQ?=
 =?utf-8?B?R1lyRGUrVWo4NFZEK1JRenI5bzl1ZnREQlFIU2lDelg5R3piZ2NSM2RMcXRs?=
 =?utf-8?B?Q1Z1dFREWS9yMlZ6V2ZZTVNPMnR1TktYOXdEeXJjOHZLcDJObHI1aFZYR3VY?=
 =?utf-8?B?UFVtN3VDMnNVMGdjd1JmdjlBV3dVNExaeUVTRmhKb29DLzRnV2hOaWdzQzhV?=
 =?utf-8?B?R1JGTTR4aDJLZzJTNDl2RzhodTRwMmQ3dFFKR2IvdkRkSGRySjRCMU5HWUhO?=
 =?utf-8?B?L05YUlhEdTd6MTd0WldEYjdQS1FRdW5WdHBEdE5aM0ZyUlExRW9ML3cxanhj?=
 =?utf-8?B?M0ZnemdHaURjQU93V1FIVjY5NmF2cnUvNWc4QU5sVUhCSW5YeWFneHI4SmlC?=
 =?utf-8?B?bHQ0N2Rxd0NLdGlQZU50THdvem1HakJoN1hoaXpZMEFNM0dxeFdFS255Y2t3?=
 =?utf-8?B?NkQ2d21ENHZkOHhLNzBwakwxNDlPdHV3S0FuSS9KdFI0OVduTzhxaEFmK3ZX?=
 =?utf-8?B?czl0ZGlBQXFUVFp0V0VJM1VvZ0F1QkVYcjdYL29oT2g0bWNWNW1lL3dtS0xQ?=
 =?utf-8?B?Z05sY3Z1b1E3UVFqZm1DRUtnQVEwOUtrZ3kyM3Y4cU1ma2NkbG1kZXVXY2NJ?=
 =?utf-8?B?NXJKK3dnSFV3V0FwNlo2WUMvMzk1em1aS1E0RmRUODA0ejNOTWlRcm81Tmxu?=
 =?utf-8?B?cnNtbWJJU1cvRWxrbXNUNFE4T0lmc1g4RVYzbCsxekJ1WVdpbm1ZaWJ2UUpQ?=
 =?utf-8?B?c0R5QmR2NUxZd05RSkhWMmJDTS9KcHMzWUozOTBwSCthaEU3V3lWQ1loOEpV?=
 =?utf-8?Q?NZOg4WwvHei/I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c94c99-e716-42e2-860e-08d8cc6f706b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:23:47.6034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TAsdjaAwFrLMlga6qJCgHtSv2jSfwFrQ3TB7sygnVYKshb32FVdAJ3Mq8k6WYUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3776
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
Cc: "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDIuMjEgdW0gMjE6MjEgc2NocmllYiBaYWNrIFJ1c2luOgo+PiBPbiBGZWIgOCwgMjAy
MSwgYXQgMDg6MzUsIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
d3JvdGU6Cj4+Cj4+IEhpIFphY2ssCj4+Cj4+IG9rIHdlIGZpZ3VyZWQgb3V0IGhvdyB0byBkbyB0
aGlzIGNvcnJlY3RseS4KPj4KPj4gQmFzaWNhbGx5IHVzaW5nIHRoZSBwZGV2LT5rb2JqIGluc3Rl
YWQgb2YgdGhlIGRybS0+cHJpbWFyeS0+a2Rldi0+a29iaiBwb2ludGVyIHdvcmtlZCBxdWl0ZSB3
ZWxsLgo+Pgo+PiBJJ3ZlIGp1c3Qgc2VuZCB0aGUgbGF0ZXN0IHBhdGNoZXMgdG8gdGhlIG1haWxp
bmcgbGlzdC4gSWYgeW91IGRvbid0IGhhdmUgYW55IG9iamVjdGlvbnMgSSB3aWxsIGNvbW1pdCB0
aGF0IHRvbW9ycm93IHdpdGggeW91ciBhbmQgRGFuaWVscyByYi4KPiBUaGF0IHNvdW5kcyBnb29k
LiBUaGF0IG1vdmVzIHRoZSBlbnRyaWVzIHVuZGVyIC9zeXMvZGV2aWNlcy9wY2lCVVMvSUQvbWVt
b3J5X2FjY291bnRpbmcgLCB5ZXM/CgpZZXMgY29ycmVjdC4gSSByZWFsbHkgaG9wZSBub2JvZHkg
cmVsaWVkIG9uIHRoZSBvbGQgbG9jYXRpb24gb3IgCm90aGVyd2lzZSBJIG5lZWQgdG8gYWRkIHNv
bWUga2luZCBvZiBzeW1saW5rIHdvcmthcm91bmQgb3Igc3VjaC4KClJlZ2FyZHMsCkNocmlzdGlh
bi4KCj4KPiB6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
