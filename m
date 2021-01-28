Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D73073FB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 11:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C2B6E10C;
	Thu, 28 Jan 2021 10:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4C6E10C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 10:45:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdyRKfw3LXKMgJXk6lRfwBUyr6u7R/3/PQwGCy8zzcOqnrGlrByIREng9xAesKj9/m4aUlVh46/o4RGKpVDDC5FlS7W8LglrTNQEG2GWxJQMrbBvD104k0LFiRjWkFyr0eNbsHCzYY34PgUxhbpLxPOx/pWq+ZHgTD1tq02MB++CgKO5TnSGCav0VsJLuELPmtQesy54o9bsjQ2j/TNl7Sg+ZzyJobfmu65KRzY1VABNQSuXhLGNKCE8j4jKI9olMlTa3pWjr+84wZ0DPzRCpHpf7ImAkmsX1Kb9pnlDcm3q6gPTkjrg6Q24nhAsLmq4xe0X/2zN9If0FSqnT9faAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSNN3hmbNQmty0osrwoOUYgga0ox7m9gZiYlPWFjpvU=;
 b=iBt6xArfN8/e3ZsegTE9llio9Zdixm7tX+z+DxhLlUpXlpi772YCHcgIpyCfETWZHjSWgouOpJ3qAJsbWG+HsJyuZWV7kVoE3aCpsEugEaQ5ND+RAlW/NhBhqjNE+PIGpHG6ylNNkrHQoFdH4pzTUZmDvS0Bl6/HzzzufcHC/DgoUS5IKRczZUyvo6rydFUshFj/Cc7HFq0SC1UTun8nhqGgypXUXrhUyhGgudZe7OkgSirN3VXPTE96B18H15NI5w7ZJjKRONksVdRzGg5yjy5NxMdqmi8RZ8lf1VPIbOR3V0bHXFKVlqtmdTrdergj8xR8s7EQdY406fawoKNkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSNN3hmbNQmty0osrwoOUYgga0ox7m9gZiYlPWFjpvU=;
 b=SV/9xIWucItn3JOzyUNWdzcTdcoU/A2zYdB0EEBw/at3PhrNhJCZe+sZL1sT1Nx7U/36MuxWn7u4WCsDokj42ic7kSGj7En9Cx7BpfakyDZJehKX8HvlAX/6+d3du54JlD+PtNsKzIuUPg6g21rR8TAxPzRVmbgcJJmbbVb5jR4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2481.namprd12.prod.outlook.com (2603:10b6:207:40::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Thu, 28 Jan
 2021 10:45:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 10:45:52 +0000
Subject: Re: [PATCH] drm/ttm: Use __GFP_NOWARN for huge pages in
 ttm_pool_alloc_page
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Huang Rui <ray.huang@amd.com>
References: <20210128095346.2421-1-michel@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6863d36f-a80d-046b-fb04-0e5783901747@amd.com>
Date: Thu, 28 Jan 2021 11:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210128095346.2421-1-michel@daenzer.net>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0170.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0170.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Thu, 28 Jan 2021 10:45:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ae2da87-29ee-4c7d-9f9e-08d8c379e1b9
X-MS-TrafficTypeDiagnostic: BL0PR12MB2481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2481E605F888150D9DD5465683BA9@BL0PR12MB2481.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4MuDZjSnOCmai5cfNH/dDebuonyw3M0ZeDmG1CHcm6g8Qewgxsxy+wy358SMMUgEhxVoHrhc5YVHXg4rq9Lclof8RaQRYE3ohst8nm7zEN0gwPHWayIg4+hrFPsvGDP3u6lzOxeEMmnbg8E13HijtkgA5KetK34dQYNuaJ8AcIZ8/38lx7gVbQ9zDNx5gX+05+HMZ07gmzhpwb9GAt6BM1XmEigsboT0iDGUL81LMsYoKLWrEtEpyAIFBj+zItBN5FOd8NgRNOULEbjqn6bSNZqFwFL79eeG4R/IgLG1BPg47oK10yi9Sn8xTPqPxUwlYT8QZd+ERysrIbhebNohHBWXDEk0Ytmr3e0aeeqwDBd66h8MIZM/az04WURWp/O6EHlX/wr4Bd0VoJL8koutTKF7h+B0SjQpQJMS2rEL7NZdyO/fJCdBPc+HPbksrcTr0OX6GZ2GVFDzA2wrG8UBJo8RqEwRjGrqO0VhyacyhHibxAKfxo6iBCVzcuC6nPeFUZdSfXzv1LMTWGTcaV6Ul5DawTEUp6GiARIcN3OYl4OO+jzoRloR2Jisyc26QxzXOojv8709cBcYab653k9cBsew9rn9m1PJAz6K7uUSeE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(6636002)(316002)(478600001)(66556008)(8676002)(2906002)(4326008)(52116002)(5660300002)(66476007)(36756003)(6666004)(8936002)(66946007)(6486002)(16526019)(186003)(31696002)(110136005)(31686004)(66574015)(86362001)(2616005)(83380400001)(14583001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VXFQNXdaTEtSUjliOXNLN25Peldqa0t1aFBFNGQrQVdDS1lxV0VqTm1mS0w3?=
 =?utf-8?B?WWhXb3dTV1hEbmhId2NZREtDanZnamdIUzh4dzQvRkc3UG41N0tQMVZzMXY2?=
 =?utf-8?B?bWxhN2pOM2c2NzFaby9rOURsOFZid3ZDSFlua2k5Vk9zOXdJK3FNb1Q0WW5Y?=
 =?utf-8?B?K0U5c0hqVkJCTncyaTNGWkRMVEZmbC9FMDVBMDRQMlJoWTd1USt2b1MrSWlo?=
 =?utf-8?B?d3RJSll4UE1WdzZZR1p0Zm9TYXFXeGhUMVRFS2RRSGtmenZQaFgrNGNSNzlt?=
 =?utf-8?B?cllpTjU0RG1NdFNMQVFQbEVkMGVoTTJrMWpGamVqRUZ6Z0orL1dkNFJDWit4?=
 =?utf-8?B?bGVzQUoyYTZMSzcyYnhDcXlLeVV0NytSSjl0U01EdFJkYkk2WE14VC9CVmRN?=
 =?utf-8?B?YytkL1BTN3drSUIxekxQTmIrNytpcTZaMjdFbDh2Ulk4QUxXYlBkcHZoZXpm?=
 =?utf-8?B?VFlUalFxUm45RStsRzhpNDNJRHhteHJDT2RLWllIamlBQjhwK2xQSUdwTHJ6?=
 =?utf-8?B?Q3liQzJhZlg2aFh6K1JtdWNZZHQ1REUrMnRSLytVNk5YNkdCUFc1YTVGL0xy?=
 =?utf-8?B?UUJPcmFoTTRjSVN6bm9YM2IwcVZOenRNTEdvTG43ZUxCdHo2bThDUGpvcjFQ?=
 =?utf-8?B?ZFdxQllSbGJ0K1djazNHZzRCaHcvdVlUNDBmakZSUXhYSVBPMlB5cURKUEM4?=
 =?utf-8?B?QWlkUTJmZHRVc2JWdnhucnJIdXFjR3FDaU9xM2V5TGxHaklTN2hWSDFaL1c5?=
 =?utf-8?B?Q3JhK0ZUZmx0UFU4Q28rUWR4L09maHpLNFNyS2MraWlwMUt2cUtkTlpzYWRI?=
 =?utf-8?B?NEUrb2JLTEUwemVlZ212YlU5TnIwNjNka2ZGUzlWVzB3dXgxd2t5KzNHM1hW?=
 =?utf-8?B?RXowZGF4S0U0UktUUFYrWkdJVHBLQWJiYWhHQmZiY1FucE1Vb3BqK1NBQTVl?=
 =?utf-8?B?MWl6Mk9KYXhyNlB1QVV2VmZZRVJTdHJKUVdUZlBuWSsxZ2JlRk5oOCtrZjE5?=
 =?utf-8?B?aWxVVmRzS1NORi9zQ3ZPUzZEdHlGMGJlWHVUQ0dDdlpZcmtERXBNYU1WS1ow?=
 =?utf-8?B?My9UZVo1a0krbVZocFNVVTdOOWNNQktZUGg1SmpKZWt5RjNnQlprM3U5WXVq?=
 =?utf-8?B?WWlTVU4rUkJFRHEwc3FxODN3VElkTmRLTzVkMEFGRkt1WWpoUTlGZDRMK0Vt?=
 =?utf-8?B?YTlxSkNQdVd4S3hxRXIrWVpoSSs5L2txb0Q3YUlKeGM1VG1BVlpWMldNTlhm?=
 =?utf-8?B?b3BPczVtNk1lK21ZMGs3TDFnY1VCQUdtaEgvOFM0b3c4UkVrdUZJcG9KR0dS?=
 =?utf-8?B?NVFaRFYwUkZWRWFDRy9FS0JRMTNzZit2SHp4TmJYdUJVNnJRc21BMENRZnls?=
 =?utf-8?B?UFFVL0x1dXBueVY4aXBwMTIwL24vd2YyS2dUV3UrazRzOHNMeWthUW5vd3RS?=
 =?utf-8?B?S1R4Y3NDdnRGU2xuTHUxL3NpQUpYTTUyRS9WcXd6ZEFtbVIxM3BkdzF1TUhK?=
 =?utf-8?B?QmNlNTRjc2MxalB2bzlqZjVRZWdTNzVBVEg3cEFMK2ExcmdET05YRHRqNmto?=
 =?utf-8?B?SkRCUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae2da87-29ee-4c7d-9f9e-08d8c379e1b9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 10:45:52.4279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmzGeOKAZNxAgzJbM99M13AIcExsf2g48taiJUPXabNse+6hdCyOWkL6/c8U4yar
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2481
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDEuMjEgdW0gMTA6NTMgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBGcm9tOiBNaWNo
ZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPgo+IFdpdGhvdXQgX19HRlBfTk9XQVJO
LCBhdHRlbXB0cyBhdCBhbGxvY2F0aW5nIGh1Z2UgcGFnZXMgY2FuIHRyaWdnZXIKPiBkbWVzZyBz
cGxhdHMgbGlrZSBiZWxvdyAod2hpY2ggYXJlIGVzc2VudGlhbGx5IG5vaXNlLCBzaW5jZSBUVE0g
ZmFsbHMKPiBiYWNrIHRvIG5vcm1hbCBwYWdlcyBpZiBpdCBjYW4ndCBnZXQgYSBodWdlIG9uZSku
Cj4KPiBbIDk1NTYuNzEwMjQxXSBjbGluZm86IHBhZ2UgYWxsb2NhdGlvbiBmYWlsdXJlOiBvcmRl
cjo5LCBtb2RlOjB4MTk0ZGMyKEdGUF9ISUdIVVNFUnxfX0dGUF9SRVRSWV9NQVlGQUlMfF9fR0ZQ
X05PUkVUUll8X19HRlBfWkVST3xfX0dGUF9OT01FTUFMTE9DKSwgbm9kZW1hc2s9KG51bGwpLGNw
dXNldD11c2VyLnNsaWNlLG1lbXNfYWxsb3dlZD0wCj4gWyA5NTU2LjcxMDI1OV0gQ1BVOiAxIFBJ
RDogNDcwODIxIENvbW06IGNsaW5mbyBUYWludGVkOiBHICAgICAgICAgICAgRSAgICAgNS4xMC4x
MCsgIzQKPiBbIDk1NTYuNzEwMjY0XSBIYXJkd2FyZSBuYW1lOiBNaWNyby1TdGFyIEludGVybmF0
aW9uYWwgQ28uLCBMdGQuIE1TLTdBMzQvQjM1MCBUT01BSEFXSyAoTVMtN0EzNCksIEJJT1MgMS5P
UiAxMS8yOS8yMDE5Cj4gWyA5NTU2LjcxMDI2OF0gQ2FsbCBUcmFjZToKPiBbIDk1NTYuNzEwMjgx
XSAgZHVtcF9zdGFjaysweDZiLzB4ODMKPiBbIDk1NTYuNzEwMjg4XSAgd2Fybl9hbGxvYy5jb2xk
KzB4N2IvMHhkZgo+IFsgOTU1Ni43MTAyOTddICA/IF9fYWxsb2NfcGFnZXNfZGlyZWN0X2NvbXBh
Y3QrMHgxMzcvMHgxNTAKPiBbIDk1NTYuNzEwMzAzXSAgX19hbGxvY19wYWdlc19zbG93cGF0aC5j
b25zdHByb3AuMCsweGMxYi8weGM1MAo+IFsgOTU1Ni43MTAzMTJdICBfX2FsbG9jX3BhZ2VzX25v
ZGVtYXNrKzB4MmVjLzB4MzIwCj4gWyA5NTU2LjcxMDMyNV0gIHR0bV9wb29sX2FsbG9jKzB4MmU0
LzB4NWUwIFt0dG1dCj4gWyA5NTU2LjcxMDMzMl0gID8ga3ZtYWxsb2Nfbm9kZSsweDQ2LzB4ODAK
PiBbIDk1NTYuNzEwMzQxXSAgdHRtX3R0X3BvcHVsYXRlKzB4MzcvMHhlMCBbdHRtXQo+IFsgOTU1
Ni43MTAzNTBdICB0dG1fYm9faGFuZGxlX21vdmVfbWVtKzB4MTQyLzB4MTgwIFt0dG1dCj4gWyA5
NTU2LjcxMDM1OV0gIHR0bV9ib192YWxpZGF0ZSsweDExZC8weDE5MCBbdHRtXQo+IFsgOTU1Ni43
MTAzOTFdICA/IGRybV92bWFfb2Zmc2V0X2FkZCsweDJmLzB4NjAgW2RybV0KPiBbIDk1NTYuNzEw
Mzk5XSAgdHRtX2JvX2luaXRfcmVzZXJ2ZWQrMHgyYTcvMHgzMjAgW3R0bV0KPiBbIDk1NTYuNzEw
NTI5XSAgYW1kZ3B1X2JvX2RvX2NyZWF0ZSsweDFiOC8weDUwMCBbYW1kZ3B1XQo+IFsgOTU1Ni43
MTA2NTddICA/IGFtZGdwdV9ib19zdWJ0cmFjdF9waW5fc2l6ZSsweDYwLzB4NjAgW2FtZGdwdV0K
PiBbIDk1NTYuNzEwNjYzXSAgPyBnZXRfcGFnZV9mcm9tX2ZyZWVsaXN0KzB4MTFmOS8weDE0NTAK
PiBbIDk1NTYuNzEwNzg5XSAgYW1kZ3B1X2JvX2NyZWF0ZSsweDQwLzB4MjcwIFthbWRncHVdCj4g
WyA5NTU2LjcxMDc5N10gID8gX3Jhd19zcGluX3VubG9jaysweDE2LzB4MzAKPiBbIDk1NTYuNzEw
OTI3XSAgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwrMHgxMjMvMHgzMTAgW2FtZGdwdV0KPiBbIDk1
NTYuNzExMDYyXSAgPyBhbWRncHVfZ2VtX2ZvcmNlX3JlbGVhc2UrMHgxNTAvMHgxNTAgW2FtZGdw
dV0KPiBbIDk1NTYuNzExMDk4XSAgZHJtX2lvY3RsX2tlcm5lbCsweGFhLzB4ZjAgW2RybV0KPiBb
IDk1NTYuNzExMTMzXSAgZHJtX2lvY3RsKzB4MjBmLzB4M2EwIFtkcm1dCj4gWyA5NTU2LjcxMTI2
N10gID8gYW1kZ3B1X2dlbV9mb3JjZV9yZWxlYXNlKzB4MTUwLzB4MTUwIFthbWRncHVdCj4gWyA5
NTU2LjcxMTI3Nl0gID8gcHJlZW1wdF9jb3VudF9zdWIrMHg5Yi8weGQwCj4gWyA5NTU2LjcxMTQw
NF0gIGFtZGdwdV9kcm1faW9jdGwrMHg0OS8weDgwIFthbWRncHVdCj4gWyA5NTU2LjcxMTQxMV0g
IF9feDY0X3N5c19pb2N0bCsweDgzLzB4YjAKPiBbIDk1NTYuNzExNDE3XSAgZG9fc3lzY2FsbF82
NCsweDMzLzB4ODAKPiBbIDk1NTYuNzExNDIxXSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2Zy
YW1lKzB4NDQvMHhhOQo+Cj4gRml4ZXM6IGJmOWVlZTI0OWFjMiAoImRybS90dG06IHN0b3AgdXNp
bmcgR0ZQX1RSQU5TSFVHRV9MSUdIVCIpCj4gU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIg
PG1kYWVuemVyQHJlZGhhdC5jb20+CgpZb3UgaGF2ZSBiZWVuIGZhc3RlciB0aGFuIG1lIHR5cGlu
ZyB0aGF0IGRvd24gOikKClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+CgpUaGFua3MgZm9yIHRoZSBoZWxwLApDaHJpc3RpYW4uCgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5j
Cj4gaW5kZXggOGM3NjJhMDNhZDhhLi5hMjY0NzYwY2IyY2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cG9vbC5jCj4gQEAgLTg0LDcgKzg0LDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlICp0dG1fcG9vbF9h
bGxvY19wYWdlKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwgZ2ZwX3QgZ2ZwX2ZsYWdzLAo+ICAgCSAq
IHB1dF9wYWdlKCkgb24gYSBUVE0gYWxsb2NhdGVkIHBhZ2UgaXMgaWxsZWdhbC4KPiAgIAkgKi8K
PiAgIAlpZiAob3JkZXIpCj4gLQkJZ2ZwX2ZsYWdzIHw9IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dG
UF9OT1JFVFJZIHwKPiArCQlnZnBfZmxhZ3MgfD0gX19HRlBfTk9NRU1BTExPQyB8IF9fR0ZQX05P
UkVUUlkgfCBfX0dGUF9OT1dBUk4gfAo+ICAgCQkJX19HRlBfS1NXQVBEX1JFQ0xBSU07Cj4gICAK
PiAgIAlpZiAoIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
