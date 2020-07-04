Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B55215318
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07D16E2D6;
	Mon,  6 Jul 2020 07:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F76C6E409
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jul 2020 10:25:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f2so7342968wrp.7
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jul 2020 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=czEmxOplWl/ihZz6Bt2jvlGMVXmPgT75PDRsU7SwMwA=;
 b=EAmDMlJ2JBtETZactBM4rssBiXrZdMLiMz4NLtV4BcqbwyFQ+4FHmSWTT+H9UUnma6
 Kv006v35J0SQyn5EtFK1IJk8UrTApoDn5aGjcLvDx29gVwq91Sp5SJc7SyIkqJbDzML4
 IIJhBmqkI48V/d7XpRxVnU+IfPNK0x+K0CagrQBQj7s8HM7f4OmOZk0+HNmMBN75/E4f
 g1cLMdruBt44KbJg8MsQ4EyBH2F5MKBJnewBZpvM9zykoSlOozdGuYjWCUEzTwpgBKUX
 ZRP0l2kVvEi7uFZmBEgNo60l9kf042FSOGb95ePnXSuuybeymS4gVK0SOiHg02uDV4GE
 PEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=czEmxOplWl/ihZz6Bt2jvlGMVXmPgT75PDRsU7SwMwA=;
 b=YYn12KtCs1oBBc7jqCxeqk7Q5A7c6G+gabbVQx19THZj7L0mwxlWwcwgUyJoN1+Gyi
 n/kQelQsXPZ5hXX7z4HDquetnN65vMAqO61C8YeobHiKi1Dw07Nuc4rDS4rB+BIQ3IA2
 /kuasZIzP7sxc2g13BIAcDodlqw+14bD/kS8OC4P2Vzz5khdBV269PhZSol8F9h2zWTg
 MiiaaWtwwm7oTfCAzG/PSCZANa9iyuc0UxNd4cD8Iaeqg7ALsfXqrsUHe/iwaIPF0MOO
 kHzfZNma8qPraf//UmktiTIPZifeCwLtamYNYx0RwEohjrvYKF36bPmACdBpYGu+fO4R
 pokg==
X-Gm-Message-State: AOAM530OFUWZT6s6yqAIp6lHTdiS9KhHB5hVjJg7Rr1AJT3jIwRddZVU
 xc7aq6bh8+ZNzdQoTAtSaiQ=
X-Google-Smtp-Source: ABdhPJw1psxKrWFiSaDxrj+otByubFEIFRvaF35q6qFjq4w+V4aYu2Yn5JF34Ax+AAtf9OBZdFGMqw==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr40562723wrv.155.1593858351009; 
 Sat, 04 Jul 2020 03:25:51 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id g14sm16421428wrm.93.2020.07.04.03.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 03:25:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 08/14] drm/panfrost: move devfreq_init()/fini() in device
Date: Sat,  4 Jul 2020 12:25:29 +0200
Message-Id: <20200704102535.189647-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102535.189647-1-peron.clem@gmail.com>
References: <20200704102535.189647-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TGF0ZXIgd2Ugd2lsbCBpbnRyb2R1Y2UgZGV2ZnJlcSBwcm9iaW5nIHJlZ3VsYXRvciBpZiB0aGV5
CmFyZSBwcmVzZW50LiBBcyByZWd1bGF0b3Igc2hvdWxkIGJlIHByb2JlIG9ubHkgb25lIHRpbWUg
d2UKbmVlZCB0byBnZXQgdGhpcyBsb2dpYyBpbiB0aGUgZGV2aWNlX2luaXQoKS4KCnBhbmZyb3N0
X2RldmljZSBpcyBhbHJlYWR5IHRha2luZyBjYXJlIG9mIGRldmZyZXFfcmVzdW1lKCkKYW5kIGRl
dmZyZXFfc3VzcGVuZCgpLCBzbyBpdCdzIG5vdCB0b3RhbGx5IGlsbG9naWMgdG8gbW92ZQp0aGUg
ZGV2ZnJlcV9pbml0KCkgYW5kIGRldmZyZXFfZmluaSgpIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8IDEyICsrKysrKysrKysrLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgIHwgMTUgKystLS0tLS0tLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCBjYzE2ZDEwMmIyNzUu
LjQ2NGRhMTY0NjM5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYwpAQCAtMjEyLDEwICsyMTIsMTcgQEAgaW50IHBhbmZyb3N0X2RldmljZV9pbml0KHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQlyZXR1cm4gZXJyOwogCX0KIAorCWVyciA9IHBh
bmZyb3N0X2RldmZyZXFfaW5pdChwZmRldik7CisJaWYgKGVycikgeworCQlpZiAoZXJyICE9IC1F
UFJPQkVfREVGRVIpCisJCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJkZXZmcmVxIGluaXQgZmFpbGVk
ICVkXG4iLCBlcnIpOworCQlnb3RvIG91dF9jbGs7CisJfQorCiAJZXJyID0gcGFuZnJvc3RfcmVn
dWxhdG9yX2luaXQocGZkZXYpOwogCWlmIChlcnIpIHsKIAkJZGV2X2VycihwZmRldi0+ZGV2LCAi
cmVndWxhdG9yIGluaXQgZmFpbGVkICVkXG4iLCBlcnIpOwotCQlnb3RvIG91dF9jbGs7CisJCWdv
dG8gb3V0X2RldmZyZXE7CiAJfQogCiAJZXJyID0gcGFuZnJvc3RfcmVzZXRfaW5pdChwZmRldik7
CkBAIC0yNjUsNiArMjcyLDggQEAgaW50IHBhbmZyb3N0X2RldmljZV9pbml0KHN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgKnBmZGV2KQogCXBhbmZyb3N0X3Jlc2V0X2ZpbmkocGZkZXYpOwogb3V0X3Jl
Z3VsYXRvcjoKIAlwYW5mcm9zdF9yZWd1bGF0b3JfZmluaShwZmRldik7CitvdXRfZGV2ZnJlcToK
KwlwYW5mcm9zdF9kZXZmcmVxX2ZpbmkocGZkZXYpOwogb3V0X2NsazoKIAlwYW5mcm9zdF9jbGtf
ZmluaShwZmRldik7CiAJcmV0dXJuIGVycjsKQEAgLTI3OCw2ICsyODcsNyBAQCB2b2lkIHBhbmZy
b3N0X2RldmljZV9maW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCXBhbmZyb3N0
X2dwdV9maW5pKHBmZGV2KTsKIAlwYW5mcm9zdF9wbV9kb21haW5fZmluaShwZmRldik7CiAJcGFu
ZnJvc3RfcmVzZXRfZmluaShwZmRldik7CisJcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHBmZGV2KTsK
IAlwYW5mcm9zdF9yZWd1bGF0b3JfZmluaShwZmRldik7CiAJcGFuZnJvc3RfY2xrX2ZpbmkocGZk
ZXYpOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IDg4MmZl
Y2MzM2ZkYi4uNGRkYTY4Njg5MDE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2Rydi5jCkBAIC0xNCw3ICsxNCw2IEBACiAjaW5jbHVkZSA8ZHJtL2RybV91dGlscy5oPgogCiAj
aW5jbHVkZSAicGFuZnJvc3RfZGV2aWNlLmgiCi0jaW5jbHVkZSAicGFuZnJvc3RfZGV2ZnJlcS5o
IgogI2luY2x1ZGUgInBhbmZyb3N0X2dlbS5oIgogI2luY2x1ZGUgInBhbmZyb3N0X21tdS5oIgog
I2luY2x1ZGUgInBhbmZyb3N0X2pvYi5oIgpAQCAtNjA2LDEzICs2MDUsNiBAQCBzdGF0aWMgaW50
IHBhbmZyb3N0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWdvdG8gZXJy
X291dDA7CiAJfQogCi0JZXJyID0gcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHBmZGV2KTsKLQlpZiAo
ZXJyKSB7Ci0JCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikKLQkJCWRldl9lcnIoJnBkZXYtPmRl
diwgIkZhdGFsIGVycm9yIGR1cmluZyBkZXZmcmVxIGluaXRcbiIpOwotCQlnb3RvIGVycl9vdXQx
OwotCX0KLQogCXBtX3J1bnRpbWVfc2V0X2FjdGl2ZShwZmRldi0+ZGV2KTsKIAlwbV9ydW50aW1l
X21hcmtfbGFzdF9idXN5KHBmZGV2LT5kZXYpOwogCXBtX3J1bnRpbWVfZW5hYmxlKHBmZGV2LT5k
ZXYpOwpAQCAtNjI1LDE2ICs2MTcsMTQgQEAgc3RhdGljIGludCBwYW5mcm9zdF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCSAqLwogCWVyciA9IGRybV9kZXZfcmVnaXN0ZXIo
ZGRldiwgMCk7CiAJaWYgKGVyciA8IDApCi0JCWdvdG8gZXJyX291dDI7CisJCWdvdG8gZXJyX291
dDE7CiAKIAlwYW5mcm9zdF9nZW1fc2hyaW5rZXJfaW5pdChkZGV2KTsKIAogCXJldHVybiAwOwog
Ci1lcnJfb3V0MjoKLQlwbV9ydW50aW1lX2Rpc2FibGUocGZkZXYtPmRldik7Ci0JcGFuZnJvc3Rf
ZGV2ZnJlcV9maW5pKHBmZGV2KTsKIGVycl9vdXQxOgorCXBtX3J1bnRpbWVfZGlzYWJsZShwZmRl
di0+ZGV2KTsKIAlwYW5mcm9zdF9kZXZpY2VfZmluaShwZmRldik7CiBlcnJfb3V0MDoKIAlkcm1f
ZGV2X3B1dChkZGV2KTsKQEAgLTY1MCw3ICs2NDAsNiBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXBhbmZyb3N0X2dlbV9zaHJpbmtl
cl9jbGVhbnVwKGRkZXYpOwogCiAJcG1fcnVudGltZV9nZXRfc3luYyhwZmRldi0+ZGV2KTsKLQlw
YW5mcm9zdF9kZXZmcmVxX2ZpbmkocGZkZXYpOwogCXBhbmZyb3N0X2RldmljZV9maW5pKHBmZGV2
KTsKIAlwbV9ydW50aW1lX3B1dF9zeW5jX3N1c3BlbmQocGZkZXYtPmRldik7CiAJcG1fcnVudGlt
ZV9kaXNhYmxlKHBmZGV2LT5kZXYpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
