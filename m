Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5025288459
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F271E6EC78;
	Fri,  9 Oct 2020 08:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6A76ECCD
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:00:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x7so644536wrl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 01:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N5MezEhvq/wwBRTty0X109hZVMwHizCfP5Lc200+OeU=;
 b=X+lVFEzkJG7G1y1hQOMHpq9aH/9wMcZRASu3pf5WwWkSy+lBQfhcJFHkD+mB+HB+8B
 6q3Z/oFWS+IjpKniri9mdKD+xWh4Pb1kxxRnhtmA75fRmXM2leSVVQ9O6mzJ2s2pjdNF
 FwYvxU8GuH0ylVTYs9gfzX5C6vRDllxk8cWjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N5MezEhvq/wwBRTty0X109hZVMwHizCfP5Lc200+OeU=;
 b=PIvPW8oZfH+1NkJZOkCYWOBvf2m7yVFplRqgLIUTqQ38y0TKrKztKCCvMWCXZZwVnr
 HhwP3x8BEa9PUpavp0KZBXKt81cSHP5IYSsJTFQJJKUa9yepOyZLBCN4fdzyviHNYNTT
 myqnKaDVbvnVztVYzC8Uby6JgE0kDarIG//nZ5ZPU3JZM/nFUFItTGlXJhvo7CtpUIxR
 MBO4OkHnSq9ruQrY2ccETLHKgXs8EM6rOl+z6ZHacvydt7B4feDDlw2/Llx8y5iYcrLU
 kHOwIfHkvx7vCMYnrbDgngMathkZqU0i9CPf+AXGGs1guMOYwZ7WGXI0P6xF82jhstXq
 8KTQ==
X-Gm-Message-State: AOAM533rJQbhcRaLEZQexZwpmfOleRceWKbv7Uk6o2P2hPwa7BMNTHsN
 mrL6VpHIUOeGLSjKmUDD8lPUjYR+6bJ8p5Tk
X-Google-Smtp-Source: ABdhPJzMUouKiCH6SJK6dyAVSQS46IBJV9EJgv/XkHUvyqgT9BYelO/ICRgl0rBnswqZFheeRzPOMA==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr6771139wre.317.1602230406671; 
 Fri, 09 Oct 2020 01:00:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 01:00:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
Date: Fri,  9 Oct 2020 09:59:27 +0200
Message-Id: <20201009075934.3509076-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, Michel Lespinasse <walken@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1lZGlhIG1vZGVsIGFzc3VtZXMgdGhhdCBidWZmZXJzIGFyZSBhbGwgcHJlYWxsb2NhdGVk
LCBzbyB0aGF0CndoZW4gYSBtZWRpYSBwaXBlbGluZSBpcyBydW5uaW5nIHdlIG5ldmVyIG1pc3Mg
YSBkZWFkbGluZSBiZWNhdXNlIHRoZQpidWZmZXJzIGFyZW4ndCBhbGxvY2F0ZWQgb3IgYXZhaWxh
YmxlLgoKVGhpcyBtZWFucyB3ZSBjYW5ub3QgZml4IHRoZSB2NGwgZm9sbG93X3BmbiB1c2FnZSB0
aHJvdWdoCm1tdV9ub3RpZmllciwgd2l0aG91dCBicmVha2luZyBob3cgdGhpcyBhbGwgd29ya3Mu
IFRoZSBvbmx5IHJlYWwgZml4CmlzIHRvIGRlcHJlY2F0ZSB1c2VycHRyIHN1cHBvcnQgZm9yIFZN
X0lPIHwgVk1fUEZOTUFQIG1hcHBpbmdzIGFuZAp0ZWxsIGV2ZXJ5b25lIHRvIGN1dCBvdmVyIHRv
IGRtYS1idWYgbWVtb3J5IHNoYXJpbmcgZm9yIHplcm9jb3B5LgoKdXNlcnB0ciBmb3Igbm9ybWFs
IG1lbW9yeSB3aWxsIGtlZXAgd29ya2luZyBhcy1pcy4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQ2M6IERhbiBX
aWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBQYXdlbCBPc2NpYWsgPHBhd2VsQG9zY2lhay5j
b20+CkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+CkNjOiBL
eXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1bmcuY29tPgpDYzogVG9tYXN6IEZpZ2Eg
PHRmaWdhQGNocm9taXVtLm9yZz4KQ2M6IExhdXJlbnQgRHVmb3VyIDxsZHVmb3VyQGxpbnV4Lmli
bS5jb20+CkNjOiBWbGFzdGltaWwgQmFia2EgPHZiYWJrYUBzdXNlLmN6PgpDYzogRGFuaWVsIEpv
cmRhbiA8ZGFuaWVsLm0uam9yZGFuQG9yYWNsZS5jb20+CkNjOiBNaWNoZWwgTGVzcGluYXNzZSA8
d2Fsa2VuQGdvb2dsZS5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2Zy
YW1lX3ZlY3Rvci5jIHwgMiArLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1h
LWNvbnRpZy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2Zy
YW1lX3ZlY3Rvci5jIGIvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rv
ci5jCmluZGV4IDJiMGI5Nzc2MWQxNS4uYTFiODVmZTllN2MxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvZnJhbWVfdmVjdG9yLmMKKysrIGIvZHJpdmVycy9tZWRp
YS9jb21tb24vdmlkZW9idWYyL2ZyYW1lX3ZlY3Rvci5jCkBAIC02OSw3ICs2OSw3IEBAIGludCBn
ZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFt
ZXMsCiAJCQlicmVhazsKIAogCQl3aGlsZSAocmV0IDwgbnJfZnJhbWVzICYmIHN0YXJ0ICsgUEFH
RV9TSVpFIDw9IHZtYS0+dm1fZW5kKSB7Ci0JCQllcnIgPSBmb2xsb3dfcGZuKHZtYSwgc3RhcnQs
ICZudW1zW3JldF0pOworCQkJZXJyID0gdW5zYWZlX2ZvbGxvd19wZm4odm1hLCBzdGFydCwgJm51
bXNbcmV0XSk7CiAJCQlpZiAoZXJyKSB7CiAJCQkJaWYgKHJldCA9PSAwKQogCQkJCQlyZXQgPSBl
cnI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29u
dGlnLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKaW5k
ZXggNTIzMTJjZTJiYTA1Li44MjFjNGE3NmFiOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEv
djRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1jb250aWcuYworKysgYi9kcml2ZXJzL21lZGlhL3Y0bDIt
Y29yZS92aWRlb2J1Zi1kbWEtY29udGlnLmMKQEAgLTE4Myw3ICsxODMsNyBAQCBzdGF0aWMgaW50
IHZpZGVvYnVmX2RtYV9jb250aWdfdXNlcl9nZXQoc3RydWN0IHZpZGVvYnVmX2RtYV9jb250aWdf
bWVtb3J5ICptZW0sCiAJdXNlcl9hZGRyZXNzID0gdW50YWdnZWRfYmFkZHI7CiAKIAl3aGlsZSAo
cGFnZXNfZG9uZSA8IChtZW0tPnNpemUgPj4gUEFHRV9TSElGVCkpIHsKLQkJcmV0ID0gZm9sbG93
X3Bmbih2bWEsIHVzZXJfYWRkcmVzcywgJnRoaXNfcGZuKTsKKwkJcmV0ID0gdW5zYWZlX2ZvbGxv
d19wZm4odm1hLCB1c2VyX2FkZHJlc3MsICZ0aGlzX3Bmbik7CiAJCWlmIChyZXQpCiAJCQlicmVh
azsKIAotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
