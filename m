Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5987B2B9500
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 15:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E30D6E58E;
	Thu, 19 Nov 2020 14:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E998B6E56A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:42:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m6so6670737wrg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 06:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOg+qp39SVj5WC86VkdFnTzL9jP06PEcpQhmqKQ3t14=;
 b=VdR4TRQWQACxogAeI8bpxISw4lYuZMDpigTJtM/VpnCefzKALSPbEG99bZ5Wbe+gKp
 gTbBqPkoFOSHKBnAtnkpkRQRBwBUcqVexaUuZzvjGnAeBUC4W8Sgv2HdBZTVCRr0iXOw
 AVEvBuq1VDgLMzYgPJsacfSZW0w7f2MUd4t1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOg+qp39SVj5WC86VkdFnTzL9jP06PEcpQhmqKQ3t14=;
 b=tDdD+71xHIx1/v7ZcZlo1ve400y3am4aVnaFJnAxJtN2ernyVeVZ13eWHwrJ1sQFg6
 7CBqOUAhfrPf7c6+k14oy6RGx0B+1b1BYIpeEa6CBgftrhNOA9vAA1qaxVGI2ThRRdAY
 efpMGnuPe7+ucexlqxZ0YSfrEz5BNsyfpcxG8upmqTsH+7taLIqiULEi20TsTZq729Zk
 9xZoU8hxkyTVgfdMR6V9V8G0HVLzswi/qs5W8ecPz8nZPuJwPXTPssQu2JEorjN7+jr7
 ykMoSAFqGIuwF8YKpS0zELtKcQnckBuSU7OY/3Pw6+76c6YCM7Yy0WGXhThOzcwsY4YI
 ukxA==
X-Gm-Message-State: AOAM532Y8zpi5lognTQlxyyPjz5++2BcU4qWmOEMOrff3ZNtfWJPazzK
 7L4z22VNz/6l1tQ3SVMoU4y6wbr5XDvAeA==
X-Google-Smtp-Source: ABdhPJxkxIZb1Dvgqd+l4qpBOUdvHL2JTzWDAAwF5TWOoMRtyTV7FCLmBVro+JG8yHOq0sr6nntY2g==
X-Received: by 2002:a05:6000:372:: with SMTP id
 f18mr11447766wrf.149.1605796928322; 
 Thu, 19 Nov 2020 06:42:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 06:42:07 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 11/17] PCI: Obey iomem restrictions for procfs mmap
Date: Thu, 19 Nov 2020 15:41:40 +0100
Message-Id: <20201119144146.1045202-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyB0aHJlZSB3YXlzIHRvIGFjY2VzcyBQQ0kgQkFScyBmcm9tIHVzZXJzcGFjZTogL2Rl
di9tZW0sIHN5c2ZzCmZpbGVzLCBhbmQgdGhlIG9sZCBwcm9jIGludGVyZmFjZS4gVHdvIGNoZWNr
IGFnYWluc3QKaW9tZW1faXNfZXhjbHVzaXZlLCBwcm9jIG5ldmVyIGRpZC4gQW5kIHdpdGggQ09O
RklHX0lPX1NUUklDVF9ERVZNRU0sCnRoaXMgc3RhcnRzIHRvIG1hdHRlciwgc2luY2Ugd2UgZG9u
J3Qgd2FudCByYW5kb20gdXNlcnNwYWNlIGhhdmluZwphY2Nlc3MgdG8gUENJIEJBUnMgd2hpbGUg
YSBkcml2ZXIgaXMgbG9hZGVkIGFuZCB1c2luZyBpdC4KCkZpeCB0aGlzIGJ5IGFkZGluZyB0aGUg
c2FtZSBpb21lbV9pc19leGNsdXNpdmUoKSBjaGVjayB3ZSBhbHJlYWR5IGhhdmUKb24gdGhlIHN5
c2ZzIHNpZGUgaW4gcGNpX21tYXBfcmVzb3VyY2UoKS4KCkFja2VkLWJ5OiBCam9ybiBIZWxnYWFz
IDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpSZWZlcmVuY2VzOiA5MGE1NDVlOTgxMjYgKCJyZXN0cmlj
dCAvZGV2L21lbSB0byBpZGxlIGlvIG1lbW9yeSByYW5nZXMiKQpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8
amdnQHppZXBlLmNhPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEph
biBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGlu
dGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNA
Z29vZ2xlLmNvbT4KQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0KdjI6IEltcHJvdmUgY29t
bWl0IG1lc3NhZ2UgKEJqb3JuKQotLS0KIGRyaXZlcnMvcGNpL3Byb2MuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9w
cm9jLmMgYi9kcml2ZXJzL3BjaS9wcm9jLmMKaW5kZXggZDM1MTg2YjAxZDk4Li4zYTJmOTBiZWI0
Y2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL3Byb2MuYworKysgYi9kcml2ZXJzL3BjaS9wcm9j
LmMKQEAgLTI3NCw2ICsyNzQsMTEgQEAgc3RhdGljIGludCBwcm9jX2J1c19wY2lfbW1hcChzdHJ1
Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJCWVsc2UKIAkJCXJl
dHVybiAtRUlOVkFMOwogCX0KKworCWlmIChkZXYtPnJlc291cmNlW2ldLmZsYWdzICYgSU9SRVNP
VVJDRV9NRU0gJiYKKwkgICAgaW9tZW1faXNfZXhjbHVzaXZlKGRldi0+cmVzb3VyY2VbaV0uc3Rh
cnQpKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXJldCA9IHBjaV9tbWFwX3BhZ2VfcmFuZ2UoZGV2
LCBpLCB2bWEsCiAJCQkJICBmcHJpdi0+bW1hcF9zdGF0ZSwgd3JpdGVfY29tYmluZSk7CiAJaWYg
KHJldCA8IDApCi0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
