Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521623B935
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 13:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3CF6E17C;
	Tue,  4 Aug 2020 11:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7326E17C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzKpMxBbT6tmqcqSeq5IDoDADN55DlWNecBWsrXwAvPj6QyNsrz0pQhcOSRds6fOhbk76IpPFSYlA+VNoL9rrFzxUXdvbB4Wk4dgGsfLTYWAY3g4QHSv/FLxUkZRv0Pyr04ExT/LvP1hUJKYNUAZWDPrOzzgX5LS5AdPPWWOzRiT9FiFMwru0EQCSEndbPv4delOZtGjhXmpNRd49F2Y6AWx3ouTT3Z2hV8f3Sb+l03T0C/EwC+jpNb5MvZnsK8AotJfl4PFGLKdrVobt3eowSCa67Ich6JUeVj3TTzYs7hIrFW4SFgFjOqrpfRQkjFSK3mVSGnCgljAwCTbjTrajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2AwwOQyK2rN3efd4PUDmeDBDJ2Pi1U1gBF2dXArW1U=;
 b=jWiNqBeNUqIM9ePeuJPWbaxn/s03R2tiU/UoOF1gLRqGegPXDxO6r79TJR0qUeTneU5HDOTK7ccDEhPS9gv+b3t0PfUIekoxmPkZLBLL4nhMjQBCp+SHsycKK3jZHr3enaqbvbVkY/MJZRkr7BvZbKptzROsx99sIGH3e3HtUpVNZiTgrj22KOhF20raXpMU8+J7w3cdTkbaiwP2VAX9a62kNJ7p3HpCQ2c/FEfTn5KRLzzHUuMXla4OPGDljGA1rN4My+hCWQKPEXU+BTNmw035ds8CGT575yzbLOO3PNNH1tqcRyWnuHyOLfEXCzyV/UBoVL5G5h/OJS78YkqMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2AwwOQyK2rN3efd4PUDmeDBDJ2Pi1U1gBF2dXArW1U=;
 b=I5mEIr6dYtAOReJsUSNFP07R7JdgmkH7H8YLuRYyiLP2BrGLHV6mad6bWkXUy5DoJiz27pmsDyVioSHRJ0u6WXy7jJMXg5wKmXPx5B+SiBfo1ZXpXoWlpi6wL1oX8o1v+w3F4ofskRGGX2tOyJJS1gmLBB83Q67o1onll3hIUQw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2418.namprd12.prod.outlook.com (2603:10b6:207:4d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 11:07:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 11:07:34 +0000
Subject: Re: [PATCH 13/59] drm/ttm: split the mm manager init code (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-14-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fd000454-d526-d604-9597-c1132d5a7d3b@amd.com>
Date: Tue, 4 Aug 2020 13:07:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804025632.3868079-14-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:208:d2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.18 via Frontend Transport; Tue, 4 Aug 2020 11:07:32 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb8a8372-060c-4364-2189-08d838669686
X-MS-TrafficTypeDiagnostic: BL0PR12MB2418:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2418C05A8EF480E4E364C728834A0@BL0PR12MB2418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTXDwR/eI4JnRTXw9wIRJjPY6Xwm2AbhSfaLSnKGsVYf6bKoO7CCzsEcr9kJ80/VA45adlbc8JmH6p2b3wggZ5C8wgiwRf9ij64Wqk9eKDserJ413QflfUVqRhCvs1Yy7Qf3Afzsl7VVS7vjTsF2jjZPcZivAb64h0rSRUJU1DsExc9mPBnmBAXklnvF0KWMskIvQ2NoZXcfN6hRSEmTzsHg14eCsajO5ekJ32c7faPpwANYhjcXYSHrsDyjXmzNzJ++b1zetBvo5h/HGk0IWAQ5w2AyTlfvC4wW+iDYo9SjwsYmyoKX7DEf30YIee7BboEnDn48yZ5qYIJaK1rEQXF1jRwzjor0JXs7XjLXN5P1+rW4e1JyJDHJbe5OaUp5XVBAjurJ88PVQ3S9V4xNHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(86362001)(66556008)(31686004)(8936002)(2616005)(6666004)(66476007)(83380400001)(16526019)(4326008)(36756003)(66574015)(66946007)(186003)(5660300002)(2906002)(6486002)(52116002)(8676002)(31696002)(316002)(478600001)(87944003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: So1xdfMFEMXzBYQzJlIbJrCOvM2SNFp6tUQGSiUDtCQpllf2O72LvXW1gXdBFTLTC4ELgSplsKAsCrWQtQEYKinvgdKGSQZTHgQlgXwPf1ycZqZt38d196jvMApEVtrhqYm+goUQXpx9VN6qcTSNN5d/uQG0HDc7XeZGGOEfjLqBUHTAIgRoTNWsJ+1o7PbcENBPl0q8LYb0FIsBrbvk1c1iMXOUcX/D7oPGZQOjuAGTwRTXGZcT70L2nTaXtFVySZo5dVUE8au5blL69dqawbpzrZu6sYcPLHZ2xo7h7YvKltwWkr5Pcb2kpFBzrl7YDtg7uAGS05MNoUISg0A1KJ/VeNx9IVFA6o+im8xF17aAtguIeFSqqhTasKKVrWyTv+ZLyuxTygtz9B4Kfl2zFVG4eLe4dM8tfThQMyBccks3BnGblB3AGkUcW/hyv9AhXa+aOxoKQF3yyfYaiasDmLqsKxYNgmoiRzfnEpA9xd+1b4mfOjTH8NVdSsgYXbPLfx3+1yfPJlJhILvB03pfF9BOEFd+PaIer0h/IICRIA33MteKZnHjGQ5vhk5Tf6YPCdTpK2zvNRski2fiJBMQUWW061bpqSHH47mTYCIPYyuQ0BljQB8UV41iBIwKOY+Jq8+C7jzIAIc7NrfMB1Fkg80AQVCHS6CJS8woRC7Zw4Fs59upi0p21Xbqz3UVxMmEuY44IDFTm2nW/oj33J+JdQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8a8372-060c-4364-2189-08d838669686
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 11:07:34.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+NOSO/9ytUlcUKAVCzTr3QB2RWNS9EXqWL1GFAQrzouUz7WpKDvOqS0arD+0tWv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2418
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
Cc: sroland@vmware.com, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDguMjAgdW0gMDQ6NTUgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyB3aWxsIGFsbG93IHRoZSBkcml2ZXIg
dG8gY29udHJvbCB0aGUgb3JkZXJpbmcgaGVyZSBiZXR0ZXIuCj4KPiBFdmVudHVhbGx5IHRoZSBv
bGQgcGF0aCB3aWxsIGJlIHJlbW92ZWQuCj4KPiB2MjogYWRkIGRvY3MgZm9yIG5ldyBBUElzLgo+
IHJlbmFtZSBuZXcgcGF0aCB0byB0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0L3NldF91c2VkKGZv
ciBub3cpCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29t
PgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgIHwgMzQgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oICAgIHwgMTUgKysrKysrKysrKysrKysrCj4gICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2Ry
aXZlci5oIHwgMTUgKysrKysrKysrKysrKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDUwIGluc2Vy
dGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggMmFj
NzBlYzFmMzdkLi4zMDBiY2MxMDY5NmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtMTUw
OSwzNSArMTUwOSw0MSBAQCBpbnQgdHRtX2JvX2V2aWN0X21tKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LCB1bnNpZ25lZCBtZW1fdHlwZSkKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX2Jv
X2V2aWN0X21tKTsKPiAgIAo+IC1pbnQgdHRtX2JvX2luaXRfbW0oc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsIHVuc2lnbmVkIHR5cGUsCj4gLQkJCXVuc2lnbmVkIGxvbmcgcF9zaXplKQo+ICt2
b2lkIHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
Cj4gKwkJCSAgICAgICBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiArCQkJICAg
ICAgIHVuc2lnbmVkIGxvbmcgcF9zaXplKQo+ICAgewo+IC0JaW50IHJldDsKPiAtCXN0cnVjdCB0
dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuOwo+ICAgCXVuc2lnbmVkIGk7Cj4gICAKPiAtCUJVR19P
Tih0eXBlID49IFRUTV9OVU1fTUVNX1RZUEVTKTsKPiAtCW1hbiA9ICZiZGV2LT5tYW5bdHlwZV07
Cj4gICAJQlVHX09OKG1hbi0+aGFzX3R5cGUpOwo+ICAgCW1hbi0+dXNlX2lvX3Jlc2VydmVfbHJ1
ID0gZmFsc2U7Cj4gICAJbXV0ZXhfaW5pdCgmbWFuLT5pb19yZXNlcnZlX211dGV4KTsKPiAgIAlz
cGluX2xvY2tfaW5pdCgmbWFuLT5tb3ZlX2xvY2spOwo+ICAgCUlOSVRfTElTVF9IRUFEKCZtYW4t
PmlvX3Jlc2VydmVfbHJ1KTsKPiAgIAltYW4tPmJkZXYgPSBiZGV2Owo+IC0KPiAtCWlmICh0eXBl
ICE9IFRUTV9QTF9TWVNURU0pIHsKPiAtCQlyZXQgPSAoKm1hbi0+ZnVuYy0+aW5pdCkobWFuLCBw
X3NpemUpOwo+IC0JCWlmIChyZXQpCj4gLQkJCXJldHVybiByZXQ7Cj4gLQl9Cj4gLQltYW4tPmhh
c190eXBlID0gdHJ1ZTsKPiAtCW1hbi0+dXNlX3R5cGUgPSB0cnVlOwo+ICAgCW1hbi0+c2l6ZSA9
IHBfc2l6ZTsKPiAgIAo+ICAgCWZvciAoaSA9IDA7IGkgPCBUVE1fTUFYX0JPX1BSSU9SSVRZOyAr
K2kpCj4gICAJCUlOSVRfTElTVF9IRUFEKCZtYW4tPmxydVtpXSk7Cj4gICAJbWFuLT5tb3ZlID0g
TlVMTDsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKHR0bV9tZW1fdHlwZV9tYW5hZ2VyX2luaXQpOwo+
ICAgCj4gK2ludCB0dG1fYm9faW5pdF9tbShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdW5z
aWduZWQgdHlwZSwKPiArCQkJdW5zaWduZWQgbG9uZyBwX3NpemUpCj4gK3sKPiArCWludCByZXQ7
Cj4gKwlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbjsKPiArCj4gKwlCVUdfT04odHlw
ZSA+PSBUVE1fTlVNX01FTV9UWVBFUyk7Cj4gKwl0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0KGJk
ZXYsICZiZGV2LT5tYW5bdHlwZV0sIHBfc2l6ZSk7Cj4gKwo+ICsJaWYgKHR5cGUgIT0gVFRNX1BM
X1NZU1RFTSkgewo+ICsJCXJldCA9ICgqbWFuLT5mdW5jLT5pbml0KShtYW4sIHBfc2l6ZSk7Cj4g
KwkJaWYgKHJldCkKPiArCQkJcmV0dXJuIHJldDsKPiArCX0KPiArCXR0bV9tZW1fdHlwZV9tYW5h
Z2VyX3NldF91c2VkKG1hbiwgdHJ1ZSk7Cj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICBFWFBPUlRf
U1lNQk9MKHR0bV9ib19pbml0X21tKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPiBpbmRleCBhOWUxM2Iy
NTI4MjAuLjg5MDUzZTc2MWE2OSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2FwaS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+IEBAIC01NCw2ICs1
NCw4IEBAIHN0cnVjdCB0dG1fcGxhY2U7Cj4gICAKPiAgIHN0cnVjdCB0dG1fbHJ1X2J1bGtfbW92
ZTsKPiAgIAo+ICtzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXI7Cj4gKwo+ICAgLyoqCj4gICAg
KiBzdHJ1Y3QgdHRtX2J1c19wbGFjZW1lbnQKPiAgICAqCj4gQEAgLTUzMSw2ICs1MzMsMTkgQEAg
aW50IHR0bV9ib19jcmVhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIGxv
bmcgc2l6ZSwKPiAgIAkJICB1aW50MzJfdCBwYWdlX2FsaWdubWVudCwgYm9vbCBpbnRlcnJ1cHRp
YmxlLAo+ICAgCQkgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqKnBfYm8pOwo+ICAgCj4gKy8q
Kgo+ICsgKiB0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0Cj4gKyAqCj4gKyAqIEBiZGV2OiBQb2lu
dGVyIHRvIGEgdHRtX2JvX2RldmljZSBzdHJ1Y3QuCj4gKyAqIEBtYW46IG1lbW9yeSBtYW5hZ2Vy
IG9iamVjdCB0byBpbml0Cj4gKyAqIEBwX3NpemU6IHNpemUgbWFuYWdlZCBhcmVhIGluIHBhZ2Vz
Lgo+ICsgKgo+ICsgKiBJbml0aWFsaXNlIGNvcmUgcGFydHMgb2YgYSBhIG1hbmFnZXIgb2JqZWN0
Lgo+ICsgKi8KPiArdm9pZCB0dG1fbWVtX3R5cGVfbWFuYWdlcl9pbml0KHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LAo+ICsJCQkgICAgICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICpt
YW4sCj4gKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHBfc2l6ZSk7Cj4gKwo+ICAgLyoqCj4gICAg
KiB0dG1fYm9faW5pdF9tbQo+ICAgICoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiBpbmRleCA3
M2Y1ZDljNzY2Y2MuLjZiNDljMDM1NjM0MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2RyaXZlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+
IEBAIC02NzgsNiArNjc4LDIxIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0dG1fYm9fdW5yZXNlcnZl
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCj4gICAJZG1hX3Jlc3ZfdW5sb2NrKGJvLT5i
YXNlLnJlc3YpOwo+ICAgfQo+ICAgCj4gKy8qKgo+ICsgKiB0dG1fbWVtX3R5cGVfbWFuYWdlcl9z
ZXRfdXNlZAo+ICsgKgo+ICsgKiBAbWFuOiBBIG1lbW9yeSBtYW5hZ2VyIG9iamVjdC4KPiArICog
QHVzZWQ6IHVzYWdlIHN0YXRlIHRvIHNldC4KPiArICoKPiArICogU2V0IHRoZSBtYW5hZ2VyIGlu
IHVzZSBmbGFnLiBJZiBkaXNhYmxlZCB0aGUgbWFuYWdlciBpcyBubyBsb25nZXIKPiArICogdXNl
ZCBmb3Igb2JqZWN0IHBsYWNlbWVudC4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0dG1f
bWVtX3R5cGVfbWFuYWdlcl9zZXRfdXNlZChzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
biwgYm9vbCB1c2VkKQo+ICt7Cj4gKwltYW4tPmhhc190eXBlID0gdHJ1ZTsKPiArCW1hbi0+dXNl
X3R5cGUgPSB1c2VkOwo+ICt9Cj4gKwo+ICAgLyoKPiAgICAqIHR0bV9ib191dGlsLmMKPiAgICAq
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
