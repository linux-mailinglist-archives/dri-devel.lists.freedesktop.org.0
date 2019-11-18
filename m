Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353DC101B03
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27426EBF8;
	Tue, 19 Nov 2019 08:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB846E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:53 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r7so20455234ljg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P674bIxJrMaTZu7WyWHeQk7pl1v4jGgsVqyyVx6alBQ=;
 b=iB/0F8/Hz20/p/pI6YqCfi0DtVIBaf2ztsieTcvhKbqLb1coZ+4y9LQ927MXa0tZsF
 zeeDSmowvOjJI6cJvmsrSfDN0XjOhKTGcdGSQlwSkhHHdFot/JmB24mC5gXwUZiTRupj
 h6ymZPb3Y5zuAxCzLSe5xnUMhzSXG59BS/nbdUWo1ssrU51+4nzpBqJ1gbv7lzx9QrW/
 p1dmRjL2B+sQbqMOeeRqUCmQ+lNRNYP5nAtX3zGQlZ7aHNWXiFDPUrVN36/sD3vPdDYo
 ksGkqDQnzuAxnVQX1ONQb5cIV/+tfIhPsyIUzrhS7M5rX3F6ptYie9pQl/TVE9ysFBZs
 OQww==
X-Gm-Message-State: APjAAAX7Oz78IFiP6Pe2bX6bkAlzRlblecVa2z6zc0t0FsA4w1DXz0Pc
 PnxmVdAxU0XbptSduSNe1RE=
X-Google-Smtp-Source: APXvYqyKNwb0ymffe6l7/ypszOjAW/NlNd5Bh84no3B7//dxfUL3Cs9VsuYJNsZUe/qA+1C2WhvqfQ==
X-Received: by 2002:a2e:894b:: with SMTP id b11mr935708ljk.118.1574107551702; 
 Mon, 18 Nov 2019 12:05:51 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:51 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 21/29] memory: tegra30-emc: Register as interconnect
 provider
Date: Mon, 18 Nov 2019 23:02:39 +0300
Message-Id: <20191118200247.3567-22-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P674bIxJrMaTZu7WyWHeQk7pl1v4jGgsVqyyVx6alBQ=;
 b=spiEJtRIV5saMeUpajYCQ5oFHAjxhJPP+sC9mcTDqqMXdvDsRBxagGqA6yQnG618qQ
 XC4+PxPoTxlyPBp/5A+idjFiS0nrSgSWBoJhfDLc6Rm6YANYXFe3De9iuz/A7RLEJQRw
 WNY45/rfTpIWcYm6SyktkPyILs5/L6/31tZsNnKF5MvEq0eA/JBla9drANtkjwkO/Z5e
 w2g+bCWaog9t0AJ5fYkpre9fVpuQ3ht2zlDO/4L5waoBCl7WJqbkAcF0EISMMNvlnTAb
 48Dp5EcEQiP2c0Nf+JUabeSlQznSSusiA3QfmJUcyT8XOf/muOwSb8hNEVIuIbRHnMle
 vzew==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RU1DIG5vdyBwcm92aWRlcyBNQyB3aXRoIG1lbW9yeSBiYW5kd2lkdGggdXNpbmcgaW50ZXJjb25u
ZWN0IEFQSS4KClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLWVtYy5jIHwgNSArKysrKwogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5
L3RlZ3JhL3RlZ3JhMzAtZW1jLmMgYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLWVtYy5j
CmluZGV4IGVlMTk0ZThlZDUyMS4uNzMxNmFiNTA1MTFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL21l
bW9yeS90ZWdyYS90ZWdyYTMwLWVtYy5jCisrKyBiL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3Jh
MzAtZW1jLmMKQEAgLTExNzEsNiArMTE3MSwxMSBAQCBzdGF0aWMgaW50IHRlZ3JhX2VtY19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwgZW1jKTsKIAorCS8qIFRlZ3JhMzAgaGFzIERSQU0gY2hhbm5lbCBmaXhlZCBhdCAzMmJp
dCB3aWR0aCAqLworCWVyciA9IHRlZ3JhX2ljY19lbWNfc2V0dXBfaW50ZXJjb25uZWN0KCZwZGV2
LT5kZXYsIDMyIC8gOCk7CisJaWYgKGVycikKKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVk
IHRvIGluaXRpYWxpemUgSUNDOiAlZFxuIiwgZXJyKTsKKwogCXJldHVybiAwOwogCiB1bnNldF9j
YjoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
