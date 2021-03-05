Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B808932EC11
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 14:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79EE6EB80;
	Fri,  5 Mar 2021 13:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7B96EB80
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 13:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCNkVkRphugqTJERJJGF6cobw329uf/jocqyoE+UAC0mW1ws+dbf/OaX7jfxyf/7MV1Umck57hShpPyarzFREgK3ctWtmshyQ9cL+wqBLgrNxdxW4HRPVUi5QuMS6tWhUB2LQMvytFLFUGgj79IFR2bArSUpA2dO635LX39VNdIZVR9vMkLWmjmzWst18p7a8+JZF/KyVHFb2Gp6oRl7qeZ+vedA9+JGYEAuPB9W3Uz3UxDHazRvuGnQ+Am5sdFqpIqEjMVqefyNabvPBYjgPbOZhyr35XhVCX1Qgq64F0odmqsGf5fHCeiE6Jj33MRoomoezlHeVtWD3yJ6glUP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KngaJPF18x9YFgj27YDEbAKJqJ/jCOvTCoHabTgzi2Y=;
 b=QhRSZBFeWtQAmDCVo6aTBKwPXjx9KQwONaecKsW/gIluIwMR2RLd7P7aV4cUy6jnhS9RDmb4iEsiYUKpo05V2PYwYoTqtKf2spHtHnp2mHfncijuWQQacUyYf+0GdeDBHAr0vqErwpTnoORQlNd88PflOvg6NC0Yhv21BysG2jyTKQgK2ZE7r0nbeHlgl+5QUFx+kWEkddqaaYzhDc4rpp0gNHqVZ8f5dY1lyO//sEJ410gSmsi7WTpBRYayKvvXl7MkzYEg9l62NA2H8RZXH/g0teD/PVcX/AOYyiNZy5RYfVRElMDbeizXCBc/VKiOIdnAGNloVE0x0aKfqORkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KngaJPF18x9YFgj27YDEbAKJqJ/jCOvTCoHabTgzi2Y=;
 b=Ezz/6xRKU/P7w3EWKnXpCmaIYnK9ZFL+/LRJxiOCYFQ5BfeAz2i1vayMItxB9r+Icuv3SBYErEcehKp8tt+zKGEEugpXgjTOgbVPQkFNPzu14sc88XIbIV8f6dv2uYs78GcGhqOflv2ZsiCe4/Q5mXQNDektgxi3+o41eegm99A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR12MB1416.namprd12.prod.outlook.com (2603:10b6:903:44::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 5 Mar
 2021 13:27:44 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3890.030; Fri, 5 Mar 2021
 13:27:44 +0000
Subject: Re: [PATCH 3/3] drm/amdgpu: use tiling_flags of struct amdgpu_bo_user
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>
References: <20210305125659.9923-1-nirmoy.das@amd.com>
 <20210305125659.9923-3-nirmoy.das@amd.com>
 <d37e05ac-2a07-4e9d-1c38-e3909c00410b@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <091cca4b-1067-6827-c458-a60db8be9cb7@amd.com>
Date: Fri, 5 Mar 2021 14:27:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <d37e05ac-2a07-4e9d-1c38-e3909c00410b@amd.com>
Content-Language: en-US
X-Originating-IP: [217.86.122.77]
X-ClientProxiedBy: AM0P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::17) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (217.86.122.77) by
 AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 13:27:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 049414bc-3c66-45ed-54df-08d8dfda75a3
X-MS-TrafficTypeDiagnostic: CY4PR12MB1416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB141628256D75056B06E8D8268B969@CY4PR12MB1416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PEKo6dsnjRC7yN5ualgMKjChE534UPHkgx2UKusO0ip0mK0uVPGJ4oMbXJh1pcwLCLLh3g+/Fvgb3yiK+lAG1gzflKsUnVmyzDA0ikXLvZkJlcR5J+bHuOK9v7JdYUhmSgTl2u/55o3TcAwP2/5TnLF3F0kBHuAWwDHwJqOhKz7BQje1pDJnVhC0Vj2NpUTV/lQczqYj6ZnI7jKOqbZ6rpypFRjQA6+dW9xXs3ruwseI92KC7z4KgH+KmxWkCFypfQsWnV0Gyu9HImyuECWRIXgXUbhyLd1pKdAAOYPi1ks84He0bGKe6N8huG3kFiM3F8LFBYUZkatbuqhU960KPf8z7GTRPnNgbGiQYmv2H488zpN0O37Rs67K1zJzdxzde9Pt32VuoUyfF29hy/8ZW2pyzaDVhGXpatj5Q50GGfg0oHlh5XC/xMl/rwuobiBb+RQPMV2SKj6NgGqX0jV5EH7mggHKXHj2eqGu3RUbstqMFRZk5KsRe82eXp6uLXEDn2J8ruojFccMMQOyy3aYfzcp9Qr9IicmBcclOQZGciwtapLfVHDJIc55OnahhS4i+rf0Ezht1jQMR5qaiSIw3BVwU2KghqaTfJywGPdd0tc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(110136005)(8676002)(31696002)(66476007)(66946007)(52116002)(66556008)(956004)(53546011)(6636002)(2616005)(16526019)(6486002)(26005)(316002)(16576012)(31686004)(6666004)(66574015)(83380400001)(186003)(36756003)(8936002)(2906002)(478600001)(5660300002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHJGZFJVbnh1ZnNha29xaDZuYXkzT2YxZkg0NjQ5Y1BoK3kxeDMyaHdMZFk3?=
 =?utf-8?B?aVZJYkFTWGZoWFBjWjNzRFQ4dC95UXlERFJaa1YwOHRiUDJlODRTZFhRTTVP?=
 =?utf-8?B?ZmN4YW0xVjcxSEI5NTZlc0d3NHozSlY0bllvUlUxZGVpLzJ4REJ6L1NjWkFV?=
 =?utf-8?B?ejNXUTNoWnlVbEFEQmk3Q01aZ2wxSGE4VUxScEJHNWIzdnh1SDVzZGtDcFlu?=
 =?utf-8?B?d056QjFRbStNU1BhME1OeWV6UFVsdm5XQ2ZudnhDdXMyYmEweW5Fc3ZPRXhy?=
 =?utf-8?B?eTQ5a2ErYnAwZm45Wk1nNGlJZTdqK2hDaTJlckIrUXZRZEhiNXFtMksraUpK?=
 =?utf-8?B?Y1VzRkZScEw2eXM2Q0w1TUZxRlRGVG1CaWF1N1dtR01STkdvTld2eUdsOXEx?=
 =?utf-8?B?TU9ZQWNOUTJ5VFM5N0w3azErWlpGblJNT1lOMG0vY0hCZHdIeUhLMWpFQlBV?=
 =?utf-8?B?amJhNyt5SWRNVklnUmxabHF4b1VoeTV1MHU2NDlXeEtNRjVXVXpZU1ZJSHNV?=
 =?utf-8?B?S25PemNPa0hoMWJUVm1rSmNvN2dBVFZBM0wwbGV5RVpkR255dGMyZ1FxQWEx?=
 =?utf-8?B?aEJhY1JlOFFYb1JFanZpNDJxRm9OeEFvR0ZMdUJ2WVpFZi90WSt2a0JEY2FR?=
 =?utf-8?B?UVdrOC96SlJ4V0RmdDloZ05iSStJVjdzaWR0dmViSHcwWW9pSEtyaEkzYmFa?=
 =?utf-8?B?YWJkYjVyN3FmMmlCY0NUeC9ONzBqaUxLUFFNZndVUHZxTGxUTFI1d0hic1Bm?=
 =?utf-8?B?Zjl1RWJRUTVYS2FPY2tITzIvQklGazJrN2Zxclp1NVZXUkhzT2dmQzJPR1Zm?=
 =?utf-8?B?b3ExdkFzdExBUWdIQW5HV3lCanJVQ1dqRkQ4aVlhbThoMnVsZkhhM0l1ZXI4?=
 =?utf-8?B?TWtRK0h3Q2Y5Zkg5Y3M1ZjBGUEE3SEg2SVNVWUJmN2FpOXV5MDlOMmY5aFhp?=
 =?utf-8?B?SExMSGhXWGh5MThycERFMEtVTHgzaGNKeE9pUVYrUTZzMVYyS0h3M2JOTXEw?=
 =?utf-8?B?S2oyMm1WaC82T1lEUWVuZWVtb0Y3R093ZjRjWG10ZnIrSG5qUjg0Nmxod2dx?=
 =?utf-8?B?enBoNVdJVzNSeEo4cXdHamVRK2tHK3JVZC8rb2hMdWVrbUdEc2ViNWhUb1cy?=
 =?utf-8?B?MzR3R1VqQVZZaDN2ZzFLSlVaWWkya1hZbzFGSkJFTGYvYUtUNTl6Mko3TzNJ?=
 =?utf-8?B?YStvajg0a1BGY2dTMmxlbWc3aFlJcDVSNEZrVDdZVDc3SDdhVDZTZ0I4Q0ZB?=
 =?utf-8?B?c1c2TlRtYmh4SFJuZ2cvWDJTdC9WTnllUjA0UzMyRVBUbGYyaWlTUGEwVGFC?=
 =?utf-8?B?TTJMN2d5WE9mdnh2a2dFNEthUWlpR1BPdjMrUCt3NkxBdy9LcG05b1lQRzdH?=
 =?utf-8?B?QXJ3Q29rRWJFOE5FWnlmdXMxaERhZ3VqT29iaXdxd3JFNVlaSUFpTHI2WnIw?=
 =?utf-8?B?N0tSY1dab2dWR08ya0lSbTVmdW5UbTdSQWRSNWlrYlF0ZTlYdFk4c2ZSTWtY?=
 =?utf-8?B?Z0dBaXZ1TlBtb0xvVWhVR2l1czZuVEJORDEzcHowUU9ia0UzZXhPQnFJTkJZ?=
 =?utf-8?B?S3NFdnRHVHZPZkF6NmNMYWhiNGUvQ3NFeVl5ZDNCNHBTVnFFeHFpMXBGRksr?=
 =?utf-8?B?dHdWdUZmcEMzNnRQZjdUbjdKS1hUUnB2bmsyQjhEL1luVmtnbkhKM0h3RC8w?=
 =?utf-8?B?d2tlTEo0UGhYd1RkcnpSWFgvZ0VDOEo5SWdkQURnSW9nclVKMm9WRzdGNFow?=
 =?utf-8?Q?VgoUHJzzkbp16foJG7L5NvcdxTnwSh9kBS6AXSB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049414bc-3c66-45ed-54df-08d8dfda75a3
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 13:27:44.5007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQmVsXaKKxE94smLV1A5NR7Oc+JO1fWwW0tNJfbr8QEWS0BzfzGH+UrHW8Iw+rg/l4dmOOj02LUWwGlGz5IYFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1416
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvNS8yMSAyOjA4IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDA1LjAzLjIx
IHVtIDEzOjU2IHNjaHJpZWIgTmlybW95IERhczoKPj4gVGhpcyBmbGFnIGlzIG9ubHkgbmVlZGVk
IGZvciBCT3MgY3JlYXRlZCBieSBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGUoKSwKPj4gc28gd2Ug
Y2FuIHJlbW92ZSB0aWxpbmdfZmxhZ3MgZnJvbSB0aGUgYmFzZSBjbGFzcy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgMTkgKysrKysrKysrKysr
KysrKystLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0Lmgg
fMKgIDEgLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5jCj4+IGluZGV4IGYyMTY3OWYzODM4My4uYzE5Y2I2ODYzOTY2IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+IEBAIC0xMTkwLDEyICsxMTkw
LDE5IEBAIGludCBhbWRncHVfYm9fZmJkZXZfbW1hcChzdHJ1Y3QgYW1kZ3B1X2JvICpibywKPj4g
wqAgaW50IGFtZGdwdV9ib19zZXRfdGlsaW5nX2ZsYWdzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCB1
NjQgdGlsaW5nX2ZsYWdzKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKPj4gK8KgwqDCoCBzdHJ1
Y3QgYW1kZ3B1X2JvX3VzZXIgKnVibzsKPj4gKwo+PiArwqDCoMKgIGlmICghKGJvLT5mbGFncyAm
IEFNREdQVV9HRU1fQ1JFQVRFX1VTRVIpKSB7Cj4KPiBZb3UgZG9uJ3QgbmVlZCB0aGUgQU1ER1BV
X0dFTV9DUkVBVEVfVVNFUiBmbGFnLCBqdXN0IHRlc3QgVFRNcyBCTyB0eXBlLgoKCk9rYXkgSSB3
aWxsIHJlbW92ZSBBTURHUFVfR0VNX0NSRUFURV9VU0VSIGZsYWcgY29tcGxldGVseS4KCgo+Cj4+
ICvCoMKgwqDCoMKgwqDCoCBEUk1fRVJST1IoImNhbiBub3Qgc2V0IHRpbGluZ19mbGFncyBmb3Ig
YSBub24tYW1kZ3B1X2JvX3VzZXIgCj4+IHR5cGUgQk9cbiIpOwo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FSU5WQUw7Cj4+ICvCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIGlmIChhZGV2LT5m
YW1pbHkgPD0gQU1ER1BVX0ZBTUlMWV9DWiAmJgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgQU1ER1BV
X1RJTElOR19HRVQodGlsaW5nX2ZsYWdzLCBUSUxFX1NQTElUKSA+IDYpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gwqAgLcKgwqDCoCBiby0+dGlsaW5nX2ZsYWdzID0g
dGlsaW5nX2ZsYWdzOwo+PiArwqDCoMKgIHVibyA9IGNvbnRhaW5lcl9vZigoYm8pLCBzdHJ1Y3Qg
YW1kZ3B1X2JvX3VzZXIsIGJvKTsKPj4gK8KgwqDCoCB1Ym8tPnRpbGluZ19mbGFncyA9IHRpbGlu
Z19mbGFnczsKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiDCoCBAQCAtMTIwOSwx
MCArMTIxNiwxOCBAQCBpbnQgYW1kZ3B1X2JvX3NldF90aWxpbmdfZmxhZ3Moc3RydWN0IAo+PiBh
bWRncHVfYm8gKmJvLCB1NjQgdGlsaW5nX2ZsYWdzKQo+PiDCoMKgICovCj4+IMKgIHZvaWQgYW1k
Z3B1X2JvX2dldF90aWxpbmdfZmxhZ3Moc3RydWN0IGFtZGdwdV9ibyAqYm8sIHU2NCAKPj4gKnRp
bGluZ19mbGFncykKPj4gwqAgewo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfYm9fdXNlciAqdWJv
Owo+PiArCj4+ICvCoMKgwqAgaWYgKCEoYm8tPmZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfVVNF
UikpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIERSTV9FUlJPUigiY2FuIG5vdCBnZXQgdGlsaW5nX2Zs
YWdzIGZvciBhIG5vbi1hbWRncHVfYm9fdXNlciAKPj4gdHlwZSBCT1xuIik7Cj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqAgfQo+PiArCj4+IMKgwqDCoMKgwqAgZG1hX3Jlc3Zf
YXNzZXJ0X2hlbGQoYm8tPnRiby5iYXNlLnJlc3YpOwo+PiArwqDCoMKgIHVibyA9IGNvbnRhaW5l
cl9vZigoYm8pLCBzdHJ1Y3QgYW1kZ3B1X2JvX3VzZXIsIGJvKTsKPj4gwqAgwqDCoMKgwqDCoCBp
ZiAodGlsaW5nX2ZsYWdzKQo+PiAtwqDCoMKgwqDCoMKgwqAgKnRpbGluZ19mbGFncyA9IGJvLT50
aWxpbmdfZmxhZ3M7Cj4+ICvCoMKgwqDCoMKgwqDCoCAqdGlsaW5nX2ZsYWdzID0gdWJvLT50aWxp
bmdfZmxhZ3M7Cj4+IMKgIH0KPj4gwqAgwqAgLyoqCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggCj4+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCj4+IGluZGV4IDMzMmUyNjljM2ZkMS4uNzE2NGMwNzk5
NTM0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5o
Cj4+IEBAIC05MSw3ICs5MSw2IEBAIHN0cnVjdCBhbWRncHVfYm8gewo+PiDCoMKgwqDCoMKgIHN0
cnVjdCB0dG1fYm9fa21hcF9vYmrCoMKgwqDCoMKgwqDCoCBrbWFwOwo+PiDCoMKgwqDCoMKgIHU2
NMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmbGFnczsKPj4gwqDCoMKgwqDCoCB1bnNp
Z25lZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGluX2NvdW50Owo+PiAtwqDCoMKgIHU2NMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aWxpbmdfZmxhZ3M7Cj4+IMKgwqDCoMKgwqAgdTY0
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1ldGFkYXRhX2ZsYWdzOwo+PiDCoMKgwqDC
oMKgIHZvaWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKm1ldGFkYXRhOwo+PiDCoMKg
wqDCoMKgIHUzMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZXRhZGF0YV9zaXplOwo+
Cj4gQlRXOiBUaGUgbWV0YWRhdGEgY2FuIGJlIG1vdmVkIHRvIHRoZSB1c2VyIEJPcyBhcyB3ZWxs
IQoKCkkgcmVzZW5kIHdpdGggbWV0YWRhdGEgbWVtYmVycyBtb3ZlZCB0byB0aGUgdXNlciBCTy4K
CgpUaGFua3MsCgpOaXJtb3kKCj4KPiBUaGFua3MsCj4gQ2hyaXN0aWFuLgo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
