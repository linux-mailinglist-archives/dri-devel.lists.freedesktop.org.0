Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5D2CBD6
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D22D6E231;
	Tue, 28 May 2019 16:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C6C6E22E;
 Tue, 28 May 2019 16:26:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w13so12566804wru.11;
 Tue, 28 May 2019 09:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+aUYs8KrOK4grbSd0Fh2nuQVPFm1teD6ovZh/kTX0TI=;
 b=McVD+4k7iESfBKNMMMGAk6wB9Zj/sComTAWR58q134h8F1RJtAzdjy0nxWXuolWBkA
 lVtMeO8oNoF5AOKbDEnDjs/jEK9XXPPe7nkGkrpx/joqGV0S9/HbIollBAXwDlww/H02
 AZjTKXQjiHqNf9hF86kFt2g7FLDF403EcX6rDgpg9FiO/1hA83njB4h1dN2TyL4wzNUF
 d9+oAOWC1y0OuHwN8PyC7wJoGshsNoXxHVaWLjM5XztglTqGQ98HC1H56FiI+vwPh04d
 J0vt5XtE28SYMW3bubD1Ub68xudVe9nCpi6OF/n/6OpaL49jo+V4WMrTUaOs7+hMPsk1
 1SRg==
X-Gm-Message-State: APjAAAVPVe8bQBjKl95gQhDK1BReeNyevH93pL3vxYAbd2cedovSbBCV
 X8DrnCW9uRI6wSIaxnNjo4ZLxEmG
X-Google-Smtp-Source: APXvYqyeURRcujtWENbyqpcS149df9YFbBsNLTJ6o/Q/GaDa9Em5jbSNYOjYWk8v+REuz256YWD+qw==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr195984wrq.285.1559060768276; 
 Tue, 28 May 2019 09:26:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3163:ab92:73d9:6693])
 by smtp.gmail.com with ESMTPSA id f10sm28835470wrg.24.2019.05.28.09.26.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 09:26:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, Marek.Olsak@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/10] drm/amdgpu: stop removing BOs from the LRU v3
Date: Tue, 28 May 2019 18:25:57 +0200
Message-Id: <20190528162557.1280-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528162557.1280-1-christian.koenig@amd.com>
References: <20190528162557.1280-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+aUYs8KrOK4grbSd0Fh2nuQVPFm1teD6ovZh/kTX0TI=;
 b=JU7yWWrP6q2RiWEr3BXOfNplfGyPvwZlFsOygWy1gsz/fnCdCN/268oGIGxHpGqurH
 V1Rw1DPgLb4Dy+gitkB+YtLYP+z1rvNfBumqRafrhFoaBE4oUckGAfPHdA8remXjPJNL
 YTc7lLbDrkVNmnLYkhOMOU+qwgU5RvYGYRjput9z+sJFEkICHajuAgw9IeclNjXhtFM2
 8PVN3HoP20Aj3uCQ/cmAiQ42rtk6zf2CgErHA6WgvR2XiT6/xSEbnFAmw7NDpSglQ75V
 ca7t9iIBHTz74faKcl/VT8Of7C50VSzV9qIVIhw5izE5/8Vo0x3jDTGMvhwcna3PZzdl
 zHiw==
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

VGhpcyBhdm9pZHMgT09NIHNpdHVhdGlvbnMgd2hlbiB3ZSBoYXZlIGxvdHMgb2YgdGhyZWFkcwpz
dWJtaXR0aW5nIGF0IHRoZSBzYW1lIHRpbWUuCgp2MzogYXBwbHkgdGhpcyB0byB0aGUgd2hvbGUg
ZHJpdmVyLCBub3QganVzdCBDUwoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9jcy5jICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9j
c2EuYyAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAg
ICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwg
MiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwppbmRleCAyMGYyOTU1ZDJhNTUuLjNl
MmRhMjRjZDE3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMKQEAgLTY0
OCw3ICs2NDgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wYXJzZXJfYm9zKHN0cnVjdCBhbWRn
cHVfY3NfcGFyc2VyICpwLAogCX0KIAogCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZwLT50
aWNrZXQsICZwLT52YWxpZGF0ZWQsIHRydWUsCi0JCQkJICAgJmR1cGxpY2F0ZXMsIHRydWUpOwor
CQkJCSAgICZkdXBsaWNhdGVzLCBmYWxzZSk7CiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKIAkJ
aWYgKHIgIT0gLUVSRVNUQVJUU1lTKQogCQkJRFJNX0VSUk9SKCJ0dG1fZXVfcmVzZXJ2ZV9idWZm
ZXJzIGZhaWxlZC5cbiIpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2NzYS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzYS5jCmlu
ZGV4IDA2ZjgzY2FjMGQzYS4uZjY2MDYyOGU2YWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3NhLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2NzYS5jCkBAIC03OSw3ICs3OSw3IEBAIGludCBhbWRncHVfbWFwX3N0YXRpY19j
c2Eoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogCWxp
c3RfYWRkKCZjc2FfdHYuaGVhZCwgJmxpc3QpOwogCWFtZGdwdV92bV9nZXRfcGRfYm8odm0sICZs
aXN0LCAmcGQpOwogCi0JciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3Qs
IHRydWUsIE5VTEwsIHRydWUpOworCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQs
ICZsaXN0LCB0cnVlLCBOVUxMLCBmYWxzZSk7CiAJaWYgKHIpIHsKIAkJRFJNX0VSUk9SKCJmYWls
ZWQgdG8gcmVzZXJ2ZSBDU0EsUEQgQk9zOiBlcnI9JWRcbiIsIHIpOwogCQlyZXR1cm4gcjsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRleCBkNTEzYTVhZDAzZGQuLmVk
MjVhNGUxNDQwNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwpAQCAt
MTcxLDcgKzE3MSw3IEBAIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmosCiAKIAlhbWRncHVfdm1fZ2V0X3BkX2JvKHZtLCAmbGlzdCwgJnZtX3Bk
KTsKIAotCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxzZSwg
JmR1cGxpY2F0ZXMsIHRydWUpOworCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQs
ICZsaXN0LCBmYWxzZSwgJmR1cGxpY2F0ZXMsIGZhbHNlKTsKIAlpZiAocikgewogCQlkZXZfZXJy
KGFkZXYtPmRldiwgImxlYWtpbmcgYm8gdmEgYmVjYXVzZSAiCiAJCQkid2UgZmFpbCB0byByZXNl
cnZlIGJvICglZClcbiIsIHIpOwpAQCAtNjA4LDcgKzYwOCw3IEBAIGludCBhbWRncHVfZ2VtX3Zh
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAKIAlhbWRncHVfdm1f
Z2V0X3BkX2JvKCZmcHJpdi0+dm0sICZsaXN0LCAmdm1fcGQpOwogCi0JciA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIHRydWUsICZkdXBsaWNhdGVzLCB0cnVlKTsKKwly
ID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAmbGlzdCwgdHJ1ZSwgJmR1cGxpY2F0
ZXMsIGZhbHNlKTsKIAlpZiAocikKIAkJZ290byBlcnJvcl91bnJlZjsKIApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCmluZGV4IGM0MzBlODI1OTAzOC4uZDYwNTkz
Y2M0MzZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCkBA
IC0xNTUsNyArMTU1LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X2JvX3Jlc2VydmUoc3Ry
dWN0IGFtZGdwdV9ibyAqYm8sIGJvb2wgbm9faW50cikKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwogCWludCByOwogCi0JciA9IHR0
bV9ib19yZXNlcnZlKCZiby0+dGJvLCAhbm9faW50ciwgZmFsc2UsIE5VTEwpOworCXIgPSBfX3R0
bV9ib19yZXNlcnZlKCZiby0+dGJvLCAhbm9faW50ciwgZmFsc2UsIE5VTEwpOwogCWlmICh1bmxp
a2VseShyICE9IDApKSB7CiAJCWlmIChyICE9IC1FUkVTVEFSVFNZUykKIAkJCWRldl9lcnIoYWRl
di0+ZGV2LCAiJXAgcmVzZXJ2ZSBmYWlsZWRcbiIsIGJvKTsKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
