Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC342A023D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 11:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE8C6ED94;
	Fri, 30 Oct 2020 10:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FE06ED9B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 10:08:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n15so5829168wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x64Pdy8p+ZGL0slSw+rtx7HFhuDJqqnGsdIVDlQDjdQ=;
 b=dMXZgQQ4GInuf9jrQbek8Tp4TJwmqWcWzEoGzN+XnEIIgNSKSXrrzWsVgCIz1j4mbw
 c+B42LT5fsWsIB7y68aybpNVUX+JyN3Td0Ws9EA48SWBfWCaf3zgE6G6thggoKs//hX0
 Upru27GCrw83TFd3ijeyNjhXKU4N04Gf2K5U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x64Pdy8p+ZGL0slSw+rtx7HFhuDJqqnGsdIVDlQDjdQ=;
 b=ihOFHWqm1NT4hqHv8WnGYz4xnL42TYZVtBlg7+c50fnFIZIAvzrO+kbGa71qT/3Pra
 ZhXGcHPzvKg1vMaMtaZQFUgomR2k0WOOeHtDkgB4KVYIJDjcQv/JVgBpyf5KC4FKPdu/
 dpUnlcK4homlr5W66s7xxgdWMR087qXt9URzi0GTUCUuzNFrbTtzztqfNFPYYVY9C7+I
 tQpusDL4PS2dsxB/EL2itGblaokMF66L/qZmywf1jZKENVa51SndwM53mVbdcDlVF9bQ
 5W6xrSxs4gBXoBAavA2xcv447BbYjWFSzQCbspuD8shjrOZbBoyRQqwhkheEngFYajue
 FY6A==
X-Gm-Message-State: AOAM531B4E4Bhbi5s7LPN+5zpUIGc7Zmvq/BEaDM9ZpddhwHCqhrE2S+
 cNZx4REJjIg7GWHHB3whfj+PPt/8Dh5ej5th
X-Google-Smtp-Source: ABdhPJzxGFYoPzMG5L1cos4pmye64LCF8H+vRnUg6QzaFISM5lCoumobRT1BRbCyB6uhYpZ60pR1/g==
X-Received: by 2002:a5d:4b12:: with SMTP id v18mr2021446wrq.259.1604052538157; 
 Fri, 30 Oct 2020 03:08:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 03:08:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 14/15] sysfs: Support zapping of binary attr mmaps
Date: Fri, 30 Oct 2020 11:08:14 +0100
Message-Id: <20201030100815.2269-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 linux-samsung-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-pci@vger.kernel.org,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2FudCB0byBiZSBhYmxlIHRvIHJldm9rZSBwY2kgbW1hcHMgc28gdGhhdCB0aGUgc2FtZSBh
Y2Nlc3MgcnVsZXMKYXBwbGllcyBhcyBmb3IgL2Rldi9rbWVtLiBSZXZva2Ugc3VwcG9ydCBmb3Ig
ZGV2bWVtIHdhcyBhZGRlZCBpbgozMjM0YWM2NjRhODcgKCIvZGV2L21lbTogUmV2b2tlIG1hcHBp
bmdzIHdoZW4gYSBkcml2ZXIgY2xhaW1zIHRoZQpyZWdpb24iKS4KClRoZSBzaW1wbGVzdCB3YXkg
dG8gYWNoaWV2ZSB0aGlzIGlzIGJ5IGhhdmluZyB0aGUgc2FtZSBmaWxwLT5mX21hcHBpbmcKZm9y
IGFsbCBtYXBwaW5ncywgc28gdGhhdCB1bm1hcF9tYXBwaW5nX3JhbmdlIGNhbiBmaW5kIHRoZW0g
YWxsLCBubwptYXR0ZXIgdGhyb3VnaCB3aGljaCBmaWxlIHRoZXkndmUgYmVlbiBjcmVhdGVkLiBT
aW5jZSB0aGlzIG11c3QgYmUgc2V0CmF0IG9wZW4gdGltZSB3ZSBuZWVkIHN5c2ZzIHN1cHBvcnQg
Zm9yIHRoaXMuCgpBZGQgYW4gb3B0aW9uYWwgbWFwcGluZyBwYXJhbWV0ZXIgYmluX2F0dHIsIHdo
aWNoIGlzIG9ubHkgY29uc3VsdGVkCndoZW4gdGhlcmUncyBhbHNvIGFuIG1tYXAgY2FsbGJhY2ss
IHNpbmNlIHdpdGhvdXQgbW1hcCBzdXBwb3J0CmFsbG93aW5nIHRvIGFkanVzdCB0aGUgLT5mX21h
cHBpbmcgbWFrZXMgbm8gc2Vuc2UuCgpSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxn
cmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5j
YT4KQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgpDYzogRGFuIFdpbGxpYW1z
IDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4
LWZvdW5kYXRpb24ub3JnPgpDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpD
YzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBKYW4gS2FyYSA8amFj
a0BzdXNlLmN6PgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNj
OiBsaW51eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpDYzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+
CkNjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogIlJhZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVs
QGtlcm5lbC5vcmc+CkNjOiBDaHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1
bnR1LmNvbT4KQ2M6ICJEYXZpZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0PgpDYzog
TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PgpDYzogU291cmFiaCBKYWluIDxz
b3VyYWJoamFpbkBsaW51eC5pYm0uY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2Vy
bmVsLm9yZz4KQ2M6IE5heW5hIEphaW4gPG5heW5hQGxpbnV4LmlibS5jb20+ClNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZnMvc3lzZnMv
ZmlsZS5jICAgICAgIHwgMTEgKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvc3lzZnMuaCB8ICAy
ICsrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9z
eXNmcy9maWxlLmMgYi9mcy9zeXNmcy9maWxlLmMKaW5kZXggOTZkMGRhNjVlMDg4Li45YWVmYTc3
NzliMjkgMTAwNjQ0Ci0tLSBhL2ZzL3N5c2ZzL2ZpbGUuYworKysgYi9mcy9zeXNmcy9maWxlLmMK
QEAgLTE3MCw2ICsxNzAsMTYgQEAgc3RhdGljIGludCBzeXNmc19rZl9iaW5fbW1hcChzdHJ1Y3Qg
a2VybmZzX29wZW5fZmlsZSAqb2YsCiAJcmV0dXJuIGJhdHRyLT5tbWFwKG9mLT5maWxlLCBrb2Jq
LCBiYXR0ciwgdm1hKTsKIH0KIAorc3RhdGljIGludCBzeXNmc19rZl9iaW5fb3BlbihzdHJ1Y3Qg
a2VybmZzX29wZW5fZmlsZSAqb2YpCit7CisJc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmJhdHRyID0g
b2YtPmtuLT5wcml2OworCisJaWYgKGJhdHRyLT5tYXBwaW5nKQorCQlvZi0+ZmlsZS0+Zl9tYXBw
aW5nID0gYmF0dHItPm1hcHBpbmc7CisKKwlyZXR1cm4gMDsKK30KKwogdm9pZCBzeXNmc19ub3Rp
Znkoc3RydWN0IGtvYmplY3QgKmtvYmosIGNvbnN0IGNoYXIgKmRpciwgY29uc3QgY2hhciAqYXR0
cikKIHsKIAlzdHJ1Y3Qga2VybmZzX25vZGUgKmtuID0ga29iai0+c2QsICp0bXA7CkBAIC0yNDEs
NiArMjUxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZXJuZnNfb3BzIHN5c2ZzX2Jpbl9rZm9w
c19tbWFwID0gewogCS5yZWFkCQk9IHN5c2ZzX2tmX2Jpbl9yZWFkLAogCS53cml0ZQkJPSBzeXNm
c19rZl9iaW5fd3JpdGUsCiAJLm1tYXAJCT0gc3lzZnNfa2ZfYmluX21tYXAsCisJLm9wZW4JCT0g
c3lzZnNfa2ZfYmluX29wZW4sCiB9OwogCiBpbnQgc3lzZnNfYWRkX2ZpbGVfbW9kZV9ucyhzdHJ1
Y3Qga2VybmZzX25vZGUgKnBhcmVudCwKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc3lzZnMu
aCBiL2luY2x1ZGUvbGludXgvc3lzZnMuaAppbmRleCAyY2FhMzRjMWNhMWEuLmQ3NmExZGRmODNh
MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9zeXNmcy5oCisrKyBiL2luY2x1ZGUvbGludXgv
c3lzZnMuaApAQCAtMTY0LDExICsxNjQsMTMgQEAgX19BVFRSSUJVVEVfR1JPVVBTKF9uYW1lKQog
CiBzdHJ1Y3QgZmlsZTsKIHN0cnVjdCB2bV9hcmVhX3N0cnVjdDsKK3N0cnVjdCBhZGRyZXNzX3Nw
YWNlOwogCiBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSB7CiAJc3RydWN0IGF0dHJpYnV0ZQlhdHRyOwog
CXNpemVfdAkJCXNpemU7CiAJdm9pZAkJCSpwcml2YXRlOworCXN0cnVjdCBhZGRyZXNzX3NwYWNl
CSptYXBwaW5nOwogCXNzaXplX3QgKCpyZWFkKShzdHJ1Y3QgZmlsZSAqLCBzdHJ1Y3Qga29iamVj
dCAqLCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqLAogCQkJY2hhciAqLCBsb2ZmX3QsIHNpemVfdCk7
CiAJc3NpemVfdCAoKndyaXRlKShzdHJ1Y3QgZmlsZSAqLCBzdHJ1Y3Qga29iamVjdCAqLCBzdHJ1
Y3QgYmluX2F0dHJpYnV0ZSAqLAotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
