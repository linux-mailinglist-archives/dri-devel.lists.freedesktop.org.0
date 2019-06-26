Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB7568AC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D5A6E3CB;
	Wed, 26 Jun 2019 12:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6156E3A6;
 Wed, 26 Jun 2019 12:23:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n9so2535172wru.0;
 Wed, 26 Jun 2019 05:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=r2I7+LNp/Kp2znpPLS7RjFdR9MU0+ZQMhprA4OAiOdrXCzcVbTSsMFaHOjY12tW72m
 c40KtWmR5xdiuMelZxu06Q07kajvprCVnRXue2elpYoBcvSA/+HUj12rOBk2t5gshNs0
 MBO1T5e1GP/S63Q5TtLuxkb9/KI25eSnAge40gMV5QbWKSnASmUCdOLJVWuiym/bHtUn
 fm4hRXCzxfDjW+iD09pHImWX/7+rs1ZWo/3dsidit32n5xpY3mrxjH2W5e0qex285uEI
 pma/4sXaKFin39zTHOnFLigOkcgDXcpIOah30A79XLpREsrfFbJBPFA3hHF9fetp0wB+
 79AA==
X-Gm-Message-State: APjAAAXhjDJ2KIS0C27cu7RMlIkxUco7CA9SX2TJNNOGM23g1yxPCxUy
 udSwQRdAT5ravHVAU16+Cx2+cqX3
X-Google-Smtp-Source: APXvYqzWQsLFR2WLa/lBUcsxAZf+h27PBpZpIpC6JaNPftzBRj/oPy3U5PxSUNNpsK83ENBbeaH0fg==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr3410726wrn.125.1561551793092; 
 Wed, 26 Jun 2019 05:23:13 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:902c:2dc9:c30e:db03])
 by smtp.gmail.com with ESMTPSA id k125sm2262018wmf.41.2019.06.26.05.23.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 05:23:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: remove the backing store if no placement is given
Date: Wed, 26 Jun 2019 14:23:06 +0200
Message-Id: <20190626122310.1498-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190626122310.1498-1-christian.koenig@amd.com>
References: <20190626122310.1498-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=p4SWdSvRWuCvN86eCS5IOAZxMRTQhsmtGUVCz6G5+xTtHkBf8g3kfGSZyNuVsXz4zO
 dnlQ2MNCB8D7JUZa5Ikm5e6uuxMVrMXOFQhgWpHRY+ITWHn02Iw2GXGgpt/5lD9kv0z7
 HseGM2Iw/cqmI7EFQYKPkEMM8VEl1k1opZuZ3XHDBiy/w3MjonsQk9i1fgrGumP6zlK3
 3nd9S99iQSYxw0737NHcCRpxaSspZa1K/lxPk+C28Yu++XDv0Gw5Mszt/gS3a/2SVTqe
 Sw2wbDjTr9SogtmicTvoSsr2zaeAQdDxsduT7O6+Rlvt/7qiGKdzW09QXUVeIy8/mPhO
 DBvw==
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
