Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502223089CD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 16:16:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22AB6EB57;
	Fri, 29 Jan 2021 15:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8FAC6EB56;
 Fri, 29 Jan 2021 15:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/mqURByorLCDbj/v84nXtfH07Ev2Tfim1PFs0mbrYzZTyuCWFotGtmULS9tkKUgicakM+gmwRMbL6Yoqz1M6FP3UvNbghK6xZNHh8wVOMPoLKzhMbVzxcnb2avfHi9Gt7q3EK49Qpqz7xpVuWe5740hhJ9sLtHmeRF+UDo9HJVTQpcPfvUtV4lPDI/sivszk+e1d3rSO6UNu8BmqfyHO9/k07lcFKb66j2q0yShAyqO7/kPnBIbPbzgrXCYPKeplYHUF6ZBIMQlJpEaDjQxUcYESxiWzzxSLfVCCx8iR8kJIYvxkEYmuBJvYay0r7selIpAbjN9BKz6ub9oMkTp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFmtF3GpsldP1RA/90OKQX7bnyiSugbvCRFYuN1xDOg=;
 b=igHYbwH+aTFkuLEr/HWt9cM37lMuq4PZuRA0f1RQCBGRdBq5Ol4VuCgytYaufJ5C0eB1VS6fbSKwbhFFmzAZqd9QyD4JpNeyv2e1JpO4f9l1onHu20qgxEqIr1soSrmBoO6L115yABPclA+ymM+uDYGHoToowpQHRrWJU1iutnkO4G2Hs0k/P6x2Tn68YW4HHfAeTYI6FM5CcAujqtrOW2CqEyN1X4aB6P0sjWKVo/kjbokHxCrkkMo4KwAjjrTfilWM691wG6I/4M/sh65yMPXctg59V6hsNTn+D/sBd9aNhHqFTj0wVpSfI0YtTS6jrQ2GS2roltBvzvlFn9ONhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFmtF3GpsldP1RA/90OKQX7bnyiSugbvCRFYuN1xDOg=;
 b=vHWMEE50M77DJ+hBvpn/C6HjRtZG35MzIx1cSKogqTyeD46MxHrUfySIuNo2gMT1ag5RgskeM8CBSJG0+bXZdzIZIwjaZrfVTfvWaO0RBB3JgdugfNehAgptpdjtcZY8+RaFSFNkZp7jebyhTA94Dh+KuDQAXWyccDtf67QCVSE=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4191.namprd12.prod.outlook.com (2603:10b6:208:1d3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 15:16:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 15:16:27 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
Date: Fri, 29 Jan 2021 16:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0134.eurprd07.prod.outlook.com
 (2603:10a6:207:8::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0134.eurprd07.prod.outlook.com (2603:10a6:207:8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 15:16:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e0550397-23f6-4363-92cb-08d8c468d8db
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41917AF482B76964F7C5F8AA83B99@MN2PR12MB4191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4K4MQtA6jayvSHKM3jYcKtYIOPgj0zEzKzngESDiGj4M+gHTIw/aQ6wXZ/ofXUu9HIcTf5U2U0/KeuzasZF29HFEWFld3FkLkmkwK1aRr4L4LzdpKnPOPULja2xhq+xf8Dl6/2l/FrKUyhU+kJwafQnxipevGM73zZisZMZ4UfDedn5x+v2vb/sPOBNXsioBzkg3Aay3/OhZO4QMUeCIq9OEUX0+JjvZvKhX0PeYgDY6OHwizFLdmbJMyEjXaVmssqdMdaP0Ib2uEKO/ezE3cfZm1SzS0UirRzrg5tr97iSH/LtebrGDFO8V8/HC7CCqE+t/nYm+3P2LGVurQ1GuaGSxDEz//T5B6/X+k7Re94S/Wd9KgTt707osHjlh4/TGfmFTkXYFur1MjlGa6ahlcvbeq1Z8Ex+u2gbyNmRClM+qKQLotV/d8EvwGH0/OlbGO3KkgL/vbNUiZffwAa6AN6ObnG0jmUKBEwpwjAI7DGH3N+9p7oXa1PEDMwhnsfYoOQKpYwP24u5nOgLxU+Y5CysnpqwdStxiA0Y77rnziXyY3SPTv6sJPPuNCpzfY+/Y275PyiD+yzMUiulYQ4mar0zEWlFYlkrcp0tXoCOI7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(36756003)(66556008)(4326008)(66946007)(2616005)(478600001)(66574015)(31696002)(186003)(52116002)(66476007)(16526019)(6666004)(31686004)(54906003)(83380400001)(53546011)(6486002)(110136005)(8676002)(316002)(86362001)(8936002)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b05JY1JEazRuWnQ0ZHorcEltUE5LUVFzeVVuUGdGVkh1aHZRL2J4Y3NJb1JW?=
 =?utf-8?B?Yi9YcjZ2NDRMN3VydFZybzFrYmhpMVRZWDhocjJYMDk5ME5DWEU2UStpWUND?=
 =?utf-8?B?WFpNK0I4MnVNanR2bDdNcmFpc0dSMjV0ME1JVHg2Sm5VUUQ5L2FaQ3BsZVFH?=
 =?utf-8?B?bDJldmhxcFN4Q2ZMOUJYVVE3QWNnejFML3daVmEzRDVlSmZKb2RUbFZOUnlE?=
 =?utf-8?B?ZWhGdVpWa2l0VzhYQm5LclhuZmVySmlJRlUxQXoyazRrQjZZNnh6Z3ZPckdl?=
 =?utf-8?B?MTVJLzNETWZKTEFMd2g4cnJEQjVwWEVmSlZRRzVkSWlaOG1NaTV2Yk9lVWRz?=
 =?utf-8?B?Z3RkSEp5L3JLRHVoOS8zMkM3Z2k1bkdnQi9HbzMrZ1Bpa3ZhOEhOeHRIRzU2?=
 =?utf-8?B?Sjk1b1lCV1lrWmFQdzlZejVzUTNZdjVsb2pTQnNFdDM5SEZJQXV2L0k3Umlz?=
 =?utf-8?B?YUJoclFNckk3aTFvV1hBOWV3L2tiaVU3dU1CYzBKU2RaV1ViOW54VjR0ZWxp?=
 =?utf-8?B?U01CS1VYZkxTR04ySllETzhUMGt6b2NJbDkrSnN5YnlBQThjZXVadTBlSCtp?=
 =?utf-8?B?a1hRcVZRL3hRZHJvL0x0aTNDUkJubXg5cHVIblY0c3JwS1BSZ1gxN1JFeEZp?=
 =?utf-8?B?dDNzdDVaWGYySFQveFp2S3hzSXpuTkd6WGphUXZ0OTBOcGR2djRNM3htTC9o?=
 =?utf-8?B?Q0ZuOFUzdHFhdEd0TnJZbENOdVFBSlJqYStKb2RUVys4dzQyQ2xZdWRQelpY?=
 =?utf-8?B?cE8vMWI2K3U3S0owMHZNSGZwa3hHRUFsOXZiamJ4NVprN25LdUVpRTdlMW9r?=
 =?utf-8?B?RytIclpTN2RRazYrT0FwMVFBbU9UanF2MDdrb0V0QVFsUzV3LzNVNWp3enVw?=
 =?utf-8?B?aW02RUpOQ1dpZDYxVVM2NDlleU03SlhUak9RNVRIZ3BBL3o2eWt4ejFvT0VF?=
 =?utf-8?B?cldpMXcvSG4vRk5ZU2RQUUxDMW45bXhYNTZscWVDdnRHNGRkVnJ4MzM2N0d0?=
 =?utf-8?B?UThUa3ZrYkRsbDJpSDlCZm9FemtSc1k1TS9vUEgwMldLeGVrRXVFZTE1Qjdq?=
 =?utf-8?B?YmRTdDkwWkI0OVNnMU8zWnVwbE1uVXBNTExqbEwvSmRXSEJob25NenFEVHEy?=
 =?utf-8?B?RGw2WVQ0blRwSXVhejRrWGJBaEwyYW1GYTZnV2hQdG1EbHM0bWNCdm1ZL0U1?=
 =?utf-8?B?blpRWjF5SUNpOTVaZ0lxUHR4S2QvVWhUY1BBM0Jwc0xucHJoQ2N1MzNCc1Jo?=
 =?utf-8?B?RDFOZFIvTEt1Q0ZDR3AzSGU4Q3lmQk1VSlRzOGhBOCs1RU9LRTlpd3d5eElj?=
 =?utf-8?B?bCtaV0M3T3BQeFZLUVBjYVFaMWFzcVYyNS9kSUNPWTNmYmd5L0hsbE5DMElH?=
 =?utf-8?B?SkNERStnV0VOeWlEQ2hqU0RNelFmN240bVlGTjJzWGhTVGpsWGJpZXExWmRy?=
 =?utf-8?B?Mk9wbVcxd2czczJVSVgwbXZHVlVVbGUvZlNjQnIybVpWblZPQTg2ZFdoQWN4?=
 =?utf-8?B?b1Zla2N4S3pzcUYyR1RGYVQwREs2Mjd3TEgybExuUVB1blBITHBBem5OL3hk?=
 =?utf-8?B?cmVFQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0550397-23f6-4363-92cb-08d8c468d8db
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 15:16:27.1813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qg2ApxfNZk6zxlIiZg1ZZ05qksTPwATxADfHJqxPEEgLo9dpmjHJKPJHszO738ka
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDEuMjEgdW0gMTg6MjMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEv
MTkvMjEgMTo1OSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTkuMDEuMjEgdW0g
MTk6MjIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Cj4+PiBPbiAxLzE5LzIxIDE6MDUg
UE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4gW1NOSVBdCj4+PiBTbyBzYXkgd3JpdGluZyBp
biBhIGxvb3AgdG8gc29tZSBoYXJtbGVzcyBzY3JhdGNoIHJlZ2lzdGVyIGZvciBtYW55IAo+Pj4g
dGltZXMgYm90aCBmb3IgcGx1Z2dlZAo+Pj4gYW5kIHVucGx1Z2dlZCBjYXNlIGFuZCBtZWFzdXJl
IHRvdGFsIHRpbWUgZGVsdGEgPwo+Pgo+PiBJIHRoaW5rIHdlIHNob3VsZCBhdCBsZWFzdCBtZWFz
dXJlIHRoZSBmb2xsb3dpbmc6Cj4+Cj4+IDEuIFdyaXRpbmcgWCB0aW1lcyB0byBhIHNjcmF0Y2gg
cmVnIHdpdGhvdXQgeW91ciBwYXRjaC4KPj4gMi4gV3JpdGluZyBYIHRpbWVzIHRvIGEgc2NyYXRj
aCByZWcgd2l0aCB5b3VyIHBhdGNoLgo+PiAzLiBXcml0aW5nIFggdGltZXMgdG8gYSBzY3JhdGNo
IHJlZyB3aXRoIHRoZSBoYXJkd2FyZSBwaHlzaWNhbGx5IAo+PiBkaXNjb25uZWN0ZWQuCj4+Cj4+
IEkgc3VnZ2VzdCB0byByZXBlYXQgdGhhdCBvbmNlIGZvciBQb2xhcmlzIChvciBvbGRlcikgYW5k
IG9uY2UgZm9yIAo+PiBWZWdhIG9yIE5hdmkuCj4+Cj4+IFRoZSBTUkJNIG9uIFBvbGFyaXMgaXMg
bWVhbnQgdG8gaW50cm9kdWNlIHNvbWUgZGVsYXkgaW4gZWFjaCBhY2Nlc3MsIAo+PiBzbyBpdCBt
aWdodCByZWFjdCBkaWZmZXJlbnRseSB0aGVuIHRoZSBuZXdlciBoYXJkd2FyZS4KPj4KPj4gQ2hy
aXN0aWFuLgo+Cj4KPiBTZWUgYXR0YWNoZWQgcmVzdWx0cyBhbmQgdGhlIHRlc3RpbmcgY29kZS4g
UmFuIG9uIFBvbGFyaXMgKGdmeDgpIGFuZCAKPiBWZWdhMTAoZ2Z4OSkKPgo+IEluIHN1bW1hcnks
IG92ZXIgMSBtaWxsaW9uIFdXUkVHMzIgaW4gbG9vcCB3aXRoIGFuZCB3aXRob3V0IHRoaXMgcGF0
Y2ggCj4geW91IGdldCBhcm91bmQgMTBtcyBvZiBhY2N1bXVsYXRlZCBvdmVyaGVhZCAoIHNvIDAu
MDAwMDEgbWlsbGlzZWNvbmQgCj4gcGVuYWx0eSBmb3IgZWFjaCBXV1JFRzMyKSBmb3IgdXNpbmcg
ZHJtX2Rldl9lbnRlciBjaGVjayB3aGVuIHdyaXRpbmcgCj4gcmVnaXN0ZXJzLgo+Cj4gUC5TIEJ1
bGxldCAzIEkgY2Fubm90IHRlc3QgYXMgSSBuZWVkIGVHUFUgYW5kIGN1cnJlbnRseSBJIGRvbid0
IGhhdmUgb25lLgoKV2VsbCBpZiBJJ20gbm90IGNvbXBsZXRlbHkgbWlzdGFrZW4gdGhhdCBhcmUg
MTAwbXMgb2YgYWNjdW11bGF0ZWQgCm92ZXJoZWFkLiBTbyBhcm91bmQgMTAwbnMgcGVyIHdyaXRl
LiBBbmQgZXZlbiBiaWdnZXIgcHJvYmxlbSBpcyB0aGF0IAp0aGlzIGlzIGEgfjY3JSBpbmNyZWFz
ZS4KCkknbSBub3Qgc3VyZSBob3cgbWFueSB3cml0ZSB3ZSBkbyBkdXJpbmcgbm9ybWFsIG9wZXJh
dGlvbiwgYnV0IHRoYXQgCnNvdW5kcyBsaWtlIGEgYml0IG11Y2guIElkZWFzPwoKQ2hyaXN0aWFu
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
