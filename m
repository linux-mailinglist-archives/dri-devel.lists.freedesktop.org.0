Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928E2949B3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E049D6F47C;
	Wed, 21 Oct 2020 08:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA556F478
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i1so2183935wro.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7XJE+hSH/S5sf+J2AcmYCFMIcTxnQzpOZqEdbmMuzFE=;
 b=GUK8bAu/rOwhstjfCCL4jyz79EWKlxKCEPzbQk67yqQgL5JdMMK9qYFAwYpDisTw7I
 i418204vlPkRGtUhsDK0/5TGt4bPzoR91GVgS9OWMA2nj4HmDeVE9XWPk7FPp7l7XoFa
 ZYmkpZjMTP6Ea3nY9tfKU2e09YncWgauHxbSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XJE+hSH/S5sf+J2AcmYCFMIcTxnQzpOZqEdbmMuzFE=;
 b=K3I98KmW3FTscndDIM/7ViYYtksIxRL2h/9x7185UrihEgDn7IRg7dV6dSd69eT2aJ
 /Qie7Buobu69IfUqG/UlU9Eu+cQ99JmL8CVrD32WxKwnEgOaKt2UHScvZPct9px4H8Ml
 J77j+7L+Zbl3KsvWvB9HsgvORFieb2k3owlePd5NKhJxQPZ1oVOXHgU+uohSyVCOXQWK
 0mMrAsn+6T5GfsIxnG+iBjlT7g7jqVfaAF0XYiQxSsquOtVzeYkDIT248cBmJDM+5eKy
 8JtPUPrDZ1RUlty84UHKrCa24Ix6gVB4p0UoEIqCnrZSMZ6qXC+dHkmCzGe0F6G7QSGe
 5IWQ==
X-Gm-Message-State: AOAM5314DtGccnwKAW2SxaWm6+6Ie7fg0g3VFrdm0UBrKNzy2C5FdSin
 5STRfaXCdX6Qn63Q4dwzHFfpVZcclwmeVf7u
X-Google-Smtp-Source: ABdhPJx37Cjmlb4fgq/grqKCCp37y8t5Mz28eOZMNIB2vWtdgu/4b448hmjy5S8hmkcygKAt/hypYw==
X-Received: by 2002:a5d:5009:: with SMTP id e9mr3539688wrt.104.1603270640046; 
 Wed, 21 Oct 2020 01:57:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
Date: Wed, 21 Oct 2020 10:56:51 +0200
Message-Id: <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-pci@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.com>, linux-mm@kvack.org,
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
c2ZzIHNpZGUgaW4gcGNpX21tYXBfcmVzb3VyY2UoKS4KClJlZmVyZW5jZXM6IDkwYTU0NWU5ODEy
NiAoInJlc3RyaWN0IC9kZXYvbWVtIHRvIGlkbGUgaW8gbWVtb3J5IHJhbmdlcyIpClNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmFzb24g
R3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmou
d2lsbGlhbXNAaW50ZWwuY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBCam9ybiBIZWxnYWFz
IDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNvbT4KLS0KdjI6
IEltcHJvdmUgY29tbWl0IG1lc3NhZ2UgKEJqb3JuKQotLS0KIGRyaXZlcnMvcGNpL3Byb2MuYyB8
IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BjaS9wcm9jLmMgYi9kcml2ZXJzL3BjaS9wcm9jLmMKaW5kZXggZDM1MTg2YjAxZDk4
Li4zYTJmOTBiZWI0Y2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL3Byb2MuYworKysgYi9kcml2
ZXJzL3BjaS9wcm9jLmMKQEAgLTI3NCw2ICsyNzQsMTEgQEAgc3RhdGljIGludCBwcm9jX2J1c19w
Y2lfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJ
CWVsc2UKIAkJCXJldHVybiAtRUlOVkFMOwogCX0KKworCWlmIChkZXYtPnJlc291cmNlW2ldLmZs
YWdzICYgSU9SRVNPVVJDRV9NRU0gJiYKKwkgICAgaW9tZW1faXNfZXhjbHVzaXZlKGRldi0+cmVz
b3VyY2VbaV0uc3RhcnQpKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXJldCA9IHBjaV9tbWFwX3Bh
Z2VfcmFuZ2UoZGV2LCBpLCB2bWEsCiAJCQkJICBmcHJpdi0+bW1hcF9zdGF0ZSwgd3JpdGVfY29t
YmluZSk7CiAJaWYgKHJldCA8IDApCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
