Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDBF26423
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDFC898F3;
	Wed, 22 May 2019 12:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0232897FF;
 Wed, 22 May 2019 12:59:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x64so2133077wmb.5;
 Wed, 22 May 2019 05:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgHjvHmwh7jZDek69b7WpGuCqxRGbz3Q88LA63oah9w=;
 b=LMsdSe5Mazz3kqy3AfVasaMhhE5M1iZ4EFyJ8ziTQLblgF7xYzq4aIjag/t64d8tPB
 kBJuzF6aVYKopLF/ELQcFqGVdQ1YCktkH9UEOj7aQy8LVnY5Y/ZNvZYiQJpfARuwm9ot
 yRO9xQdJ71au5aN9XVi1Hbel6CO2fAmAOQ80xHxFtyjFs9E1wrigLj7GtlA3QXgq15CD
 eHYmy5O5VnrOPbCJo5A3BgW3Gm87Qbp5qqE8c/mqr9GF0E9Vci9NWEgGZFdHV82VuVBn
 UuPMxsxjXCKEcVf6GklzbkoKVPPuOHxx+b3reBncsXjH+4v0EQ+eHAVnIGMUdAnzYBZZ
 3JoQ==
X-Gm-Message-State: APjAAAWSDuUPKbGK5vlHcA2QYBVT81kIvjCkzeG5//xljqcpaupE/YOh
 oHXLpCINjEgxX3ZPnmqwMLY=
X-Google-Smtp-Source: APXvYqx7cBsEBsoWLo2TdWXuKac5W0jlxXE+/qwLW2N7hdsoVi7Estg3wiwwtNOd7lF5AvRWpWzQVA==
X-Received: by 2002:a1c:700b:: with SMTP id l11mr7976041wmc.106.1558529990477; 
 Wed, 22 May 2019 05:59:50 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b94a:dfe1:fb43:c858])
 by smtp.gmail.com with ESMTPSA id 197sm9723523wma.36.2019.05.22.05.59.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:59:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/10] drm/ttm: return immediately in case of a signal
Date: Wed, 22 May 2019 14:59:39 +0200
Message-Id: <20190522125947.4592-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522125947.4592-1-christian.koenig@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DgHjvHmwh7jZDek69b7WpGuCqxRGbz3Q88LA63oah9w=;
 b=V6+/4DcJTgvWbPADbM+BLGSD2omUIzk+XsZUFzbH68mvSYsrlBmq+sKklB4vD0NWxo
 X9RUp1bZiRteY2hTXXth1vsf56Zfc3de2+UWKnbpqRsern0ncD7dGVK8G7g/cYyN+btl
 eouT6pVALdVpLnV8X25PVAQ0LehcuKK5wUkfOeDl21UL2hMHkCTMtuTLySBxMhNhwcYC
 Qo0pRH5NEVpEm0Y4YA2a72NVYOQNbB5/z1wuUIjJAd2YdcTncVeBifNOTbjApQwZ6BES
 lJpQSu6WrBL9VhorCrU49/sa1krDOlpkW0HSyokfcc7m84BmdLYTu3pYoM93dQXgsEHF
 cSqg==
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

V2hlbiBhIHNpZ25hbCBhcnJpdmVzIHdlIHNob3VsZCByZXR1cm4gaW1tZWRpYXRlbHkgZm9yCmhh
bmRsaW5nIGl0IGFuZCBub3QgdHJ5IG90aGVyIHBsYWNlbWVudHMgZmlyc3QuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAyODQ1
ZmNlYjJmYmQuLjQzMzY4OTNjYjM1ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC05NzgsNyArOTc4
LDYgQEAgaW50IHR0bV9ib19tZW1fc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAl1aW50MzJfdCBjdXJfZmxhZ3MgPSAwOwogCWJvb2wgdHlwZV9mb3VuZCA9IGZhbHNlOwogCWJv
b2wgdHlwZV9vayA9IGZhbHNlOwotCWJvb2wgaGFzX2VyZXN0YXJ0c3lzID0gZmFsc2U7CiAJaW50
IGksIHJldDsKIAogCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+
cmVzdiwgMSk7CkBAIC0xMDY5LDggKzEwNjgsOCBAQCBpbnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJbWVtLT5wbGFjZW1lbnQgPSBjdXJfZmxhZ3M7
CiAJCQlyZXR1cm4gMDsKIAkJfQotCQlpZiAocmV0ID09IC1FUkVTVEFSVFNZUykKLQkJCWhhc19l
cmVzdGFydHN5cyA9IHRydWU7CisJCWlmIChyZXQgJiYgcmV0ICE9IC1FQlVTWSkKKwkJCXJldHVy
biByZXQ7CiAJfQogCiAJaWYgKCF0eXBlX2ZvdW5kKSB7CkBAIC0xMDc4LDcgKzEwNzcsNyBAQCBp
bnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlyZXR1
cm4gLUVJTlZBTDsKIAl9CiAKLQlyZXR1cm4gKGhhc19lcmVzdGFydHN5cykgPyAtRVJFU1RBUlRT
WVMgOiAtRU5PTUVNOworCXJldHVybiAtRU5PTUVNOwogfQogRVhQT1JUX1NZTUJPTCh0dG1fYm9f
bWVtX3NwYWNlKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
