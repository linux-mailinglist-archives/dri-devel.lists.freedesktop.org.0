Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EF1240F9D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 21:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401256E0C8;
	Mon, 10 Aug 2020 19:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760080.outbound.protection.outlook.com [40.107.76.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A7F6E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 19:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwA1/gXiyfQFHQS9D9gWhyWHCgHuAOvZ4jpLbcmylFHsHs4RMSqcJMryzOnZ4te96zIH/GZEc/lsA/P2alb+quQuHmVTrWGJ51JRN+3xcbN7tJwXYY22BUqGJe6SsAEl8Pr/5ySHeI1fBZysGZSp8cZzssp/1j2CTSCgdDtqrB/IiJh7f5+Prvq9d1+10+DOvSC7XLM+GVcDWAmnSG+ZrBvAcuOIcJMzC9aUexrpKCLXyMmm/SF1karkKZx7g+es3V+6NQXRfa4pAqojj0rtJgIxqsLL4dBQg52K5A20qV5Cw9WNWWyQ0xZSl/KNBStLGgfSiA7TKODdgly6d3iQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz375/iOZD7CmgAwGti7W5Zc22bzVW0JubEyANi2e2M=;
 b=Cm1NvRuYqmrxf5ivxF8ULH+ZA9VJdplv1fKuwlcbWiKFTCGxkAZfofWRXD2tLNE0ifbNbWP09cRUI1whFO5AZ0EQm893m7quX9U8ppZ8O8gkO+IA+X2qRteEIDmqRXGErCYxPF+kriBijpvYNW7zECGYeSccgxAX7MQdc0+QqKzJxqXzw8aewQwD9Q2h/O8zJGUJ43gkB3BZkAlocuBhoO6xUEaLEl8YJvvw2lciunzs7Ec6FVUglFGuuLbBnFQqbySKrvBHBdBMmGGFajDTEl1CgrsruISqzBL9ojnLgdnDXtscxcjbHox+uD2J/YSVMHQWCbmWezDo98zlbPNzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vz375/iOZD7CmgAwGti7W5Zc22bzVW0JubEyANi2e2M=;
 b=LYYnpP8yIihZUZfPma5/lqWhG22NXFwdMY0IeOwSihuDsKZ+apr0Oog243SMzf20jjUTnPmOB7ADieJYV/vQNHvlLJvAIP4smcKoc9CF1VhhPR2E8TXzPEzW+yyzZaUClm+ScdSBXg/NUjTPKuaHfSL5oQChXscloUyV47HMqPc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 19:24:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 19:24:08 +0000
Subject: Re: [linux.git drm/ttm]: NULL pointer dereference upon driver probe
To: Dave Airlie <airlied@gmail.com>
References: <230cc360-89b9-bb39-ee7e-d68ac037345f@i-love.sakura.ne.jp>
 <e5822548-4373-5020-eb3a-9d6144b74d25@amd.com>
 <be670819-20d0-0757-a0f9-20054a527e77@vmware.com>
 <33c4495c-7fb5-f075-b30b-9ab9bdd4ce32@amd.com>
 <e4055371-5a78-0b32-9e1f-d17d865cbb8c@amd.com>
 <CAPM=9txMmSdHqnTsq97voJnNabh+dzfSzeJL302z=WJJD9j8Gw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <551d34e3-945f-cb76-f3a6-d2a7533ed2a6@amd.com>
Date: Mon, 10 Aug 2020 21:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9txMmSdHqnTsq97voJnNabh+dzfSzeJL302z=WJJD9j8Gw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0091.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0091.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.18 via Frontend Transport; Mon, 10 Aug 2020 19:24:07 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7feebc84-75fc-4a76-a8f6-08d83d62f409
X-MS-TrafficTypeDiagnostic: MN2PR12MB4374:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43743D865E85B8A660FBF9D883440@MN2PR12MB4374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yO/qrofrVLaqgZF6rPDZ++kzrAl7od62fE536Hqvr4nTjL2ghu695OC97vLyIuBH5gPOxBzo6UHCYdgF6SlmgSHvTlZCts5s3PbCLsl5F+1hpUo9cBbxaMXRqhkbvKPvC/Q3JiN0le4jPXdLGf4iXHIq/+NW8wAyh4tcDIBVy/Hwg4TkgLOPahB6Ivivc48XYkNuaEUqWfZtMJ1jPguzyLplN4lQxZzv5GWgE9lUPja7sUG20ccqO5q5kT+7A1pmEa5PUEhqTvgexS0eltx8j0Suxft4KfImlLR3fLPSPA/New7q7oSzd4ePnUe2Kzj5Cg7LehI6lZmm1TJd/C84Vwg163mCYuY89FathY7PIP/acqv/XOnh7mlO+QiPaqWO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(66476007)(66574015)(5660300002)(4326008)(8676002)(31686004)(6486002)(186003)(86362001)(6916009)(478600001)(2906002)(16526019)(31696002)(2616005)(52116002)(66556008)(83380400001)(36756003)(8936002)(6666004)(66946007)(316002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: J1g8CALqej23w4culb95yX8vfxnng9Jw+8OfBvp5XPhcK82Lrz8im+vDZKPk9JpUrQhKVL6UbqyYh8lqexjsmVPCkAdg1B1TwtfafmdTsEyWOyqF0qZlWrBrwb8v/Uh5Ir4l5KK30sLpHNbK3jH4FV2S2k+FvFy/T6VJsTWtEcAS9k/ChVwgxBk/yzbhLmH87NUxhdMAK3CPvHc08QtxZxQw7w8tc5CZSlWtReiGZl+0ahXEIVjQSk3U4SHroT5SbvEmbrXRpCtCWmRBX1JsINwKR3WkdFABg2VnfEdSfHpMsJgJromONZqyf0bzzviQGBVv7QlPzsruoAgexj8jQoYMAF7s5e2SzmMNws1+8pBuOlqaPCYTgcxFr747jIMgcVdUJiyufxcPBZy+hjnSKNakcy5hGFnMYzvzKnVu6ZNPxx1IU15Z2HqbrL/FtXV+CSwef26ByKRQEAGwZJSZgilfZBIgJ7rPtNduecGSBwvVhcXqtWBpExQa13HYxZG2UnP7zjB2iiiff9GjJSk3SpB16FBXRq0/I481UerSiTpW3BJbjOmoIDYB0KJKvXs0hRFle8lZUaQ7swIyVAAB88hZMMW+cfxMBWOr+of0LUhCzsAIu/ysITt1dJ/UQl0T1ojyUqmPIPjdP+TiXCzf2PyyMZpPHnsgsTOjEG75aAHxdpfrducMCi/YO7xDmVCtGEbro3CMxBJPZZh2rgmzFg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7feebc84-75fc-4a76-a8f6-08d83d62f409
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 19:24:08.5427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XINIDDjTH1Q6/7Dz7kZJZgIEy0GL8zSlUCejbaPcYqXRkWhprcfuIR5CEPpyLWAt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMDguMjAgdW0gMjA6NTEgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBNb24sIDEwIEF1
ZyAyMDIwIGF0IDIyOjIwLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+PiBBbSAwNy4wOC4yMCB1bSAwOTowMiBzY2hyaWViIENocmlzdGlhbiBLw7Zu
aWc6Cj4+PiBBbSAwNi4wOC4yMCB1bSAyMDo1MCBzY2hyaWViIFJvbGFuZCBTY2hlaWRlZ2dlcjoK
Pj4+PiBBbSAwNi4wOC4yMCB1bSAxNzoyOCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+Pj4+
IE15IGJlc3QgZ3Vlc3MgaXMgdGhhdCB5b3UgYXJlIGZhY2luZyB0d28gc2VwYXJhdGUgYnVncyBo
ZXJlLgo+Pj4+Pgo+Pj4+PiBDcmFzaCAjMSBpcyBzb21laG93IHJlbGF0ZWQgdG8gQ1JUQ3MgYW5k
IG1pZ2h0IGV2ZW4gYmUgY2F1c2UgYnkgdGhlCj4+Pj4+IGF0b21pYy1oZWxwZXIgY2hhbmdlIHlv
dSBub3RlZCBiZWxvdy4KPj4+Pj4KPj4+Pj4gQ3Jhc2ggIzIgaXMgY2F1c2VkIGJlY2F1c2Ugdm13
X2JvX2NyZWF0ZV9hbmRfcG9wdWxhdGUoKSB0cmllcyB0bwo+Pj4+PiBtYW51YWxseSBwb3B1bGF0
ZSBhIEJPIG9iamVjdCBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gVFRNIHRvIGRvIGl0IHdoZW4KPj4+
Pj4gbmVjZXNzYXJ5LiBUaGlzIGluZGVlZCBkb2Vzbid0IHdvcmsgYW55IG1vcmUgYmVjYXVzZSBv
ZiAiZHJtL3R0bTogbWFrZQo+Pj4+PiBUVCBjcmVhdGlvbiBwdXJlbHkgb3B0aW9uYWwgdjMiLgo+
Pj4+Pgo+Pj4+PiBRdWVzdGlvbiBpcyB3aHkgdm13Z2Z4IGlzIGRvaW5nIHRoaXM/Cj4+Pj4gTm90
IHJlYWxseSBzdXJlIHVuZm9ydHVuYXRlbHksIGl0J3MgcG9zc2libGUgdm13Z2Z4IGlzIGRvaW5n
IGl0IGJlY2F1c2UKPj4+PiB0dG0gbGFja2VkIHNvbWUgY2FwYWJpbGl0aWVzIGF0IHNvbWUgcG9p
bnQ/Cj4+PiBJIHRoaW5rIHNvIGFzIHdlbGwsIHllcy4KPj4+Cj4+Pj4gICAgVHJ5aW5nIHRvIGZp
Z3VyZSB0aGlzIG9uZSBvdXQuLi4KPj4+IFByb2JsZW0gaXMgdGhhdCB3aGF0IHZtd2dmeCBpcyBk
b2luZyBoZXJlIGlzIHF1ZXN0aW9uYWJsZSBhdCBiZXN0Lgo+Pj4KPj4+IEJ5IGRlZmluaXRpb24g
Qk9zIGluIHRoZSBTWVNURU0gZG9tYWluIGFyZSBub3QgYWNjZXNzaWJsZSBieSB0aGUgR1BVLAo+
Pj4gZXZlbiBpZiBpdCBpcyBhIHZpcnR1YWwgb25lLgo+Pj4KPj4+IEFuZCB3aGF0IHZtd2dmeCBk
b2VzIGlzIGFsbG9jYXRpbmcgb25lIGluIHRoZSBTWVNURU0gZG9tYWluIGFzIG5vdAo+Pj4gZXZp
Y3RhYmxlIGFuZCB0aGVuIGJ5cGFzc2luZyBUVE0gaW4gZmlsbGluZyBhbmQgbWFwcGluZyBpdCB0
byB0aGUgR1BVLgo+Pj4KPj4+IFRoYXQgZG9lc24ndCByZWFsbHkgbWFrZXMgc2Vuc2UgdG8gbWUs
IHdoeSBzaG91bGRuJ3QgdGhhdCBCTyBiZSBwdXQgaW4KPj4+IHRoZSBHVFQgZG9tYWluIHRoZW4g
aW4gdGhlIGZpcnN0IHBsYWNlPwo+PiBXZWxsIEkgdGhpbmsgSSBmaWd1cmVkIG91dCB3aGF0IFZN
V0dGWCBpcyBkb2luZyBoZXJlLCBidXQgeW91IHdvbid0IGxpa2UgaXQuCj4+Cj4+IFNlZSBWTVdH
RlggZG9lc24ndCBzdXBwb3J0IFRUTXMgR1RUIGRvbWFpbi4gU28gdG8gaW1wbGVtZW50IHRoZSBt
b2IgYW5kCj4+IG90YWJsZSBCT3MgaXQgaXMgYWxsb2NhdGluZyBzeXN0ZW0gZG9tYWluIEJPcywg
cGlubmluZyB0aGVtIGFuZCBtYW51YWxseQo+PiBmaWxsaW5nIHRoZW0gd2l0aCBwYWdlcy4KPj4K
Pj4gVGhlIGNvcnJlY3QgZml4IHdvdWxkIGJlIHRvIGF1ZGl0IFZNV0dGWCBhbmQgZml4IHRoaXMg
aGFuZGxpbmcgc28gdGhhdAo+PiBpdCBkb2Vzbid0IG1lc3MgYW55IG1vcmUgd2l0aCBUVE0gaW50
ZXJuYWwgb2JqZWN0IHN0YXRlLgo+Pgo+PiBUaWxsIHRoYXQgaGFwcGVucyB3ZSBjYW4gb25seSBy
ZXZlcnQgdGhlIHBhdGNoIGZvciBub3cuCj4gUHJvYmFibHkgZ29vZCB0byBkbywgYXQgbGVhc3Qg
d2Uga25vdyB0aGUgcHJvYmxlbSBub3cuCj4KPiBIb3dldmVyIEkgZm91bmQgbXlzZWxmIGluIHRo
ZSBzYW1lIHBsYWNlIHllc3RlcmRheSBzbyB3ZSBzaG91bGQKPiBkaXNjdXNzIGhvdyB0byBmaXgg
aXQgZ29pbmcgZm9yd2FyZC4KPgo+IEF0IGxlYXN0IG9uIEludGVsIElHUHMgeW91IGhhdmUgR1RU
IGFuZCBQUEdUVCAocGVyLXByb2Nlc3MgdGFibGUpLiBHVFQKPiBvbiBsYXRlciBodyBpcyBvbmx5
IG5lZWRlZCBmb3IgY2VydGFpbiBvYmplY3RzLCBsaWtlIHNjYW5vdXQgZXRjLiBOb3QKPiBldmVy
eSBvYmplY3QgbmVlZHMgdG8gYmUgaW4gdGhlIEdUVCBkb21haW4uCgpXZSBoYXZlIHRoZSBzYW1l
IHNpdHVhdGlvbiBvbiBhbWRncHUuIEdBUlQgb2JqZWN0cyBhcmUgb25seSBhbGxvY2F0ZWQgCmZv
ciBzY2Fub3V0IGFuZCBWTUlEMCBhY2Nlc3MuCgpTZWUgb3V0IGFtZGdwdV9ndHRfbWdyLmMuCgo+
IEJ1dCB3aGVuIHlvdSBnZXQgYW4gZXhlY2J1ZmZlciBhbmQgeW91IHdhbnQgdG8gYmluZCB0aGUg
UFBHVFQgb2JqZWN0cywKPiB5b3UgbmVlZCB0byBlaXRoZXIgbW92ZSB0aGUgb2JqZWN0IHRvIHRo
ZSBHVFQgZG9tYWluIHBvaW50bGVzc2x5IGFuZAo+IHN1Ym9wdGltYWxseSwgc2luY2UgdGhlIEdU
VCBkb21haW4gY291bGQgZmlsbCB1cCBhbmQgc3RhcnQgbmVlZGluZwo+IGV2aWN0aW9ucy4KClRo
YXQgaXMgaW50ZW50aW9uYWwgYmVoYXZpb3IuIFRoZSBHVFQgZG9tYWluIGlzIHRoZSBvdmVyIGFs
bCBtZW1vcnkgCndoaWNoIGlzIGN1cnJlbnRseSBHUFUgYWNjZXNzaWJsZS4KClRoZSBHQVJUIGNh
biBiZSBtdWNoIHNtYWxsZXIgdGhhbiB0aGUgR1RUIGRvbWFpbi4KCj4gU28gdGhlIG9wdGlvbiBp
cyB0byBnZXQgU1lTVEVNIGRvbWFpbiBvYmplY3RzLCBvbmx5IG1vdmUgdGhlbSB0bwo+IFRUTV9Q
TF9UVCB3aGVuIHBpbm5pbmcgZm9yIHNjYW5vdXQgZXRjLCBidXQgb3RoZXJ3aXNlIGdlbmVyYXRl
IHRoZQo+IHBhZ2VzIGxpc3RzIGZyb20gdGhlIG9iamVjdHMuIEluIG15IHBsYXlpbmcgYXJvdW5k
IEkndmUgaGFja2VkIHVwIGEgVFQKPiBjcmVhdGUvcG9wdWxhdGUgcGF0aCwgd2l0aCBubyBiaW5k
LgoKV2UgYWxyZWFkeSB0cmllZCB0aGlzIGFuZCBpdCB0dXJuZWQgb3V0IHRvIGJlIGEgYmFkIGlk
ZWEuCgpTZWUgYW1kZ3B1X3R0bV9hbGxvY19nYXJ0KCkgaG93IHRvIGVhc2lseSBkbyBpdCB3aXRo
IHRoZSBHVFQgZG9tYWluLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IERhdmUuCj4gSSBoYXZl
IGhhcmR3YXJlIHRoYXQgaGFzIG5vIHJlcXVpcmVtZW50IGZvciBhbGwgb2JqZWN0cyB0byBiZSBp
biB0aGUKPiBUVCBkb21haW4sIGJ1dCBzdGlsbCBoYXMgYSBUVCBkb21haW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
