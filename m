Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26150D01
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 15:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A53489B8E;
	Mon, 24 Jun 2019 13:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286A089B60;
 Mon, 24 Jun 2019 13:58:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p11so14026271wre.7;
 Mon, 24 Jun 2019 06:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=hHt9TE4icgfoh7j5uLnyKTVoCC1W5MX6izzTvoT2OaHtamTHKn1dqrSb9GklY/y0T6
 HPiDuTVvDyL+XHt50VTlZ8czTv2nQv44unq/qxsuyIOILniU9QRmp5aMG1KUbpWWU2J8
 aomrn/owG1B6nRvTJGbBERxyJYHNs7fSrO5EUwiSKDcchrWY0DLqkv5zKgXu23+b0ym4
 dI39O+Lv3RNbHkaIp3Zrj6YSAiD+xwz8Fo9FhfCholt3wlBcr6esZYRiWmPgEljbUHrh
 D4YieDbJbD5uDSlPibz5vPGN7B++F+gEuP3aJBFLFQiN7Dnieb2CBBc/JIdRuGZFHmWD
 w5RA==
X-Gm-Message-State: APjAAAWxMp/J8L/r2Myyntw8ozGiiY/CrtHXhIoKQVpvXX7fbPhQ+AAP
 CxJ7YnXjwhscLHlpv6E05AAx66V+
X-Google-Smtp-Source: APXvYqwk2lIHGpzl+rLL85vLhvfhO73L/4V44hFIu642bbxheTMJwxiZs3BYAvkgrFJMsrfzQ99SkA==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr26337205wrv.321.1561384721745; 
 Mon, 24 Jun 2019 06:58:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c026:1db1:e413:81a2])
 by smtp.gmail.com with ESMTPSA id y19sm14848623wmc.21.2019.06.24.06.58.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 06:58:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/ttm: remove the backing store if no placement is given
Date: Mon, 24 Jun 2019 15:58:35 +0200
Message-Id: <20190624135839.1661-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624135839.1661-1-christian.koenig@amd.com>
References: <20190624135839.1661-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2IpMzv21zi/i5aOswxazxdECS2gQzcyfmft+Y6vYyCk=;
 b=QF4VegXBwGAsCjxq6SDKAOxSMRhwsBtf6ouT/0dSTy05UjTymkuPBcBLEB7teWz0SV
 G+x5OzdmqrpKZmkpSJqssVC4xoVQEY/HKgJ1RFcR7tV32eRSVXxWaQ3mJ/UDSnnflNNw
 CIHMDkSeiha2XMEJ0958aS+VWNhTogHrff0DF3iEjpkp0znh1gxDqUeEDdMdS76BhzM/
 sZlqUL7S6t6jJDErfM4IJAxZWS01U8cZ8IvYpuU78Z23f4I71QpUV1PO8zrpj+9wfzRx
 x1I6hiG2CkpAmCiaErJCfLK4gF6Nz6bEuxS1kHBzSVa3zxQiiNpB7u0f4deoumtWsya5
 ayQA==
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
