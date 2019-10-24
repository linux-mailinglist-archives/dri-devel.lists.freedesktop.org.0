Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC852E38A8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F686E4FB;
	Thu, 24 Oct 2019 16:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D33B6E4BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r141so3262326wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eF+YcAgQiBm0mPw0I9xhh8vL6WGqhRLDBDhFt2a9/Oc=;
 b=fgjRZWNfk4WmQyfzUyjOiwLIiPyiHyZKTS2zjj0FyPsoDWaG0IxsYMQ7tuKslOIFD6
 FgT2RN0H7pLt3rXXGRyuDvItduYYA63z1w8FZQ7Cw+rxXktGUgKtY8rdof7KdN6sjj0R
 Cto8E5BRVsOjhQ6yJErXKzeRO/uKBRnFWlxlEjaL4a5h166cuNylrUa361oy5KkchBRd
 X2LtGZdJL11Fw6XhjV7X/0pbolkZSycUnJ0s/dnPa3MiBfu06hj30BgB2PcV97ToVJFQ
 TouemowOBNhnMF8nPIhga19YhtMHuTgmKTg0ohByfbzik+h594XjzNxd/FtLMMoGQR5z
 K1uA==
X-Gm-Message-State: APjAAAU2QlApOUPYbfw9A+k2EyBEVE1jFBp7MwwLvIQ5nxiBWhsbb209
 0wT7ZKYNHI+3EnBAFtKyc6gEDuN/
X-Google-Smtp-Source: APXvYqxOgnq4flJoy7BqWhlvmgY1DBITgCFfSAP79ZN7v9S/Q2oJCN4+sXhRdqB3KX2X0POCsolqtQ==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr5550632wmj.73.1571935561964; 
 Thu, 24 Oct 2019 09:46:01 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id l8sm10077273wru.22.2019.10.24.09.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 11/32] drm/tegra: dp: Read AUX read interval from DPCD
Date: Thu, 24 Oct 2019 18:45:13 +0200
Message-Id: <20191024164534.132764-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eF+YcAgQiBm0mPw0I9xhh8vL6WGqhRLDBDhFt2a9/Oc=;
 b=M6jfENkJo3FjTB+X/IJHkMe4ddP++PDR0rga1S9dy1uyza5fuVQKXcRtgUnVACgKhY
 sQgRCQB7V6p0YFmecfOpST9/p7EXxpfaxWyFyBRpWeS8iBw8PfvOQoAglILacNQUD+lO
 PLU3YYhIGL5D6MSxJ7RsBsDi5rWhzIE7XgBFWejgZaTr5ZJwlqBPLyvOLUoTCF5rYCiu
 hX5IUCfV4tuQhu9odM5FL3ZkIo/5yLTfZbXHwG5XJHS8LYFsvgYmrjWaIVfO8fHGVm3b
 mu7u41K80lymQ12sjrmx6TuRydFxrJWA6+xSqbud4OrRmEsPybx7Y9EcpmMKvl0ArjCC
 Arnw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClN0b3JlIHRoZSBBVVgg
cmVhZCBpbnRlcnZhbCBmcm9tIERQQ0QsIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgdG8gd2FpdApm
b3IgdGhlIGR1cmF0aW9ucyBnaXZlbiBpbiB0aGUgc3BlY2lmaWNhdGlvbiBkdXJpbmcgbGluayB0
cmFpbmluZy4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMgfCAzMSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuaCB8IDExICsrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jCmluZGV4
IDJiZTBhNDdlY2JlYy4uNzU3YTAyNTY1OTJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwpAQCAtNDAsNiArNDAs
OCBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19yZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxp
bmspCiAJbGluay0+bWF4X2xhbmVzID0gMDsKIAogCWRybV9kcF9saW5rX2NhcHNfcmVzZXQoJmxp
bmstPmNhcHMpOworCWxpbmstPmF1eF9yZF9pbnRlcnZhbC5jciA9IDA7CisJbGluay0+YXV4X3Jk
X2ludGVydmFsLmNlID0gMDsKIAlsaW5rLT5lZHAgPSAwOwogCiAJbGluay0+cmF0ZSA9IDA7CkBA
IC02MCw2ICs2Miw3IEBAIHN0YXRpYyB2b2lkIGRybV9kcF9saW5rX3Jlc2V0KHN0cnVjdCBkcm1f
ZHBfbGluayAqbGluaykKIGludCBkcm1fZHBfbGlua19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCiB7CiAJdTggZHBjZFtEUF9SRUNFSVZFUl9D
QVBfU0laRV0sIHZhbHVlOworCXVuc2lnbmVkIGludCByZF9pbnRlcnZhbDsKIAlpbnQgZXJyOwog
CiAJZHJtX2RwX2xpbmtfcmVzZXQobGluayk7CkBAIC05MCw2ICs5MywzNCBAQCBpbnQgZHJtX2Rw
X2xpbmtfcHJvYmUoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9saW5rICps
aW5rKQogCQkJbGluay0+ZWRwID0gZHJtX2RwX2VkcF9yZXZpc2lvbnNbdmFsdWVdOwogCX0KIAor
CS8qCisJICogVGhlIERQQ0Qgc3RvcmVzIHRoZSBBVVggcmVhZCBpbnRlcnZhbCBpbiB1bml0cyBv
ZiA0IG1zLiBUaGVyZSBhcmUKKwkgKiB0d28gc3BlY2lhbCBjYXNlczoKKwkgKgorCSAqICAgMSkg
aWYgdGhlIFRSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTCBmaWVsZCBpcyAwLCB0aGUgY2xvY2sgcmVj
b3ZlcnkKKwkgKiAgICAgIGFuZCBjaGFubmVsIGVxdWFsaXphdGlvbiBzaG91bGQgdXNlIDEwMCB1
cyBvciA0MDAgdXMgQVVYIHJlYWQKKwkgKiAgICAgIGludGVydmFscywgcmVzcGVjdGl2ZWx5CisJ
ICoKKwkgKiAgIDIpIGZvciBEUCB2MS40IGFuZCBhYm92ZSwgY2xvY2sgcmVjb3Zlcnkgc2hvdWxk
IGFsd2F5cyB1c2UgMTAwIHVzCisJICogICAgICBBVVggcmVhZCBpbnRlcnZhbHMKKwkgKi8KKwly
ZF9pbnRlcnZhbCA9IGRwY2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCisJCQkgICBE
UF9UUkFJTklOR19BVVhfUkRfTUFTSzsKKworCWlmIChyZF9pbnRlcnZhbCA+IDQpIHsKKwkJRFJN
X0RFQlVHX0tNUygiQVVYIGludGVydmFsICV1IG91dCBvZiByYW5nZSAobWF4LiA0KVxuIiwKKwkJ
CSAgICAgIHJkX2ludGVydmFsKTsKKwkJcmRfaW50ZXJ2YWwgPSA0OworCX0KKworCXJkX2ludGVy
dmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOworCisJaWYgKHJkX2ludGVydmFsID09IDAgfHwgbGlu
ay0+cmV2aXNpb24gPj0gRFBfRFBDRF9SRVZfMTQpCisJCWxpbmstPmF1eF9yZF9pbnRlcnZhbC5j
ciA9IDEwMDsKKworCWlmIChyZF9pbnRlcnZhbCA9PSAwKQorCQlsaW5rLT5hdXhfcmRfaW50ZXJ2
YWwuY2UgPSA0MDA7CisKIAlsaW5rLT5yYXRlID0gbGluay0+bWF4X3JhdGU7CiAJbGluay0+bGFu
ZXMgPSBsaW5rLT5tYXhfbGFuZXM7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdy
YS9kcC5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmgKaW5kZXggNjgxY2JkMGEwMDk0Li4x
ZmUyZDRmNDViYTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCkBAIC02MCw2ICs2MCw3IEBAIHZvaWQgZHJtX2Rw
X2xpbmtfY2Fwc19jb3B5KHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpkZXN0LAogICogQG1heF9y
YXRlOiBtYXhpbXVtIGNsb2NrIHJhdGUgc3VwcG9ydGVkIG9uIHRoZSBsaW5rCiAgKiBAbWF4X2xh
bmVzOiBtYXhpbXVtIG51bWJlciBvZiBsYW5lcyBzdXBwb3J0ZWQgb24gdGhlIGxpbmsKICAqIEBj
YXBzOiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkIG9uIHRoZSBsaW5rIChzZWUgJmRybV9kcF9saW5r
X2NhcHMpCisgKiBAYXV4X3JkX2ludGVydmFsOiBBVVggcmVhZCBpbnRlcnZhbCB0byB1c2UgZm9y
IHRyYWluaW5nIChpbiBtaWNyb3NlY29uZHMpCiAgKiBAZWRwOiBlRFAgcmV2aXNpb24gKDB4MTE6
IGVEUCAxLjEsIDB4MTI6IGVEUCAxLjIsIC4uLikKICAqIEByYXRlOiBjdXJyZW50bHkgY29uZmln
dXJlZCBsaW5rIHJhdGUKICAqIEBsYW5lczogY3VycmVudGx5IGNvbmZpZ3VyZWQgbnVtYmVyIG9m
IGxhbmVzCkBAIC03MCw2ICs3MSwxNiBAQCBzdHJ1Y3QgZHJtX2RwX2xpbmsgewogCXVuc2lnbmVk
IGludCBtYXhfbGFuZXM7CiAKIAlzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyBjYXBzOworCisJLyoq
CisJICogQGNyOiBjbG9jayByZWNvdmVyeSByZWFkIGludGVydmFsCisJICogQGNlOiBjaGFubmVs
IGVxdWFsaXphdGlvbiByZWFkIGludGVydmFsCisJICovCisJc3RydWN0IHsKKwkJdW5zaWduZWQg
aW50IGNyOworCQl1bnNpZ25lZCBpbnQgY2U7CisJfSBhdXhfcmRfaW50ZXJ2YWw7CisKIAl1bnNp
Z25lZCBjaGFyIGVkcDsKIAogCXVuc2lnbmVkIGludCByYXRlOwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
