Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D430D1D107B
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 13:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001776EA12;
	Wed, 13 May 2020 11:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFEE6EA0E;
 Wed, 13 May 2020 11:03:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so20337895wrt.1;
 Wed, 13 May 2020 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3Rl3fJSHP0IWBOgTAAtiu/g9jX9dZcldLgfmXCENR84=;
 b=aU0xyT6xQk5bJg5ObFLnBiLFhdhhrwAsTtzjmICkChI2W5hMrSUoVFfpMu4YDhFBo6
 EBff7ZNahzmAOJPfPFXlOc3FbVZyglmQQc5W390E+bnzUDvAgNuFM/Rg1EFoSgNQU24s
 YFn5zCcCc+btQGQAb2UjTwflVJ8wh38QqGqHSoIvrJVCxNcZsJn6OITBfTsOMuq5oWmt
 XJ53kXy2FSjxZrkFfSVw3djxmGK9xHUxgQgEG6Ku45hvj8xmXopp+UL+T8qPBbsG3Gis
 EPCZD7ExOex9jrytJk2DJbDgmfLit/TIGz1Bs1DvLVkry1n0nJWsYI1Ag4HWQorK0Znq
 C2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Rl3fJSHP0IWBOgTAAtiu/g9jX9dZcldLgfmXCENR84=;
 b=Ot8SqL9f8HUz0jYrZAIpErx9P14WAlv0xKnnzUQTbg8Og2xbGDd4Y2EGm8H2d+m2uX
 RonoezcwzZUBijk+6+2/DhtqcKwKAid+w7ENtD4SaHYjs3qqKx3DvX73TgHYfcYgSJYe
 0lPVL08s2u5MuYP3AR+UWplRpGw3QN/RR9FvDP54WdTaD1TmQ2HYbqtvDptX34OPe0E+
 9D+3KoxwmGGyM62iUlpIms9H3KRPSL9iRzQgrTBICO88my3HxdHggVl2ZCBe6kHeKMWm
 mgVgJ4/AVKc8SsVUkdJ9/mhP2joe8Moq9Vn9KYuesZ/R2jrlwtroSw54Ycwoi0A0iz42
 R1Dw==
X-Gm-Message-State: AGi0PuagFV9hqMLLZb57tGlvA5N2bTrE7ZHEAhtRUqi1K6chW38qjjjS
 H4bRI+yKG0SZbq/tkLgtB3DjvTE8
X-Google-Smtp-Source: APiQypLOs5PszEudBZ+dzPov+EOIyKXMl6RRw54sREAfI5UttZaYJ8oIfa78U4gbBB/7/Io69yqw4g==
X-Received: by 2002:a5d:694c:: with SMTP id r12mr23865544wrw.200.1589367796989; 
 Wed, 13 May 2020 04:03:16 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:78fa:bd2b:6c37:2c35])
 by smtp.gmail.com with ESMTPSA id z3sm27806975wrm.81.2020.05.13.04.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:03:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, debian-powerpc@lists.debian.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/radeon: disable AGP by default
Date: Wed, 13 May 2020 13:03:12 +0200
Message-Id: <20200513110313.12979-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513110313.12979-1-christian.koenig@amd.com>
References: <20200513110313.12979-1-christian.koenig@amd.com>
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

QWx3YXlzIHVzZSB0aGUgUENJIEdBUlQgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5kZXggYmJiMDg4M2U4Y2U2Li5h
NzFmMTMxMTZkNmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCkBAIC0xNzEsMTIg
KzE3MSw3IEBAIGludCByYWRlb25fbm9fd2I7CiBpbnQgcmFkZW9uX21vZGVzZXQgPSAtMTsKIGlu
dCByYWRlb25fZHluY2xrcyA9IC0xOwogaW50IHJhZGVvbl9yNHh4X2F0b20gPSAwOwotI2lmZGVm
IF9fcG93ZXJwY19fCi0vKiBEZWZhdWx0IHRvIFBDSSBvbiBQb3dlclBDIChmZG8gIzk1MDE3KSAq
LwogaW50IHJhZGVvbl9hZ3Btb2RlID0gLTE7Ci0jZWxzZQotaW50IHJhZGVvbl9hZ3Btb2RlID0g
MDsKLSNlbmRpZgogaW50IHJhZGVvbl92cmFtX2xpbWl0ID0gMDsKIGludCByYWRlb25fZ2FydF9z
aXplID0gLTE7IC8qIGF1dG8gKi8KIGludCByYWRlb25fYmVuY2htYXJraW5nID0gMDsKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
