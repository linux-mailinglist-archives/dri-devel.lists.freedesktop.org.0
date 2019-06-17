Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB649116
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A7989FED;
	Mon, 17 Jun 2019 20:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41C96E09E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:36 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12392901qtn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eW5UYe8I4qvCNc714+7hSZS3b/NQZnllHNBPJZkv2eY=;
 b=MxQeaaAWJy8d/6OOfU2nYLgqLksFd6kh+4MJPuEV7NLnCsUDNIFd97KmzXLNjQed/F
 FvRYaAIYXPdl4iNNZRME64RYO6C/Y+sf/AiXNjwLOPe4oslhL7k7RXqW+sCnmoMRxJ/B
 2h/lyTvYa3HylaveC7xhzxJpr7dpMbRV6V7KWgqyeL7kbzoydexuoTv5vw/Exk4XfOev
 lAm1APH85Rcyay8EG4ChUX1DUgBdJf3PXxspgt7CUYL41q0kuqHM/zVvSMnrrl1WapG5
 at26356qMmWhYARIoiJefdrCmEyxEqPLmdDm+SNZVqOGCZiR0pETzdwMidqXTF3Kd+Su
 OI5g==
X-Gm-Message-State: APjAAAUoVqet5KNmwUYDnrLukoDPeTKioCr8A3m69+laBRk+Khmaqkz2
 G8xH/dOf9bYUnfFS+KIk/+vFLK5fTQw=
X-Google-Smtp-Source: APXvYqy0nkpRBCX5jT4q6yqC4LA6QLk30UxErp74KBr3V96+SlASaTXo3caNWvDOhCc9VLbG+OJ5zw==
X-Received: by 2002:a0c:aed0:: with SMTP id n16mr23668643qvd.101.1560802415854; 
 Mon, 17 Jun 2019 13:13:35 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 09/13] drm/msm/dsi: Pull out panel init code into function
Date: Mon, 17 Jun 2019 16:12:54 -0400
Message-Id: <20190617201301.133275-6-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eW5UYe8I4qvCNc714+7hSZS3b/NQZnllHNBPJZkv2eY=;
 b=cTj2H0fFpMLV68ZtM8KoMdCOc4uIpHZdR68OxZTYdpYvkn8ssFMPpu+rO9RxdPNA9a
 9Nqzd+cVkEe1tOuxwJTnJ87Gge3kDSG8kYngKvZfUyOY4lKUH2fUeAxjd8IDC/z0/FXa
 LcWXJaKSkrnASvMWWDkpT4S645E2cRsdNGaxXecflkaUnnqhDZfIK+qIbxx8VSeF4JBR
 Rix4NO3lIrUV//pL71dWZWyYr3MNzgNyWD2DmUu8Fqn+yT2rwysJoNudAYfUZJlxXK9B
 3AtEASA43KTp+jtX1spMSmx+HtzgOy5CKeNMhKH+1BsXHVyMni937yC6aRKMQHQsXYGH
 RajQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpQdWxsIGFsbCBvZiB0aGUg
cGFuZWwgaW5pdCBjb2RlIG91dCBvZiBkZXRlY3QoKSBhbmQgcHV0IGl0IGluIGl0cyBvd24KZnVu
Y3Rpb24uIFRoaXMgd2lsbCBiZSB1c2VmdWwgaW4gZnV0dXJlIHBhdGNoZXMgd2hlcmUgaXQncyBt
b3ZlZCBmcm9tCmRldGVjdCgpLgoKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX21hbmFnZXIuYyB8
IDE2ICsrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9t
YW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfbWFuYWdlci5jCmluZGV4IDcz
NWZmZjc5YWU2Ny4uODU1MTM5MTk1NzY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9kc2lfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5h
Z2VyLmMKQEAgLTIzOSwxNyArMjM5LDE0IEBAIHN0YXRpYyBib29sIGRzaV9tZ3JfaXNfY21kX21v
ZGUoc3RydWN0IG1zbV9kc2kgKm1zbV9kc2kpCiAJcmV0dXJuICEoaG9zdF9mbGFncyAmIE1JUElf
RFNJX01PREVfVklERU8pOwogfQogCi1zdGF0aWMgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBk
c2lfbWdyX2Nvbm5lY3Rvcl9kZXRlY3QoCi0JCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IsIGJvb2wgZm9yY2UpCitzdGF0aWMgdm9pZCBtc21fZHNpX21hbmFnZXJfcGFuZWxfaW5pdChz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCB1OCBpZCkKIHsKLQlpbnQgaWQgPSBkc2lf
bWdyX2Nvbm5lY3Rvcl9nZXRfaWQoY29ubmVjdG9yKTsKIAlzdHJ1Y3QgbXNtX2RzaSAqbXNtX2Rz
aSA9IGRzaV9tZ3JfZ2V0X2RzaShpZCk7CiAJc3RydWN0IG1zbV9kc2kgKm90aGVyX2RzaSA9IGRz
aV9tZ3JfZ2V0X290aGVyX2RzaShpZCk7CiAJc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9
IGNvbm5lY3Rvci0+ZGV2LT5kZXZfcHJpdmF0ZTsKIAlzdHJ1Y3QgbXNtX2ttcyAqa21zID0gcHJp
di0+a21zOwogCWJvb2wgY21kX21vZGU7CiAKLQlEQkcoImlkPSVkIiwgaWQpOwogCWlmICghbXNt
X2RzaS0+cGFuZWwpIHsKIAkJbXNtX2RzaS0+cGFuZWwgPSBtc21fZHNpX2hvc3RfZ2V0X3BhbmVs
KG1zbV9kc2ktPmhvc3QpOwogCkBAIC0yOTIsNiArMjg5LDE3IEBAIHN0YXRpYyBlbnVtIGRybV9j
b25uZWN0b3Jfc3RhdHVzIGRzaV9tZ3JfY29ubmVjdG9yX2RldGVjdCgKIAkJCQlwcl9lcnIoIm1k
cCBkb2VzIG5vdCBzdXBwb3J0IGR1YWwgRFNJXG4iKTsKIAkJfQogCX0KK30KKworc3RhdGljIGVu
dW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgZHNpX21ncl9jb25uZWN0b3JfZGV0ZWN0KAorCQlzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQoreworCWludCBpZCA9IGRz
aV9tZ3JfY29ubmVjdG9yX2dldF9pZChjb25uZWN0b3IpOworCXN0cnVjdCBtc21fZHNpICptc21f
ZHNpID0gZHNpX21ncl9nZXRfZHNpKGlkKTsKKworCURCRygiaWQ9JWQiLCBpZCk7CisJaWYgKCFt
c21fZHNpLT5wYW5lbCkKKwkJbXNtX2RzaV9tYW5hZ2VyX3BhbmVsX2luaXQoY29ubmVjdG9yLCBp
ZCk7CiAKIAlyZXR1cm4gbXNtX2RzaS0+cGFuZWwgPyBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3Rl
ZCA6CiAJCWNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOwotLSAKU2VhbiBQYXVsLCBTb2Z0
d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
