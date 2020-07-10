Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCAD21E8F0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C176E909;
	Tue, 14 Jul 2020 07:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB36EBBD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:26:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so5165813wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=auC0/ER2X305Zg2uDQUhIlsyo4FCeU1u6x9Bb8O7OFY=;
 b=l3Lb6fIExRbdpU0vraUVP54jJ9Vgq6xtltX87nJb8koLNnc3W+QqkaBd6YJiYmTtCd
 EWUKH+L4puqm3WgcQEL++Sx/2bynhDejTAzkIiWGfxtzdW2HllMYxVELMyCopkUsbJ/W
 xyTgBBOnYN/1wpzc1M8m7/JoA8LQk6c4dRGYS87ip4BIMya+Cm1FzutIE2UWOujC+Lkn
 yM2ocnS7s72m8dnH6ksSs75Jmdl6EzIFBnysbjQKVCXyfTkwt2jYuCJ9HahDiVEIWLlE
 DqVTYKlNrtJjfx7PG2tQnz1eAM6ZX4M4Hj3fzb2aiHPP45IUxNl9KWoD9mTyC47IVtQv
 XpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=auC0/ER2X305Zg2uDQUhIlsyo4FCeU1u6x9Bb8O7OFY=;
 b=XHTX9JTPs60+pNQI8p4p8U5EVkEqq2AoZNL+rBgM7C9VWuxE5h7yOnUkX8WlQUQ83S
 Ca6mIbrepMn5LiU1xL8HQuIOaN8w5JGmadN9RjRisRJNRuCl6lGkKgQUho1xTduCP4hP
 VKRTRZkrbXkqvAUrNDl2D4IRru9e1/GyPIPvjU0qMB/yvU7pOQspzFSkLK4rCmmox4rv
 byuy6NY2nHZ/qbQ9RSlr2HMSlz+1OINq1h+ABXcZNsmCSKEsi6sBK0nKe2KgnSdBSn+8
 mn0sShLhDbuWx1C+Kzf3ND6oSz/sPbO6UK+TFPX78OOYT7SptGT9kx55TS6hCXNLivAt
 cqBg==
X-Gm-Message-State: AOAM531RgucjZcy5VuT8ZunNdGrEgaa9dYWRJ/XlIvDzRNaudeRBHkzX
 iQ2469a/hUGh+dFP3aHyN3s=
X-Google-Smtp-Source: ABdhPJxhFX6NER9xU/kBe5OXyQKFiHiVINWKc4BkdGJM0r872IK5XL9tWT/139bTTq1uVq0FYb4pAw==
X-Received: by 2002:a1c:2602:: with SMTP id m2mr4503319wmm.50.1594373162132;
 Fri, 10 Jul 2020 02:26:02 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:26:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 08/14] drm/panfrost: move devfreq_init()/fini() in device
Date: Fri, 10 Jul 2020 11:25:42 +0200
Message-Id: <20200710092548.316054-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
ZGV2ZnJlcV9pbml0KCkgYW5kIGRldmZyZXFfZmluaSgpIGhlcmUuCgpSZXZpZXdlZC1ieTogQWx5
c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+ClJldmlld2Vk
LWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyB8IDEyICsrKysrKysrKysrLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jICAgIHwgMTUgKystLS0tLS0tLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuYwppbmRleCA5Zjg5OTg0ZjY1MmEu
LjM2YjVjOGZlYTNlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZp
Y2UuYwpAQCAtMjE0LDkgKzIxNCwxNiBAQCBpbnQgcGFuZnJvc3RfZGV2aWNlX2luaXQoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJCXJldHVybiBlcnI7CiAJfQogCisJZXJyID0gcGFu
ZnJvc3RfZGV2ZnJlcV9pbml0KHBmZGV2KTsKKwlpZiAoZXJyKSB7CisJCWlmIChlcnIgIT0gLUVQ
Uk9CRV9ERUZFUikKKwkJCWRldl9lcnIocGZkZXYtPmRldiwgImRldmZyZXEgaW5pdCBmYWlsZWQg
JWRcbiIsIGVycik7CisJCWdvdG8gb3V0X2NsazsKKwl9CisKIAllcnIgPSBwYW5mcm9zdF9yZWd1
bGF0b3JfaW5pdChwZmRldik7CiAJaWYgKGVycikKLQkJZ290byBvdXRfY2xrOworCQlnb3RvIG91
dF9kZXZmcmVxOwogCiAJZXJyID0gcGFuZnJvc3RfcmVzZXRfaW5pdChwZmRldik7CiAJaWYgKGVy
cikgewpAQCAtMjY1LDYgKzI3Miw4IEBAIGludCBwYW5mcm9zdF9kZXZpY2VfaW5pdChzdHJ1Y3Qg
cGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlwYW5mcm9zdF9yZXNldF9maW5pKHBmZGV2KTsKIG91
dF9yZWd1bGF0b3I6CiAJcGFuZnJvc3RfcmVndWxhdG9yX2ZpbmkocGZkZXYpOworb3V0X2RldmZy
ZXE6CisJcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHBmZGV2KTsKIG91dF9jbGs6CiAJcGFuZnJvc3Rf
Y2xrX2ZpbmkocGZkZXYpOwogCXJldHVybiBlcnI7CkBAIC0yNzgsNiArMjg3LDcgQEAgdm9pZCBw
YW5mcm9zdF9kZXZpY2VfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlwYW5m
cm9zdF9ncHVfZmluaShwZmRldik7CiAJcGFuZnJvc3RfcG1fZG9tYWluX2ZpbmkocGZkZXYpOwog
CXBhbmZyb3N0X3Jlc2V0X2ZpbmkocGZkZXYpOworCXBhbmZyb3N0X2RldmZyZXFfZmluaShwZmRl
dik7CiAJcGFuZnJvc3RfcmVndWxhdG9yX2ZpbmkocGZkZXYpOwogCXBhbmZyb3N0X2Nsa19maW5p
KHBmZGV2KTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCBh
ZGE1MWRmOWE3YTMuLjE3MGQ2ZGJhYjIxNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kcnYuYwpAQCAtMTQsNyArMTQsNiBAQAogI2luY2x1ZGUgPGRybS9kcm1fdXRpbHMuaD4K
IAogI2luY2x1ZGUgInBhbmZyb3N0X2RldmljZS5oIgotI2luY2x1ZGUgInBhbmZyb3N0X2RldmZy
ZXEuaCIKICNpbmNsdWRlICJwYW5mcm9zdF9nZW0uaCIKICNpbmNsdWRlICJwYW5mcm9zdF9tbXUu
aCIKICNpbmNsdWRlICJwYW5mcm9zdF9qb2IuaCIKQEAgLTYwNiwxMyArNjA1LDYgQEAgc3RhdGlj
IGludCBwYW5mcm9zdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3Rv
IGVycl9vdXQwOwogCX0KIAotCWVyciA9IHBhbmZyb3N0X2RldmZyZXFfaW5pdChwZmRldik7Ci0J
aWYgKGVycikgewotCQlpZiAoZXJyICE9IC1FUFJPQkVfREVGRVIpCi0JCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJGYXRhbCBlcnJvciBkdXJpbmcgZGV2ZnJlcSBpbml0XG4iKTsKLQkJZ290byBlcnJf
b3V0MTsKLQl9Ci0KIAlwbV9ydW50aW1lX3NldF9hY3RpdmUocGZkZXYtPmRldik7CiAJcG1fcnVu
dGltZV9tYXJrX2xhc3RfYnVzeShwZmRldi0+ZGV2KTsKIAlwbV9ydW50aW1lX2VuYWJsZShwZmRl
di0+ZGV2KTsKQEAgLTYyNSwxNiArNjE3LDE0IEBAIHN0YXRpYyBpbnQgcGFuZnJvc3RfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkgKi8KIAllcnIgPSBkcm1fZGV2X3JlZ2lz
dGVyKGRkZXYsIDApOwogCWlmIChlcnIgPCAwKQotCQlnb3RvIGVycl9vdXQyOworCQlnb3RvIGVy
cl9vdXQxOwogCiAJcGFuZnJvc3RfZ2VtX3Nocmlua2VyX2luaXQoZGRldik7CiAKIAlyZXR1cm4g
MDsKIAotZXJyX291dDI6Ci0JcG1fcnVudGltZV9kaXNhYmxlKHBmZGV2LT5kZXYpOwotCXBhbmZy
b3N0X2RldmZyZXFfZmluaShwZmRldik7CiBlcnJfb3V0MToKKwlwbV9ydW50aW1lX2Rpc2FibGUo
cGZkZXYtPmRldik7CiAJcGFuZnJvc3RfZGV2aWNlX2ZpbmkocGZkZXYpOwogZXJyX291dDA6CiAJ
ZHJtX2Rldl9wdXQoZGRldik7CkBAIC02NTAsNyArNjQwLDYgQEAgc3RhdGljIGludCBwYW5mcm9z
dF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlwYW5mcm9zdF9nZW1fc2hy
aW5rZXJfY2xlYW51cChkZGV2KTsKIAogCXBtX3J1bnRpbWVfZ2V0X3N5bmMocGZkZXYtPmRldik7
Ci0JcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHBmZGV2KTsKIAlwYW5mcm9zdF9kZXZpY2VfZmluaShw
ZmRldik7CiAJcG1fcnVudGltZV9wdXRfc3luY19zdXNwZW5kKHBmZGV2LT5kZXYpOwogCXBtX3J1
bnRpbWVfZGlzYWJsZShwZmRldi0+ZGV2KTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
