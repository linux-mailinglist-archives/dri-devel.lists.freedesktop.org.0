Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF13D24DBB
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 13:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045448931D;
	Tue, 21 May 2019 11:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8C89312;
 Tue, 21 May 2019 11:14:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 04:14:02 -0700
X-ExtLoop1: 1
Received: from asaudi-mobl.ger.corp.intel.com (HELO [10.249.47.52])
 ([10.249.47.52])
 by orsmga005.jf.intel.com with ESMTP; 21 May 2019 04:13:59 -0700
Subject: Re: [PATCH 32/33] fbcon: Document what I learned about fbcon locking
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
 <20190520082216.26273-33-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <4ce4193c-5140-a833-28d9-72b3d673da73@linux.intel.com>
Date: Tue, 21 May 2019 13:13:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520082216.26273-33-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Yisheng Xie <ysxie@foxmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3AgMjAtMDUtMjAxOSBvbSAxMDoyMiBzY2hyZWVmIERhbmllbCBWZXR0ZXI6Cj4gSXQncyBub3Qg
cHJldHR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4g
Q2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4K
PiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4KPiBDYzogWWlzaGVuZyBY
aWUgPHlzeGllQGZveG1haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJjb24uYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
b24uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCj4gaW5kZXggYjQwYjU2NzAy
YzYxLi5jYmJjZjdhNzk1ZjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2ZiY29uLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYwo+IEBAIC04
Nyw2ICs4NywyNSBAQAo+ICAjICBkZWZpbmUgRFBSSU5USyhmbXQsIGFyZ3MuLi4pCj4gICNlbmRp
Zgo+ICAKPiArLyoKPiArICogRklYTUU6IExvY2tpbmcKPiArICoKPiArICogLSBmYmNvbiBzdGF0
ZSBpdHNlbGYgaXMgcHJvdGVjdGVkIGJ5IHRoZSBjb25zb2xlX2xvY2ssIGFuZCB0aGUgY29kZSBk
b2VzIGEKPiArICogICBwcmV0dHkgZ29vZCBqb2IgYXQgbWFraW5nIHN1cmUgdGhhdCBsb2NrIGlz
IGhlbGQgZXZlcnl3aGVyZSBpdCdzIG5lZWRlZC4KPiArICoKPiArICogLSBhY2Nlc3MgdG8gdGhl
IHJlZ2lzdGVyZWRfZmIgYXJyYXkgaXMgZW50aXJlbHkgdW5wcm90ZWN0ZWQuIFRoaXMgc2hvdWxk
IHVzZQo+ICsgKiAgIHByb3BlciBvYmplY3QgbGlmZXRpbWUgaGFuZGxpbmcsIGkuZS4gZ2V0L3B1
dF9mYl9pbmZvLiBUaGlzIGFsc28gbWVhbnMKPiArICogICBzd2l0Y2hpbmcgZnJvbSBpbmRpY2Vz
IHRvIHByb3BlciBwb2ludGVycyBmb3IgZmJfaW5mbyBldmVyeXdoZXJlLgo+ICsgKgo+ICsgKiAt
IGZiY29uIGRvZXNuJ3QgYm90aGVyIHdpdGggZmJfbG9jay91bmxvY2sgYXQgYWxsLiBUaGlzIGlz
IGJ1Z2d5LCBzaW5jZSBpdAo+ICsgKiAgIG1lYW5zIGNvbmN1cnJlbnQgYWNjZXNzIHRvIHRoZSBz
YW1lIGZiZGV2IGZyb20gYm90aCBmYmNvbiBhbmQgdXNlcnNwYWNlCj4gKyAqICAgd2lsbCBibG93
IHVwLiBUbyBmaXggdGhpcyBhbGwgZmJjb24gY2FsbHMgZnJvbSBmYm1lbS5jIG5lZWQgdG8gYmUg
bW92ZWQgb3V0Cj4gKyAqICAgb2YgZmJfbG9jay91bmxvY2sgcHJvdGVjdGVkIHNlY3Rpb25zLCBz
aW5jZSBvdGhlcndpc2Ugd2UnbGwgcmVjdXJzZSBhbmQKPiArICogICBkZWFkbG9jayBldmVudHVh
bGx5LiBBc2lkZTogRHVlIHRvIHRoZXNlIGRlYWRsb2NrIGlzc3VlcyB0aGUgZmJkZXYgY29kZSBp
bgo+ICsgKiAgIGZibWVtLmMgY2Fubm90IHVzZSBsb2NraW5nIGFzc2VydHMsIGFuZCB0aGVyZSdz
IGxvdHMgb2YgY2FsbGVycyB3aGljaCBnZXQKPiArICogICB0aGUgcnVsZXMgd3JvbmcsIGUuZy4g
ZmJzeXNmcy5jIGVudGlyZWx5IG1pc3NlZCBmYl9sb2NrL3VubG9jayBjYWxscyB0b28uCj4gKyAq
Lwo+ICsKPiAgZW51bSB7Cj4gIAlGQkNPTl9MT0dPX0NBTlNIT1cJPSAtMSwJLyogdGhlIGxvZ28g
Y2FuIGJlIHNob3duICovCj4gIAlGQkNPTl9MT0dPX0RSQVcJCT0gLTIsCS8qIGRyYXcgdGhlIGxv
Z28gdG8gYSBjb25zb2xlICovCgpJIGRpZCBhIGNhc3VhbCByZXZpZXcsIHNvIGZvciB3aG9sZSBz
ZXJpZXMgd2l0aCB0aGUgc21hbGwgbml0cGlja3MgSSBoYWQsIGFuZCBhbnkgZmVlZGJhY2sgYnkg
b3RoZXJzLCBrYnVpbGQgYW5kIHRoZSBhcm0gbWVzcyBiZWluZyBmaXhlZCB1cDoKClJldmlld2Vk
LWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PgoKSG93ZXZlciwgYWNjb3JkaW5nIHRvIHJldmlld2VyJ3Mgc3RhdGVtZW50IG9mIG92ZXJzaWdo
dDoKCldoaWxlIEkgaGF2ZSByZXZpZXdlZCB0aGUgcGF0Y2ggYW5kIGJlbGlldmUgaXQgdG8gYmUg
c291bmQsIEkgZG8gbm90ICh1bmxlc3MgZXhwbGljaXRseSBzdGF0ZWQgZWxzZXdoZXJlKQptYWtl
IGFueSB3YXJyYW50aWVzIG9yIGd1YXJhbnRlZXMgdGhhdCBpdCB3aWxsIGFjaGlldmUgaXRzIHN0
YXRlZCBwdXJwb3NlIG9yIGZ1bmN0aW9uIHByb3Blcmx5IGluIGFueSBnaXZlbiBzaXR1YXRpb24u
Cgo6KQoKfk1hYXJ0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
