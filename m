Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E015F22AB31
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 11:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0A36E876;
	Thu, 23 Jul 2020 09:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBF46E872
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 09:00:03 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id lx13so5550907ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HjxSQalgt3R+17MoPQ0iyuSZQA5bLSN2rt1zCTQ0QbE=;
 b=FpPXqC2uOBqIXrLZvLr9R9UVOTQo6GJuuY1YvH40FeS+lZq/xpA0eXO3BIt6q3gvGu
 /PLXA005MvYjIQCI8SqRYs2jJzUzU+6x4cgEv2j9koNQcSkbHLHWjGF9C8PnF+po72Iv
 Lkno5y9eyqnUaAjFdt6Cw9wwuXfuF7GKeEcPTSOkYyuvWhU+VX4i8Xb+o9iXOiOGg3wk
 VKH/FbWY1h0r+NZgLuS3xd9bJl2M5EHkV+8VneFhQ3XzOp5lMpuf/JWhtsY3uaFkpWH4
 FZ1YkOhCu8J19nUsVfrywxn8rFleJ/cGCGV6YwwnaM34A95/95tBEnq1jmDj3pxeCoI3
 fdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HjxSQalgt3R+17MoPQ0iyuSZQA5bLSN2rt1zCTQ0QbE=;
 b=L/VMhnhzuG8pxV5eUFTTruZBGQ269qSN2BLhiCzUolUji2CGywOTxWunGWtJdmjWzQ
 t8PCqKb+RHeEWy/BA2swagHX6pDrW0UT/y8lCubVUNYYdxLnlEgGDJ+Ad4LH6dPKvcuW
 a/PYMG54e8AFAH5BSpxm+zZJ5Uo94xlpme1Kv3uQk7lh0STANKu77WpgiL64SPpgma0+
 NoZYLRm/SAQ6yPd4hjvweeonoKlkMGQk01WZTVO2Mub3eMbznfp6f8Zb8ctgV13Y0nTv
 l7mR1xkP50TiRG73GB3jBHbCno39B8Uvd0/nWx4lzuH0uz7o0MWd7WO7uYPnd5E3rfNj
 h9VQ==
X-Gm-Message-State: AOAM5307zpBEXRLI/dNpXZAlgJ+/7+l5L32DYwl5MiJAQNZn97YzYQAv
 rdvgKtom4Wjr3Mfpq8hZ9mlUu0rr
X-Google-Smtp-Source: ABdhPJzftqrBENmqePulVEPALfv2ys0tOajnDYiYcr586eX/KuuhHtKxJu0qCTRidKbj/7BOAIuaAg==
X-Received: by 2002:a17:906:50a:: with SMTP id
 j10mr3283200eja.113.1595494801515; 
 Thu, 23 Jul 2020 02:00:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ac36:4026:3820:df1d])
 by smtp.gmail.com with ESMTPSA id e4sm1608323ejx.76.2020.07.23.02.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 02:00:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix pipelined gutting for evictions
Date: Thu, 23 Jul 2020 11:00:00 +0200
Message-Id: <20200723090000.5725-1-christian.koenig@amd.com>
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
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com, Felix.Kuehling@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuJ3QgcGlwZWxpbmUgdGhhdCBkdXJpbmcgZXZpY3Rpb24gYmVjYXVzZSB0aGUgbWVtb3J5
IG5lZWRzCnRvIGJlIGF2YWlsYWJsZSBpbW1lZGlhdGVseS4KClNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jIHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBiYzIyMzBl
Y2I3ZTMuLjEyMjA0MDA1NmEwNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC02NTEsOCArNjUxLDE2
IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2V2aWN0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
CiAJcGxhY2VtZW50Lm51bV9idXN5X3BsYWNlbWVudCA9IDA7CiAJYmRldi0+ZHJpdmVyLT5ldmlj
dF9mbGFncyhibywgJnBsYWNlbWVudCk7CiAKLQlpZiAoIXBsYWNlbWVudC5udW1fcGxhY2VtZW50
ICYmICFwbGFjZW1lbnQubnVtX2J1c3lfcGxhY2VtZW50KQotCQlyZXR1cm4gdHRtX2JvX3BpcGVs
aW5lX2d1dHRpbmcoYm8pOworCWlmICghcGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNl
bWVudC5udW1fYnVzeV9wbGFjZW1lbnQpIHsKKwkJdHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxz
ZSk7CisKKwkJdHRtX3R0X2Rlc3Ryb3koYm8tPnR0bSk7CisKKwkJbWVtc2V0KCZiby0+bWVtLCAw
LCBzaXplb2YoYm8tPm1lbSkpOworCQliby0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsK
KwkJYm8tPnR0bSA9IE5VTEw7CisJCXJldHVybiAwOworCX0KIAogCWV2aWN0X21lbSA9IGJvLT5t
ZW07CiAJZXZpY3RfbWVtLm1tX25vZGUgPSBOVUxMOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
