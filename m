Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA7343ACE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 08:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301616E3E5;
	Mon, 22 Mar 2021 07:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B036E3E3;
 Mon, 22 Mar 2021 07:40:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adZq1ZiiNQKyJUTQOxjZcqejNwfbBBh3j+u0FNfwLf6488kkf7a4+v3ggVoyp6ulKS9i6DaTB6tn8IsvpHnswLw3nBxH51JnvaCrVXt/gq7Lu2jl7NsPZ4NSLGacqCUUD+CZnFadAsy7izP+m0tyIN5VHwqSrSvdC76C05aeqV+rIoCFaAi9lqExZMDWWEmjHzHTFbZ/mtEBvpj1ejj6Sjb/8cjWNF413L9TNhh9IL006wdNht3N6PbzEdSJpF9XI/aKhvRjLYbYSpfj6KaaJzxFZwCIMyTuZLi/GGc/PSseQOQ2t3XNG+JsBy8l25ARUp5SPdhjl1UO+3uIPL/YZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKFIcEkCTVtadf7yiLbe8kqzTRHCS+Seg7bUjJ/Zs8s=;
 b=AF3Jhm6cbiBA6sf+SYjYKRWxmBaI6j2fECCkBik/bC72mGF2XdpBEEoBx0J/J09DHNGCrygS7/fDXxUe1a4h8XCFudI5GxkhaqWd5fkxQdPdJ0KSSYUvfd50N+/gKcZy+3z37hOof/ah3Id8xSV39WVGi9hUF//2IGguh4MT0KWRSsI91BgrQHU8D9KrQs7v04U+/3mE5EI2fUM3SEV5lvCWOaa7g2QyqzDsH1A0y3XbpzTuGU3G9fUb5VwPCcn5LoJuw2v2TZT+7/607fJcA5GI9PVF1CvTOkY2Zev/ZFu2RG8gJTtfE5uxl/YL8FEaklGJ7i3nN+tKUsR68JGB5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKFIcEkCTVtadf7yiLbe8kqzTRHCS+Seg7bUjJ/Zs8s=;
 b=gRSJ0CQoIIUOBBCQ+svLjsPptVRgOzole04C9qwRHhC6px9UxIlSLfRaiMWaIi3Qn7aCEVjRQzesPqy5k3eQ6q+pR+/YpTRlKZq5hjY7CoR6sQ9VMP7y1l3pQ6fmneeDcjGDgo8d5cUHrVvwpnwUM261Xmzu15x5ikZYaMN1dhU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Mon, 22 Mar
 2021 07:40:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 07:40:53 +0000
Subject: Re: [PATCH v2] drm/radeon: don't evict if not initialized
To: Tong Zhang <ztong0001@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210321151907.367586-1-ztong0001@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <259c234f-ca6a-7f9a-8df1-69055f2fc1b6@amd.com>
Date: Mon, 22 Mar 2021 08:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210321151907.367586-1-ztong0001@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
X-ClientProxiedBy: AM0PR05CA0084.eurprd05.prod.outlook.com
 (2603:10a6:208:136::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e345:6f8e:fa4b:2c52]
 (2a02:908:1252:fb60:e345:6f8e:fa4b:2c52) by
 AM0PR05CA0084.eurprd05.prod.outlook.com (2603:10a6:208:136::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 07:40:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2d96178c-1e47-46f7-2014-08d8ed05d0e7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4048B4D3EF6CF20DC5C0796F83659@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: drYmQrcW48AeYgUcaJBakhis6LhPmoR/KFKyzyrP5JCwB7mrD1hw/suaeINMv3ryVvaHMDYv45+0fZhEadmRWsHxGfK++5dOPB9MA7URYwwmahftwFid2Mb7bE+dEL65CilF4zlLJYt1jqCSRwtSJZHen7uEqp32gDG4Y0l0eQh15QfUw39jZ+OJF3sFqBMnPQtkywig/48lCZgZylIgJMqR13Bi4jkR03cV0YEc4PmEvqbDpl0ST42A/KD3ehuK1RXuKlc+r1ZfMWv/UCDzUk3IrD9VuG5M6ykXcyAk/EexAfYshkCvsy2ZjuiX0krBqQq5wrJT1zWdy/bdSXHBMo2LJRG6pdtX2ZAExsvVH4EiwPlabboM6GNH1yRdRXibhiS2pCRgf5pfrAFxhyM2/TMpsmN1uvuc/AUXz/LosHgEMY6Gj+6FVk1hxy8ghmKz9MpEqamQ3wfeRd2bnRr58/he9MUW7R/O43RuVwCVvA0IY5E+bLBJb6+O4wexUMqUu8so5D7nTKfImUmvgN0Dl0eiQSDjzTq/bRT5fMUF179nN+q7WfTKXqYf3ZdTvjVxkO13rZlfvYSI6P2BNCCUee7ubDwhzRsFNRXkTLVzD81IagyJh1goSdnGH9xYMcu/83vcS2TJbzc6ZqD3vYAQ8PGZgNn0m2AHxvwDFHdiGL2Lmtv5F/kUqM3ugA5YA3H8ZE4bUVsTrtbPIU3wZH0lWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(66556008)(36756003)(38100700001)(478600001)(186003)(66946007)(52116002)(16526019)(86362001)(8676002)(5660300002)(8936002)(66476007)(83380400001)(2906002)(316002)(6666004)(31696002)(66574015)(110136005)(2616005)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWlrVVZDbFZKWW5tUFJBcHluV09MQVJ2dWhDa3Z1dmtQQVB5SjRUaUdibm44?=
 =?utf-8?B?S0NQbEZna283UDAwZjZVZFg3VXRCd01SVzFLU2svQlN0TVdCNlpSb2lNb2JL?=
 =?utf-8?B?cFAxblh6VWhDWnk1QzZBeU9BVWU4SzdocnEydzdMQnQ1TnJobWlVenhNdDUw?=
 =?utf-8?B?VzYxemQ3OEhxNXZSdm56YnRVV1RlQ25vYkhKR2ppUUpmL2JZNFc3M1JWQ2d2?=
 =?utf-8?B?M0g0SW9xM2UvZm9RTDJWZTlvc2JHcVBuSm53WHBCSUZ3d3ppSGg0aWtUZVVM?=
 =?utf-8?B?d3JpdUNNTUpkYUtwLy9EbmZPaWdEQnFWOVp3MHgxdnR4U2x6SXVDMkJoMVlU?=
 =?utf-8?B?Y3FsaEJhU2h3RUVrOXhpOG9Id1hzaTFRdmt3Y1d6cy95NzNVR1dWekJlVERE?=
 =?utf-8?B?eDFXZUtDY1cxaUtsUmxlNWNjclZweUQrZ0o2WnovVXlqVGRRQVhVajBGVTFY?=
 =?utf-8?B?alJXNmx5ckNRbW02bnY5Y05hYmI1N041Y1JFckczanlTU1pmK3pWTEdFdzdZ?=
 =?utf-8?B?Q2ZhVWJpVmZqK1pYM2duU3I5cTVIT0NrdWVxQlBEaW5oQ1YyRnJHYUU0YWtW?=
 =?utf-8?B?T1Rra29EaHlTQXAwTTV0QkVJVkF0SXE1M0ZiMGFMNloyUUNzUTVTZkxSSjVY?=
 =?utf-8?B?bzRyTmtveE9kdFZ3bjNoVEdjU3BMR04yOWxkZ3ZyNURjamYvTHNkWVBvTVM4?=
 =?utf-8?B?ZG1vY2ZQUXR4bGFjbVNUNHJ3bkFlY1NPUCszdGs3TFN5akFNWXVNTlh0a0I5?=
 =?utf-8?B?YWZITlBETkFQUFc5bUZWelBWeHd3SVV4ZWFJVTNKbTdsSEZMUmZqdWlkNW1I?=
 =?utf-8?B?Z0MvaXd2MllGZ2xkbDFOQUdxOFFFaXFnMzB3T2dubDhrT2RjNTNrUk8vN216?=
 =?utf-8?B?NWUxZWdlRzhnWVhlb2tuU1BXc2ZXMkQ2K0xETXRKdGVmejFxZVdrWHpuenNt?=
 =?utf-8?B?S0JsL2pKN0txNUNZbWw3UG12OE9xano1RlFyaHNLN3Q0R1JHTUlwMzluYkhD?=
 =?utf-8?B?SExMelI0TGtLU09PNFNHYzF3ZVBhUnpEYTJzbzRaWTZFUG9MeGRYNTVYekV1?=
 =?utf-8?B?NklYcDc4S016VTU5OUZmNjE4ODBYd2psL0lFKzBVNXpmUUpzVW9vTmorRXZ0?=
 =?utf-8?B?TThKODcra3RnTXkzWVlkVE15TlYxcEVicURjT2ZybHRISTdlTDJHS1RmZGUy?=
 =?utf-8?B?L1crN2ZVeUZyZlg1VDJrKy9jNndOcDBadGozc2pYRk8zVFhNVXR1YWJvTlpT?=
 =?utf-8?B?amR2WEN2WkFxZW9RNENaeUNWRWVCaE9PTUZid3hMWC9tSVZYcDhJQjI3RlZT?=
 =?utf-8?B?aDgyNDhxOCt3aGJWa1YwVXpzUUpQUldEQnFUYjd3RVRWTmh5bTh0Rk9rWEJr?=
 =?utf-8?B?UmxTMlF5TStkM0UxMmVNWXVqY2hiTm53eGIvTXhYbzZVeVYzMDNUMnl5T0tJ?=
 =?utf-8?B?YkNtcS9USTR3aXo0Y1h1aGJNRnFLY2RyUmsxZWN4VEJQc2VuN2tQdTJ3ZCth?=
 =?utf-8?B?VTFtNmZsbWs0dU9LaUo2MkF3WTJlQmpyK3ZBZG41dVIya1dXZmJ0Wi9NOTFl?=
 =?utf-8?B?S3VDS0lCWFg2Wjcrc1JmMzhibzFZNmk5YW9QenlpdDZjb0hMRnNiVndrYlNN?=
 =?utf-8?B?L1ZuS3Rodzc0QmlLRWhEb2VDTGdYZk1wMjBBdWdmUnhPUEpvV2NVQlo0OXJ5?=
 =?utf-8?B?VG9TRmx1Qkx5TzZUUEZiSEdtSTJEQ0FBZFg3SG1Nc3BGaUFmbjM2cjlRS2dE?=
 =?utf-8?B?elQreWF2eS90QmhRYnZiZ29KNTBWK3Zxc09iL0tCN2JxTzkzRkNUOVF2N0ZF?=
 =?utf-8?B?M1RvQnBQcEd4S0xwdFFHTHkwTzJjRWwyTVBkb3pHUTBUakVUcENjNjJMeXEy?=
 =?utf-8?Q?UoNO6j/x7QTJg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d96178c-1e47-46f7-2014-08d8ed05d0e7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 07:40:53.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6wReA1elZHla9VRkkz1uCWr1Q0zebwo4uTGAuZD2h5R6YGl/qGo43OvdaqFAFPg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDMuMjEgdW0gMTY6MTkgc2NocmllYiBUb25nIFpoYW5nOgo+IFRUTV9QTF9WUkFNIG1h
eSBub3QgaW5pdGlhbGl6ZWQgYXQgYWxsIHdoZW4gY2FsbGluZwo+IHJhZGVvbl9ib19ldmljdF92
cmFtKCkuIFdlIG5lZWQgdG8gY2hlY2sgYmVmb3JlIGRvaW5nIGV2aWN0aW9uLgo+Cj4gWyAgICAy
LjE2MDgzN10gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAw
MDAwMDAwMDAwMDAwMDIwCj4gWyAgICAyLjE2MTIxMl0gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNj
ZXNzIGluIGtlcm5lbCBtb2RlCj4gWyAgICAyLjE2MTQ5MF0gI1BGOiBlcnJvcl9jb2RlKDB4MDAw
MCkgLSBub3QtcHJlc2VudCBwYWdlCj4gWyAgICAyLjE2MTc2N10gUEdEIDAgUDREIDAKPiBbICAg
IDIuMTYzMDg4XSBSSVA6IDAwMTA6dHRtX3Jlc291cmNlX21hbmFnZXJfZXZpY3RfYWxsKzB4NzAv
MHgxYzAgW3R0bV0KPiBbICAgIDIuMTY4NTA2XSBDYWxsIFRyYWNlOgo+IFsgICAgMi4xNjg2NDFd
ICByYWRlb25fYm9fZXZpY3RfdnJhbSsweDFjLzB4MjAgW3JhZGVvbl0KPiBbICAgIDIuMTY4OTM2
XSAgcmFkZW9uX2RldmljZV9maW5pKzB4MjgvMHhmOSBbcmFkZW9uXQo+IFsgICAgMi4xNjkyMjRd
ICByYWRlb25fZHJpdmVyX3VubG9hZF9rbXMrMHg0NC8weGEwIFtyYWRlb25dCj4gWyAgICAyLjE2
OTUzNF0gIHJhZGVvbl9kcml2ZXJfbG9hZF9rbXMrMHgxNzQvMHgyMTAgW3JhZGVvbl0KPiBbICAg
IDIuMTY5ODQzXSAgZHJtX2Rldl9yZWdpc3RlcisweGQ5LzB4MWMwIFtkcm1dCj4gWyAgICAyLjE3
MDEwNF0gIHJhZGVvbl9wY2lfcHJvYmUrMHgxMTcvMHgxYTAgW3JhZGVvbl0KPgo+IFN1Z2dlc3Rl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IFRvbmcgWmhhbmcgPHp0b25nMDAwMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiB2Mjog
Y29kaW5nIHN0eWxlIGZpeAo+Cj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmpl
Y3QuYyB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5jCj4gaW5kZXggOWI4MTc4Njc4MmRlLi40OTlj
ZTU1ZTM0Y2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2Jq
ZWN0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwo+IEBA
IC0zODQsNiArMzg0LDggQEAgaW50IHJhZGVvbl9ib19ldmljdF92cmFtKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KQo+ICAgCX0KPiAgICNlbmRpZgo+ICAgCW1hbiA9IHR0bV9tYW5hZ2VyX3R5
cGUoYmRldiwgVFRNX1BMX1ZSQU0pOwo+ICsJaWYgKCFtYW4pCj4gKwkJcmV0dXJuIDA7Cj4gICAJ
cmV0dXJuIHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2V2aWN0X2FsbChiZGV2LCBtYW4pOwo+ICAgfQo+
ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
