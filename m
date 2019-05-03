Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB512BF9
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 13:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF7A89C19;
	Fri,  3 May 2019 11:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E416589C19
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 11:04:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43B4M0X130172;
 Fri, 3 May 2019 06:04:22 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43B4Lvo030929
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 06:04:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 06:04:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 06:04:21 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43B4JfH027328;
 Fri, 3 May 2019 06:04:19 -0500
Subject: Re: [PATCHv2 13/22] drm/bridge: tc358767: use more reliable seq when
 finishing LT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-14-tomi.valkeinen@ti.com>
 <20190420214422.GP4964@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a680c2d9-7600-f911-68e9-b529fba02d5c@ti.com>
Date: Fri, 3 May 2019 14:04:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190420214422.GP4964@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556881462;
 bh=l2GGiBaKTp7+CaCM7l56QC1c+vxUKGewxhPc2pOo/vM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oNPA/WGQ2PFakloi3x7ihysYXQhgeXxQ0b/RS5KiHptRRE+00PKO2ZWuLqj46gIoM
 yEXPzdwpBSORpvVlgTCaA8y4z9/aZ24UgAWdt2H1uzy9ycGdSnpeEZ/brai47HmR8j
 B2a0Inf6P0/lg9YJaHY795DHZ7/NjiWbX6fHVz84=
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDQvMjAxOSAwMDo0NCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBIaSBUb21pLAo+
IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFR1ZSwgTWFyIDI2LCAyMDE5IGF0
IDEyOjMxOjM3UE0gKzAyMDAsIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBBdCB0aGUgZW5kIG9m
IHRoZSBsaW5rIHRyYWluaW5nLCB0d28gc3RlcHMgaGF2ZSB0byBiZSB0YWtlbjogMSkKPj4gdGMz
NTg3NjcncyBMVCBtb2RlIGlzIGRpc2FibGVkIGJ5IGEgd3JpdGUgdG8gRFAwX1NSQ0NUUkwsIGFu
ZCAyKSBSZW1vdmUKPj4gTFQgZmxhZyBpbiBEUENEIDB4MTAyLgo+Pgo+PiBUb3NoaWJhJ3MgZG9j
dW1lbnRhdGlvbiB0ZWxscyB0byBmaXJzdCB3cml0ZSB0aGUgRFBDRCwgdGhlbiBtb2RpZnkKPj4g
RFAwX1NSQ0NUUkwuIEluIG15IHRlc3RpbmcgdGhpcyBvZnRlbiBjYXVzZXMgaXNzdWVzLCBhbmQg
dGhlIGxpbmsKPj4gZGlzY29ubmVjdHMgcmlnaHQgYWZ0ZXIgdGhvc2Ugc3RlcHMuCj4+Cj4+IElm
IEkgcmV2ZXJzZSB0aGUgc3RlcHMsIGl0IHdvcmtzIGV2ZXJ5IHRpbWUuIFRoZXJlJ3MgYSBjaGFu
Y2UgdGhhdCB0aGlzCj4+IGlzIERQIHNpbmsgc3BlY2lmaWMsIHRob3VnaCwgYnV0IGFzIG15IHRl
c3Rpbmcgc2hvd3MgdGhpcyBzZXF1ZW5jZSB0byBiZQo+PiBtdWNoIG1vcmUgcmVsaWFibGUsIGxl
dCdzIGNoYW5nZSBpdC4KPiAKPiBBcyB0aGlzIGRlcGFydHMgZnJvbSB0aGUgZG9jdW1lbnRhdGlv
biBJIHRoaW5rIGl0IGRlc2VydmVzIGEgY29tbWVudCBpbgo+IHRoZSBjb2RlLgoKWWVwLiBJdCdz
IG5vdCBleGFjdGx5IGRvY3VtZW50YXRpb24sIGJ1dCBqdXN0IGFuIGV4Y2VsIHNoZWV0IHRoYXQg
dGhleQp1c2UgZm9yIHRlc3RpbmcuIFRoZSBhY3R1YWwgZG9jdW1lbnRhdGlvbiBkb2Vzbid0IHRh
bGsgYWJvdXQgdGhpcy4KCkknbGwgYWRkIGEgY29tbWVudC4KCiBUb21pCgotLSAKVGV4YXMgSW5z
dHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClkt
dHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNp
bmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
