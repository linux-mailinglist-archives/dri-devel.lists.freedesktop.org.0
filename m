Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7037EDD139
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025C589E2C;
	Fri, 18 Oct 2019 21:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C642D89EB7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:33:17 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-2ELReaVuOYWv7lexbpd9Ag-1; Fri, 18 Oct 2019 17:33:15 -0400
Received: by mail-qk1-f199.google.com with SMTP id h4so6814072qkd.18
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=/tStsxeXoxWGpchGc/RQ4CvsovOy3vtu5MOHtNKSFes=;
 b=UoNp9L34U550Ve7seV55uiPozk6WsA4KfIfsSrKpFKUffyHaq+3HG3mm4R9qtQVxg2
 SHvAiar3YsjcT7ZIKKhNW3F+m692BUmAbpJ/rwLIXDMODH3UECoDGvbbvQnhDkehUcKy
 hNVBS5bMct2/65G2wmInd8KCDYW+Xf2/Me9KunmMEqO6rPWJVhWm+EFzqdK9+soXSEmS
 Xkcp4Sgd62yWEoUIlNCspuFV2QJwmAjz+TO9lfBnf7lI2IB13OIyDZxXCkCIGWySOw8s
 fmm9bYmvtKSsvzpQomD8NPbP/ky6N9jkgLHW8V6GIYbNxmmd+XH5j1IO1kPRcNr0UjXl
 tK9A==
X-Gm-Message-State: APjAAAUU4Bfyxn6Hgi6N0F508jxrhkkR8aKFp8MjqHhaOMXlI6WOa2YV
 sl3a8l0NjribxLSKAIX83pj5wfpOWl+WK/HCyF614li3QOAwoAcwtb/PRToozMQelZhwM0AdKHR
 hrw8AMUa3Tnc1CbXWLntqqgKC60Gq
X-Received: by 2002:a05:620a:526:: with SMTP id
 h6mr309690qkh.213.1571434394256; 
 Fri, 18 Oct 2019 14:33:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJqY1nlUfD/1KjFlA6lyt0xIRn6F2thG6FD9okNCv43oa8nnJP6FSrpR3kbHt1yyVI/jjh+A==
X-Received: by 2002:a05:620a:526:: with SMTP id
 h6mr309673qkh.213.1571434393994; 
 Fri, 18 Oct 2019 14:33:13 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id n40sm1012248qtf.28.2019.10.18.14.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:33:13 -0700 (PDT)
Message-ID: <46be9f324facaa8afb8dae4bd5fdb16227ff8c67.camel@redhat.com>
Subject: Re: [PATCH 08/15] drm/dp: Use drm_dp_aux_rd_interval()
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:33:12 -0400
In-Reply-To: <20191015143509.1104985-9-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-9-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: 2ELReaVuOYWv7lexbpd9Ag-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571434396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VqRqnp8UOfZ/ZO/dfXURGUcR6R3rcr0Hr27VbOsvMI=;
 b=EujOaFDlVS/8ee6WnFZzIXrlZ+G3K2VaqwQoAYVHgxm1KYDo0+GjvBjthmHg+1HERKV1Gi
 xR+33POEcXnFWLKY0UloR5QlimYfFb/UGckIS5KcHQadMeSVIRmsasv/lzEto1HGWvTgxu
 IyOlCElubkSclVq5nJt/IMdHKg8D5UU=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhbHNvIHNlZW1zIGxpa2UgbWF5YmUgaXQgc2hvdWxkIGp1c3QgZ28gaW50byB0aGUgcHJl
dmlvdXMgcGF0Y2g/CgpPbiBUdWUsIDIwMTktMTAtMTUgYXQgMTY6MzUgKzAyMDAsIFRoaWVycnkg
UmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+
Cj4gCj4gTWFrZSB1c2Ugb2YgdGhlIG5ld2x5IGFkZGVkIGRybV9kcF9hdXhfcmRfaW50ZXJ2YWwo
KSBoZWxwZXIgaW4gZXhpc3RpbmcKPiBEUCBsaW5rIHRyYWluaW5nIGhlbHBlcnMuCj4gCj4gdjI6
IGRyb3Agc3RhbGUgc2VudGVuY2UgZnJvbSBjb21taXQgbWVzc2FnZSAoUGhpbGlwcCBaYWJlbCkK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMjYgKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVy
LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKPiBpbmRleCBhZDI2NzFkMmVl
OGYuLjRiNjYwMTA3NzFmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hl
bHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+IEBAIC0xMjIs
MTcgKzEyMiw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wcmVf
ZW1waGFzaXMpOwo+ICAKPiAgdm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9k
ZWxheShjb25zdCB1OAo+IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQo+ICB7Cj4gLQl1bnNp
Z25lZCBpbnQgcmRfaW50ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0g
Jgo+IC0JCQkJCURQX1RSQUlOSU5HX0FVWF9SRF9NQVNLOwo+IC0KPiAtCWlmIChyZF9pbnRlcnZh
bCA+IDQpCj4gLQkJRFJNX0RFQlVHX0tNUygiQVVYIGludGVydmFsICV1LCBvdXQgb2YgcmFuZ2Ug
KG1heCA0KVxuIiwKPiAtCQkJICAgICAgcmRfaW50ZXJ2YWwpOwo+IC0KPiAtCWlmIChyZF9pbnRl
cnZhbCA9PSAwIHx8IGRwY2RbRFBfRFBDRF9SRVZdID49IERQX0RQQ0RfUkVWXzE0KQo+IC0JCXJk
X2ludGVydmFsID0gMTAwOwo+IC0JZWxzZQo+IC0JCXJkX2ludGVydmFsICo9IDQgKiBVU0VDX1BF
Ul9NU0VDOwo+ICsJdW5zaWduZWQgaW50IHJkX2ludGVydmFsID0gZHJtX2RwX2F1eF9yZF9pbnRl
cnZhbChkcGNkKTsKPiAgCj4gIAl1c2xlZXBfcmFuZ2UocmRfaW50ZXJ2YWwsIHJkX2ludGVydmFs
ICogMik7Cj4gIH0KPiBAQCAtMTQwLDE5ICsxMzAsOSBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9s
aW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KTsKPiAgCj4gIHZvaWQgZHJtX2RwX2xpbmtf
dHJhaW5fY2hhbm5lbF9lcV9kZWxheShjb25zdCB1OAo+IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJ
WkVdKQo+ICB7Cj4gLQl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5H
X0FVWF9SRF9JTlRFUlZBTF0gJgo+IC0JCQkJCURQX1RSQUlOSU5HX0FVWF9SRF9NQVNLOwo+IC0K
PiAtCWlmIChyZF9pbnRlcnZhbCA+IDQpCj4gLQkJRFJNX0RFQlVHX0tNUygiQVVYIGludGVydmFs
ICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKPiAtCQkJICAgICAgcmRfaW50ZXJ2YWwpOwo+
ICsJdW5zaWduZWQgaW50IG1pbiA9IGRybV9kcF9hdXhfcmRfaW50ZXJ2YWwoZHBjZCk7Cj4gIAo+
IC0JaWYgKHJkX2ludGVydmFsID09IDApCj4gLQkJcmRfaW50ZXJ2YWwgPSA0MDA7Cj4gLQllbHNl
Cj4gLQkJcmRfaW50ZXJ2YWwgKj0gNCAqIFVTRUNfUEVSX01TRUM7Cj4gLQo+IC0JdXNsZWVwX3Jh
bmdlKHJkX2ludGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwo+ICsJdXNsZWVwX3JhbmdlKG1pbiwg
bWluICogMik7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua190cmFpbl9jaGFubmVs
X2VxX2RlbGF5KTsKPiAgCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
