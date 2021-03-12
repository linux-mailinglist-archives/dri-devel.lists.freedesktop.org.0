Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D8338F45
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 14:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D3B6F63C;
	Fri, 12 Mar 2021 13:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2686F63E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 13:59:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id mj10so53520704ejb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 05:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RXIde/EuL9AlycuKsAtgcHTZ7jdywusoAi6fwahOfCw=;
 b=BknlISAggUsQi+qlHObMjrKiXk9pZApVHkwoCxQWKFj2gxNd7YPpUCI+pviR6nrg77
 mu6BP0BT5ekc63YuJAbcFC0NoTrdqiXrWXnSaAmvbj3utcZk5jt8AgeS7k5M4qn+Ekp9
 WYDXgJOPj+mNs3utByzrB4h6KkMQKFXiiXd8TrCU7esOy/s7wPJ1Si7MvQ5esYytyvJP
 Gf21BEenytBxJqgzN9EYcG+H+HI1wjuEbUANZbNVg+5E4zXH7HNNG/LXO2xBKhl0yr6e
 5tDUkfAvimYwGQXg1OxITN4nhNnQY2uW6OXTizQzdRgv4SMTIfgOUbV/vVNzlEjAAsAX
 WGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RXIde/EuL9AlycuKsAtgcHTZ7jdywusoAi6fwahOfCw=;
 b=ih1h4OEK0kP0Ws/nbqY2fU90m0BSd9JJemLdKSbhbP7TXH1/6VOU5/LKHu988GffAs
 gD+hH4COIzYD6LQwLU6/2qNvqfUL9ir+Xb3MCjtxtyckGzAErT6Jp5WBQ9eLP2ajJHRA
 JSGCrqE6tBrZQnDnCVPPXehOm41MM1O4+u0yWRecE5AnwnRtV+FQ7CmSal9NOJ8wO2JC
 TICkvD86o36Xnd6lOVAS8zjB15/XEiDMomD94DCHkYqWYoEiujf8BR4zPSwCNMpOdgGn
 xtIxpc5ipGlWmoP2Mn0LR5FlX5S//dsRW1QFFTFbSXsPcaQOwgyG4oUhg7Ngxzz/c7JQ
 FxNA==
X-Gm-Message-State: AOAM532acP5OL+6ENmadCYATTBxScaeiqk43w/bZYw3e3pMO2ZrEohBZ
 gaArv6qOqbiirmTwAQUINqm5SUaOnuE=
X-Google-Smtp-Source: ABdhPJwWQzod+Yf64E4j821Lq6l0zFsFmo7ILFDF16sF383JSSfN0eJzoQpOMIBaWf6+8aSDWBNj3A==
X-Received: by 2002:a17:906:6bd1:: with SMTP id
 t17mr8791185ejs.319.1615557548178; 
 Fri, 12 Mar 2021 05:59:08 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8c1c:cfec:8dac:4b29])
 by smtp.gmail.com with ESMTPSA id lm24sm2776237ejb.53.2021.03.12.05.59.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:59:07 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: nuke the ih reentrant lock
Date: Fri, 12 Mar 2021 14:59:06 +0100
Message-Id: <20210312135906.3262-1-christian.koenig@amd.com>
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

SW50ZXJydXB0cyBvbiBhcmUgbm9uLXJlZW50cmFudCBvbiBsaW51eC4gVGhpcyBpcyBqdXN0IGFu
IGFuY2llbnQKbGVmdG92ZXIgZnJvbSByYWRlb24gd2hlcmUgaXJxIHByb2Nlc3Npbmcgd2FzIGtp
Y2tlZCBvZiBmcm9tIGRpZmZlcmVudApwbGFjZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfaWguYyAgICAgfCA1IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaWguaCAgICAgfCAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggYTE1ZjFiNjA0
NzMzLi44ODY2MjVmYjQ2NGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMKQEAgLTMyODQsNyArMzI4NCw2IEBAIGludCBhbWRncHVfZGV2aWNlX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAkvKiBtdXRleCBpbml0aWFsaXphdGlvbiBhcmUg
YWxsIGRvbmUgaGVyZSBzbyB3ZQogCSAqIGNhbiByZWNhbGwgZnVuY3Rpb24gd2l0aG91dCBoYXZp
bmcgbG9ja2luZyBpc3N1ZXMgKi8KLQlhdG9taWNfc2V0KCZhZGV2LT5pcnEuaWgubG9jaywgMCk7
CiAJbXV0ZXhfaW5pdCgmYWRldi0+ZmlybXdhcmUubXV0ZXgpOwogCW11dGV4X2luaXQoJmFkZXYt
PnBtLm11dGV4KTsKIAltdXRleF9pbml0KCZhZGV2LT5nZnguZ3B1X2Nsb2NrX211dGV4KTsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMKaW5kZXggMTAyNDA2NWYxZjAzLi5mYWFh
NmFhMmZhYWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
aC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5jCkBAIC0yMjgs
MTAgKzIyOCw2IEBAIGludCBhbWRncHVfaWhfcHJvY2VzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgc3RydWN0IGFtZGdwdV9paF9yaW5nICppaCkKIAl3cHRyID0gYW1kZ3B1X2loX2dldF93
cHRyKGFkZXYsIGloKTsKIAogcmVzdGFydF9paDoKLQkvKiBpcyBzb21lYm9keSBlbHNlIGFscmVh
ZHkgcHJvY2Vzc2luZyBpcnFzPyAqLwotCWlmIChhdG9taWNfeGNoZygmaWgtPmxvY2ssIDEpKQot
CQlyZXR1cm4gSVJRX05PTkU7Ci0KIAlEUk1fREVCVUcoIiVzOiBycHRyICVkLCB3cHRyICVkXG4i
LCBfX2Z1bmNfXywgaWgtPnJwdHIsIHdwdHIpOwogCiAJLyogT3JkZXIgcmVhZGluZyBvZiB3cHRy
IHZzLiByZWFkaW5nIG9mIElIIHJpbmcgZGF0YSAqLwpAQCAtMjQ0LDcgKzI0MCw2IEBAIGludCBh
bWRncHVfaWhfcHJvY2VzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdw
dV9paF9yaW5nICppaCkKIAogCWFtZGdwdV9paF9zZXRfcnB0cihhZGV2LCBpaCk7CiAJd2FrZV91
cF9hbGwoJmloLT53YWl0X3Byb2Nlc3MpOwotCWF0b21pY19zZXQoJmloLT5sb2NrLCAwKTsKIAog
CS8qIG1ha2Ugc3VyZSB3cHRyIGhhc24ndCBjaGFuZ2VkIHdoaWxlIHByb2Nlc3NpbmcgKi8KIAl3
cHRyID0gYW1kZ3B1X2loX2dldF93cHRyKGFkZXYsIGloKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2loLmgKaW5kZXggODdlYzZkMjBkYmUwLi4wNjQ5YjU5ODMwYTUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9paC5oCkBAIC02NCw3ICs2NCw2IEBAIHN0cnVjdCBh
bWRncHVfaWhfcmluZyB7CiAKIAlib29sICAgICAgICAgICAgICAgICAgICBlbmFibGVkOwogCXVu
c2lnbmVkCQlycHRyOwotCWF0b21pY190CQlsb2NrOwogCXN0cnVjdCBhbWRncHVfaWhfcmVncwlp
aF9yZWdzOwogCiAJLyogRm9yIHdhaXRpbmcgb24gSUggcHJvY2Vzc2luZyBhdCBjaGVja3BvaW50
LiAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
