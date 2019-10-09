Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F030D17A6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 20:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006436EA36;
	Wed,  9 Oct 2019 18:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC656EA36
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:40:08 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C715821848
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 18:40:07 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id y189so3173804qkc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 11:40:07 -0700 (PDT)
X-Gm-Message-State: APjAAAV2Xa4bfx6+5o+t5hf7AvVQ5tpct6TIMasejX3BUd6pCmstUlsP
 IpJJ53/TFMwbkcl+njWp6hz6J52cs5yHDNUH5g==
X-Google-Smtp-Source: APXvYqzzFH9/rMGrjPgxmK5Bg3/VLC9u1edS3prMtCOcJjCWPVn96XPxUCyl2jOEHU4qWqQ6JkbAVDHAbuo+a1f74PA=
X-Received: by 2002:a05:620a:12f1:: with SMTP id
 f17mr5211513qkl.152.1570646406928; 
 Wed, 09 Oct 2019 11:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191009094456.9704-1-steven.price@arm.com>
In-Reply-To: <20191009094456.9704-1-steven.price@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 9 Oct 2019 13:39:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKjvuhw_fWVyfptbgP-_Q6R44i6y+pg8FojO4BujDmxnA@mail.gmail.com>
Message-ID: <CAL_JsqKjvuhw_fWVyfptbgP-_Q6R44i6y+pg8FojO4BujDmxnA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panfrost: Handle resetting on timeout better
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570646407;
 bh=8o0+psPQu+dHLhbRePPNEI9DR53wq1TiTjYc/TmUhGE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l4QIGeG/BAiMXSQ/lzHVMASuMB3iOEs0tO7M+0irkKLu5mVZ2CF95Hyj2p1eng0kj
 SWF6M9d3CPHTMM6XbqWtd0qUQCiTQibjrXxThSdFIom5exCCbkjk9z4HA3gD/tGCv2
 fMPma3rdCxudPMgkRw9sH1/QUYGsMlbrHvrohTmU=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgOSwgMjAxOSBhdCA0OjQ1IEFNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+IHdyb3RlOgo+Cj4gUGFuZnJvc3QgdXNlcyBtdWx0aXBsZSBzY2hlZHVsZXJzIChv
bmUgZm9yIGVhY2ggc2xvdCwgc28gMiBpbiByZWFsaXR5KSwKPiBhbmQgb24gYSB0aW1lb3V0IGhh
cyB0byBzdG9wIGFsbCB0aGUgc2NoZWR1bGVycyB0byBzYWZlbHkgcGVyZm9ybSBhCj4gcmVzZXQu
IEhvd2V2ZXIgbW9yZSB0aGFuIG9uZSBzY2hlZHVsZXIgY2FuIHRyaWdnZXIgYSB0aW1lb3V0IGF0
IHRoZSBzYW1lCj4gdGltZS4gVGhpcyByYWNlIGNvbmRpdGlvbiByZXN1bHRzIGluIGpvYnMgYmVp
bmcgZnJlZWQgd2hpbGUgdGhleSBhcmUKPiBzdGlsbCBpbiB1c2UuCj4KPiBXaGVuIHN0b3BwaW5n
IG90aGVyIHNsb3RzIHVzZSBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoKSB0byBlbnN1cmUgdGhh
dAo+IGFueSB0aW1lb3V0IHN0YXJ0ZWQgZm9yIHRoYXQgc2xvdCBoYXMgY29tcGxldGVkLiBBbHNv
IHVzZQo+IG11dGV4X3RyeWxvY2soKSB0byBvYnRhaW4gcmVzZXRfbG9jay4gVGhpcyBtZWFucyB0
aGF0IG9ubHkgb25lIHRocmVhZAo+IGF0dGVtcHRzIHRoZSByZXNldCwgdGhlIG90aGVyIHRocmVh
ZHMgd2lsbCBzaW1wbHkgY29tcGxldGUgd2l0aG91dCBkb2luZwo+IGFueXRoaW5nICh0aGUgZmly
c3QgdGhyZWFkIHdpbGwgd2FpdCBmb3IgdGhpcyBpbiB0aGUgY2FsbCB0bwo+IGNhbmNlbF9kZWxh
eWVkX3dvcmtfc3luYygpKS4KPgo+IFdoaWxlIHdlJ3JlIGhlcmUgYW5kIHNpbmNlIHRoZSBmdW5j
dGlvbiBpcyBhbHJlYWR5IGRlcGVuZGVudCBvbgo+IHNjaGVkX2pvYiBub3QgYmVpbmcgTlVMTCwg
bGV0J3MgcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBjaGVja3MuCj4KPiBGaXhlczogYWEyMDIzNjc4
NGFiICgiZHJtL3BhbmZyb3N0OiBQcmV2ZW50IGNvbmN1cnJlbnQgcmVzZXRzIikKPiBUZXN0ZWQt
Ynk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IC0tLQo+IHYyOgo+ICAq
IEFkZGVkIGZpeGVzIGFuZCB0ZXN0ZWQtYnkgdGFncwo+ICAqIE1vdmVkIGNsZWFudXAgb2YgcGFu
ZnJvc3RfY29yZV9kdW1wKCkgY29tbWVudCB0byBzZXBhcmF0ZSBwYXRjaAo+Cj4gIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyB8IDE2ICsrKysrKysrKysrLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpCb3RoIHBh
dGNoZXMgYXBwbGllZC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
