Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631BEBF4C5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 16:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9AB6ED43;
	Thu, 26 Sep 2019 14:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8556ED42;
 Thu, 26 Sep 2019 14:12:31 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q21so1898531pfn.11;
 Thu, 26 Sep 2019 07:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Iz6GPeVEWxjGTFyACmaAqr696d/fTgvzJcKi4N4gyXI=;
 b=Q9tYoHl6EMOQmnw/gM2BQ7vYo7gBkVOrVF4myId85dEZGCr3AZBUKV/7FyodVqF7mc
 0/8NXGN8nhzEgVqAbBFqzbtX7NWN0SgikAI40DohsVsME1fMlrdyHfcAtt+B72hQBsQT
 zzo4w88WP4EGn3I/+jtdinQ6eGtsezTqI+idgxTTMwXL9PA0FwxFoVmFct/1kCCgp0eM
 FriTp43ChgMNqHHqlWScL1a6iFWazTzxiXfW4XI5aIOix5/MuD1enVGTYCIKl+vO17oK
 EKLpfQLnBk9odRJZSLbg+ONkdljik9vUjBOZwd5OR5dNjmMYDFKjUbNpq0iEYVm6p/Bb
 9AXQ==
X-Gm-Message-State: APjAAAVP3uhBYMPqXkdZJNvPcrWNCglDfWdtEnuETmWlC4165NNexXMC
 uLFXqZJ9S/4KP9m4TQLdAQc2TvdpFkk=
X-Google-Smtp-Source: APXvYqxoaf0L9tPwXSoSE7sgKT/dxV6NdWxrZv+tRrJpRjuMb0IaZSEKBpHQb5QTbzB6mdC9mjJygQ==
X-Received: by 2002:a63:550a:: with SMTP id j10mr3561266pgb.369.1569507150886; 
 Thu, 26 Sep 2019 07:12:30 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 w188sm2176740pgw.26.2019.09.26.07.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 07:12:30 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/v3d: use drm_gem_objects_lookup
Date: Thu, 26 Sep 2019 22:10:41 +0800
Message-Id: <20190926141046.30758-4-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926141046.30758-1-yuq825@gmail.com>
References: <20190926141046.30758-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Iz6GPeVEWxjGTFyACmaAqr696d/fTgvzJcKi4N4gyXI=;
 b=KwFNXU/XG+vPgCYiZvnpfMCfxK9bZs1C+IfwdCXL8VDIJddmEzlp9ykhwaqC/Fi9q2
 1HbtKbYlNmSifXYjcrHJNaXd4AO2l3E9VN/M4JNGAfyjnwGH9GEs0M8rxahU0H7boLJE
 7yfdO7G/61SAen5Ct3xUQmKNmyaT7lc8I+aTJo8UqF7LXmWzKJwCqwfoXQV54bkIZoWM
 Kasq30nbFjEZ+tndFWa9GlWqXFruU/U/MIRAMlBam42X+UHCUuN1WF33zbogOqwNOkGI
 WPes8qAj4kOvBMDZzGsjWqbBJHxwYLmSWauARv7Rj+f+KUp4EdpvZoJ96AE32u2d8zVj
 5Vbg==
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
Cc: lima@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+ClNpZ25lZC1vZmYtYnk6IFFpYW5nIFl1
IDx5dXE4MjVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIHwg
MzUgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92M2QvdjNkX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKaW5kZXgg
NGM0YjU5YWUyYzgxLi5iN2M0ZTU2ZGFmZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
M2QvdjNkX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCkBAIC0yOTEs
OCArMjkxLDcgQEAgdjNkX2xvb2t1cF9ib3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkgICAg
ICAgdTMyIGJvX2NvdW50KQogewogCXUzMiAqaGFuZGxlczsKLQlpbnQgcmV0ID0gMDsKLQlpbnQg
aTsKKwlpbnQgcmV0OwogCiAJam9iLT5ib19jb3VudCA9IGJvX2NvdW50OwogCkBAIC0zMDQsMTkg
KzMwMywxMCBAQCB2M2RfbG9va3VwX2JvcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1
cm4gLUVJTlZBTDsKIAl9CiAKLQlqb2ItPmJvID0ga3ZtYWxsb2NfYXJyYXkoam9iLT5ib19jb3Vu
dCwKLQkJCQkgc2l6ZW9mKHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKiksCi0JCQkJIEdGUF9L
RVJORUwgfCBfX0dGUF9aRVJPKTsKLQlpZiAoIWpvYi0+Ym8pIHsKLQkJRFJNX0RFQlVHKCJGYWls
ZWQgdG8gYWxsb2NhdGUgdmFsaWRhdGVkIEJPIHBvaW50ZXJzXG4iKTsKLQkJcmV0dXJuIC1FTk9N
RU07Ci0JfQotCiAJaGFuZGxlcyA9IGt2bWFsbG9jX2FycmF5KGpvYi0+Ym9fY291bnQsIHNpemVv
Zih1MzIpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWhhbmRsZXMpIHsKLQkJcmV0ID0gLUVOT01FTTsK
IAkJRFJNX0RFQlVHKCJGYWlsZWQgdG8gYWxsb2NhdGUgaW5jb21pbmcgR0VNIGhhbmRsZXNcbiIp
OwotCQlnb3RvIGZhaWw7CisJCXJldHVybiAtRU5PTUVNOwogCX0KIAogCWlmIChjb3B5X2Zyb21f
dXNlcihoYW5kbGVzLApAQCAtMzI0LDI2ICszMTQsMTMgQEAgdjNkX2xvb2t1cF9ib3Moc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAkJCSAgIGpvYi0+Ym9fY291bnQgKiBzaXplb2YodTMyKSkpIHsK
IAkJcmV0ID0gLUVGQVVMVDsKIAkJRFJNX0RFQlVHKCJGYWlsZWQgdG8gY29weSBpbiBHRU0gaGFu
ZGxlc1xuIik7Ci0JCWdvdG8gZmFpbDsKKwkJZ290byBvdXQ7CiAJfQogCi0Jc3Bpbl9sb2NrKCZm
aWxlX3ByaXYtPnRhYmxlX2xvY2spOwotCWZvciAoaSA9IDA7IGkgPCBqb2ItPmJvX2NvdW50OyBp
KyspIHsKLQkJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpibyA9IGlkcl9maW5kKCZmaWxlX3ByaXYt
Pm9iamVjdF9pZHIsCi0JCQkJCQkgICAgIGhhbmRsZXNbaV0pOwotCQlpZiAoIWJvKSB7Ci0JCQlE
Uk1fREVCVUcoIkZhaWxlZCB0byBsb29rIHVwIEdFTSBCTyAlZDogJWRcbiIsCi0JCQkJICBpLCBo
YW5kbGVzW2ldKTsKLQkJCXJldCA9IC1FTk9FTlQ7Ci0JCQlzcGluX3VubG9jaygmZmlsZV9wcml2
LT50YWJsZV9sb2NrKTsKLQkJCWdvdG8gZmFpbDsKLQkJfQotCQlkcm1fZ2VtX29iamVjdF9nZXQo
Ym8pOwotCQlqb2ItPmJvW2ldID0gYm87Ci0JfQotCXNwaW5fdW5sb2NrKCZmaWxlX3ByaXYtPnRh
YmxlX2xvY2spOworCXJldCA9IGRybV9nZW1fb2JqZWN0c19sb29rdXAoZmlsZV9wcml2LCBoYW5k
bGVzLAorCQkJCSAgICAgam9iLT5ib19jb3VudCwgJmpvYi0+Ym8pOwogCi1mYWlsOgorb3V0Ogog
CWt2ZnJlZShoYW5kbGVzKTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
