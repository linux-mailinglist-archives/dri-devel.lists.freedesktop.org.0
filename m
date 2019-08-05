Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E942F8209E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 17:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E80C6E492;
	Mon,  5 Aug 2019 15:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71A36E492;
 Mon,  5 Aug 2019 15:45:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so84901484wru.13;
 Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLPPYENgOoc631NZg5ylujQ9Ww/Oy03mgWH9mA4Vfho=;
 b=G3r+uNp3UXbOBg16c6BrFDfmkoILuRLt2+xE7QsRAr5iLU1ZY9bgSZVb/G9/mzzubD
 1zNL7cUhRULsnWA9dg7CfydDIDalnsL6VXK+Fdud7emujva7LDhizIh59xZvovfZRKgx
 hRsXbJtB1hiqqO7Zs5JASQtYn7ma2cXbq8cszSn4sJDuEvxtWKTvLzJ1EIbe13A54aMR
 d66cgtc0lpM+gX836qhkpJJ+1v0e3RIWSbzSPgcyYeGo1+sdfCP0u0ddd6H92M4mVRWX
 nQylhCndBLftm4jb1j3xVfdhHWbJ0FUO8XSM2wNYQANJniRWklMi5DZyRaq/iM6Y2Dcu
 fEXA==
X-Gm-Message-State: APjAAAU08nvNOPZX5CCJIRhSf91rKXFudC/UYPzDwUBOkGcmhUenkFlC
 XPHhx8d7oshbAs4omgmwH/hux5wr
X-Google-Smtp-Source: APXvYqzBprTtDw6edlmqIDiUmJARW7G/OtGF/lCyUR20zOiLqI+2QZmZi/Tqpnx0vU3E2ILqGfvMww==
X-Received: by 2002:a5d:564e:: with SMTP id j14mr1799712wrw.1.1565019957178;
 Mon, 05 Aug 2019 08:45:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
 by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 08:45:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk
Subject: [PATCH 2/5] dma-buf: fix busy wait for new shared fences
Date: Mon,  5 Aug 2019 17:45:51 +0200
Message-Id: <20190805154554.3476-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
References: <20190805154554.3476-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rLPPYENgOoc631NZg5ylujQ9Ww/Oy03mgWH9mA4Vfho=;
 b=uUMttogETRTbgFeSAW6AxRt+C/hSaMGFvi3mp332QoCPwvz8IWurSQBJyJZOR7bOeh
 t3ZG8sKWLHmomyK1KkW6laa+1rkPlb2s6S7QLjGuLHIGU6mFCWzgKyX03MYFGac/PX3f
 3FnoVZBhJNwniqasz7bjYzRcYHCGc7RShvCwvYl0KzWBYFpbx0kyIORqWht2191zBDHz
 Y3CTXzhkS44iwXBeQLT+vO4Z5kzpL6G5vo9DrLaozfCFZvMs+Wn9RBp8yQaEa0EJxXMd
 qPMg93CgzwNyEG7odpHdapiM1CXQ7Ke1wCd5xjdaY8/jfeVjVAiB9Ij2vv4o2WHx0ycg
 FPkQ==
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
