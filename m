Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E61327B0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 14:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FD16E05F;
	Tue,  7 Jan 2020 13:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2C6E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 13:32:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007DVmOY077824;
 Tue, 7 Jan 2020 07:31:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1578403908;
 bh=siV49V3/axhH0J3K/CGRNeFz4H+fcQnmk833M21ccpY=;
 h=Subject:From:To:References:Date:In-Reply-To;
 b=LIvrQeDOpvLtcyyBYPLR5TqvZL8d/coButpuZlXqFI0/Dx3fLrFkaBdb45RBIdk/W
 VMZP7vjGFYMnYi4AhRwfKb1FJ1E4aVk5XA114F4Gzwsyn47fuVOAsElpw7d0tnw2Ud
 AoC2LafKdJpQHnWOE+k00P+01AFJFRhGKAF7quxY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007DVm7L056766
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Jan 2020 07:31:48 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 07:31:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 07:31:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007DVjse056381;
 Tue, 7 Jan 2020 07:31:45 -0600
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Tony Lindgren <tony@atomide.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-omap@vger.kernel.org>, "H . Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Matthijs van Duin <matthijsvanduin@gmail.com>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com> <20200104050950.GA11429@chinchilla>
 <20200104055011.GA5885@atomide.com> <20200105203704.GD5885@atomide.com>
 <6526b54b-a3c3-2873-2164-f9b96f11ad68@ti.com>
Message-ID: <f6ce0a06-91c9-93dd-7b9e-91aeb2dd35fb@ti.com>
Date: Tue, 7 Jan 2020 15:31:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6526b54b-a3c3-2873-2164-f9b96f11ad68@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDEvMjAyMCAxNTozMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMDUvMDEvMjAy
MCAyMjozNywgVG9ueSBMaW5kZ3JlbiB3cm90ZToKPj4gSGksCj4+Cj4+ICogVG9ueSBMaW5kZ3Jl
biA8dG9ueUBhdG9taWRlLmNvbT4gWzIwMDEwNCAwNTo1MV06Cj4+Pgo+Pj4gSnVzdCBjaGFuZ2lu
ZyB0aGUgYWxpbmdtZW50IGZpeGVzIHRoZSBpc3N1ZS4gTG9va3MgbGlrZSB0aGUgbWluaW11bQo+
Pj4gYWxpZ25tZW50IHdlIGN1cnJlbnRseSBhbGxvdyBpcyAxMjgsIEkgdGhpbmsgNTEyIHdhcyB0
aGUgbWluaW11bQo+Pj4gdGhhdCB3b3JrZWQgZm9yIG1lLCBzbyBtYXliZSB0aGUgcmlnaHQgZml4
IHdvdWxkIGJlIHRvIGp1c3QgY2hhbmdlCj4+PiB0aGUgbWluaW11bSB0byA1MTIgd2l0aCBubyBz
cGVjaWZpYyBuZWVkIHRvIHVzZSA0MDk2IGZvciBub3cuCj4+Cj4+IFNvIE1hdHRoaWpzIGFuZCBJ
IGNoYXR0ZWQgYWJvdXQgdGhpcyBhIGJpdCBvbiBpcmMsIGFuZCBoZXJlJ3Mgd2hhdAo+PiB3ZSBj
b25jbHVkZWQgc28gZmFyOgo+Pgo+PiAxLiBXZSBoYXZlIGF0IGxlYXN0IHRocmVlIGRpZmZlcmVu
dCBhbGlnbm1lbnQgbmVlZHMgZm9yIHRpbGVyCj4+Cj4+IC0gTGludXggdXNlIG9mIHRpbGVyIGFs
aWduZWQgdG8gMTI4IGJ5dGVzCj4+Cj4+IC0gU0dYIHVzZSBvZiB0aWxlciBhbGlnbmVkIHRvIDQw
OTYgYnl0ZXMgKG9yIDUxMiBieXRlcz8pCj4+Cj4+IC0gRmFzdCB1c2Vyc3BhY2UgbWFwcGluZyBh
bGlnbmVkIHRvIDQwOTYgYnl0ZXMKPj4KPj4gMi4gVGhlIGFsaWdubWVudCBuZWVkIG1heSBuZWVk
IHRvIGJlIGNvbmZpZ3VyZWQgYnkgdGhlIHRpbGVyIGNvbnN1bWVyCj4+IMKgwqDCoCBpbiAjMSBh
Ym92ZQo+Pgo+PiAzLiBUaGUgYWxpZ25tZW50IG5lZWQgZm9yIFNHWCBzZWVtcyB0byBiZSBiYXNl
ZCBvbiBTR1ggTU1VIHBhZ2Ugc2l6ZQo+Pgo+PiA0LiBUaGUgaXNzdWUgSSdtIHNlZWluZyB3aXRo
IHN0ZWxsYXJpdW0gb24gZHJvaWQ0IG1heSBiZSBhIHN0cmlkZQo+PiDCoMKgwqAgaXNzdWUgYXMg
YWJvdXQgb25lIG91dCBvZiAzIG9yIDQgZnJhbWVzIGlzIE9LIGFuZCBhbGlnbmluZyB0bwo+PiDC
oMKgwqAgNTEyIGFsc28gZml4ZXMgdGhlIGlzc3VlIG1heWJlIGJlY2F1c2UgaXQgaGFwcGVucyB0
byBtYWtlCj4+IMKgwqDCoCBtdWx0aXBsZSBmcmFtZXMgYWxpZ24gdG8gNDA5Ngo+Pgo+PiBTbyBs
ZXQncyB3YWl0IG9uIHRoaXMgcGF0Y2ggdW50aWwgd2UgaGF2ZSBtb3JlIGluZm8gYW5kIGtub3cg
aG93Cj4+IHRoZSBkaWZmZXJlbnQgYWxpZ25tZW50cyBzaG91bGQgYmUgaGFuZGxlZC4KPiAKPiBJ
IGRvbid0IGtub3cgaWYgdGhlc2UgYXJlIHJlbGF0ZWQgdG8gdGhlIGlzc3VlIHlvdSBoYXZlLCBh
bmQgaXQncyBiZWVuIGEgd2hpbGUgc2luY2UgSSBsb29rZWQgYXQgCj4gVElMRVIsIGJ1dCB0d28g
dGhvdWdodHMgYWZ0ZXIgbG9va2luZyBhdCB0aGUgdGhyZWFkOgo+IAo+IC0gSWYgdGhlIHVzZXJn
YXJ0IGlzIG5vdCB1c2VkLCB0aGUgd2lkdGggb2YgZWFjaCBsaW5lIGhhcyB0byBiZSBleHBhbmRl
ZCB0byBiZSBwYWdlIHNpemUgYWxpZ25lZCwgCj4gcmlnaHQ/IERvIHRoZSBwYXRjaGVzIGZyb20g
TWF0dGhpanMgZG8gdGhpcz8KCkFuZCBpbW1lZGlhdGVseSBhZnRlciBwcmVzc2luZyAic2VuZCIs
IEkgcmVhbGl6ZWQgdGhhdCBhbGlnbmluZyB0aGUgc3RhcnQgb2YgdGhlIGJ1ZmZlcnMgdG8gcGFn
ZSAKc2l6ZSBhbHJlYWR5IGFjY29tcGxpc2hlcyB0aGlzLi4uCgogIFRvbWkKCi0tIApUZXhhcyBJ
bnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4K
WS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVs
c2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
