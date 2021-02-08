Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A83131F2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 13:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D049F6E89D;
	Mon,  8 Feb 2021 12:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367FA6E1F9;
 Mon,  8 Feb 2021 12:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CM6EiUZs71SgnFYE1ns+0wDl4tmIrd1lxi1p0Hc2KXsIs3zKLlExWSDas5+pjx3U2CF/lAWs4y2sZujnZq35Ksaf6P3BqntIYKQcyV1J6UmVgzbN+ziZzu10FTuZ8CVfIVFmINXt+d9S+/FlhVZqUqM62bdoXgVL4LK8ZF2qp2KntQ+YM5l7Cvaionzq+8fh7aNYIOkCHyIFEP4e3tLGOTD3B1+p6P8JplTUnNBEZNgEtNJ8APfEYSWWz33Ja+1Mt6PQa+YosC6rdMuj2wpq5PcxKqxrkovmiNk/McMJYOmN4/nPM/GxFnlnPsSygjhgbMmogAfT47J8OQJzXZbAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7cp3d5PdEbwJD96QXJ6NN3uF8k8qzXjcQ1n1dC/U4M=;
 b=Ky15JuauYGy4rsP5inwOlYPVxYCRxBr+QJByy1eZ6Y+URzWJxBSJfXXoHAR8Se01Xh7PnyOnyLtMjqz697OH1etG4+uoDbYRAuiSd+6EaJe4QZIrxQcyiiVYFdRynZLuplHjKg2NOl3lZ3kYyAkQMrVKvmMnWNboo+JwqznUAPrU3THn19Fg8Phk1IkldEGl2Fx+siPL7zyF0ntqyJGDXwHCTB+FcA7RIGEr+gWw3+VZZByXM78sCqV6IOeALaC6z9AHcjzBF7FLzeuoLohecYrulEzrlas7KU5WlfzUarcagXar2KPdf4B2bL9m/ii2pIQ1ApWz1/byTW/Fvoyuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7cp3d5PdEbwJD96QXJ6NN3uF8k8qzXjcQ1n1dC/U4M=;
 b=On3XXYJycuLoQL+S2ug2DqK+0VfsDaywBb6tpJzXAnA/ltZck8tzk2rfDWKNzKEemEFHki/hiYivVrF8h5fA06PlwOtQhXvxJtpUkxqtPVAvex71cKip2qgC3oE28VR/mgqQPQ5bBTTDeZt83ayQKMDL5lSjAY8lv+g0xvEEDuw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Mon, 8 Feb
 2021 12:14:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 12:14:55 +0000
Subject: Re: [PATCH] drm/amdgpu: fix potential integer overflow on shift of a
 int
To: Walter Harms <wharms@bfs.de>, Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 Junwei Zhang <Jerry.Zhang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210207230751.8576-1-colin.king@canonical.com>
 <c6c99dba-aea9-304c-2246-e24632955479@amd.com>
 <3aed86cfb8014badbcbc4ee9f007976d@bfs.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <877bdf13-08d3-b471-40fb-02941cce3e4e@amd.com>
Date: Mon, 8 Feb 2021 13:14:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3aed86cfb8014badbcbc4ee9f007976d@bfs.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:205::41)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:205::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20 via Frontend Transport; Mon, 8 Feb 2021 12:14:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f643ca1c-307f-4a66-a7af-08d8cc2b2526
X-MS-TrafficTypeDiagnostic: MN2PR12MB4343:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4343A284A015D17CEED93379838F9@MN2PR12MB4343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spGpbA4CIkWtOQ9ynagqgpYWCs2jVUlF1/bvuSlsIHautJJDZ8yShf424guU2OBTxGn7Dg0MITVvb7lbuezdzHR64NSloBtW6DJcQv/gpkbDdEBpwEKWg/grOBwnmnzWetg6yKCG4o2s3DJg5dV04zXWI0dM0aTxcQRFJArToZwsfMTXE1ORVN1vHf9ulRT1T0K33Ppql7HUw9EgUGheuhAnD1SKT85MdceLXbwhyoqHhZKalT0peJMCCGKSDhJVBr4wJqblAaVGxs65Vnp2qLsZuqx+JcD1AWKuXu5KnHRu36eX/dDyQ9MIx7hMxDOqrFWYgTkEltny9Utp0nmbV0cD1IbkWEwnFdKoIG6IBQJSIraSab9A/a9RqdSmR9CY8b12LytmKdsYqBFVgMwa8AbTI5e9RQUajaoyqDgHlGIWGGMk+cCAHJOws0GZ8SwbQLDXWRnHThRZoiPQSQHnadWAFwGsDwl12l5HDukZYZ8gPyUHOeGUgWqYUz9K4zmRtSxA4LL2MgaMJ1DbnZUowo52WZJxohYc14EgNrn92O26Hi9isA99QSAuitI3bTpyVbkMY5ExW3PQBijp4aPI1WbaCytK0gOn86fTFBnJ2XQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(36756003)(54906003)(5660300002)(186003)(8936002)(2616005)(478600001)(86362001)(6666004)(16526019)(31696002)(110136005)(66946007)(316002)(4326008)(66476007)(31686004)(66556008)(8676002)(66574015)(83380400001)(52116002)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?akI4eU51YXNmRFk4eEY4UmFveFVaTm1EMnNLVS9zM3NWbXpKMWxPZ1VJbU02?=
 =?utf-8?B?eW1vRGorVUZ3eFQ4U1psV0ROQVZnQUtZZTZpUnBUZXdMSTdKenhJVDdFMjFa?=
 =?utf-8?B?dkF6dHZCbW9rTnpKWjB4QzZxbUFjVFFhV01QL0RUaUtuSWVZTkpRamthZERI?=
 =?utf-8?B?RGgrQ1RCK2NTNHRLVnpNMnA3ZWJXcjl6RWdwN2s2TmhOeXV3Q0xuL3NTbHc4?=
 =?utf-8?B?OVhla0FaMXhtcXVlOGdqdUVQWklKd2E3S08vKzVPamx3NTNPRS9lTzJVTzhk?=
 =?utf-8?B?cCtRY0NQTzViK3FJY1NvMThVbXRxSjRSd1BBTzlYU3pXenYxcGk0MXJpNVB4?=
 =?utf-8?B?dk1FenVhS2MwR0Fnd1ZRZVlacWpCNjl1VVpzOVhzOE1nUC9WQi9ST3BpYURZ?=
 =?utf-8?B?MkdzN01Fak5PUHBpOGU3RzdrOTRCTmVzZGd1QnRDeGJNd3RRa0pIZUJtQ1VP?=
 =?utf-8?B?OWVwRE96aXhDektNREtOWHN5Z1h5TDNjNC9ZQzZwejg4WXNyUk9YOVQ2OHV3?=
 =?utf-8?B?VFc5NjFtb2hXejlQT3YxUXQ4cjNCSHc5WGhjSjdyOTdEeElDTjVyRkhEeERk?=
 =?utf-8?B?bzlETTh4ZnhLMFBwZGlOUDJIL0IvL1JYMzg3ZWx0SGNPaGhwMjZpUjJzcGNw?=
 =?utf-8?B?WHhRRFZpVXlkcGFVcWE1SFdiWnd5aTNSWWFuZnpySGdQKzZqREd2ME9hNzFT?=
 =?utf-8?B?U0lwSjdrS1ptZ0krdjlQRjAwYVJkdHZ6VjdaK3ZSQldRem14RWJwbnNVc0k4?=
 =?utf-8?B?OEZIUFMyT1Jza3AvSWpwVG1MdkVZbkZsSXY4WlorekxwWExHOFYxMzdnK1pz?=
 =?utf-8?B?cDJ0THRNUU9qdXFVa0laWGh4bmFFRUlZTlBCMFNBOVAxaks4SFNBN3dwQmQ1?=
 =?utf-8?B?dHZzWXJPbUZMYVV5TDlQSHBmWFRHMDdDZUVUalhIUU5tMlhVTWtpN0tsVjVY?=
 =?utf-8?B?QzJRaHVRemhQOTg1Y3dhR0dTQk80YlJMd3NEMGYyQWxhWmJjN290VElIMkRr?=
 =?utf-8?B?SUtKZFRrNTZlcTMybWFkNm5jTmx5TTAvakJNaEVGZlBHRDkyZFlFVUF5SzA4?=
 =?utf-8?B?UHkwSzdWbXhPRUFPNmpoaXVRb01BeTBzdm1LR1VMRjY0MEJ6N0pDb25Jamoz?=
 =?utf-8?B?a0hZUlpDQWpQYmZjVlNyc1BySUorNVJqUzEzNVBkUVBxeGJ0c1JQSEEwVFk1?=
 =?utf-8?B?bDZ3SHBsOEFWS2VhNU4wc3MzRGF4VTFqcHhkN1M4eHMxdjlDMDlISVlkQm1z?=
 =?utf-8?B?NDFWeEdwTjV1TmFDc1JDZkRWK1dQUVNLSjhLa1pQdlF1YnZYWFhKeXRwaUxR?=
 =?utf-8?B?aTJZandxYmo1a0drMm5jd2RISk51amp2SjdQNFBseFc4L2VMSUV2RkF1dHI2?=
 =?utf-8?B?T2NNcCtYbzZVbWx2REFSOHFmQ094dVIyaUpNWkxkVDB5V1VWTTVaMUxJRnJk?=
 =?utf-8?B?eWQwQnN0RzhUUEpPTTlvdklxY3hSQ2JEUExidGZLTmdWakhBVmN4N2ZobjBM?=
 =?utf-8?B?ZW9qOEVSbmh6RUZsSElPRzErejNnMjhuT3RmNnlwZndtL2tGNU9BOVExekps?=
 =?utf-8?B?dlRsS01ranZjdjZpbWVOZWhVc3IwSno1bi8vaVdHRWI4ZW1VYkZnVlg4MFZR?=
 =?utf-8?B?SklMZ2Z5VFZWRlM2WDdXMjlpT3lnejFENkFDZlA4Z1dHd0RaWnVEVjN3Vllw?=
 =?utf-8?B?MEdYREgwSGlabmFjSEFWaC9POVM0dS9pVlMxNEVvL2RzU2VTRmhzUzVJMVl5?=
 =?utf-8?B?QUgxTTRQdXZmVHo4b1p1NWxyc3ZKUHZTaVh6NTNtVTlVOE1iRkViT1hxS2ph?=
 =?utf-8?B?R3ZRbEIxSmoxUkxWZG1UOWtDbGxwY1ZDOTBxZXJmNS9idUxFWmM2eUI4b0kz?=
 =?utf-8?Q?qJ/lpnMZWwSOy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f643ca1c-307f-4a66-a7af-08d8cc2b2526
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 12:14:55.8941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRQoA3+6S55jpvZitHIQsLu6zmRZiCo/bjMnBNjhlTuTtaAEgnpqittC1LCYky1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHN0YXJ0IGFuZCBlbmQ/wqAgVGhlIGhhcmR3YXJlIGhhcyA0OCBiaXQgYWRkcmVzcyBzcGFj
ZSBhbmQgdGhhdCB3b24ndCAKZml0IGludG8gMzJiaXRzLgoKT25seSB0aGUgZnJhZ21lbnQgaGFu
ZGxpbmcgY2FuJ3QgZG8gbW9yZSB0aGFuIDJHQiBhdCB0aGUgc2FtZSB0aW1lLgoKQ2hyaXN0aWFu
LgoKQW0gMDguMDIuMjEgdW0gMTI6MDUgc2NocmllYiBXYWx0ZXIgSGFybXM6Cj4gaSBhbSBjdXJp
b3VzOgo+IHdoYXQgaXMgdGhlIHdpbiB0byBoYXZlIGEgdW5zaWduZWQgNjQgYml0IGludGVnZXIg
aW4gdGhlIGZpcnN0Cj4gcGxhY2UgPwo+Cj4gcmUsCj4gICB3aAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBWb246IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPiBHZXNlbmRldDogTW9udGFnLCA4LiBGZWJydWFyIDIwMjEgMTA6
MTc6NDIKPiBBbjogQ29saW4gS2luZzsgQWxleCBEZXVjaGVyOyBEYXZpZCBBaXJsaWU7IERhbmll
bCBWZXR0ZXI7IEh1YW5nIFJ1aTsgSnVud2VpIFpoYW5nOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBrZXJuZWwtamFu
aXRvcnNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQmV0
cmVmZjogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogZml4IHBvdGVudGlhbCBpbnRlZ2VyIG92ZXJm
bG93IG9uIHNoaWZ0IG9mIGEgaW50Cj4KPiBBbSAwOC4wMi4yMSB1bSAwMDowNyBzY2hyaWViIENv
bGluIEtpbmc6Cj4+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5j
b20+Cj4+Cj4+IFRoZSBsZWZ0IHNoaWZ0IG9mIGludCAzMiBiaXQgaW50ZWdlciBjb25zdGFudCAx
IGlzIGV2YWx1YXRlZCB1c2luZyAzMgo+PiBiaXQgYXJpdGhtZXRpYyBhbmQgdGhlbiBhc3NpZ25l
ZCB0byBhbiB1bnNpZ25lZCA2NCBiaXQgaW50ZWdlci4gSW4gdGhlCj4+IGNhc2Ugd2hlcmUgKmZy
YWcgaXMgMzIgb3IgbW9yZSB0aGlzIGNhbiBsZWFkIHRvIGFuIG92ZWZsb3cuICBBdm9pZCB0aGlz
Cj4+IGJ5IHNoaWZ0aW5nIDFVTEwuCj4gV2VsbCB0aGF0IGNhbid0IGhhcHBlbi4gVGFrZSBhIGxv
b2sgYXQgdGhlIGNvZGUgaW4gdGhhdCBmdW5jdGlvbjoKPgo+PiAgICAgICAgICAgICAgICAgIG1h
eF9mcmFnID0gMzE7Cj4gLi4uCj4+ICAgICAgICAgIGlmICgqZnJhZyA+PSBtYXhfZnJhZykgewo+
PiAgICAgICAgICAgICAgICAgICpmcmFnID0gbWF4X2ZyYWc7Cj4+ICAgICAgICAgICAgICAgICAg
KmZyYWdfZW5kID0gZW5kICYgfigoMVVMTCA8PCBtYXhfZnJhZykgLSAxKTsKPj4gICAgICAgICAg
fSBlbHNlIHsKPj4gICAgICAgICAgICAgICAgICAqZnJhZ19lbmQgPSBzdGFydCArICgxIDw8ICpm
cmFnKTsKPj4gICAgICAgICAgfQo+IEJ1dCBJJ20gZmluZSB3aXRoIGFwcGx5aW5nIHRoZSBwYXRj
aCBpZiBpdCBzaWxlbmNlcyB5b3VyIHdhcm5pbmcuCj4KPiBSZWdhcmRzLAo+IENocmlzdGlhbi4K
Pgo+PiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW5pbnRlbnRpb25hbCBpbnRlZ2VyIG92ZXJmbG93
IikKPj4gRml4ZXM6IGRmY2Q5OWY2MjczZSAoImRybS9hbWRncHU6IG1lbGQgdG9nZXRoZXIgVk0g
ZnJhZ21lbnQgYW5kIGh1Z2UgcGFnZSBoYW5kbGluZyIpCj4+IFNpZ25lZC1vZmYtYnk6IENvbGlu
IElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4+IC0tLQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDIgKy0KPj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4+IGluZGV4IDlkMTkwNzgyNDZjOC4uNTNhOTI1NjAwNTEwIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiBAQCAtMTQxMiw3
ICsxNDEyLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X3ZtX2ZyYWdtZW50KHN0cnVjdCBhbWRncHVf
dm1fdXBkYXRlX3BhcmFtcyAqcGFyYW1zLAo+PiAgICAgICAgICAgICAgICAqZnJhZyA9IG1heF9m
cmFnOwo+PiAgICAgICAgICAgICAgICAqZnJhZ19lbmQgPSBlbmQgJiB+KCgxVUxMIDw8IG1heF9m
cmFnKSAtIDEpOwo+PiAgICAgICAgfSBlbHNlIHsKPj4gLSAgICAgICAgICAgICAqZnJhZ19lbmQg
PSBzdGFydCArICgxIDw8ICpmcmFnKTsKPj4gKyAgICAgICAgICAgICAqZnJhZ19lbmQgPSBzdGFy
dCArICgxVUxMIDw8ICpmcmFnKTsKPj4gICAgICAgIH0KPj4gICAgfQo+PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
