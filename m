Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD610CBE6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F201B6E845;
	Thu, 28 Nov 2019 15:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7002A89A32
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:37:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z7so28211586wrl.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1T7/AcKP+hhj8SOL+bY3lDT9n71bxZ0GZTUy8vWuG2g=;
 b=qy3hWbU9kETYMvMqP37HkajAq5xA3S5+ewKvj79yfOL9OtV3kfGvO4tlqHz6vaZSKH
 bg2h182Uit0wS+awdTCKRUM03WosmsBX3bGGJTq8eUf1XJV+/994vO4Qyxdg76320G68
 um4c+Lt2LbyY7kZBaCMp/SILI7eoHcUePQ5kj2lKfk5K161A0rba+UZFlWeI8gprmwZ1
 zl27T1qRMCPqWR7mBxTwumwJ7HT9wr/Zr9Q5aop7PHXCcCBM8owb7Ey1MWXwb4G+Pc1r
 pMPt19lAt8IK7cVGesLWm9OviOKXwUnpvwsbV2Ob5qGab+HPyYf/s/3bZONheavQ4xtI
 suJQ==
X-Gm-Message-State: APjAAAXkpLbVnVK9zVUsYnEt0TLcoy52FH9BeLkCEm2STEuvk3TjXhwk
 W4tpqL6Kgt1xcZYVzvUYT6U=
X-Google-Smtp-Source: APXvYqxKLainoNtcc0HDYljhnL3r7ynNz0rfcrAvv/OaB23srWIx2DeO4OnP3I8objnbbNwISXF4/A==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr1044845wrn.19.1574955468937;
 Thu, 28 Nov 2019 07:37:48 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id l26sm10811590wmj.48.2019.11.28.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:48 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Date: Thu, 28 Nov 2019 16:37:35 +0100
Message-Id: <20191128153741.2380419-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1T7/AcKP+hhj8SOL+bY3lDT9n71bxZ0GZTUy8vWuG2g=;
 b=Tpd2Ng5wKj1h9mYegR6CcgORwfu+unKC6Z52kdP+Lh8xc10PYhNiJMKy1fXhyhMNe4
 EVEm0JMyoShZpbXGeWhr8DR0AgVeWVyQXNjxoA6vP0FJeWexKJeo5Ctl4u3sYLoNiaV5
 c5w1G38jZojKpu3AwC3MieqnPKVXIkaaF0Fw1kO1o/e19vzRs9dW1W7zrIqsksMksmis
 c2v8QLm6zuLIvc5WreVea9H2sEdgfwQ1Mz7QZJApfymVkwHJNLCViktOX9GXw+o7Dtja
 11UbqMN2ADA9pIh4RJizyvCeZWzcVkoDmrF9idnwTQ4Wxpj3/yqAtjBFT0IbIMGW5NHP
 w/PQ==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkl0J3Mgbm90IGtub3du
IGF0IGltcG9ydCB0aW1lIHdoZXRoZXIgb3Igbm90IGFsbCB1c2VycyBvZiBhIERNQS1CVUYgd2ls
bApiZSBhYmxlIHRvIGRlYWwgd2l0aCBub24tY29udGlndW91cyBtZW1vcnkuIEVhY2ggdXNlciBu
ZWVkcyB0byB2ZXJpZnkgYXQKbWFwLXRpbWUgd2hldGhlciBpdCBjYW4gYWNjZXNzIHRoZSBidWZm
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyB8IDcgLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCmluZGV4IDZkZmFkNTZlZWUyYi4uYmMx
NWI0MzAxNTZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCkBAIC00NDAsMTMgKzQ0MCw2IEBAIHN0YXRpYyBz
dHJ1Y3QgdGVncmFfYm8gKnRlZ3JhX2JvX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLAog
CQllcnIgPSB0ZWdyYV9ib19pb21tdV9tYXAodGVncmEsIGJvKTsKIAkJaWYgKGVyciA8IDApCiAJ
CQlnb3RvIGRldGFjaDsKLQl9IGVsc2UgewotCQlpZiAoYm8tPnNndC0+bmVudHMgPiAxKSB7Ci0J
CQllcnIgPSAtRUlOVkFMOwotCQkJZ290byBkZXRhY2g7Ci0JCX0KLQotCQliby0+aW92YSA9IHNn
X2RtYV9hZGRyZXNzKGJvLT5zZ3QtPnNnbCk7CiAJfQogCiAJYm8tPmdlbS5pbXBvcnRfYXR0YWNo
ID0gYXR0YWNoOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
