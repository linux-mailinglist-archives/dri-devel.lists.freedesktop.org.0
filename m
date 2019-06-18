Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9065D49FCE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 13:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31016E153;
	Tue, 18 Jun 2019 11:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF0C6E149;
 Tue, 18 Jun 2019 11:54:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u8so2941826wmm.1;
 Tue, 18 Jun 2019 04:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=MgigXJGQ0GwLhXhwQSG+CIuZkPM0ksRSjm6aqRV356T/QW5cc64emmtCKDhzr+mfM9
 njvFUt26kGRRqK7MhDgs7DAZVBulvdRBb2eR+RBZ1MONAT8MgY5tkYvnTY+bQ8c+f3DC
 PD1bYFvjLA2NE2rjFpR5RPjpGxUpyxQuphCNNJz2CVjRP3cVMjwcvZmP5PqlporVqAAF
 mRBi3fFGtKFJBw5HhT+GG2dqz8645EPH8zzcsXkKDmIx2e5Mc44JJEJIc8mk3Cpe5tnL
 4S/6qVV8nDQl72hIBE3xT0wMcNZGzZLjKGyect2QyE6HTBA891XRagKEFIgf+U+A2QKc
 ERuw==
X-Gm-Message-State: APjAAAUKvdQkql35Yhue8VZ6O/X/k9751fU46SAuMWysEpiL2KK/Nb19
 ALi9PcLaMsc3Q+54HPSa9L0xeum+
X-Google-Smtp-Source: APXvYqxN2ET+KGmMQMS3DF0Ncs5179nIt5kgUiKwnE/hNgiiilhK+gjzRPDqBJ0sl7UV5T/bQGLr+w==
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr3314904wmm.153.1560858897602; 
 Tue, 18 Jun 2019 04:54:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:88da:f390:6b90:ca6c])
 by smtp.gmail.com with ESMTPSA id l19sm1441963wmj.33.2019.06.18.04.54.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 04:54:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: remove the backing store if no placement is given
Date: Tue, 18 Jun 2019 13:54:51 +0200
Message-Id: <20190618115455.1253-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618115455.1253-1-christian.koenig@amd.com>
References: <20190618115455.1253-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=vI0pUALhAIg70bP4aHzPnlvEYBcuwIBmi8A+NKd5yK6/K0UxPa5BxZe2Q7/yfhIkqV
 XSW8BRFRjqqIOsQ52ux8p/R3u6wXuHx/8isiFbhsxPorXUSzJzDefaBA0jIRmXVecweD
 vCtHbr5hzFlxtRku6JhBYaxammMbRxNce7PBM1wnnDqGRBFDrcAByb7mB+o8Y+IBASOG
 7hsb6OAK3htrEbm3kqSN47qIoooiGnVh45VN+BB8WaEr6132rRcjYU14KoZVlcIvfLN+
 Vi4C9StpRi5gPSHmPnz3yTOupgrJeDfktoP3wsiP99dEOM8wxmPtyVK+NzN3e5pZMrwK
 PCSA==
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

UGlwZWxpbmUgcmVtb3ZhbCBvZiB0aGUgQk9zIGJhY2tpbmcgc3RvcmUgd2hlbiBubyBwbGFjZW1l
bnQgaXMgZ2l2ZW4KZHVyaW5nIHZhbGlkYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBjN2RlNjY3ZDQ4MmEuLjY4MmExYTAzNWIzNSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMjQwLDYgKzEyNDAsMTggQEAgaW50IHR0bV9ib192YWxp
ZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXVpbnQzMl90IG5ld19mbGFnczsK
IAogCXJlc2VydmF0aW9uX29iamVjdF9hc3NlcnRfaGVsZChiby0+cmVzdik7CisKKwkvKgorCSAq
IFJlbW92ZSB0aGUgYmFja2luZyBzdG9yZSBpZiBubyBwbGFjZW1lbnQgaXMgZ2l2ZW4uCisJICov
CisJaWYgKCFwbGFjZW1lbnQtPm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC0+bnVtX2J1c3lf
cGxhY2VtZW50KSB7CisJCXJldCA9IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsKKwkJaWYg
KHJldCkKKwkJCXJldHVybiByZXQ7CisKKwkJcmV0dXJuIHR0bV90dF9jcmVhdGUoYm8sIGZhbHNl
KTsKKwl9CisKIAkvKgogCSAqIENoZWNrIHdoZXRoZXIgd2UgbmVlZCB0byBtb3ZlIGJ1ZmZlci4K
IAkgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
