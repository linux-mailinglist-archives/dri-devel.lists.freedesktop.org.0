Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B2DD11C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8805C891C0;
	Fri, 18 Oct 2019 21:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF3C891C0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:22:22 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-0S-Tbl88Nw6K8XAMLTJK9Q-1; Fri, 18 Oct 2019 17:22:16 -0400
Received: by mail-qk1-f198.google.com with SMTP id m28so6421096qkm.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Ns+0KGQPDqjExZxNh3eNMVH5IC3H4jx7Pe2KeKmi8ZA=;
 b=pKUMcUmW++ohuhsUwku5dG5m6wKd/MhPnTF6E7mMmQw3OW7IgRGfaSC5kh6ptJbyVT
 C4xjbB0/c1ApHLwZoTi/OyOaXO5xnQe6SUayxEGqVvYxUcpsXEb2427jsGAdlqvEpAAE
 jc4WMK0hkMrqTvX+POprbqF+R6TVMqCB+TQbDDno7f6/gpqFWW7836dXVhckSKWF8vbN
 DVqzuJ8rtVGAGGmkP/PhaMf38p9cMTMPsLGzWDEeLoCHNddY6WZqe6ewc1ZSAwadFEvH
 mVwVRb4nmv7gd03VAvJYCV62HNswqma2LKm3VmuIquYi1OfjQC8TxyVJ+rq9w12CiMxx
 6HXQ==
X-Gm-Message-State: APjAAAVzsbNqqFEP02JB/a7iaREetLmxVty4XN3+HlCaS8NfHw33iopt
 T+zK1z/kNSnhHcQ/WZAmsXmh/BcBJgS5vYsz+pOP3LP0blfjGNoOV8JV8ds8i7ixSB1CPffmXay
 o1DOTSR0qcKew0hTD++69dF8kDfs1
X-Received: by 2002:ac8:334e:: with SMTP id u14mr12499519qta.120.1571433736483; 
 Fri, 18 Oct 2019 14:22:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLnhBojOx+mNYesfikICKnTQeVwZhOjuUakJKXddrjEABS9ZWXleKzdZIOuRpSw0edv0KQ/g==
X-Received: by 2002:ac8:334e:: with SMTP id u14mr12499506qta.120.1571433736306; 
 Fri, 18 Oct 2019 14:22:16 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 64sm3304644qkk.63.2019.10.18.14.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:22:15 -0700 (PDT)
Message-ID: <d6685e611acf04c9ef617811faf49f8455321ba5.camel@redhat.com>
Subject: Re: [PATCH 03/15] drm/dp: Add drm_dp_fast_training_cap() helper
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:22:14 -0400
In-Reply-To: <20191015143509.1104985-4-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-4-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: 0S-Tbl88Nw6K8XAMLTJK9Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571433741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ce0tBs3zD+xWuw1b4EhT/oMKvrBblLgcEqswANEeUvI=;
 b=RIsLw5c6G4eWy4BQpaJCPSK5UEtiN2B0wDpRLcEpWuJAUEyd7/FuRQTjiCUTqmAsCVfaSD
 eXt6xvd15P2lotwJAYcKVum2b7IgR3WA+iRFL3YWJ051YUm5b80EzyJ4WS9/RDlnm3Y57l
 YtgFp7231XrdYgUm9/ef8nkzlQJwqtE=
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

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTAtMTUgYXQgMTY6MzQgKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gQWRkIGEgaGVscGVyIHRoYXQgY2hl
Y2tzIGZvciB0aGUgZmFzdCB0cmFpbmluZyBjYXBhYmlsaXR5IGdpdmVuIHRoZSBEUENECj4gcmVj
ZWl2ZXIgY2FwYWJpbGl0aWVzIGJsb2IuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oCj4gaW5kZXggNTJmZjFmMjRhMjRkLi5kZWYzYjNhNTQzYTIgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oCj4gQEAgLTEyMTEsNiArMTIxMSwxMyBAQCBkcm1fZHBfZW5oYW5jZWRfZnJh
bWVfY2FwKGNvbnN0IHU4Cj4gZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCj4gIAkJKGRwY2Rb
RFBfTUFYX0xBTkVfQ09VTlRdICYgRFBfRU5IQU5DRURfRlJBTUVfQ0FQKTsKPiAgfQo+ICAKPiAr
c3RhdGljIGlubGluZSBib29sCj4gK2RybV9kcF9mYXN0X3RyYWluaW5nX2NhcChjb25zdCB1OCBk
cGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKPiArewo+ICsJcmV0dXJuIGRwY2RbRFBfRFBDRF9S
RVZdID49IDB4MTEgJiYKPiArCQkoZHBjZFtEUF9NQVhfRE9XTlNQUkVBRF0gJiBEUF9OT19BVVhf
SEFORFNIQUtFX0xJTktfVFJBSU5JTkcpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIGJvb2wK
PiAgZHJtX2RwX3RwczNfc3VwcG9ydGVkKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJ
WkVdKQo+ICB7Ci0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
