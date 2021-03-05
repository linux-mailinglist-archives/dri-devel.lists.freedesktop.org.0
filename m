Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6332E6CD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 11:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CBE6E167;
	Fri,  5 Mar 2021 10:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552256E167
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 10:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=he6wWMIKV0u393D06+qNH2ycWR5glErYAHmhAGncTLE1aPIHjiZs3H1Yk6zlfifkOLoJMFtRH8z582J44MemFdU17Jh2xy1hc1rAQkrOhgk0VLC1jIwebPSc5eoBR3tX9Rv8dlVnBTkoHT7t4wFeFkDrjLTpjnYQXrU63M3i6Z2y/99JFT4GYa36v4qzv0tRA1WUV2ElG5Ckqc8NLEjb5M54EdlaKb8TA7pO75B9tGs007QORIEXjF3Hcjjf4EkRRZc0iNSvLK8qnjZ15DUvsSBp6JxPc2cKm3oqEwTL6KdyEPMwltajbgspD8+of7hZWDB3TYGypvd3LT84/p0j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yutnjhDqShW8DLxrGd9ScGtQz5jmqmHBeFLqwhZ8hwY=;
 b=aYsn3/RqWhKk4PcuY0UK1byesUAZCso4DxWyXRjFR63MX7ZjvpShb18LDn659EspCNew/mnUe9TQmHDaV9zFZQaU2qbLCAuh7RVsLbicYoPSZmTGvhobEzDT0VVj/r/+EOkyeKhFF9kZJDIDgeQC4PIlOed8VeN741KGo1rtNY650tc0rT/v4EYzxZ6/JAAO9Fd1sG7fy+eqhs1ayRfMoHZVQIX/dYjY2odSBkDvcjzMu7y0OUiWEd10XGrgPg1bEytynChsZRIMYxny5bs2Y00wmkN8yZIqpZ+EfEFrUFAqk1brX3r3UpwY7mTwz7LmcX9dPq5vZ6+aRloAZ3uYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yutnjhDqShW8DLxrGd9ScGtQz5jmqmHBeFLqwhZ8hwY=;
 b=P9vQkVoO55LepSuY0reG2ognC9uFNmBpfpox3IFEyZgFnqn5isamEKHZ01x7RBZRnYrSH29TYhSQXTLwgSYlDygwUmUVDJhk1//xqWsioyHcl/jq/vuYrfox8s2xSWfp8Lz4n7mSA3PB+RuiEd9w0Ccg5zQVB6XDykQmzQn14n8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4898.namprd12.prod.outlook.com (2603:10b6:208:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 5 Mar
 2021 10:54:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 10:54:54 +0000
Subject: Re: [PATCH] dma-buf: Fix confusion of dynamic dma-buf vs dynamic
 attachment
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20210305105114.26338-1-chris@chris-wilson.co.uk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c05431b8-518e-4d2f-4c62-90ab197bd0c3@amd.com>
Date: Fri, 5 Mar 2021 11:54:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210305105114.26338-1-chris@chris-wilson.co.uk>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:23ea:890a:84c3:71ab]
X-ClientProxiedBy: AM0PR02CA0008.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:23ea:890a:84c3:71ab]
 (2a02:908:1252:fb60:23ea:890a:84c3:71ab) by
 AM0PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:208:3e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 10:54:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2039313c-f97e-4b38-1144-08d8dfc51bdf
X-MS-TrafficTypeDiagnostic: BL0PR12MB4898:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4898DF9BA85C7BC954B724AB83969@BL0PR12MB4898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9gj6TXX73jNfA+0TuPwPRZXJQFZa44bUUq2zSCT1EmQlicgr5DxHf20QKWEgCWpVcPxb7CmFJfTtc7v36NNtbgFfaiT1BFG5kNGsy/7d/n7Sle29SKwk4/+hYGVlVdZLfoBQ1DwWqQu1Uz0Dv9Sada2pqy+kKOVB57A3+GkxCKh72C76TuCtsQW+QXCSf6M1oZ8FFpylxqOLe6K1xQPdK7ey2LcsB2hUk7nbXziJTw+Bke1CthZOyQYhQ6sAJtzQrv/7tIYlGZEpMPI30EvV6I0l5QMas/jE0B6GzZ9gbA5qmAwBy4QnZdkGXCi2gdqqihWwxWPaOSzfhbMgbbYdcFYhu/cCbBjcqcr6VwaE9GW7DpFL6eX4Q/jVI4urPXl4DenMVaNfoqJdUP5OtXeFtcmkjsz5ZpUgDgWgVsrXwZtxOu/05DwI+/AxvXBnyYBv7ThbA+3Kh2jLElFPSe4BAHKw2gSPgd6nKaQp2so77yHnIhBFZ7O2PHh/Z6uVnq3aw+hZ/FR8Nm0/lKjoMkSpxbfLUfwBpXCrPiBhXY5q6HdHbZfWZijVM7lh2y/zYTttK0U5GObDEzUktPDYUu12nbpM5eoabSrw7BD3zVdZANk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(316002)(66946007)(66556008)(8936002)(6666004)(66476007)(6486002)(83380400001)(66574015)(52116002)(36756003)(86362001)(31696002)(478600001)(4326008)(5660300002)(2616005)(8676002)(186003)(16526019)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0puTWtqMkUwUjdBOHVsQ0U4MjN2VUYrWFgwcHlOZ1E1MHFoQ0FzUUc2bUcz?=
 =?utf-8?B?c2tKSitxNjcwbDE0Z2tMbm9CVEo4d2xvSVlUR0Y1OG1kSG5VUC8zejRrWkEw?=
 =?utf-8?B?MWdoYXJYeFF6QXZ3OVRUWk10Qm9xZ0JIMWx6VlpZendWdTFoT01idG1wU2V2?=
 =?utf-8?B?R1VPeGlLZE9EblB0YnBJSDJNdWI0eEdVTHpzdldEei9VeVFub0dYZjdlVmM5?=
 =?utf-8?B?cGZNYWZvczU5Wk1tTHFxUWRKaUF0YXZ0eTVMaVhyYUxtYXVlMEcyVDhTdVdE?=
 =?utf-8?B?dmMwNlFUQXFOWmkvcUYyYmp1VzVxM1ZEUWFjOXErZThVUXc1Y2lkQ3FDYTIy?=
 =?utf-8?B?d3lIL09ocVc5RThNVHlrQnJCZ2N6ZDNYMHJYTFFUTXdvTW8xZml5bVVkd3Jx?=
 =?utf-8?B?ZFdkOWNVYWUvMzdOMnhEVVJOckdvbHo5RC9mcDJwb0xxZnAxM2RtdU1kRDQy?=
 =?utf-8?B?MUJJNVVtUU8xQy9Wclc0ZENNL1pOVjZ1YkxOOU1JMUN1QktpTVhzV0lEa3BT?=
 =?utf-8?B?Mm51WVFmNGZCeXlmRTZXOFJKdmNMM2IzVXFYOGNHaUJqNkowcUg1K2lTbzBk?=
 =?utf-8?B?S2h1UGhSei84RjUxa3JNbW1HZ2g1SlpjTitnazEwNUxBVVFzdGE0UTMyRHdi?=
 =?utf-8?B?S2JKUnhPclNUb0QyQURXMmRETnYrRU45eVdDQXFpWlp3NlJhakY2MURXQnNI?=
 =?utf-8?B?MXpQd1A1eS82Qnp5WHVQUzRsQ1pSN1hobm1pVDlTbzRVK21xTUhrWWF4c3B2?=
 =?utf-8?B?Z2ExNk1KSXhjVUNRb0ZJcE96cFhVNUF5MFYxSFdaMTlaZXh6YkNiK1lPdWta?=
 =?utf-8?B?UDBUUFhIa25LVDBPbDhQRndONXBzcUwyeVV5dFdyT2k4eDlXMllGdFJxbnlD?=
 =?utf-8?B?NkRocHlKWjJZbzl1ang5OG8yTGlxZzFQUmJPUDdiVlc1RkZidWFZY2VLdlBD?=
 =?utf-8?B?cVZsMTRWeHNlanZwQ2ttTDRONWpoQmtpem1oRTdjWVFUWll4UGdCQ1RhUFY3?=
 =?utf-8?B?amNoamowWG1jai9uTEhwM2hDcXNEbXdId25Cby94RUxlSEY2QlI2bFNTT3gy?=
 =?utf-8?B?YVZwd0t5bFhQMU1WTUpaQ0xxSzJXem9mZERVK0sxaDJuTWpTd3h0SHkvN2RE?=
 =?utf-8?B?T2tZQU9hblJGcUZyT0hqMFpla2QwcG5YdE5lVWZmamJmaVVOZm9qLzYyL1Jq?=
 =?utf-8?B?cFlpOUt5TDdmYmpINHZFOG9kdEhWQnA3aC9UM1FoOXFFSklyKytBYnkzNDNl?=
 =?utf-8?B?c1FnQ2VkeVlEak1rbDU5QlZmM2NmOTNDdlhIQVdlcXliZnJYTWtKSVFVQkVI?=
 =?utf-8?B?blJES0lyTElDVkQzdk1EMGFuWDVFWFlJSzZzcW5tMEVHV1EvbVdWMjFSM0M1?=
 =?utf-8?B?cm9iWk5XWFVuSWhIbzBKZVViVm1VUDBDTkVFQU5PN2FIZW1SbDV6K09sREJF?=
 =?utf-8?B?cGJEOUJabjRrVm1UandBaG1wSU1oNVRzZnFPMVlSTXlyRTM0cVBGM2pXWm9Q?=
 =?utf-8?B?ZkE1M0RQemcvQUcxa0JjajNZejBWVTZhaXMwbUhEM0xTZENrdlRhd2VETXZj?=
 =?utf-8?B?VUFQSGtPdlNQaTd6dXQ2TVF5SGMrbUhvdHB3RWs0emF0SGhBekw4NHlXYXk2?=
 =?utf-8?B?dTJQVit6aGxhclNSNU1kWXJXSmN2V0tRSXRNZE8vRFArSXN6THRJQ1lyZytN?=
 =?utf-8?B?NGN3eTRkRTYzOFV2MVRxU082czg3REFFWGRXRm84MnRpSnVTM0hlbVBhNjkx?=
 =?utf-8?B?b2VJR3Q5NWVRV3lSZ2I0U3Y5dy9EdEY2N09EKzRWWXdUNDZ6bUtzM2RReU1S?=
 =?utf-8?B?QVMvdVU0c0RWNzRFdmJ4eWxvQ2tXUkFobWVPeWhKd2pxcXRqV0NqSDV1cjFK?=
 =?utf-8?Q?m2Q/G+H9Q2FtF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2039313c-f97e-4b38-1144-08d8dfc51bdf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 10:54:54.3669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skndcZ4Ai3+qn/1LVy8eDs8wLZBn0yA2w0qDE3u9cRTGBu/PR1LRJ10CX8kp3Azt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4898
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDMuMjEgdW0gMTE6NTEgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gQ29tbWl0IGM1NDU3
ODFlMWM1NSAoImRtYS1idWY6IGRvYyBwb2xpc2ggZm9yIHBpbi91bnBpbiIpIGRpc2FncmVlcyB3
aXRoCj4gdGhlIGludHJvZHVjdGlvbiBvZiBkeW5hbWlzbSBpbiBjb21taXQ6IGJiNDJkZjQ2NjJh
NCAoImRtYS1idWY6IGFkZAo+IGR5bmFtaWMgRE1BLWJ1ZiBoYW5kbGluZyB2MTUiKSByZXN1bHRp
bmcgaW4gd2FybmluZyBzcGV3IG9uCj4gaW1wb3J0aW5nIGRtYS1idWYuIFNpbGVuY2UgdGhlIHdh
cm5pbmcgZnJvbSB0aGUgbGF0dGVyIGJ5IG9ubHkgcGlubmluZwo+IHRoZSBhdHRhY2htZW50IGlm
IHRoZSBhdHRhY2htZW50IHJhdGhlciB0aGFuIHRoZSBkbWFidWYgaXMgdG8gYmUKPiBkeW5hbWlj
LgoKTkFLLCB0aGlzIGlzIGludGVudGlvbmFsbHkgbGlrZSB0aGlzLiBZb3UgbmVlZCB0byBwaW4g
dGhlIERNQS1idWYgaWYgaXQgCmlzIGR5bmFtaWMgYW5kIHRoZSBhdHRhY2htZW50IGlzbid0LgoK
T3RoZXJ3aXNlIHRoZSBETUEtYnVmIHdvdWxkIGJlIGFibGUgdG8gbW92ZSBldmVuIHdoZW4gaXQg
aGFzIGFuIAphdHRhY2htZW50IHdoaWNoIGNhbid0IGhhbmRsZSB0aGF0LgoKV2Ugc2hvdWxkIHJh
dGhlciBmaXggdGhlIGRvY3VtZW50YXRpb24gaWYgdGhhdCBpcyB3cm9uZyBvbiB0aGlzIHBvaW50
LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEZpeGVzOiBiYjQyZGY0NjYyYTQgKCJkbWEtYnVm
OiBhZGQgZHluYW1pYyBETUEtYnVmIGhhbmRsaW5nIHYxNSIpCj4gRml4ZXM6IGM1NDU3ODFlMWM1
NSAoImRtYS1idWY6IGRvYyBwb2xpc2ggZm9yIHBpbi91bnBpbiIpCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUu
NysKPiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCA5ICsrKysrLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1i
dWYuYwo+IGluZGV4IGYyNjRiNzBjMzgzZS4uMDlmNWFlNDU4NTE1IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5j
Cj4gQEAgLTc1OCw4ICs3NTgsOCBAQCBkbWFfYnVmX2R5bmFtaWNfYXR0YWNoKHN0cnVjdCBkbWFf
YnVmICpkbWFidWYsIHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgIAkgICAgZG1hX2J1Zl9pc19keW5h
bWljKGRtYWJ1ZikpIHsKPiAgIAkJc3RydWN0IHNnX3RhYmxlICpzZ3Q7Cj4gICAKPiAtCQlpZiAo
ZG1hX2J1Zl9pc19keW5hbWljKGF0dGFjaC0+ZG1hYnVmKSkgewo+IC0JCQlkbWFfcmVzdl9sb2Nr
KGF0dGFjaC0+ZG1hYnVmLT5yZXN2LCBOVUxMKTsKPiArCQlpZiAoZG1hX2J1Zl9hdHRhY2htZW50
X2lzX2R5bmFtaWMoYXR0YWNoKSkgewo+ICsJCQlkbWFfcmVzdl9sb2NrKGRtYWJ1Zi0+cmVzdiwg
TlVMTCk7Cj4gICAJCQlyZXQgPSBkbWFfYnVmX3BpbihhdHRhY2gpOwo+ICAgCQkJaWYgKHJldCkK
PiAgIAkJCQlnb3RvIGVycl91bmxvY2s7Cj4gQEAgLTc3Miw4ICs3NzIsOSBAQCBkbWFfYnVmX2R5
bmFtaWNfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCBkZXZpY2UgKmRldiwK
PiAgIAkJCXJldCA9IFBUUl9FUlIoc2d0KTsKPiAgIAkJCWdvdG8gZXJyX3VucGluOwo+ICAgCQl9
Cj4gLQkJaWYgKGRtYV9idWZfaXNfZHluYW1pYyhhdHRhY2gtPmRtYWJ1ZikpCj4gLQkJCWRtYV9y
ZXN2X3VubG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7Cj4gKwkJaWYgKGRtYV9idWZfYXR0YWNo
bWVudF9pc19keW5hbWljKGF0dGFjaCkpCj4gKwkJCWRtYV9yZXN2X3VubG9jayhkbWFidWYtPnJl
c3YpOwo+ICsKPiAgIAkJYXR0YWNoLT5zZ3QgPSBzZ3Q7Cj4gICAJCWF0dGFjaC0+ZGlyID0gRE1B
X0JJRElSRUNUSU9OQUw7Cj4gICAJfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
