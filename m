Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA207103A04
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFC66E517;
	Wed, 20 Nov 2019 12:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA196E519
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpIz7JVR+lETyMCkHaMGSzla1Kmc4TU3+aR4UKxaGVFJZwp2po9fKdsFxF1asdrz5GXwLVO9Y+qH6V1kjC/nnP7JWF4/EHIDsm33y2QmQBGsoYi9881gJC1EdMDVCJlBF2igc1n2POxZMeJYpk2Tte9r5FgXqsfZFPdI3zNAzEuXKrc8e1CyEceNxogzU66f4LHFMUUVOpqaKwgGGJA5wEkjQyQ5NtVFIgGXfsJVQ6LqoWN8Uc7TP+4VsydDrAPOxItUg5WQJ2Ll4Ecj9qCMglasTsIQvq1whM7RjOVO6IlFqL7yxg54VdXho5Flft719RyR3zz1UjWVOH25A191uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+3MVcMJ2REW8Sp5eK9CJv30AZSXq/pRXokX+tXau+I=;
 b=KX9ImCKjtfN8owlTjG0SHrU4/DniDA8iG4B7JWwCdiWqz4PakiLJ1/fhcS1gecVBawNoUvayXv7vT4kVxNjAt2gQ80R8cYR+hf+4SBSGr5R+Jt3jafEWTHYFh21fcXBgVdcrW2BRymQ+gq074Cdvu4JVICrX9SvPS2NXSWHKCFO9q45VkQV2pazVFNVCBIAostuL3A/n4AFz1f/1M8alzNjSf6iHOtlLb+4KEXXkG6vGSa6kgKE8k2HhUm63upg42P6nJi+zqHITsAt/NTlgULkLlDh2hTADW8JIftHrjReV3+6lGQ1vQ5Oa2ewO6y3ya7vn/fRMyfIa0yCmC9qgZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2375.namprd12.prod.outlook.com (52.132.140.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Wed, 20 Nov 2019 12:24:48 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::e5e7:96f0:ad90:d933%7]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 12:24:48 +0000
Subject: Re: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
 <6540938e-b555-82c9-28e5-bbef3741863a@amd.com>
 <CAKMK7uEB9AqObaURdi8KdVBnwi8bWsmzZZ1WnSugutd4Zo0L0Q@mail.gmail.com>
 <CAKMK7uG5FXtVqMoDZPd_MwLpONgxeSEudnCM_zdTLmqz1bJtDw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <151e7f35-6e47-ca6e-7ca3-9f617c1addbe@amd.com>
Date: Wed, 20 Nov 2019 13:24:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uG5FXtVqMoDZPd_MwLpONgxeSEudnCM_zdTLmqz1bJtDw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: BE0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::27) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1bb1016f-fa3c-473e-8e0d-08d76db4a225
X-MS-TrafficTypeDiagnostic: DM5PR12MB2375:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DM5PR12MB237587E1F3C74F0AA69EB963834F0@DM5PR12MB2375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02272225C5
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(53754006)(199004)(189003)(6306002)(966005)(305945005)(7736002)(14454004)(25786009)(66476007)(6246003)(31686004)(66946007)(476003)(8676002)(66556008)(5660300002)(8936002)(50466002)(6916009)(2616005)(65956001)(65806001)(47776003)(4326008)(46003)(478600001)(11346002)(66574012)(6116002)(446003)(58126008)(23676004)(54906003)(2486003)(52116002)(36756003)(81166006)(486006)(81156014)(2906002)(5024004)(14444005)(99286004)(6666004)(53546011)(386003)(6506007)(76176011)(587094005)(2870700001)(229853002)(31696002)(6486002)(86362001)(6436002)(186003)(316002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2375;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4IPaoD4+ROv046/cbxE5UpJpgn0a2oEiEiWQJMMuLhnQk4f2sk/83RmW7/QHQtuFQ8M9wczkMtgkw6LYnxrxooCwiXClRH1UBlV5Ux1ft8R8bflRvOrYdooUtdouQMjsKLjgCt+zmrik2YzDZn+hifKDVpNkcz+K2iA0pRF2N3sXtvAMUgHD6fR1EzlrN7sqwriG97+CSJHCmAyXe2pHpGJOt9b1nz/H4uLAoahpwVUnmAyNJjWL3/94ZUj7fGP2OWglir32zPaDsujB15iyQ0F2x8dpP8AqBpoTiCDGkbyuTv5c+QweJWpTQuw8RQQ7Iz293Y4Yo+gKQJef1prQS2ww1WJe/jeN280jhotqCwpjpXm0e2vxC94ixCqy172681M+y1/ffBJQjEJUH4YCXEzm0/rhbERqjye6ktSrWOVv10iGhAWworX4doI4VEtB5Vv0XIoq4cJxCTdRn+TDihU+61kXvhWZl2SM58lUnHQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb1016f-fa3c-473e-8e0d-08d76db4a225
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 12:24:48.1783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82GzzET8++QbiIqrk+GkF22ubCjOFsiohQy7tqa6wNhGeYr38SIPlZ9gpUxMBUl2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2375
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+3MVcMJ2REW8Sp5eK9CJv30AZSXq/pRXokX+tXau+I=;
 b=0GCOQHvIGZiyKbO0Gr5JqAePNBn4gLeOGDIT8t40OUQge2E7ZjsIAkE+BMmKYd674DpOcXoq2teVyXxuNlHfdcBg3WBmR7BK84nwRBDOAXG1P+vpAn/znG5WFY4jFbjQIu2as87HWbt7E8vNjMFtQ3t0Qt/IQc2rxERjh/sO6dQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMTEuMTkgdW0gMTM6MTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgTm92
IDIwLCAyMDE5IGF0IDE6MDkgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4gd3JvdGU6Cj4+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDE6MDIgUE0gQ2hyaXN0aWFuIEvD
tm5pZwo+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+PiBXaGF0IGFtIEkg
bWlzc2luZz8KPj4+IFRoZSBhc3N1bXB0aW9uIGlzIHRoYXQgd2hlbiB5b3Ugd2FudCB0byBjcmVh
dGUgYSB2bWFwIG9mIGEgRE1BLWJ1Zgo+Pj4gYnVmZmVyIHRoZSBidWZmZXIgbmVlZHMgdG8gYmUg
cGlubmVkIHNvbWVob3cuCj4+Pgo+Pj4gRS5nLiB3aXRob3V0IGR5bmFtaWMgZG1hLWJ1ZiBoYW5k
bGluZyB5b3Ugd291bGQgbmVlZCB0byBoYXZlIGFuIGFjdGl2ZQo+Pj4gYXR0YWNobWVudC4gV2l0
aCBkeW5hbWljIGhhbmRsaW5nIHRoZSByZXF1aXJlbWVudHMgY291bGQgYmUgbG93ZXJlZCB0bwo+
Pj4gdXNpbmcgdGhlIHBpbigpL3VucGluKCkgY2FsbGJhY2tzLgo+PiBZZWFoIHJpZ2h0IG5vdyBl
dmVyeW9uZSBzZWVtcyB0byBoYXZlIGFuIGF0dGFjaG1lbnQsIGFuZCB0aGF0J3MgaG93IHdlCj4+
IGdldCBhd2F5IHdpdGggYWxsIHRoaXMuIEJ1dCB0aGUgaW50ZXJmYWNlIGlzbid0IHN1cHBvc2Vk
IHRvIHdvcmsgbGlrZQo+PiB0aGF0LCBkbWFfYnVmX3ZtYXAvdW5tYXAgaXMgc3VwcG9zZWQgdG8g
YmUgYSBzdGFuZC1hbG9uZSB0aGluZyAoeW91Cj4+IGNhbiBjYWxsIGl0IGRpcmVjdGx5IG9uIHRo
ZSBzdHJ1Y3QgZG1hX2J1Ziwgbm8gbmVlZCBmb3IgYW4KPj4gYXR0YWNobWVudCkuIEFsc28gSSBk
b24ndCB0aGluayBub24tZHluYW1pYyBkcml2ZXJzIHNob3VsZCBldmVyIGNhbGwKPj4gcGluL3Vu
cGluLCBub3QgdGhlaXIgam9iLCBob2xkaW5nIG9udG8gYSBtYXBwaW5nIHNob3VsZCBiZSBlbm91
Z2ggdG8KPj4gZ2V0IHRoaW5ncyBwaW5uZWQuCj4+Cj4+PiBZb3UgYWxzbyBjYW4ndCBsb2NrL3Vu
bG9jayBpbnNpZGUgeW91ciB2bWFwIGNhbGxiYWNrIGJlY2F1c2UgeW91IGRvbid0Cj4+PiBoYXZl
IGFueSBndWFyYW50ZWUgdGhhdCB0aGUgcG9pbnRlciBzdGF5cyB2YWxpZCBhcyBzb29uIGFzIHlv
dXIgZHJvcAo+Pj4geW91ciBsb2NrLgo+PiBXZWxsIHRoYXQncyB3aHkgSSBhc2tlZCB3aGVyZSB0
aGUgcGluL3VucGluIHBhaXIgaXMuIElmIHlvdSBsb2NrJnBpbiwKPj4gdGhlbiB5b3UgZG8ga25v
dyB0aGF0IHRoZSBwb2ludGVyIHdpbGwgc3RheSBhcm91bmQuIEJ1dCBsb29rcyBsaWtlIHRoZQo+
PiBvcmlnaW5hbCBwYXRjaCBmcm9tIERhdmUgZm9yIHR0bSBiYXNlZCBkcml2ZXJzIHBsYXllZCBm
YXN0Jmxvb3NlIGhlcmUKPj4gd2l0aCB3aGF0IHNob3VsZCBiZSBkb25lLgo+Pgo+Pj4gQlRXOiBX
aGF0IGlzIHZtYXAoKSBzdGlsbCB1c2VkIGZvcj8KPj4gdWRsLCBidW5jaCBvZiBvdGhlciB0aGlu
Z3MgKGUuZy4gYnVuY2ggb2YgdGlueSBkcml2ZXJzKS4gTm90IG11Y2gsIGJ1dAo+PiBub3Qgc3R1
ZmYgd2UgY2FuIGRyb3AuCj4gSWYgd2UncmUgdW5sdWNreSB3ZSdsbCBhY3R1YWxseSBoYXZlIGEg
cHJvYmxlbSB3aXRoIHRoZXNlIG5vdy4gRm9yCj4gc29tZSBvZiB0aGVzZSB0aGUgYXR0YWNoZWQg
ZGV2aWNlIGlzIG5vdCBkbWEtY2FwYWJsZSwgc28gZG1hX21hcF9zZwo+IHdpbGwgZ28gYm9vbS4g
V2l0aCB0aGUgY2FjaGVkIG1hcHBpbmcgbG9naWMgd2Ugbm93IGhhdmUgdGhpcyBtaWdodCBnbwo+
IHNpZGV3YXlzIGZvciBkeW5hbWljIGV4cG9ydGVycy4gRGlkIHlvdSB0ZXN0IHlvdXIgZHluYW1p
YyBkbWEtYnVmCj4gc3VwcG9ydCBmb3IgYW1kZ3B1IHdpdGggdWRsPwoKU2hvcnQgYW5zd2VyIG5v
LCBub3QgYXQgYWxsLiBMb25nIG9uZTogV2hhdCB0aGUgaGVjayBpcyB1ZGw/IEFuZCBob3cgaXMg
Cml0IG5vdCBkbWEtY2FwYWJsZT8KCj4gV29yc3QgY2FzZSB3ZSBuZWVkIHRvIGdldCByaWQgb2Yg
dGhlIGZha2UKPiBhdHRhY2htZW50LCBmaXggdGhlIHZtYXAgbG9ja2luZy9waW5uaW5nLCBhbmQg
bWF5YmUgc29tZSBtb3JlCj4gaGVhZGFjaGVzIHRvIHNvcnQgdGhpcyBvdXQuCgpXZWxsIG9mIGhh
bmQgd2UgY291bGQgcmVxdWlyZSB0aGF0IHZtYXAgd2lsbCBhbHNvIHBpbiBhIERNQS1idWYgYW5k
IApzdGFydCBmaXhpbmcgYW1ncHUvbm91dmVhdS9yYWRlb24vcXhsLgoKQ2hyaXN0aWFuLgoKPiAt
RGFuaWVsCj4KPgo+PiAtRGFuaWVsCj4+Cj4+PiBSZWdhcmRzLAo+Pj4gQ2hyaXN0aWFuLgo+Pj4K
Pj4+IEFtIDIwLjExLjE5IHVtIDEyOjQ3IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+PiBIaSBh
bGwsCj4+Pj4KPj4+PiBJJ3ZlIGJlZW4gbG9va2luZyBhdCBkbWFfYnVmX3YodW4pbWFwLCB3aXRo
IGEgZ29hbCB0byBzdGFuZGFyZGl6ZQo+Pj4+IGxvY2tpbmcgZm9yIGF0IGxlYXN0IGR5bmFtaWMg
ZG1hLWJ1ZiBleHBvcnRlcnMvaW1wb3J0ZXJzLCBtb3N0IGxpa2VseQo+Pj4+IGJ5IHJlcXVpcmlu
ZyBkbWFfcmVzdl9sb2NrLiBBbmQgSSBnb3QgcXVlc3Rpb25zIGFyb3VuZCBob3cgdGhpcyBpcwo+
Pj4+IHN1cHBvc2VkIHRvIHdvcmssIHNpbmNlIGEgYmlnIGNodW5rIG9mIGRyaXZlcnMgc2VlbSB0
byBlbnRpcmVseSBsYWNrCj4+Pj4gbG9ja2luZyBhcm91bmQgdHRtX2JvX2ttYXAuIFR3byBiaWcg
b25lczoKPj4+Pgo+Pj4+IC0gdHRtX2JvX2ttYXAgbG9va3MgYXQgYm8tPm1lbSB0byBmaWd1cmUg
b3V0IHdoYXQvd2hlcmUgdG8ga21hcCB0byBnZXQKPj4+PiBhdCB0aGF0IGJ1ZmZlci4gYm8tPm1l
bSBpcyBzdXBwb3NlZCB0byBiZSBwcm90ZWN0ZWQgd2l0aAo+Pj4+IGRtYV9yZXN2X2xvY2ssIGJ1
dCBhdCBsZWFzdCBhbWdwdS9ub3V2ZWF1L3JhZGVvbi9xeGwgZG9uJ3QgZ3JhYiB0aGF0Cj4+Pj4g
aW4gdGhlaXIgcHJpbWUgdm1hcCBmdW5jdGlvbi4KPj4+Pgo+Pj4+IC0gYmV0d2VlbiB0aGUgdm1h
cCBhbmQgdnVubWFwIHNvbWV0aGluZyBuZWVkcyB0byBtYWtlIHN1cmUgdGhlIGJhY2tpbmcKPj4+
PiBzdG9yYWdlIGRvZXNuJ3QgbW92ZSBhcm91bmQuIEkgZGlkbid0IGZpbmQgdGhhdCBlaXRoZXIg
YW55d2hlcmUsCj4+Pj4gdHRtX2JvX2ttYXAgc2ltcGx5IHNlZW1zIHRvIHNldCB1cCB0aGUgbWFw
cGluZywgbGVhdmluZyBsb2NraW5nIGFuZAo+Pj4+IHJlZmNvdW50aW5nIHRvIGNhbGxlcnMuCj4+
Pj4KPj4+PiAtIHZyYW0gaGVscGVycyBoYXZlIGF0IGxlYXN0IGxvY2tpbmcsIGJ1dCBJJ20gc3Rp
bGwgbWlzc2luZyB0aGUKPj4+PiByZWZjb3VudGluZy4gdm13Z2Z4IGRvZXNuJ3QgYm90aGVyIHdp
dGggdm1hcC4KPj4+Pgo+Pj4+IFdoYXQgYW0gSSBtaXNzaW5nPwo+Pj4+Cj4+Pj4gVGhhbmtzLCBE
YW5pZWwKPj4KPj4gLS0KPj4gRGFuaWVsIFZldHRlcgo+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KPj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZnds
bC5jaAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
