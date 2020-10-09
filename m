Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6C28845C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317C26EC7B;
	Fri,  9 Oct 2020 08:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806D06EC8B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 08:00:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so9250525wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPr3++TkgD7opBHxWri6P050gTocJAeikYQ/tt45kKI=;
 b=DVC+VHNwYKVtqSii5lIVeaydDB6BLYuTeAJ5rwW+S55nTxLLBIyrPBVsS/L9PHMkF1
 q3uw+XyygTSKEzljnhrtd+uqW+UWrHLzIjTm4/9nOxCepU5EL5HwS+mIoRk0TD6zsvng
 eZRy5dYaQjR4QunmQxA3SCZhsE7Sk5d3j+0PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPr3++TkgD7opBHxWri6P050gTocJAeikYQ/tt45kKI=;
 b=k2MCylYWpH/fL0pZgpQA5COvb9GMjJo9mX9ItTt1r0oYnDZp7sHLNfttiWWCHHePjt
 NFuTWrbcLPYXCqwGwcsKK8yp05R1lCuVLj7clRR1iplNzkdVtvhOZVBvaxaVMvVmVxMm
 ZINRLrQRKAunC3PkZkk7EsNVTqTma/5zZaHxHc+j7Sn1C8LAyMLZFqQ85lW9H9D1zm7r
 6Li+ecH/cARiHdTZJOA3cyH/uwNWTp4rGqV5w5TxJeqiCuGUtIANHXxa2sGsjU/I2r8e
 Z5rjODxPzcUy9zhrYs+aPr8sXY9OjPy85yIxVA8lOevh3jMlQbmNece/c3F3THDwLuE7
 9fFQ==
X-Gm-Message-State: AOAM532Kh44Rlw5T+lhKxvjhVafZ20Qk2e2LA00z0OBVd2c/1YexlH8v
 ZnVcqTFvVg35iPYJMyfZB5wcFRF01Hh3k8CU
X-Google-Smtp-Source: ABdhPJxjabNt7y3Fk149R7K1e+u9DjBsacewwbIgtRCFyrwVNWJDFlQJblhvJ+EjdKe0cN5lfI2azA==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr6435975wro.56.1602230413759; 
 Fri, 09 Oct 2020 01:00:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.01.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 01:00:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 15/17] sysfs: Support zapping of binary attr mmaps
Date: Fri,  9 Oct 2020 09:59:32 +0200
Message-Id: <20201009075934.3509076-16-daniel.vetter@ffwll.ch>
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-s390@vger.kernel.org,
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
cHBpbmcgbWFrZXMgbm8gc2Vuc2UuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpD
YzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBEYW4gV2lsbGlhbXMgPGRh
bi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+CkNjOiBK
w6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1
c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IGxp
bnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
CkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwpDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ2M6
IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiAiUmFmYWVsIEouIFd5c29ja2kiIDxyYWZhZWxAa2Vy
bmVsLm9yZz4KQ2M6IENocmlzdGlhbiBCcmF1bmVyIDxjaHJpc3RpYW4uYnJhdW5lckB1YnVudHUu
Y29tPgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+CkNjOiBNaWNo
YWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+CkNjOiBTb3VyYWJoIEphaW4gPHNvdXJh
YmhqYWluQGxpbnV4LmlibS5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwu
b3JnPgpDYzogTmF5bmEgSmFpbiA8bmF5bmFAbGludXguaWJtLmNvbT4KLS0tCiBmcy9zeXNmcy9m
aWxlLmMgICAgICAgfCAxMSArKysrKysrKysrKwogaW5jbHVkZS9saW51eC9zeXNmcy5oIHwgIDIg
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL3N5
c2ZzL2ZpbGUuYyBiL2ZzL3N5c2ZzL2ZpbGUuYwppbmRleCBlYjY4OTdhYjc4ZTcuLjlkOGNjZGIw
MDBlMyAxMDA2NDQKLS0tIGEvZnMvc3lzZnMvZmlsZS5jCisrKyBiL2ZzL3N5c2ZzL2ZpbGUuYwpA
QCAtMTY5LDYgKzE2OSwxNiBAQCBzdGF0aWMgaW50IHN5c2ZzX2tmX2Jpbl9tbWFwKHN0cnVjdCBr
ZXJuZnNfb3Blbl9maWxlICpvZiwKIAlyZXR1cm4gYmF0dHItPm1tYXAob2YtPmZpbGUsIGtvYmos
IGJhdHRyLCB2bWEpOwogfQogCitzdGF0aWMgaW50IHN5c2ZzX2tmX2Jpbl9vcGVuKHN0cnVjdCBr
ZXJuZnNfb3Blbl9maWxlICpvZikKK3sKKwlzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqYmF0dHIgPSBv
Zi0+a24tPnByaXY7CisKKwlpZiAoYmF0dHItPm1hcHBpbmcpCisJCW9mLT5maWxlLT5mX21hcHBp
bmcgPSBiYXR0ci0+bWFwcGluZzsKKworCXJldHVybiAwOworfQorCiB2b2lkIHN5c2ZzX25vdGlm
eShzdHJ1Y3Qga29iamVjdCAqa29iaiwgY29uc3QgY2hhciAqZGlyLCBjb25zdCBjaGFyICphdHRy
KQogewogCXN0cnVjdCBrZXJuZnNfbm9kZSAqa24gPSBrb2JqLT5zZCwgKnRtcDsKQEAgLTI0MCw2
ICsyNTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtlcm5mc19vcHMgc3lzZnNfYmluX2tmb3Bz
X21tYXAgPSB7CiAJLnJlYWQJCT0gc3lzZnNfa2ZfYmluX3JlYWQsCiAJLndyaXRlCQk9IHN5c2Zz
X2tmX2Jpbl93cml0ZSwKIAkubW1hcAkJPSBzeXNmc19rZl9iaW5fbW1hcCwKKwkub3BlbgkJPSBz
eXNmc19rZl9iaW5fb3BlbiwKIH07CiAKIGludCBzeXNmc19hZGRfZmlsZV9tb2RlX25zKHN0cnVj
dCBrZXJuZnNfbm9kZSAqcGFyZW50LApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zeXNmcy5o
IGIvaW5jbHVkZS9saW51eC9zeXNmcy5oCmluZGV4IDM0ZTg0MTIyZjYzNS4uYTE3YTQ3NGQxNjAx
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3N5c2ZzLmgKKysrIGIvaW5jbHVkZS9saW51eC9z
eXNmcy5oCkBAIC0xNjQsMTEgKzE2NCwxMyBAQCBfX0FUVFJJQlVURV9HUk9VUFMoX25hbWUpCiAK
IHN0cnVjdCBmaWxlOwogc3RydWN0IHZtX2FyZWFfc3RydWN0Oworc3RydWN0IGFkZHJlc3Nfc3Bh
Y2U7CiAKIHN0cnVjdCBiaW5fYXR0cmlidXRlIHsKIAlzdHJ1Y3QgYXR0cmlidXRlCWF0dHI7CiAJ
c2l6ZV90CQkJc2l6ZTsKIAl2b2lkCQkJKnByaXZhdGU7CisJc3RydWN0IGFkZHJlc3Nfc3BhY2UJ
Km1hcHBpbmc7CiAJc3NpemVfdCAoKnJlYWQpKHN0cnVjdCBmaWxlICosIHN0cnVjdCBrb2JqZWN0
ICosIHN0cnVjdCBiaW5fYXR0cmlidXRlICosCiAJCQljaGFyICosIGxvZmZfdCwgc2l6ZV90KTsK
IAlzc2l6ZV90ICgqd3JpdGUpKHN0cnVjdCBmaWxlICosIHN0cnVjdCBrb2JqZWN0ICosIHN0cnVj
dCBiaW5fYXR0cmlidXRlICosCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
