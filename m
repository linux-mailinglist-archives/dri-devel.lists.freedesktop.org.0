Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3784D45D0B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2446089823;
	Fri, 14 Jun 2019 12:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001398935B;
 Fri, 14 Jun 2019 12:41:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id s15so2183223wmj.3;
 Fri, 14 Jun 2019 05:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3KNufnBIVUWKwyOgRWw8DnrVsx2V6k8xRAPzauAykA=;
 b=bbgyAOYAlcxpacZQFeLx8g/CoLi1v0Bx5EE7lP41coAx8C+BnjP+MdG5fnE5EEMvNu
 k6TOohIeZL4i2L+fOQ0AHBy1Cd1q3cJjraNeEGMFLf2RshcfqxJap/oXVmkFii+xbODH
 b8RGflh9/gB9YZ7XJIcNwzVioho7UPd+ymAwlGx8FBKQxyZh5e0aY48LWvHgB4M+BRrk
 shJYhDcrqMtGM2EWzwdhcGt15M/FKWP5bdRc8d24/P88BoYj60DsoEk0mpeGbC5VHRX4
 VJg57duJEqzi1DNkit4pXViazM9fjQzaAxCf+ZW3Wf6yBE7GXKyvk+dMilwIc2/8g7sO
 /wRQ==
X-Gm-Message-State: APjAAAVRChTyhwwm3buLCzfbUtCTNXpaZqMtFbH+RSl5ZndmbJJMTqrQ
 itW7KWs0vyrB64sLe4S3y28=
X-Google-Smtp-Source: APXvYqzTuaZA2po09mTfWbADtCQ6vzLAMrR316sQRMGMfvQSp4NO4+rPhbE1zafrK2aX71rqhjI3Sw==
X-Received: by 2002:a1c:a186:: with SMTP id k128mr8102073wme.125.1560516087737; 
 Fri, 14 Jun 2019 05:41:27 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e0eb:ed4e:b781:3e9f])
 by smtp.gmail.com with ESMTPSA id n1sm2648209wrx.39.2019.06.14.05.41.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:41:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, yuq825@gmail.com, eric@anholt.net,
 peterz@infradead.org, thellstrom@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: ww_mutex deadlock handling cleanup
Date: Fri, 14 Jun 2019 14:41:19 +0200
Message-Id: <20190614124125.124181-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3KNufnBIVUWKwyOgRWw8DnrVsx2V6k8xRAPzauAykA=;
 b=VNIuip9iNwbajuhEqq83zqdoDU2mB3Iz+0C3zEboe0MJYKOBG6e6f56vN2Jl4shncY
 yzu9EWuncAvoaiMHdjo1jIV7CClizTAi7s2oUHJqSd7GPsRf/B9PoM6tNAcjtwlLTdl/
 iD2UYJLiq3zlSwpsQnqfi8spyXsW+hksFUxwM+cA4+Yt2zkrKpssfQ7vvWKXOTRQ833r
 FOpehV3ea5pVmZTgaak+AdKgLXD9NENBgYJbXifPxpWx9TZroSvxa2z1e8tKnnE7rEE7
 OQjt/KHYHl1bujST7OrAVKhiVxLYfupax+W9VmdSsSczvjhvsHeZI1Bzn1Jb0MqgXT0k
 YCgg==
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

VGhlIHd3X211dGV4IGltcGxlbWVudGF0aW9uIGFsbG93cyBkcml2ZXJzIHRvIGFjcXVpcmUgbG9j
a3Mgb24gYSBzZXQgb2YgbG9ja2luZwpwcmltaXRpdmVzIHdpdGggZGV0ZWN0aW9uIG9mIGRlYWRs
b2Nrcy4gSWYgYSBkZWFkbG9jayBoYXBwZW5zIHdlIGNhbiB0aGVuCmJhY2tvZmYgYW5kIHJlYWNx
dWlyZSB0aGUgY29udGVuZGVkIGxvY2sgdW50aWwgd2Ugc2hvdWxkIGZpbmFsbHkgYmUgYWJsZSB0
bwphY3F1aXJlIGFsbCBuZWNlc3NhcnkgbG9ja3MgZm9yIGFuIG9wZXJhdGlvbi4KClRoZSBwcm9i
bGVtIGlzIHRoYXQgaGFuZGxpbmcgdGhvc2UgZGVhZGxvY2tzIHdhcyB0aGUgYnVyZGVuIG9mIHRo
ZSB1c2VyIG9mCnRoZSB3d19tdXRleCBpbXBsZW1lbnRhdGlvbiBhbmQgYXQgbGVhc3Qgc29tZSB1
c2VycyBkaWRuJ3QgZ290IHRoYXQgcmlnaHQKb24gdGhlIGZpcnN0IHRyeS4KClNvIHRoaXMgcGF0
Y2ggYWRkcyB0d28gbWFjcm9zIHRvIGxvY2sgYW5kIHVubG9jayBtdWx0aXBsZSB3d19tdXRleCBp
bnN0YW5jZXMKd2l0aCB0aGUgbmVjZXNzYXJ5IGRlYWRsb2NrIGhhbmRsaW5nLiBJJ20gbm90IGEg
YmlnIGZhbiBvZiBtYWNyb3MsIGJ1dCBpdCBzdGlsbApiZXR0ZXIgdGhlbiBpbXBsZW1lbnRpbmcg
dGhlIHNhbWUgbG9naWMgYXQgbGVhc3QgaGFsdmUgYSBkb3plbiB0aW1lcy4KClBsZWFzZSBub3Rl
IHRoYXQgb25seSB0aGUgZmlyc3QgdHdvIHBhdGNoZXMgYXJlIG1vcmUgdGhhbiBjb21waWxlIHRl
c3RlZC4KQW5kIHRoaXMgb25seSBjbGVhbnMgdXAgdGhlIHRpcCBvZiB0aGUgaWNlYmVyZywganVz
dCBlbm91Z2ggdG8gc2hvdyB0aGUKcG90ZW50aWFsIG9mIHRob3NlIHR3byBtYWNyb3MuCgpQbGVh
c2UgcmV2aWV3IGFuZC9vciBjb21tZW50LApDaHJpc3RpYW4uCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
