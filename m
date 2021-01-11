Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B872D2F16B5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 14:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A9A6E0CC;
	Mon, 11 Jan 2021 13:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2736E0CC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 13:57:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id jx16so24805430ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 05:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBx1V4b4fgz+sgDuinfyedbeEXFOkc11fHFUcT4rhTw=;
 b=MOSAIonZL6mQiHopFg0eQsBN1SV87jReGGTZs8FsknndFvl/rgHqoo3bVrnmozlH6a
 dJYcIh/cJq4xTVsV0mlFXbe0qI4agEmm5Ldclec5bdi1n5FNptvmhGAHITesUje5FJIQ
 gtOswEl9EHdnB8t/z4JFDrFfEmo5rSN4JAsehPNWQGsXHWelDahDPwh1QT6RBBbeBSIU
 kaOQ6+L0NFS9bFZebEVyVoz0ViNeRxvM0uQHk0Dnoi98BfwQj63QcgPqtH3gOui0W3Ai
 Xsq+mYCDAvcMd17QcKziL21wCEjTNGFVjMjrlryU+HzpFkkJq1vuhkb8+WQIUF8Dt6Qs
 AjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XBx1V4b4fgz+sgDuinfyedbeEXFOkc11fHFUcT4rhTw=;
 b=aMTm35zTuw7FiA/vinFLc7BpKf/A7jgbUbroSvMhj094Hm8OXLAK/3p5uzVS9+xaE4
 iOYMLI45zF6GROGCFn1ZIYca4Td/PgcarHDp9y/cx3MvG4NraBHN6xlYKQIyKtj/spf2
 JRc37uxBzP26RFuoDaGIp8ocDxXGiBBZwnRRN84zWzuG4FtV4Np1avadKSDO2S3AL62X
 Ijsq+4yqEJmrLgvpTYmN9ZnF0BPPnRC1fLneHWdH7EMnDJZmNYweFCzbrdcd/PS//zH1
 myRXeoJtzGHUDMqastIJF4GvnzZaLxbsBfj+mq2oW52NelTpzUmibl+nO3rpL2tWMM/C
 lC8w==
X-Gm-Message-State: AOAM533pDq/z5Ir87wuvEfsJCsTylj4cJ/fEa3cADYQ6rOlMigzCWukU
 5FrZmKBOttr0r1Y6cgdiVTQ=
X-Google-Smtp-Source: ABdhPJyGpu1ZJ4xg+b7S8fvDT1JLfYNTpExmBxx73JZIRy0AfxQPe/FQK18vjYH4PpIEqx1zJJe8kg==
X-Received: by 2002:a17:907:2116:: with SMTP id
 qn22mr10763144ejb.483.1610373443493; 
 Mon, 11 Jan 2021 05:57:23 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7a3d:b8c1:f6c5:8930])
 by smtp.gmail.com with ESMTPSA id bm12sm7025822ejb.117.2021.01.11.05.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 05:57:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mikhail.v.gavrilov@gmail.com
Subject: [PATCH] drm/ttm: make the pool shrinker lock a mutex
Date: Mon, 11 Jan 2021 14:57:21 +0100
Message-Id: <20210111135721.2704-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c2V0X3BhZ2VzX3diKCkgbWlnaHQgc2xlZXAgYW5kIHNvIHdlIGNhbid0IGRvIHRoaXMgaW4gYW4g
YXRvbWljIGNvbnRleHQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+ClJlcG9ydGVkLWJ5OiBNaWtoYWlsIEdhdnJpbG92IDxtaWtoYWls
LnYuZ2F2cmlsb3ZAZ21haWwuY29tPgpGaXhlczogZDA5OWZjOGY1NDBhICgiZHJtL3R0bTogbmV3
IFRUIGJhY2tlbmQgYWxsb2NhdGlvbiBwb29sIHYzIikKLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9wb29sLmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwppbmRl
eCBhMDBiN2FiOWMxNGMuLjZhNmVlYmE0MjNkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fcG9vbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwpAQCAt
NjYsNyArNjYsNyBAQCBzdGF0aWMgc3RydWN0IHR0bV9wb29sX3R5cGUgZ2xvYmFsX3VuY2FjaGVk
W01BWF9PUkRFUl07CiBzdGF0aWMgc3RydWN0IHR0bV9wb29sX3R5cGUgZ2xvYmFsX2RtYTMyX3dy
aXRlX2NvbWJpbmVkW01BWF9PUkRFUl07CiBzdGF0aWMgc3RydWN0IHR0bV9wb29sX3R5cGUgZ2xv
YmFsX2RtYTMyX3VuY2FjaGVkW01BWF9PUkRFUl07CiAKLXN0YXRpYyBzcGlubG9ja190IHNocmlu
a2VyX2xvY2s7CitzdGF0aWMgc3RydWN0IG11dGV4IHNocmlua2VyX2xvY2s7CiBzdGF0aWMgc3Ry
dWN0IGxpc3RfaGVhZCBzaHJpbmtlcl9saXN0Owogc3RhdGljIHN0cnVjdCBzaHJpbmtlciBtbV9z
aHJpbmtlcjsKIApAQCAtMjQ5LDkgKzI0OSw5IEBAIHN0YXRpYyB2b2lkIHR0bV9wb29sX3R5cGVf
aW5pdChzdHJ1Y3QgdHRtX3Bvb2xfdHlwZSAqcHQsIHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwKIAlz
cGluX2xvY2tfaW5pdCgmcHQtPmxvY2spOwogCUlOSVRfTElTVF9IRUFEKCZwdC0+cGFnZXMpOwog
Ci0Jc3Bpbl9sb2NrKCZzaHJpbmtlcl9sb2NrKTsKKwltdXRleF9sb2NrKCZzaHJpbmtlcl9sb2Nr
KTsKIAlsaXN0X2FkZF90YWlsKCZwdC0+c2hyaW5rZXJfbGlzdCwgJnNocmlua2VyX2xpc3QpOwot
CXNwaW5fdW5sb2NrKCZzaHJpbmtlcl9sb2NrKTsKKwltdXRleF91bmxvY2soJnNocmlua2VyX2xv
Y2spOwogfQogCiAvKiBSZW1vdmUgYSBwb29sX3R5cGUgZnJvbSB0aGUgZ2xvYmFsIHNocmlua2Vy
IGxpc3QgYW5kIGZyZWUgYWxsIHBhZ2VzICovCkBAIC0yNTksOSArMjU5LDkgQEAgc3RhdGljIHZv
aWQgdHRtX3Bvb2xfdHlwZV9maW5pKHN0cnVjdCB0dG1fcG9vbF90eXBlICpwdCkKIHsKIAlzdHJ1
Y3QgcGFnZSAqcCwgKnRtcDsKIAotCXNwaW5fbG9jaygmc2hyaW5rZXJfbG9jayk7CisJbXV0ZXhf
bG9jaygmc2hyaW5rZXJfbG9jayk7CiAJbGlzdF9kZWwoJnB0LT5zaHJpbmtlcl9saXN0KTsKLQlz
cGluX3VubG9jaygmc2hyaW5rZXJfbG9jayk7CisJbXV0ZXhfdW5sb2NrKCZzaHJpbmtlcl9sb2Nr
KTsKIAogCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShwLCB0bXAsICZwdC0+cGFnZXMsIGxydSkK
IAkJdHRtX3Bvb2xfZnJlZV9wYWdlKHB0LT5wb29sLCBwdC0+Y2FjaGluZywgcHQtPm9yZGVyLCBw
KTsKQEAgLTMwMiw3ICszMDIsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHR0bV9wb29sX3Nocmlu
ayh2b2lkKQogCXVuc2lnbmVkIGludCBudW1fZnJlZWQ7CiAJc3RydWN0IHBhZ2UgKnA7CiAKLQlz
cGluX2xvY2soJnNocmlua2VyX2xvY2spOworCW11dGV4X2xvY2soJnNocmlua2VyX2xvY2spOwog
CXB0ID0gbGlzdF9maXJzdF9lbnRyeSgmc2hyaW5rZXJfbGlzdCwgdHlwZW9mKCpwdCksIHNocmlu
a2VyX2xpc3QpOwogCiAJcCA9IHR0bV9wb29sX3R5cGVfdGFrZShwdCk7CkBAIC0zMTQsNyArMzE0
LDcgQEAgc3RhdGljIHVuc2lnbmVkIGludCB0dG1fcG9vbF9zaHJpbmsodm9pZCkKIAl9CiAKIAls
aXN0X21vdmVfdGFpbCgmcHQtPnNocmlua2VyX2xpc3QsICZzaHJpbmtlcl9saXN0KTsKLQlzcGlu
X3VubG9jaygmc2hyaW5rZXJfbG9jayk7CisJbXV0ZXhfdW5sb2NrKCZzaHJpbmtlcl9sb2NrKTsK
IAogCXJldHVybiBudW1fZnJlZWQ7CiB9CkBAIC01NjQsNyArNTY0LDcgQEAgaW50IHR0bV9wb29s
X2RlYnVnZnMoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3Qgc2VxX2ZpbGUgKm0pCiB7CiAJ
dW5zaWduZWQgaW50IGk7CiAKLQlzcGluX2xvY2soJnNocmlua2VyX2xvY2spOworCW11dGV4X2xv
Y2soJnNocmlua2VyX2xvY2spOwogCiAJc2VxX3B1dHMobSwgIlx0ICIpOwogCWZvciAoaSA9IDA7
IGkgPCBNQVhfT1JERVI7ICsraSkKQEAgLTYwMCw3ICs2MDAsNyBAQCBpbnQgdHRtX3Bvb2xfZGVi
dWdmcyhzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIHN0cnVjdCBzZXFfZmlsZSAqbSkKIAlzZXFfcHJp
bnRmKG0sICJcbnRvdGFsXHQ6ICU4bHUgb2YgJThsdVxuIiwKIAkJICAgYXRvbWljX2xvbmdfcmVh
ZCgmYWxsb2NhdGVkX3BhZ2VzKSwgcGFnZV9wb29sX3NpemUpOwogCi0Jc3Bpbl91bmxvY2soJnNo
cmlua2VyX2xvY2spOworCW11dGV4X3VubG9jaygmc2hyaW5rZXJfbG9jayk7CiAKIAlyZXR1cm4g
MDsKIH0KQEAgLTY0NCw3ICs2NDQsNyBAQCBpbnQgdHRtX3Bvb2xfbWdyX2luaXQodW5zaWduZWQg
bG9uZyBudW1fcGFnZXMpCiAJaWYgKCFwYWdlX3Bvb2xfc2l6ZSkKIAkJcGFnZV9wb29sX3NpemUg
PSBudW1fcGFnZXM7CiAKLQlzcGluX2xvY2tfaW5pdCgmc2hyaW5rZXJfbG9jayk7CisJbXV0ZXhf
aW5pdCgmc2hyaW5rZXJfbG9jayk7CiAJSU5JVF9MSVNUX0hFQUQoJnNocmlua2VyX2xpc3QpOwog
CiAJZm9yIChpID0gMDsgaSA8IE1BWF9PUkRFUjsgKytpKSB7Ci0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
