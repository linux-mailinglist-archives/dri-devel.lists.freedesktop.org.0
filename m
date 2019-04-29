Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED76DF6A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 11:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB2A892C5;
	Mon, 29 Apr 2019 09:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A42892C5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 09:28:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3T9Rwks090656;
 Mon, 29 Apr 2019 04:27:58 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3T9RwP9099787
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Apr 2019 04:27:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 29
 Apr 2019 04:27:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 29 Apr 2019 04:27:58 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3T9RtNg060077;
 Mon, 29 Apr 2019 04:27:56 -0500
Subject: Re: [PATCHv2 21/22] drm/bridge: tc358767: add IRQ and HPD support
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>, Andrey Gusakov
 <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jyri Sarha <jsarha@ti.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Benoit Parrot <bparrot@ti.com>
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <CGME20190326103332epcas2p2a571512f507f2929f9d453e071152119@epcas2p2.samsung.com>
 <20190326103146.24795-22-tomi.valkeinen@ti.com>
 <c75d7330-3610-7120-400f-392ef120819f@samsung.com>
 <65ca8985-7458-d2a5-2627-0e22bc9d7cb1@ti.com>
 <5584be88-61a1-2807-e898-dcd282f98981@samsung.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <61e9e109-d94c-793a-2ebf-11388091707c@ti.com>
Date: Mon, 29 Apr 2019 12:27:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5584be88-61a1-2807-e898-dcd282f98981@samsung.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556530078;
 bh=oZNoXr7oAs/H3Q7BBVlkZQZeH7Z0kE9+aSFERDGa/H4=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=ad75GB6fboUmpd/QoUoGTYCtRHGd0dmCTan6x9jJ+koBMDRi6ZxWJcHiNhSDxeKFo
 wUOpYJJ7zYlU9CUIlA0GeLJtw4INoPKqxDoUKNnSVIV9PZcMPnLLbI/WCHwKTKTnPU
 GfWQzpg0Q7Omm4s+1cgwHglwjMGzxbmJNim9e4jk=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxNy8wNC8yMDE5IDEwOjMyLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+IE9uIDE1LjA0
LjIwMTkgMTI6NTksIFRvbWkgVmFsa2VpbmVuIHdyb3RlOgo+PiBPbiAxNS8wNC8yMDE5IDEzOjQy
LCBBbmRyemVqIEhhamRhIHdyb3RlOgo+Pgo+Pj4gT2sgd2UgaGF2ZSBoZXJlIDQgY29tYmluYXRp
b25zOgo+Pj4KPj4+IDEuIG5vSFBEICsgZURQLgo+Pj4KPj4+IDIuIG5vSFBEICsgRFAuCj4+Pgo+
Pj4gMy4gSFBEICsgZURQLgo+Pj4KPj4+IDQuIEhQRCArIERQLgo+Pj4KPj4+Cj4+PiBXaGljaCBv
bmVzIGRvIHlvdSB3YW50IHRvIHN1cHBvcnQsIGRpc2FsbG93LiBJdCBpcyBub3QgY2xlYXIgdG8g
bWUuCj4+IFRoZXkgYWxsIHNob3VsZCB3b3JrLgo+Pgo+PiBJZiB0aGVyZSBpcyBIUEQsIHdlIHVz
ZSBpdCB0byByZXR1cm4gY29ubmVjdGVkL2Rpc2Nvbm5lY3RlZC4KPiAKPiAKPiBPSywgSSB0aG91
Z2ggdGhhdCBlRFAgZG9lcyBub3QgdXNlIEhQRCBhdCBhbGwuCj4gCj4gCj4+IElmIHdlIGRvbid0
IGhhdmUgSFBEOgo+PiAtIElmIHRoZXJlJ3MgYSBwYW5lbCAoaS5lLiBlRFApLCB3ZSBwcmVzdW1l
IHRoYXQgaXQgaXMgYWx3YXlzIHRoZXJlLCBhcwo+PiBieSBkZWZpbml0aW9uIGl0IGNhbid0IGJl
IGRpc2Nvbm5lY3RlZC4KPj4gLSBJZiB0aGVyZSdzIG5vIHBhbmVsIChpLmUuIERQKSwgd2UgY2Fu
J3Qga25vdyBpZiB0aGUgY2FibGUgaXMgY29ubmVjdGVkCj4+IG9yIG5vdCwgc28gd2UgcmV0dXJu
IHVua25vd24uIEkgdGhpbmsgdGhpcyBjb3VsZCBiZSBpbXByb3ZlZCBieSB0cnlpbmcKPj4gdG8g
InBpbmciIHRoZSBtb25pdG9yIHdpdGggYW4gQVVYIHRyYW5zYWN0aW9uLCBidXQgSSBkaWRuJ3Qg
bG9vayBhdCB0aGF0Lgo+Pgo+Pj4gTW9yZW92ZXIgd2hhdCBjb25uZWN0b3Jfc3RhdHVzX3Vua25v
d24gc2hvdWxkIG1lYW4gaGVyZSBmb3IgdXNlcnM/Cj4+IFRoZSB0aGUgZHJpdmVyIGRvZXMgbm90
IGtub3cgaWYgdGhlcmUncyBhIG1vbml0b3Igb3Igbm90Lgo+IAo+IDopCj4gCj4gTW9yZSBzcGVj
aWZpY2FsbHksIHdoYXQgdXNlciBjYW4gZG8gd2l0aCBzdWNoIGluZm9ybWF0aW9uLgo+IAo+IE9L
LCBoZSBjYW4gZW5zdXJlIG1vbml0b3IgaXMgY29ubmVjdGVkIGFuZCB0aGVuIGZvcmNlIGNvbm5l
Y3RlZCBzdGF0ZS4KClllcywgc29tZXRoaW5nIGxpa2UgdGhhdC4gSSBoYXZlbid0IHJlYWxseSBi
ZWVuIHRlc3RpbmcgdGhhdCBraW5kIG9mCnNldHVwcywgYnV0IGFmYWlrLCB0aGF0J3MgbW9yZSBh
Ym91dCBob3cgRFJNIGV4cG9zZXMgYW5kIGV4cGVjdHMgdGhlCnVzZXJzcGFjZSB0byBoYW5kbGUg
InVua25vd24iIGNvbm5lY3Rpb24gc3RhdHVzIHRoYW4gd2hhdCBUQzM1ODc2NyBkb2VzLgoKPiBC
dXQgc2hhbGwgd2UgZXhwZWN0IGV4aXN0ZW5jZSBvZiBzdWNoIGNvbmZpZ3VyYXRpb25zLCBJIGhv
cGVkIHdlIGNvdWxkCj4gZWxpbWluYXRlIHN1Y2ggY29tYmluYXRpb24gKERQK25vSFBEKSBkdXJp
bmcgcHJvYmUuCgpFbGltaW5hdGUgaG93PyBNYWtlIEhQRCByZXF1aXJlZCBmb3IgRFAgYW5kIGZh
aWwgaWYgdGhlcmUncyBubyBIUEQ/IEkKZ3Vlc3MgdGhhdCdzIGFuIG9wdGlvbi4KClRoZW4gYWdh
aW4sIHRoZSBzb2x1dGlvbnMgdGhlIEhXIHBlb3BsZSBjb21lIHVwIHdpdGggaW4gdGhlIGVtYmVk
ZGVkCnNwYWNlIG5ldmVyIGNlYXNlcyB0byBhbWF6ZSBtZSwgc28gd2hpbGUgSSBkb24ndCBleHBl
Y3Qgc3VjaApjb25maWd1cmF0aW9ucywgSSB3b3VsZCBub3QgYmUgc3VycHJpc2VkIHRvIHNlZSBv
bmUuCgo+Pj4+ICsJaWYgKHRjLT5ocGRfbnVtID49IDAgJiYgdGMtPmJyaWRnZS5kZXYpIHsKPj4+
PiArCQlib29sIGggPSB2YWwgJiBJTlRfR1BJT19IKHRjLT5ocGRfbnVtKTsKPj4+PiArCQlib29s
IGxjID0gdmFsICYgSU5UX0dQSU9fTEModGMtPmhwZF9udW0pOwo+Pj4+ICsKPj4+PiArCQlkZXZf
ZGJnKHRjLT5kZXYsICJHUElPJWQ6ICVzICVzXG4iLCB0Yy0+aHBkX251bSwKPj4+PiArCQkJaCA/
ICJIIiA6ICIiLCBsYyA/ICJMQyIgOiAiIik7Cj4+Pgo+Pj4gV2hhdCBkb2VzICJoIiBhbmQgImxj
IiBtZWFuPwo+PiBUaGVzZSBhcmUgZnJvbSB0aGUgZnVuYyBzcGVjLiBIIG1lYW5zIGhpZ2gsIExD
IG1lYW5zIGxvdy1jb3VudGVyLiBIIGlzCj4+IHRyaWdnZXJlZCBpbW1lZGlhdGVseSB3aGVuIHRo
ZSBIUEQgbGluZSBnb2VzIGhpZ2gsIExDIGlzIHRyaWdnZXJlZCB3aGVuCj4+IHRoZSBsaW5lIGhh
cyBiZWVuIGxvdyBmb3IgdGhlIGNvdW50ZXItc3BlY2lmaWVkIHRpbWUgKHRoZSBjb3VudGVyIGlz
Cj4+IGNvbmZpZ3VyZWQgYXQgcHJvYmUgdGltZSkuCj4gCj4gCj4gSXQgd291bGQgYmUgZ29vZCB0
byBhZGQgdGhpcyBpbmZvIHNvbWV3aGVyZSwgaXQgaXMgaGFyZCB0byBndWVzcyB3aGF0IGxjCj4g
bWVhbnMuCgpPay4KCiBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9y
a2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
