Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FFE2B691D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 16:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CB489CF9;
	Tue, 17 Nov 2020 15:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD6F89CF9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 15:53:37 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id w13so30083998eju.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 07:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MyUFQ61l/6h1fhpHW4DqIsrILaDp+UakyI78uYN1dug=;
 b=K4cxFI0pBcLpBW/cmWcOzji8KTAu4PA9oHUmiwQyget31JYGOzg3T4+bSUO/l42hYP
 xxrYGO8tcgeXS6P5HxJyBENRsi36jtKRlC02rUSpSkCbXjmg9RoBRTehLwozhVVUbmHP
 NPT5j10rYqTPwYzQDOY+5jG1P+AdBhTEb9ocnz4tnsfRdJkRv1aJ6wwxvEJFWeD092AI
 VltinAWyWO+P1HYKb1EAVDb1g4YeTv3oGh9BTBCIysvDr9L7N+GUXRyTzA7qyQhGUhG7
 YKJajO8ecLO5GGqm5BunudECDgjZT+4zLISUwKuRDf+nCnB3PQHcf6Xgc356ocYutB2O
 5gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MyUFQ61l/6h1fhpHW4DqIsrILaDp+UakyI78uYN1dug=;
 b=nEDZ43tYKu6CTA27VZQyTD/OiCWK+nsBHsWJd62Vur+XQUGVFhq5PO+7xQagwroOL5
 9M2DjlrMwgY2Q8gGvft8v2EbjJgagZSGu9jYdN6SGiFMOaEG6fNrQfw4e0IV8T4W6Tfh
 fQMFl5JhZTqqvazPiCk09ZAj5YmvYzAtJ+3ZX6kdhJ41y+pNpxOj3GBE2phjDkEnmKMv
 MT2rx/6bkgfrS5tJPgJo4F9TNSwMmM+5dZRi+qOi01NHeTppVlEVxiMsr8Yd9V6TRcKO
 K7Jq2QKrlOq6DK/YCygEdM6XJb30ViVM7mjsqbcyBmZPhNduyfClSmNyHJ82KMY047Uf
 tVFA==
X-Gm-Message-State: AOAM531f+Z/x40hRGYwWydNo9gMfnEScP/PX2bpPWHfsKSRFp7fliegS
 um+moQQWsjO/nGg9TfQUWIkryhQwL6Y=
X-Google-Smtp-Source: ABdhPJzt8yjiWuQN1R0yjG6sORk2+MahspP2zTifdaZY/cRw6UyfBfg7CJSFw53O1xSE5BMJVz0sOg==
X-Received: by 2002:a17:906:af69:: with SMTP id
 os9mr1992119ejb.180.1605628415658; 
 Tue, 17 Nov 2020 07:53:35 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:26b4:2b4b:eb:65a8])
 by smtp.gmail.com with ESMTPSA id j9sm11657509ejf.105.2020.11.17.07.53.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 07:53:35 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix DMA32 handling in the global page pool
Date: Tue, 17 Nov 2020 16:53:34 +0100
Message-Id: <20201117155334.7855-1-christian.koenig@amd.com>
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

V2hlbiB3ZSBoYXZlIG1peGVkIERNQTMyIGFuZCBub24gRE1BMzIgZGV2aWNlIGluIG9uZSBzeXN0
ZW0KaXQgY291bGQgb3RoZXJ3aXNlIGhhcHBlbiB0aGF0IHRoZSBETUEzMiBkZXZpY2UgZ2V0cyBw
YWdlcwppdCBjYW4ndCB3b3JrIHdpdGguCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cG9vbC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKaW5kZXggMWI5Njc4MGI0OTg5Li41NDU1
YjIwNDQ3NTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKQEAgLTYzLDYgKzYzLDkgQEAgc3RhdGlj
IGF0b21pY19sb25nX3QgYWxsb2NhdGVkX3BhZ2VzOwogc3RhdGljIHN0cnVjdCB0dG1fcG9vbF90
eXBlIGdsb2JhbF93cml0ZV9jb21iaW5lZFtNQVhfT1JERVJdOwogc3RhdGljIHN0cnVjdCB0dG1f
cG9vbF90eXBlIGdsb2JhbF91bmNhY2hlZFtNQVhfT1JERVJdOwogCitzdGF0aWMgc3RydWN0IHR0
bV9wb29sX3R5cGUgZ2xvYmFsX2RtYTMyX3dyaXRlX2NvbWJpbmVkW01BWF9PUkRFUl07CitzdGF0
aWMgc3RydWN0IHR0bV9wb29sX3R5cGUgZ2xvYmFsX2RtYTMyX3VuY2FjaGVkW01BWF9PUkRFUl07
CisKIHN0YXRpYyBzcGlubG9ja190IHNocmlua2VyX2xvY2s7CiBzdGF0aWMgc3RydWN0IGxpc3Rf
aGVhZCBzaHJpbmtlcl9saXN0Owogc3RhdGljIHN0cnVjdCBzaHJpbmtlciBtbV9zaHJpbmtlcjsK
QEAgLTI5MCw4ICsyOTMsMTQgQEAgc3RhdGljIHN0cnVjdCB0dG1fcG9vbF90eXBlICp0dG1fcG9v
bF9zZWxlY3RfdHlwZShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsCiAjaWZkZWYgQ09ORklHX1g4Ngog
CXN3aXRjaCAoY2FjaGluZykgewogCWNhc2UgdHRtX3dyaXRlX2NvbWJpbmVkOgorCQlpZiAocG9v
bC0+dXNlX2RtYTMyKQorCQkJcmV0dXJuICZnbG9iYWxfZG1hMzJfd3JpdGVfY29tYmluZWRbb3Jk
ZXJdOworCiAJCXJldHVybiAmZ2xvYmFsX3dyaXRlX2NvbWJpbmVkW29yZGVyXTsKIAljYXNlIHR0
bV91bmNhY2hlZDoKKwkJaWYgKHBvb2wtPnVzZV9kbWEzMikKKwkJCXJldHVybiAmZ2xvYmFsX2Rt
YTMyX3VuY2FjaGVkW29yZGVyXTsKKwogCQlyZXR1cm4gJmdsb2JhbF91bmNhY2hlZFtvcmRlcl07
CiAJZGVmYXVsdDoKIAkJYnJlYWs7CkBAIC01NzAsNiArNTc5LDExIEBAIGludCB0dG1fcG9vbF9k
ZWJ1Z2ZzKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwgc3RydWN0IHNlcV9maWxlICptKQogCXNlcV9w
dXRzKG0sICJ1Y1x0OiIpOwogCXR0bV9wb29sX2RlYnVnZnNfb3JkZXJzKGdsb2JhbF91bmNhY2hl
ZCwgbSk7CiAKKwlzZXFfcHV0cyhtLCAid2MgMzJcdDoiKTsKKwl0dG1fcG9vbF9kZWJ1Z2ZzX29y
ZGVycyhnbG9iYWxfZG1hMzJfd3JpdGVfY29tYmluZWQsIG0pOworCXNlcV9wdXRzKG0sICJ1YyAz
Mlx0OiIpOworCXR0bV9wb29sX2RlYnVnZnNfb3JkZXJzKGdsb2JhbF9kbWEzMl91bmNhY2hlZCwg
bSk7CisKIAlmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9DQUNISU5HX1RZUEVTOyArK2kpIHsKIAkJ
c2VxX3B1dHMobSwgIkRNQSAiKTsKIAkJc3dpdGNoIChpKSB7CkBAIC02NDAsNiArNjU0LDExIEBA
IGludCB0dG1fcG9vbF9tZ3JfaW5pdCh1bnNpZ25lZCBsb25nIG51bV9wYWdlcykKIAkJdHRtX3Bv
b2xfdHlwZV9pbml0KCZnbG9iYWxfd3JpdGVfY29tYmluZWRbaV0sIE5VTEwsCiAJCQkJICAgdHRt
X3dyaXRlX2NvbWJpbmVkLCBpKTsKIAkJdHRtX3Bvb2xfdHlwZV9pbml0KCZnbG9iYWxfdW5jYWNo
ZWRbaV0sIE5VTEwsIHR0bV91bmNhY2hlZCwgaSk7CisKKwkJdHRtX3Bvb2xfdHlwZV9pbml0KCZn
bG9iYWxfZG1hMzJfd3JpdGVfY29tYmluZWRbaV0sIE5VTEwsCisJCQkJICAgdHRtX3dyaXRlX2Nv
bWJpbmVkLCBpKTsKKwkJdHRtX3Bvb2xfdHlwZV9pbml0KCZnbG9iYWxfZG1hMzJfdW5jYWNoZWRb
aV0sIE5VTEwsCisJCQkJICAgdHRtX3VuY2FjaGVkLCBpKTsKIAl9CiAKIAltbV9zaHJpbmtlci5j
b3VudF9vYmplY3RzID0gdHRtX3Bvb2xfc2hyaW5rZXJfY291bnQ7CkBAIC02NjAsNiArNjc5LDkg
QEAgdm9pZCB0dG1fcG9vbF9tZ3JfZmluaSh2b2lkKQogCWZvciAoaSA9IDA7IGkgPCBNQVhfT1JE
RVI7ICsraSkgewogCQl0dG1fcG9vbF90eXBlX2ZpbmkoJmdsb2JhbF93cml0ZV9jb21iaW5lZFtp
XSk7CiAJCXR0bV9wb29sX3R5cGVfZmluaSgmZ2xvYmFsX3VuY2FjaGVkW2ldKTsKKworCQl0dG1f
cG9vbF90eXBlX2ZpbmkoJmdsb2JhbF9kbWEzMl93cml0ZV9jb21iaW5lZFtpXSk7CisJCXR0bV9w
b29sX3R5cGVfZmluaSgmZ2xvYmFsX2RtYTMyX3VuY2FjaGVkW2ldKTsKIAl9CiAKIAl1bnJlZ2lz
dGVyX3Nocmlua2VyKCZtbV9zaHJpbmtlcik7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
