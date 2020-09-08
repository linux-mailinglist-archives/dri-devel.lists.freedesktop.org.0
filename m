Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ADD26174A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 19:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB2C6E859;
	Tue,  8 Sep 2020 17:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41CA6E201
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 17:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599586220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlOPmtBCOzarRuQId/oebQnGR5+nqWjUd5OVLECFn+E=;
 b=BIk3yT+LZYDTITcfvOIDdZky7I4a8lt7xo0prE2M8LLChjvjDjRP9YfZ27dBNCLBhh7fkJ
 pGRXgsNm0QnRKsVkKFxud2CiRG6BKFDTiqEwFZ5qrri/F4FFjDpcfw01q6FvmvW4hAuJz5
 BxblRBN3AF7dEjswFKtW83pYWIV/ujQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-RjmfTaggPM67oMBDG3rodA-1; Tue, 08 Sep 2020 13:30:18 -0400
X-MC-Unique: RjmfTaggPM67oMBDG3rodA-1
Received: by mail-qt1-f197.google.com with SMTP id g1so11037838qtc.22
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 10:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mlOPmtBCOzarRuQId/oebQnGR5+nqWjUd5OVLECFn+E=;
 b=k3jIqbN+e5FIslntPRntLapEdf7L1nASbgELup7x8cQVqfRqAFOAiAku5T/7UMyqhp
 hTepGmGQ0K8PDX70SX6ZaAYBo+0YbwGsgZRitiWiN5eKVjRgjNMgZEbu6yjDDQ+LjtBU
 ilyDwSW/HjLC11+l165bZT3YOZxM1zC4wQ6HpU0JAWVdCggGbB1qoOeK2qAcTmUd6/o2
 d6Nb5cUNQ/yiA2CFG5Pe2O+iLaliGrzPQEMPSGmgqAM0AHh5IG0bp0QbxCWRjpJJqjZT
 zkhuq4/Fj8rldkSnGUQr7RCB0mWGsNcQEzUyHEnjTWg9nyqum21Lr7niwAEh4tX+E4YO
 S0bg==
X-Gm-Message-State: AOAM5305SqqZH9eJQLHIYPU6mt3BN6CyjThAI291Gw4zu/m37eAg4MfD
 lTtA3uNF75V/Sk0KraEew68KStJFUaOeb7QtzL2fHeRwstMCweBULlv9HsuAiPEfErNyKqRL2iZ
 mEo5KN/TZ8fotyFIhAgAsmXbTioCz
X-Received: by 2002:a05:6214:292:: with SMTP id l18mr214898qvv.3.1599586218213; 
 Tue, 08 Sep 2020 10:30:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo8Oy814ai71hFQCT4JzdnXvf/EdWyy3iRequ4xqeQvKpvKNA1cwFvU8+TiUrCVO+04EreLQ==
X-Received: by 2002:a05:6214:292:: with SMTP id l18mr214868qvv.3.1599586217807; 
 Tue, 08 Sep 2020 10:30:17 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id i10sm14862265qkh.15.2020.09.08.10.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 10:30:16 -0700 (PDT)
Message-ID: <badcf7f2b6dbfff6638db3d140f8ffc764249576.camel@redhat.com>
Subject: Re: [PATCH v2 06/18] drm/dp: Add helpers to identify downstream
 facing port types
From: Lyude Paul <lyude@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Tue, 08 Sep 2020 13:30:15 -0400
In-Reply-To: <20200904115354.25336-7-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <20200904115354.25336-7-ville.syrjala@linux.intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIwLTA5LTA0IGF0IDE0OjUzICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+
IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4g
Cj4gQWRkIGEgZmV3IGhlbHBlcnMgdG8gbGV0IHVzIGJldHRlciBpZGVudGlmeSB3aGljaCBraW5k
IG9mIERGUAo+IHdlJ3JlIGRlYWxpbmcgd2l0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgNjAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCAgNSArKysKPiAgMiBm
aWxlcyBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVy
LmMKPiBpbmRleCBjMjFiYmZjM2Q3MTQuLjBmY2I5NGY3ZGJlNSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYwo+IEBAIC0zNjMsNiArMzYzLDY2IEBAIGludCBkcm1fZHBfZHBjZF9yZWFkX2xp
bmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4Cj4gKmF1eCwKPiAgfQo+ICBFWFBPUlRfU1lNQk9M
KGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMpOwo+ICAKPiArc3RhdGljIGJvb2wgaXNfZWRp
ZF9kaWdpdGFsX2lucHV0X2RwKGNvbnN0IHN0cnVjdCBlZGlkICplZGlkKQo+ICt7Cj4gKwlyZXR1
cm4gZWRpZCAmJiBlZGlkLT5yZXZpc2lvbiA+PSA0ICYmCj4gKwkJZWRpZC0+aW5wdXQgJiBEUk1f
RURJRF9JTlBVVF9ESUdJVEFMICYmCj4gKwkJKGVkaWQtPmlucHV0ICYgRFJNX0VESURfRElHSVRB
TF9UWVBFX01BU0spID09Cj4gRFJNX0VESURfRElHSVRBTF9UWVBFX0RQOwo+ICt9Cj4gKwo+ICsv
KioKPiArICogZHJtX2RwX2Rvd25zdHJlYW1faXNfdHlwZSgpIC0gaXMgdGhlIGRvd25zdHJlYW0g
ZmFjaW5nIHBvcnQgb2YgY2VydGFpbgo+IHR5cGU/Cj4gKyAqIEBkcGNkOiBEaXNwbGF5UG9ydCBj
b25maWd1cmF0aW9uIGRhdGEKPiArICogQHBvcnRfY2FwOiBwb3J0IGNhcGFiaWxpdGllcwo+ICsg
Kgo+ICsgKiBDYXZlYXQ6IE9ubHkgd29ya3Mgd2l0aCBEUENEIDEuMSsgcG9ydCBjYXBzLgo+ICsg
Kgo+ICsgKiBSZXR1cm5zIHdoZXRoZXIgdGhlIGRvd25zdHJlYW0gZmFjaW5nIHBvcnQgbWF0Y2hl
cyB0aGUgdHlwZS4KCk5pdHBpY2s6IHMvUmV0dXJucy9SZXR1cm5zOi8gZm9yIGtkb2MgcHVycG9z
ZXMKCj4gKyAqLwo+ICtib29sIGRybV9kcF9kb3duc3RyZWFtX2lzX3R5cGUoY29uc3QgdTggZHBj
ZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0sCj4gKwkJCSAgICAgICBjb25zdCB1OCBwb3J0X2NhcFs0
XSwgdTggdHlwZSkKPiArewo+ICsJcmV0dXJuIGRybV9kcF9pc19icmFuY2goZHBjZCkgJiYKPiAr
CQlkcGNkW0RQX0RQQ0RfUkVWXSA+PSAweDExICYmCj4gKwkJKHBvcnRfY2FwWzBdICYgRFBfRFNf
UE9SVF9UWVBFX01BU0spID09IHR5cGU7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1fZHBfZG93
bnN0cmVhbV9pc190eXBlKTsKPiArCj4gKy8qKgo+ICsgKiBkcm1fZHBfZG93bnN0cmVhbV9pc190
bWRzKCkgLSBpcyB0aGUgZG93bnN0cmVhbSBmYWNpbmcgcG9ydCBUTURTPwo+ICsgKiBAZHBjZDog
RGlzcGxheVBvcnQgY29uZmlndXJhdGlvbiBkYXRhCj4gKyAqIEBwb3J0X2NhcDogcG9ydCBjYXBh
YmlsaXRpZXMKPiArICogQGVkaWQ6IEVESUQKPiArICoKPiArICogUmV0dXJucyB3aGV0aGVyIHRo
ZSBkb3duc3RyZWFtIGZhY2luZyBwb3J0IGlzIFRNRFMgKEhETUkvRFZJKS4KClNhbWUgbml0cGlj
ayBoZXJlCgo+ICsgKi8KPiArYm9vbCBkcm1fZHBfZG93bnN0cmVhbV9pc190bWRzKGNvbnN0IHU4
IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdLAo+ICsJCQkgICAgICAgY29uc3QgdTggcG9ydF9j
YXBbNF0sCj4gKwkJCSAgICAgICBjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkKPiArewo+ICsJaWYg
KGRwY2RbRFBfRFBDRF9SRVZdIDwgMHgxMSkgewo+ICsJCXN3aXRjaCAoZHBjZFtEUF9ET1dOU1RS
RUFNUE9SVF9QUkVTRU5UXSAmCj4gRFBfRFdOX1NUUk1fUE9SVF9UWVBFX01BU0spIHsKPiArCQlj
YXNlIERQX0RXTl9TVFJNX1BPUlRfVFlQRV9UTURTOgo+ICsJCQlyZXR1cm4gdHJ1ZTsKPiArCQlk
ZWZhdWx0Ogo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCXN3aXRjaCAo
cG9ydF9jYXBbMF0gJiBEUF9EU19QT1JUX1RZUEVfTUFTSykgewo+ICsJY2FzZSBEUF9EU19QT1JU
X1RZUEVfRFBfRFVBTE1PREU6Cj4gKwkJaWYgKGlzX2VkaWRfZGlnaXRhbF9pbnB1dF9kcChlZGlk
KSkKPiArCQkJcmV0dXJuIGZhbHNlOwo+ICsJCWZhbGx0aHJvdWdoOwo+ICsJY2FzZSBEUF9EU19Q
T1JUX1RZUEVfRFZJOgo+ICsJY2FzZSBEUF9EU19QT1JUX1RZUEVfSERNSToKPiArCQlyZXR1cm4g
dHJ1ZTsKPiArCWRlZmF1bHQ6Cj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsJfQo+ICt9Cj4gK0VYUE9S
VF9TWU1CT0woZHJtX2RwX2Rvd25zdHJlYW1faXNfdG1kcyk7Cj4gKwo+ICAvKioKPiAgICogZHJt
X2RwX3NlbmRfcmVhbF9lZGlkX2NoZWNrc3VtKCkgLSBzZW5kIGJhY2sgcmVhbCBlZGlkIGNoZWNr
c3VtIHZhbHVlCj4gICAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaAo+IGluZGV4IDg2NDYxYTQwMDY2Yi4uNGY5NDY4MjZkZmNlIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaAo+IEBAIC0xNjM4LDYgKzE2MzgsMTEgQEAgYm9vbCBkcm1fZHBfc2VuZF9yZWFsX2VkaWRf
Y2hlY2tzdW0oc3RydWN0IGRybV9kcF9hdXgKPiAqYXV4LAo+ICBpbnQgZHJtX2RwX3JlYWRfZG93
bnN0cmVhbV9pbmZvKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCj4gIAkJCQljb25zdCB1OCBkcGNk
W0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSwKPiAgCQkJCXU4IGRvd25zdHJlYW1fcG9ydHNbRFBfTUFY
X0RPV05TVFJFQU1fUE9SVFNdKTsKPiArYm9vbCBkcm1fZHBfZG93bnN0cmVhbV9pc190eXBlKGNv
bnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdLAo+ICsJCQkgICAgICAgY29uc3QgdTgg
cG9ydF9jYXBbNF0sIHU4IHR5cGUpOwo+ICtib29sIGRybV9kcF9kb3duc3RyZWFtX2lzX3RtZHMo
Y29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0sCj4gKwkJCSAgICAgICBjb25zdCB1
OCBwb3J0X2NhcFs0XSwKPiArCQkJICAgICAgIGNvbnN0IHN0cnVjdCBlZGlkICplZGlkKTsKPiAg
aW50IGRybV9kcF9kb3duc3RyZWFtX21heF9jbG9jayhjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVS
X0NBUF9TSVpFXSwKPiAgCQkJCWNvbnN0IHU4IHBvcnRfY2FwWzRdKTsKPiAgaW50IGRybV9kcF9k
b3duc3RyZWFtX21heF9icGMoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0sCi0t
IApDaGVlcnMsCglMeXVkZSBQYXVsIChzaGUvaGVyKQoJU29mdHdhcmUgRW5naW5lZXIgYXQgUmVk
IEhhdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
