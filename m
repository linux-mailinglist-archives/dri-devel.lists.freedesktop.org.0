Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E19DDD137
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9B989DFC;
	Fri, 18 Oct 2019 21:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB5B89DEC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:31:27 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-RYi-XM79O8CHH8qNVW9tNQ-1; Fri, 18 Oct 2019 17:31:22 -0400
Received: by mail-qk1-f200.google.com with SMTP id c4so2279132qkg.22
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=V0nhm4twiNT6g2sPbhvFqzlma41vJH6beXNTlvkgeU0=;
 b=AjB8H7j/TbiQ29ln6VH+GkHqmxdWH1Uxwc1mX89FMhsJx++nhC3g2inMgj8wYNqXN2
 8TdcKFnA8tKbcUwvZA19Riit9rfCuJVBGFwEmdCVmPnQX3J90RILSO66yp9/U4N/PPkV
 GWx6UIb+tiLsZBlHTzP86AuzPJ8sJU+SKw9BBX4+OxGKFO6rS3PLDRbYZJkYc0lftZWE
 G6cRrSiuEyy1vilRL7B4TTu/2K1rnJzIFuQE0xFL4h/f273Bq5+MGKyTglNIzxtvWZmm
 5zLe3WckOobDMQ9H0AfikJRE+dLgeOufHqdiJjrYQ4psrMgkVTHsxtjD0yFKanHWcyQC
 8qug==
X-Gm-Message-State: APjAAAXdh66uTDEj+NaPD2BqmRrOqWY+OwShDZ6bKrOamwWVBSijs8ED
 uqGhB2df9atmaJLhuJ/35R2ufrWz/VJHg2z6vdY+dzuB7TWSruwVi1Mpc44ZX2Ygb0A61OZSZZP
 8rAZ3X4RinDXFh2Js9FdY9kcJ0tNQ
X-Received: by 2002:a37:4e81:: with SMTP id
 c123mr10485889qkb.468.1571434281890; 
 Fri, 18 Oct 2019 14:31:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBkO7oVOaM7fgh60UHK85wJy/fuRrIen1MxW79TKjhkPnlDg3aZ8h2CVCZtrvBo2yeSQTyjg==
X-Received: by 2002:a37:4e81:: with SMTP id
 c123mr10485861qkb.468.1571434281591; 
 Fri, 18 Oct 2019 14:31:21 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id p56sm5031460qtp.81.2019.10.18.14.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:31:20 -0700 (PDT)
Message-ID: <602a722d8c6a49f907e9f6e76c5d02cc05d5142a.camel@redhat.com>
Subject: Re: [PATCH 07/15] drm/dp: Do not busy-loop during link training
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:31:19 -0400
In-Reply-To: <20191015143509.1104985-8-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-8-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: RYi-XM79O8CHH8qNVW9tNQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571434286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7NOoZF0Oc0NhPUyuSMnFkGGemvWkCWwVUsXxBCVtRk=;
 b=cJZKSNRPB4RsjH1n6JbC/tiLXDYUZ4zXR34AEttb6r8CR/d4dqVWYJsxoBf+qYCqBB4uDV
 pKqnXlmTVsM41iLdQ0X6IRXu7nzQmhVLg4S4TGKuD3MW6sf0sqtG3MmWsrBDhL0J/2vjJk
 ASc4Y52Aywzq9jTpKXZAYxpffGS5aFc=
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

T24gVHVlLCAyMDE5LTEwLTE1IGF0IDE2OjM1ICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToK
PiBGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFVzZSBtaWNy
b3NlY29uZCBzbGVlcHMgZm9yIHRoZSBjbG9jayByZWNvdmVyeSBhbmQgY2hhbm5lbCBlcXVhbGl6
YXRpb24KPiBkZWxheXMgZHVyaW5nIGxpbmsgdHJhaW5pbmcuIFRoZSBkdXJhdGlvbiBvZiB0aGVz
ZSBkZWxheXMgY2FuIGJlIGZyb20KPiAxMDAgdXMgdXAgdG8gMTYgbXMuIEl0IGlzIHJ1ZGUgdG8g
YnVzeS1sb29wIGZvciB0aGF0IGFtb3VudCBvZiB0aW1lLgo+IAo+IFdoaWxlIGF0IGl0LCBhbHNv
IGNvbnZlcnQgdG8gc3RhbmRhcmQgY29kaW5nIHN0eWxlIGJ5IHB1dHRpbmcgdGhlCj4gb3Blbmlu
ZyBicmFjZXMgaW4gYSBmdW5jdGlvbiBkZWZpbml0aW9uIG9uIGEgbmV3IGxpbmUuCj4gCj4gdjI6
IHVzZSBjb3JyZWN0IG11bHRpcGxpZXIgZm9yIHRyYWluaW5nIGRlbGF5cyAoUGhpbGlwcCBaYWJl
bCkKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMzAgKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+IGluZGV4IDhm
MmQ3YzQ4NTBjYS4uYWQyNjcxZDJlZThmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4g
QEAgLTEyMCwzMyArMTIwLDM5IEBAIHU4IGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2Vt
cGhhc2lzKGNvbnN0IHU4Cj4gbGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0kKPiAgfQo+ICBF
WFBPUlRfU1lNQk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2VtcGhhc2lzKTsKPiAg
Cj4gLXZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3QgdTgK
PiBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkgewo+IC0JaW50IHJkX2ludGVydmFsID0gZHBj
ZFtEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUxdICYKPiAtCQkJICBEUF9UUkFJTklOR19BVVhf
UkRfTUFTSzsKPiArdm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShj
b25zdCB1OAo+IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQo+ICt7Cj4gKwl1bnNpZ25lZCBp
bnQgcmRfaW50ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgo+ICsJ
CQkJCURQX1RSQUlOSU5HX0FVWF9SRF9NQVNLOwoKRGlkIHlvdSBtZWFuIHRvIHB1dCB0aGlzIGNv
bnZlcnNpb24gZnJvbSBzaWduZWQgdG8gdW5zaWduZWQgaW4gdGhlIHByZXZpb3VzCnBhdGNoPwoK
PiAgCj4gIAlpZiAocmRfaW50ZXJ2YWwgPiA0KQo+IC0JCURSTV9ERUJVR19LTVMoIkFVWCBpbnRl
cnZhbCAlZCwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCj4gKwkJRFJNX0RFQlVHX0tNUygiQVVY
IGludGVydmFsICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKPiAgCQkJICAgICAgcmRfaW50
ZXJ2YWwpOwo+ICAKPiAgCWlmIChyZF9pbnRlcnZhbCA9PSAwIHx8IGRwY2RbRFBfRFBDRF9SRVZd
ID49IERQX0RQQ0RfUkVWXzE0KQo+IC0JCXVkZWxheSgxMDApOwo+ICsJCXJkX2ludGVydmFsID0g
MTAwOwo+ICAJZWxzZQo+IC0JCW1kZWxheShyZF9pbnRlcnZhbCAqIDQpOwo+ICsJCXJkX2ludGVy
dmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOwo+ICsKPiArCXVzbGVlcF9yYW5nZShyZF9pbnRlcnZh
bCwgcmRfaW50ZXJ2YWwgKiAyKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX3Ry
YWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KTsKPiAgCj4gLXZvaWQgZHJtX2RwX2xpbmtfdHJhaW5f
Y2hhbm5lbF9lcV9kZWxheShjb25zdCB1OAo+IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKSB7
Cj4gLQlpbnQgcmRfaW50ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0g
Jgo+IC0JCQkgIERQX1RSQUlOSU5HX0FVWF9SRF9NQVNLOwo+ICt2b2lkIGRybV9kcF9saW5rX3Ry
YWluX2NoYW5uZWxfZXFfZGVsYXkoY29uc3QgdTgKPiBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpF
XSkKPiArewo+ICsJdW5zaWduZWQgaW50IHJkX2ludGVydmFsID0gZHBjZFtEUF9UUkFJTklOR19B
VVhfUkRfSU5URVJWQUxdICYKPiArCQkJCQlEUF9UUkFJTklOR19BVVhfUkRfTUFTSzsKPiAgCj4g
IAlpZiAocmRfaW50ZXJ2YWwgPiA0KQo+IC0JCURSTV9ERUJVR19LTVMoIkFVWCBpbnRlcnZhbCAl
ZCwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCj4gKwkJRFJNX0RFQlVHX0tNUygiQVVYIGludGVy
dmFsICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKPiAgCQkJICAgICAgcmRfaW50ZXJ2YWwp
Owo+ICAKPiAgCWlmIChyZF9pbnRlcnZhbCA9PSAwKQo+IC0JCXVkZWxheSg0MDApOwo+ICsJCXJk
X2ludGVydmFsID0gNDAwOwo+ICAJZWxzZQo+IC0JCW1kZWxheShyZF9pbnRlcnZhbCAqIDQpOwo+
ICsJCXJkX2ludGVydmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOwo+ICsKPiArCXVzbGVlcF9yYW5n
ZShyZF9pbnRlcnZhbCwgcmRfaW50ZXJ2YWwgKiAyKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRy
bV9kcF9saW5rX3RyYWluX2NoYW5uZWxfZXFfZGVsYXkpOwo+ICAKLS0gCkNoZWVycywKCUx5dWRl
IFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
