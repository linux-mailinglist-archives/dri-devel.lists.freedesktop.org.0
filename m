Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F928349C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 17:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0E56E3B2;
	Tue,  6 Aug 2019 15:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21BB6E3AC;
 Tue,  6 Aug 2019 15:01:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c2so85014853wrm.8;
 Tue, 06 Aug 2019 08:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLPPYENgOoc631NZg5ylujQ9Ww/Oy03mgWH9mA4Vfho=;
 b=nUbeTTo31Q3JF4VIRfixPvjym5cT1gYTgM7CY9FLUcA2VIsjytrgEhoqISBEGAPhtI
 YMD1ZUKduo+YHtC/sx73Dl5PdVQhpOGu+jxsSvzebfW85b+K2E7EvPz6KbTFGLLuyUZ4
 Yn2s6CSc0DLraToSkY7z/TQaLbnZjmW7/JIOboq8+EOAbWJ4S6ACMn5Ao3tFqcpIEOgH
 ZNIMZ97xCGWTEnjX3+2KucVO+5kIqc4eLy31xgh1qXAP8A8fb9zLGGk2v7EkVAdeU5RY
 0dRkpTeNs2+qS56Ra4wYuer46DebPZ5rmTdSh2hNQAdJVKidBH1BnaUjWw8uYc6Ci6eg
 bsTg==
X-Gm-Message-State: APjAAAW/lk29bUT4gMumt3I4ECu6ij/mVCW6bKgH/iGYLBF2VAb5EbD8
 /bwgbzg3Hz65cf2S5oTGnubRZi1Y
X-Google-Smtp-Source: APXvYqz6AcKhVWvcz+ipDVWpv+mwv6WdHOfeRXlIqGfRphZR2R8yUytCJlZ5FKlnzx8bJIHeQOnH1Q==
X-Received: by 2002:a5d:6583:: with SMTP id q3mr5698550wru.184.1565103696222; 
 Tue, 06 Aug 2019 08:01:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d1e0:fffc:b0e3:c66d])
 by smtp.gmail.com with ESMTPSA id g2sm78766828wmh.0.2019.08.06.08.01.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 08:01:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Subject: [PATCH 1/8] dma-buf: fix busy wait for new shared fences
Date: Tue,  6 Aug 2019 17:01:27 +0200
Message-Id: <20190806150134.104222-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rLPPYENgOoc631NZg5ylujQ9Ww/Oy03mgWH9mA4Vfho=;
 b=NLJEnCXtzyj6NYFf4+43Y6hYJ2KP82uwMjCZ6yEtCz3cMQRTmyASFSYgo7phqMiuDU
 7R1kLPssX/Fm66DJlACPHRKwnj2jaNWdusHDZ6Wq+ioa7ATRg+byQw4Rv54g5Pv6RtyM
 f0TJM1wNYX5G5F46WPmMjlBLcOYJ630RS5xapz/7MVjvwFkdpZt7KtkFtAwyjom3Dxbr
 Ux2Z2ncX+upxYhAqXggRaoCh8dYCEgkNu6MIm/32Px85iL6i6FB9Xqp20jxEH7HbKdok
 xMTmLrreLYSDu0L2PYvNe6V5DT6fM2ZaI4poKTOwZLvpNHl4q/4W+VTdPt4rE956+AYi
 j+TQ==
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

V2hlbiByZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZSBpcyByZXBsYWNpbmcgYW4g
b2xkIGZlbmNlIHdpdGggYSBuZXcKb25lIHdlIHNob3VsZCBub3QgZHJvcCB0aGUgb2xkIG9uZSBi
ZWZvcmUgdGhlIG5ldyBvbmUgaXMgaW4gcGxhY2UuCgpPdGhlcndpc2Ugb3RoZXIgY29yZXMgY2Fu
IGJ1c3kgd2FpdCBmb3IgdGhlIG5ldyBvbmUgdG8gYXBwZWFyLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZG1h
LWJ1Zi9yZXNlcnZhdGlvbi5jIHwgMTQgKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEt
YnVmL3Jlc2VydmF0aW9uLmMgYi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYwppbmRleCBj
NzFiODVjOGMxNTkuLmQ1OTIwN2NhNzJkMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL3Jl
c2VydmF0aW9uLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMKQEAgLTE5Niw2
ICsxOTYsNyBAQCB2b2lkIHJlc2VydmF0aW9uX29iamVjdF9hZGRfc2hhcmVkX2ZlbmNlKHN0cnVj
dCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwKIAkJCQkJIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNl
KQogewogCXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3RfbGlzdCAqZm9iajsKKwlzdHJ1Y3QgZG1h
X2ZlbmNlICpvbGQ7CiAJdW5zaWduZWQgaW50IGksIGNvdW50OwogCiAJZG1hX2ZlbmNlX2dldChm
ZW5jZSk7CkBAIC0yMDksMTggKzIxMCwxNiBAQCB2b2lkIHJlc2VydmF0aW9uX29iamVjdF9hZGRf
c2hhcmVkX2ZlbmNlKHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwKIAl3cml0ZV9zZXFj
b3VudF9iZWdpbigmb2JqLT5zZXEpOwogCiAJZm9yIChpID0gMDsgaSA8IGNvdW50OyArK2kpIHsK
LQkJc3RydWN0IGRtYV9mZW5jZSAqb2xkX2ZlbmNlOwogCi0JCW9sZF9mZW5jZSA9IHJjdV9kZXJl
ZmVyZW5jZV9wcm90ZWN0ZWQoZm9iai0+c2hhcmVkW2ldLAotCQkJCQkJICAgICAgcmVzZXJ2YXRp
b25fb2JqZWN0X2hlbGQob2JqKSk7Ci0JCWlmIChvbGRfZmVuY2UtPmNvbnRleHQgPT0gZmVuY2Ut
PmNvbnRleHQgfHwKLQkJICAgIGRtYV9mZW5jZV9pc19zaWduYWxlZChvbGRfZmVuY2UpKSB7Ci0J
CQlkbWFfZmVuY2VfcHV0KG9sZF9mZW5jZSk7CisJCW9sZCA9IHJjdV9kZXJlZmVyZW5jZV9wcm90
ZWN0ZWQoZm9iai0+c2hhcmVkW2ldLAorCQkJCQkJcmVzZXJ2YXRpb25fb2JqZWN0X2hlbGQob2Jq
KSk7CisJCWlmIChvbGQtPmNvbnRleHQgPT0gZmVuY2UtPmNvbnRleHQgfHwKKwkJICAgIGRtYV9m
ZW5jZV9pc19zaWduYWxlZChvbGQpKQogCQkJZ290byByZXBsYWNlOwotCQl9CiAJfQogCiAJQlVH
X09OKGZvYmotPnNoYXJlZF9jb3VudCA+PSBmb2JqLT5zaGFyZWRfbWF4KTsKKwlvbGQgPSBOVUxM
OwogCWNvdW50Kys7CiAKIHJlcGxhY2U6CkBAIC0yMzAsNiArMjI5LDcgQEAgdm9pZCByZXNlcnZh
dGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZShzdHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICpv
YmosCiAKIAl3cml0ZV9zZXFjb3VudF9lbmQoJm9iai0+c2VxKTsKIAlwcmVlbXB0X2VuYWJsZSgp
OworCWRtYV9mZW5jZV9wdXQob2xkKTsKIH0KIEVYUE9SVF9TWU1CT0wocmVzZXJ2YXRpb25fb2Jq
ZWN0X2FkZF9zaGFyZWRfZmVuY2UpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
