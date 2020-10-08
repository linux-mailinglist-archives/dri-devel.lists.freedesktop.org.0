Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229E287083
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 10:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFBA6EA3E;
	Thu,  8 Oct 2020 08:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA356EA3E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 08:10:16 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id c22so6820427ejx.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 01:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kyF7Q7Jij+WMhi1ATXfqPByemGcEx/t5FoN2ScmUxN0=;
 b=DAbFTuB9eyP+2iw49Nel8SNbKmXjKL1GLiuMrZMZl+exrPkCGfJ0iu3CJenCydoEpB
 kdyapFvOM74GQZoxtVLWNX2gdeZLqcvB24+eKabERdHObimdnmJ0pFEsB4/SBHD/ZpXV
 E6pGq+3h2v9DYK53binj03SEL3gR81zyqMwOS4qnM/GdOrHh2OwnNELx9VhsLNfJ6Cgl
 vYJb3t3WQE0Etx/3uPbXib1ScvvzDTNHL1bhMtrdgfxP2x4oKVrOAZAkDT3kg9wEp9dW
 VUkCOlE75dILQS6KqeKVuyIFFJ3PfSVO+jA79w6lrNPkGaBwD+mqKGvLtGOfPbJoV95K
 dvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kyF7Q7Jij+WMhi1ATXfqPByemGcEx/t5FoN2ScmUxN0=;
 b=rtt+QKLy51MlGltGJ66dSfNpEUub6mhhY99gwNQ/PmKwmbFTRWvRwknM11klKOlpA2
 9m2aQvI2QkQkKNyMgleU6a3kKbxQcLkIyGwI0ZPLd3w9iK4evHgEaUi83dSqi2V3iamM
 4TNig4Cyp8eldYosieZxD/USHprFkXY79UQcBf/4wilH+QHVoZGFL/rnriVCsY15opxr
 v0J95hKu3r1fdf0i02y9Xg80Y6yS985WBTEbHuwTCGcp/aMWRBIvMxqfIW+w8RuW1yp8
 lfpzhwTsZhVfnYCYAZTqYwP8UB9dD9I8dbFC7EOP6lcHLCbjI4JeOGNsiM/VFsPsGOix
 Q3Ig==
X-Gm-Message-State: AOAM5338G15cXheaMqqAtjowTQZVyfeoNrjkLOFOZcHo18V9QTUzQn03
 7HzVSTKC6s2ycsNOyuZs/Lc=
X-Google-Smtp-Source: ABdhPJyT06Bp3zdwPZAzyVicXb67EvjI9bgjxiL+jlBFhFhMBdMH5XJlZa6hcv56s73ca8jIAv607w==
X-Received: by 2002:a17:906:1f53:: with SMTP id
 d19mr7409558ejk.255.1602144614921; 
 Thu, 08 Oct 2020 01:10:14 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:a581:54df:e21e:7499])
 by smtp.gmail.com with ESMTPSA id yd18sm3475541ejb.10.2020.10.08.01.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 01:10:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: gustavoars@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: use struct_size macro
Date: Thu,  8 Oct 2020 10:10:13 +0200
Message-Id: <20201008081013.27384-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBtYW51YWxseSBjYWxjdWxhdGluZyB0aGUgc3RydWN0dXJlIHNpemUuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYv
ZG1hLXJlc3YuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCmluZGV4IDFjOGYyNTgxY2Iw
OS4uYmI1YTQyYjEwYzI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwor
KysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwpAQCAtNjMsNyArNjMsNyBAQCBzdGF0aWMg
c3RydWN0IGRtYV9yZXN2X2xpc3QgKmRtYV9yZXN2X2xpc3RfYWxsb2ModW5zaWduZWQgaW50IHNo
YXJlZF9tYXgpCiB7CiAJc3RydWN0IGRtYV9yZXN2X2xpc3QgKmxpc3Q7CiAKLQlsaXN0ID0ga21h
bGxvYyhvZmZzZXRvZih0eXBlb2YoKmxpc3QpLCBzaGFyZWRbc2hhcmVkX21heF0pLCBHRlBfS0VS
TkVMKTsKKwlsaXN0ID0ga21hbGxvYyhzdHJ1Y3Rfc2l6ZShsaXN0LCBzaGFyZWQsIHNoYXJlZF9t
YXgpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWxpc3QpCiAJCXJldHVybiBOVUxMOwogCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
