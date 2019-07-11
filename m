Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E799065035
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 04:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301FD89B68;
	Thu, 11 Jul 2019 02:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2289B68
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 02:40:08 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id t16so1990129pfe.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 19:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C8E8H/QOJPMLUX+Dl+OKCeAuU0VWHZNPc5/1qNNCS3A=;
 b=P3YeAUWbAfPmvPegNAKmUyIIin8pXQOQ4JDwPnqG0pnNi6m1q+fAO4mFKHH8pPrJAp
 0W17Wyma+Clewq/9RKJu3z5Zh1o3uiVFX7gFYPXLzrdjT7TelYnstQRUo0xFNFipg+6G
 Rh5ezl/tLiJMIsqeZFq3DKpYUpAuAogTNJWx+5jYBWYynFxm8aogFKHLsk+pHCssrJf6
 EcgqwbSwu64zkdsCIxaC20CJoCEMzR+lPKJiczeVVZ6ew7IUhhBUaI0uKyXxnn2z+UeZ
 Q+TUzgvrVFw5N0Y0ARDY0JSaLDP6oQ7cbKDBd2JjTPWWdujWdeJF/nROtjyO4RLWeTYj
 ZixA==
X-Gm-Message-State: APjAAAWRUKHgIi0jCWa9LJlJ/pMHDZN7QVrwpCO4ivFNkl7ehinmbTVV
 ZbmzLT01O5K7qbaGC+vOU/3oaEdB
X-Google-Smtp-Source: APXvYqxPMPQEVTxxbc9UReUqfnmxUCvYxChCFWNedtCSJGKTOwJRfV39HBtupRw4ZTPjT4QYQz/DMQ==
X-Received: by 2002:a63:7b4d:: with SMTP id k13mr1686080pgn.182.1562812807406; 
 Wed, 10 Jul 2019 19:40:07 -0700 (PDT)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id bo20sm2877077pjb.23.2019.07.10.19.40.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 19:40:06 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: kick vq outside of the vq lock
Date: Wed, 10 Jul 2019 19:39:59 -0700
Message-Id: <20190711023959.170158-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190711022937.166015-1-olvaffe@gmail.com>
References: <20190711022937.166015-1-olvaffe@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C8E8H/QOJPMLUX+Dl+OKCeAuU0VWHZNPc5/1qNNCS3A=;
 b=LFssXHlc4NksAYAhzFzgi8xTRTyRMliELywQFv9VUJVWjf2PiU9RiGZ3zV9OaXaJfz
 91HAomEa81By0LAwwOEB9poOe8UtZyfG9My4IBU8GlmxOBGbsRXNWGH0/bts96LbnjnA
 NGQkIli+cQ/8qTzQXXfwnhF7U17UASCTKYqTMo/zn/0sP6m9Z0jHm9AixzwV084y/nqx
 8y2vGNX0GfKDQ+2gYrulCSBkZ9ssbkmBgG1bxloiWpKTGlMfoHhs298oR6oIMlTW4bk4
 B98fphK+vEl3DSmUmjhZgVDft0yE5G+Vh5F41jeQl5ag1xxzkRi75cZkX6ek98V4UOHK
 PCMA==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB2aXJ0cXVldWVfa2ljayBieSB2aXJ0cXVldWVfa2lja19wcmVwYXJlLCB3aGljaCBy
ZXF1aXJlcwpzZXJpYWxpemF0aW9uLCBhbmQgdmlydHF1ZXVlX25vdGlmeSwgd2hpY2ggZG9lcyBu
b3QuICBSZXB1cnBvc2UgdGhlCnJldHVybiB2YWx1ZXMgdG8gaW5kaWNhdGUgd2hldGhlciB0aGUg
dnEgc2hvdWxkIGJlIG5vdGlmaWVkLgoKVGhpcyBmaXhlcyBhIGJhZCBzcGlubG9jayBjb250ZW50
aW9uIHdoZW4gdGhlIGhvc3QgaXMgcWVtdS4gIFdoZW4KdGhlIGd1ZXN0IGNhbGxzIHZpcnRxdWV1
ZV9ub3RpZnksIHRoZSBxZW11IHZjcHUgdGhyZWFkIGV4aXRzIHRoZQpndWVzdCBhbmQgd2FpdHMg
Zm9yIHRoZSBxZW11IGlvdGhyZWFkIHRvIHBlcmZvcm0gdGhlIE1NSU8uICBJZiB0aGUKcWVtdSBp
b3RocmVhZCBpcyBzdGlsbCBwcm9jZXNzaW5nIHRoZSBwcmlvciBidWZmZXIsIGFuZCBpZiB0aGUg
cHJpb3IKYnVmZmVyIGlzIGNoZWFwIHRvIEdQVSwgdGhlIGlvdGhyZWFkIHdpbGwgZ28gYWhlYWQg
YW5kIGdlbmVyYXRlIGFuCklSUS4gIEEgd29ya2VyIHRocmVhZCBpbiB0aGUgZ3Vlc3QgbWlnaHQg
c3RhcnQgcnVubmluZwp2aXJ0aW9fZ3B1X2RlcXVldWVfY3RybF9mdW5jLiAgSWYgdmlydHF1ZXVl
X25vdGlmeSB3YXMgY2FsbGVkIHdpdGgKdGhlIHZxIGxvY2sgaGVsZCwgdGhlIHdvcmtlciB0aHJl
YWQgd291bGQgaGF2ZSB0byBidXN5IHdhaXQgaW5zaWRlCnZpcnRpb19ncHVfZGVxdWV1ZV9jdHJs
X2Z1bmMuCgp2MjogZml4IHNjcmFtYmxlZCBjb21taXQgbWVzc2FnZQoKU2lnbmVkLW9mZi1ieTog
Q2hpYS1JIFd1IDxvbHZhZmZlQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfdnEuYyB8IDE5ICsrKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV92cS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X3ZxLmMKaW5kZXggNmMxYTkwNzE3NTM1Li5lOTZmODhmZTVjODMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV92cS5jCkBAIC0yOTEsMTEgKzI5MSw5IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dw
dV9xdWV1ZV9jdHJsX2J1ZmZlcl9sb2NrZWQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2Rl
diwKIAkJdHJhY2VfdmlydGlvX2dwdV9jbWRfcXVldWUodnEsCiAJCQkoc3RydWN0IHZpcnRpb19n
cHVfY3RybF9oZHIgKil2YnVmLT5idWYpOwogCi0JCXZpcnRxdWV1ZV9raWNrKHZxKTsKKwkJcmV0
ID0gdmlydHF1ZXVlX2tpY2tfcHJlcGFyZSh2cSk7CiAJfQogCi0JaWYgKCFyZXQpCi0JCXJldCA9
IHZxLT5udW1fZnJlZTsKIAlyZXR1cm4gcmV0OwogfQogCkBAIC0zMDcsNiArMzA1LDEwIEBAIHN0
YXRpYyBpbnQgdmlydGlvX2dwdV9xdWV1ZV9jdHJsX2J1ZmZlcihzdHJ1Y3QgdmlydGlvX2dwdV9k
ZXZpY2UgKnZnZGV2LAogCXNwaW5fbG9jaygmdmdkZXYtPmN0cmxxLnFsb2NrKTsKIAlyYyA9IHZp
cnRpb19ncHVfcXVldWVfY3RybF9idWZmZXJfbG9ja2VkKHZnZGV2LCB2YnVmKTsKIAlzcGluX3Vu
bG9jaygmdmdkZXYtPmN0cmxxLnFsb2NrKTsKKworCWlmIChyYyA+IDApCisJCXZpcnRxdWV1ZV9u
b3RpZnkodmdkZXYtPmN0cmxxLnZxKTsKKwogCXJldHVybiByYzsKIH0KIApAQCAtMzM5LDYgKzM0
MSwxMCBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHN0
cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCiAJCXZpcnRpb19ncHVfZmVuY2VfZW1pdCh2
Z2RldiwgaGRyLCBmZW5jZSk7CiAJcmMgPSB2aXJ0aW9fZ3B1X3F1ZXVlX2N0cmxfYnVmZmVyX2xv
Y2tlZCh2Z2RldiwgdmJ1Zik7CiAJc3Bpbl91bmxvY2soJnZnZGV2LT5jdHJscS5xbG9jayk7CisK
KwlpZiAocmMgPiAwKQorCQl2aXJ0cXVldWVfbm90aWZ5KHZnZGV2LT5jdHJscS52cSk7CisKIAly
ZXR1cm4gcmM7CiB9CiAKQEAgLTM2OSwxMyArMzc1LDE0IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dw
dV9xdWV1ZV9jdXJzb3Ioc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJdHJhY2Vf
dmlydGlvX2dwdV9jbWRfcXVldWUodnEsCiAJCQkoc3RydWN0IHZpcnRpb19ncHVfY3RybF9oZHIg
Kil2YnVmLT5idWYpOwogCi0JCXZpcnRxdWV1ZV9raWNrKHZxKTsKKwkJcmV0ID0gdmlydHF1ZXVl
X2tpY2tfcHJlcGFyZSh2cSk7CiAJfQogCiAJc3Bpbl91bmxvY2soJnZnZGV2LT5jdXJzb3JxLnFs
b2NrKTsKIAotCWlmICghcmV0KQotCQlyZXQgPSB2cS0+bnVtX2ZyZWU7CisJaWYgKHJldCA+IDAp
CisJCXZpcnRxdWV1ZV9ub3RpZnkodnEpOworCiAJcmV0dXJuIHJldDsKIH0KIAotLSAKMi4yMi4w
LjQxMC5nZDhmZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
