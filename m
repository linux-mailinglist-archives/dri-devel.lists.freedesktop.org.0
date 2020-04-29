Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 378921BF170
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D636EB56;
	Thu, 30 Apr 2020 07:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C669A897D0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 17:42:50 +0000 (UTC)
Received: from [192.168.42.210] ([93.22.38.239]) by mwinf5d58 with ME
 id Yhig2200R59bE5H03hig2Q; Wed, 29 Apr 2020 19:42:48 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 29 Apr 2020 19:42:48 +0200
X-ME-IP: 93.22.38.239
Subject: Re: [PATCH] video: fbdev: pxa3xx_gcu: Fix some resource leak in an
 error handling path in 'pxa3xx_gcu_probe()'
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200429043438.96212-1-christophe.jaillet@wanadoo.fr>
 <20200429122538.GO2014@kadam>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <0db91149-fa85-6ec3-1787-d5effd41a1b9@wanadoo.fr>
Date: Wed, 29 Apr 2020 19:42:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429122538.GO2014@kadam>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: linux-fbdev@vger.kernel.org, eric.y.miao@gmail.com, arnd@arndb.de,
 b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhenzhong.duan@gmail.com, daniel@caiaq.de,
 mpe@ellerman.id.au, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGUgMjkvMDQvMjAyMCDDoCAxNDoyNSwgRGFuIENhcnBlbnRlciBhIMOpY3JpdMKgOgo+IE9uIFdl
ZCwgQXByIDI5LCAyMDIwIGF0IDA2OjM0OjM4QU0gKzAyMDAsIENocmlzdG9waGUgSkFJTExFVCB3
cm90ZToKPj4gSWYgYW4gZXJyb3Igb2NjdXJzIGluIHRoZSBsb29wIHdoZXJlIHdlIGNhbGwgJ3B4
YTN4eF9nY3VfYWRkX2J1ZmZlcigpJywKPj4gYW55IHJlc291cmNlIGFscmVhZHkgYWxsb2NhdGVk
IHNob3VsZCBiZSBmcmVlZC4KPj4KPj4gSW4gb3JkZXIgdG8gZml4IGl0LCBhZGQgYSBjYWxsIHRv
ICdweGEzeHhfZ2N1X2ZyZWVfYnVmZmVycygpJyBpbiB0aGUgZXJyb3IKPj4gaGFuZGxpbmcgcGF0
aCwgYXMgYWxyZWFkeSBkb25lIGluIHRoZSByZW1vdmUgZnVuY3Rpb24uCj4+Cj4+IEZpeGVzOiAz
NjRkYmRmM2I2YzMgKCJ2aWRlbzogYWRkIGRyaXZlciBmb3IgUFhBM3h4IDJEIGdyYXBoaWNzIGFj
Y2VsZXJhdG9yIikKPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3Rv
cGhlLmphaWxsZXRAd2FuYWRvby5mcj4KPj4gLS0tCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9w
eGEzeHgtZ2N1LmMgfCAxICsKPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhM3h4LWdjdS5jIGIvZHJpdmVy
cy92aWRlby9mYmRldi9weGEzeHgtZ2N1LmMKPj4gaW5kZXggNDI3OWUxM2EzYjU4Li42OGQ5Yzdh
NjgxZDQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhM3h4LWdjdS5jCj4+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhM3h4LWdjdS5jCj4+IEBAIC02NzUsNiArNjc1
LDcgQEAgc3RhdGljIGludCBweGEzeHhfZ2N1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4+ICAgCj4+ICAgZXJyX2Rpc2FibGVfY2xrOgo+PiAgIAljbGtfZGlzYWJsZV91bnBy
ZXBhcmUocHJpdi0+Y2xrKTsKPj4gKwlweGEzeHhfZ2N1X2ZyZWVfYnVmZmVycyhkZXYsIHByaXYp
Owo+IFRoZSBlcnJvciBoYW5kbGluZyBpbiB0aGlzIGZ1bmN0aW9uIG1ha2VzIG5vIHNlbnNlIGFu
ZCBpcyBidWdneS4gIEl0Cj4gc2hvdWxkIGJlIHRoYXQgaXQgdW53aW5kcyBpbiB0aGUgcmV2ZXJz
ZSBvcmRlciBmcm9tIHRoZSBhbGxvY2F0aW9uLiAgVGhlCj4gZ290byBzaG91bGQgYmUgImdvdG8g
ZnJlZV9tb3N0X3JlY2VudGx5X2FsbG9jYXRlZF9yZXNvdXJjZTsiLiAgU2luY2UgdGhlCj4gdW53
aW5kIGlzIGRvbmUgaW4gdGhlIHdyb25nIG9yZGVyIGl0IGNhdXNlcyBhIGNvdXBsZSBidWdzLgo+
Cj4gVGhlc2UgYnVmZmVycyBhcmUgdGhlIGxhc3QgdGhpbmcgd2hpY2ggd2UgYWxsb2NhdGVkIHNv
IHRoZXkgc2hvdWxkIGJlCj4gdGhlIGZpcnN0IHRoaW5nIHdoaWNoIHdlIGZyZWUuICBJbiB0aGlz
IGNhc2UsIGNhbGxpbmcKPiBweGEzeHhfZ2N1X2ZyZWVfYnVmZmVycygpIGJlZm9yZSB0aGUgYnVm
ZmVycyBhcmUgYWxsb2NhdGVkIGlzIGNvbmZ1c2luZwo+IGJ1dCBoYXJtbGVzcy4gIFRoZSBjbGtf
ZGlzYWJsZV91bnByZXBhcmUoKSBpcyBkb25lIG9uIHNvbWUgcGF0aHMgd2hlcmUKPiB0aGUgY2xv
Y2sgd2FzIG5vdCBlbmFibGVkIGFuZCB0aGF0IHdpbGwgdHJpZ2dlciBhIFdBUk4oKSBzbyB0aGF0
J3MgYQo+IGJ1Zy4gIFN5emNhbGxlciB3aWxsIGNvbXBsYWluIGFuZCBpZiB5b3UgaGF2ZSByZWJv
b3Qgb24gV0FSTiB0aGVuIGl0J3MKPiBhbm5veWluZy4KPgo+IFRoZSBzZWNvbmQgYnVnIGlzIHRo
YXQgd2UgZG9uJ3QgZGVyZWdpc3RlciB0aGUgbWlzYyBkZXZpY2Ugb3IgcmVsZWFzZQo+IHRoZSBE
TUEgbWVtb3J5IG9uIGZhaWx1cmUgd2hlbiB3ZSBhbGxvY2F0ZSB0aGUgYnVmZmVycyBpbiB0aGUg
bG9vcC4KPgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgo+CkFncmVlZC4gSSd2ZSBiZWVuIGEg
bGl0dGxlIHRvbyBmYXN0IG9uIHRoaXMgb25lLgpJJ2xsIHVwZGF0ZSBpdC4KClRoeCBmb3IgdGhl
IHJldmlldy4KCkNKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
