Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6D270063
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 17:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0E26ED07;
	Fri, 18 Sep 2020 15:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A046ED07
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 15:01:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lo4so8522307ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDsrLhiMkPAmLsmCbsbOt54HXqi3VVADH36szKsIPD0=;
 b=KziKeWPtNK8g6GYPrJ5t6owEFPBKs2SPmr5LsejszWUnaLvTJZMXIyukzm77/lJtzk
 SEQha1esY1IYkPUiECJZ7MPYrfiCqyk8Bhwl3EcVXAoPZ7NQ7P1rVTOJ3O9HVtIcubkx
 OttQzn2IiHml5GuJMIS85asTWNyar0LWjr7KU6TJ1lcyKa5txx54kNahqf8k5Kvvh2lE
 DRumaaXEg4zg5kNabECL3R9RE+gDMvLqHsU1BnaFPcocOxY+4sZgQ1OGNTvLPESzjO2m
 T8gTJEFr8jTdYf32AKv1JeNDbTAu4Wa2otIaLuAcf6n9Q7megj9JYeTwCDX6TUk94mH3
 H+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sDsrLhiMkPAmLsmCbsbOt54HXqi3VVADH36szKsIPD0=;
 b=uODTwulBMzELIMcfNNNF6GCkRyDw02P/k0rZt2ctPZvpMENYjAWG5Cb5qnOPUmBOaY
 C0Q8URWnBhYg8uYNzyzmYtPxCZgpoyi2/f8n1we6p+PfFf6jJD4uCtlnqq+grMHL8OMo
 FzwXBJqU5GvIpj5ajoMLybV0vB9LWmrggAU7Gpt9yngn1fpGsQLcWcSEd4nukOA9NYs1
 l7L0eL+rC306R1IdnS+qVgAJs+hXazT758FaxMcM+OfdV3TpYmA2qZMqd0C3s1PWymJa
 mo67LGGtaYwRSe6f3usSlT9Mc3AAle5Yntdjbtwd5DuuZXamo5J7kgl33GFugwO7ZTDO
 ZT8A==
X-Gm-Message-State: AOAM530U+4osQPfhSKeHyxLVZwtk+XZiYQpFwgda2ZsoljrhPq4At38l
 Ffgh86wIkHq8Fy4uZ2MFfJ9+iwJnGMc=
X-Google-Smtp-Source: ABdhPJxEkjzYD5fokvb0/Sq7ValKBgJhAmL7ZSXP32iQ0V/NkFnOuPxte0pD5vNt8dCm8/edT+kVLA==
X-Received: by 2002:a17:906:6d92:: with SMTP id
 h18mr35706926ejt.405.1600441271283; 
 Fri, 18 Sep 2020 08:01:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f53:d479:d3f9:5c9d])
 by smtp.gmail.com with ESMTPSA id ce14sm2462390edb.25.2020.09.18.08.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 08:01:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: remove nonsense AGP handling
Date: Fri, 18 Sep 2020 17:01:08 +0200
Message-Id: <20200918150109.29469-1-christian.koenig@amd.com>
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

bWFwX3BhZ2VfaW50b19hZ3AoKSBhbmQgdW5tYXBfcGFnZV9mcm9tX2FncCgpIGFyZSBvbmx5IGRl
ZmluZWQgb24geDg2LgoKT24gYWxsIG90aGVyIHBsYXRmb3JtcyB0aGV5IGFyZSBkZWZpbmVkIGFz
IG5vb3BzLiBTbyB0aGlzIGNvZGUgZG9lc24ndCBoYXMgYW55IGVmZmVjdCBhdCBhbGwuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogaW5jbHVkZS9kcm0vdHRtL3R0bV9zZXRfbWVtb3J5LmggfCA0NCAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fc2V0X21lbW9yeS5oIGIvaW5jbHVkZS9kcm0vdHRt
L3R0bV9zZXRfbWVtb3J5LmgKaW5kZXggN2M0OTJiNDllMzhjLi4zOTY2NjU1YjcyZjEgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fc2V0X21lbW9yeS5oCisrKyBiL2luY2x1ZGUvZHJt
L3R0bS90dG1fc2V0X21lbW9yeS5oCkBAIC03MSw0OCArNzEsNiBAQCBzdGF0aWMgaW5saW5lIGlu
dCB0dG1fc2V0X3BhZ2VzX3VjKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgbnVtcGFnZXMpCiAKICNl
bHNlIC8qIGZvciBDT05GSUdfWDg2ICovCiAKLSNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCi0K
LSNpbmNsdWRlIDxhc20vYWdwLmg+Ci0KLXN0YXRpYyBpbmxpbmUgaW50IHR0bV9zZXRfcGFnZXNf
YXJyYXlfd2Ioc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IGFkZHJpbmFycmF5KQotewotCWludCBp
OwotCi0JZm9yIChpID0gMDsgaSA8IGFkZHJpbmFycmF5OyBpKyspCi0JCXVubWFwX3BhZ2VfZnJv
bV9hZ3AocGFnZXNbaV0pOwotCXJldHVybiAwOwotfQotCi1zdGF0aWMgaW5saW5lIGludCB0dG1f
c2V0X3BhZ2VzX2FycmF5X3djKHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCBhZGRyaW5hcnJheSkK
LXsKLQlpbnQgaTsKLQotCWZvciAoaSA9IDA7IGkgPCBhZGRyaW5hcnJheTsgaSsrKQotCQltYXBf
cGFnZV9pbnRvX2FncChwYWdlc1tpXSk7Ci0JcmV0dXJuIDA7Ci19Ci0KLXN0YXRpYyBpbmxpbmUg
aW50IHR0bV9zZXRfcGFnZXNfYXJyYXlfdWMoc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IGFkZHJp
bmFycmF5KQotewotCWludCBpOwotCi0JZm9yIChpID0gMDsgaSA8IGFkZHJpbmFycmF5OyBpKysp
Ci0JCW1hcF9wYWdlX2ludG9fYWdwKHBhZ2VzW2ldKTsKLQlyZXR1cm4gMDsKLX0KLQotc3RhdGlj
IGlubGluZSBpbnQgdHRtX3NldF9wYWdlc193YihzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IG51bXBh
Z2VzKQotewotCWludCBpOwotCi0JZm9yIChpID0gMDsgaSA8IG51bXBhZ2VzOyBpKyspCi0JCXVu
bWFwX3BhZ2VfZnJvbV9hZ3AocGFnZSsrKTsKLQlyZXR1cm4gMDsKLX0KLQotI2Vsc2UgLyogZm9y
IENPTkZJR19BR1AgKi8KLQogc3RhdGljIGlubGluZSBpbnQgdHRtX3NldF9wYWdlc19hcnJheV93
YihzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgYWRkcmluYXJyYXkpCiB7CiAJcmV0dXJuIDA7CkBA
IC0xMzMsOCArOTEsNiBAQCBzdGF0aWMgaW5saW5lIGludCB0dG1fc2V0X3BhZ2VzX3diKHN0cnVj
dCBwYWdlICpwYWdlLCBpbnQgbnVtcGFnZXMpCiAJcmV0dXJuIDA7CiB9CiAKLSNlbmRpZiAvKiBm
b3IgQ09ORklHX0FHUCAqLwotCiBzdGF0aWMgaW5saW5lIGludCB0dG1fc2V0X3BhZ2VzX3djKHN0
cnVjdCBwYWdlICpwYWdlLCBpbnQgbnVtcGFnZXMpCiB7CiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
