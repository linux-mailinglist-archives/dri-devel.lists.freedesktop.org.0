Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD81154DC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 17:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1BE6FA4C;
	Fri,  6 Dec 2019 16:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AA76FA4C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 16:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1tMubdVXMBI8M8sbZh4KDDHT9scKyIRH/teqcccFAGXUIzOHkbFYYgKV7sXPvKVu9/ox9CvYEETbzh+pPmyGmFYt+3cyZqOKMV9VjBv0PqNTC/eBe1uQzT17PQYhVGDEWQ02zQmnnzE7fUBxI/F9VGTXO3dbRk6Ldj6C4VSN/dmITW+WdckLW+mMyD79lEgajP70JMb9kasmV7d21H6K8JblUCzlDsGT+xSdYJi1+GPCVpShcj3UbHN+DmOChT24FOxCVs4ZaNM75kYqlR4eOskFCe9MgYR9TcxFJSU/ryOKp6r61TBGnONMf10x+cpmP31FanQWYcTAmdyfgUESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMOivhPULaCAS6dGaISkRCB6vOzaiteydrDKW7O4sUQ=;
 b=HDuyWI4ZrenQO2nK8jja1Jf4JPpJ+nHhfxU4wXg2AuJ4FqrUYW077uPhRJpS4edimRLoAfhNKngNG/c39OEeEt9PNjgq4DpsIuSOxP1eESbqUrn8TlpoR7vDq9eK9L3BHWVMgh7ZuvImDugJF+6p0rB+3rfn7ahIK9ZmqTEOEoh6QO6owEjkLIZWrLN5v3ZeCpwrg2DfIdhezg+UokdyN4stb15WVlBiQVlROZXecFf3h0VJMVRkx8E6zP47qpQyIVdFwkE3wRSlsSJQX9B+0+F73WoWNcF3OP4a1aGEMoEp/vZWofZPxYHDqR5pXIMAwLgA1ffJBlWQH3fBD9Wajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0149.namprd12.prod.outlook.com (10.172.78.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Fri, 6 Dec 2019 16:09:58 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::301e:b0c8:7af:d77d%11]) with mapi id 15.20.2516.017; Fri, 6 Dec 2019
 16:09:58 +0000
Subject: Re: [PATCH 1/2] drm: add dp helper to initialize remote aux channel.
From: Harry Wentland <hwentlan@amd.com>
To: "David (Dingchen) Zhang" <dingchen.zhang@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20191205165504.3682-1-dingchen.zhang@amd.com>
 <e81506b9-233e-ca7b-eb91-989a17389614@amd.com>
Autocrypt: addr=hwentlan@amd.com; keydata=
 mQENBFhb4C8BCADhHHUNoBQ7K7LupCP0FsUb443Vuqq+dH0uo4A3lnPkMF6FJmGcJ9Sbx1C6
 cd4PbVAaTFZUEmjqfpm+wCRBe11eF55hW3GJ273wvfH69Q/zmAxwO8yk+i5ZWWl8Hns5h69K
 D9QURHLpXxrcwnfHFah0DwV23TrD1KGB7vowCZyJOw93U/GzAlXKESy0FM7ZOYIJH83X7qhh
 Q9KX94iTEYTeH86Wy8hwHtqM6ySviwEz0g+UegpG8ebbz0w3b5QmdKCAg+eZTmBekP5o77YE
 BKqR+Miiwo9+tzm2N5GiF9HDeI2pVe/egOLa5UcmsgdF4Y5FKoMnBbAHNaA6Fev8PHlNABEB
 AAG0J0hhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPokBNwQTAQgAIQUC
 WFvgLwIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRAtWBXJjBS24xUlCAC9MqAlIbZO
 /a37s41h+MQ+D20C6/hVErWO+RA06nA+jFDPUWrDJKYdn6EDQWdLY3ATeAq3X8GIeOTXGrPD
 b2OXD6kOViW/RNvlXdrIsnIDacdr39aoAlY1b+bhTzZVz4pto4l+K1PZb5jlMgTk/ks9HesL
 RfYVq5wOy3qIpocdjdlXnSUKn0WOkGBBd8Nv3o0OI18tiJ1S/QwLBBfZoVvfGinoB2p4j/wO
 kJxpi3F9TaOtLGcdrgfghg31Fb48DP+6kodZ4ircerp4hyAp0U2iKtsrQ/sVWR4mbe3eTfcn
 YjBxGd2JOVdNQZa2VTNf9GshIDMD8IIQK6jN0LfY8Py2uQENBFhb4C8BCAC/0KWY3pIbU2cy
 i7GMj3gqB6h0jGqRuMpMRoSNDoAUIuSh17w+bawuOF6XZPdK3D4lC9cOXMwP3aP9tTJOori2
 8vMH8KW9jp9lAYnGWYhSqLdjzIACquMqi96EBtawJDct1e9pVgp+d4JXHlgIrl11ITJo8rCP
 dEqjro2bCBWxijsIncdCzMjf57+nR7u86SBtGSFcXKapS7YJeWcvM6MzFYgIkxHxxBDvBBvm
 U2/mAXiL72kwmlV1BNrabQxX2UnIb3xt3UovYJehrnDUMdYjxJgSPRBx27wQ/D05xAlhkmmL
 FJ01ZYc412CRCC6gjgFPfUi2y7YJTrQHS79WSyANABEBAAGJAR8EGAEIAAkFAlhb4C8CGwwA
 CgkQLVgVyYwUtuM72Qf+J6JOQ/27pWf5Ulde9GS0BigA1kV9CNfIq396TgvQzeyixHMvgPdq
 Z36x89zZi0otjMZv6ypIdEg5co1Bvz0wFaKbCiNbTjpnA1VAbQVLSFjCZLQiu0vc+BZ1yKDV
 T5ASJ97G4XvQNO+XXGY55MrmhoNqMaeIa/3Jas54fPVd5olcnUAyDty29/VWXNllUq38iBCX
 /0tTF7oav1lzPGfeW2c6B700FFZMTR4YBVSGE8jPIzu2Fj0E8EkDmsgS+nibqSvWXfo1v231
 410h35CjbYDlYQO7Z1YD7asqbaOnF0As+rckyRMweQ9CxZn5+YBijtPJA3x5ldbCfQ9rWiTu XQ==
Message-ID: <801a6126-747a-f61d-5382-dcdc37442beb@amd.com>
Date: Fri, 6 Dec 2019 11:09:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <e81506b9-233e-ca7b-eb91-989a17389614@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 908dc0fe-9784-4d2f-4ce8-08d77a66bd71
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0149:|CY4PR1201MB0149:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01495F6448BFB33DD6912A468C5F0@CY4PR1201MB0149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0243E5FD68
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(189003)(498600001)(966005)(230700001)(81156014)(8676002)(53546011)(2616005)(8936002)(305945005)(2906002)(65956001)(58126008)(81166006)(26005)(66556008)(66946007)(6486002)(36756003)(54906003)(66476007)(5660300002)(6506007)(6512007)(4326008)(50466002)(31686004)(186003)(52116002)(229853002)(76176011)(31696002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0149;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwewoZXDvBsK5ruzBBs/VdJkcVxGIpzO0sV+qj47i3uCvknUyKkBywDWN/zroF4W7kfK7X9ZLOxtaTCXnLZnUdN8A8/ebeWhQeIE05oS9X01sWyS6uFpUsvFKkQZtNOi9eX8Y7rOKqI4MDW0tNaGnGTIPXobfk7yKG+rNKluaZXK9nzBVrcE4puVD77CAVHxg7ihK23xwAKBFd9+4aJZiAq759dAp2Umx6izmVMr6rOW1sW61Xupw1S4PC3ydjR3irfjZky3HpCQab0DKlCBW3nZzQtrYOcc+g0rymnbgOZ2SeDxJplr8uEhP5dhYyWV4rLGBGd4aTYda6wKKIEEzUu7G0tt0iytlpmGpbVIXK7jFlXHDBS3zCEmkzKwKG0kI0bIHVzzz0R2rk8W3DtTQ0BA5A1nzr8RybEbRtuAUfbpz1FjRe4WqWIGaAoTUms0WJvsMi6VuB65Xof8i+llXLdw+pZlpTbyw1VW3ZZArmc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908dc0fe-9784-4d2f-4ce8-08d77a66bd71
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2019 16:09:58.2235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CENw3OX+y0mc1ewXwjmB3hhwkd4DVGeacIe7NdTPoI/1i26xEbbkGbJizz0qe11RABzS8wawuHEtfm2b68wcsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMOivhPULaCAS6dGaISkRCB6vOzaiteydrDKW7O4sUQ=;
 b=JdECIy3XehAJk2ctRgz8Vxm1w12UU/+E01EODQCeYZg0I7Jz2cLJg1tZIfDqeESyiBJ5i/IkIGKMV1c3oco3xEvsNsVX07/uvt/Stqe0tbQiVAr0Xgjfh7lUcQrqkbQyENxOXrII36ZsjVR6XXAS4Ahb275ha2nA8USx4mzA8uk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Leo Li <sunpeng.li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMi0wNiAxMDozMCBhLm0uLCBIYXJyeSBXZW50bGFuZCB3cm90ZToKPiBPbiAyMDE5
LTEyLTA1IDExOjU1IGEubS4sIERhdmlkIChEaW5nY2hlbikgWmhhbmcgd3JvdGU6Cj4+IFt3aHld
Cj4+IFdlIG5lZWQgdG8gbWluaW1hbGx5IGluaXRpYWxpemUgdGhlIHJlbW90ZSBhdXggY2hhbm5l
bCwgZS5nLiB0aGUKPj4gY3JjIHdvcmsgc3RydWN0IG9mIHJlbW90ZSBhdXggdG8gZHVtcCB0aGUg
c2luaydzIERQUlggQ1JDcyBpbiBNU1QKPj4gc2V0dXAuCj4+Cj4+IFtob3ddCj4+IEFkZCBoZWxw
ZXIgdGhhdCBvbmx5IGluaXRpYWxpemVzIHRoZSBjcmMgd29yayBzdHJ1Y3Qgb2YgdGhlIHJlbW90
ZQo+PiBhdXgsIGhvb2tlIGNyYyB3b3JrIHF1ZXVlIHRvICdkcm1fZHBfYXV4X2NyY193b3JrJy4g
VGhlbiBjYWxsIHRoaXMKPj4gaGVscGVyIGluIERQIE1TVCBwb3J0IGluaXRpYWxpemF0aW9uLgo+
Pgo+Pgo+PiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4+IENjOiBIYXJyeSBXZW50
bGFuZCA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgKERp
bmdjaGVuKSBaaGFuZyA8ZGluZ2NoZW4uemhhbmdAYW1kLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jICAgICAgIHwgMTMgKysrKysrKysrKysrKwo+PiAgZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8ICAzICsrKwo+PiAgaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oICAgICAgICAgICB8ICAxICsKPj4gIDMgZmlsZXMgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPj4gaW5kZXggZmMz
OTMyM2U3ZDUyLi4zNzMxMjU5M2RkMGEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+
PiBAQCAtMTA5MSw2ICsxMDkxLDE5IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9hdXhfY3JjX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+PiAgCX0KPj4gIH0KPj4gIAo+PiArLyoqCj4+ICsg
KiBkcm1fZHBfcmVtb3RlX2F1eF9pbml0KCkgLSBtaW5pbWFsbHkgaW5pdGlhbGlzZSBhIHJlbW90
ZSBhdXggY2hhbm5lbAo+PiArICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKPj4gKyAq
Cj4+ICsgKiBVc2VkIGZvciByZW1vdGUgYXV4IGNoYW5uZWwgaW4gZ2VuZXJhbC4gTWVyZWx5IGlu
aXRpYWxpemUgdGhlIGNyYyB3b3JrCj4+ICsgKiBzdHJ1Y3QuCj4+ICsgKi8KPj4gK3ZvaWQgZHJt
X2RwX3JlbW90ZV9hdXhfaW5pdChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KQo+PiArewo+PiArCUlO
SVRfV09SSygmYXV4LT5jcmNfd29yaywgZHJtX2RwX2F1eF9jcmNfd29yayk7Cj4+ICt9Cj4+ICtF
WFBPUlRfU1lNQk9MKGRybV9kcF9yZW1vdGVfYXV4X2luaXQpOwo+PiArCj4+ICAvKioKPj4gICAq
IGRybV9kcF9hdXhfaW5pdCgpIC0gbWluaW1hbGx5IGluaXRpYWxpc2UgYW4gYXV4IGNoYW5uZWwK
Pj4gICAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYwo+PiBpbmRleCBkNWRmMDIzMTVlMTQuLjQzMDgzMTZmZTIxMSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4+IEBAIC0xNjQyLDYgKzE2
NDIsOSBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJh
bmNoICptc3RiLAo+IAo+IFRoaXMgZnVuY3Rpb24gaXMgZ29uZSBpbiBhbWQtc3RhZ2luZy1kcm0t
bmV4dC4KPiAKPiBQbGVhc2Ugc2VuZCBhIHYyIG9mIHRoaXMgcGF0Y2ggYmFzZWQgb24gYW1kLXN0
YWdpbmctZHJtLW5leHQgb2YgYWdkNWYncwo+IHJlcG8gZnJvbSBodHRwczovL2NnaXQuZnJlZWRl
c2t0b3Aub3JnL35hZ2Q1Zi9saW51eC8/aD1hbWQtc3RhZ2luZy1kcm0tbmV4dAo+IAoKTXkgYmFk
LiBUaGlzIHNob3VsZCBiZSB0aGUgZHJtLW1pc2MtbmV4dCBicmFuY2ggb24KCmh0dHBzOi8vY2dp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCgpIYXJyeQoKPiBIYXJyeQo+IAo+PiAgCQlw
b3J0LT5hdXguZGV2ID0gZGV2LT5kZXY7Cj4+ICAJCXBvcnQtPmF1eC5pc19yZW1vdGUgPSB0cnVl
Owo+PiAgCj4+ICsJCS8qIGluaXRpYWxpemUgdGhlIE1TVCBkb3duc3RyZWFtIHBvcnQncyBBVVgg
Y3JjIHdvcmsgcXVldWUgKi8KPj4gKwkJZHJtX2RwX3JlbW90ZV9hdXhfaW5pdCgmcG9ydC0+YXV4
KTsKPj4gKwo+PiAgCQkvKgo+PiAgCQkgKiBNYWtlIHN1cmUgdGhlIG1lbW9yeSBhbGxvY2F0aW9u
IGZvciBvdXIgcGFyZW50IGJyYW5jaCBzdGF5cwo+PiAgCQkgKiBhcm91bmQgdW50aWwgb3VyIG93
biBtZW1vcnkgYWxsb2NhdGlvbiBpcyByZWxlYXNlZAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4+IGluZGV4
IDYxZWYzNTFjNWZjYS4uZGEwYTY5ZjEwZTM4IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS9k
cm1fZHBfaGVscGVyLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4+IEBA
IC0xNDAzLDYgKzE0MDMsNyBAQCBpbnQgZHJtX2RwX2Rvd25zdHJlYW1faWQoc3RydWN0IGRybV9k
cF9hdXggKmF1eCwgY2hhciBpZFs2XSk7Cj4+ICB2b2lkIGRybV9kcF9kb3duc3RyZWFtX2RlYnVn
KHN0cnVjdCBzZXFfZmlsZSAqbSwgY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0s
Cj4+ICAJCQkgICAgIGNvbnN0IHU4IHBvcnRfY2FwWzRdLCBzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4
KTsKPj4gIAo+PiArdm9pZCBkcm1fZHBfcmVtb3RlX2F1eF9pbml0KHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgpOwo+PiAgdm9pZCBkcm1fZHBfYXV4X2luaXQoc3RydWN0IGRybV9kcF9hdXggKmF1eCk7
Cj4+ICBpbnQgZHJtX2RwX2F1eF9yZWdpc3RlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KTsKPj4g
IHZvaWQgZHJtX2RwX2F1eF91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpOwo+Pgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
