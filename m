Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB2C3630A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645D4893DB;
	Wed,  5 Jun 2019 17:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69003893DB;
 Wed,  5 Jun 2019 17:57:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s57so11903377qte.8;
 Wed, 05 Jun 2019 10:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DxPZGWULHVHiQD7iuWAQCMFl2/vsENlvc/1ESs78Eno=;
 b=hfc96i0doi03eYgKViQu+z/vcq1ddIt9NpDMvj2LB9VjJpdRVPwIqowGV8QNIdvCNZ
 Xi2U/R0V+9/Llu3I9O39eTQ47aRKDtqAWagR5v+U7k2kwFwfSAAm1tLXWq1uUSTqsI8+
 dSK87SScJxMC1eHb+Kr8xCZZzHOBtXL70mcKU7RzbZXC3ggY9QwavM9MtEPVPM9p7VNv
 0k0rT867BJi4NhWcyx6rRVyGlG2rC9fls9VmlwrZ52MbsI5AuOIDvEUPqgC1RHO0LxEi
 7aImu+nv1u3lEgDphxYHU8VvsV7PXGnPgxzBSNUsWPQqGUESA7QsZQWZ3R3j/34QYMv4
 j5eg==
X-Gm-Message-State: APjAAAV6wvC2hyonP+RMGHu/Ihps00PM3Ml4nVFVTU1aUAo84+rXACMN
 wZfxL/fbSYyIgV34+dqwTPlfgjWo
X-Google-Smtp-Source: APXvYqzh+bx2G9gCtsIpYyY5/MtMRCp2486pSDG0tZUve++pJjgVi2tiRtMWW2CtWkMerQKWrrfKFA==
X-Received: by 2002:ac8:b45:: with SMTP id m5mr6349432qti.259.1559757431405;
 Wed, 05 Jun 2019 10:57:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
 by smtp.gmail.com with ESMTPSA id
 d141sm6954700qke.3.2019.06.05.10.57.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 10:57:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: l.stach@pengutronix.de
Subject: [PATCH] drm/etnaviv: Use devm_platform_ioremap_resource()
Date: Wed,  5 Jun 2019 14:57:02 -0300
Message-Id: <20190605175702.6545-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DxPZGWULHVHiQD7iuWAQCMFl2/vsENlvc/1ESs78Eno=;
 b=VexKZky58+dz3SiehDgbr+TujvjIVPugeZrwW75ET0Uc9OM2KXsZDx2lLPM7Pzjqqt
 IA3MMVhenL/KDAcXQmJHkBTNgMUxh9/Jm+FSkYInf2b2hblbWcLyRPwUefiZ6kLySGuN
 9y+cfx/cv8ZLK2Xd8Q2CTg9SQSCE9StalmC3/ZmRhEHlGtXcGxXFyIJpCA21KAwd6w+k
 +RAOIfFB5pzd17qFJ2Np+l3xyU/0f0MiU6l3lwfODx3vjDAcxY1ZEkibnSrWnOJciag7
 SAnj8+etD4+XseK9wl4Qt35xhzF8PQ3BwHW+VEM1JtnP1smxWVSh1jFR5Ad07GPXv5Q/
 nQyQ==
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux+etnaviv@armlinux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5IHRoZSBjb2Rl
IGEgYml0LgoKU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgfCA0ICstLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jIGIvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9ncHUuYwppbmRleCA3MmQwMWU4NzMxNjAuLmE0ZmYxZWU0MWJmYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jCkBAIC0xNzExLDcgKzE3MTEsNiBA
QCBzdGF0aWMgaW50IGV0bmF2aXZfZ3B1X3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1
Y3QgZXRuYXZpdl9ncHUgKmdwdTsKLQlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAlpbnQgZXJyOwog
CiAJZ3B1ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpncHUpLCBHRlBfS0VSTkVMKTsKQEAg
LTE3MjMsOCArMTcyMiw3IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9ncHVfcGxhdGZvcm1fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAltdXRleF9pbml0KCZncHUtPmZlbmNlX2xv
Y2spOwogCiAJLyogTWFwIHJlZ2lzdGVyczogKi8KLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2UocGRldiwgSU9SRVNPVVJDRV9NRU0sIDApOwotCWdwdS0+bW1pbyA9IGRldm1faW9yZW1hcF9y
ZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOworCWdwdS0+bW1pbyA9IGRldm1fcGxhdGZvcm1faW9y
ZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKIAlpZiAoSVNfRVJSKGdwdS0+bW1pbykpCiAJCXJldHVy
biBQVFJfRVJSKGdwdS0+bW1pbyk7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
