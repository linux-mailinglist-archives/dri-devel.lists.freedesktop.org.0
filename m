Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D61F5783D0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 15:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D8211BEA2;
	Mon, 18 Jul 2022 13:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m151.mail.126.com (m151.mail.126.com [220.181.15.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id B812E112356
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=BOveU
 zQ8GHYKZ24cInswSPmHkLEwD9NIE1jSavMq9F0=; b=HRyd7GT9CmO2HriBwBHA+
 QxRqKeKw9klKXf5/dVck14YoGadQxXTmxzk3B8wOGxbraRmVVaL5mCi9lYbzEipR
 7NPbV0AytX2DiQLKmQ51+d7H5VT036g0o88naKDj/6g2mQMBtQNsCGxu+ACa3B92
 p9aRL4u8Mt/0kZsZLYVhuE=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr1
 (Coremail) ; Mon, 18 Jul 2022 21:35:29 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Mon, 18 Jul 2022 21:35:29 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Robert Foss" <robert.foss@linaro.org>
Subject: Re:Re:Re: [PATCH] drm:bridge:analogix: Fix refcount bugs in
 anx7625_parse_dt()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <1b561938.37f8.182112a6d7d.Coremail.windhl@126.com>
References: <20220707012330.305646-1-windhl@126.com>
 <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
 <1b561938.37f8.182112a6d7d.Coremail.windhl@126.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <5bf4e0af.3a37.18211855fcf.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AcqowADXwbGiYdViqfsiAA--.61789W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuB5CF2JVkaLTZAACsC
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
Cc: andrzej.hajda@intel.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkF0IDIwMjItMDctMTggMTk6NTY6MDksICJMaWFuZyBIZSIgPHdpbmRobEAxMjYuY29tPiB3cm90
ZToKPgo+QXQgMjAyMi0wNy0xOCAxOTo1NDoxOCwgIlJvYmVydCBGb3NzIiA8cm9iZXJ0LmZvc3NA
bGluYXJvLm9yZz4gd3JvdGU6Cj4+SGV5IExpYW5nLAo+Pgo+Pgo+Pk9uIFRodSwgNyBKdWwgMjAy
MiBhdCAwMzoyNSwgTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiB3cm90ZToKPj4+Cj4+PiBUaGVy
ZSBhcmUgdHdvIHJlZmNvdW50IGJ1Z3MgaW4gdGhpcyBmdW5jaW9uOgo+Pj4KPj4+IEJVRy0xOiAn
cGRhdGEtPm1pcGlfaG9zdF9ub2RlJyB3aWxsIGJlIGFzc2lnbmVkIGEgbmV3IHJlZmVyZW5jZSB3
aXRoCj4+PiBvZl9ncmFwaF9nZXRfcmVtb3RlX25vZGUoKSB3aGljaCB3aWxsIGluY3JlYXNlIHRo
ZSByZWZjb3VudCBvZiB0aGUKPj4+IG9iamVjdCwgY29ycmVzcG9uZGluZ2x5LCB3ZSBzaG91bGQg
Y2FsbCBvZl9ub2RlX3B1dCgpIGZvciB0aGUgb2xkCj4+PiByZWZlcmVuY2Ugc3RvcmVkIGluIHRo
ZSAncGRhdGEtPm1pcGlfaG9zdF9ub2RlJy4KPj4+Cj4+PiBCVUctMjogb2ZfZ3JhcGhfZ2V0X2Vu
ZHBvaW50X2J5X3JlZ3MoKSB3aWxsIGFsc28gaW5jcmVhc2UgdGhlIHJlZmNvdW50Cj4+PiBvZiB0
aGUgb2JqZWN0IGFuZCBpdHMgbmV3IHJlZmVyZW5jZSB3aWxsIGJlIGFzc2lnbmVkIHRvIGxvY2Fs
ICdlcDAnLCBzbwo+Pj4gdGhlcmUgc2hvdWxkIGJlIGEgb2Zfbm9kZV9wdXQoKSB3aGVuICdlcDAn
IGlzIG5vdCB1c2VkIGFueW1vcmUuCj4+Pgo+Pj4gRml4ZXM6IDhiZGZjNWRhZTRlMyAoImRybS9i
cmlkZ2U6IGFueDc2MjU6IEFkZCBhbng3NjI1IE1JUEkgRFNJL0RQSSB0byBEUCIpCj4+PiBGaXhl
czogZmQwMzEwYjZmZTdkICgiZHJtL2JyaWRnZTogYW54NzYyNTogYWRkIE1JUEkgRFBJIGlucHV0
IGZlYXR1cmUiKQo+Pj4gU2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPgo+
Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMgfCAy
ICsrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jCj4+PiBpbmRleCA1M2E1ZGE2YzQ5ZGQu
LmYzOWI5YmUxOWVhZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5h
bG9naXgvYW54NzYyNS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FueDc2MjUuYwo+Pj4gQEAgLTE2MjQsNiArMTYyNCw3IEBAIHN0YXRpYyBpbnQgYW54NzYyNV9w
YXJzZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4+PiAgICAgICAgIGFueDc2MjVfZ2V0X3N3aW5n
X3NldHRpbmcoZGV2LCBwZGF0YSk7Cj4+Pgo+Pj4gICAgICAgICBwZGF0YS0+aXNfZHBpID0gMTsg
LyogZGVmYXVsdCBkcGkgbW9kZSAqLwo+Pj4gKyAgICAgICBvZl9ub2RlX3B1dChwZGF0YS0+bWlw
aV9ob3N0X25vZGUpOwo+Pj4gICAgICAgICBwZGF0YS0+bWlwaV9ob3N0X25vZGUgPSBvZl9ncmFw
aF9nZXRfcmVtb3RlX25vZGUobnAsIDAsIDApOwo+Pj4gICAgICAgICBpZiAoIXBkYXRhLT5taXBp
X2hvc3Rfbm9kZSkgewo+Pj4gICAgICAgICAgICAgICAgIERSTV9ERVZfRVJST1IoZGV2LCAiZmFp
bCB0byBnZXQgaW50ZXJuYWwgcGFuZWwuXG4iKTsKPj4+IEBAIC0xNjM4LDYgKzE2MzksNyBAQCBz
dGF0aWMgaW50IGFueDc2MjVfcGFyc2VfZHQoc3RydWN0IGRldmljZSAqZGV2LAo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgICAgYnVzX3R5cGUgPSAwOwo+Pj4KPj4+ICAgICAgICAgICAgICAgICBt
aXBpX2xhbmVzID0gb2ZfcHJvcGVydHlfY291bnRfdTMyX2VsZW1zKGVwMCwgImRhdGEtbGFuZXMi
KTsKPj4+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChlcDApOwo+Pj4gICAgICAgICB9Cj4+
Pgo+Pj4gICAgICAgICBpZiAoYnVzX3R5cGUgPT0gVjRMMl9GV05PREVfQlVTX1RZUEVfUEFSQUxM
RUwpIC8qIGJ1cyB0eXBlIGlzIFBhcmFsbGVsKERTSSkgKi8KPj4+IC0tCj4+PiAyLjI1LjEKPj4+
Cj4+Cj4+VGhpcyBwYXRjaCBkb2VzIG5vdCBhcHBseSBvbiBkcm0tbWlzYy1uZXh0LCBjb3VsZCB5
b3UgcGxlYXNlIHJlYmFzZSBpdAo+PmFuZCBzZW5kIGEgdjI/Cgo+PgoKCkhpLCBSb2IsIG1heSBJ
IHJlYmFzZSBpdCB3aXRoIGxpbnV4LW5leHQvbWFzdGVyID8KQXMgSSBjYW5ub3QgZmluZCBkcm0t
bWlzYy1uZXh0LCBvciBjYW4geW91IHRlYWNoIG1lIGhvdyB0byByZWJhc2UgdGhhdCBicmFuY2g/
CgoKVGhhbmtzIGEgbG90LAoKCkxpYW5nCgo+PlJvYi4KPgo+VGhhbmtzIGZvciB5b3VyIHJlcGx5
Lgo+Cj5JIHdpbGwgcmViYXNlIGl0IHNvb24uCj4KPkxpYW5nCg==
