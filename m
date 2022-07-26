Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A554D5808DE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 03:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFF5113A48;
	Tue, 26 Jul 2022 01:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAB1B1123B6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 01:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=49NVQ
 r4JLgoxazRafSEmNJdnhbuMAI7JmExSKVfr1g8=; b=VOlKQgAKq0c+Aihj6cvmo
 mStFkWJzymYugq8KcfUGAgy7BN0gVahi676Vg67BWUCi4V66bKfhwdseXIqCGuFH
 jRvbXuQGGfc7pmiNjmpZamRt+iuMGd6wc5JncYn3ar8V5A4SQs6w0AnzIEYTw7Rt
 34r+XD6FRwny965R4hBc6s=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Tue, 26 Jul 2022 08:59:08 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Tue, 26 Jul 2022 08:59:08 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>
Subject: Re:Re: [PATCH] drm/meson: Fix refcount bugs in
 meson_vpu_has_available_connectors()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CAFBinCAUuX58QTE20LBGrFSBdQw2RO7KQdFcgdqnE4N0HKn52w@mail.gmail.com>
References: <20220715132135.443675-1-windhl@126.com>
 <CAFBinCAUuX58QTE20LBGrFSBdQw2RO7KQdFcgdqnE4N0HKn52w@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <e1a6de0.7fb.1823803c7c8.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAD3_iZcPN9irV9OAA--.45205W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgRKF1-HZj3oaQABsA
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org, jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkF0IDIwMjItMDctMjYgMDM6Mzk6MTcsICJNYXJ0aW4gQmx1bWVuc3RpbmdsIiA8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj5IZWxsbywKPgo+T24gRnJpLCBKdWwg
MTUsIDIwMjIgYXQgMzoyMiBQTSBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+IHdyb3RlOgo+Pgo+
PiBJbiB0aGlzIGZ1bmN0aW9uLCB0aGVyZSBhcmUgdHdvIHJlZmNvdW50IGxlYWsgYnVnczoKPj4g
KDEpIHdoZW4gYnJlYWtpbmcgb3V0IG9mIGZvcl9lYWNoX2VuZHBvaW50X29mX25vZGUoKSwgd2Ug
bmVlZCBjYWxsCj4+IHRoZSBvZl9ub2RlX3B1dCgpIGZvciB0aGUgJ2VwJzsKPj4gKDIpIHdlIHNo
b3VsZCBjYWxsIG9mX25vZGVfcHV0KCkgZm9yIHRoZSByZWZlcmVuY2UgcmV0dXJuZWQgYnkKPj4g
b2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0KCkgd2hlbiBpdCBpcyBub3QgdXNlZCBhbnltb3JlLgo+
Pgo+PiBGaXhlczogYmJiZTc3NWVjNWI1ICgiZHJtOiBBZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBN
ZXNvbiBHcmFwaGljIENvbnRyb2xsZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2lu
ZGhsQDEyNi5jb20+Cj5BY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPgo+SXQncyBlYXN5IGZvciBtZSB0byBtaXNzIHBhdGNo
ZXMgaWYgdGhlIGxpbnV4LWFtbG9naWMgbGlzdCBpcyBub3QgcGFydAo+b2YgdGhlIHJlY2lwaWVu
dCBsaXN0Lgo+Q2FuIHlvdSBwbGVhc2UgcmUtc2VuZCB0aGlzIHBhdGNoIGFuZCBpbmNsdWRlIHRo
ZSBsaW51eC1hbWxvZ2ljCj5tYWlsaW5nIGxpc3QgKHdpdGggbXkgYWNrZWQtYnkgYWRkZWQpPyBU
aGVuIGl0IHNob3VsZCBhbHNvIHNob3cgdXAgaW4KPk5laWwncyBpbmJveCBzbyBoZSBjYW4gYXBw
bHkgdGhpcyBwYXRjaC4KPgo+Cj5UaGFuayB5b3UKPk1hcnRpbgoKVGhhbmtzLCAKCkkgd2lsbCBk
byB0aGF0IHNvb24uCg==
