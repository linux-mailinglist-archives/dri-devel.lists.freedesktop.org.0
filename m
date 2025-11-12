Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A6C5114C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 09:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC8C10E1A2;
	Wed, 12 Nov 2025 08:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="FrRhFVQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D002810E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=dpX7L4h1OBVx/+Lkn5KXg539qP+qUPxhFJacOS3aMQ8=; b=F
 rRhFVQsVFvdRiN4FvNyS3s5KJPK5Bkm2VKbW4jHHY/c0HfXWTbbAG38TFf73hcFJ
 QEFpx4/g/garvUkPYegzAQzMq7dsIpaPXrcM1gsItCBwJO9KljCZRazcro00c3Lb
 jG49LkBXtvcGp2juWgEMVxx8oy6iKYTVIKxGReG5rI=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Wed, 12 Nov 2025 16:21:03 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 12 Nov 2025 16:21:03 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, andy.yan@rock-chips.com,
 hjc@rock-chips.com, heiko@sntech.de, cristian.ciocaltea@collabora.com
Subject: Re:[PATCH 10/13] drm/rockchip: Enforce AFBC source alignment in
 plane_check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251015110042.41273-11-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
 <20251015110042.41273-11-daniels@collabora.com>
X-CM-CTRLMSGS: lZ/PnHBsdXM9MTc2MjkzNTY2MjI5Ml8wYzRhMmY2Mzg0ODc4ZTk0ZjczZjIzN
 zYxMGRlYjdlNA==
X-NTES-SC: AL_Qu2dAPWYuk4t5SSbZ+kfmUgWjuw/WsG1v/Ul1YBSP556jC/r9w8EW0F9P2DJ/eylCi2JqwmXdhF1xuZrRphXfrkUWDo7XlQydQJmfvsK28P4Ow==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgBHu3BvQxRph84gAA--.17195W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g4EXmkUP+xKGgACs6
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

CkhlbGxvLAoKQXQgMjAyNS0xMC0xNSAxOTowMDozOSwgIkRhbmllbCBTdG9uZSIgPGRhbmllbHNA
Y29sbGFib3JhLmNvbT4gd3JvdGU6Cj5QbGFuZXMgY2FuIG9ubHkgc291cmNlIEFGQkMgZnJhbWVi
dWZmZXJzIGF0IG11bHRpcGxlcyBvZiA0cHggd2lkZS4KPkluc3RlYWQgb2YgY2xpcHBpbmcgd2hl
biB0aGUgdXNlciBhc2tzIGZvciBhbiB1bmFsaWduZWQgc291cmNlCj5yZWN0YW5nbGUsIHJlamVj
dCB0aGUgY29uZmlndXJhdGlvbiBpbiB0aGUgcGxhbmUncyBhdG9taWMgY2hlY2suCj4KPlNpZ25l
ZC1vZmYtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPgo+LS0tCj4gZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgfCAxNiArKysrKysrKysr
LS0tLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cDIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5pbmRl
eCA2NTQzNzQzN2UzZDUuLjBhYmFmM2UwZWFiNiAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+QEAgLTEwNjgsMTIgKzEwNjgsMTkgQEAgc3RhdGlj
IGludCB2b3AyX3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAJ
ICogVGhpcyBpcyB3b3JrYXJvdW5kIHNvbHV0aW9uIGZvciBJQyBkZXNpZ246Cj4gCSAqIGVzbWFy
dCBjYW4ndCBzdXBwb3J0IHNjYWxlIGRvd24gd2hlbiBzcmNfdyAlIDE2ID09IDEuCj4gCSAqLwo+
LQlpZiAoIXZvcDJfY2x1c3Rlcl93aW5kb3cod2luKSAmJiBzcmNfdyA+IGRzcF93ICYmIChzcmNf
dyAmIDEpKSB7Cj4rCWlmICghdm9wMl9jbHVzdGVyX3dpbmRvdyh3aW4pICYmIHNyY193ID4gZGVz
dF93ICYmIChzcmNfdyAmIDEpKSB7Cj4gCQlkcm1fZGJnX2ttcyh2b3AyLT5kcm0sCj4gCQkJICAg
ICJlU21hcnQgd2luZG93cyBjYW5ub3QgZG93bnNjYWxlIG9kZC13aWR0aCBzb3VyY2UgcmVnaW9u
c1xuIik7Cj4gCQlyZXR1cm4gLUVJTlZBTDsKPiAJfQo+IAo+KwlpZiAoZHJtX2lzX2FmYmMoZmIt
Pm1vZGlmaWVyKSAmJiBzcmNfdyAlIDQpIHsKPisJCWRybV9kYmdfa21zKHZvcDItPmRybSwKPisJ
CQkgICAgIkFGQkMgc291cmNlIHJlY3RhbmdsZXMgbXVzdCBiZSA0LWJ5dGUgYWxpZ25lZDsgaXMg
JWRcbiIsCj4rCQkJICAgIHNyY193KTsKPisJCXJldHVybiAtRUlOVkFMOwo+Kwl9CgpKdXN0IGFz
IGEgbm90ZSBoZXJlOgpBZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLCBhbGwgd2VzdG9uLXNpbXBs
ZS1lZ2wgdGVzdHMgdW5kZXIgV2VzdG9uIHdpbGwgZmFsbCBiYWNrIHRvIEdQVSBjb21wb3NpdGlu
ZyBtb2RlLiAKVGhpcyBpcyBiZWNhdXNlIHRoZSByZW5kZXJlZCBib3hlcyBpbiB3ZXN0b24tc2lt
cGxlLWVnbCBoYXZlIGEgZml4ZWQgc2l6ZSBvZiAyNTB4MjUwLCB3aGljaCBpcyBub3QgYWxpZ25l
ZCB0byA0IHBpeGVscyBhbmQgY2Fubm90IGJlIGFkanVzdGVkLgoKCj4rCj4gCXJldHVybiAwOwo+
IH0KPiAKPkBAIC0xMjM0LDExICsxMjQxLDggQEAgc3RhdGljIHZvaWQgdm9wMl9wbGFuZV9hdG9t
aWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+IAlXQVJOX09OKHNyY193IDwgNCk7
Cj4gCVdBUk5fT04oc3JjX2ggPCA0KTsKPiAKPi0JaWYgKGFmYmNfZW4gJiYgc3JjX3cgJSA0KSB7
Cj4tCQlkcm1fZGJnX2ttcyh2b3AyLT5kcm0sICJ2cCVkICVzIHNyY193WyVkXSBub3QgNCBwaXhl
bCBhbGlnbmVkXG4iLAo+LQkJCSAgICB2cC0+aWQsIHdpbi0+ZGF0YS0+bmFtZSwgc3JjX3cpOwo+
LQkJc3JjX3cgPSBBTElHTl9ET1dOKHNyY193LCA0KTsKPi0JfQo+KwlpZiAoZHJtX2lzX2FmYmMo
ZmItPm1vZGlmaWVyKSkKPisJCVdBUk5fT04oc3JjX3cgJSA0KTsKPiAKPiAJYWN0X2luZm8gPSAo
c3JjX2ggLSAxKSA8PCAxNiB8ICgoc3JjX3cgLSAxKSAmIDB4ZmZmZik7Cj4gCWRzcF9pbmZvID0g
KGRzcF9oIC0gMSkgPDwgMTYgfCAoKGRzcF93IC0gMSkgJiAweGZmZmYpOwo+LS0gCj4yLjUxLjAK

