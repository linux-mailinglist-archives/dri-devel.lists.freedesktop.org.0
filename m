Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2919186B8
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 10:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D7B89A57;
	Thu,  9 May 2019 08:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CEF89A57
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 08:22:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s18so3637597wmh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2019 01:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DPrdW9+2z6ZUxmiIwYAl4ynBRRcGa0YhreGJjxJguQ0=;
 b=NKmADvHXwQepw3KMQKRoVYi64Eh3AdrhvL7VuTrKp9eibKavwVqpUsOiErJjlqcmJ5
 W/nD4QZboaeXR9KkxuW5x+VK1U1J4ALrolOj+J2i2O+Wzl/GQ7/V9Vu5w24npjLH2FzK
 hZBrzehxpzo67hvH+vnIELvQQ+fFPaqCSTbBtuMpdQa7ZI/fOnySsXSQt+A+jw8mQBOr
 McMkSJ7ZKJJasATed+RxwxxdKA9Te9qFJKeT1D/uYw2BZkZqw90/DTJhtJPyCYxIc8Ik
 whpJ/490sJL4KxpNJCdQjggJ839r4CW9xzjsRzPFbiMbTOcC0DC9YWyOTCggu5MEIilS
 isLg==
X-Gm-Message-State: APjAAAXp9DMHYmC0yeGDxXpluWz5Cqk0ZEGepKJPRHFCQf8u8NxqA2nC
 fgriHBNwEBMcQ18p8ObWux3kvyrR
X-Google-Smtp-Source: APXvYqwuVBrRYXA/qgWO+V/oJ48tgq/iYoF8W2SZh0ogr8u9IBBsUqPCV7b8QNgavEqkxzXlJ7sGDw==
X-Received: by 2002:a1c:9942:: with SMTP id b63mr1905051wme.116.1557390155439; 
 Thu, 09 May 2019 01:22:35 -0700 (PDT)
Received: from cizrna.lan ([109.72.12.206])
 by smtp.gmail.com with ESMTPSA id v189sm2519556wma.3.2019.05.09.01.22.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 01:22:34 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panfrost: Only put sync_out if non-NULL
Date: Thu,  9 May 2019 10:21:51 +0200
Message-Id: <20190509082151.8823-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507080405.GA9436@mwanda>
References: <20190507080405.GA9436@mwanda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPrdW9+2z6ZUxmiIwYAl4ynBRRcGa0YhreGJjxJguQ0=;
 b=QmPLQVvj57rGV5eY/pOEbo6GIUkWcw6d9oUOE7QHLnfcdKoxk2KqjtiWRImeUGIcm5
 0Up9IGbrN8JuEE8ypnd21uvPQHk4dqJ6WPaiqM7nqzxEmqSfRh2+ugnjDB6Oj8ZagY8a
 W7I2bhppa6pXaRfOnkdG8In9Sj1j6Xy1iGERi4GTtU2RxOcexjX1LEkB6EhnUTmwAFzC
 wllilfkp2qkpEdYLzPFRPKTur7Gu2fDxEaOzBfDFJUINzM+wSxF9kAIAbCLXuolSwlmF
 fAyLBnF7zhkDv0IIBUXgdTexqDQ0bF0VbontWfZX/jZ6LjTfnbSA2aK/5Is0lBlj8uif
 vIfA==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuIENhcnBlbnRlcidzIHN0YXRpYyBhbmFseXNpcyB0b29sIHJlcG9ydGVkOgoKZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jOjIyMiBwYW5mcm9zdF9pb2N0bF9zdWJtaXQo
KQplcnJvcjogd2UgcHJldmlvdXNseSBhc3N1bWVkICdzeW5jX291dCcgY291bGQgYmUgbnVsbCAo
c2VlIGxpbmUgMjE2KQoKSW5kZWVkLCBzeW5jX291dCBjb3VsZCBiZSBOVUxMIGlmIHVzZXJzcGFj
ZSBkb2Vzbid0IHNlbmQgYSBzeW5jIG9iamVjdApJRCBmb3IgdGhlIG91dCBmZW5jZS4KClNpZ25l
ZC1vZmYtYnk6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+ClJlcG9y
dGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Ckxpbms6IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU1heS8y
MTcwMTQuaHRtbAotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8
IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCmluZGV4IDk0YjA4MTlhZDUwYi4u
ZDExZTIyODFkZGU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCkBA
IC0yMTksNyArMjE5LDggQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0bF9zdWJtaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIGZhaWxfam9iOgogCXBhbmZyb3N0X2pvYl9w
dXQoam9iKTsKIGZhaWxfb3V0X3N5bmM6Ci0JZHJtX3N5bmNvYmpfcHV0KHN5bmNfb3V0KTsKKwlp
ZiAoc3luY19vdXQpCisJCWRybV9zeW5jb2JqX3B1dChzeW5jX291dCk7CiAKIAlyZXR1cm4gcmV0
OwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
