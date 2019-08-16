Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6498B90940
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 22:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D406B89D1D;
	Fri, 16 Aug 2019 20:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C516189D1D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 20:14:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 103FC28D215
Message-ID: <43d7adfb9ae9d25fc7c6093d3119c62f742df2cb.camel@collabora.com>
Subject: Re: [PATCH] dma-buf: Fix memory leak in dma_buf_set_name
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Bharath Vedartham <linux.bhar@gmail.com>, sumit.semwal@linaro.org
Date: Fri, 16 Aug 2019 17:14:24 -0300
In-Reply-To: <1565978422-9661-1-git-send-email-linux.bhar@gmail.com>
References: <1565978422-9661-1-git-send-email-linux.bhar@gmail.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmhhcmF0aCwKClRoYW5rcyBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHRyeSB0byBmaXggdGhp
cyByZXBvcnQuCgpIb3dldmVyLCB0aGlzIGRvZXNuJ3QgbG9vayByaWdodC4KCk9uIEZyaSwgMjAx
OS0wOC0xNiBhdCAyMzozMCArMDUzMCwgQmhhcmF0aCBWZWRhcnRoYW0gd3JvdGU6Cj4gVGhpcyBw
YXRjaCBmaXhlcyBhIG1lbW9yeSBsZWFrIGJ1ZyByZXBvcnRlZCBieSBzeXpib3QuIExpbmsgdG8g
dGhlCj4gYnVnIGlzIGdpdmVuIGF0IFsxXS4KPiAKPiBBIGxvY2FsIHZhcmlhYmxlIG5hbWUgaXMg
dXNlZCB0byBob2xkIHRoZSBjb3BpZWQgdXNlciBidWZmZXIgc3RyaW5nCj4gdXNpbmcgc3RybmR1
cF91c2VyLiBzdHJuZHVwX3VzZXIgYWxsb2NhdGVzIG1lbW9yeSB1c2luZwo+IGttYWxsb2NfdHJh
Y2tfY2FsbGVyIGluIG1lbWR1cF91c2VyLiBUaGlzIGttYWxsb2MgYWxsb2NhdGlvbiBuZWVkcyB0
byBiZQo+IGZvbGxvd2VkIGJ5IGEga2ZyZWUuCj4gCj4gVGhpcyBwYXRjaCBoYXMgYmVlbiB0ZXN0
ZWQgYnkgYSBjb21waWxlIHRlc3QuCj4gCj4gWzFdIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL2J1Zz9pZD1jZTY5MmEzYWExM2UwMGUzMzVlMDkwYmU3ODQ2YzZlYjYwZGRmZjdhCj4gCj4g
UmVwb3J0ZWQtYnk6IHN5emJvdCtiMjA5OGJjNDQ3MjhhNGVmYjNlOUBzeXprYWxsZXIuYXBwc3Bv
dG1haWwuY29tCj4gU2lnbmVkLW9mZi1ieTogQmhhcmF0aCBWZWRhcnRoYW0gPGxpbnV4LmJoYXJA
Z21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+IGluZGV4IGY0NWJm
YjIuLjk3OThmNmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+ICsr
KyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiBAQCAtMzQyLDYgKzM0Miw3IEBAIHN0YXRp
YyBsb25nIGRtYV9idWZfc2V0X25hbWUoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwgY29uc3QgY2hh
ciBfX3VzZXIgKmJ1ZikKPiAgCX0KPiAgCWtmcmVlKGRtYWJ1Zi0+bmFtZSk7Cj4gIAlkbWFidWYt
Pm5hbWUgPSBuYW1lOwo+ICsJa2ZyZWUobmFtZSk7Cj4gIAoKSnVzdCBieSBsb29raW5nIGF0IHRo
aXMsIHlvdSBjYW4gZGVkdWNlIHNvbWV0aGluZyBpcyBub3QgcmlnaHQuCllvdSBhcmUgYXNzaWdu
aW5nICJuYW1lIiB0byBkbWFidWYtPm5hbWUsIGJ1dCB0aGVuIHJlbGVhc2luZyAibmFtZSIhCgpT
byBub3csIGRtYWJ1Zi0+bmFtZSBoYXMgZnJlZSBtZW1vcnksIHdoaWNoIHdpbGwgbGVhZCB0bwp1
c2VyLWFmdGVyLWZyZWUgaXNzdWVzLgoKTm90ZSBhbHNvLCB0aGF0IHRoaXMgZnVuY3Rpb24gZG9l
c24ndCBsb29rIGxlYWt5IHNpbmNlIHRoZSBwcmV2aW91cwoibmFtZSIgaXMgZnJlZWQsIGJlZm9y
ZSBzZXR0aW5nIGEgbmV3IG9uZS4KCk1heWJlIHRoZSBzeXpib3QgcmVwb3J0IGlzIHNvbWUga2lu
ZCBvZiBmYWxzZSBwb3NpdGl2ZT8KCkFsc28sIEkgX3N0cm9uZ2x5XyBzdWdnZXN0IHRoYXQgaW4g
dGhlIGZ1dHVyZSB5b3UgZG9uJ3QgY29tcGlsZS10ZXN0Cm9ubHkgdGhlc2Uga2luZCBvZiBub3Qg
dHJpdmlhbCBmaXhlcy4gU2luY2UgeW91IGFyZSB0b3VjaGluZyBhIGNydWNpYWwKcGFydCBvZiB0
aGUga2VybmVsIGhlcmUsIHlvdSBzaG91bGQgcmVhbGx5IGJlIHRlc3RpbmcgcHJvcGVybHkuCgpT
cGVjaWFsbHkgc2luY2Ugc3l6Ym90IHByb2R1Y2VzIGEgcmVwcm9kdWNlci4KCkNvbnNpZGVyIGNv
bXBpbGUgdGVzdCBhcyBzb21ldGhpbmcgeW91IGRvIHdoZW4geW91ciBjaGFuZ2VzIGFyZQpvbmx5
IGNvc21ldGljLCBhbmQgeW91IGFyZSBjb21wbGV0ZWx5IGFuZCBhYnNvbHV0ZWx5IHN1cmUgdGhp
bmdzCndpbGwgYmUgT0suCgpUaGFua3MuCkV6ZXF1aWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
