Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8F2B94FE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 15:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A506E588;
	Thu, 19 Nov 2020 14:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4826E542
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:42:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a65so6981972wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 06:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rW60Jo5EYOrfW48enxn4HuDZHwz18Yu4cEXjV+kmxhI=;
 b=Mds0KKYR7OlWEldi1eh1ggSjTWLm8H299PjAEVopmaDX9SejYgx/bgXXgGqVeWoeAG
 umyXrkGdnXYA46wdpqDzfj7FH45aOUy77I+Qc8IUJ/53mNQ7N+2xlTMP9z4uAN8h2bBC
 AIcr+GU5pTJJ86QC2SIt8u/+0HuuTGtQwupxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rW60Jo5EYOrfW48enxn4HuDZHwz18Yu4cEXjV+kmxhI=;
 b=mjBt8i/Jizv7zehnYR+EFj83dunYQEh/bKWP6zQ2SRwiyIN/4P4IluyCLXW+osUmiS
 Mx8QAtYEMRftbN3khh93EdaxQyCyLCSnTnA99e+/16/uNhHyLMwycRkw6zThHuAq/bId
 jc62SA17bXttUlra6sXZeUD9RIhXZWZzaJlp0LDE1z5raHNFSGaVTTuvdr/xL3jxPtHJ
 hx6jkKpy0mUW40lBnzEBSXam1zuLFgVtlDhbF5+LbuzxL7CBFx/h0oi2/DqUAXjVEM0y
 UQfnsjh4EWozxmVgZQ2AKf/7SpnGOnM6lJxnF0T180E6ew0rhYy29rVMQITMl/QsItp5
 KTKg==
X-Gm-Message-State: AOAM533YQdvyRQg50ZAT6m9AXSJyigoRIxCw06H6R4vsDbON5/PsUyeW
 XI8WKRz8sCLekS6RCN4UtdvnVAohK7+5zA==
X-Google-Smtp-Source: ABdhPJzDoO8vwM1uKLMMzDY63Xtv6UYaVCRPNtJiMLhNtXOdUD9Ea0qBkhZUQjS3C8qhP4NCGswHYA==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr5067390wme.77.1605796932701; 
 Thu, 19 Nov 2020 06:42:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 06:42:11 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 14/17] sysfs: Support zapping of binary attr mmaps
Date: Thu, 19 Nov 2020 15:41:43 +0100
Message-Id: <20201119144146.1045202-15-daniel.vetter@ffwll.ch>
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
Y3QgYmluX2F0dHJpYnV0ZSAqLAotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
