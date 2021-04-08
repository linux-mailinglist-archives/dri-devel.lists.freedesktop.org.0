Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D33357F48
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B372E6EA40;
	Thu,  8 Apr 2021 09:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F37C6EA40
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgLLvmrxy1OkxoI4NrG7dVkzClNIVScK+5eh4gDPzV3s7F9tlFzVciZj1pwDyF4RPceuzB2g/9zyTtJ3SV/IzoRSRBHg1kwX+PsTjTo4mB31fc39WY4/2HvgCg4leHf0l/lvB13A+7Oc4xX0pQYkCHBDUXoq2Z/DzFE52tqGLmy7s3Ym/osX2bTCl7JVLcw3eP7gT4QxDAE1CaC/1ez0ghMZXgutDjsuBdpsZ3RhNluiFxbPh0qP0NRuTyM0ehVe2/Ru7LLk/9BzVqAI7pQ6NGI8+vUdR80ve6rgY5aNUGoSlwWULyQjwvnCQkLQqjBEssJiZCo61bsJ9BvBnL/CCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNoChk4y4oYQ0G6odp88JZsrTnpDYP/5YP10jedNcTY=;
 b=DrJO+J/xWstgC0e6Uk4nTf/LEgkwjyPsuYW8g74FfiqVu989LISWgHX+D7ocm61TJJQ8gvZ6toRwpKkmgbqMla3oTHL6WswsxmPnhHTsO5D4B7MPMcxcJUBl8uv4inW04WpYkwfGosHiV9GiCqeV1zl9wcc3ZZDE8kIQpsGAkpOmHy3IKTKM7oIm7r4GDsHgYtIXHwQCqxq0zJvw+Zy1t5bSPblGKr/AGASoM/dtWcD9A1miNAPX5ApAZaF8DEWysmv4cd7cW6TZ+qeRS1AdetCJd5OTg/fyyRDyf3SGXMz8afphPn8R4A3kAa2gDFj8K+EfR5y6DhdO3zlgBNnHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNoChk4y4oYQ0G6odp88JZsrTnpDYP/5YP10jedNcTY=;
 b=GABMiugg0ZsY+W6ctXkSUwJ2/weKw2oohOYHm1R1MGObEt3PBv5eN/XOmWeg++CKJEcd+B1ABPljamq2DvoX4gSaE/j4RanmSYasw87VJKtqPZn5b08rhS6R3SIFGnLmJvfqk/ifRWUrjymAlIQj/y19roEZFwg/ep4E0yY+xzc=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4657.namprd12.prod.outlook.com (2603:10b6:207:1a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 09:34:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 09:34:55 +0000
Subject: Re: [PATCH] Revert "drm/syncobj: use dma_fence_get_stub"
To: David Stevens <stevensd@chromium.org>
References: <20210408045926.3202160-1-stevensd@google.com>
 <7f22ac22-dbe0-f056-b7db-24fa60f9724e@amd.com>
 <CAD=HUj5vS7VZQ-Meaz_Q1xEoamE_2fF0VE-RGj0sfUu0apP7Zg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e933b01d-5f3c-f7f6-48b9-1106eb9a431c@amd.com>
Date: Thu, 8 Apr 2021 11:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAD=HUj5vS7VZQ-Meaz_Q1xEoamE_2fF0VE-RGj0sfUu0apP7Zg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
 (2a02:908:1252:fb60:db83:c532:1fa2:b0cc) by
 FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 09:34:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6f89d13-df7f-4f9f-26cc-08d8fa719118
X-MS-TrafficTypeDiagnostic: BL0PR12MB4657:
X-Microsoft-Antispam-PRVS: <BL0PR12MB46574833579E7E84B8758DD483749@BL0PR12MB4657.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H244R4sQgpPApQeS4IqNvJqEbxk55FhCHx1fPZ6KWSDFCAQMd0BF3PuzOW2N3Udy4iUpfmXIyEgSC9rPRZNzfeBVbuikNJzgbLGqm7iC3ts6vNjuzEnnxY+XeQQjuKTpUEXsXp5vAz9v1Q/iNUFhVGysRjjVV1T99dK6x2PWOU0/9n+/bD9SdP8wzm7b3m6qxvKIE0+k6KWC4e/11Colv8Q1JVaeJt5wEHeyuLOp2fGwMw5OJ4Gjdrz2SCifJsruwDsgbGdTTeh0yy6/9tky7wE/Psg2UulBbP2orDkTQEowSB2m4mKajx3NGcQ9VM7j9KDOPsfuekCUA8ACks6lY3/VEy455SvlFsYT2zyWfUoigPDORiIyUfqmwsIz6+ztykDcy03vSaW7t0q1dhM2g4zc9JODE3aGDeBYWJIaq8dP9ZLBjwHp8x+4WQ5VpBRixPx1hhQeX/kyNQk9pE1x0oSHJlbLMBUmrQrSUXfP27iwrQ6XlcxaD8gp2873cx+O6Zuj6wuYJ5NSUW9anGMTio32z/0OZr8ypAAMnW/uA2gTC54Nu4rK6JymZkU9Pu9Ql1rnGUD4MnkT0ysk7tJX99qhfp14NcuZmyuXiJQRET260qzJfYdMmVzz6p4rsLcEEyPJugajmWNkOiFXufFGfTTpetfh43KXO34tL5Rr1vlY59g2BzRyo8EDXQ8gzvBXJeZzWb4xIKSioCFZ8Hn2Z7kwTtu80qzmqHDUynIDk6g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(6666004)(5660300002)(86362001)(31696002)(6916009)(478600001)(38100700001)(8936002)(66946007)(66476007)(6486002)(66556008)(4326008)(2906002)(53546011)(54906003)(16526019)(31686004)(36756003)(186003)(316002)(66574015)(2616005)(8676002)(7416002)(83380400001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWI3QUlVeUc1emQ3MDNPUGJXMjlMUlRSS1djTVFQZldWYUVXb1UzeW9nRXBB?=
 =?utf-8?B?QW1VWW8xajNJVDBpc2ZHVDkyOGlOY0RuTFlEKzhrNjhLNjBWKzFRRTVac1Bu?=
 =?utf-8?B?cHIyYXJ2aW14TVY3SHhubkVnTVFWalUyTTdodDV1UWU4Y01WL2M4K1VNVDNj?=
 =?utf-8?B?aVhPclRZa1ZwL1RwUnZrU3kwRmxlME1Eb0pGekhjYnJJUUE4dHZ2bTFQYk5B?=
 =?utf-8?B?SC9yUUdvc3ZXTU5vdW8zeTdTenZvYkljb3NoY0M3eFlhb0Q4ZkRtckZSNWV5?=
 =?utf-8?B?R2owQmpzRVB6MUJ5Z3l6NmI5MEtPQkFDK01FVUdLRjJjQlhiMmcxYitJczBG?=
 =?utf-8?B?QjNKelkzT1M4YjYxNWxsb1lPbTl5ZDRuZS9JTnZDUnUyNm90NTl3emVBV1g2?=
 =?utf-8?B?eEJVVkh3NW4wUWNCcUZyT0dWYVRzL0prZEZNOHhEOUkzUjdzMHBBTlNlM2d1?=
 =?utf-8?B?TVVhekRiNzVPWm5yRkVrRFkzZ2FwUjFVZkRsTzdKQk1qa2tOOFNHQUV2aFpv?=
 =?utf-8?B?akZ5OVZzamk0dUhQYVppN3R6bE02cnVjWGhPTGJHOVJ0Z21FandYL0dLWk9C?=
 =?utf-8?B?emxDV2JGOHZSdXpHYU03cEtSNDU5T0dMZjVNRUo0UzRXb3dvODRNbTAvZzhu?=
 =?utf-8?B?WUxUS1RxKzBuMGlLOWNEYzZ6blZiY0N1bE9jSmJDeWJoeGIxZCtReVNwRDV5?=
 =?utf-8?B?RFJMSXh2aDVtQTVJRzdJaHJEaVVJazNWa1FJWVJiWTFybDFtZjVaaVEveW4x?=
 =?utf-8?B?L1NyMjQ5dEJ3WGt3S0xGUWRBZlU3QnRGSEtBUDg0SndUMHBsYTJXajdkUUUr?=
 =?utf-8?B?a1RYMVpCTUVrRDltL0RnVkxrMXIxeXlPUmVRdS9lR0xsMWlvRGgrZVdwcytQ?=
 =?utf-8?B?Sm5ETWtvaS8rM0duNmNzR0cxUmhkekNaR25yeU9mVWZlaUVnamlaVU9wVWNX?=
 =?utf-8?B?NnVrb3BISE5CRitjdXRBME5ULzUvdnEyMFNtRXNEQ1BIL3V0THdIdm9YTUND?=
 =?utf-8?B?TVdld1RMaERQTk0zNDZXOGpPTUtzdTBwWlhmQUh2b1lGaEo1NTZZdkxSaXVE?=
 =?utf-8?B?dlNCK3hXbDh2bUdPRlIyZmg1MjVnNytoU0Nla0JDaFpZR2V3Qys2MEZaOHJk?=
 =?utf-8?B?RGNIUzBiL2QzcFFPMk5ZS29FRER3S092bkJIaUNmREVMdTQ5WnpRUG1aTWE1?=
 =?utf-8?B?WU5oL3hqQStKOWJJNzBoZ2x2am9uczM4TkFRaUxsdFVVSENaaVZ5OEdhdXlO?=
 =?utf-8?B?MWZOM1dLeTlKNlBoR295Zm5GL3RMTHIxY2hNSndwRW5ONUw1ZkJNU0VqUzg4?=
 =?utf-8?B?SVN6V29wM01GN3ZRdDRMd3l6NXp6UHhxSFFSbEovRm9JTHRoS1NTck5ldDdC?=
 =?utf-8?B?QWFsN2tLOWo5NzJUbks4YURKZmszOXlvZ0xacXVJVERWK3VocUJicDYwVUM5?=
 =?utf-8?B?R2s5NHY2dmVuQVFGV1RXUGhMWW9ncHF2ZkFTckJMbUU3N1NRWlNiQk5SQnlW?=
 =?utf-8?B?RlVpKzMvcm1ETDdXNVRjYkxGaXpCRHF4RU9PQVo2VDNNa1VwOWFNSncrbW1y?=
 =?utf-8?B?VGptcENXcTVEbEdRRDFmZFEwbS9aVkwvN3pPNThKdTFTVGhBZVBFOXNuSUtZ?=
 =?utf-8?B?MUhmTWZhaXdJYjc2dVUvY1RlSm5OTXgxTjhFZ2U3MEw0R0QxTU9CVUNiaFJL?=
 =?utf-8?B?L0dsTXJFbWhGTmdRZzkwQ08ycS8zc254T0swZGgvVldNSjBLK01xcXhXQlM1?=
 =?utf-8?B?dm5DKzBFVFlKc0dDbnJYbTZhaGNrZWgyYW1RNWxBR016NTJyTThETzFRSjFQ?=
 =?utf-8?B?Mno4bFZJTWNvY2NtVEprd0FWOFJwaldnSG1yalduNUl2UGxja1FaaXYzRS92?=
 =?utf-8?Q?J+OJ73Gxt+9Cr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f89d13-df7f-4f9f-26cc-08d8fa719118
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 09:34:54.9250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLpKtvpNeM17QXiuajxsB2W6HG5ffIvrftGnEIR29XzBJ9gAXAmCxofGhyQl9jln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4657
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDQuMjEgdW0gMTE6MzAgc2NocmllYiBEYXZpZCBTdGV2ZW5zOgo+IE9uIFRodSwgQXBy
IDgsIDIwMjEgYXQgNDowMyBQTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+IHdyb3RlOgo+PiBBbSAwOC4wNC4yMSB1bSAwNjo1OSBzY2hyaWViIERhdmlkIFN0ZXZl
bnM6Cj4+PiBGcm9tOiBEYXZpZCBTdGV2ZW5zIDxzdGV2ZW5zZEBjaHJvbWl1bS5vcmc+Cj4+Pgo+
Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCA4NmJiZDg5ZDVkYTY2ZmU3NjAwNDlhZDNmMDRhZGM0MDdl
YzBjNGQ2Lgo+Pj4KPj4+IFVzaW5nIHRoZSBzaW5nbGV0b24gc3R1YiBmZW5jZSBpbiBkcm1fc3lu
Y29ial9hc3NpZ25fbnVsbF9oYW5kbGUgbWVhbnMKPj4+IHRoYXQgYWxsIHN5bmNvYmpzIGNyZWF0
ZWQgaW4gYW4gYWxyZWFkeSBzaWduYWxlZCBzdGF0ZSBvciBhbnkgc3luY29ianMKPj4+IHNpZ25h
bGVkIGJ5IHVzZXJzcGFjZSB3aWxsIHJlZmVyZW5jZSB0aGUgc2luZ2xldG9uIGZlbmNlIHdoZW4g
ZXhwb3J0ZWQKPj4+IHRvIGEgc3luY19maWxlLiBJZiB0aG9zZSBzeW5jX2ZpbGVzIGFyZSBxdWVy
aWVkIHdpdGggU1lOQ19JT0NfRklMRV9JTkZPLAo+Pj4gdGhlbiB0aGUgdGltZXN0YW1wX25zIHZh
bHVlIHJldHVybmVkIHdpbGwgY29ycmVzcG9uZCB0byB3aGVuZXZlciB0aGUKPj4+IHNpbmdsZXRv
biBzdHViIGZlbmNlIHdhcyBmaXJzdCBpbml0aWFsaXplZC4gVGhpcyBjYW4gYnJlYWsgdGhlIGFi
aWxpdHkKPj4+IG9mIHVzZXJzcGFjZSB0byB1c2UgdGltZXN0YW1wcyBvZiB0aGVzZSBmZW5jZXMs
IGFzIHRoZSBzaW5nbGV0b24gc3R1Ygo+Pj4gZmVuY2UncyB0aW1lc3RhbXAgYmVhcnMgbm8gcmVs
YXRpb25zaGlwIHRvIGFueSBtZWFuaW5nZnVsIGV2ZW50Lgo+PiBBbmQgd2h5IGV4YWN0bHkgaXMg
aGF2aW5nIHRoZSB0aW1lc3RhbXAgb2YgdGhlIGNhbGwgdG8KPj4gZHJtX3N5bmNvYmpfYXNzaWdu
X251bGxfaGFuZGxlKCkgYmV0dGVyPwo+IFRoZSB0aW1lc3RhbXAgcmV0dXJuZWQgYnkgU1lOQ19J
T0NfRklMRV9JTkZPIGlzIHRoZSAidGltZXN0YW1wIG9mCj4gc3RhdHVzIGNoYW5nZSBpbiBuYW5v
c2Vjb25kcyIuIElmIHVzZXJzcGFjZSBzaWduYWxzIHRoZSBmZW5jZSB3aXRoCj4gRFJNX0lPQ1RM
X1NZTkNPQkpfU0lHTkFMLCB0aGVuIGEgdGltZXN0YW1wIGZyb20KPiBkcm1fc3luY29ial9hc3Np
Z25fbnVsbF9oYW5kbGUgY29ycmVzcG9uZHMgdG8gdGhlIHN0YXR1cyBjaGFuZ2UuIElmCj4gdXNl
cnNwYWNlIHNldHMgRFJNX1NZTkNPQkpfQ1JFQVRFX1NJR05BTEVEIHdoZW4gY3JlYXRpbmcgYSBm
ZW5jZSwgdGhlbgo+IHRoZSBzdGF0dXMgY2hhbmdlIGhhcHBlbnMgaW1tZWRpYXRlbHkgdXBvbiBj
cmVhdGlvbiwgd2hpY2ggYWdhaW4KPiBjb3JyZXNwb25kcyB0byB3aGVuIGRybV9zeW5jb2JqX2Fz
c2lnbl9udWxsX2hhbmRsZSBnZXRzIGNhbGxlZC4KCk9rLCB0aGF0IG1ha2VzIHNlbnNlLgoKPgo+
PiBBZGRpdGlvbmFsIGlmIHlvdSByZWFsbHkgbmVlZCB0aGF0IHBsZWFzZSBkb24ndCByZXZlcnQg
dGhlIHBhdGNoLgo+PiBJbnN0ZWFkIHByb3ZpZGUgYSBmdW5jdGlvbiB3aGljaCByZXR1cm5zIGEg
bmV3bHkgaW5pdGlhbGl6ZWQgc3R1YiBmZW5jZQo+PiBpbiB0aGUgZG1hX2ZlbmNlLmMgY29kZS4K
PiBBY2suCgpKdXN0IGFkZCBhIHNvbWV0aGluZyBsaWtlIGRtYV9mZW5jZV9nZXRfbmV3X3N0dWIo
KSB3aXRoIGttYWxsb2MoKSwgCmRtYV9mZW5jZV9pbml0KCkgYW5kIGRtYV9mZW5jZV9zaWduYWwo
KS4KClNob3VsZG4ndCBiZSBtb3JlIHRoYW4gYSBzaXggbGluZXIuCgpUaGFua3MsCkNocmlzdGlh
bi4KCj4KPiAtRGF2aWQKPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBEYXZpZCBTdGV2ZW5zIDxzdGV2ZW5zZEBjaHJvbWl1bS5vcmc+Cj4+PiAtLS0KPj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgNTggKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCsp
LCAxNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9zeW5jb2JqLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+Pj4gaW5kZXggMzQ5
MTQ2MDQ5ODQ5Li43Y2MxMWYxYTgzZjQgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3N5bmNvYmouYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4+
IEBAIC0yMTEsNiArMjExLDIxIEBAIHN0cnVjdCBzeW5jb2JqX3dhaXRfZW50cnkgewo+Pj4gICAg
c3RhdGljIHZvaWQgc3luY29ial93YWl0X3N5bmNvYmpfZnVuYyhzdHJ1Y3QgZHJtX3N5bmNvYmog
KnN5bmNvYmosCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHN5bmNvYmpfd2FpdF9lbnRyeSAqd2FpdCk7Cj4+Pgo+Pj4gK3N0cnVjdCBkcm1fc3luY29ial9z
dHViX2ZlbmNlIHsKPj4+ICsgICAgIHN0cnVjdCBkbWFfZmVuY2UgYmFzZTsKPj4+ICsgICAgIHNw
aW5sb2NrX3QgbG9jazsKPj4+ICt9Owo+Pj4gKwo+Pj4gK3N0YXRpYyBjb25zdCBjaGFyICpkcm1f
c3luY29ial9zdHViX2ZlbmNlX2dldF9uYW1lKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQo+Pj4g
K3sKPj4+ICsgICAgIHJldHVybiAic3luY29ianN0dWIiOwo+Pj4gK30KPj4+ICsKPj4+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGRtYV9mZW5jZV9vcHMgZHJtX3N5bmNvYmpfc3R1Yl9mZW5jZV9vcHMg
PSB7Cj4+PiArICAgICAuZ2V0X2RyaXZlcl9uYW1lID0gZHJtX3N5bmNvYmpfc3R1Yl9mZW5jZV9n
ZXRfbmFtZSwKPj4+ICsgICAgIC5nZXRfdGltZWxpbmVfbmFtZSA9IGRybV9zeW5jb2JqX3N0dWJf
ZmVuY2VfZ2V0X25hbWUsCj4+PiArfTsKPj4+ICsKPj4+ICAgIC8qKgo+Pj4gICAgICogZHJtX3N5
bmNvYmpfZmluZCAtIGxvb2t1cCBhbmQgcmVmZXJlbmNlIGEgc3luYyBvYmplY3QuCj4+PiAgICAg
KiBAZmlsZV9wcml2YXRlOiBkcm0gZmlsZSBwcml2YXRlIHBvaW50ZXIKPj4+IEBAIC0zNDQsMTgg
KzM1OSwyNCBAQCB2b2lkIGRybV9zeW5jb2JqX3JlcGxhY2VfZmVuY2Uoc3RydWN0IGRybV9zeW5j
b2JqICpzeW5jb2JqLAo+Pj4gICAgfQo+Pj4gICAgRVhQT1JUX1NZTUJPTChkcm1fc3luY29ial9y
ZXBsYWNlX2ZlbmNlKTsKPj4+Cj4+PiAtLyoqCj4+PiAtICogZHJtX3N5bmNvYmpfYXNzaWduX251
bGxfaGFuZGxlIC0gYXNzaWduIGEgc3R1YiBmZW5jZSB0byB0aGUgc3luYyBvYmplY3QKPj4+IC0g
KiBAc3luY29iajogc3luYyBvYmplY3QgdG8gYXNzaWduIHRoZSBmZW5jZSBvbgo+Pj4gLSAqCj4+
PiAtICogQXNzaWduIGEgYWxyZWFkeSBzaWduYWxlZCBzdHViIGZlbmNlIHRvIHRoZSBzeW5jIG9i
amVjdC4KPj4+IC0gKi8KPj4+IC1zdGF0aWMgdm9pZCBkcm1fc3luY29ial9hc3NpZ25fbnVsbF9o
YW5kbGUoc3RydWN0IGRybV9zeW5jb2JqICpzeW5jb2JqKQo+Pj4gK3N0YXRpYyBpbnQgZHJtX3N5
bmNvYmpfYXNzaWduX251bGxfaGFuZGxlKHN0cnVjdCBkcm1fc3luY29iaiAqc3luY29iaikKPj4+
ICAgIHsKPj4+IC0gICAgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gZG1hX2ZlbmNlX2dldF9z
dHViKCk7Cj4+PiArICAgICBzdHJ1Y3QgZHJtX3N5bmNvYmpfc3R1Yl9mZW5jZSAqZmVuY2U7Cj4+
Pgo+Pj4gLSAgICAgZHJtX3N5bmNvYmpfcmVwbGFjZV9mZW5jZShzeW5jb2JqLCBmZW5jZSk7Cj4+
PiAtICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPj4+ICsgICAgIGZlbmNlID0ga3phbGxvYyhz
aXplb2YoKmZlbmNlKSwgR0ZQX0tFUk5FTCk7Cj4+PiArICAgICBpZiAoZmVuY2UgPT0gTlVMTCkK
Pj4+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4+PiArCj4+PiArICAgICBzcGluX2xv
Y2tfaW5pdCgmZmVuY2UtPmxvY2spOwo+Pj4gKyAgICAgZG1hX2ZlbmNlX2luaXQoJmZlbmNlLT5i
YXNlLCAmZHJtX3N5bmNvYmpfc3R1Yl9mZW5jZV9vcHMsCj4+PiArICAgICAgICAgICAgICAgICAg
ICAmZmVuY2UtPmxvY2ssIDAsIDApOwo+Pj4gKyAgICAgZG1hX2ZlbmNlX3NpZ25hbCgmZmVuY2Ut
PmJhc2UpOwo+Pj4gKwo+Pj4gKyAgICAgZHJtX3N5bmNvYmpfcmVwbGFjZV9mZW5jZShzeW5jb2Jq
LCAmZmVuY2UtPmJhc2UpOwo+Pj4gKwo+Pj4gKyAgICAgZG1hX2ZlbmNlX3B1dCgmZmVuY2UtPmJh
c2UpOwo+Pj4gKwo+Pj4gKyAgICAgcmV0dXJuIDA7Cj4+PiAgICB9Cj4+Pgo+Pj4gICAgLyogNXMg
ZGVmYXVsdCBmb3Igd2FpdCBzdWJtaXNzaW9uICovCj4+PiBAQCAtNDY5LDYgKzQ5MCw3IEBAIEVY
UE9SVF9TWU1CT0woZHJtX3N5bmNvYmpfZnJlZSk7Cj4+PiAgICBpbnQgZHJtX3N5bmNvYmpfY3Jl
YXRlKHN0cnVjdCBkcm1fc3luY29iaiAqKm91dF9zeW5jb2JqLCB1aW50MzJfdCBmbGFncywKPj4+
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPj4+ICAgIHsK
Pj4+ICsgICAgIGludCByZXQ7Cj4+PiAgICAgICAgc3RydWN0IGRybV9zeW5jb2JqICpzeW5jb2Jq
Owo+Pj4KPj4+ICAgICAgICBzeW5jb2JqID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGRybV9zeW5j
b2JqKSwgR0ZQX0tFUk5FTCk7Cj4+PiBAQCAtNDc5LDggKzUwMSwxMyBAQCBpbnQgZHJtX3N5bmNv
YmpfY3JlYXRlKHN0cnVjdCBkcm1fc3luY29iaiAqKm91dF9zeW5jb2JqLCB1aW50MzJfdCBmbGFn
cywKPj4+ICAgICAgICBJTklUX0xJU1RfSEVBRCgmc3luY29iai0+Y2JfbGlzdCk7Cj4+PiAgICAg
ICAgc3Bpbl9sb2NrX2luaXQoJnN5bmNvYmotPmxvY2spOwo+Pj4KPj4+IC0gICAgIGlmIChmbGFn
cyAmIERSTV9TWU5DT0JKX0NSRUFURV9TSUdOQUxFRCkKPj4+IC0gICAgICAgICAgICAgZHJtX3N5
bmNvYmpfYXNzaWduX251bGxfaGFuZGxlKHN5bmNvYmopOwo+Pj4gKyAgICAgaWYgKGZsYWdzICYg
RFJNX1NZTkNPQkpfQ1JFQVRFX1NJR05BTEVEKSB7Cj4+PiArICAgICAgICAgICAgIHJldCA9IGRy
bV9zeW5jb2JqX2Fzc2lnbl9udWxsX2hhbmRsZShzeW5jb2JqKTsKPj4+ICsgICAgICAgICAgICAg
aWYgKHJldCA8IDApIHsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBkcm1fc3luY29ial9wdXQo
c3luY29iaik7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+ICsgICAg
ICAgICAgICAgfQo+Pj4gKyAgICAgfQo+Pj4KPj4+ICAgICAgICBpZiAoZmVuY2UpCj4+PiAgICAg
ICAgICAgICAgICBkcm1fc3luY29ial9yZXBsYWNlX2ZlbmNlKHN5bmNvYmosIGZlbmNlKTsKPj4+
IEBAIC0xMzIyLDggKzEzNDksMTEgQEAgZHJtX3N5bmNvYmpfc2lnbmFsX2lvY3RsKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4+PiAgICAgICAgaWYgKHJldCA8IDApCj4+PiAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4KPj4+IC0gICAgIGZvciAoaSA9IDA7IGkgPCBh
cmdzLT5jb3VudF9oYW5kbGVzOyBpKyspCj4+PiAtICAgICAgICAgICAgIGRybV9zeW5jb2JqX2Fz
c2lnbl9udWxsX2hhbmRsZShzeW5jb2Jqc1tpXSk7Cj4+PiArICAgICBmb3IgKGkgPSAwOyBpIDwg
YXJncy0+Y291bnRfaGFuZGxlczsgaSsrKSB7Cj4+PiArICAgICAgICAgICAgIHJldCA9IGRybV9z
eW5jb2JqX2Fzc2lnbl9udWxsX2hhbmRsZShzeW5jb2Jqc1tpXSk7Cj4+PiArICAgICAgICAgICAg
IGlmIChyZXQgPCAwKQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Pj4gKyAgICAg
fQo+Pj4KPj4+ICAgICAgICBkcm1fc3luY29ial9hcnJheV9mcmVlKHN5bmNvYmpzLCBhcmdzLT5j
b3VudF9oYW5kbGVzKTsKPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
