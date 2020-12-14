Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 137D72D9659
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 11:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F596E1B3;
	Mon, 14 Dec 2020 10:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B5C6E194;
 Mon, 14 Dec 2020 10:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5joXzG3BgBF6iC+eqMB5wGMJVXuuJV44YxLAmImTmBeH6q0LCIJ8GjivSGFDv8rybN9Hnb1wzKRKCOETeRurPbEHK6at32EtrbUOn4WtFLDY8ld9U2KxNe7dYmw3boTlGEf+vp1Oyn8wZmSwhSxXE3QFGBniLOc0lGmzzX1rxvlE90ljEpGtKylqRWlVb/jU9lRZW5lHiIjxahg0AxjFN+wBbJiiNYV/skO53WPaXY1BQNx1jST6/Hm1D40/C8nAWGI0d2LanWIFy67wovhHdv2CNX8E1SwqzmHERbgm2JolVOOmtGLIwDLEB4nyFEX+usoqnB/Jk79g9kTJakfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBsQgtb9S78xrmqZ8g3zGDuzC0pEU1YXAd0xq++wsrM=;
 b=OYEcQtlmU9RH/7CW16Hhs3qvbbMh6oUf28o8iGs/4W2AG9sqDFp0NM/SFqk/xXsOM21SNJlHv0bs9JSWanL0G9HqDCLKwN6cxDD+/T6iuxbWlKzlFYgEBLSpSmD7x0VzZ4fPXrngDwhMk8++O6S4mO9NURiBBhUbXFYp1pwWy1SARyABAM8J49vxcrWkRvCUL4HQG+5ly+qEqmxVNGjTz/4M3VK6/1JjWv5ZdCFy5owGy/zYId4cOFmSY5eteqdDjtBO1OB6Hr3JWyEaoPKs5mR0KRmH61pzn7MJP9yL4ef4OWgzsrjAM4+IIEg8UeFg0stGRfiwZs+szJ1t9Rl7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBsQgtb9S78xrmqZ8g3zGDuzC0pEU1YXAd0xq++wsrM=;
 b=IX0TXArhxCc/UsdddAkepdZ4xKCOm0IQDVK2aLbdy0oFW0HWwElNz6LXoIp06bzmY9lT3F+QtliB/5Rhl935W2uK9LvZSK46h/QUqRigK3URVEt6A9IQ7M+11yttIjn/wY1HHaKBk6gHENQhy4HOxR+lCzyU/qphd131xpEI6eA=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Mon, 14 Dec
 2020 10:34:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 10:34:01 +0000
Subject: Re: [PATCH 3/4] dma-buf: begin/end_cpu might lock the dma_resv lock
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201211155843.3348718-1-daniel.vetter@ffwll.ch>
 <20201211155843.3348718-3-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4241d3ed-3ae5-1d32-476a-71d0886f619a@amd.com>
Date: Mon, 14 Dec 2020 11:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201211155843.3348718-3-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0120.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0120.eurprd06.prod.outlook.com (2603:10a6:208:ab::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 10:34:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 02efd938-2073-45c5-9bb4-08d8a01bc5d9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43906A0D8EA46F46D2C45EC183C70@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dk0ZtDSdzXscXN7DLYTFq4AWplrKZE0UehTgdxAIzAGXq97msprx0sXHaO1vL9ABCftzN+hT4hvQd04LYljzZosDJhehcb3RWN4Q+Owf4HRh3bwc9Ylzw+kWKlOmJQoyu/bqxNzPtPbs1/CekQqcoWgFEnZiynQ2qMMMwKjnpcTqP9Ld/GsxPQvXEWxPyoKVKnIyVvR1g+au+6I5ZiJFvh+voGy4iSR34GhPuiviilytqPbJ2d1mxfHxDHEVEp9L0XH4waKcR332UQdpr8+PtQ5cdtTsqI5xwgPDTUhErCcxOw3sNiAUxZKU3fpm9+Ps51SytgKdpcjp4UOLBQuXVtwNKKwfmyssMqQsn+fh8lIc4qyPrga18VfmZT/ETVYRtDB8M9TtCduoRhpfaiPawAbGQhqja/phsPSvJqsypqURpzAV5bHREHWmQ1M5AQFk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(5660300002)(4326008)(66556008)(66946007)(66476007)(508600001)(6486002)(2906002)(86362001)(31696002)(52116002)(8676002)(6666004)(16526019)(110136005)(186003)(54906003)(36756003)(66574015)(83380400001)(2616005)(8936002)(31686004)(34490700003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b2NTVXRCRFREcGRSdk1PelVvREFVdVJvWG42RzVDS25ySkdUampzVkNWemdk?=
 =?utf-8?B?TWlJNndBSmJLZHg2ODZLWWRRNld1RXgyekJNb2ZsVUplSDMvbEdQcDU2SVBm?=
 =?utf-8?B?S3RsMXR5SXJBOXVVTnk4bTlNaEtSQ01idkdBb2FMZVB2ZWpWQVhaYWVVYjJS?=
 =?utf-8?B?eitHWC9xWldJN01vbXRQODc2QkpIZUNHZlBEc2IyZkhtbWYvT2FmSkUwcVBK?=
 =?utf-8?B?WkNwUTVLdVVoM2luTnpHdEtTWVg5eDAvMWEzdURtVW1GYUdVc0FHK2FPUTc4?=
 =?utf-8?B?QS80M3RIeUFmM05KNjJZMGRXMzkzcG9nQkRGUktnUDlTYk85VjVnQTUreGVk?=
 =?utf-8?B?TTBRdWR0cHZzSDZEMlpCRzdVWlYxU3hlRk0wNUdubVdyclVZOHdTMWhjNHlm?=
 =?utf-8?B?VHYrbkRGbFIxWnhySU5UZmVWWkt5N0NWNHlQWk9UaE9XQ3I5MEh0OHFqV1Uz?=
 =?utf-8?B?YjIxNFRyQUFDdWFHMHA4M1ZzNDRuU0xnL2tkN3JpWDB0Z3MrR0xFZjM4RHJ0?=
 =?utf-8?B?Zlk5VVM0M29ycGxzd2JPMFNKWjc5SjJRcVNCanJiN29icS9IQTFuTXBkN3Ra?=
 =?utf-8?B?M0hoSGEwV3VBbktrVFlpancvWGphWHcyS0kwOUJMZTZtaDBkVHNaa1JwZG5R?=
 =?utf-8?B?VkMrcEx5M29OR3RoQ3ZVekM4WlpaT3Nramd4UnZLbko4emJLTFJFUm9tQStz?=
 =?utf-8?B?akFGaEtFSE44NFZGZVJYZGFHS29LNmRabDZRdkI0WkdFS2tuVHhnS2pRZFM0?=
 =?utf-8?B?aGNxR2R2THppeDBPVjlhVnVMN2VtMWlTajg2U0ZGejc5R2o4dnR0VnR3ZWtV?=
 =?utf-8?B?OE8rY05qazA4K1poVlA3RlQ0M2JCQTVMd3ZPYUp1Vll2RjRYSmVYS0tIV3VN?=
 =?utf-8?B?cEw3OExrRzAzV3RUMFA0WXlqbVVlOWZiaEVFeXJwMHg3OFc1SnFhSkJJRzBr?=
 =?utf-8?B?dm41TWxTZGhLRkhkL2NFb3hlWWFCNGpNYjIvZHRjVGEvL0dhK1JCVFY4a2lj?=
 =?utf-8?B?YkRjcmtYeXhmalB5czlpdTMvZHB4OGsyTXJPQzYvTUR3QXYrZlp6d1BmUXlC?=
 =?utf-8?B?ckgvVUVPeDgrcTFoMTBmNjMzSTBIc1EzL3RCYmFDNFkvUlRYUkdmcjh0M1Uy?=
 =?utf-8?B?MUtNZjlDR1lpbmNjNTYvNTA5dzdGYnVROFhWY243TS9WRm5KSnp4dHNvb0tK?=
 =?utf-8?B?d1NhbDFUcnVoYXVsaDdqQUpZWSt2UFptYnhjbVI2cnNINDdRem4zSGlKQXJn?=
 =?utf-8?B?Y3V6dWlqZ1Y0SU1WQ2VPUW1PbzVyd0VYRTNtbmNHS3J6TExQaWlBb1VtRzQx?=
 =?utf-8?B?R0FLZzB4cm9hMk1BdUlmQzltRjBCekxDeEVSV0tPK3JMNzUwaWxzSERYTVdV?=
 =?utf-8?B?NGtLWklYNEpKbkowRnArRXFlRExqcWxuMVlEUlRKSEZVK2FzbExlUlFpdnBn?=
 =?utf-8?Q?PReHV+pV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 10:34:01.5729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 02efd938-2073-45c5-9bb4-08d8a01bc5d9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0JNGBPkIiehOkh4rfubLFj+cccqVuCSQ7N5iV7HimUqhOrXhaSMrVN5NJ6cfxA6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMTIuMjAgdW0gMTY6NTggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IEF0IGxlYXN0IGFt
ZGdwdSBhbmQgaTkxNSBkbywgc28gbGV0cyBqdXN0IGRvY3VtZW50IHRoaXMgYXMgdGhlIHJ1bGUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IFN1
bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCgpSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAg
IGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5j
IGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+IGluZGV4IGUxZmE2YzZmMDJjNC4uMDBkNWFm
ZTkwNGNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiArKysgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gQEAgLTExMTgsNiArMTExOCw4IEBAIGludCBkbWFf
YnVmX2JlZ2luX2NwdV9hY2Nlc3Moc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwKPiAgIAlpZiAoV0FS
Tl9PTighZG1hYnVmKSkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4gICAKPiArCW1pZ2h0X2xvY2so
JmRtYV9idWYtPnJlc3YubG9jayk7Cj4gKwo+ICAgCWlmIChkbWFidWYtPm9wcy0+YmVnaW5fY3B1
X2FjY2VzcykKPiAgIAkJcmV0ID0gZG1hYnVmLT5vcHMtPmJlZ2luX2NwdV9hY2Nlc3MoZG1hYnVm
LCBkaXJlY3Rpb24pOwo+ICAgCj4gQEAgLTExNTEsNiArMTE1Myw4IEBAIGludCBkbWFfYnVmX2Vu
ZF9jcHVfYWNjZXNzKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4gICAKPiAgIAlXQVJOX09OKCFk
bWFidWYpOwo+ICAgCj4gKwltaWdodF9sb2NrKCZkbWFfYnVmLT5yZXN2LmxvY2spOwo+ICsKPiAg
IAlpZiAoZG1hYnVmLT5vcHMtPmVuZF9jcHVfYWNjZXNzKQo+ICAgCQlyZXQgPSBkbWFidWYtPm9w
cy0+ZW5kX2NwdV9hY2Nlc3MoZG1hYnVmLCBkaXJlY3Rpb24pOwo+ICAgCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
