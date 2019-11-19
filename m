Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322F1028B5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82D6E8CC;
	Tue, 19 Nov 2019 15:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC626E8CC
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:56:24 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJFu0JA023466;
 Tue, 19 Nov 2019 09:56:00 -0600
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJFu03Q046820
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Nov 2019 09:56:00 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 09:56:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 09:56:00 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJFtv0X069629;
 Tue, 19 Nov 2019 09:55:58 -0600
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
To: Tony Lindgren <tony@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
 <20191118230535.GG35479@atomide.com>
 <e91c7fc9-18e0-cc22-4617-127fe9be2c1b@ti.com>
 <20191119143243.GH35479@atomide.com>
 <edff7dfa-8b95-48ac-59e0-14553f3c8d39@ti.com>
 <20191119150643.GI35479@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <46aba805-1d3a-2efc-23f6-d957bf6a44c3@ti.com>
Date: Tue, 19 Nov 2019 17:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119150643.GI35479@atomide.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574178960;
 bh=PIPhvAPPQ8IxOiUh3DrXJGxdw4Mzkn/7EdMHLFanM4I=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=RVE3KyPExf9DpId8wMB8tVxRegiclIGdnHFY6L3gQQ9NxGIQWvMgACGfO9G2akyCZ
 mRvsOa43NInlbJ4UijeQVLoyYLMsS7W5RgaNHA/ewU2ncc69J/Abmj7wQbOI+T5gO9
 ctNIkhtJqh2WOM90P/19Ib7+wCXuONPJC0QUSvsE=
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMTEvMjAxOSAxNzowNiwgVG9ueSBMaW5kZ3JlbiB3cm90ZToKCj4+IFRoZSB1c2Vyc3Bh
Y2UgYXBwcyBuZWVkIHRvIGRvIHRoaXMuIElmIHRoZXkncmUgdXNpbmcgc2luZ2xlLWJ1ZmZlcmlu
ZywgdGhlbgo+PiB1c2luZyB0aGUgZGlydHlmYiBpb2N0bCBzaG91bGQgZG8gdGhlIHRyaWNrLCBh
ZnRlciB0aGUgU0dYIGhhcyBmaW5pc2hlZAo+PiBkcmF3aW5nLgo+IAo+IFNvdW5kcyBsaWtlIHRo
YXQncyBub3QgaGFwcGVuaW5nLgo+IAo+IEJ1dCB3aHkgd291bGQgdGhlIHVzZXJzcGFjZSBhcHAg
bmVlZCB0byBrbm93IHRoaXMgbWlnaHQgYmUgbmVlZGVkIGZvcgo+IGEgRFNJIGNvbW1hbmQgbW9k
ZSBkaXNwbGF5IGFuZCB0aGF0IGl0J3Mgbm90IG5lZWRlZCBmb3IgSERNST8KCldoZW4gZG91Ymxl
LWJ1ZmZlcmluZywgdGhlIHVzZXJzcGFjZSBkb2Vzbid0IG5lZWQgdG8gY2FyZSwgYXMgdGhlIApw
YWdlLWZsaXAgaW9jdGwgZXhwbGljaXRseSB0ZWxscyB0aGF0IHRoZSBidWZmZXIgaXMgcmVhZHku
CgpXaGVuIHNpbmdsZSBidWZmZXJpbmcsIGVpdGhlciB0aGUgdXNlcnNwYWNlIGhhcyB0byB0ZWxs
IHRoYXQgdGhlIGJ1ZmZlciAKaXMgbm93IHJlYWR5LCBvciB0aGUga2VybmVsIGhhcyB0byBndWVz
cyBiYXNlZCBvbiBzb21ldGhpbmcuIEJ1dCBhZmFpY3MsIAp0aGUgbGF0dGVyIGlzIGFsd2F5cyBh
IGd1ZXNzLCBhbmQgbWF5IG5vdCBiZSBhIGdvb2QgZ3Vlc3MuCgpUaGUga2VybmVsIGNvdWxkIHRy
aWdnZXIgYSBkZWxheWVkIHVwZGF0ZSBiYXNlZCBvbiwgc2F5LCBwYWdlIGZhdWx0IGlmIApkcmF3
aW5nIHdpdGggQ1BVLiBCdXQgaG93IG11Y2ggZGVsYXllZC4uLiBBbmQgd2l0aCB0aGlzIHNjZW5h
cmlvLCB3ZSAKd291bGQgc29tZWhvdyBuZWVkIHRvIGZpbmQgYSB3YXkgdG8gY2F0Y2ggdGhlIHdy
aXRlcyBmcm9tIGFueSBJUCB0byB0aGUgCmJ1ZmZlciwgYW5kIGFmYWlrIHRoZXJlJ3Mgbm8gc3Vj
aCB0aGluZy4KCj4+IEl0J3MgcHJvYmFibHkgc29tZXdoYXQgZGlmZmljdWx0IGlmIEVHTCBpcyBj
b250cm9sbGluZyB0aGUgZGlzcGxheSwgYXMsCj4+IGFmYWlrLCBTR1ggRUdMIGlzIGNsb3NlZCBz
b3VyY2UsIGFuZCB0aGF0J3MgcHJvYmFibHkgd2hlcmUgaXQgc2hvdWxkIGJlCj4+IGRvbmUuCj4+
Cj4+IEJ1dCBhZGRpbmcgYmFjayB0aGUgaGFja3kgb21hcCBnZW0gc3luYyBzdHVmZiwgYW5kIHRo
ZW4gc29tZWhvdyBndWVzc2luZwo+PiBmcm9tIHRoZSBzeW5jIGZpbmlzaCB0aGF0IHNvbWUgZGlz
cGxheSBuZWVkcyB0byBiZSB1cGRhdGVkLi4uIEl0IGp1c3QgZG9lcwo+PiBub3Qgc291bmQgcmln
aHQgdG8gbWUuCj4gCj4gUmlnaHQgaXQncyB1Z2x5LiBTdGlsbCBzb3VuZHMgbGlrZSB3ZSBuZWVk
IHNvbWV0aGluZyBpbiB0aGUga2VybmVsCj4gdGhhdCBrbm93cyAidGhpcyBpcyBhIERTSSBjb21t
YW5kIG1vZGUgTENEIGFuZCBuZWVkcyB0byBiZSB1cGRhdGVkIi4KCkkgdGhpbmsgb25lIG9wdGlv
biBpcyB0byByZWZyZXNoIHRoZSBjb21tYW5kIG1vZGUgZGlzcGxheSBhbGwgdGhlIHRpbWUuIApF
aXRoZXIgdXNpbmcgYSB0aW1lciwgb3IgdHJpZ2dlciB1cGRhdGVzIGJhc2VkIG9uIHRoZSBwcmV2
aW91cyB1cGRhdGUgCmJlaW5nIGZpbmlzaGVkLgoKT2YgY291cnNlLCB0aGF0J3Mga2luZCBvZiBh
Z2FpbnN0IHRoZSB3aG9sZSBwb2ludCBvZiBtYW51YWwgdXBkYXRlIApkaXNwbGF5LCBidXQgdGhl
biBpdCBzaG91bGQgZWZmZWN0aXZlbHkgYmVoYXZlIGxpa2UgYSBjb252ZW50aW9uYWwgCmFsd2F5
cy11cGRhdGluZyBkaXNwbGF5IChleGNlcHQgeW91ciBIVyBpcyBtb3JlIGV4cGVuc2l2ZSBhbmQg
Y29uc3VtZXMgCm1vcmUgcG93ZXIgdGhhbiBhIGNvbnZlbnRpb25hbCBkaXNwbGF5KS4KClRoZXJl
J3MgdGhpcyBQYW5lbCBTZWxmIFJlZnJlc2ggZmVhdHVyZSBpbiBEaXNwbGF5UG9ydCAod2hpY2gg
SSB0aGluayBpcyAKaW1wbGVtZW50ZWQgaW4gZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyksIHdo
aWNoIGhhcyBzb21lIHNpbWlsYXJpdGllcyAKdG8gdGhpcyBjYXNlLiBCdXQgaWYgSSByZWFkIGl0
IHJpZ2h0LCB0aGF0IGFsc28gZXhwZWN0cyBzb21lIGtpbmQgb2YgCnRyaWdnZXIgZnJvbSB1c2Vy
c3BhY2UgKGFueSBEUk0gY29tbWl0KSB0byBzdGFydCB0aGUgcmVmcmVzaC4KCkFmYWlrLCBXZXN0
b24gYW5kIFggYm90aCBoYW5kbGUgcGFnZSBmbGlwcyBhbmQvb3IgZGlydHlpbmcgdGhlIGZiLCBz
byAKdGhleSBzaG91bGQgd29yay4gQXJlIHRoZXJlIGFwcGxpY2F0aW9ucyB0aGF0IGRvIG5vdCB3
b3JrLCBhbmQgY2Fubm90IGJlIAptYWRlIHRvIHdvcmssIGV4Y2VwdCB0aGUgZmV3IFNHWCB0ZXN0
IGFwcHM/CgogIFRvbWkKCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2Fs
YW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEt
NC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
