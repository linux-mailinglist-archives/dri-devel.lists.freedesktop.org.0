Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE93604CB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 10:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0726E51B;
	Thu, 15 Apr 2021 08:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAE16E51B;
 Thu, 15 Apr 2021 08:47:33 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id r12so35669221ejr.5;
 Thu, 15 Apr 2021 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uTEJvMIv6d5A6NGqm3rSMipXKkQ55K2hXyICccxQwVI=;
 b=ajReyd7VtZ91wArsxhJdpdK+W4hILYqtvBbDKb8MXcEX//+kJFD9VS/Gpf5c5fq0E5
 WNuV8TQK1/CEjwUtIsafRxJVtdu6bn+gF9HX6PboyxfyE/UG0CLRY8Czm4B3QylLwP9r
 1yrjUlkLzrttk9qFaBbLB2kBJAomNMmCtMD2sTvjzjzC2sFbngM2CjnbSCbTDCRg/eWE
 Vve0IxIXZlL3DUcIaIP/fy+G7vBCK41BmiHiCWCfn68ilSln9V+sU+xOv5AcKXZ9xt0d
 fH0ZMAZEwNHxeT+iXad2k+KDxQMYyVoleftxT6w9pfmGH13TO6hhZGE2lmNxhUG9hAjq
 zjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uTEJvMIv6d5A6NGqm3rSMipXKkQ55K2hXyICccxQwVI=;
 b=AFWjzu2/K7e7nSNjLHb8t6chXFHdNamLAWoFVouLtqczFPZ7DyvxMl8lpW49NXCNAF
 gjnAXA4aXYL1r+2Vc8eV+W+5OMZ7Qg2QedwqsqfePXMCq3KEpSYs2k03rP1XYYLFlnyu
 TH1HfGeFFdMDMQW12mKegNs7HZq/5D0VoCK73hfETuQPGa6tqf+mFYZeXKZkK6DtC6cV
 80uz7xXS1YE6G6MsGaOfNjW1kig7S0DJZCz6fjtbandcf4TZz0nk7H4Ba3xlZ+VPofDf
 wrPRLGs6pyItJ1oHVmvmglaB08osho8YC9xfxHf4mCmDr8ZLOFQqqKNFk1y1noYQDRlC
 d/Rw==
X-Gm-Message-State: AOAM532ktZLV0iLiWQ8WTgdvkZZMN5LPnixq32YsgaSKHv06wXNSHU2T
 nayCEV9qmqmtqrf3yuOwrZdGpa+rNiU=
X-Google-Smtp-Source: ABdhPJzgVFp/d5MVI1NVW7cjdN2d4q76ZQDjeBtydW/NyfQr/4ok2pbEy1dDILwQOxgIUDt0oZnMVw==
X-Received: by 2002:a17:907:d1b:: with SMTP id
 gn27mr2310113ejc.227.1618476451942; 
 Thu, 15 Apr 2021 01:47:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3ba1:ccd9:cd93:a8ed])
 by smtp.gmail.com with ESMTPSA id a9sm1830049eds.33.2021.04.15.01.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 01:47:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: make sure we unpin the UVD BO
Date: Thu, 15 Apr 2021 10:47:28 +0200
Message-Id: <20210415084730.2057-1-christian.koenig@amd.com>
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

UmVsZWFzaW5nIHBpbm5lZCBCT3MgaXMgaWxsZWdhbCBub3cuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMKaW5kZXggN2NkNjdjYjJh
YzVmLi4xYTJiZjJjYTFiZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3V2ZF92N18wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYwpA
QCAtMzYzLDYgKzM2Myw3IEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX3JpbmdfdGVzdF9pYihz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkKIAogZXJyb3I6CiAJZG1hX2Zl
bmNlX3B1dChmZW5jZSk7CisJYW1kZ3B1X2JvX3VucGluKGJvKTsKIAlhbWRncHVfYm9fdW5yZXNl
cnZlKGJvKTsKIAlhbWRncHVfYm9fdW5yZWYoJmJvKTsKIAlyZXR1cm4gcjsKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
