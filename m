Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52331043CE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 19:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C216E113;
	Wed, 20 Nov 2019 18:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149AF6E113
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 18:59:24 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-8e3gK4pFNAKP3ppVWyHYoA-1; Wed, 20 Nov 2019 13:59:22 -0500
Received: by mail-qt1-f197.google.com with SMTP id h39so498977qth.13
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 10:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jjpGzChSbAE/VjBP60NsRZKdsVloFbVJytDXjEcLDt4=;
 b=bcCoVyTIF+CBSjI+/YIfqahfAaAa7D7iAg5krzqgjUeIvEO79eg5CNfg9ueyQEQKtd
 Sn3lqy43yyTqxSpepVKtszPtG6AsQ7vhwunuYl2d0VMhPVtGowh+YxM67fWSTShEVg9H
 1Rg49w6t8dh+IfsP9vdlB0Gl2LD3JwOX/+Va22sTDNCteBB4qlnkiPr8c+Licut7umAQ
 6ed11clQ8C/1MWsKWGfGBBuOlf2emKIHggdYOJo0MQtT3gdCndJu52jk1p08tJC3mxXn
 AeKoQ9bhxT7/mO4zQJsWdelhne/UCGajUXJHTlm0z3BKC+KT5nhh2XClkTfx+9wa/YMX
 eXSQ==
X-Gm-Message-State: APjAAAVTHaQdUu+hd10xnO9TQaH23T9USHXqM19khVZZ2AWLh2OVCLUC
 dmqLfShKiNcdAw2Fjeuvx+CPS8CDi5GeeUlf3NoIIvJKsuQOr+JMwtpMWLKA1mWwhYwlY550VNe
 tVhJc2l98DlJeMWTwc8mW3BIW8ajq
X-Received: by 2002:ac8:7282:: with SMTP id v2mr4163999qto.75.1574276361736;
 Wed, 20 Nov 2019 10:59:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuGeUbqVAJvgnf+jTL+SyQquhjCPMRcnZFI4gqIIOO+GhNZaN7NJrRHGgM5rw14Qhz3gcGlg==
X-Received: by 2002:ac8:7282:: with SMTP id v2mr4163971qto.75.1574276361495;
 Wed, 20 Nov 2019 10:59:21 -0800 (PST)
Received: from dhcp-10-20-1-46.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x1sm41244qke.125.2019.11.20.10.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:59:20 -0800 (PST)
Message-ID: <f6c44c85a63c89e548cafa55d89caccd7e868268.camel@redhat.com>
Subject: Re: [PATCH][next] drm/dp_mst: fix multiple frees of tx->bytes
From: Lyude Paul <lyude@redhat.com>
To: Colin King <colin.king@canonical.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel.vetter@ffwll.ch>,  dri-devel@lists.freedesktop.org
Date: Wed, 20 Nov 2019 13:59:19 -0500
In-Reply-To: <20191120173509.347490-1-colin.king@canonical.com>
References: <20191120173509.347490-1-colin.king@canonical.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: 8e3gK4pFNAKP3ppVWyHYoA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574276363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C35wC9q1jgeXmU7JqR3NZOFZzSw/nsQvCT6e5UF4sJQ=;
 b=jPDatIoyM4fLCbiALwAJBgde1mhP1gatYxrzfLKRzyGVL+fCV9+TjGmnK7LCb+vp+fFPZB
 uAHdCRkygTeUJIJevapZ56RwLk7i1Cd0c99jkDWv8H4l6OiOZNTRqBYImYO0TWIaSNMM7f
 9J35GGMbWrx7XajeSdtdIaBEccgR5FE=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVoLCBzdXJwcmlzZWQgSSBtaXNzZWQgdGhpcyBvbmUhCgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCkRvIHlvdSBuZWVkIG1lIHRvIHB1c2ggdGhpcyB0byBkcm0t
bWlzYywgb3IgZG8geW91IGhhdmUgY29tbWl0IHJpZ2h0cyBhbHJlYWR5PwoKT24gV2VkLCAyMDE5
LTExLTIwIGF0IDE3OjM1ICswMDAwLCBDb2xpbiBLaW5nIHdyb3RlOgo+IEZyb206IENvbGluIElh
biBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gQ3VycmVudGx5IHR4LT5ieXRl
cyBpcyBiZWluZyBmcmVlZCByLT5udW1fdHJhbnNhY3Rpb25zIG51bWJlciBvZgo+IHRpbWVzIGJl
Y2F1c2UgdHggaXMgbm90IGJlaW5nIHNldCBjb3JyZWN0bHkuIEZpeCB0aGlzIGJ5IHNldHRpbmcK
PiB0eCB0byAmci0+dHJhbnNhY3Rpb25zW2ldIHNvIHRoYXQgdGhlIGNvcnJlY3Qgb2JqZWN0cyBh
cmUgYmVpbmcKPiBmcmVlZCBvbiBlYWNoIGxvb3AgaXRlcmF0aW9uLgo+IAo+IEFkZHJlc3Nlcy1D
b3Zlcml0eTogKCJEb3VibGUgZnJlZSIpCj4gRml4ZXM6IDJmMDE1ZWM2ZWFiNiAoImRybS9kcF9t
c3Q6IEFkZCBzaWRlYmFuZCBkb3duIHJlcXVlc3QgdHJhY2luZyArCj4gc2VsZnRlc3RzIikKPiBT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNCArKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IGluZGV4IGFlNTgwOWExZjE5YS4uMjc1
NGU3ZTA3NWU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gQEAg
LTUxNyw4ICs1MTcsMTAgQEAgZHJtX2RwX2RlY29kZV9zaWRlYmFuZF9yZXEoY29uc3Qgc3RydWN0
Cj4gZHJtX2RwX3NpZGViYW5kX21zZ190eCAqcmF3LAo+ICAJCQl9Cj4gIAo+ICAJCQlpZiAoZmFp
bGVkKSB7Cj4gLQkJCQlmb3IgKGkgPSAwOyBpIDwgci0+bnVtX3RyYW5zYWN0aW9uczsgaSsrKQo+
ICsJCQkJZm9yIChpID0gMDsgaSA8IHItPm51bV90cmFuc2FjdGlvbnM7IGkrKykgewo+ICsJCQkJ
CXR4ID0gJnItPnRyYW5zYWN0aW9uc1tpXTsKPiAgCQkJCQlrZnJlZSh0eC0+Ynl0ZXMpOwo+ICsJ
CQkJfQo+ICAJCQkJcmV0dXJuIC1FTk9NRU07Cj4gIAkJCX0KPiAgCi0tIApDaGVlcnMsCglMeXVk
ZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
