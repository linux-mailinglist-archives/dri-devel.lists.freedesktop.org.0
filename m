Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F05B046
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 17:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFBF89D4B;
	Sun, 30 Jun 2019 15:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C689D00;
 Sun, 30 Jun 2019 15:03:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m14so9020223qka.10;
 Sun, 30 Jun 2019 08:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtkecUl94WZUWVyLIbg41zPL4XOnGr9FinN/AjQ9do0=;
 b=hN40ycFXI/6ABIWmSeGn53vmf+KSMLJkXT23utRg5gJDA04yXeYEjDRXEqh+/e2USB
 8iSdrIO8z12gh14vWZZDTlck6XA3uC8M/7vW38E5ee//Ud+C87p7XUPe5YPJ/cXnJV2j
 8eGb8/b0+owCKjcdAnTh2/dXRKO31ERJF57/P4WzkrTSHrQpgGmigCsct/aiNINE4cTs
 abyofX2/3eku9N/54TWNWi/Cx01clw6+QuwrS++9deV56HhjO/3jMELZ/6dzUdEhgpc2
 O0OLggegV01NyfkSIaSzeZe1xvEcCMb//JxksfuKuC8SYzjCWhTxZOLOcZUuGLVmUu5b
 519g==
X-Gm-Message-State: APjAAAVUDhS3mTbQsn6GjKYPD4W8dpaAsmaQQ2N/VXwbGH0DEdh3XqyH
 TPB4AvzNq12K9bHAF/5jb+JKYgcFRNjKmg==
X-Google-Smtp-Source: APXvYqzb7VEqdJN3zMk22jED6mEzBTBoZp0mQsZB6WSr/6mKWnavlfT0+rulViFI0nHFDxdAaJYyMA==
X-Received: by 2002:a37:9506:: with SMTP id x6mr17139922qkd.107.1561906990902; 
 Sun, 30 Jun 2019 08:03:10 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id j25sm3431572qkk.53.2019.06.30.08.03.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 08:03:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] drm/msm/dsi: get the clocks into OFF state at init
Date: Sun, 30 Jun 2019 08:01:42 -0700
Message-Id: <20190630150230.7878-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630150230.7878-1-robdclark@gmail.com>
References: <20190630150230.7878-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtkecUl94WZUWVyLIbg41zPL4XOnGr9FinN/AjQ9do0=;
 b=bgoeXIm2Szb7H23F1xIuOV/OvrFFy4Z/4Z0LEr6zIOkjv9PUlSVyyIiIVoUnNQaW8Q
 cafpxW5/ZXUIYGeRvkXt4qZICIMaH2o+0zNqueBWKrkmrXfN57tKIlDyT1Yh+y1ay5v2
 zvN5vBXY57R5bCr/DfN5c62hyqHT+WV8C0cAxaZEoxbOCjKjvFomRHB7qf47grSh6HTs
 tZo179xphOFk9zBbCEgXJ+L4BIgMwmEVwGIaExH+6eE4DCHzqTWCQuhd33+N9n/PrQwj
 PmNmj0Fi1fdqzDqg7RjZXUXshd5SMg+oEeyEwBG5SnPiettac8xLsBb1dFjL8YMVyQEx
 y2ng==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 linux-pm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-kernel@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 Sibi Sankar <sibis@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRG8gYW4gZXh0cmEgZW5h
YmxlL2Rpc2FibGUgY3ljbGUgYXQgaW5pdCwgdG8gZ2V0IHRoZSBjbGtzIGludG8gZGlzYWJsZWQK
c3RhdGUgaW4gY2FzZSBib290bG9hZGVyIGxlZnQgdGhlbSBlbmFibGVkLgoKSW4gY2FzZSB0aGV5
IHdlcmUgYWxyZWFkeSBlbmFibGVkLCB0aGUgY2xrX3ByZXBhcmVfZW5hYmxlKCkgaGFzIG5vIHJl
YWwKZWZmZWN0LCBvdGhlciB0aGFuIGdldHRpbmcgdGhlIGVuYWJsZV9jb3VudC9wcmVwYXJlX2Nv
dW50IGludG8gdGhlIHJpZ2h0CnN0YXRlIHNvIHRoYXQgd2UgY2FuIGRpc2FibGUgY2xvY2tzIGlu
IHRoZSBjb3JyZWN0IG9yZGVyLiAgVGhpcyB3YXkgd2UKYXZvaWQgaGF2aW5nIHN0dWNrIGNsb2Nr
cyB3aGVuIHdlIGxhdGVyIHdhbnQgdG8gZG8gYSBtb2Rlc2V0IGFuZCBzZXQgdGhlCmNsb2NrIHJh
dGVzLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgICAgICAgICB8IDE4ICsrKysr
KysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTBubS5j
IHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCmluZGV4IDg3MTE5ZDBhZmI5MS4uZDZlODFm
MzMwZGI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKQEAgLTIxNSw4ICsyMTUsNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG1zbV9kc2lfY2ZnX2hhbmRsZXIgKmRzaV9nZXRfY29uZmln
KAogCQlnb3RvIHB1dF9nZHNjOwogCX0KIAotCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsKLQog
CXJldCA9IHJlZ3VsYXRvcl9lbmFibGUoZ2RzY19yZWcpOwogCWlmIChyZXQpIHsKIAkJcHJfZXJy
KCIlczogdW5hYmxlIHRvIGVuYWJsZSBnZHNjXG4iLCBfX2Z1bmNfXyk7CkBAIC0yNDMsNyArMjQx
LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtc21fZHNpX2NmZ19oYW5kbGVyICpkc2lfZ2V0X2Nv
bmZpZygKIAljbGtfZGlzYWJsZV91bnByZXBhcmUoYWhiX2Nsayk7CiBkaXNhYmxlX2dkc2M6CiAJ
cmVndWxhdG9yX2Rpc2FibGUoZ2RzY19yZWcpOwotCXBtX3J1bnRpbWVfcHV0X3N5bmMoZGV2KTsK
IHB1dF9nZHNjOgogCXJlZ3VsYXRvcl9wdXQoZ2RzY19yZWcpOwogZXhpdDoKQEAgLTM5MCw2ICsz
ODcsOCBAQCBzdGF0aWMgaW50IGRzaV9jbGtfaW5pdChzdHJ1Y3QgbXNtX2RzaV9ob3N0ICptc21f
aG9zdCkKIAkJCQlfX2Z1bmNfXywgY2ZnLT5idXNfY2xrX25hbWVzW2ldLCByZXQpOwogCQkJZ290
byBleGl0OwogCQl9CisKKwkJY2xrX3ByZXBhcmVfZW5hYmxlKG1zbV9ob3N0LT5idXNfY2xrc1tp
XSk7CiAJfQogCiAJLyogZ2V0IGxpbmsgYW5kIHNvdXJjZSBjbG9ja3MgKi8KQEAgLTQzNiw2ICs0
MzUsMTYgQEAgc3RhdGljIGludCBkc2lfY2xrX2luaXQoc3RydWN0IG1zbV9kc2lfaG9zdCAqbXNt
X2hvc3QpCiAKIAlpZiAoY2ZnX2huZC0+b3BzLT5jbGtfaW5pdF92ZXIpCiAJCXJldCA9IGNmZ19o
bmQtPm9wcy0+Y2xrX2luaXRfdmVyKG1zbV9ob3N0KTsKKworCS8qCisJICogRG8gYW4gZXh0cmEg
ZW5hYmxlL2Rpc2FibGUgc2VxdWVuY2UgaW5pdGlhbGx5IHRvIGVuc3VyZSB0aGUKKwkgKiBjbG9j
a3MgYXJlIGFjdHVhbGx5IG9mZiwgaWYgbGVmdCBlbmFibGVkIGJ5IGJvb3Rsb2FkZXIuLgorCSAq
LworCXJldCA9IGNmZ19obmQtPm9wcy0+bGlua19jbGtfZW5hYmxlKG1zbV9ob3N0KTsKKwlpZiAo
IXJldCkKKwkJY2ZnX2huZC0+b3BzLT5saW5rX2Nsa19kaXNhYmxlKG1zbV9ob3N0KTsKKwlyZXQg
PSAwOworCiBleGl0OgogCXJldHVybiByZXQ7CiB9CkBAIC0xODU1LDYgKzE4NjQsNyBAQCBpbnQg
bXNtX2RzaV9ob3N0X2luaXQoc3RydWN0IG1zbV9kc2kgKm1zbV9kc2kpCiAJfQogCiAJcG1fcnVu
dGltZV9lbmFibGUoJnBkZXYtPmRldik7CisJcG1fcnVudGltZV9nZXRfc3luYygmcGRldi0+ZGV2
KTsKIAogCW1zbV9ob3N0LT5jZmdfaG5kID0gZHNpX2dldF9jb25maWcobXNtX2hvc3QpOwogCWlm
ICghbXNtX2hvc3QtPmNmZ19obmQpIHsKQEAgLTE4ODUsNiArMTg5NSw4IEBAIGludCBtc21fZHNp
X2hvc3RfaW5pdChzdHJ1Y3QgbXNtX2RzaSAqbXNtX2RzaSkKIAkJZ290byBmYWlsOwogCX0KIAor
CXBtX3J1bnRpbWVfcHV0X3N5bmMoJnBkZXYtPmRldik7CisKIAltc21faG9zdC0+cnhfYnVmID0g
ZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIFNaXzRLLCBHRlBfS0VSTkVMKTsKIAlpZiAoIW1zbV9o
b3N0LT5yeF9idWYpIHsKIAkJcmV0ID0gLUVOT01FTTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L3BsbC9kc2lfcGxsXzEwbm0uYwppbmRleCBhYWJhYjYzMTEwNDMuLmQwMTcyZDhkYjg4MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGxsL2RzaV9wbGxfMTBubS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BsbC9kc2lfcGxsXzEwbm0uYwpAQCAtMzU0LDYgKzM1
NCw3IEBAIHN0YXRpYyBpbnQgZHNpX3BsbF8xMG5tX2xvY2tfc3RhdHVzKHN0cnVjdCBkc2lfcGxs
XzEwbm0gKnBsbCkKIAlpZiAocmMpCiAJCXByX2VycigiRFNJIFBMTCglZCkgbG9jayBmYWlsZWQs
IHN0YXR1cz0weCUwOHhcbiIsCiAJCSAgICAgICBwbGwtPmlkLCBzdGF0dXMpOworcmMgPSAwOyAv
LyBIQUNLLCB0aGlzIHdpbGwgZmFpbCBpZiBQTEwgYWxyZWFkeSBydW5uaW5nLi4KIAogCXJldHVy
biByYzsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
