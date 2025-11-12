Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D585C51683
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 10:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26CE10E1C3;
	Wed, 12 Nov 2025 09:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="c3HMPR9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBB910E1C3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=0ytA45AcC3m5jLGB+lFVkAnwnttXTpMu3Auy1JGfI1M=; b=c
 3HMPR9EHgBt5Yg+onaLba/j4MRgEeVID2UoMG889Q0Hr6J7wajgG9gWNkJ+ds2zu
 K49ULEDtKjFoX+mP9jTIiesgaJT0ypiCbziotDR3ieoeEZckK12Fs92w8QGoUFdn
 mLg7w0nAZvtuUejcbWGbc99jWyPGD36DhDkz7kl96A=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Wed, 12 Nov 2025 17:42:52 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 12 Nov 2025 17:42:52 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, andy.yan@rock-chips.com,
 hjc@rock-chips.com, heiko@sntech.de, cristian.ciocaltea@collabora.com
Subject: Re:Re:Re:[PATCH 10/13] drm/rockchip: Enforce AFBC source alignment
 in plane_check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <65f151be.7a26.19a7733902d.Coremail.andyshrk@163.com>
References: <20251015110042.41273-1-daniels@collabora.com>
 <20251015110042.41273-11-daniels@collabora.com>
 <7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com>
 <65f151be.7a26.19a7733902d.Coremail.andyshrk@163.com>
X-CM-CTRLMSGS: 9xdCZnBsdXM9MTc2Mjk0MDU3MTE4NF9mODkzMWNjZTA3MTA0M2E0MzA4NzJlN
 DA3MGJmMWU1YQ==
X-NTES-SC: AL_Qu2dAPWfv00s5CCZY+kfmUgWjuw/WsG1v/Ul1YBSP556jC/r9w8EW0F9P2DJ/eylCi2JqwmXdhF1xuZrRphXfrkUkQGJVSvpCgUjqI7mAAAWcA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <774a0afc.8d99.19a7772517a.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgD330ycVhRpkO8gAA--.26222W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h4EXmkUVBs1AwACsQ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpIZWxsbyBEYW5pZWwsCgrlnKggMjAyNS0xMS0xMiAxNjozNDoxOe+8jCJBbmR5IFlhbiIgPGFu
ZHlzaHJrQDE2My5jb20+IOWGmemBk++8mgo+Cj4KPkhlbGxvIERhbmllbO+8jAo+Cj5BdCAyMDI1
LTExLTEyIDE2OjIxOjAzLCAiQW5keSBZYW4iIDxhbmR5c2hya0AxNjMuY29tPiB3cm90ZToKPj4K
Pj5IZWxsbywKPj4KPj5BdCAyMDI1LTEwLTE1IDE5OjAwOjM5LCAiRGFuaWVsIFN0b25lIiA8ZGFu
aWVsc0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4+UGxhbmVzIGNhbiBvbmx5IHNvdXJjZSBBRkJD
IGZyYW1lYnVmZmVycyBhdCBtdWx0aXBsZXMgb2YgNHB4IHdpZGUuCj4+Pkluc3RlYWQgb2YgY2xp
cHBpbmcgd2hlbiB0aGUgdXNlciBhc2tzIGZvciBhbiB1bmFsaWduZWQgc291cmNlCj4+PnJlY3Rh
bmdsZSwgcmVqZWN0IHRoZSBjb25maWd1cmF0aW9uIGluIHRoZSBwbGFuZSdzIGF0b21pYyBjaGVj
ay4KPj4+Cj4+PlNpZ25lZC1vZmYtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEu
Y29tPgo+Pj4tLS0KPj4+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
Mi5jIHwgMTYgKysrKysrKysrKy0tLS0tLQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pgo+Pj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX3ZvcDIuYwo+Pj5pbmRleCA2NTQzNzQzN2UzZDUuLjBhYmFmM2UwZWFiNiAx
MDA2NDQKPj4+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Ay
LmMKPj4+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMK
Pj4+QEAgLTEwNjgsMTIgKzEwNjgsMTkgQEAgc3RhdGljIGludCB2b3AyX3BsYW5lX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPj4+IAkgKiBUaGlzIGlzIHdvcmthcm91bmQg
c29sdXRpb24gZm9yIElDIGRlc2lnbjoKPj4+IAkgKiBlc21hcnQgY2FuJ3Qgc3VwcG9ydCBzY2Fs
ZSBkb3duIHdoZW4gc3JjX3cgJSAxNiA9PSAxLgo+Pj4gCSAqLwo+Pj4tCWlmICghdm9wMl9jbHVz
dGVyX3dpbmRvdyh3aW4pICYmIHNyY193ID4gZHNwX3cgJiYgKHNyY193ICYgMSkpIHsKPj4+Kwlp
ZiAoIXZvcDJfY2x1c3Rlcl93aW5kb3cod2luKSAmJiBzcmNfdyA+IGRlc3RfdyAmJiAoc3JjX3cg
JiAxKSkgewo+Pj4gCQlkcm1fZGJnX2ttcyh2b3AyLT5kcm0sCj4+PiAJCQkgICAgImVTbWFydCB3
aW5kb3dzIGNhbm5vdCBkb3duc2NhbGUgb2RkLXdpZHRoIHNvdXJjZSByZWdpb25zXG4iKTsKPj4+
IAkJcmV0dXJuIC1FSU5WQUw7Cj4+PiAJfQo+Pj4gCj4+PisJaWYgKGRybV9pc19hZmJjKGZiLT5t
b2RpZmllcikgJiYgc3JjX3cgJSA0KSB7Cj4+PisJCWRybV9kYmdfa21zKHZvcDItPmRybSwKPj4+
KwkJCSAgICAiQUZCQyBzb3VyY2UgcmVjdGFuZ2xlcyBtdXN0IGJlIDQtYnl0ZSBhbGlnbmVkOyBp
cyAlZFxuIiwKPiAgCj4gIHMvNC1ieXRlLzQgcGl4ZWwvCgpJJ3ZlIGNoZWNrZWQgb3VyIEJTUCBj
b2RlLCBhbmQgdGhpcyBsaW1pdGF0aW9uIG9ubHkgYXBwbGllcyB0byBSSzM1NjguIApPdGhlciBT
b0NzIGxpa2UgUkszNTg4L1JLMzU3NiBkb24ndCBoYXZlIHRoaXMgbGltaXRhdGlvbi4KCgo+Cj4+
PisJCQkgICAgc3JjX3cpOwo+Pj4rCQlyZXR1cm4gLUVJTlZBTDsKPj4+Kwl9Cj4+Cj4KPkp1c3Qg
YXMgYSBub3RlIGhlcmU6Cj5BZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLCBhbGwgd2VzdG9uLXNp
bXBsZS1lZ2wgdGVzdHMgdW5kZXIgV2VzdG9uIHdpbGwgZmFsbCBiYWNrIHRvIEdQVSBjb21wb3Np
dGluZyBtb2RlLiAKPlRoaXMgaXMgYmVjYXVzZSB0aGUgcmVuZGVyZWQgYm94ZXMgaW4gd2VzdG9u
LXNpbXBsZS1lZ2wgaGF2ZSBhIGZpeGVkIHNpemUgb2YgMjUweDI1MCwgd2hpY2ggaXMgbm90IGFs
aWduZWQgdG8gNCBwaXhlbHMgYW5kIGNhbm5vdCBiZSBhZGp1c3RlZC4KPgo+Pgo+Pgo+Pj4rCj4+
PiAJcmV0dXJuIDA7Cj4+PiB9Cj4+PiAKPj4+QEAgLTEyMzQsMTEgKzEyNDEsOCBAQCBzdGF0aWMg
dm9pZCB2b3AyX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4+
PiAJV0FSTl9PTihzcmNfdyA8IDQpOwo+Pj4gCVdBUk5fT04oc3JjX2ggPCA0KTsKPj4+IAo+Pj4t
CWlmIChhZmJjX2VuICYmIHNyY193ICUgNCkgewo+Pj4tCQlkcm1fZGJnX2ttcyh2b3AyLT5kcm0s
ICJ2cCVkICVzIHNyY193WyVkXSBub3QgNCBwaXhlbCBhbGlnbmVkXG4iLAo+Pj4tCQkJICAgIHZw
LT5pZCwgd2luLT5kYXRhLT5uYW1lLCBzcmNfdyk7Cj4+Pi0JCXNyY193ID0gQUxJR05fRE9XTihz
cmNfdywgNCk7Cj4+Pi0JfQo+Pj4rCWlmIChkcm1faXNfYWZiYyhmYi0+bW9kaWZpZXIpKQo+Pj4r
CQlXQVJOX09OKHNyY193ICUgNCk7Cj4+PiAKPj4+IAlhY3RfaW5mbyA9IChzcmNfaCAtIDEpIDw8
IDE2IHwgKChzcmNfdyAtIDEpICYgMHhmZmZmKTsKPj4+IAlkc3BfaW5mbyA9IChkc3BfaCAtIDEp
IDw8IDE2IHwgKChkc3BfdyAtIDEpICYgMHhmZmZmKTsKPj4+LS0gCj4+PjIuNTEuMAo=
