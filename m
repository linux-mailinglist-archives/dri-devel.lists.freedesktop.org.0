Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91742419F0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 03:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F46891E3;
	Wed, 12 Jun 2019 01:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577C7891D6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:24:29 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b7so839316pls.6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y+UdVFpKtToAwMpoojIPPMwSl93o12ffMgVZ1H7mtl0=;
 b=XBjr38sMwsxJlWewjLn4cqu7M76dScqTE9mABSJmWrQclIW22ZDuMOvwWAbcpJJDaV
 vLobm2iW66bKwL6EPcRQ2+LyLblzlHb5vPXEYnz7pno9Xq89v3sJ6d6mOgm1sir9Esic
 iCHzm5kkzm01E63K4RsK2XQ4JfJMPR8pvnQcausix1xjKZvUHsVFoByfcG1EuTf4/LWO
 LBF8ZDMzhCr/I51WFXEJOAsgRteRZSi0OnUOMqR0Jfd9h3ZwDQYQcGv473wB4guGMVRD
 8eN5MHNfoLKlM72V+1q6w3tSbRWw1dqA650fSEfrxcTTc4UNIrUSewIa/0yNardVzrVf
 3+ig==
X-Gm-Message-State: APjAAAW+clXXFT36ahVwxEmEbC3IhN9AS4b2QHw/TNCJbFyISGk1p9/V
 LwcPsoYiNdXSEgCTyxRdaC0=
X-Google-Smtp-Source: APXvYqxR5efuvwybOL9xJecB56NAS7Qtog+UTb5ZkWMaesBYdMmalfp6I+k64C3dYE6NO9uoto9mQw==
X-Received: by 2002:a17:902:848b:: with SMTP id
 c11mr56329787plo.217.1560302223851; 
 Tue, 11 Jun 2019 18:17:03 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-185-39.hsd1.ca.comcast.net.
 [107.3.185.39])
 by smtp.gmail.com with ESMTPSA id y22sm13257015pgj.38.2019.06.11.18.17.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 18:17:03 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/3] gpu: ipu-v3: image-convert: Fix input bytesperline
 width/height align
Date: Tue, 11 Jun 2019 18:16:55 -0700
Message-Id: <20190612011657.12119-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y+UdVFpKtToAwMpoojIPPMwSl93o12ffMgVZ1H7mtl0=;
 b=D7wTl0xJ9F9JNFbnpTSHd+uoY6rphqSDyENrPDTK9vqlDIunQWMaqUioQjDoy8GOn4
 PRfOm6EUnzHx8fFcmQABEkb4Ub/N40sRuuAjchjz62qc2+rsm/3QrItPVf/khd6FJSdq
 EClNsiNub7upjMZbKe7DPBkqOy+tkJNTRJK3FpcloYfk+K2DlvzWAz5Z7FZNE2KdtQJ1
 NKz64kYmroru5tlFuqKGNb/g16+K+53I3kk8Vrd6fx4RTRlC+FZSkwwmBicr30wBqCaa
 fcT0BEmLoSKGtoOcpq6AzEMPZoknHBg9Dat/rMYiX+S+3tO5Nk21z1JIgXQFJ5QTzGPf
 Dj7w==
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR FREESCALE IMX"
 <dri-devel@lists.freedesktop.org>, Steve Longerbeam <slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG91dHB1dCB3aWR0aCBhbmQgaGVpZ2h0IGFsaWdubWVudCB2YWx1ZXMgd2VyZSBiZWluZyB1
c2VkIGluIHRoZQppbnB1dCBieXRlc3BlcmxpbmUgY2FsY3VsYXRpb24uIEZpeCBieSBzZXBhcmF0
aW5nIGxvY2FsIHZhcnMgd19hbGlnbgphbmQgaF9hbGlnbiBpbnRvIHdfYWxpZ25faW4sIGhfYWxp
Z25faW4sIHdfYWxpZ25fb3V0LCBhbmQgaF9hbGlnbl9vdXQuCgpGaXhlczogZDk2NmUyM2Q2MWEy
YyAoImdwdTogaXB1LXYzOiBpbWFnZS1jb252ZXJ0OiBmaXggYnl0ZXNwZXJsaW5lCmFkanVzdG1l
bnQiKQoKU2lnbmVkLW9mZi1ieTogU3RldmUgTG9uZ2VyYmVhbSA8c2xvbmdlcmJlYW1AZ21haWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jIHwgMzIgKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWlt
YWdlLWNvbnZlcnQuYyBiL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCmlu
ZGV4IDM2ZTg4NDM0NTEzYS4uMzZlYjRjNzdhZDkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9p
cHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYworKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWlt
YWdlLWNvbnZlcnQuYwpAQCAtMTg3Niw3ICsxODc2LDggQEAgdm9pZCBpcHVfaW1hZ2VfY29udmVy
dF9hZGp1c3Qoc3RydWN0IGlwdV9pbWFnZSAqaW4sIHN0cnVjdCBpcHVfaW1hZ2UgKm91dCwKIAkJ
CSAgICAgIGVudW0gaXB1X3JvdGF0ZV9tb2RlIHJvdF9tb2RlKQogewogCWNvbnN0IHN0cnVjdCBp
cHVfaW1hZ2VfcGl4Zm10ICppbmZtdCwgKm91dGZtdDsKLQl1MzIgd19hbGlnbiwgaF9hbGlnbjsK
Kwl1MzIgd19hbGlnbl9vdXQsIGhfYWxpZ25fb3V0OworCXUzMiB3X2FsaWduX2luLCBoX2FsaWdu
X2luOwogCiAJaW5mbXQgPSBnZXRfZm9ybWF0KGluLT5waXgucGl4ZWxmb3JtYXQpOwogCW91dGZt
dCA9IGdldF9mb3JtYXQob3V0LT5waXgucGl4ZWxmb3JtYXQpOwpAQCAtMTkwOCwyMiArMTkwOSwz
MSBAQCB2b2lkIGlwdV9pbWFnZV9jb252ZXJ0X2FkanVzdChzdHJ1Y3QgaXB1X2ltYWdlICppbiwg
c3RydWN0IGlwdV9pbWFnZSAqb3V0LAogCX0KIAogCS8qIGFsaWduIGlucHV0IHdpZHRoL2hlaWdo
dCAqLwotCXdfYWxpZ24gPSBpbG9nMih0aWxlX3dpZHRoX2FsaWduKElNQUdFX0NPTlZFUlRfSU4s
IGluZm10LCByb3RfbW9kZSkpOwotCWhfYWxpZ24gPSBpbG9nMih0aWxlX2hlaWdodF9hbGlnbihJ
TUFHRV9DT05WRVJUX0lOLCBpbmZtdCwgcm90X21vZGUpKTsKLQlpbi0+cGl4LndpZHRoID0gY2xh
bXBfYWxpZ24oaW4tPnBpeC53aWR0aCwgTUlOX1csIE1BWF9XLCB3X2FsaWduKTsKLQlpbi0+cGl4
LmhlaWdodCA9IGNsYW1wX2FsaWduKGluLT5waXguaGVpZ2h0LCBNSU5fSCwgTUFYX0gsIGhfYWxp
Z24pOworCXdfYWxpZ25faW4gPSBpbG9nMih0aWxlX3dpZHRoX2FsaWduKElNQUdFX0NPTlZFUlRf
SU4sIGluZm10LAorCQkJCQkgICAgcm90X21vZGUpKTsKKwloX2FsaWduX2luID0gaWxvZzIodGls
ZV9oZWlnaHRfYWxpZ24oSU1BR0VfQ09OVkVSVF9JTiwgaW5mbXQsCisJCQkJCSAgICAgcm90X21v
ZGUpKTsKKwlpbi0+cGl4LndpZHRoID0gY2xhbXBfYWxpZ24oaW4tPnBpeC53aWR0aCwgTUlOX1cs
IE1BWF9XLAorCQkJCSAgICB3X2FsaWduX2luKTsKKwlpbi0+cGl4LmhlaWdodCA9IGNsYW1wX2Fs
aWduKGluLT5waXguaGVpZ2h0LCBNSU5fSCwgTUFYX0gsCisJCQkJICAgICBoX2FsaWduX2luKTsK
IAogCS8qIGFsaWduIG91dHB1dCB3aWR0aC9oZWlnaHQgKi8KLQl3X2FsaWduID0gaWxvZzIodGls
ZV93aWR0aF9hbGlnbihJTUFHRV9DT05WRVJUX09VVCwgb3V0Zm10LCByb3RfbW9kZSkpOwotCWhf
YWxpZ24gPSBpbG9nMih0aWxlX2hlaWdodF9hbGlnbihJTUFHRV9DT05WRVJUX09VVCwgb3V0Zm10
LCByb3RfbW9kZSkpOwotCW91dC0+cGl4LndpZHRoID0gY2xhbXBfYWxpZ24ob3V0LT5waXgud2lk
dGgsIE1JTl9XLCBNQVhfVywgd19hbGlnbik7Ci0Jb3V0LT5waXguaGVpZ2h0ID0gY2xhbXBfYWxp
Z24ob3V0LT5waXguaGVpZ2h0LCBNSU5fSCwgTUFYX0gsIGhfYWxpZ24pOworCXdfYWxpZ25fb3V0
ID0gaWxvZzIodGlsZV93aWR0aF9hbGlnbihJTUFHRV9DT05WRVJUX09VVCwgb3V0Zm10LAorCQkJ
CQkgICAgIHJvdF9tb2RlKSk7CisJaF9hbGlnbl9vdXQgPSBpbG9nMih0aWxlX2hlaWdodF9hbGln
bihJTUFHRV9DT05WRVJUX09VVCwgb3V0Zm10LAorCQkJCQkgICAgICByb3RfbW9kZSkpOworCW91
dC0+cGl4LndpZHRoID0gY2xhbXBfYWxpZ24ob3V0LT5waXgud2lkdGgsIE1JTl9XLCBNQVhfVywK
KwkJCQkgICAgIHdfYWxpZ25fb3V0KTsKKwlvdXQtPnBpeC5oZWlnaHQgPSBjbGFtcF9hbGlnbihv
dXQtPnBpeC5oZWlnaHQsIE1JTl9ILCBNQVhfSCwKKwkJCQkgICAgICBoX2FsaWduX291dCk7CiAK
IAkvKiBzZXQgaW5wdXQvb3V0cHV0IHN0cmlkZXMgYW5kIGltYWdlIHNpemVzICovCiAJaW4tPnBp
eC5ieXRlc3BlcmxpbmUgPSBpbmZtdC0+cGxhbmFyID8KLQkJY2xhbXBfYWxpZ24oaW4tPnBpeC53
aWR0aCwgMiA8PCB3X2FsaWduLCBNQVhfVywgd19hbGlnbikgOgorCQljbGFtcF9hbGlnbihpbi0+
cGl4LndpZHRoLCAyIDw8IHdfYWxpZ25faW4sIE1BWF9XLAorCQkJICAgIHdfYWxpZ25faW4pIDoK
IAkJY2xhbXBfYWxpZ24oKGluLT5waXgud2lkdGggKiBpbmZtdC0+YnBwKSA+PiAzLAotCQkJICAg
IDIgPDwgd19hbGlnbiwgTUFYX1csIHdfYWxpZ24pOworCQkJICAgIDIgPDwgd19hbGlnbl9pbiwg
TUFYX1csIHdfYWxpZ25faW4pOwogCWluLT5waXguc2l6ZWltYWdlID0gaW5mbXQtPnBsYW5hciA/
CiAJCShpbi0+cGl4LmhlaWdodCAqIGluLT5waXguYnl0ZXNwZXJsaW5lICogaW5mbXQtPmJwcCkg
Pj4gMyA6CiAJCWluLT5waXguaGVpZ2h0ICogaW4tPnBpeC5ieXRlc3BlcmxpbmU7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
