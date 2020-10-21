Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8F2949B1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01E36F478;
	Wed, 21 Oct 2020 08:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4A26F47D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d3so899467wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oQvkweh0coyyHFs1+P/kZMwtZJPPWi3HClx7V6v1fv0=;
 b=EE/91tuK+LnQ6Bg/BJZHq1+5OAQo6TOscz5wTlYQlFCOdrCXYSUlrYitteOGw9m+LY
 STU6xM7NhAXVZvMrs/CddxhZ9Ce+pijIkJL18SFd1amKxNAH30F/FyM/bG8C+7+O+j11
 /6ubZyozbslsGF1Lvd8CED3xyzh3w0GshGNLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQvkweh0coyyHFs1+P/kZMwtZJPPWi3HClx7V6v1fv0=;
 b=HS1/Hfhwt3EhxedNB4Bz51M9ejeAzBwumYRsqcBPbsHoxHFvbcTjAbVghzjbzz2I3y
 VnbqBhNzXk9oluBoDdgjSZwg9+VFIB7UDNmhUsWZpgWVj9/WG6wbQ/rTa/6JDd6j85zP
 BhBnpST14cq/HEP+v2IBBLFXePg4IFLByw8KQZVd2HlMu8YFDOTwVw6xT1W+DoH3I5zm
 6qX+1hprVlt3QEnAEhInwpIQZRc4QvD1Ef/3o/baphBYCN2w+OJaNggxVvvckzx9vijG
 VfW4Ja/vs952eBjUOaMihQOJMPoKSNOCKLwnnXFA8nr+H4ZRn76cDDulnNZk0PTrpRI2
 6CdQ==
X-Gm-Message-State: AOAM531tQIJlHQvCjiXs6eyZa9eJNuhU6bICt432Sge53fBxYEv/Cap4
 /U3VHAN/1mslAZCNa3+cj22/CwjaYv1l/eQU
X-Google-Smtp-Source: ABdhPJxh5W+195BRlQ75jcVqoxSqHuITL1MkZ8kYhnwY/3GuozWB13g2bfVDwEcl3AUtRbmZy3j2Zw==
X-Received: by 2002:a1c:e089:: with SMTP id x131mr2512477wmg.78.1603270644597; 
 Wed, 21 Oct 2020 01:57:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 15/16] sysfs: Support zapping of binary attr mmaps
Date: Wed, 21 Oct 2020 10:56:54 +0200
Message-Id: <20201021085655.1192025-16-daniel.vetter@ffwll.ch>
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.com>,
 linux-pci@vger.kernel.org, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, John Hubbard <jhubbard@nvidia.com>,
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
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY29tPgotLS0KIGZzL3N5c2Zz
L2ZpbGUuYyAgICAgICB8IDExICsrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L3N5c2ZzLmggfCAg
MiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMv
c3lzZnMvZmlsZS5jIGIvZnMvc3lzZnMvZmlsZS5jCmluZGV4IGViNjg5N2FiNzhlNy4uOWQ4Y2Nk
YjAwMGUzIDEwMDY0NAotLS0gYS9mcy9zeXNmcy9maWxlLmMKKysrIGIvZnMvc3lzZnMvZmlsZS5j
CkBAIC0xNjksNiArMTY5LDE2IEBAIHN0YXRpYyBpbnQgc3lzZnNfa2ZfYmluX21tYXAoc3RydWN0
IGtlcm5mc19vcGVuX2ZpbGUgKm9mLAogCXJldHVybiBiYXR0ci0+bW1hcChvZi0+ZmlsZSwga29i
aiwgYmF0dHIsIHZtYSk7CiB9CiAKK3N0YXRpYyBpbnQgc3lzZnNfa2ZfYmluX29wZW4oc3RydWN0
IGtlcm5mc19vcGVuX2ZpbGUgKm9mKQoreworCXN0cnVjdCBiaW5fYXR0cmlidXRlICpiYXR0ciA9
IG9mLT5rbi0+cHJpdjsKKworCWlmIChiYXR0ci0+bWFwcGluZykKKwkJb2YtPmZpbGUtPmZfbWFw
cGluZyA9IGJhdHRyLT5tYXBwaW5nOworCisJcmV0dXJuIDA7Cit9CisKIHZvaWQgc3lzZnNfbm90
aWZ5KHN0cnVjdCBrb2JqZWN0ICprb2JqLCBjb25zdCBjaGFyICpkaXIsIGNvbnN0IGNoYXIgKmF0
dHIpCiB7CiAJc3RydWN0IGtlcm5mc19ub2RlICprbiA9IGtvYmotPnNkLCAqdG1wOwpAQCAtMjQw
LDYgKzI1MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2VybmZzX29wcyBzeXNmc19iaW5fa2Zv
cHNfbW1hcCA9IHsKIAkucmVhZAkJPSBzeXNmc19rZl9iaW5fcmVhZCwKIAkud3JpdGUJCT0gc3lz
ZnNfa2ZfYmluX3dyaXRlLAogCS5tbWFwCQk9IHN5c2ZzX2tmX2Jpbl9tbWFwLAorCS5vcGVuCQk9
IHN5c2ZzX2tmX2Jpbl9vcGVuLAogfTsKIAogaW50IHN5c2ZzX2FkZF9maWxlX21vZGVfbnMoc3Ry
dWN0IGtlcm5mc19ub2RlICpwYXJlbnQsCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3N5c2Zz
LmggYi9pbmNsdWRlL2xpbnV4L3N5c2ZzLmgKaW5kZXggMzRlODQxMjJmNjM1Li5hMTdhNDc0ZDE2
MDEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvc3lzZnMuaAorKysgYi9pbmNsdWRlL2xpbnV4
L3N5c2ZzLmgKQEAgLTE2NCwxMSArMTY0LDEzIEBAIF9fQVRUUklCVVRFX0dST1VQUyhfbmFtZSkK
IAogc3RydWN0IGZpbGU7CiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q7CitzdHJ1Y3QgYWRkcmVzc19z
cGFjZTsKIAogc3RydWN0IGJpbl9hdHRyaWJ1dGUgewogCXN0cnVjdCBhdHRyaWJ1dGUJYXR0cjsK
IAlzaXplX3QJCQlzaXplOwogCXZvaWQJCQkqcHJpdmF0ZTsKKwlzdHJ1Y3QgYWRkcmVzc19zcGFj
ZQkqbWFwcGluZzsKIAlzc2l6ZV90ICgqcmVhZCkoc3RydWN0IGZpbGUgKiwgc3RydWN0IGtvYmpl
Y3QgKiwgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKiwKIAkJCWNoYXIgKiwgbG9mZl90LCBzaXplX3Qp
OwogCXNzaXplX3QgKCp3cml0ZSkoc3RydWN0IGZpbGUgKiwgc3RydWN0IGtvYmplY3QgKiwgc3Ry
dWN0IGJpbl9hdHRyaWJ1dGUgKiwKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
