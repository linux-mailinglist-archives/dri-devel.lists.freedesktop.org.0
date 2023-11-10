Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627A7E8249
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 20:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C058B10E1E1;
	Fri, 10 Nov 2023 19:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0989410E1E1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 19:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699643537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2rQSJA1TPEqQ3pLuDDaUZ5DzRXw4Qpr/bbVgLM+1BI=;
 b=aEjplxNsrxG1L8Tqk1mktFyJEZ7XRSE1CEmlZzoelaiQ+oYavmmu63RSuwRzS95zrmTe94
 M/Bm1GY45lJhaa7y090+sVNeTeVGHSSGeguJRjvTctuUxEevz0we75bdNXxKO7vUfU3VaM
 LBUvCdbz6eURVblPFyCZIa4V3Yr5bGE=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-LcOZ7e97O9efESsylzoGXQ-1; Fri, 10 Nov 2023 14:12:15 -0500
X-MC-Unique: LcOZ7e97O9efESsylzoGXQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-4ac1cbd8a18so87579e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699643535; x=1700248335;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l2rQSJA1TPEqQ3pLuDDaUZ5DzRXw4Qpr/bbVgLM+1BI=;
 b=sgfkECVBkeGDaZK1JeEswLXRDu6Vgs90nIQqDbthjmPGyUOPdQP0wPM6zyWr3KMqDs
 SXx/HF4eApaFQ+vwQXGKpAMSUDuExcYyFXlgOuBeqZDfGtyESmctb+pF7HomghptXNdR
 3YM88pYsmeZwTeHz3WWfDn3LOtWm5qrAfvFAjdqla8d6CHzsUJ1OzyGWTAQPx+IcYQKP
 1mG45ujbPC9itDnJM+WiKwUPGAnNfDhX1VuDn45gqHon65fJ7AVdXxGUO8HLxDJQqcZr
 aOvKIPnKprRgoynbdSvFQsa2ctU8yoIbogXbBaxEjOL3jVlhboFjbfVK0AHdLAJi3gzx
 gvqA==
X-Gm-Message-State: AOJu0Yy4i25k7JbzBrRFsTuDVgXjd+LIPKn3uk/f8rVZCZd7W7J1Hgol
 YsGtjd1eQsDJ3RqaABsp5SqT5k4uag57smarEchBhcToCFlgpRzmFddZpTuDeURG68Ucr7i5OYg
 gwLhEPrJh+sVVD3sVeThy3nfXOon6
X-Received: by 2002:a05:6102:fa7:b0:45d:90fd:6869 with SMTP id
 e39-20020a0561020fa700b0045d90fd6869mr315147vsv.3.1699643535299; 
 Fri, 10 Nov 2023 11:12:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNUZf53cU8PJ98ugmmFi11bp8s6MtbMuOjMS2vruW5KuDYMy16IG1GofXfOBFfGA0OimvlIw==
X-Received: by 2002:a05:6102:fa7:b0:45d:90fd:6869 with SMTP id
 e39-20020a0561020fa700b0045d90fd6869mr315123vsv.3.1699643535016; 
 Fri, 10 Nov 2023 11:12:15 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32e5:ff00:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 bl16-20020a05620a1a9000b007757868e75csm24803qkb.117.2023.11.10.11.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 11:12:14 -0800 (PST)
Message-ID: <a6f35e9bf5a2857e12b2d7ee38f82b6d4468a9c5.camel@redhat.com>
Subject: Re: [PATCH v2] drm/ast: use managed devres functions
From: Philipp Stanner <pstanner@redhat.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Jocelyn Falempe <jfalempe@redhat.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 10 Nov 2023 20:12:12 +0100
In-Reply-To: <20231103182542.97589-2-pstanner@redhat.com>
References: <20231103182542.97589-2-pstanner@redhat.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTExLTAzIGF0IDE5OjI1ICswMTAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
Cj4gQ3VycmVudGx5LCB0aGEgYXN0LWRyaXZlciBqdXN0IG1hcHMgdGhlIFBDSS1kZXYncyByZWdp
b25zIHdpdGgKPiBwY2ltX2lvbWFwKCkuIEl0IGRvZXMgbm90IGFjdHVhbGx5IHJlc2VydmUgdGhl
IHJlZ2lvbnMgZXhjbHVzaXZlbHkKPiB3aXRoLCBlLmcuLCBwY2lfcmVxdWVzdF9yZWdpb25zKCku
Cj4gCj4gUmVwbGFjZSB0aGUgY2FsbHMgdG8gcGNpbV9pb21hcCgpIHdpdGggb25lcyB0byBwY2lt
X2lvbWFwX3JlZ2lvbnMoKQo+IHRvCj4gcmVzZXJ2ZSBhbmQgbWFwIHRoZSByZWdpb25zIHNpbXVs
dGFuZW91c2x5Lgo+IAo+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBTdGFubmVyIDxwc3Rhbm5lckBy
ZWRoYXQuY29tPgoKVGhpbmtpbmcgYWJvdXQgdGhpcyBvbmNlIG1vcmUsIEkgZ3Vlc3Mgd2UgY291
bGQgcG9zdHBvbmUgbWVyZ2luZyBpdC4KCkknbSBhIGJpdCB1bmhhcHB5IHdpdGggdGhlIHBjaW1f
KiBmdW5jdGlvbnMgYXMgdGhleSdyZSBjdXJyZW50bHkKaW1wbGVtZW50ZWQgYW5kIG1pZ2h0IHNv
b24gc3RhcnQgd29ya2luZyBvbiBhIHJlcGxhY2VtZW50LgoKRGVwZW5kaW5nIG9uIHRoYXQgd29y
aywgdGhpcyBQYXRjaCBoZXJlIG1pZ2h0IHNvb24gYmUgb2Jzb2xldGUgLwpvdXRkYXRlZCBhbnl3
YXlzLgoKQnV0IG1lcmdpbmcgd291bGRuJ3QgaHVydCBvbiB0aGUgb3RoZXIgaGFuZCwgYXMgSSBo
YXZlIHRvIHNlbmQgYSBuZXcKb25lIGluIGFueSBjYXNlLiBJIGxlYXZlIHRoYXQgdXAgdG8gdGhl
IG1haW50YWluZXIuCgpTZWUgYWxzbyBoZXJlIFsxXSBpZiBpbnRlcmVzdGVkLgoKUC4KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvODRiZTEwNDllNDEyODNjZjhhMTEwMjY3NjQ2MzIw
YWY5ZmZlNTlmZS5jYW1lbEByZWRoYXQuY29tLwoKCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAt
IFJlbW92ZSB1bm5lY2Vzc2FyeSByZXR1cm4gY29kZSBjaGVja3MgZm9yIHBjaW1faW9tYXBfcmVn
aW9ucygpCj4gwqAgKEpvY2VseW4pCj4gCj4gVGh4IEpvY2VseW4gZm9yIHRoZSBraW5kIHJldmll
dwo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIHwgMTUgKysrKysrKysr
LS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMKPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwo+IGluZGV4IGRhZTM2NWVkMzk2OS4uOGI3MTRi
OTlmOWQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYwo+IEBAIC00NDQsOSArNDQ0LDExIEBA
IHN0cnVjdCBhc3RfZGV2aWNlICphc3RfZGV2aWNlX2NyZWF0ZShjb25zdAo+IHN0cnVjdCBkcm1f
ZHJpdmVyICpkcnYsCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gRVJSX1BUUihyZXQpOwo+IMKgCj4gLcKgwqDCoMKgwqDC
oMKgYXN0LT5yZWdzID0gcGNpbV9pb21hcChwZGV2LCAxLCAwKTsKPiAtwqDCoMKgwqDCoMKgwqBp
ZiAoIWFzdC0+cmVncykKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVS
Ul9QVFIoLUVJTyk7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gcGNpbV9pb21hcF9yZWdpb25zKHBk
ZXYsIEJJVCgxKSwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9QVFIocmV0KTsKPiArCj4gK8KgwqDCoMKgwqDC
oMKgYXN0LT5yZWdzID0gcGNpbV9pb21hcF90YWJsZShwZGV2KVsxXTsKPiDCoAo+IMKgwqDCoMKg
wqDCoMKgwqAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBBZnRlciBBU1QyNTAwLCBNTUlPIGlzIGVu
YWJsZWQgYnkgZGVmYXVsdCwgYW5kIGl0IHNob3VsZAo+IGJlIGFkb3B0ZWQKPiBAQCAtNDYxLDkg
KzQ2MywxMCBAQCBzdHJ1Y3QgYXN0X2RldmljZSAqYXN0X2RldmljZV9jcmVhdGUoY29uc3QKPiBz
dHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LAo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoC8qICJtYXAiIElP
IHJlZ3MgaWYgdGhlIGFib3ZlIGhhc24ndCBkb25lIHNvIGFscmVhZHkgKi8KPiDCoMKgwqDCoMKg
wqDCoMKgaWYgKCFhc3QtPmlvcmVncykgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBhc3QtPmlvcmVncyA9IHBjaW1faW9tYXAocGRldiwgMiwgMCk7Cj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmICghYXN0LT5pb3JlZ3MpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gRVJSX1BUUigtRUlPKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYsIEJJ
VCgyKSwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gRVJSX1BU
UihyZXQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhc3QtPmlvcmVncyA9IHBj
aW1faW9tYXBfdGFibGUocGRldilbMl07Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoIWFzdF9pc192Z2FfZW5hYmxlZChkZXYpKSB7Cgo=

