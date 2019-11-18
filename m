Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB2100296
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 11:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4756E334;
	Mon, 18 Nov 2019 10:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639006E260
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 10:35:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n1so18758444wra.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 02:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U+mnkihGleGDkz4cDlq1mLe29a8SOWxU0+l2t1XXTsM=;
 b=aafg+B1eEGpfW3aiBPhhT46/3KRib54oWktcKOHSYdCX0CU08KIQvRURSrqM563UnV
 f47E20EALvQ8I2kA6JFsZiS2EC7f9HnpktIqPC/DFVqpBG21KAfWX0O2PrBv4ZGDxAm5
 jwftviNxqBhF3dXp9cc8tzaMUziGjf8dE6/sJwnepKD0xxuqpKCKMwgvg1jvqpZl/8nG
 doVTGeNWWZE58JMa1EkuvBXA6Nc4zuhFSmIG/9CAsoeaDZxBUHYu0vY5KnAfejkW0ErA
 dzGGYonNaqRUfoGXFJW4mM5/qt2eRNvtKGZX+Pme5FJtz5/goHcG6etxN28rT6geeqt7
 4L9g==
X-Gm-Message-State: APjAAAVPLRLeotx3ecq62UhiipVAD/Zp2oYOB7mtSpWXHSzUiBKJfEsJ
 wzcHHDg76R35dFUsNuUPHJVtgNJTd1I=
X-Google-Smtp-Source: APXvYqzozGBqOejgw5+ZgybYSc6jvyuvTvJnin4nV8lOaRoK+ViPBQ0kjctGRaZWOGVKaQEY//LxDg==
X-Received: by 2002:a5d:6083:: with SMTP id w3mr10863416wrt.308.1574073357688; 
 Mon, 18 Nov 2019 02:35:57 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:57 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/15] drm/tee_shm: Drop dma_buf_k(unmap) support
Date: Mon, 18 Nov 2019 11:35:33 +0100
Message-Id: <20191118103536.17675-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+mnkihGleGDkz4cDlq1mLe29a8SOWxU0+l2t1XXTsM=;
 b=RR2OzqVMDpULL+gS2tHr0M+ZMjNZ5gKVSX3SlUePY2ypTYNyj/EXJfTxJIphgLHle3
 mB7l4HfL83nmzQOHXVl9t8F9sUIuceYAkUTLqE+yjK+tSUTWliD5Hu+1E7wn8GyLk6ur
 k+dehpjIQhD43Jts4rOcdlGI3FIOtyAihnPHA=
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 tee-dev@lists.linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBubyBpbi10cmVlIHVzZXJzIGFueW1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgpDYzogSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+CkNjOiB0
ZWUtZGV2QGxpc3RzLmxpbmFyby5vcmcKLS0KQWNrIGZvciBtZXJnaW5nIHRoaXMgdGhyb3VnaCBk
cm0gdHJlZXMgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLgotRGFuaWVsCi0tLQogZHJpdmVycy9taXNj
L2Zhc3RycGMuYyB8IDggLS0tLS0tLS0KIGRyaXZlcnMvdGVlL3RlZV9zaG0uYyAgfCA2IC0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21pc2MvZmFzdHJwYy5jIGIvZHJpdmVycy9taXNjL2Zhc3RycGMuYwppbmRleCAxYjFhNzk0ZDYz
OWQuLmQwY2JlZjllYzI4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9taXNjL2Zhc3RycGMuYworKysg
Yi9kcml2ZXJzL21pc2MvZmFzdHJwYy5jCkBAIC01NTUsMTMgKzU1NSw2IEBAIHN0YXRpYyB2b2lk
IGZhc3RycGNfZG1hX2J1Zl9kZXRhdGNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCiAJa2ZyZWUo
YSk7CiB9CiAKLXN0YXRpYyB2b2lkICpmYXN0cnBjX2ttYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1
ZiwgdW5zaWduZWQgbG9uZyBwZ251bSkKLXsKLQlzdHJ1Y3QgZmFzdHJwY19idWYgKmJ1ZiA9IGRt
YWJ1Zi0+cHJpdjsKLQotCXJldHVybiBidWYtPnZpcnQgPyBidWYtPnZpcnQgKyBwZ251bSAqIFBB
R0VfU0laRSA6IE5VTEw7Ci19Ci0KIHN0YXRpYyB2b2lkICpmYXN0cnBjX3ZtYXAoc3RydWN0IGRt
YV9idWYgKmRtYWJ1ZikKIHsKIAlzdHJ1Y3QgZmFzdHJwY19idWYgKmJ1ZiA9IGRtYWJ1Zi0+cHJp
djsKQEAgLTU4NSw3ICs1NzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIGZh
c3RycGNfZG1hX2J1Zl9vcHMgPSB7CiAJLm1hcF9kbWFfYnVmID0gZmFzdHJwY19tYXBfZG1hX2J1
ZiwKIAkudW5tYXBfZG1hX2J1ZiA9IGZhc3RycGNfdW5tYXBfZG1hX2J1ZiwKIAkubW1hcCA9IGZh
c3RycGNfbW1hcCwKLQkubWFwID0gZmFzdHJwY19rbWFwLAogCS52bWFwID0gZmFzdHJwY192bWFw
LAogCS5yZWxlYXNlID0gZmFzdHJwY19yZWxlYXNlLAogfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dGVlL3RlZV9zaG0uYyBiL2RyaXZlcnMvdGVlL3RlZV9zaG0uYwppbmRleCAwOWRkY2QwNmM3MTUu
LjkzN2FjNWFhYTZkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy90ZWUvdGVlX3NobS5jCisrKyBiL2Ry
aXZlcnMvdGVlL3RlZV9zaG0uYwpAQCAtNzEsMTEgKzcxLDYgQEAgc3RhdGljIHZvaWQgdGVlX3No
bV9vcF9yZWxlYXNlKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCiAJdGVlX3NobV9yZWxlYXNlKHNo
bSk7CiB9CiAKLXN0YXRpYyB2b2lkICp0ZWVfc2htX29wX21hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1h
YnVmLCB1bnNpZ25lZCBsb25nIHBnbnVtKQotewotCXJldHVybiBOVUxMOwotfQotCiBzdGF0aWMg
aW50IHRlZV9zaG1fb3BfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKIHsKIAlzdHJ1Y3QgdGVlX3NobSAqc2htID0gZG1hYnVmLT5wcml2OwpA
QCAtOTMsNyArODgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIHRlZV9zaG1f
ZG1hX2J1Zl9vcHMgPSB7CiAJLm1hcF9kbWFfYnVmID0gdGVlX3NobV9vcF9tYXBfZG1hX2J1ZiwK
IAkudW5tYXBfZG1hX2J1ZiA9IHRlZV9zaG1fb3BfdW5tYXBfZG1hX2J1ZiwKIAkucmVsZWFzZSA9
IHRlZV9zaG1fb3BfcmVsZWFzZSwKLQkubWFwID0gdGVlX3NobV9vcF9tYXAsCiAJLm1tYXAgPSB0
ZWVfc2htX29wX21tYXAsCiB9OwogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
