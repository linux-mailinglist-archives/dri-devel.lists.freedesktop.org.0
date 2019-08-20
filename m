Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCF0959DE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B858B6E795;
	Tue, 20 Aug 2019 08:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432C96E788
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z1so11449621wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L5KPw5d284IbrMAoTx1V+ek9Af8RjMLhhCTcT5HNr1o=;
 b=GY/Yl+e2Xs5B8cfaRv5g+mTT/iXqvbpikQwIit+9VR6inKTZLcGhIOBnUF3k/ZhqNj
 xqwm662E2H9q9kM/InzN1rzMx9SVpWGZkpG0A1E4L4rgY7mt3c+QoJ7lvhWJl5eOFiJw
 BCZPkP5m8XGR9fFiOko5AcC3/2kdgpvvClzczpKJXpWIh/miFP1FL9YyBfjDqVSvvF9K
 RocNAcOhVk8shPbYm+rNYZraKvZz+fNVttN09VtgaHjSaHUNf8LNtfO5j2YWc1YXgCmp
 9g6eUpgV/xXq1dk6oFF3OepM2NtNThbWy4iZ0GS04CqQmWWLXkPXKh89iwA89zCtNaMi
 0T4Q==
X-Gm-Message-State: APjAAAWhWsMciLqTp3rJ17zpNignEml65eJB4XoOvXI8jcJzkuzjbNuS
 UORVHBDV63dFO+eSWSc1Mzh2MQ==
X-Google-Smtp-Source: APXvYqzPgvUubcWqtUwShfydVe+2jVHgqlhH1mD4p0zOrAFDM3WZ70Ezpo0RWAwQj8DuZOeWm5T2xw==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr32354386wrv.299.1566290473617; 
 Tue, 20 Aug 2019 01:41:13 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 01/11] fixup! drm/bridge: Add the necessary bits to support bus
 format negotiation
Date: Tue, 20 Aug 2019 10:40:59 +0200
Message-Id: <20190820084109.24616-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L5KPw5d284IbrMAoTx1V+ek9Af8RjMLhhCTcT5HNr1o=;
 b=OTazuxgSobVpwG3fC5+kdrt2Vu/JKNOMsnyB8TitxtwiNZe5WhU5jRqZ8oB4dvEg7d
 aCvt1U6J6NPjB9ORiM+F64aSI5HS9V1gXEkGNnNsbLJkNPsRQNIXTSbMJJ+9aJO4Dn/x
 iE1+jC9Fw7+x263Uz+F2byJSR9LeKUG8XQJBd4/M7vsU7hjLy31Xr091fVDS6ZAIvu4H
 jUI6Ui6icqsYUqrBmSoZkE6K7IZHhbuMOaf5VxYYkUKNv/vD24G+mngDEwmcq3Jv6LzT
 pndCIbuE6B/zyThbR0KhFYn1H3iQpZVaLQtKMHu5Oy7kON5GchddvzlN3zi5QyOsSfVP
 rSAg==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiArCX0gZWxzZSBpZiAoYi0+bnVtX3N1cHBvcnRlZF9mbXRzID4gMSAmJiBiLT5zdXBwb3J0ZWRf
Zm10cykgewo+ICsJCSpzZWxlY3RlZF9idXNfZm10ID0gYi0+c3VwcG9ydGVkX2ZtdHNbMF07Cj4g
KwkJcmV0dXJuIDA7CgpIZXJlLCBgIWEtPm51bV9zdXBwb3J0ZWRfZm10cyAmJmAgaXMgbWlzc2lu
ZyBvdGhlcndpc2UgdGhpcyBjb2RlIHdpbGwKc2VsZWN0IGItPnN1cHBvcnRlZF9mbXRzWzBdIHdo
YXRldmVyIHRoZSBzdXBwb3J0ZWQgZm9ybWF0cyBvZiBhLgoKPiArCX0gZWxzZSBpZiAoYS0+bnVt
X3N1cHBvcnRlZF9mbXRzID4gMSAmJiBhLT5zdXBwb3J0ZWRfZm10cykgewo+ICsJCSpzZWxlY3Rl
ZF9idXNfZm10ID0gYS0+c3VwcG9ydGVkX2ZtdHNbMF07Cj4gKwkJcmV0dXJuIDA7CgpIZXJlLCBg
IWItPm51bV9zdXBwb3J0ZWRfZm10cyAmJmAgaXMgbWlzc2luZyBvdGhlcndpc2UgdGhpcyBjb2Rl
IHdpbGwKc2VsZWN0IGEtPnN1cHBvcnRlZF9mbXRzWzBdIHdoYXRldmVyIHRoZSBzdXBwb3J0ZWQg
Zm9ybWF0cyBvZiBiLgoKU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgfCA2ICsrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9icmlkZ2UuYwppbmRleCA1ZjA5MjU0NjcyOTIuLjgyZmU3NzI4ZmNkMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Jy
aWRnZS5jCkBAIC02MTUsMTAgKzYxNSwxMiBAQCBpbnQgZHJtX2ZpbmRfYmVzdF9idXNfZm9ybWF0
KGNvbnN0IHN0cnVjdCBkcm1fYnVzX2NhcHMgKmEsCiAJaWYgKCFhLT5udW1fc3VwcG9ydGVkX2Zt
dHMgJiYgIWItPm51bV9zdXBwb3J0ZWRfZm10cykgewogCQkqc2VsZWN0ZWRfYnVzX2ZtdCA9IDA7
CiAJCXJldHVybiAwOwotCX0gZWxzZSBpZiAoYi0+bnVtX3N1cHBvcnRlZF9mbXRzID4gMSAmJiBi
LT5zdXBwb3J0ZWRfZm10cykgeworCX0gZWxzZSBpZiAoIWEtPm51bV9zdXBwb3J0ZWRfZm10cyAm
JgorCQkgICBiLT5udW1fc3VwcG9ydGVkX2ZtdHMgPiAxICYmIGItPnN1cHBvcnRlZF9mbXRzKSB7
CiAJCSpzZWxlY3RlZF9idXNfZm10ID0gYi0+c3VwcG9ydGVkX2ZtdHNbMF07CiAJCXJldHVybiAw
OwotCX0gZWxzZSBpZiAoYS0+bnVtX3N1cHBvcnRlZF9mbXRzID4gMSAmJiBhLT5zdXBwb3J0ZWRf
Zm10cykgeworCX0gZWxzZSBpZiAoIWItPm51bV9zdXBwb3J0ZWRfZm10cyAmJgorCQkgICBhLT5u
dW1fc3VwcG9ydGVkX2ZtdHMgPiAxICYmIGEtPnN1cHBvcnRlZF9mbXRzKSB7CiAJCSpzZWxlY3Rl
ZF9idXNfZm10ID0gYS0+c3VwcG9ydGVkX2ZtdHNbMF07CiAJCXJldHVybiAwOwogCX0gZWxzZSBp
ZiAoIWEtPm51bV9zdXBwb3J0ZWRfZm10cyB8fCAhYS0+c3VwcG9ydGVkX2ZtdHMgfHwKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
