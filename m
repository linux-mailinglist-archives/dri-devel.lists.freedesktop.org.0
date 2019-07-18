Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612A6D13D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 17:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776486E41A;
	Thu, 18 Jul 2019 15:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666E36E40C;
 Thu, 18 Jul 2019 15:37:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b17so19553660lff.7;
 Thu, 18 Jul 2019 08:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LLrJd06qiFDP4GE0liBgjxZMnk5poDqpfuPX5kofgWM=;
 b=ilc/E1d+KOqZ6BWS+BgkW0cvOsUN+e4RAWetsNtZSgeagNk1gCDkLdzu3fBcJTYGvB
 xZ+DHhRswm4yVBMnHVsUrxDq7cwEwwCXnBmcQ63G0H44eBMmxZdMaljwB9eXnCma6X1w
 jAYomKI1r0/hwjrRMHkdr+KSr3VjcWlmIqVjDu+0If7hGZpsfIG090eV98q7m6ec7vcQ
 3uhzMmPv4RN4F+IwdbbWURCXbyeAu6gP5WlunN4JDFk6kz9mJk+lw2Tv1pvnjO2ty5gF
 7Facno+dj/9+4/UeuKOd2ADKMMAv7/WLecombZAjGK5xz3J+LguYH8sH88Mdd41uBIem
 mM5g==
X-Gm-Message-State: APjAAAXnJ52XEHckjJGYqwbZnzzLAFAX38poSJpggIW9F6D3lNq41VZa
 KfFjoHdkA10iI/7VlQDL7vDJDqeAR4w=
X-Google-Smtp-Source: APXvYqz+tuBXxumYanvzxdC1TzdnCeeorGWynHiiVTy6bzSeFsNP8JSHOBvdEged/Qx+QDSMXAJzfA==
X-Received: by 2002:a05:6512:48f:: with SMTP id
 v15mr17733196lfq.37.1563464276494; 
 Thu, 18 Jul 2019 08:37:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c30sm4062388lfp.70.2019.07.18.08.37.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 08:37:56 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v1 6/6] drm/via: drop DRM_WAIT_ON() in via_video
Date: Thu, 18 Jul 2019 17:37:37 +0200
Message-Id: <20190718153737.28657-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718153737.28657-1-sam@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLrJd06qiFDP4GE0liBgjxZMnk5poDqpfuPX5kofgWM=;
 b=jDhxEVsoTa506cjPZjB31vsZDAtu/mmo7nfsZRGkU63NCjhpDvPmh1ClUPYoOHKwIz
 8Xc7GWx8FRQAqyKKEP59TAqWJm8hfzDQey2Ng5i6+QgT9zLzWuAF5wSaSFzMRYlaIgUZ
 +V+AccBzDPxepfolh+4ZSFjpfI0JPAdV2RPZ7GGU8Fk2JH91XJUG5JgwJb/E8gpAlHPe
 d/E4XQOf3+dAjDYS1KoLWWzp/nNr14HHxkxCPFwWmTT01J/1G1hjhdUVQpy7WsiVq0oX
 KrJYq/F5UhYZId5aeyNkFzcnmOQUIj9+999VzNSzPBJK6MVMt/bslQP7LDrTi8laWTwO
 CUpw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSBEUk1fV0FJVF9PTigpIHdpdGggd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkuCkJl
IGNhcmVmdWwgdG8ga2VlcCBzYW1lIHJldHVybiB2YWx1ZSBzZW1hbnRpY3MKClNpZ25lZC1vZmYt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEtldmluIEJyYWNlIDxrZXZp
bmJyYWNlQGdteC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5j
b20+CkNjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CkNj
OiBNaWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQuY29tPgpDYzogSXJhIFdlaW55IDxpcmEu
d2VpbnlAaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpYS92aWFfdmlkZW8uYyB8IDIxICsrKysrKysrKysrKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfdmlkZW8uYyBiL2RyaXZlcnMvZ3B1L2RybS92
aWEvdmlhX3ZpZGVvLmMKaW5kZXggNGUxNjViMWIwYjE4Li4xZjg4MTgwYWZmZWYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX3ZpZGVvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfdmlkZW8uYwpAQCAtMjYsNyArMjYsNiBAQAogICovCiAKICNpbmNsdWRlIDxkcm0v
ZHJtX2RldmljZS5oPgotI2luY2x1ZGUgPGRybS9kcm1fb3NfbGludXguaD4KICNpbmNsdWRlIDxk
cm0vdmlhX2RybS5oPgogCiAjaW5jbHVkZSAidmlhX2Rydi5oIgpAQCAtNzMsNyArNzIsNyBAQCBp
bnQgdmlhX2RlY29kZXJfZnV0ZXgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwg
c3RydWN0IGRybV9maWxlICpmaWxlXwogCXZvbGF0aWxlIGludCAqbG9jazsKIAlkcm1fdmlhX3By
aXZhdGVfdCAqZGV2X3ByaXYgPSAoZHJtX3ZpYV9wcml2YXRlX3QgKikgZGV2LT5kZXZfcHJpdmF0
ZTsKIAlkcm1fdmlhX3NhcmVhX3QgKnNBUHJpdiA9IGRldl9wcml2LT5zYXJlYV9wcml2OwotCWlu
dCByZXQgPSAwOworCWludCByZXQ7CiAKIAlEUk1fREVCVUcoIlxuIik7CiAKQEAgLTg0LDkgKzgz
LDIxIEBAIGludCB2aWFfZGVjb2Rlcl9mdXRleChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfCiAKIAlzd2l0Y2ggKGZ4LT5mdW5jKSB7CiAJ
Y2FzZSBWSUFfRlVURVhfV0FJVDoKLQkJRFJNX1dBSVRfT04ocmV0LCBkZXZfcHJpdi0+ZGVjb2Rl
cl9xdWV1ZVtmeC0+bG9ja10sCi0JCQkgICAgKGZ4LT5tcyAvIDEwKSAqIChIWiAvIDEwMCksICps
b2NrICE9IGZ4LT52YWwpOwotCQlyZXR1cm4gcmV0OworCQlyZXQgPSB3YWl0X2V2ZW50X2ludGVy
cnVwdGlibGVfdGltZW91dCgKKwkJCQlkZXZfcHJpdi0+ZGVjb2Rlcl9xdWV1ZVtmeC0+bG9ja10s
CisJCQkJKmxvY2sgIT0gZngtPnZhbCwKKwkJCQltc2Vjc190b19qaWZmaWVzKGZ4LT5tcykpOwor
CQlzd2l0Y2ggKHJldCkgeworCQljYXNlIDA6CisJCQkvKiB0aW1lb3V0ICovCisJCQlyZXR1cm4g
LUVCVVNZOworCQljYXNlIC1FUkVTVEFSVFNZUzoKKwkJCS8qIGludGVycnVwdGVkIGJ5IHNpZ25h
bCAqLworCQkJcmV0dXJuIC1FSU5UUjsKKwkJZGVmYXVsdDoKKwkJCXJldHVybiAwOworCQl9CisK
IAljYXNlIFZJQV9GVVRFWF9XQUtFOgogCQl3YWtlX3VwKCYoZGV2X3ByaXYtPmRlY29kZXJfcXVl
dWVbZngtPmxvY2tdKSk7CiAJCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
