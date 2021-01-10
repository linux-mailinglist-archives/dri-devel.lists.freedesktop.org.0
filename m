Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE6E2F04C8
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jan 2021 03:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932289D43;
	Sun, 10 Jan 2021 02:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7078089BAB
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 02:11:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r3so12728031wrt.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jan 2021 18:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHh/PotdFl8qKlM9O+/UCzSj0fz6Apt0vpIe4lKp9dE=;
 b=U8nfYp58Zik5lmOVjNNUxUJPZB4niuxBIyalahDX8FWnVOPTkMpynnBs8gjF6BQOBz
 BzU5J6zkZne7BUP6D+1GQiIxK9AnMsEJhy9PVuBV4u/2uJT7hSdyr0FxqCRW4B6caKmu
 A0/Zbj3vHV4O+rnyP1PT+K7LTcn05pxS3dz58WRXMmtsfLDePRIvGSAf+e1XPEyUEcLh
 d4Yg3ta8+BJf8Bzb4X1wqGtA3aLg3/aN2G79TMQeZM5qG1MoJQTau1wM6dHsNWXpmibv
 tQG074M6Jg6pxV8y7l0f7gRgE/28b2ORB6m6jc5eApkfkGdN7izLK/fzyr1nAo5YK/Pt
 5GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHh/PotdFl8qKlM9O+/UCzSj0fz6Apt0vpIe4lKp9dE=;
 b=iUjRYWrVD66EE1B5mnU2RcA9jnElEFsz+nv4g7yeQ9BwGSSOLxBRenxR+5TfDj+CAV
 FnXxbyZeXF3Ikk3UC2Lkm0UqZL4JcptxRBCppR/ijwAN9h0De6MCxLBH+h/9TrSp9qa0
 KqMG7OkeI98GlsSZHYirq5OjMAw/TZMnzI/rJ3puS0Xk/qBowblrSZnG45ZynIo0tAfO
 xAvcldh+T8WsUo88T4lzfVwyRF9Z0LCU31UVv5VbiM/MZkGlJlZlJ8EMCy7KabsV1B/T
 oK4GLEI9xZub1TUIal5qytSgsfIgH5zqcfWl5hnTWOQVjS/ZKU2hiGCFIrgIKwkttpDd
 ut2g==
X-Gm-Message-State: AOAM531CdHr9fxmnbCp9wMfy0YsPVJ4zVQByHIGvaYe1118n3t9RycjW
 nhEoBZ6xfjQBTZxUPzkEHllfNnwRRIhU5Q==
X-Google-Smtp-Source: ABdhPJwEHvvEVEkY22I+tzh63G8yn75NDuGVpSYW3Df/THsItUpV0s3sxgzO3thketw5a1OqiT04Qg==
X-Received: by 2002:adf:e688:: with SMTP id r8mr10040861wrm.20.1610244674869; 
 Sat, 09 Jan 2021 18:11:14 -0800 (PST)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id o124sm17736882wmb.5.2021.01.09.18.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 18:11:14 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: Check actual format for legacy pageflip.
Date: Sun, 10 Jan 2021 03:11:42 +0100
Message-Id: <20210110021142.28221-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.29.2
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org, zhan.liu@amd.com,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBtb2RpZmllcnMgb25lIGNhbiBhY3R1YWxseSBoYXZlIGRpZmZlcmVudCBmb3JtYXRfaW5m
byBzdHJ1Y3RzCmZvciB0aGUgc2FtZSBmb3JtYXQsIHdoaWNoIG5vdyBtYXR0ZXJzIGZvciBBTURH
UFUgc2luY2Ugd2UgY29udmVydAppbXBsaWNpdCBtb2RpZmllcnMgdG8gZXhwbGljaXQgbW9kaWZp
ZXJzIHdpdGggbXVsdGlwbGUgcGxhbmVzLgoKSSBjaGVja2VkIG90aGVyIGRyaXZlcnMgYW5kIGl0
IGRvZXNuJ3QgbG9vayBsaWtlIHRoZXkgZW5kIHVwIHRyaWdnZXJpbmcKdGhpcyBjYXNlIHNvIEkg
dGhpbmsgdGhpcyBpcyBzYWZlIHRvIHJlbGF4LgoKU2lnbmVkLW9mZi1ieTogQmFzIE5pZXV3ZW5o
dWl6ZW4gPGJhc0BiYXNuaWV1d2VuaHVpemVuLm5sPgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KUmV2aWV3ZWQtYnk6IFpoYW4gTGl1IDx6aGFuLmxp
dUBhbWQuY29tPgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpGaXhlczogODE2ODUzZjlkYzQwICgiZHJtL2FtZC9kaXNwbGF5OiBTZXQgbmV3IGZvcm1hdCBp
bmZvIGZvciBjb252ZXJ0ZWQgbWV0YWRhdGEuIikKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3Bs
YW5lLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYwppbmRleCBlNjIzMTk0N2Y5ODcuLmEwY2I3NDZiY2Iw
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcGxhbmUuYwpAQCAtMTE2Myw3ICsxMTYzLDE0IEBAIGludCBkcm1fbW9kZV9w
YWdlX2ZsaXBfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAocmV0KQogCQlnb3Rv
IG91dDsKIAotCWlmIChvbGRfZmItPmZvcm1hdCAhPSBmYi0+Zm9ybWF0KSB7CisJLyoKKwkgKiBP
bmx5IGNoZWNrIHRoZSBGT1VSQ0MgZm9ybWF0IGNvZGUsIGV4Y2x1ZGluZyBtb2RpZmllcnMuIFRo
aXMgaXMKKwkgKiBlbm91Z2ggZm9yIGFsbCBsZWdhY3kgZHJpdmVycy4gQXRvbWljIGRyaXZlcnMg
aGF2ZSB0aGVpciBvd24KKwkgKiBjaGVja3MgaW4gdGhlaXIgLT5hdG9taWNfY2hlY2sgaW1wbGVt
ZW50YXRpb24sIHdoaWNoIHdpbGwKKwkgKiByZXR1cm4gLUVJTlZBTCBpZiBhbnkgaHcgb3IgZHJp
dmVyIGNvbnN0cmFpbnQgaXMgdmlvbGF0ZWQgZHVlCisJICogdG8gbW9kaWZpZXIgY2hhbmdlcy4K
KwkgKi8KKwlpZiAob2xkX2ZiLT5mb3JtYXQtPmZvcm1hdCAhPSBmYi0+Zm9ybWF0LT5mb3JtYXQp
IHsKIAkJRFJNX0RFQlVHX0tNUygiUGFnZSBmbGlwIGlzIG5vdCBhbGxvd2VkIHRvIGNoYW5nZSBm
cmFtZSBidWZmZXIgZm9ybWF0LlxuIik7CiAJCXJldCA9IC1FSU5WQUw7CiAJCWdvdG8gb3V0Owot
LSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
