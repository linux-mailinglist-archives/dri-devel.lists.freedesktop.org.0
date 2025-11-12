Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36865C51103
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 09:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF310E02A;
	Wed, 12 Nov 2025 08:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ddBoh7ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980F910E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=n+ykinVezNOkxcY4ZaQeZyYBRFfdgANCD2XTOWD3e1w=; b=d
 dBoh7ftrwK+C/wqMhQjxKXc6CztZe/jNSIsxghAV4MRkYKhiIvgpAI67RJSMAVAU
 RphWX9P7yb4IZzMvyDiruaRkTcjQy2hNQLs7MC2m5VBOjKHvMS/Q8p+FDjqL23dC
 2mLiQenFTH5F+RHvjHoDr7EhYoXQgp0CRhY/P81g3A=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Wed, 12 Nov 2025 16:13:06 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 12 Nov 2025 16:13:06 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Daniel Stone" <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, andy.yan@rock-chips.com,
 hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: Re:[PATCH 09/13] drm/rockchip: Enforce scaling workaround in
 plane_check
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20251015110042.41273-10-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
 <20251015110042.41273-10-daniels@collabora.com>
X-CM-CTRLMSGS: 2NRcYHBsdXM9MTc2MjkzNTE4NTQxMl8xZGUyMThjYTFmNzMxMTQzZDUwMmVlY
 WExZjc4NzJmOA==
X-NTES-SC: AL_Qu2dAPWYukkj4COQZekfmUgWjuw/WsG1v/Ul1YBSP556jC/r9w8EW0F9P2DJ/eylCi2JqwmXdhF1xuZrRphXfrkUq2PwnLVo/PcKrdkoxXWBqQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <13689858.7382.19a772023d7.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgDn2FaSQRRpJMsgAA--.17168W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRLTMmkUQZLbvAAA3-
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

CkhlbGxvIERhbmllbO+8jAoKVGhlIHN1YmplY3Qgc2hvdWxkIHByZWZlcmFibHkgYmUgbGlrZSB0
aGlz77yaICJkcm0vcm9ja2NoaXA6IHZvcDI6ICAuLi4uLi4uIgpjb25zaXN0ZW50IHdpdGggb3Ro
ZXIgY29tbWl0cy4KCgpBdCAyMDI1LTEwLTE1IDE5OjAwOjM4LCAiRGFuaWVsIFN0b25lIiA8ZGFu
aWVsc0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPkl0IHNlZW1zIG9ubHkgY2x1c3RlciB3aW5kb3dz
IGFyZSBjYXBhYmxlIG9mIGFwcGx5aW5nIGRvd25zY2FsaW5nIHdoZW4KPnRoZSBzb3VyY2UgcmVn
aW9uIGhhcyBhbiBvZGQgd2lkdGguIEluc3RlYWQgb2YgYXBwbHlpbmcgYSB3b3JrYXJvdW5kCj5p
bnNpZGUgYXRvbWljX3VwZGF0ZSwgZmFpbCB0aGUgcGxhbmUgY2hlY2sgaWYgdGhpcyBpcyByZXF1
ZXN0ZWQuCj4KPlNpZ25lZC1vZmYtYnk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEu
Y29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMg
fCAyMSArKysrKysrKysrLS0tLS0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV92b3AyLmMKPmluZGV4IGY4MDM5ZGMwZTgyOS4uNjU0Mzc0MzdlM2Q1IDEwMDY0NAo+
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5AQCAtOTk3LDYg
Kzk5Nyw3IEBAIHN0YXRpYyBpbnQgdm9wMl9wbGFuZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9w
bGFuZSAqcGxhbmUsCj4gCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IHBzdGF0ZS0+Y3J0YzsKPiAJ
c3RydWN0IGRybV9jcnRjX3N0YXRlICpjc3RhdGU7Cj4gCXN0cnVjdCB2b3AyX3ZpZGVvX3BvcnQg
KnZwOwo+KwlzdHJ1Y3Qgdm9wMl93aW4gKndpbiA9IHRvX3ZvcDJfd2luKHBsYW5lKTsKPiAJc3Ry
dWN0IHZvcDIgKnZvcDI7Cj4gCWNvbnN0IHN0cnVjdCB2b3AyX2RhdGEgKnZvcDJfZGF0YTsKPiAJ
c3RydWN0IGRybV9yZWN0ICpkZXN0ID0gJnBzdGF0ZS0+ZHN0Owo+QEAgLTEwNjMsNiArMTA2NCwx
NiBAQCBzdGF0aWMgaW50IHZvcDJfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUg
KnBsYW5lLAo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4gCX0KPiAKPisJLyoKPisJICogVGhpcyBpcyB3
b3JrYXJvdW5kIHNvbHV0aW9uIGZvciBJQyBkZXNpZ246Cj4rCSAqIGVzbWFydCBjYW4ndCBzdXBw
b3J0IHNjYWxlIGRvd24gd2hlbiBzcmNfdyAlIDE2ID09IDEuCj4rCSAqLwo+KwlpZiAoIXZvcDJf
Y2x1c3Rlcl93aW5kb3cod2luKSAmJiBzcmNfdyA+IGRzcF93ICYmIChzcmNfdyAmIDEpKSB7Cj4r
CQlkcm1fZGJnX2ttcyh2b3AyLT5kcm0sCj4rCQkJICAgICJlU21hcnQgd2luZG93cyBjYW5ub3Qg
ZG93bnNjYWxlIG9kZC13aWR0aCBzb3VyY2UgcmVnaW9uc1xuIik7Cj4rCQlyZXR1cm4gLUVJTlZB
TDsKPisJfQo+Kwo+IAlyZXR1cm4gMDsKPiB9Cj4gCj5AQCAtMTIyMywxNiArMTIzNCw2IEBAIHN0
YXRpYyB2b2lkIHZvcDJfcGxhbmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFu
ZSwKPiAJV0FSTl9PTihzcmNfdyA8IDQpOwo+IAlXQVJOX09OKHNyY19oIDwgNCk7Cj4gCj4tCS8q
Cj4tCSAqIFRoaXMgaXMgd29ya2Fyb3VuZCBzb2x1dGlvbiBmb3IgSUMgZGVzaWduOgo+LQkgKiBl
c21hcnQgY2FuJ3Qgc3VwcG9ydCBzY2FsZSBkb3duIHdoZW4gc3JjX3cgJSAxNiA9PSAxLgo+LQkg
Ki8KPi0JaWYgKCF2b3AyX2NsdXN0ZXJfd2luZG93KHdpbikgJiYgc3JjX3cgPiBkc3BfdyAmJiAo
c3JjX3cgJiAxKSkgewo+LQkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLCAidnAlZCAlcyBhY3Rfd1sl
ZF0gTU9ERSAxNiA9PSAxXG4iLAo+LQkJCSAgICB2cC0+aWQsIHdpbi0+ZGF0YS0+bmFtZSwgc3Jj
X3cpOwo+LQkJc3JjX3cgLT0gMTsKPi0JfQoKVGhlcmUgaXMgbm8gZGVmaW5pdGlvbiBmb3IgZHNw
X3cgaW4gdGhpcyBmdW5jdGlvbiBub3csICBpdCB3aWxsIGNhdXNlIGNvbXBpbGUgZXJyb3IgZm9y
IHRoaXMgc2luZ2xlIHBhdGNoLgp5b3UgY2FuIHVzZSBkZXN0X3cgaGVyZS4KCj4tCj4gCWlmIChh
ZmJjX2VuICYmIHNyY193ICUgNCkgewo+IAkJZHJtX2RiZ19rbXModm9wMi0+ZHJtLCAidnAlZCAl
cyBzcmNfd1slZF0gbm90IDQgcGl4ZWwgYWxpZ25lZFxuIiwKPiAJCQkgICAgdnAtPmlkLCB3aW4t
PmRhdGEtPm5hbWUsIHNyY193KTsKPi0tIAo+Mi41MS4wCg==
