Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45CF2288
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 00:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A976EE42;
	Wed,  6 Nov 2019 23:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44D56E0CD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 23:26:06 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id w16so3324pfq.14
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 15:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=OHExp+tEDC2Ckd4KCyaDSPrKz/CgG2oFSWHwrtG6Nuk=;
 b=YERGDzSdeUgL2q4+Tf7izI1TbjA1MM71yM+FIIUps30UYl7i7GYCKmKj57H+pd7LFE
 pm+TrsqZNGt/XCXWDIEK77YBn8UyJu12PGcxs4g134QsvEGMD1YPijT/iEe/oSZJjc++
 altp+zQ74E+0W13gNVneQDoYTcBfuYoKMFuVbYbSsaXBpgKDi/qvQJz7AEhHZqmXq7Td
 ljLM67VPhVYnOxEDhmI3+QnyJWHPnzXTes7sZK+JgNi0deN0FxoaNbZ2xd/GJJj2N53D
 ho6kA6Me/YBX17c32UYMSTI3z8sEvoO7F2XmTI/bA+p5BYkdJln4+AA6QeIjGRdaQXPi
 ZbZw==
X-Gm-Message-State: APjAAAUFcnK8oYOLpqa3S6H+WF+ff9BSfLJ7nc78UzA/wLYLLgL28FZR
 GzOA7TShnYo6+xcH/uxfPiY+/ZFrdF3DQQ==
X-Google-Smtp-Source: APXvYqw+lyIGfoOJx9NcumMhBIdS7SlvcbY2irz9ydE3WS2lDD1iv9VMZkOUmgFplo4egCEImSiASh5dTrFaow==
X-Received: by 2002:a63:7247:: with SMTP id c7mr496438pgn.311.1573082766024;
 Wed, 06 Nov 2019 15:26:06 -0800 (PST)
Date: Wed,  6 Nov 2019 15:25:53 -0800
Message-Id: <20191106232553.76553-1-frkoenig@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH] drm/msm/dpu: Add UBWC support for RGB8888 formats
From: Fritz Koenig <frkoenig@google.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=OHExp+tEDC2Ckd4KCyaDSPrKz/CgG2oFSWHwrtG6Nuk=;
 b=hB5JsGIVBCVe0yAEVD1QoBFXIRnU5jUy1y5W0BWww6JzDTq785Vz0L54DSpf4k7Pym
 ewgZkLcVkpxRzfGViPWtJw26qBsk3rLYAjJmd0c0b+f+Ok83IYPkuJBdtxzdM/DKkme7
 5VKeZTdmZVSLFbDoOxW0+/y7vxlxwJeQR2g3XVel7onDJ7bXVGwxulyEPtj87iu9cQ2L
 VgDEo4E5beVuXLVaEzKDprnA7iWAjdfOPG22NkzbTKfQcxS1hCWuRpoZ4PBv77NtiESc
 YMHUKOv3mp33jia8LIdBOtYoIX29N8eRRp0bkhgd6JV3PQILVppg1ZAPAyuL0IALRa5k
 swqg==
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
Cc: linux-arm-msm@vger.kernel.org, Fritz Koenig <frkoenig@google.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGFyZHdhcmUgb25seSBuYXRpdmVseSBzdXBwb3J0cyBCR1I4ODg4IFVCV0MuClVCV0Mgc3VwcG9y
dCBmb3IgUkdCODg4OCBjYW4gYmUgaGFkIGJ5IHByZXRlbmRpbmcKdGhhdCB0aGUgYnVmZmVyIGlz
IEJHUi4KClNpZ25lZC1vZmYtYnk6IEZyaXR6IEtvZW5pZyA8ZnJrb2VuaWdAZ29vZ2xlLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZm9ybWF0cy5jICAgIHwgMTgg
KysrKysrKysrKysrKysrKysrCiAuLi4vZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2df
Zm9ybWF0LmggIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9mb3JtYXRzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZm9ybWF0cy5jCmluZGV4IDI0YWI2MjQ5
MDgzYS4uNTI4NjMyNjkwZjFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfZm9ybWF0cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9mb3JtYXRzLmMKQEAgLTQ4OSwxMiArNDg5LDI4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHB1
X2Zvcm1hdCBkcHVfZm9ybWF0X21hcF91YndjW10gPSB7CiAJCXRydWUsIDQsIERQVV9GT1JNQVRf
RkxBR19DT01QUkVTU0VELAogCQlEUFVfRkVUQ0hfVUJXQywgMiwgRFBVX1RJTEVfSEVJR0hUX1VC
V0MpLAogCisJLyogQVJHQjg4ODggYW5kIEFCR1I4ODg4IHB1cnBvc2VseSBoYXZlIHRoZSBzYW1l
IGNvbG9yCisJICogb3JkZXJpbmcuICBUaGUgaGFyZHdhcmUgb25seSBzdXBwb3J0cyBBQkdSODg4
OCBVQldDCisJICogbmF0aXZlbHkuCisJICovCisJSU5URVJMRUFWRURfUkdCX0ZNVF9USUxFRChB
UkdCODg4OCwKKwkJQ09MT1JfOEJJVCwgQ09MT1JfOEJJVCwgQ09MT1JfOEJJVCwgQ09MT1JfOEJJ
VCwKKwkJQzJfUl9DciwgQzBfR19ZLCBDMV9CX0NiLCBDM19BTFBIQSwgNCwKKwkJdHJ1ZSwgNCwg
RFBVX0ZPUk1BVF9GTEFHX0NPTVBSRVNTRUQsCisJCURQVV9GRVRDSF9VQldDLCAyLCBEUFVfVElM
RV9IRUlHSFRfVUJXQyksCisKIAlJTlRFUkxFQVZFRF9SR0JfRk1UX1RJTEVEKFhCR1I4ODg4LAog
CQlDT0xPUl84QklULCBDT0xPUl84QklULCBDT0xPUl84QklULCBDT0xPUl84QklULAogCQlDMl9S
X0NyLCBDMF9HX1ksIEMxX0JfQ2IsIEMzX0FMUEhBLCA0LAogCQlmYWxzZSwgNCwgRFBVX0ZPUk1B
VF9GTEFHX0NPTVBSRVNTRUQsCiAJCURQVV9GRVRDSF9VQldDLCAyLCBEUFVfVElMRV9IRUlHSFRf
VUJXQyksCiAKKwlJTlRFUkxFQVZFRF9SR0JfRk1UX1RJTEVEKFhSR0I4ODg4LAorCQlDT0xPUl84
QklULCBDT0xPUl84QklULCBDT0xPUl84QklULCBDT0xPUl84QklULAorCQlDMl9SX0NyLCBDMF9H
X1ksIEMxX0JfQ2IsIEMzX0FMUEhBLCA0LAorCQlmYWxzZSwgNCwgRFBVX0ZPUk1BVF9GTEFHX0NP
TVBSRVNTRUQsCisJCURQVV9GRVRDSF9VQldDLCAyLCBEUFVfVElMRV9IRUlHSFRfVUJXQyksCisK
IAlJTlRFUkxFQVZFRF9SR0JfRk1UX1RJTEVEKEFCR1IyMTAxMDEwLAogCQlDT0xPUl84QklULCBD
T0xPUl84QklULCBDT0xPUl84QklULCBDT0xPUl84QklULAogCQlDMl9SX0NyLCBDMF9HX1ksIEMx
X0JfQ2IsIEMzX0FMUEhBLCA0LApAQCAtNTUwLDcgKzU2Niw5IEBAIHN0YXRpYyBpbnQgX2RwdV9m
b3JtYXRfZ2V0X21lZGlhX2NvbG9yX3Vid2MoY29uc3Qgc3RydWN0IGRwdV9mb3JtYXQgKmZtdCkK
IHsKIAlzdGF0aWMgY29uc3Qgc3RydWN0IGRwdV9tZWRpYV9jb2xvcl9tYXAgZHB1X21lZGlhX3Vi
d2NfbWFwW10gPSB7CiAJCXtEUk1fRk9STUFUX0FCR1I4ODg4LCBDT0xPUl9GTVRfUkdCQTg4ODhf
VUJXQ30sCisJCXtEUk1fRk9STUFUX0FSR0I4ODg4LCBDT0xPUl9GTVRfUkdCQTg4ODhfVUJXQ30s
CiAJCXtEUk1fRk9STUFUX1hCR1I4ODg4LCBDT0xPUl9GTVRfUkdCQTg4ODhfVUJXQ30sCisJCXtE
Uk1fRk9STUFUX1hSR0I4ODg4LCBDT0xPUl9GTVRfUkdCQTg4ODhfVUJXQ30sCiAJCXtEUk1fRk9S
TUFUX0FCR1IyMTAxMDEwLCBDT0xPUl9GTVRfUkdCQTEwMTAxMDJfVUJXQ30sCiAJCXtEUk1fRk9S
TUFUX1hCR1IyMTAxMDEwLCBDT0xPUl9GTVRfUkdCQTEwMTAxMDJfVUJXQ30sCiAJCXtEUk1fRk9S
TUFUX0JHUjU2NSwgQ09MT1JfRk1UX1JHQjU2NV9VQldDfSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nX2Zvcm1hdC5oIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2h3X2NhdGFsb2dfZm9ybWF0LmgKaW5kZXggYmI2MTEy
Yzk0OWFlLi5mYmNiM2M0YmJmZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9od19jYXRhbG9nX2Zvcm1hdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9od19jYXRhbG9nX2Zvcm1hdC5oCkBAIC02LDcgKzYsOSBAQAogCiBzdGF0
aWMgY29uc3QgdWludDMyX3QgcWNvbV9jb21wcmVzc2VkX3N1cHBvcnRlZF9mb3JtYXRzW10gPSB7
CiAJRFJNX0ZPUk1BVF9BQkdSODg4OCwKKwlEUk1fRk9STUFUX0FSR0I4ODg4LAogCURSTV9GT1JN
QVRfWEJHUjg4ODgsCisJRFJNX0ZPUk1BVF9YUkdCODg4OCwKIAlEUk1fRk9STUFUX0JHUjU2NSwK
IH07CiAKLS0gCjIuMjQuMC40MzIuZzlkM2Y1ZjViNjMtZ29vZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
