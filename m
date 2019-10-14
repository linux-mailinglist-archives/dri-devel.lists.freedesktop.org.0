Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCA3D6311
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D782E6E2D1;
	Mon, 14 Oct 2019 12:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732A66E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 7so17172910wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L6DFI3lr21cxldQszCfNagwz6ouXjHUUOPmyE9u059w=;
 b=KqkUakKtBaLigBc3ecNGqjOWMvAIQwmtUe5FchKQ+UuNA4jNat9S2vpwPmHT7Y7/fL
 PG7PXC7yV/2dtxdLM+xZlk/+AtYUJ0j3Q8cnMfT0xc1DYjRotwF6LY8d9szthVkeRMU+
 J4UM15g+mxH+ryUHPSZGMjIn7ErvxoFk97IZzUali5vOsrbqkAlOOuOgGJKPa27XmK7n
 B/zOSbuispsJGbuUKpluqY4O2OoawBxVLhKKMfM5yqlQwqalrhJvOMnOuBG41+ZzBXC6
 pTt0TyfI8Rhy6OD+NnO+Z6C0HUcmMgNccvFuBZTBrO+Gf+uIyAoap/jB5xpYFp/ApjeR
 gRZQ==
X-Gm-Message-State: APjAAAVggoFsNjpObqKMoo/F8HsOTDaxPBKEcuCZjrzGTYABR2Blljxz
 Mxn5vqy3VzXujDEy5XeoHbg=
X-Google-Smtp-Source: APXvYqyN/LerxskEetZ2/hwohnBAAPRhjP7KDY4Of6Q6oxq2vm6c4N3iagQzsL2fEAFxN5yMJQiWCg==
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr14001743wmj.160.1571057479883; 
 Mon, 14 Oct 2019 05:51:19 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id t123sm31334879wma.40.2019.10.14.05.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:19 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 13/14] drm/tegra: gem: Always map SG tables for DMA-BUFs
Date: Mon, 14 Oct 2019 14:50:48 +0200
Message-Id: <20191014125049.425101-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L6DFI3lr21cxldQszCfNagwz6ouXjHUUOPmyE9u059w=;
 b=iPgItiXtpgKKBpeS125en/RKu/Hj7ylehRo9pfmYEoVm4ncJ24VHPmBL8B8VHBw+3a
 UiB1RotVHIX7OrWZooxiKLMKlVGj7rmjPPWoPvXbnNCHDg0+YvwpA2h3kbpxVeWVORs+
 yHtQR19gSg3+/qHaJCo0doaCnxQWUCocX/Ly5oD5XEE15JDH/DvDa7tNCSgAIbwZRLEO
 nkGkn72PnO6vxoGEGqiszfYpQLNtCQqPYfnvLAb6gBQaiCMvkMiQ38c7TCZlk+SO90nS
 khUeK9b3HJh4m1voNL4vYIGAktkhbts7c9GwdwrvcJgKcgnoHz/bXR+xj8gaFz4WFDeb
 xA9Q==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gYW4gaW1wb3J0
ZXIgd2FudHMgdG8gbWFwIGEgRE1BLUJVRiwgbWFrZSBzdXJlIHRvIGFsd2F5cyBhY3R1YWxseQpt
YXAgaXQsIGlycmVzcGVjdGl2ZSBvZiB3aGV0aGVyIHRoZSBidWZmZXIgaXMgY29udGlndW91cyBv
ciBub3QuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwppbmRl
eCAzMzQ1Y2NlMTQ2NjIuLjAwNzAxY2FkYWNlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpAQCAtNTE2LDE1
ICs1MTYsMTUgQEAgdGVncmFfZ2VtX3ByaW1lX21hcF9kbWFfYnVmKHN0cnVjdCBkbWFfYnVmX2F0
dGFjaG1lbnQgKmF0dGFjaCwKIAogCQlmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2csIGJvLT5udW1f
cGFnZXMsIGkpCiAJCQlzZ19zZXRfcGFnZShzZywgYm8tPnBhZ2VzW2ldLCBQQUdFX1NJWkUsIDAp
OwotCi0JCWlmIChkbWFfbWFwX3NnKGF0dGFjaC0+ZGV2LCBzZ3QtPnNnbCwgc2d0LT5uZW50cywg
ZGlyKSA9PSAwKQotCQkJZ290byBmcmVlOwogCX0gZWxzZSB7CiAJCWlmIChkbWFfZ2V0X3NndGFi
bGUoYXR0YWNoLT5kZXYsIHNndCwgYm8tPnZhZGRyLCBiby0+aW92YSwKIAkJCQkgICAgZ2VtLT5z
aXplKSA8IDApCiAJCQlnb3RvIGZyZWU7CiAJfQogCisJaWYgKGRtYV9tYXBfc2coYXR0YWNoLT5k
ZXYsIHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBkaXIpID09IDApCisJCWdvdG8gZnJlZTsKKwogCXJl
dHVybiBzZ3Q7CiAKIGZyZWU6Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
