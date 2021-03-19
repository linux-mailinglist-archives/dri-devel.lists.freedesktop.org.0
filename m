Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E30C4342530
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 19:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0313F6EA81;
	Fri, 19 Mar 2021 18:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457A26EA81;
 Fri, 19 Mar 2021 18:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fef25QFH+t7x6HwJTsUfs2RGhHsHF46n0KU6HGvTzSNl6hsfk5kSOAqH+zxdnUgziBaiD3IakPHosLx5AWx9nSNHvtDQJE+6g6BnE/w+2o761CqIp3lFu2M/bIQ9014jFQifc/OlRyCNqlwvboE4b5Q2A/Xb1YO+2FOQ/xQLsDfg74ih51ewn41yTcdZ38nKoWrJN2jM4bxhXEz5mZwUm1mCDCs114sP2qfbsc8uw34xFxQXtmzVDcDt3V/dDUryhiO88yLWdTuzPnXJWWspAmcvW+CuGUi/tZBPqbjV4L0bzaBdBy+BtT9ydn13LaLd9C8Vm4QgHX9F6IbkshqOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pulu4mubeTBytftmvryz5yjdndK4N+RRJBC53bQW7Xw=;
 b=g4x520d89aADgcodCrcIHVYE1RMIomq9yuDaEYsOUVuGHoRU/uxAGcElZmRn+Fxr0zilHiy3XHT547/U9jbPBNR9MTRnjV74jgcuFvpfXDEfXdVpzgo7xltsND9Q3TESl+xxnDJPo4oZXdvOLqzZrlVTLfPmMYK44EeXo34iev7wxV8QJWPuQe4KWMRTTMwA7ZeM4rVIDANDarDxLA8cEzI2r9NKXaBmdQAOt06PMm9CmdjJRVzkc/zXM0U38rbbqNzvkj13F35hf3bjAox8aXlbMkwl9ABzyGz/3YwoERyN5YRPrID7LYrzYGwRppJODkvkl8rUrd33kzY8OkjG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pulu4mubeTBytftmvryz5yjdndK4N+RRJBC53bQW7Xw=;
 b=Xv094M7OIRLPx58rU5RvXzYl/OejSV9vuWIWOvyt+XGYBkA4ElcShv+rDnWfCkqzZkRr8jewqaSaLzwtOlp1ThRpcYCz6WsLZw5WPUHwzznm44EZh++rdMjLn+9NElfKNqiQCArGPlUBQ/p2OZQcIa4TNeC3tf7LopoJnBAAmVE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4753.namprd12.prod.outlook.com (2603:10b6:208:89::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 18:47:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 18:47:00 +0000
Subject: Re: [PATCH 06/19] drm/amd/display/dc/calcs/dce_calcs: Move some large
 variables from the stack to the heap
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Lee Jones <lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-7-lee.jones@linaro.org>
 <CADnq5_O7wFLzp7THHN15Diyw52XUN7w+HMks227LWcUvmXShcw@mail.gmail.com>
 <2ec1225f-4bf1-41b7-0d00-2b11eab90c94@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a74c5599-e519-2b02-f16b-31e352872a31@amd.com>
Date: Fri, 19 Mar 2021 19:46:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <2ec1225f-4bf1-41b7-0d00-2b11eab90c94@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3d17:e42d:64f0:733a]
X-ClientProxiedBy: AM8P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3d17:e42d:64f0:733a]
 (2a02:908:1252:fb60:3d17:e42d:64f0:733a) by
 AM8P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 18:46:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e0da24cc-9511-4c11-9e17-08d8eb0760f6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4753:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB47533177003917225C9CDAE183689@BL0PR12MB4753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDwo25I+rJdwP29J3CwtEPvJ5skjf6IogPSeZ4Z5Czy8wOWMy0dkl9tGqiphH1Br01OeoIaX09c9eGOLLpfqSvd83jYdhP/s4DS/uen+syeaGd/RY94KFNanU0TtEy4DuSA8x1TeezDkzLIOMfw+CmHB8XEl2gu5M+yzK15AHUaka7O8sangBgaxpA2fZqMKWxI+ZXQbt8zpyDLLaG1+uaXlwZUZKrXPGw6ShFSfMXcnH9mGFT+EhI/aPehHenoKODdOMLjR7lfbyTt6t88XRCrOKkaBPvXQ+1SlskmJU4eetii4K68qJEqml5cPsBIKODTRW1ndR7DQMtbgZRunr7CWXJo1RsIUO3iGshQUQ0ravkQsJI2cBtfLu4mKSK4zY30vhHpfm3KUh1ubtIaVi4T+OIUC3IQHnbsl5gSH7sKWFVMaOiqwmS2UjdA6nNMZTX8XKpSsIKcfnQnMeIsSykDZmkNz4WAXj9vu8pmnKvgGaVNYpEU3ds23FLvmXlezmSiq36ZLmGKg9VsGj3H2MKVul7dTyd+SG7FL9ExqubUsoq9p9/i7wPmB0agFixNUiT8UDt9+zjXp4dc0pgIxhTIw6EnXSbD2/yxyq13H6kaf73+Fe2hGAyDlJuw1x+y6qjumeiwC2upX0efa8X4OWJdJx3AgT6nvIxkARJIpBbHKzexxD67pNtVFWKD4k6ko5strIJQifq9VEDZfOlcS4jRcAlIxT2sCntVFTaISXmKMv+50lLwqjnFYuDrToU4/fotRsWVhuSrdXYlLqjGWYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(5660300002)(66556008)(66574015)(38100700001)(2906002)(66476007)(54906003)(4326008)(8936002)(83380400001)(36756003)(52116002)(53546011)(6666004)(110136005)(478600001)(86362001)(8676002)(2616005)(316002)(66946007)(31686004)(31696002)(966005)(6486002)(186003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SEVWWGorK1hxVmxlQUltZHhmYlc5UWhta3VxVVNQQmYzRm90K3ZxbjU5L3F6?=
 =?utf-8?B?NmlxYVZJdTZDdkdGY2dVRmx1WXdBUG04VFRoYkpVa0ZkZUQ0SU11clBWaDl0?=
 =?utf-8?B?L3dyL3I1czV6UTdvVk9xNGlvc1htUGZFMkFYd3V3RU8xT1JCU3h2ZTdKZG5r?=
 =?utf-8?B?YlZXanUvRUxYTThZcVFDZkxRWEZRY09rNDA2Mmh2MzhIb2pKd2hJVlhweWR6?=
 =?utf-8?B?eVRoUmpxNGttcWdzQmtjM1pSanVoMmUvU0tJU29VeDhscDN1RFBwN01VVmQ0?=
 =?utf-8?B?dVR3Tm1ieHZ5ZFgxRG05cGhla1FKajU4bkFLR05vUFV0TXpxMjBrK2xvMkxp?=
 =?utf-8?B?di9JeEZZUms4eFBRbXQ1cTRUL0tYVCtHZUIzTDh6TU1TRmdlR3ZTekUvUHhM?=
 =?utf-8?B?TDZjQ1FrTWp2NVdlU2I3c0dFU1puWXMyalpuV3NudE9BdS8yeElmMm1tdS96?=
 =?utf-8?B?ZzVqNzlhaE9MY1NybFIzeEtpN0Y2ZVZ3UUhySFZHMGxrcDJDZzdpaDl1dkRh?=
 =?utf-8?B?bUhoVW9NVWY0TlI4U2VUNUp4M0Y5emJnbjlibWhuZmtjNGt4NEY3OE9hYkJ1?=
 =?utf-8?B?UXM4MFdENVJDWXpnYVpVRGlEcUZOVVhQbE1FYUxqMHcrcDh2R09tQitpeDlz?=
 =?utf-8?B?Z1REUXlUQXBRMlVVcDdFa2p6R2U3L0dBWDVSaWxVUnVzcWNxd1FDUDA0MjlB?=
 =?utf-8?B?SW1YNkZGMHNoblMreTd3WGJrRUt3Z2xkU0txVGxIQUV6dVlMWGdFYlZ5Y1R0?=
 =?utf-8?B?bTZWUml1TERPRGpGSFdIMVhVQXIvNFNVSUV5U1VhKzZFT2d5UFlsYVl5SVRV?=
 =?utf-8?B?TmxYRFhPbHhxQ25JMWs4WFNUclNJODFuQkdNdEVUZ1dkd3piL0FBQzdIVElR?=
 =?utf-8?B?ODhESlhUSEdLSENnZFdOUDRTVENOQWpSc3gzRURjTDhWYmVBdndzVDA3c2Vh?=
 =?utf-8?B?M1JqUkJsZzBIbnFQRU9JUFhpekUya2YxbXV2Ri9FQmRBYVVha1Awa0RjcnE4?=
 =?utf-8?B?UEZyeWJSOXY0M2U3R2RJTEgwVTBBZjNFdmZ6N01wS0tBTjdCS29la1YvT282?=
 =?utf-8?B?SXJFaFd4ei9pZUExU1AvSmdHSUQ1OVJDRkVJSy9IaFVtTGxZWkVvdkZ3VVZM?=
 =?utf-8?B?YXA5RWh4bDhmU0RvZmRNQzJTWFQydU9oY2FsdFkyT0RDYXNwVTAwTGZXVEZn?=
 =?utf-8?B?MmVZam5sTEwxVHFnem1nNXpSeENVOElnNHBDYVowT0ljR044YXFrWG9MeEVF?=
 =?utf-8?B?c1J5ZWxobkF3TUlxeDZ3ZVhQZENWWTZwQm44WEhtSFhkRG5FSHV1cTJqTGtn?=
 =?utf-8?B?R2VMMU4zcTNHZ2lBT09pcFB3a0JVa0cwU080dEtWWlRMSTdkeDBmSTJXanZt?=
 =?utf-8?B?cG54eXErQ1NrZFBLZ1R1dDZEMTZ0cEFCSkdjRHBNdEk5TzF4eFdJSjgySkhO?=
 =?utf-8?B?U1NadlA0STcwTmFNcURtVjNvWjd5QllQcDFuVGdXTndDeDM2NkFLN01BcGFu?=
 =?utf-8?B?NVdPVDdHa01MWWswdEkrUmdHWTNZaGNZKzMyNml3VTByUnAzRCt5eXVlZ1A3?=
 =?utf-8?B?eFUyQUdaY3lOMEZYTm1CalpBREJzU25mT0tSZUt0QVFQNEczQXhJdXJrM2JE?=
 =?utf-8?B?UmJBRjBxV2VpWU9sSk0rQWNreW9uMWNkRlF3K3FwMjBQbDFGYVl6S2J3bjZQ?=
 =?utf-8?B?NnlzclpNZ3hWMEVEcEZxS2JYSk5tMlV0WFdzcVduWkFva1J1ZTBMSFRvNVdv?=
 =?utf-8?B?SzRqQ1FJRHpJOThHVTZDU3dkZ054VzR5dEo0aXg0UjJ0dUFJRmE5TlJjeVZU?=
 =?utf-8?B?RDVwYk5takdJYStwT2JJK0pJMjZaVlZMMVFEZlRUZkxZTG12QXV2dWl3OUcw?=
 =?utf-8?Q?8r4Wkdb+yNTyE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0da24cc-9511-4c11-9e17-08d8eb0760f6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 18:46:59.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TpCKfIKimvMBoyBGkwhndR/7u6PLkeCBEH/FBr3lrx0hvPwO1qQy6PPJhmZhY7x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4753
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Harry Wentland <hwentlan@amd.com>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxOS4wMy4yMSB1bSAxOToyNiBzY2hyaWViIEhhcnJ5IFdlbnRsYW5kOgo+IE9uIDIwMjEt
MDMtMTkgMjoxMyBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4+ICsgSGFycnksIE5pY2sKPj4K
Pj4gT24gRnJpLCBNYXIgMTksIDIwMjEgYXQgNDoyNCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPiB3cm90ZToKPj4+Cj4+PiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwg
YnVpbGQgd2FybmluZyhzKToKPj4+Cj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jOiBJbiAKPj4+IGZ1bmN0aW9uIOKAmGNhbGN1
bGF0ZV9iYW5kd2lkdGjigJk6Cj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNw
bGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5jOjIwMTY6MTogCj4+PiB3YXJuaW5nOiB0aGUgZnJhbWUg
c2l6ZSBvZiAxMjE2IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgCj4+PiBbLVdmcmFt
ZS1sYXJnZXItdGhhbj1dCj4+Pgo+Pj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgo+Pj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+Pj4gQ2M6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPj4+IENjOiAiQ2hyaXN0aWFu
IEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
Pgo+Pj4gQ2M6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4+PiBD
YzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4+PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgo+Pj4gLS0tCj4+PiDCoCAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxj
cy9kY2VfY2FsY3MuY8KgIHwgMzIgCj4+PiArKysrKysrKysrKysrKysrLS0tCj4+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2RjZV9jYWxjcy5j
IAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMK
Pj4+IGluZGV4IGU2MzNmOGE1MWVkYjYuLjlkOGYyNTA1YTYxYzIgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2FsY3MvZGNlX2NhbGNzLmMKPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY2VfY2FsY3MuYwo+Pj4gQEAg
LTk4LDE2ICs5OCwxNiBAQCBzdGF0aWMgdm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAo+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBpbnQzMl90IG51bV9jdXJzb3JfbGluZXM7Cj4+Pgo+Pj4gwqDCoMKgwqDC
oMKgwqDCoCBpbnQzMl90IGksIGosIGs7Cj4+PiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBid19maXhl
ZCB5Y2xrWzNdOwo+Pj4gLcKgwqDCoMKgwqDCoCBzdHJ1Y3QgYndfZml4ZWQgc2Nsa1s4XTsKPj4+
ICvCoMKgwqDCoMKgwqAgc3RydWN0IGJ3X2ZpeGVkICp5Y2xrOwo+Pj4gK8KgwqDCoMKgwqDCoCBz
dHJ1Y3QgYndfZml4ZWQgKnNjbGs7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgZDBfdW5kZXJs
YXlfZW5hYmxlOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBib29sIGQxX3VuZGVybGF5X2VuYWJsZTsK
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBmYmNfZW5hYmxlZDsKPj4+IMKgwqDCoMKgwqDCoMKg
wqAgYm9vbCBscHRfZW5hYmxlZDsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgZW51bSBid19kZWZpbmVz
IHNjbGtfbWVzc2FnZTsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgZW51bSBid19kZWZpbmVzIHljbGtf
bWVzc2FnZTsKPj4+IC3CoMKgwqDCoMKgwqAgZW51bSBid19kZWZpbmVzIHRpbGluZ19tb2RlW21h
eGltdW1fbnVtYmVyX29mX3N1cmZhY2VzXTsKPj4+IC3CoMKgwqDCoMKgwqAgZW51bSBid19kZWZp
bmVzIHN1cmZhY2VfdHlwZVttYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlc107Cj4+PiArwqDCoMKg
wqDCoMKgIGVudW0gYndfZGVmaW5lcyAqdGlsaW5nX21vZGU7Cj4+PiArwqDCoMKgwqDCoMKgIGVu
dW0gYndfZGVmaW5lcyAqc3VyZmFjZV90eXBlOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBlbnVtIGJ3
X2RlZmluZXMgdm9sdGFnZTsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgZW51bSBid19kZWZpbmVzIHBp
cGVfY2hlY2s7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGVudW0gYndfZGVmaW5lcyBoc3JfY2hlY2s7
Cj4+PiBAQCAtMTIyLDYgKzEyMiwyMiBAQCBzdGF0aWMgdm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRo
KAo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpbnQzMl90IG51bWJlcl9vZl9kaXNwbGF5c19lbmFibGVk
X3dpdGhfbWFyZ2luID0gMDsKPj4+IMKgwqDCoMKgwqDCoMKgwqAgaW50MzJfdCBudW1iZXJfb2Zf
YWxpZ25lZF9kaXNwbGF5c193aXRoX25vX21hcmdpbiA9IDA7Cj4+Pgo+Pj4gK8KgwqDCoMKgwqDC
oCB5Y2xrID0ga2NhbGxvYygzLCBzaXplb2YoKnljbGspLCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKg
wqDCoMKgwqAgaWYgKCF5Y2xrKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoCBzY2xrID0ga2NhbGxvYyg4LCBzaXplb2YoKnNj
bGspLCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKgwqDCoMKgwqAgaWYgKCFzY2xrKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmcmVlX3ljbGs7Cj4+PiArCj4+PiArwqDCoMKg
wqDCoMKgIHRpbGluZ19tb2RlID0ga2NhbGxvYyhtYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlcywg
Cj4+PiBzaXplb2YoKnRpbGluZ19tb2RlKSwgR0ZQX0tFUk5FTCk7Cj4+PiArwqDCoMKgwqDCoMKg
IGlmICghdGlsaW5nX21vZGUpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IGZyZWVfc2NsazsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqAgc3VyZmFjZV90eXBlID0ga2NhbGxv
YyhtYXhpbXVtX251bWJlcl9vZl9zdXJmYWNlcywgCj4+PiBzaXplb2YoKnN1cmZhY2VfdHlwZSks
IEdGUF9LRVJORUwpOwo+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoIXN1cmZhY2VfdHlwZSkKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZnJlZV90aWxpbmdfbW9kZTsKPj4+ICsK
Pj4KPj4KPj4gSGFycnkgb3IgTmljayBjYW4gY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1dCBm
b3IgdGhpcyBwYXRjaCBhbmQgdGhlCj4+IG5leHQgb25lLCBJIHRoaW5rIHRoaXMgY2FuIGJlIGNh
bGxlZCBmcm9tIGFuIGF0b21pYyBjb250ZXh0Lgo+Pgo+Cj4gRnJvbSB3aGF0IEkgY2FuIHNlZSB0
aGlzIGRvZXNuJ3Qgc2VlbSB0aGUgY2FzZS4gSWYgSSdtIG1pc3NpbmcgCj4gc29tZXRoaW5nIHNv
bWVvbmUgcGxlYXNlIGNvcnJlY3QgbWUuCgpIYXZlIHlvdSB0YWtlbiBpbnRvIGFjY291bnQgdGhh
dCB1c2luZyBGUCBmdW5jdGlvbnMgcmVxdWlyZSBhdG9taWMgCmNvbnRleHQgYXMgd2VsbD8KCldl
IGhhZCBxdWl0ZSBhIGJ1bmNoIG9mIHByb2JsZW1zIHdpdGggdGhhdCBhbmQgaGFkIHRvIHJlcGxh
Y2Ugc29tZSAKR0ZQX0tFUk5FTCB3aXRoIEdGUF9BVE9NSUMgaW4gdGhlIERDIGNvZGUgYmVjYXVz
ZSBvZiB0aGlzLgoKQ291bGQgb2YgY291cnNlIGJlIHRoYXQgdGhpcyBjb2RlIGhlcmUgaXNuJ3Qg
YWZmZWN0ZWQgYnkgdGhhdCwgYnV0IApiZXR0ZXIgc2F2ZSB0aGFuIHNvcnJ5LgoKQ2hyaXN0aWFu
LgoKPgo+IFRoaXMgYW5kIHRoZSBuZXh0ICgwNi8xOSkgcGF0Y2ggYXJlIGJvdGgKPiBSZXZpZXdl
ZC1ieTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4KPiBIYXJyeQo+
Cj4+IEFsZXgKPj4KPj4+IMKgwqDCoMKgwqDCoMKgwqAgeWNsa1tsb3ddID0gdmJpb3MtPmxvd195
Y2xrOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB5Y2xrW21pZF0gPSB2Ymlvcy0+bWlkX3ljbGs7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgIHljbGtbaGlnaF0gPSB2Ymlvcy0+aGlnaF95Y2xrOwo+Pj4gQEAg
LTIwMTMsNiArMjAyOSwxNCBAQCBzdGF0aWMgdm9pZCBjYWxjdWxhdGVfYmFuZHdpZHRoKAo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgfQo+
Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoCBrZnJlZShzdXJmYWNlX3R5cGUpOwo+Pj4gK2ZyZWVfdGls
aW5nX21vZGU6Cj4+PiArwqDCoMKgwqDCoMKgIGtmcmVlKHRpbGluZ19tb2RlKTsKPj4+ICtmcmVl
X3ljbGs6Cj4+PiArwqDCoMKgwqDCoMKgIGtmcmVlKHljbGspOwo+Pj4gK2ZyZWVfc2NsazoKPj4+
ICvCoMKgwqDCoMKgwqAga2ZyZWUoc2Nsayk7Cj4+PiDCoCB9Cj4+Pgo+Pj4gLyoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioKPj4+IC0tIAo+Pj4gMi4yNy4wCj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
