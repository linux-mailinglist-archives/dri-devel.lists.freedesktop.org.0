Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCF33134F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 17:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B066E817;
	Mon,  8 Mar 2021 16:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A90C6E3EF;
 Mon,  8 Mar 2021 16:24:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRrOfSWrwzJWJ3rQneliCKi+4GfiQBc5jvVGySxNP44WwVFBQ8Wo94vhsNjJsNlDReMAqWKm+Mo6/RSXmuHCHuGZ7YTraba1o6iZZJ8GEb6GE3X0lytYXXFke123ryCZh4s4PWiu/pYK7Va0MrDy7fBFxyw9vdlzjrxwUu0jHkoTMg1uT0o0cRybjN19c7ESsJhSZMnfs6LiBfbf0E8DvsEWBz4gzrFfo8X3p4Q+EugZ08g73nYTTjhk0EaeyOq7Lec+0mlgrEAbiSkKy+Do8GwCKBArpE57dYg17faSnna0V/dy9CxShHxvg9d3q0OYyCQ7NensAZdKzxsWfZ7jMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R/Fe1jdY1rNJaHR3PGcwJx1r6WV7g3RnZk+YCTihpA=;
 b=Ncfn73fdkvypKra114dFmZPSrF3k+5lGzCUAi8k8/fc1kbLSZo/orgzIR06MXgE9/eQEPXfUbLzwQbFNwWCJENXx82Uz9g7Qsrj8PlyYtzk1dTb55rOZ5uU5Q7BHdVhibj7alnIYXfVptkt2lJtshXW0IWJNvylpYJQqaiIRuaKktw3PAocbjJdzrXpUGDjGkaJuvrSVvZzKYPGypiUK/wo2MHJcMk2uajmvgxjlTM/NpAnZc204tCaVpW2Vk6DdTAXEc+toWqBtfliBpDLlzFp/4o/mSgy6DkJjBrmtnOoUXdmPpv1PhsritgM0s7BqL0HOrtwrE92haicU86a+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R/Fe1jdY1rNJaHR3PGcwJx1r6WV7g3RnZk+YCTihpA=;
 b=DrFhtXvhOMhL0EMvwadLSwfTBvSzCrcCAKT/La+RsJkQfX2JxDtviMyMc8J3i6cEtqnzhnz/gOmnuKIPXJHUBCtPqRFBJhMnPs8yvGgihMY12vv74y7OxqBpywnmHbk/rTdwmgpJcDvV26VrvocBfJxuJm/mK6KiY37ukAutiLE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2451.namprd12.prod.outlook.com (2603:10b6:207:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Mon, 8 Mar
 2021 16:24:47 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Mon, 8 Mar 2021
 16:24:47 +0000
Subject: Re: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <oded.gabbay@gmail.com>
References: <20210308153359.2513446-1-arnd@kernel.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
Date: Mon, 8 Mar 2021 11:24:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210308153359.2513446-1-arnd@kernel.org>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 16:24:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 10706afb-a621-4419-9f73-08d8e24eb0d9
X-MS-TrafficTypeDiagnostic: BL0PR12MB2451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB245178EE7E40C6528245EA0392939@BL0PR12MB2451.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ZD7p/5BxGKXHi4Ph0fLSwWYZstsB8wt/MGTCWMkRAd6yPLwdGnwC9Aso3mw/io1OVyLt3S2eGULjMFwvCJ6MzoBlQP/hP5ZpZ1AwbS4MynOsKqio+Il/lv/0AQ/6FGBwtAQQoR5re8DALiOqXDkisZ5LBVswzEY2VQDlMOaAa3IcI5INwoEKSwYltHs995eIeOEjjT4bDH6mP0Jqjzf01X6fxMOVOVw7Xr1t1voDv2jCep55inn4v1TPzBnr+TTmDnlp29svW4gUjLMv8gREAhfJ7mw0UWW5N0sJkzX+gX2FiVilIOnJ2hDxjLxV7J6gCNpRc7nhKFT3H7FqR6z9JmKVF/u21FFqoD2owLctsg4Aaa4F4xXtTQfnsnUbB3wlLXIrXHnj113fGsyLiZEkc26V1oeuBmCWzkyK4xJfVfNHEjpnqiW5v6onKaIJJ3NnWux6DV+av7w+jwnD6gQPa4wMwm+ZglQCmD/RTIJ0bEPTiR7DHPtwtzBsv6qCWvavwK9V+RPH+YAwqg6VrBKyJ6rBTUxcp8/lg0LfUiwxgyLYOTruEQB/XCbLx43H1WqfgK88jvuSTvHdOteIa0GTU+0C3Q/xVRojRulVwjwcYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(956004)(110136005)(86362001)(66476007)(36756003)(52116002)(31696002)(2616005)(16576012)(26005)(5660300002)(54906003)(6486002)(66556008)(4326008)(8676002)(31686004)(66946007)(83380400001)(8936002)(478600001)(16526019)(186003)(2906002)(44832011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZWpBNG5icXhFaUF0cUYwbzBGUklyQ054VDRLVlVnekFmM01aRlJyOGVtd2F4?=
 =?utf-8?B?NmdQVDR1WFdyMHByNytSUDZOcG9XckN3Q3Z0UWlkQXdZa3VVaW9YVHo1cSsz?=
 =?utf-8?B?aUJlOVhZV1JKQ1J3M2ZWbytZay9xRzlJSzY0VGpCVW5kdWVVL0htaWFHQ2Fq?=
 =?utf-8?B?MFNhM0dhY0RxNmFQZVNrUk5FaGtyT0lwckxKSkNtMWJpalVWSUJDanQrb1Ns?=
 =?utf-8?B?bGJMNVpPb3R6aFNvcVNCbWFMWktlZUgzVmoyR29LcXo4aEdoSmVHN1M2aXU0?=
 =?utf-8?B?SG94MjB0a3JETWZQTHVlRVAzQW9VOWxlYjluaE44VldZOHRDRkZISy9RZmZK?=
 =?utf-8?B?cktoMjZHeFRPZElwWWFGQXdpY1JublkxSzlzQzNEaVhDVk1PWDN4YmNIcGJQ?=
 =?utf-8?B?bWFlalNpR3BnZk10VVMrZjN4VDVXMk9xcVU3ZUFVSGZ2b1Bzc2QwM1hpdTRv?=
 =?utf-8?B?SnNVUzRZeWNidnl5RStIaEcwblhxMzI1emxVd0NyRGlIODIzZkJCbitJeG9Z?=
 =?utf-8?B?c25ZaTdLVGlRNDdKdTFpVEJtVmJCaWRGbzhUMjBoMmRySDZtTGduYW8xWEhK?=
 =?utf-8?B?N21xTUw3WDNpTE4xczBnc1M2dU1QMTUrMlMvcHdSMG8rdWRYQXRtb1B2Vnp2?=
 =?utf-8?B?emlTcEVuZFBmNHAveEVkcmJOWWJ4OGVJMm5pQUZNQUFjdllsRFFiTjdqYml6?=
 =?utf-8?B?VWZxZWtQME15VGswampNWS9iUEM4bEZ0ZEQ3THgwRFQwVmZlWkRZbDU4TUZi?=
 =?utf-8?B?dElIbHZkbzE3RldVYXUydWJTemF3dnF2K0s5Y1lPT0pYQWhwQ3pVWjdGY0V4?=
 =?utf-8?B?Z0FnR0VILzc3dEJjUytJNHBxMmphcDNYeWR4bGJMdWRNc2lUZ1FuRUxuRFRR?=
 =?utf-8?B?cUgyaS9nRUg3WHdiMVNPNXdJWmZzSTBiTzl2WTBqVDI2UXdxMFlWdnFhSEZw?=
 =?utf-8?B?blgwOHNLN1E1ZFdHNDNEaEZUZmV4Q2hXcmJ4WDR1a09rRkVSMCtVQS96NTQy?=
 =?utf-8?B?Q0xLZkZsK0lyMlRTOW1naFp1aXlzOVBnYnFvRURrOGR0ZDZYU1NyenJWVWEw?=
 =?utf-8?B?QlNsL05iQzJldlNhcDk4U3R3WEpnVngwQnhXakFma1duRTE5dWt1RmJselRO?=
 =?utf-8?B?UE9JcTVvb2tjbmpoZko1ZDZ3V0RnZGxWTjg1TmQ0M2o1eXdUTU94SzBkSk9H?=
 =?utf-8?B?b0xXRzF1NVlaSHA1d0ttRGVxM3EyanpLWkx6ckhGSzJCM2x4c3dTODlFVXNy?=
 =?utf-8?B?R0lLUFNaMHNZcTNnbVpkN2NEeEV2ZXRCbFNxWSt3VWlCZ1B0anM3RkFRaldx?=
 =?utf-8?B?enNHa2ZHZmdIQ3RPZHFUR2h0SmtlMkN6Tlc1NURQdHZNSm9nUkNwMWJSaExm?=
 =?utf-8?B?MU1tellJemdQTTFuT2dIanF2L1kyYXR3OUNkNzdheXVrSE5paGdjKzZXVHFm?=
 =?utf-8?B?ZVJHWW9Va3hMeE1oUmFpMDJmQXVTdjd1Q0FENkNmdkVEYzJRT1dvTDllNHQr?=
 =?utf-8?B?Q01ydzByeTF1UFRhMWRyN2xWUlM3WXJ2RU00Y0pzN0p4QmdpTGtRckhnc2du?=
 =?utf-8?B?U3Y0QXMzRDk3VnM5K3Q2S0l2dHlrQUZQdW5HdHMwV0F5N3JKbmNQend1MU1h?=
 =?utf-8?B?ZDBFZis0UVRHMXB1TnN4OCtZcEZ4K3hhOFZOVFc0MVlRWWs0UUdjY2lBY2sr?=
 =?utf-8?B?VEhCZ0ZHb2ZWcFptemsyK0JTejBJNHc4WFZKUFJpWUt3UGRiVjFmdVB5VzlK?=
 =?utf-8?Q?A+seudvXByXoGV80/ZhtHIL2mjg4fKFMRUMQ5lE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10706afb-a621-4419-9f73-08d8e24eb0d9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 16:24:47.6906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7XMu9efW2SDQzZJQgPkUiagnhUJUc5DONgxkuB1CdsMq7LRHHvIDqxbSzpbmY6eYY6jeKhUfEFwA7uHtGKE4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2451
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
Cc: Philip Yang <philip.yang@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBidWlsZCBzaG91bGQgd29yayB3aXRob3V0IElPTU1VdjIuIEluIGFtZGtmZC9N
YWtlZmlsZSwgd2UKaGF2ZSB0aGlzIGNvbmRpdGlvbjoKCmlmbmVxICgkKENPTkZJR19BTURfSU9N
TVVfVjIpLCkKQU1ES0ZEX0ZJTEVTICs9ICQoQU1ES0ZEX1BBVEgpL2tmZF9pb21tdS5vCmVuZGlm
CgpJbiBhbWRrZmQva2ZkX2lvbW11Lmggd2UgZGVmaW5lIGlubGluZSBzdHVicyBvZiB0aGUgZnVu
Y3Rpb25zIHRoYXQgYXJlCmNhdXNpbmcgeW91ciBsaW5rLWZhaWx1cmVzIGlmIElPTU1VX1YyIGlz
IG5vdCBlbmFibGVkOgoKI2lmIGRlZmluZWQoQ09ORklHX0FNRF9JT01NVV9WMl9NT0RVTEUpIHx8
IGRlZmluZWQoQ09ORklHX0FNRF9JT01NVV9WMikKLi4uIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyAu
Li4KI2Vsc2UKLi4uIHN0dWJzIC4uLgojZW5kaWYKClJlZ2FyZHMsCsKgIEZlbGl4CgpBbSAyMDIx
LTAzLTA4IHVtIDEwOjMzIGEubS4gc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBVc2luZyAnaW1wbHkgQU1EX0lPTU1VX1YyJyBk
b2VzIG5vdCBndWFyYW50ZWUgdGhhdCB0aGUgZHJpdmVyIGNhbiBsaW5rCj4gYWdhaW5zdCB0aGUg
ZXhwb3J0ZWQgZnVuY3Rpb25zLiBJZiB0aGUgR1BVIGRyaXZlciBpcyBidWlsdC1pbiBidXQgdGhl
Cj4gSU9NTVUgZHJpdmVyIGlzIGEgbG9hZGFibGUgbW9kdWxlLCB0aGUga2ZkX2lvbW11LmMgZmls
ZSBpcyBpbmRlZWQKPiBidWlsdCBidXQgZG9lcyBub3Qgd29yazoKPgo+IHg4Nl82NC1saW51eC1s
ZDogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11Lm86IGluIGZ1bmN0aW9uIGBr
ZmRfaW9tbXVfYmluZF9wcm9jZXNzX3RvX2RldmljZSc6Cj4ga2ZkX2lvbW11LmM6KC50ZXh0KzB4
NTE2KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X2JpbmRfcGFzaWQnCj4geDg2
XzY0LWxpbnV4LWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUubzogaW4g
ZnVuY3Rpb24gYGtmZF9pb21tdV91bmJpbmRfcHJvY2Vzcyc6Cj4ga2ZkX2lvbW11LmM6KC50ZXh0
KzB4NjkxKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X3VuYmluZF9wYXNpZCcK
PiB4ODZfNjQtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5v
OiBpbiBmdW5jdGlvbiBga2ZkX2lvbW11X3N1c3BlbmQnOgo+IGtmZF9pb21tdS5jOigudGV4dCsw
eDk2Nik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9zZXRfaW52YWxpZGF0ZV9j
dHhfY2InCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHg5N2YpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfc2V0X2ludmFsaWRfcHByX2NiJwo+IHg4Nl82
NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4OWE0KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgYW1kX2lvbW11X2ZyZWVfZGV2aWNlJwo+IHg4Nl82NC1saW51eC1sZDogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11Lm86IGluIGZ1bmN0aW9uIGBrZmRfaW9tbXVfcmVz
dW1lJzoKPiBrZmRfaW9tbXUuYzooLnRleHQrMHhhOWEpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBhbWRfaW9tbXVfaW5pdF9kZXZpY2UnCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzoo
LnRleHQrMHhhZGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfc2V0X2ludmFs
aWRhdGVfY3R4X2NiJwo+IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4YWZm
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X3NldF9pbnZhbGlkX3Bwcl9jYicK
PiB4ODZfNjQtbGludXgtbGQ6IGtmZF9pb21tdS5jOigudGV4dCsweGM3Mik6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9iaW5kX3Bhc2lkJwo+IHg4Nl82NC1saW51eC1sZDoga2Zk
X2lvbW11LmM6KC50ZXh0KzB4ZTA4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11
X3NldF9pbnZhbGlkYXRlX2N0eF9jYicKPiB4ODZfNjQtbGludXgtbGQ6IGtmZF9pb21tdS5jOigu
dGV4dCsweGUyNik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9zZXRfaW52YWxp
ZF9wcHJfY2InCj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHhlNDIpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfZnJlZV9kZXZpY2UnCj4KPiBVc2UgYSBz
dHJvbmdlciAnc2VsZWN0JyBpbnN0ZWFkLgo+Cj4gRml4ZXM6IDY0ZDFjM2E0M2E2ZiAoImRybS9h
bWRrZmQ6IENlbnRyYWxpemUgSU9NTVV2MiBjb2RlIGFuZCBtYWtlIGl0IGNvbmRpdGlvbmFsIikK
PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9LY29uZmlnIHwgNSArKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9LY29uZmlnCj4gaW5kZXggZjAyYzkzOGY3NWRhLi45MWY4NWRmYjdiYTYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL0tjb25maWcKPiBAQCAtNSw4ICs1LDkgQEAKPiAgCj4gIGNvbmZp
ZyBIU0FfQU1ECj4gIAlib29sICJIU0Ega2VybmVsIGRyaXZlciBmb3IgQU1EIEdQVSBkZXZpY2Vz
Igo+IC0JZGVwZW5kcyBvbiBEUk1fQU1ER1BVICYmIChYODZfNjQgfHwgQVJNNjQgfHwgUFBDNjQp
Cj4gLQlpbXBseSBBTURfSU9NTVVfVjIgaWYgWDg2XzY0Cj4gKwlkZXBlbmRzIG9uIERSTV9BTURH
UFUgJiYgKChYODZfNjQgJiYgSU9NTVVfU1VQUE9SVCAmJiBBQ1BJKSB8fCBBUk02NCB8fCBQUEM2
NCkKPiArCXNlbGVjdCBBTURfSU9NTVUgaWYgWDg2XzY0Cj4gKwlzZWxlY3QgQU1EX0lPTU1VX1Yy
IGlmIFg4Nl82NAo+ICAJc2VsZWN0IEhNTV9NSVJST1IKPiAgCXNlbGVjdCBNTVVfTk9USUZJRVIK
PiAgCXNlbGVjdCBEUk1fQU1ER1BVX1VTRVJQVFIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
