Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7B1480C8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 13:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A06891B5;
	Mon, 17 Jun 2019 11:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E589187;
 Mon, 17 Jun 2019 11:34:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h19so4314885wme.0;
 Mon, 17 Jun 2019 04:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=Xx5GBkccz6v6YyuMWYW70FgPPmAJnxePLG62lACITlvmgTQCnXhQpUbdI4PzzWUqd3
 NelIqhKhwsVqbIFEyvOsUjQdflvvQ2CO3yZcDJ+v7AlSB1cMBu3aGpSzFujNcCXp73J/
 Kr4sgtDBMLgg+Xc+0eoXzVdMVheqPPnRjWkVto2bx2v9tALZwEzG8fPffs4jkt8kZD7B
 2EBJt+QrfAbUw5ah1EVSxa5x/wQeN8A9Y3yPWuAR3mjzio8P9mIz9n52BFZavHeXrx5c
 xsVlpLLmz3Iut+6ea6suviGcU6wAhRWjCsEyY0bdsHPLHY/5SCCQulaB+Bun1eHPw/Kf
 AtyQ==
X-Gm-Message-State: APjAAAX9JY97gsgZ/mENsDnJ3J/qLi/hx453sR+OtSVKbcIdqNVWo9xf
 MEifx1+gtLOb+ejU53tokOw2DRps
X-Google-Smtp-Source: APXvYqxOgF2f4mdIggllw24hjGwGkw/+hol/PFvXKlXFVN3tMFInoj78tEP8recAhkdMcCQInDe8jQ==
X-Received: by 2002:a1c:2e0a:: with SMTP id u10mr19613638wmu.92.1560771255826; 
 Mon, 17 Jun 2019 04:34:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ad86:6268:1a78:d4c])
 by smtp.gmail.com with ESMTPSA id s188sm12062110wmf.40.2019.06.17.04.34.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 04:34:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: remove the backing store if no placement is given
Date: Mon, 17 Jun 2019 13:34:09 +0200
Message-Id: <20190617113413.1869-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617113413.1869-1-christian.koenig@amd.com>
References: <20190617113413.1869-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=WlVYh4DzLWMqrEKixUmzBjOGjRAW1iEzj5suLnYUXfuO9/ZmMxcDohklq2k29/+kgv
 QkitA5eVjO5EZqpcTnNxCCUc9N5Ouqzv+0Lfw0DcsXmz9UgpCQFXwFJID7nfbUjgVRPd
 Td0mcSiDDotAyiQy33P+hwjuEFq+qKVWgjt5glqo9A0jPAIs38oUzHe80FGu4cOzye0E
 6OBnLw4dYoUzoC/je+r7VJNhGmOcMq3BIrv9aiful45GBphDGwFrF+YWUrrOp33SMw7t
 v5WMqo3NDGHVopnVcpKZ8UTou4o5fj5X9n61mZiDy96zwdHq3/9tqKNj9x4MyiuhL+1l
 yJyA==
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

UGlwZWxpbmUgcmVtb3ZhbCBvZiB0aGUgQk9zIGJhY2tpbmcgc3RvcmUgd2hlbiBubyBwbGFjZW1l
bnQgaXMgZ2l2ZW4KZHVyaW5nIHZhbGlkYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBjN2RlNjY3ZDQ4MmEuLjY4MmExYTAzNWIzNSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMjQwLDYgKzEyNDAsMTggQEAgaW50IHR0bV9ib192YWxp
ZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXVpbnQzMl90IG5ld19mbGFnczsK
IAogCXJlc2VydmF0aW9uX29iamVjdF9hc3NlcnRfaGVsZChiby0+cmVzdik7CisKKwkvKgorCSAq
IFJlbW92ZSB0aGUgYmFja2luZyBzdG9yZSBpZiBubyBwbGFjZW1lbnQgaXMgZ2l2ZW4uCisJICov
CisJaWYgKCFwbGFjZW1lbnQtPm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC0+bnVtX2J1c3lf
cGxhY2VtZW50KSB7CisJCXJldCA9IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsKKwkJaWYg
KHJldCkKKwkJCXJldHVybiByZXQ7CisKKwkJcmV0dXJuIHR0bV90dF9jcmVhdGUoYm8sIGZhbHNl
KTsKKwl9CisKIAkvKgogCSAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBtb3ZlIGJ1ZmZlci4K
IAkgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
