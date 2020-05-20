Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB61DE040
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BC36E3C4;
	Fri, 22 May 2020 06:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFE06E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:33:19 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id n24so3615774ejd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding;
 bh=ehjzIXJVfsowwKW5tw7J90PSE9awheuDdbtm+lGfy+0=;
 b=BqWz+Mjkdf25ceZl5lM/8TkPSm4mOKkEmmBbB3aA90LBphd4FCgSN6lu9CLOnLtvGM
 YJXawJ3D5azc9laESl9RhS58KSyP9nNMCJTXgRupguj4+3odu6RY4QO5VHZKWsp0Ybwa
 FOuj7T9a5DSnOcyYnDlB3w5P/YLr/y/l1h5e0JDm0X4j013sOycht6IaMKacwpGAOxmb
 FcA1PyyizzplaJ63zJePreJXyuYA2kRXc56lvy+seFoPUpmtnOmN1ZMl5RwAANWBLKFO
 MXOeU09ocwmACLUaSc4bmt8XqaiGlpr7O5qJtP8+GNFbOiWJZr0duWuVrR9YQIsDEVK4
 AJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :mime-version:content-transfer-encoding;
 bh=ehjzIXJVfsowwKW5tw7J90PSE9awheuDdbtm+lGfy+0=;
 b=lAq0j2JU6SXQO5F6l5tf+jxiTehb8eyPf162oohUvwGERmUVulIL1uMyh6xmUPfgop
 pAon8guTpEKodA+pb51U22arY4lQRHsqdn6yblNgcZGIOmTdSa1C59wBM4q4gHv1a5/V
 x5qlwJvgE3/+RgLPYOaNUS8JyKbT8ep2ne9gILX2ssGbSVG6efLp0bY++7OaQwbRuhBk
 HRYloHhz7ongSiO51kNnjDWqjTnGFYEikKoJWylwnAGc+9RGMvQrXoDt/EjePYIzFxES
 I95uzW2QMoYZ4D03krN1VvMQ3tsZRxHCI/Z0roadi86KyjMEryfdOlcMDTjpH8AAo+yU
 PwWw==
X-Gm-Message-State: AOAM532KtWHRk2NmE7V4Zq8nv2ANZYhNu5ImVb5hnLB5C6cLyKqZbhVk
 0HUksQcfA4mgSPYuD2UlyB24LdfIP4g=
X-Google-Smtp-Source: ABdhPJxgjs2yn44rYaccct8jkxe50KpOY/oVVEhDMva6TEQv1F6iwZdeaWjxN0qyKVzlZwvoRi1dAg==
X-Received: by 2002:a17:906:dd8:: with SMTP id
 p24mr3357070eji.93.1589977997979; 
 Wed, 20 May 2020 05:33:17 -0700 (PDT)
Received: from localhost.localdomain
 (p200300c58f225e00cb12a21916b827a8.dip0.t-ipconnect.de.
 [2003:c5:8f22:5e00:cb12:a219:16b8:27a8])
 by smtp.gmail.com with ESMTPSA id s17sm1788637edr.84.2020.05.20.05.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 05:33:17 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm: check for NULL pointer in drm_gem_object_put
Date: Wed, 20 May 2020 14:33:27 +0200
Message-Id: <20200520123327.87476-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
Reply-To: 20200520123118.85706-1-nirmoy.das@amd.com
Cc: Nirmoy Das <nirmoy.das@amd.com>, emil.l.velikov@gmail.com,
 christian.koenig@amd.com, nirmoy.aiemd@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2dlbV9mYl9kZXN0cm95KCkgY2FsbHMgZHJtX2dlbV9vYmplY3RfcHV0KCkgd2l0aCBOVUxM
IG9iaiBjYXVzaW5nOgoKWyAgIDExLjU4NDIwOV0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDAwClsgICAxMS41ODQyMTNdICNQRjog
c3VwZXJ2aXNvciB3cml0ZSBhY2Nlc3MgaW4ga2VybmVsIG1vZGUKWyAgIDExLjU4NDIxNV0gI1BG
OiBlcnJvcl9jb2RlKDB4MDAwMikgLSBub3QtcHJlc2VudCBwYWdlClsgICAxMS41ODQyMTZdIFBH
RCAwIFA0RCAwClsgICAxMS41ODQyMjBdIE9vcHM6IDAwMDIgWyMxXSBTTVAgTk9QVEkKWyAgIDEx
LjU4NDIyM10gQ1BVOiA3IFBJRDogMTU3MSBDb21tOiBnbm9tZS1zaGVsbCBUYWludGVkOiBHICAg
ICAgICAgICAgRSAgICAgNS43LjAtcmMxLTEtZGVmYXVsdCsgIzI3ClsgICAxMS41ODQyMjVdIEhh
cmR3YXJlIG5hbWU6IE1pY3JvLVN0YXIgSW50ZXJuYXRpb25hbCBDby4sIEx0ZC4gTVMtN0EzMS9Y
MzcwIFhQT1dFUiBHQU1JTkcgVElUQU5JVU0gKE1TLTdBMzEpLCBCSU9TIDEuTVIgMTIvMDMvMjAx
OQpbICAgMTEuNTg0MjM3XSBSSVA6IDAwMTA6ZHJtX2dlbV9mYl9kZXN0cm95KzB4MjgvMHg3MCBb
ZHJtX2ttc19oZWxwZXJdCjxzbmlwPgpbICAgMTEuNTg0MjU2XSBDYWxsIFRyYWNlOgpbICAgMTEu
NTg0Mjc5XSAgZHJtX21vZGVfcm1mYisweDE4OS8weDFjMCBbZHJtXQpbICAgMTEuNTg0Mjk5XSAg
PyBkcm1fbW9kZV9ybWZiKzB4MWMwLzB4MWMwIFtkcm1dClsgICAxMS41ODQzMTRdICBkcm1faW9j
dGxfa2VybmVsKzB4YWEvMHhmMCBbZHJtXQpbICAgMTEuNTg0MzI5XSAgZHJtX2lvY3RsKzB4MWZm
LzB4M2IwIFtkcm1dClsgICAxMS41ODQzNDddICA/IGRybV9tb2RlX3JtZmIrMHgxYzAvMHgxYzAg
W2RybV0KWyAgIDExLjU4NDQyMV0gIGFtZGdwdV9kcm1faW9jdGwrMHg0OS8weDgwIFthbWRncHVd
ClsgICAxMS41ODQ0MjddICBrc3lzX2lvY3RsKzB4ODcvMHhjMApbICAgMTEuNTg0NDMwXSAgX194
NjRfc3lzX2lvY3RsKzB4MTYvMHgyMApbICAgMTEuNTg0NDM0XSAgZG9fc3lzY2FsbF82NCsweDVm
LzB4MjQwClsgICAxMS41ODQ0MzhdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0
NC8weGE5ClsgICAxMS41ODQ0NDBdIFJJUDogMDAzMzoweDdmMGVmODBmNzIyNwoKRml4ZXM6IGI1
ZDI1MDc0NGNjY2ZiNDAwICgiZHJtL2dlbTogZm9sZCBkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2Nr
ZWQgYW5kIF9fZHJtX2dlbV9vYmplY3RfcHV0KCkiKQoKU2lnbmVkLW9mZi1ieTogTmlybW95IERh
cyA8bmlybW95LmRhc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9nZW0uaCB8IDMgKysr
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2dlbS5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCmluZGV4IDUyMTczYWJkZjUwMC4u
YTEzNTEwMzQ2YTliIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2dlbS5oCkBAIC0zNzIsNiArMzcyLDkgQEAgc3RhdGljIGlubGluZSB2b2lk
IGRybV9nZW1fb2JqZWN0X2dldChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIHN0YXRpYyBp
bmxpbmUgdm9pZAogZHJtX2dlbV9vYmplY3RfcHV0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KQogeworCWlmICghb2JqKQorCQlyZXR1cm47CisKIAlrcmVmX3B1dCgmb2JqLT5yZWZjb3VudCwg
ZHJtX2dlbV9vYmplY3RfZnJlZSk7CiB9CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
