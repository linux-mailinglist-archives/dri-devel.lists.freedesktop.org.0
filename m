Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A531FF4C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 20:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD2D6EB92;
	Fri, 19 Feb 2021 19:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406EA6EB92;
 Fri, 19 Feb 2021 19:17:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3pGiML0+XxAZ9Dxillt7R5GRoMQgyydMEF0/KQ/M8VCloA4OnaXKDounJe8gmNshrwqEpwdIJLJKAX33TJ6+e4XYGeFPb5zSKCmgadx9SlLkYtZW/WLjeMxs1rB0PSn811NzCSf7CiWxhGzvaglsz7MysCaiYjvaWbYD4Z/WNqJywmFqKsO4PyeBo/J2rGZV1oF4AYdCGN6JWA30xcaygt6NLcggIaIrFh38Pyoc4gyFjjvpUAeGW70QMApT2i7AjZqqqhJpi24J3vk4KKkBt6X1UpJcMf/4CCaPXnofZJOt+ayYFTalMRhGyyMo4CnYbujxWVFECTQYP6LsuICXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOvvLUpvjMoANVqLNyaLiPo3BuXWx9CLlCLAfcbPh3Q=;
 b=ZKb+aywfx4+IhsmiB8pcuVpQGrjziIfL8XAGUU/jaOhJOjt9Cd9n06DMg9HFNQNObGjj5u6zl+uGLmMsCJWs4PamSSFTmy0Zg/EJ9zCbEH/PaJXvwgV9Fgo3/h6i7B+FJpwZ64Xc1CsOdcxpApCGEZL4LAJrDIQ+aLdUg5tgUWcdJ70guwGHlVuizg5sX0nqfSbnxflRnrG2QQfdyN/q2gH4jTzu3aIW4tQjcBNwP6nWTvmbguBbavX2XX4J3KV7StNJAeI1VLQBiu16yaGMAgSE8Tr4XsXLib5WxQiIIyWLsUQhk2C8ueiPLMox11hKyxROWyx7/tPshtJ+H9N4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOvvLUpvjMoANVqLNyaLiPo3BuXWx9CLlCLAfcbPh3Q=;
 b=rlXqtEiiplrjZ9qjYLKjKyOWGyBwxaUqHY7Gd/ehG5GOHIrin170+F/zxVLPcDkHEs11kUMjsYN2YmtMOig+/qNJnf8gr9COGj/Vo4g1Wrm2zsphFiaoi6A7pOU2CP2G3TuddZzE7eW6mpuiZBeRtX2vmA+hVtCzcRbgMZko1xA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2400.namprd12.prod.outlook.com (2603:10b6:802:2f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Fri, 19 Feb
 2021 19:17:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Fri, 19 Feb 2021
 19:17:56 +0000
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
 <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
Message-ID: <2a8d6247-998e-5a1d-63ca-2f1fa43a4b42@amd.com>
Date: Fri, 19 Feb 2021 14:17:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:a769:bad8:a0a7:90ae]
X-ClientProxiedBy: YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:a769:bad8:a0a7:90ae]
 (2607:fea8:3edf:49b0:a769:bad8:a0a7:90ae) by
 YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.35 via Frontend
 Transport; Fri, 19 Feb 2021 19:17:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cff20348-7287-4e8e-c700-08d8d50b1005
X-MS-TrafficTypeDiagnostic: SN1PR12MB2400:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2400274AA4045B7551AEEE2FEA849@SN1PR12MB2400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MOluuXJrZ5QSlOemJAj1q6G0w7VwAoWR5OVBaxQXssWgjE7ztkyIl3jnIS0ZURCIG9s34IQ9vcccnh45Of+a05WeRZREZrRWsZpgHkdKEJa/pMe0efMEhXQDFNUrxwPjT7xvsvezPzF0A38PSHQjv2sKg8vnGY8g5BDBxfiE6Gvqo1f0Npyz0PDGwhIhq1regbCfM/DPuF3mKPbgiOQZ4G8jb+imi1Z0YK+pC6ja2Mh8ZzYg6p5UlQba2/b71V4sE7YTc8a5WE5OjVnLATZITKWgezEQYRWR8faQSpIEQZaizL1MhWfMWMO7FVGNf88QpyXG/eQhMd6htANlVonqOlPgZLeMwDOjh20++ubpqF9/riVC4KaiaXc0pvi4VekEzLR/6lRSR4s5EYSu4RlITpZov3bq5yIYCOnzKI7CpiT5TDkMiaYDAqMG0VyHJrb4pnPXQ6aq2vf6apkyNNhtknaNDLM6MoeopJU4sjBJL3JlqpiKRzEdcDE6/IBJgB3gYo01ePUumfQP3RHasMtiJHn8/rodP8/z4csnjypIRKiklN4Go2Y6iQuc+jw3eO48kYG6Bif9C4YihICgEeZguGoN3GjyNpLaAfCGjSIzLjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(86362001)(52116002)(66574015)(83380400001)(8936002)(66476007)(6486002)(186003)(16526019)(316002)(5660300002)(66556008)(66946007)(8676002)(2616005)(2906002)(36756003)(478600001)(31686004)(53546011)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0hSQWo2R3RpNUpUM1cyNE5wcVFkSjdJUzlEVDVvWERrTXdYdWcvd2p3ZzFG?=
 =?utf-8?B?VlJSajZ1eXhSTzlRdHYxTlNidFVPbnJKWHl0NjQ1TStmdTZDWVpsa3BnT2Jh?=
 =?utf-8?B?bDQxOU5XYWJtWklNTEtFSTBnTVVpWjFTaWUwc3dzdzlSN3JnMDdmV1RmZDVt?=
 =?utf-8?B?WTVrVlJTVmp2V1Q3VTdkVGlWQ1RPemtUbTNXcWRWaWM2cHhOMkZhU2s2Wi9u?=
 =?utf-8?B?a2pkQTQwTnV6TW1Ya3pZaVdNMDR3cEJ2U1hLTlpzUGllZDVsbUhlRjdoUVZz?=
 =?utf-8?B?Zk10cmlMOEFDa2hlazBLejhDV3VrWGg5cXdjcmdzMVlEQ3lrUndrL0RzWmRK?=
 =?utf-8?B?RWIyZThKemN0M1BKR0o5VStGV1pWQzM0M1lSOUhXTzE2c2lNVWxpZmd5S2dr?=
 =?utf-8?B?UEFDZEZnL0VUeWlyY3lDRkJObVBnUGVtUVFxUjh2VHZNclkvUyt6QkhjSm04?=
 =?utf-8?B?czA0SU5GZnBrYm5HV2VhMXR3eEhsTUdqZWwzalh4aUJ2ZmRZVHdBWjhWUEJL?=
 =?utf-8?B?QlJsdWt0WDFTekhHUUxqb2xLNTBtZFhtZXY2T0V3QmwzWlJJcnhCT0Jod2R6?=
 =?utf-8?B?Sy9WbUk0VXg5U3dhRlo1VkpGUUVpeDFJajk5U2REYnVGZGZQaGtJVnJhOXI3?=
 =?utf-8?B?b2IybHpJb3I1VVVVWGEyWXArbnRYZ0R1Zmw1UnlVTzdLcFlBSkZpdjRGSFRM?=
 =?utf-8?B?a0R0bFFoQU1SV0k3czVQeG91T0J5VUhGZDJ0Q1IxNmNXZnVmRU1lT2Z5b3I0?=
 =?utf-8?B?Z0ZmZjhHc3BJN0xmc3pkZ3dNSVdHaklhYlEzYmhvR2xzZUhmMXZKdWlseFBl?=
 =?utf-8?B?dXhZVVlsbmhYV2x1ckNmcGJIWXR4NE9GNnFHcTcrcld1WHJKRk50QW1ZRGI4?=
 =?utf-8?B?b3psMVgwUXc2MVZMMzFEQkpESDNpbmZHbEJ4T0Nsd2k4dUlTN2JJcUdkQ2Np?=
 =?utf-8?B?aCtCU0dPSkU1bC9CUHlmY1FNNG03dnhsRU9waVNlMlF2Z2gzSzlyMzVSMkR0?=
 =?utf-8?B?bzdValZEZG9SZC9IcnpoM3BQbDRJS3VqOE9mMnBFN3ppUDQyTW1kN1hvY2du?=
 =?utf-8?B?cUJ0WlVNUEVSU21MY1kwNm5nWm1Kazd5WEdWbkRWSDcyRHNpNkx0OE40Z0o3?=
 =?utf-8?B?SVBFVWVYOTdjUkNNamJIRVE0cWpJMlNZWWtJUUFHM3FQeDdvUHl3YWcvcS9q?=
 =?utf-8?B?YnQ5UDF6MklvNFk0ejgvb0IxZk50SWNPR0tyZ2lxcjZSSHZ5S2lGSE9PS2xa?=
 =?utf-8?B?MHJlWnJPc2VRaUZWbkp5MHhqTWtsR1pubytuQXMrNDM3TituL2lqdnh0dHl6?=
 =?utf-8?B?MGswTlVRZ1ZHcjhNZG1Pbit2bzdheGpiNWloRklqQm1SWS9ZQWRGN2h2Ky94?=
 =?utf-8?B?R3REbHlpMWVpTVZwS3VrTlVCK0wzK0lLQUpEZ2J6T2I2M3lzdnhzOHVDN21G?=
 =?utf-8?B?SkUrN0NCVDhLcWFFQjZTUVlzNHU4V1pRQ1FXay9DZVJINWpGNVBvdnF1bjkx?=
 =?utf-8?B?L1VVaW5Pb3FsckwweVNXOTNGZ2dBdStZdmI0NWpmUDJrUjgvN3BNdHhSOUMr?=
 =?utf-8?B?MFBkVndQS0Zpb0JSekp3STJXVkgvNDE0WThFK1dCN0I2L25WVy94dkU2eGk5?=
 =?utf-8?B?a3U0SDhtTG9JS2xPbnZjdmp5b04wYysvT2Q5VGR3RXRrbmEyR2pmMUNKdDgw?=
 =?utf-8?B?S1VITnFWbjB6UlNyV3czUlBXNHM1cUJoUHJjZEF2aGdMYThKeHNDZ2crVmo1?=
 =?utf-8?B?WVR4emZYMGlzSUZONjZSdjZGQi9POSt5Z0pIcmtUb3NIcVcveWhTd0lzSlNX?=
 =?utf-8?B?K2hjMFFFWGZsVGVkemthSkQrTzVBcWxVVUVUQWsxLzBoZUJzbndjOFMxTWpq?=
 =?utf-8?Q?XmxrI0MRLSoun?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff20348-7287-4e8e-c700-08d8d50b1005
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 19:17:56.4215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uifXZDEk1hNGL3DpobqQ0vHsIxXIscpltieDMpC45EIg+KhCbXfZk3N6oV8dRldKpKzeY0d0+8iOmopB+4LSdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2400
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

UGluZwoKQW5kcmV5CgpPbiAyLzE4LzIxIDExOjQxIEFNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90
ZToKPgo+IE9uIDIvMTgvMjEgMTA6MTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFt
IDE4LjAyLjIxIHVtIDE2OjA1IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pgo+Pj4gT24g
Mi8xOC8yMSAzOjA3IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBB
bSAxNy4wMi4yMSB1bSAyMjo1OSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+PiBQcm9i
bGVtOiBJZiBzY2hlZHVsZXIgaXMgYWxyZWFkeSBzdG9wcGVkIGJ5IHRoZSB0aW1lIHNjaGVkX2Vu
dGl0eQo+Pj4+PiBpcyByZWxlYXNlZCBhbmQgZW50aXR5J3Mgam9iX3F1ZXVlIG5vdCBlbXB0eSBJ
IGVuY291bnRyZWQKPj4+Pj4gYSBoYW5nIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2guIFRoaXMg
aXMgYmVjYXVzZSBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+Pj4gbmV2ZXIgYmVjb21lcyBm
YWxzZS4KPj4+Pj4KPj4+Pj4gRml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVk
X2VudGl0aWVzIGZyb20gdGhlCj4+Pj4+IHNjaGVkdWxlcidzIHJ1biBxdWV1ZXMuIFRoaXMgd2ls
bCBzYXRpc2Z5IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZS4KPj4+Pj4gQWxzbyB3YWtldXAgYWxs
IHRob3NlIHByb2Nlc3NlcyBzdHVjayBpbiBzY2hlZF9lbnRpdHkgZmx1c2hpbmcKPj4+Pj4gYXMg
dGhlIHNjaGVkdWxlciBtYWluIHRocmVhZCB3aGljaCB3YWtlcyB0aGVtIHVwIGlzIHN0b3BwZWQg
Ynkgbm93Lgo+Pj4+Pgo+Pj4+PiB2MjoKPj4+Pj4gUmV2ZXJzZSBvcmRlciBvZiBkcm1fc2NoZWRf
cnFfcmVtb3ZlX2VudGl0eSBhbmQgbWFya2luZwo+Pj4+PiBzX2VudGl0eSBhcyBzdG9wcGVkIHRv
IHByZXZlbnQgcmVpbnNlcmlvbiBiYWNrIHRvIHJxIGR1ZQo+Pj4+PiB0byByYWNlLgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lA
YW1kLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgCj4+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+Pj4gaW5kZXggOTA4YjBiNS4uYzZiNzk0
NyAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWlu
LmMKPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+
Pj4gQEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+
Pj4+IMKgwqAgKi8KPj4+Pj4gwqAgdm9pZCBkcm1fc2NoZWRfZmluaShzdHJ1Y3QgZHJtX2dwdV9z
Y2hlZHVsZXIgKnNjaGVkKQo+Pj4+PiDCoCB7Cj4+Pj4+ICvCoMKgwqAgaW50IGk7Cj4+Pj4+ICvC
oMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKnNfZW50aXR5Owo+Pj4+Cj4+Pj4gQlRXOiBQ
bGVhc2Ugb3JkZXIgdGhhdCBzbyB0aGF0IGkgaXMgZGVjbGFyZWQgbGFzdC4KPj4+Pgo+Pj4+PiDC
oMKgwqDCoMKgIGlmIChzY2hlZC0+dGhyZWFkKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAga3Ro
cmVhZF9zdG9wKHNjaGVkLT50aHJlYWQpOwo+Pj4+PiDCoCArwqDCoMKgIC8qIERldGFjaCBhbGwg
c2NoZWRfZW50aXRlcyBmcm9tIHRoaXMgc2NoZWR1bGVyIG9uY2UgaXQncyBzdG9wcGVkICovCj4+
Pj4+ICvCoMKgwqAgZm9yIChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSBE
Uk1fU0NIRURfUFJJT1JJVFlfTUlOOyAKPj4+Pj4gaS0tKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycSA9ICZzY2hlZC0+c2NoZWRfcnFbaV07Cj4+Pj4+ICsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghcnEpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRpbnVlOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBMb29wIHRoaXMg
d2F5IGJlY2F1c2UgcnEtPmxvY2sgaXMgdGFrZW4gaW4gCj4+Pj4+IGRybV9zY2hlZF9ycV9yZW1v
dmVfZW50aXR5ICovCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHdoaWxlICgoc19lbnRpdHkgPSBsaXN0X2ZpcnN0X2VudHJ5
X29yX251bGwoJnJxLT5lbnRpdGllcywKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZW50
aXR5LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbGlzdCkpKSB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNwaW5fdW5sb2NrKCZycS0+bG9jayk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLyogUHJldmVudCByZWluc2VydGlvbiBhbmQgcmVtb3ZlICovCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmc19lbnRpdHktPnJxX2xvY2spOwo+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzX2VudGl0eS0+c3RvcHBlZCA9IHRydWU7Cj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KHJxLCBzX2VudGl0
eSk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZzX2VudGl0eS0+
cnFfbG9jayk7Cj4+Pj4KPj4+PiBXZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBkYW5jZSBoZXJl
IGRvZXNuJ3QgbG9vayBjb3JyZWN0IGF0IGFsbCBub3cuCj4+Pj4KPj4+PiBDaHJpc3RpYW4uCj4+
Pgo+Pj4KPj4+IEluIHdoYXQgd2F5ID8gSXQncyBpbiB0aGUgc2FtZSBzYW1lIG9yZGVyIGFzIGlu
IG90aGVyIGNhbGwgc2l0ZXMgKHNlZSAKPj4+IGRybV9zY2hlZF9lbnRpdHlfcHVzaF9qb2IgYW5k
IGRybV9zY2hlZF9lbnRpdHlfZmx1c2gpLgo+Pj4gSWYgaSBqdXN0IGxvY2tlZCBycS0+bG9jayBh
bmQgZGlkIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSB3aGlsZSBtYW51YWxseSAKPj4+IGRlbGV0
aW5nIGVudGl0eS0+bGlzdCBpbnN0ZWFkIG9mIGNhbGxpbmcKPj4+IGRybV9zY2hlZF9ycV9yZW1v
dmVfZW50aXR5IHRoaXMgc3RpbGwgd291bGQgbm90IGJlIHBvc3NpYmxlIGFzIHRoZSBvcmRlciBv
ZiAKPj4+IGxvY2sgYWNxdWlzaXRpb24gYmV0d2VlbsKgIHNfZW50aXR5LT5ycV9sb2NrCj4+PiBh
bmQgcnEtPmxvY2sgd291bGQgYmUgcmV2ZXJzZSBjb21wYXJlZCB0byB0aGUgY2FsbCBzaXRlcyBt
ZW50aW9uZWQgYWJvdmUuCj4+Cj4+IEFoLCBub3cgSSB1bmRlcnN0YW5kLiBZb3UgbmVlZCB0aGlz
IGJlY2F1c2UgZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkoKSB3aWxsIAo+PiBncmFiIHRoZSBy
cSBsb2NrIGFnYWluIQo+Pgo+PiBQcm9ibGVtIGlzIG5vdyB3aGF0IHByZXZlbnRzIHRoZSBlbnRp
dHkgZnJvbSBiZWluZyBkZXN0cm95ZWQgd2hpbGUgeW91IHJlbW92ZSAKPj4gaXQ/Cj4+Cj4+IENo
cmlzdGlhbi4KPgo+IFJpZ2h0LCB3ZWxsLCBzaW5jZSAodW5mb3J0dW5hdGVseSkgc2NoZWRfZW50
aXR5IGlzIHBhcnQgb2YgYW1kZ3B1X2N0eF9lbnRpdHkgCj4gYW5kIGFtZGdwdV9jdHhfZW50aXR5
IGlzIHJlZmNvdW50ZWQKPiB0aGVyZSBpcyBhIHByb2JsZW0gaGVyZSB0aGF0IHdlIGRvbid0IGlu
Y3JlbWVudCBhbWRncHVfY3R4LnJlZmNvdW50IHdoZW4gCj4gYXNzaWduaW5nwqAgc2NoZWRfZW50
aXR5Cj4gdG8gbmV3IHJxIChlLmcuIGJlZm9yZSBkcm1fc2NoZWRfcnFfYWRkX2VudGl0eSkgYW5k
IG5vdCBkZWNyZW1lbnQgYmVmb3JlIAo+IHJlbW92aW5nLiBXZSBkbyBpdCBmb3IKPiBhbWRncHVf
Y3NfcGFyc2VyLmVudGl0eSBmb3IgZXhhbXBsZSAoaW4gYW1kZ3B1X2NzX3BhcnNlcl9pbml0IGFu
ZCAKPiBhbWRncHVfY3NfcGFyc2VyX2ZpbmkgYnkKPiBjYWxsaW5nIGFtZGdwdV9jdHhfZ2V0IGFu
ZCBhbWRncHVfY3R4X3B1dCkuIEJ1dCB0aGlzIHNlZW1zIGEgYml0IHRyaWNreSBkdWUgdG8gCj4g
YWxsIHRoZSBkcm1fc2NoZWRfZW50aXR5X3NlbGVjdF9ycQo+IGxvZ2ljLgo+Cj4gQW5vdGhlciwg
a2luZCBvZiBhIGJhbmQgYWlkIGZpeCwgd291bGQgcHJvYmFibHkgYmUganVzdCBsb2NraW5nIAo+
IGFtZGdwdV9jdHhfbWdyLmxvY2sgYXJvdW5kIGRybV9zY2hlZF9maW5pCj4gd2hlbiBmaW5hbGl6
aW5nIHRoZSBmZW5jZSBkcml2ZXIgYW5kIGFyb3VuZCBpZHIgaXRlcmF0aW9uIGluIAo+IGFtZGdw
dV9jdHhfbWdyX2ZpbmkgKHdoaWNoIHNob3VsZCBiZSBsb2NrIHByb3RlY3RlZAo+IGFueXdheSBh
cyBJIHNlZSBmcm9tIG90aGVyIGlkciB1c2FnZXMgaW4gdGhlIGNvZGUpIC4uLiBUaGlzIHNob3Vs
ZCBwcmV2ZW50IAo+IHRoaXMgdXNlIGFmdGVyIGZyZWUuCj4KPiBBbmRyZXkKPgo+Cj4+Cj4+Pgo+
Pj4gQW5kcmV5Cj4+Pgo+Pj4KPj4+Cj4+Pj4KPj4+Pj4gKwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZycS0+bG9jayk7Cj4+Pj4+ICsKPj4+Pj4g
K8KgwqDCoCB9Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCAvKiBXYWtldXAgZXZlcnlvbmUgc3R1Y2sg
aW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBmb3IgdGhpcyBzY2hlZHVsZXIgKi8KPj4+Pj4gK8Kg
wqDCoCB3YWtlX3VwX2FsbCgmc2NoZWQtPmpvYl9zY2hlZHVsZWQpOwo+Pj4+PiArCj4+Pj4+IMKg
wqDCoMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2Ug
c3RydWN0dXJlcyAqLwo+Pj4+PiDCoMKgwqDCoMKgIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygm
c2NoZWQtPndvcmtfdGRyKTsKPj4+Pgo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
