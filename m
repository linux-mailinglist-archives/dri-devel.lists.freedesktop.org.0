Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB186C51227
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 09:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F38210E6D4;
	Wed, 12 Nov 2025 08:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ACIEwAup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A01E10E6D4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=3nAkDQYNOyKV83XpnQMrCzxI+xsdB/W7SEyzSS4E0xM=; b=A
 CIEwAupmhJHhCas9I2OmcCPSztVPCmNm4HQttVrde2j84xM1VANZarpkn8pUHjeQ
 OYiIYjGLFP5w6VZ2CaFuw3Ptjvt5VPjK1UxjgqIvYQzNk02rxvgXpSRG+iwjleFG
 BdZA55j0PRpr25C0fnAB/ARcKNN6PwM9UvrvrRUY80=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Wed, 12 Nov 2025 16:34:19 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 12 Nov 2025 16:34:19 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, andy.yan@rock-chips.com,
 hjc@rock-chips.com, heiko@sntech.de, cristian.ciocaltea@collabora.com
Subject: Re:Re:[PATCH 10/13] drm/rockchip: Enforce AFBC source alignment in
 plane_check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com>
References: <20251015110042.41273-1-daniels@collabora.com>
 <20251015110042.41273-11-daniels@collabora.com>
 <7b4e26ec.75f3.19a77276b53.Coremail.andyshrk@163.com>
X-CM-CTRLMSGS: IzeXSXBsdXM9MTc2MjkzNjQ1ODM2OV84MjdkOWM4NTYyYzQ4ZTcwYWQyZDBiN
 2YzN2IwODBhZQ==
X-NTES-SC: AL_Qu2dAPWYuUwu7yKRbOkfmUgWjuw/WsG1v/Ul1YBSP556jC/r9w8EW0F9P2DJ/eylCi2JqwmXdhF1xuZrRphXfrkUsNddwf0sDQGb0T51Pgy60w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <65f151be.7a26.19a7733902d.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgA3KYuLRhRpXNQgAA--.17216W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxgsTcWkURouFGgAA3A
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

CgpIZWxsbyBEYW5pZWzvvIwKCkF0IDIwMjUtMTEtMTIgMTY6MjE6MDMsICJBbmR5IFlhbiIgPGFu
ZHlzaHJrQDE2My5jb20+IHdyb3RlOgo+Cj5IZWxsbywKPgo+QXQgMjAyNS0xMC0xNSAxOTowMDoz
OSwgIkRhbmllbCBTdG9uZSIgPGRhbmllbHNAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4+UGxhbmVz
IGNhbiBvbmx5IHNvdXJjZSBBRkJDIGZyYW1lYnVmZmVycyBhdCBtdWx0aXBsZXMgb2YgNHB4IHdp
ZGUuCj4+SW5zdGVhZCBvZiBjbGlwcGluZyB3aGVuIHRoZSB1c2VyIGFza3MgZm9yIGFuIHVuYWxp
Z25lZCBzb3VyY2UKPj5yZWN0YW5nbGUsIHJlamVjdCB0aGUgY29uZmlndXJhdGlvbiBpbiB0aGUg
cGxhbmUncyBhdG9taWMgY2hlY2suCj4+Cj4+U2lnbmVkLW9mZi1ieTogRGFuaWVsIFN0b25lIDxk
YW5pZWxzQGNvbGxhYm9yYS5jb20+Cj4+LS0tCj4+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jIHwgMTYgKysrKysrKysrKy0tLS0tLQo+PiAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj5kaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYwo+PmluZGV4IDY1NDM3NDM3ZTNkNS4uMGFi
YWYzZTBlYWI2IDEwMDY0NAo+Pi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fdm9wMi5jCj4+KysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AyLmMKPj5AQCAtMTA2OCwxMiArMTA2OCwxOSBAQCBzdGF0aWMgaW50IHZvcDJfcGxhbmVf
YXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+PiAJICogVGhpcyBpcyB3b3Jr
YXJvdW5kIHNvbHV0aW9uIGZvciBJQyBkZXNpZ246Cj4+IAkgKiBlc21hcnQgY2FuJ3Qgc3VwcG9y
dCBzY2FsZSBkb3duIHdoZW4gc3JjX3cgJSAxNiA9PSAxLgo+PiAJICovCj4+LQlpZiAoIXZvcDJf
Y2x1c3Rlcl93aW5kb3cod2luKSAmJiBzcmNfdyA+IGRzcF93ICYmIChzcmNfdyAmIDEpKSB7Cj4+
KwlpZiAoIXZvcDJfY2x1c3Rlcl93aW5kb3cod2luKSAmJiBzcmNfdyA+IGRlc3RfdyAmJiAoc3Jj
X3cgJiAxKSkgewo+PiAJCWRybV9kYmdfa21zKHZvcDItPmRybSwKPj4gCQkJICAgICJlU21hcnQg
d2luZG93cyBjYW5ub3QgZG93bnNjYWxlIG9kZC13aWR0aCBzb3VyY2UgcmVnaW9uc1xuIik7Cj4+
IAkJcmV0dXJuIC1FSU5WQUw7Cj4+IAl9Cj4+IAo+PisJaWYgKGRybV9pc19hZmJjKGZiLT5tb2Rp
ZmllcikgJiYgc3JjX3cgJSA0KSB7Cj4+KwkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLAo+PisJCQkg
ICAgIkFGQkMgc291cmNlIHJlY3RhbmdsZXMgbXVzdCBiZSA0LWJ5dGUgYWxpZ25lZDsgaXMgJWRc
biIsCiAgCiAgcy80LWJ5dGUvNCBwaXhlbC8KCj4+KwkJCSAgICBzcmNfdyk7Cj4+KwkJcmV0dXJu
IC1FSU5WQUw7Cj4+Kwl9Cj4KCkp1c3QgYXMgYSBub3RlIGhlcmU6CkFmdGVyIGFwcGx5aW5nIHRo
aXMgcGF0Y2gsIGFsbCB3ZXN0b24tc2ltcGxlLWVnbCB0ZXN0cyB1bmRlciBXZXN0b24gd2lsbCBm
YWxsIGJhY2sgdG8gR1BVIGNvbXBvc2l0aW5nIG1vZGUuIApUaGlzIGlzIGJlY2F1c2UgdGhlIHJl
bmRlcmVkIGJveGVzIGluIHdlc3Rvbi1zaW1wbGUtZWdsIGhhdmUgYSBmaXhlZCBzaXplIG9mIDI1
MHgyNTAsIHdoaWNoIGlzIG5vdCBhbGlnbmVkIHRvIDQgcGl4ZWxzIGFuZCBjYW5ub3QgYmUgYWRq
dXN0ZWQuCgo+Cj4KPj4rCj4+IAlyZXR1cm4gMDsKPj4gfQo+PiAKPj5AQCAtMTIzNCwxMSArMTI0
MSw4IEBAIHN0YXRpYyB2b2lkIHZvcDJfcGxhbmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3Bs
YW5lICpwbGFuZSwKPj4gCVdBUk5fT04oc3JjX3cgPCA0KTsKPj4gCVdBUk5fT04oc3JjX2ggPCA0
KTsKPj4gCj4+LQlpZiAoYWZiY19lbiAmJiBzcmNfdyAlIDQpIHsKPj4tCQlkcm1fZGJnX2ttcyh2
b3AyLT5kcm0sICJ2cCVkICVzIHNyY193WyVkXSBub3QgNCBwaXhlbCBhbGlnbmVkXG4iLAo+Pi0J
CQkgICAgdnAtPmlkLCB3aW4tPmRhdGEtPm5hbWUsIHNyY193KTsKPj4tCQlzcmNfdyA9IEFMSUdO
X0RPV04oc3JjX3csIDQpOwo+Pi0JfQo+PisJaWYgKGRybV9pc19hZmJjKGZiLT5tb2RpZmllcikp
Cj4+KwkJV0FSTl9PTihzcmNfdyAlIDQpOwo+PiAKPj4gCWFjdF9pbmZvID0gKHNyY19oIC0gMSkg
PDwgMTYgfCAoKHNyY193IC0gMSkgJiAweGZmZmYpOwo+PiAJZHNwX2luZm8gPSAoZHNwX2ggLSAx
KSA8PCAxNiB8ICgoZHNwX3cgLSAxKSAmIDB4ZmZmZik7Cj4+LS0gCj4+Mi41MS4wCg==
