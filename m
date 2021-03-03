Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229C32B90C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 16:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549646E19B;
	Wed,  3 Mar 2021 15:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E09D6E19B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 15:58:00 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p8so16834353ejb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hg2X96E1/emMHJce4+gx+0gGfOSltBwCGBU7E2RTTt8=;
 b=FM8zq8JMV9Qf0L28oIBoYSCl26jL46kgbWyD3MoJNV+XBNlSCrFOJLcaXqdATltLOe
 AdPdPyHSDc2RWedSm82aLtrg33ZxDFrUN7aP2KNDI8dSP51zi6cUpCAyHC7rolPoyeAI
 7r/sQ/VpRiqzmvoF1dTNcsULmYUr4S10PBpiQ5Qf2sJqJnKqxogNTKCNvUJp3kxLosp0
 6kQ1VNTjIGFi3ADVHWIIFSawFPYu1rq8aBM7SXv2YEJPBGKysHYW26m8i7I2xdV6gpfZ
 jb6Z4LWmh7tqawUGNrUGGtpC5VEk8Nu3Ph2Su38U28NlOgLd0Gz5JNDjI405W7DJCAb2
 s1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hg2X96E1/emMHJce4+gx+0gGfOSltBwCGBU7E2RTTt8=;
 b=UtddffSdn5iHy/Tp6qw3QedOkqWXGKXbJg17LZEM1f0xCLnnmbtAbNJAtmZqTQcuU5
 6eLa9wHtXndrE3lq+HcXoMmY0QuQTXqTSkaIpxj1lTuhu0pwD5AjXZFJFq9ro4AKgpAW
 YBzlL18NJA4tZ0JCuUzqXYx2l3c8o5tYKBJcu1YCUlFeTs8zTrXHYRjyCcjXG/ApIpoF
 0H9uJK+tmBKEUHYXogrib8OswGkoK7nD+phLpouQlgcxXfMPahLJ9H4t2pYHyw2XbmZX
 fGKwP9XPdzhb3AOxlAO3IKCbPhopIcqJTwDp4BlmVa9wCbl+zfdUnHdRbFHYgr5T2WEE
 qbUQ==
X-Gm-Message-State: AOAM5301+UOrjv4/0USLavF36/zaq3PQ9Fdjn0Nf7x6qG8lmc5VoqhGC
 QCZM3ryafsLKwUp70UPiGsXjssIJjEP9pg==
X-Google-Smtp-Source: ABdhPJxVRkv0Rc1iXUQgtB1nj0wBToUH1TnbDAYO/oXlRt7myOGKe+WL4yzGaI8LCgoJihrvViCoMg==
X-Received: by 2002:a17:906:aada:: with SMTP id
 kt26mr3674849ejb.137.1614787078776; 
 Wed, 03 Mar 2021 07:57:58 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5325:59de:46ba:e1d6])
 by smtp.gmail.com with ESMTPSA id i6sm17657743ejz.95.2021.03.03.07.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 07:57:58 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: soften TTM warnings
Date: Wed,  3 Mar 2021 16:57:57 +0100
Message-Id: <20210303155757.82497-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

UVhMIGluZGVlZCB1bnJlZnMgcGlubmVkIEJPcyBhbmQgdGhlIHdhcm5pbmdzIGFyZSBzcGFtbWlu
ZyBwZW9wbGVzIGxvZyBmaWxlcy4KCk1ha2Ugc3VyZSB3ZSB3YXJuIG9ubHkgb25jZSB1bnRpbCB0
aGUgUVhMIGRyaXZlciBpcyBmaXhlZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAyMGEyNTY2MGIzNWIuLjI0NWZhMmMwNTkyNyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMzYsNyArMTM2LDggQEAgdm9pZCB0dG1fYm9fbW92ZV90
b19scnVfdGFpbChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2ID0gYm8tPmJkZXY7CiAJc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICpt
YW47CiAKLQlkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKKwlpZiAoIWJvLT5k
ZWxldGVkKQorCQlkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5yZXN2KTsKIAogCWlmIChi
by0+cGluX2NvdW50KSB7CiAJCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOwpAQCAtNTA5LDcgKzUx
MCw3IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQogCQkg
KiBzaHJpbmtlcnMsIG5vdyB0aGF0IHRoZXkgYXJlIHF1ZXVlZCBmb3IKIAkJICogZGVzdHJ1Y3Rp
b24uCiAJCSAqLwotCQlpZiAoV0FSTl9PTihiby0+cGluX2NvdW50KSkgeworCQlpZiAoV0FSTl9P
Tl9PTkNFKGJvLT5waW5fY291bnQpKSB7CiAJCQliby0+cGluX2NvdW50ID0gMDsKIAkJCXR0bV9i
b19tb3ZlX3RvX2xydV90YWlsKGJvLCAmYm8tPm1lbSwgTlVMTCk7CiAJCX0KLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
