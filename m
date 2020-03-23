Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78FA1901AC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593DC6E428;
	Mon, 23 Mar 2020 23:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E1E6E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:12:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id d1so1553115wmb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 16:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNgl4lWOGJ95ga1HdYsjUp4EAhTY9YRhQarh47ivnqo=;
 b=nqCNh755Lu4RRomWisdt4Hb7HBdstTMjwtYsmPnBGahhK+A7Bdc5M7vfHsjffRmY9Y
 bY/g5sebBU+Q1c26YX6dV2TiUDWg4+J/AOpRk0trxTIdKf2c2CqRsNkDBiHcGM4iiwhi
 cLx7XvEKO3t2drg3nWSCOV6vLRFpkdnrW9qgQHw+oesqlf8Rwg+wBjZaNOyYuVln9P75
 78ZxWogyCmhIMZ+qUnnoziBx+9fiMn87exIqOLqUEB8iP9pcElvPQEDLMEvrs+qXppIP
 Fc/d2cGa5cbIFBaymsNqUYq1kU/XIQkCIHePrAEYLq0fbHGQOZKc1nQ2BOdwKPDmn3ps
 Ypyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNgl4lWOGJ95ga1HdYsjUp4EAhTY9YRhQarh47ivnqo=;
 b=Erk4qI8eB55XaXpUV2O1VgGUCWBiFIh4Xmu8W625CUnu6xk2dO29B+WIWNYdtWO1Q5
 LQhqkjkomVVfcKVzuztK4Tde9GFiCr+lI4EagQzGKL+rPH93I/+riNP2OBTsz6MHMrAi
 AcY96VYm330ZQPKw3ymJyP0HYxP+0B+/O7PxH/8RbdBqq02eyzmn5xz9DepTin+YhsKi
 IbN3VNelWzodMZPhf+OzjCTU1oKBNQ8ek9ddkj2d1sBl/9SJ35YG3y/0E1vH8O0l390m
 ytiuGUZqUqPV1PcOWZG2oRbX5ZITKDqmz0b6eU655I0XPuUKjJ3Qb1XdXJmmTIJJlZcB
 gcaA==
X-Gm-Message-State: ANhLgQ3nEPgUrttmAJoiaeaTh8GsMzNG4Y9wfKUQBk4h/8+VROTT00xK
 s3KLbCi/YuaKcRuZ4fJ92ATaGepo
X-Google-Smtp-Source: ADFU+vt15Pj7um4fzAgjtKlPBbiqLDGapxZAtG37vUtqN4qke0/+9C63GnfhGzlYYQ4BEFEn7KW7Cw==
X-Received: by 2002:a1c:dd8b:: with SMTP id u133mr1752638wmg.109.1585005176870; 
 Mon, 23 Mar 2020 16:12:56 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id b82sm1495262wmb.46.2020.03.23.16.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 16:12:56 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 16/17] drm/vmwgfx: Add SM5 param for userspace
Date: Tue, 24 Mar 2020 00:12:37 +0100
Message-Id: <20200323231238.14839-17-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
References: <20200323231238.14839-1-rscheidegger.oss@gmail.com>
MIME-Version: 1.0
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
Cc: linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwuY29tPgoKQWRkIGEgbmV3IHBh
cmFtIGZvciB1c2VyLXNwYWNlIHRvIGRldGVybWluZSBpZiBrZXJuZWwgbW9kdWxlIGlzIFNNNQpj
YXBhYmxlLgoKU2lnbmVkLW9mZi1ieTogRGVlcGFrIFJhd2F0IDxkcmF3YXQuZmxvc3NAZ21haWwu
Y29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0Bz
aGlwbWFpbC5vcmc+ClJldmlld2VkLWJ5OiBSb2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13
YXJlLmNvbT4KU2lnbmVkLW9mZi1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2Fy
ZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfaW9jdGwuYyB8IDMgKysr
CiBpbmNsdWRlL3VhcGkvZHJtL3Ztd2dmeF9kcm0uaCAgICAgICAgIHwgNCArKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9pb2N0
bC5jCmluZGV4IDBhZjQyODc1YmE0ZS4uZjY4MWI3YjRkZjFiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2lvY3RsLmMKQEAgLTExOSw2ICsxMTksOSBAQCBpbnQgdm13X2dldHBhcmFtX2lv
Y3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJY2FzZSBEUk1fVk1XX1BB
UkFNX1NNNF8xOgogCQlwYXJhbS0+dmFsdWUgPSBoYXNfc200XzFfY29udGV4dChkZXZfcHJpdik7
CiAJCWJyZWFrOworCWNhc2UgRFJNX1ZNV19QQVJBTV9TTTU6CisJCXBhcmFtLT52YWx1ZSA9IGhh
c19zbTVfY29udGV4dChkZXZfcHJpdik7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldHVybiAt
RUlOVkFMOwogCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oIGIv
aW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmgKaW5kZXggOGNkNGIzMjE1OTdjLi4wMmU5MTc1
MDc0NzkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCisrKyBiL2lu
Y2x1ZGUvdWFwaS9kcm0vdm13Z2Z4X2RybS5oCkBAIC04Niw2ICs4Niw5IEBAIGV4dGVybiAiQyIg
ewogICoKICAqIERSTV9WTVdfUEFSQU1fU000XzEKICAqIFNNNF8xIHN1cHBvcnQgaXMgZW5hYmxl
ZC4KKyAqCisgKiBEUk1fVk1XX1BBUkFNX1NNNQorICogU001IHN1cHBvcnQgaXMgZW5hYmxlZC4K
ICAqLwogCiAjZGVmaW5lIERSTV9WTVdfUEFSQU1fTlVNX1NUUkVBTVMgICAgICAwCkBAIC0xMDMs
NiArMTA2LDcgQEAgZXh0ZXJuICJDIiB7CiAjZGVmaW5lIERSTV9WTVdfUEFSQU1fRFggICAgICAg
ICAgICAgICAxMgogI2RlZmluZSBEUk1fVk1XX1BBUkFNX0hXX0NBUFMyICAgICAgICAgMTMKICNk
ZWZpbmUgRFJNX1ZNV19QQVJBTV9TTTRfMSAgICAgICAgICAgIDE0CisjZGVmaW5lIERSTV9WTVdf
UEFSQU1fU001ICAgICAgICAgICAgICAxNQogCiAvKioKICAqIGVudW0gZHJtX3Ztd19oYW5kbGVf
dHlwZSAtIGhhbmRsZSB0eXBlIGZvciByZWYgaW9jdGxzCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
