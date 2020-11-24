Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4262C2CB7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714DB6E47A;
	Tue, 24 Nov 2020 16:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885546E47A;
 Tue, 24 Nov 2020 16:22:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAgzj/6Ob0djw8fQgW42o4RYx9X8NQrJGV4cPehPs98yGHgROYC/0QiyP2ay2EYfcySxtmKILD/qdnCjNI8HTRAsbHpOTb7oGAk+ExJfwaPi/XvWwwGVy1hPjW6GjBdFzjRYqY+J6z+bxfUVqwv6ftoTJ+b1ipRlcrT3DIaaCovV9HYYjvJCoWqJ5YJH7LOTg0r2uBJnN29+f5Ezj46fYsp8XUM06Y56aMxtStchN0LJLEq7koy2yaKC9aD0KgkZTdyngxzzjKQ9ntUwH7VjffIKW6pMrffs4Pu0b193wWO84z/lcCvwEo6V44aJNkldlJMXpEazCKfStsjKGViIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEvJ/5uQZosy2Sb3omQOpypQRhub63KwzafKqupj2iU=;
 b=e4pLO7/RNPDzapIkL1ruE9/vT4I3zK3QUH8gO0/LstKdTfOlwith1Zue/FEITuVCLj+1PgM+UAz7ca12GO8JXkzSGL3frczazRQTzFGdT3ivV4nO6OBR6WB0y5BUZ/V2W27mBIfD80/+eUJk17yJEnUz0M9Gzvbg9CNSY1lTTi1cNefpEMhR7A4Wc83bG+FHX9QuRdeOGGLgJN+KoAfPkzaZo6houaGJZPeWGxzT5c6d3v/eMHdLeyYjSD9G1/zBLvQfBAZ9m5lbuC1t9SMS7g59f2uAfLSil3b7Kf8cYhbiFqa53Nm0vlQoJR530MCuYEF6OEBvtMZSGLP3ssxQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEvJ/5uQZosy2Sb3omQOpypQRhub63KwzafKqupj2iU=;
 b=zAJjlZmO3TddZ3BaXc6YfvMYmmtIWm/vIokWy9e1sleokHgwU29poC47iR0RcgMrjI7uRd33INXl6EdYRslJ3W9VHwci+6EEGOcebEnqEjtOQ6M9tgl6hZtbkcd75ZQ3Z2a/F4QrSv4AJW4Kob/LlzjIcz9RopcXegvqJxJM/PU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1434.namprd12.prod.outlook.com (2603:10b6:3:77::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Tue, 24 Nov 2020 16:22:29 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 16:22:29 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
Date: Tue, 24 Nov 2020 11:22:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH0PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:610:75::21) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.231.243] (165.204.55.251) by
 CH0PR04CA0106.namprd04.prod.outlook.com (2603:10b6:610:75::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.24 via Frontend Transport; Tue, 24 Nov 2020 16:22:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1674088a-abef-4ed7-02e3-08d890952393
X-MS-TrafficTypeDiagnostic: DM5PR12MB1434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1434F410F4B98E270FDBDB6BEAFB0@DM5PR12MB1434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +uTCMdSfp5wfYnsRBdyMIvmwxZ5AYjAT6aZwUNIvB+YVOx0HjZAn9cs5bX+wxA2NYU88t1tkU0I/p+1rEkQr7hijdCXWa8/mb7E1Gjqj5j+J/SuDy0O44Cb3NwQdujJ4fIcMUXp1wZO2gFX5pKfHPh4ZR272xT1GcD1FBigik8H0a9ghS1diGhdHRUTUJYUC7SHwo2jg7d5xDa4fqc+KaUceio7EjJgGJl8EGfCVero5Kk7AyrEbY1qnc+YynA6quBGq8sE7l/rEWQMbhTepu2zkckpa5g32KPrbnpWQXGpkuG+Owq6YtSvySWGgeqd+Djbg7RcbPTDLZHhbtvcJOaG5RrZvgbibQo30W3q+naXyE0xrxMnwOrZdvIDXqcR9ie6kcVZR9x2Vhnb+AVUyn1ZW0PZqzi9/Vd6hWIzsiv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(186003)(2616005)(8676002)(53546011)(956004)(52116002)(66476007)(66574015)(5660300002)(8936002)(26005)(66556008)(83380400001)(31696002)(66946007)(6486002)(31686004)(2906002)(4326008)(36756003)(16526019)(316002)(16576012)(966005)(45080400002)(478600001)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FNOhw0O6Rcqp56fQZuf0UhTaoC0sFeCJcgD8CALGep1TVkE3vxD6bfGm4Dri3owbK3RRfoZiLIO542wRO+pe1eFeu1knP+ScEM1LdiOKQMD6PYKPLJKVFBFjVHJ58GregDXBj4+/PV9/IDShu80qTC10qcy+hOv2ZhRJG4OOMtqkc1YSS4rO2pgB93P+H4NfFIV9lPzqLhSENWh1zK7gcqfjreRg3JcFlvAbBF8SIBlkOXYU+LwjJcfA+BnPdxlmchDKKMuJlE3rFC0Xxt9PEL43JP4FYef5IHcfPYQPwvsP9Ffzi84Y9sW4DRFSltcGKUdFjZ5YW37kOkDDfk1ToqUrVXn4hJUjtAv4MceWun2t2VHFPPwguYTsdJyOgOtdEJ7Lq6G5wRsBSSOb3o2M4169dgELonc9N0fi8N0wzsgdYI1WFC1tyVDum8ACXsXYFLf6qmxTIcrVqL2FTAwJKHPD9MaF9KgU8s59FAPgFGpXWdMWjJx/OZBDBYvzIxgDHpfhxhuPfuxFnfdB2BgKU3lMYKBMSUZM0qdfWY2sfm9UiAG+KrUq2mudysdsijAatPiiGja2PWMe9+iTnvs7IaDusMMJepaUhsomWTY7rXDp9caEt5vSEbtsx+EGm8tL/UMPG3aG8tEieYxGFSWEjjsuWIgrKW51xm8GqsqamEFI3XwnamG/m/M40p9N+V+S+/ZU1JsqJtLHQpAWgoSGLA1JmChLt5amn+dBZqNcfVEHaE3PycGmMe6e5Lrv4c6wigTIqS5O4B/+mrUs6n5MPrbRFDfc9Ol89I2X1qUAEd6+04vMEYNIzRd5qPomswXmLDjNbsemGK6uBQ8xfMSVqQWKkTWj98m2PeQAbGhcS8CIeGZ1lKYhiG5gTngo6imy8mxrAN10QU4Bm/BF324H9w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1674088a-abef-4ed7-02e3-08d890952393
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 16:22:29.5384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGLvs6Anqe8M27B56YkgSSQqcmaLzWXwiyNXfsngXukNYTYp5kgwiuhtCd3oGO4lne6FA4orIMk7BuRa0qrPmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1434
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzI0LzIwIDI6NDEgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjMuMTEu
MjAgdW0gMjI6MDggc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMTEvMjMvMjAg
Mzo0MSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDIzLjExLjIwIHVtIDIxOjM4
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4KPj4+PiBPbiAxMS8yMy8yMCAzOjIwIFBN
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAyMy4xMS4yMCB1bSAyMTowNSBzY2hy
aWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4KPj4+Pj4+IE9uIDExLzI1LzIwIDU6NDIgQU0s
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4gQW0gMjEuMTEuMjAgdW0gMDY6MjEgc2No
cmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4gSXQncyBuZWVkZWQgdG8gZHJvcCBpb21t
dSBiYWNrZWQgcGFnZXMgb24gZGV2aWNlIHVucGx1Zwo+Pj4+Pj4+PiBiZWZvcmUgZGV2aWNlJ3Mg
SU9NTVUgZ3JvdXAgaXMgcmVsZWFzZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBJdCB3b3VsZCBiZSBjbGVh
bmVyIGlmIHdlIGNvdWxkIGRvIHRoZSB3aG9sZSBoYW5kbGluZyBpbiBUVE0uIEkgYWxzbyAKPj4+
Pj4+PiBuZWVkIHRvIGRvdWJsZSBjaGVjayB3aGF0IHlvdSBhcmUgZG9pbmcgd2l0aCB0aGlzIGZ1
bmN0aW9uLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBD
aGVjayBwYXRjaCAiZHJtL2FtZGdwdTogUmVnaXN0ZXIgSU9NTVUgdG9wb2xvZ3kgbm90aWZpZXIg
cGVyIGRldmljZS4iIHRvIAo+Pj4+Pj4gc2VlCj4+Pj4+PiBob3cgaSB1c2UgaXQuIEkgZG9uJ3Qg
c2VlIHdoeSB0aGlzIHNob3VsZCBnbyBpbnRvIFRUTSBtaWQtbGF5ZXIgLSB0aGUgCj4+Pj4+PiBz
dHVmZiBJIGRvIGluc2lkZQo+Pj4+Pj4gaXMgdmVuZG9yIHNwZWNpZmljIGFuZCBhbHNvIEkgZG9u
J3QgdGhpbmsgVFRNIGlzIGV4cGxpY2l0bHkgYXdhcmUgb2YgSU9NTVUgPwo+Pj4+Pj4gRG8geW91
IG1lYW4geW91IHByZWZlciB0aGUgSU9NTVUgbm90aWZpZXIgdG8gYmUgcmVnaXN0ZXJlZCBmcm9t
IHdpdGhpbiBUVE0KPj4+Pj4+IGFuZCB0aGVuIHVzZSBhIGhvb2sgdG8gY2FsbCBpbnRvIHZlbmRv
ciBzcGVjaWZpYyBoYW5kbGVyID8KPj4+Pj4KPj4+Pj4gTm8sIHRoYXQgaXMgcmVhbGx5IHZlbmRv
ciBzcGVjaWZpYy4KPj4+Pj4KPj4+Pj4gV2hhdCBJIG1lYW50IGlzIHRvIGhhdmUgYSBmdW5jdGlv
biBsaWtlIHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2V2aWN0X2FsbCgpIAo+Pj4+PiB3aGljaCB5b3Ug
b25seSBuZWVkIHRvIGNhbGwgYW5kIGFsbCB0dCBvYmplY3RzIGFyZSB1bnBvcHVsYXRlZC4KPj4+
Pgo+Pj4+Cj4+Pj4gU28gaW5zdGVhZCBvZiB0aGlzIEJPIGxpc3QgaSBjcmVhdGUgYW5kIGxhdGVy
IGl0ZXJhdGUgaW4gYW1kZ3B1IGZyb20gdGhlIAo+Pj4+IElPTU1VIHBhdGNoIHlvdSBqdXN0IHdh
bnQgdG8gZG8gaXQgd2l0aGluCj4+Pj4gVFRNIHdpdGggYSBzaW5nbGUgZnVuY3Rpb24gPyBNYWtl
cyBtdWNoIG1vcmUgc2Vuc2UuCj4+Pgo+Pj4gWWVzLCBleGFjdGx5Lgo+Pj4KPj4+IFRoZSBsaXN0
X2VtcHR5KCkgY2hlY2tzIHdlIGhhdmUgaW4gVFRNIGZvciB0aGUgTFJVIGFyZSBhY3R1YWxseSBu
b3QgdGhlIGJlc3QgCj4+PiBpZGVhLCB3ZSBzaG91bGQgbm93IGNoZWNrIHRoZSBwaW5fY291bnQg
aW5zdGVhZC4gVGhpcyB3YXkgd2UgY291bGQgYWxzbyBoYXZlIAo+Pj4gYSBsaXN0IG9mIHRoZSBw
aW5uZWQgQk9zIGluIFRUTS4KPj4KPj4KPj4gU28gZnJvbSBteSBJT01NVSB0b3BvbG9neSBoYW5k
bGVyIEkgd2lsbCBpdGVyYXRlIHRoZSBUVE0gTFJVIGZvciB0aGUgdW5waW5uZWQgCj4+IEJPcyBh
bmQgdGhpcyBuZXcgZnVuY3Rpb24gZm9yIHRoZSBwaW5uZWQgb25lc8KgID8KPj4gSXQncyBwcm9i
YWJseSBhIGdvb2QgaWRlYSB0byBjb21iaW5lIGJvdGggaXRlcmF0aW9ucyBpbnRvIHRoaXMgbmV3
IGZ1bmN0aW9uIAo+PiB0byBjb3ZlciBhbGwgdGhlIEJPcyBhbGxvY2F0ZWQgb24gdGhlIGRldmlj
ZS4KPgo+IFllcywgdGhhdCdzIHdoYXQgSSBoYWQgaW4gbXkgbWluZCBhcyB3ZWxsLgo+Cj4+Cj4+
Cj4+Pgo+Pj4gQlRXOiBIYXZlIHlvdSB0aG91Z2h0IGFib3V0IHdoYXQgaGFwcGVucyB3aGVuIHdl
IHVucG9wdWxhdGUgYSBCTyB3aGlsZSB3ZSAKPj4+IHN0aWxsIHRyeSB0byB1c2UgYSBrZXJuZWwg
bWFwcGluZyBmb3IgaXQ/IFRoYXQgY291bGQgaGF2ZSB1bmZvcmVzZWVuIAo+Pj4gY29uc2VxdWVu
Y2VzLgo+Pgo+Pgo+PiBBcmUgeW91IGFza2luZyB3aGF0IGhhcHBlbnMgdG8ga21hcCBvciB2bWFw
IHN0eWxlIG1hcHBlZCBDUFUgYWNjZXNzZXMgb25jZSB3ZSAKPj4gZHJvcCBhbGwgdGhlIERNQSBi
YWNraW5nIHBhZ2VzIGZvciBhIHBhcnRpY3VsYXIgQk8gPyBCZWNhdXNlIGZvciB1c2VyIG1hcHBp
bmdzCj4+IChtbWFwKSB3ZSB0b29rIGNhcmUgb2YgdGhpcyB3aXRoIGR1bW15IHBhZ2UgcmVyb3V0
ZSBidXQgaW5kZWVkIG5vdGhpbmcgd2FzIAo+PiBkb25lIGZvciBpbiBrZXJuZWwgQ1BVIG1hcHBp
bmdzLgo+Cj4gWWVzIGV4YWN0bHkgdGhhdC4KPgo+IEluIG90aGVyIHdvcmRzIHdoYXQgaGFwcGVu
cyBpZiB3ZSBmcmVlIHRoZSByaW5nIGJ1ZmZlciB3aGlsZSB0aGUga2VybmVsIHN0aWxsIAo+IHdy
aXRlcyB0byBpdD8KPgo+IENocmlzdGlhbi4KCgpXaGlsZSB3ZSBjYW4ndCBjb250cm9sIHVzZXIg
YXBwbGljYXRpb24gYWNjZXNzZXMgdG8gdGhlIG1hcHBlZCBidWZmZXJzIApleHBsaWNpdGx5IGFu
ZCBoZW5jZSB3ZSB1c2UgcGFnZSBmYXVsdCByZXJvdXRpbmcKSSBhbSB0aGlua2luZyB0aGF0IGlu
IHRoaXPCoCBjYXNlIHdlIG1heSBiZSBhYmxlIHRvIHNwcmlua2xlIGRybV9kZXZfZW50ZXIvZXhp
dCAKaW4gYW55IHN1Y2ggc2Vuc2l0aXZlIHBsYWNlIHdlcmUgd2UgbWlnaHQKQ1BVIGFjY2VzcyBh
IERNQSBidWZmZXIgZnJvbSB0aGUga2VybmVsID8gVGhpbmdzIGxpa2UgQ1BVIHBhZ2UgdGFibGUg
dXBkYXRlcywgCnJpbmcgYnVmZmVyIGFjY2Vzc2VzIGFuZCBGVyBtZW1jcHkgPyBJcyB0aGVyZSBv
dGhlciBwbGFjZXMgPwpBbm90aGVyIHBvaW50IGlzIHRoYXQgYXQgdGhpcyBwb2ludCB0aGUgZHJp
dmVyIHNob3VsZG4ndCBhY2Nlc3MgYW55IHN1Y2ggYnVmZmVycyAKYXMgd2UgYXJlIGF0IHRoZSBw
cm9jZXNzIGZpbmlzaGluZyB0aGUgZGV2aWNlLgpBRkFJSyB0aGVyZSBpcyBubyBwYWdlIGZhdWx0
IG1lY2hhbmlzbSBmb3Iga2VybmVsIG1hcHBpbmdzIHNvIEkgZG9uJ3QgdGhpbmsgCnRoZXJlIGlz
IGFueXRoaW5nIGVsc2UgdG8gZG8gPwoKQW5kcmV5CgoKPgo+Pgo+PiBBbmRyZXkKPj4KPj4KPj4+
Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+
PiBHaXZlIG1lIGEgZGF5IG9yIHR3byB0byBsb29rIGludG8gdGhpcy4KPj4+Pj4KPj4+Pj4gQ2hy
aXN0aWFuLgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEFuZHJleQo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJl
eS5ncm9kem92c2t5QGFtZC5jb20+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV90dC5jIHwgMSArCj4+Pj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+Pj4+Pj4gaW5k
ZXggMWNjZjFlZi4uMjkyNDhhNSAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fdHQuYwo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5j
Cj4+Pj4+Pj4+IEBAIC00OTUsMyArNDk1LDQgQEAgdm9pZCB0dG1fdHRfdW5wb3B1bGF0ZShzdHJ1
Y3QgdHRtX3R0ICp0dG0pCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgZWxzZQo+Pj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgdHRtX3Bvb2xfdW5wb3B1bGF0ZSh0dG0pOwo+Pj4+Pj4+PiDCoCB9Cj4+Pj4+
Pj4+ICtFWFBPUlRfU1lNQk9MKHR0bV90dF91bnBvcHVsYXRlKTsKPj4+Pj4+Pgo+Pj4+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4+Pj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+
Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJG
YW1kLWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDQW5kcmV5Lkdyb2R6b3Zza3klNDBhbWQuY29tJTdD
OWJlMDI5ZjI2YTQ3NDYzNDdhNjEwOGQ4OGZlZDI5OWIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4
MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDE3NTk2MDY1NTU5OTU1JTdDVW5rbm93biU3Q1RXRnBi
R1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFX
d2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPXRaM2RvJTJGZUt6QnRSbE5hRmJCakN0
UnZVSEtkdndEWjdTb1loRUJ1NCUyQlQ4JTNEJmFtcDtyZXNlcnZlZD0wIAo+Pj4+Pj4KPj4+Pj4K
Pj4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
