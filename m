Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BEE3D1D2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C04489255;
	Tue, 11 Jun 2019 16:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848CA89254
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:09:56 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so15169053qtk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=84AZ1qzhWwhqGLJfreQPMMiAL6l+Ryk8Xjl8Qwr94gE=;
 b=ZA7PSpFY5NYaytp5C9QRVdWMA8XEfqlCZ58njCunQSqThJAFSTt5q2iumC9WuyCiY8
 eqi4bLg/U7UmH/GVOQXxMrPJTKAjMUFos06ElGRmNpaVu1jXv/UdAaeXH+5KtGtliSNi
 JY1H7Q+HKYPzu3MKSHUZPMZ7bjh4TwFyhSYqw92tzQWlXDlcS6MG7X2eegtb18bCFQyH
 jP1P7GrzwBNPHGsZLj+7pNDh1VZL0ouoKUJ94JRrjIDiq5ryuBtPC7ys/Q6C3MX0ILT7
 i30i1nZzqyv5IJVc8KsX276d4L+reC0XetBc8hg0YPOYxpS+w1lQ1wPQkH5d5XXznE09
 jvCw==
X-Gm-Message-State: APjAAAUiMZzSPG2a7Oi+O60oWHFIVxzwDCi6lVHF6gMRAjkPfcoFvZZK
 SA6chJQkHcZXZwXhNvTugn6TcyaZ/BI=
X-Google-Smtp-Source: APXvYqzGY/B6xs6GrnF7f73Zb2DZamuvZy9MEBAUk3QRK73Lbvgd2Jm0nYj2Cxlr/eHbYenOMNxqPw==
X-Received: by 2002:a05:6214:1024:: with SMTP id
 k4mr18841347qvr.124.1560269395598; 
 Tue, 11 Jun 2019 09:09:55 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d188sm6755094qkf.40.2019.06.11.09.09.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 09:09:55 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/11] drm/rockchip: Check for fast link training before
 enabling psr
Date: Tue, 11 Jun 2019 12:08:21 -0400
Message-Id: <20190611160844.257498-8-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611160844.257498-1-sean@poorly.run>
References: <20190611160844.257498-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=84AZ1qzhWwhqGLJfreQPMMiAL6l+Ryk8Xjl8Qwr94gE=;
 b=F9TIoxODkwzaqItYN8EKNvZ1oofQ3Z7MX9PjZrJ5P3ORKpsAYx4563cM5M+Tr4urlQ
 Bc7xmY3GJcM0gbZpzTp2VqosyKKAo1GMXtOZzltQ3x9rroHnHSlBD+liJz5uuI8SG6vH
 tRfveHZc4y0sFsFSrzfioQhS9leIkVePOvC/8MmAGXeWEaQ4sb6ylvgdx9T1zbYr/TDJ
 lAmQJS2VSI2yZXby4CXI6KoB3eb68MH6SBgscBxiRoH8dasDPbKai7fgf4xNWwbaa086
 z3KKc1TXKYkNzt7wMFzzRxUyTraVcfq1NWay3cDdLLO7eEiR4vBNHAxAfbeouo01WYkk
 t3Yg==
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
Cc: Zain Wang <wzz@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Tomasz Figa <tfiga@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpPbmNlIHdlIHN0YXJ0IHNo
dXR0aW5nIG9mZiB0aGUgbGluayBkdXJpbmcgUFNSLCB3ZSdyZSBnb2luZyB0byB3YW50IGZhc3QK
dHJhaW5pbmcgdG8gd29yay4gSWYgdGhlIGRpc3BsYXkgZG9lc24ndCBzdXBwb3J0IGZhc3QgdHJh
aW5pbmcsIGRvbid0CmVuYWJsZSBwc3IuCgpDaGFuZ2VzIGluIHYyOgotIE5vbmUKQ2hhbmdlcyBp
biB2MzoKLSBOb25lCkNoYW5nZXMgaW4gdjQ6Ci0gTm9uZQpDaGFuZ2VzIGluIHY1OgotIE5vbmUK
CkxpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dp
ZC8yMDE5MDIyODIxMDkzOS44MzM4Ni0zLXNlYW5AcG9vcmx5LnJ1bgpMaW5rIHRvIHYyOiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTAzMjYyMDQ1MDku
OTY1MTUtMi1zZWFuQHBvb3JseS5ydW4KTGluayB0byB2MzogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNTAyMTk0OTU2LjIxODQ0MS05LXNlYW5AcG9v
cmx5LnJ1bgpMaW5rIHRvIHY0OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0
Y2gvbXNnaWQvMjAxOTA1MDgxNjA5MjAuMTQ0NzM5LTgtc2VhbkBwb29ybHkucnVuCgpDYzogWmFp
biBXYW5nIDx3enpAcm9jay1jaGlwcy5jb20+CkNjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21p
dW0ub3JnPgpUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+ClNpZ25l
ZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jIHwgOSArKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwppbmRl
eCBkMmRlOThkNDQxODQ1Li5hMDdkMTllMDhiODAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYwpAQCAtMTA0MCwxNiArMTA0MCwx
NyBAQCBzdGF0aWMgaW50IGFuYWxvZ2l4X2RwX2NvbW1pdChzdHJ1Y3QgYW5hbG9naXhfZHBfZGV2
aWNlICpkcCkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJLyogQ2hlY2sgd2hldGhlciBw
YW5lbCBzdXBwb3J0cyBmYXN0IHRyYWluaW5nICovCisJcmV0ID0gYW5hbG9naXhfZHBfZmFzdF9s
aW5rX3RyYWluX2RldGVjdGlvbihkcCk7CisJaWYgKHJldCkKKwkJZHAtPnBzcl9lbmFibGUgPSBm
YWxzZTsKKwogCWlmIChkcC0+cHNyX2VuYWJsZSkgewogCQlyZXQgPSBhbmFsb2dpeF9kcF9lbmFi
bGVfc2lua19wc3IoZHApOwogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAl9CiAKLQkvKiBD
aGVjayB3aGV0aGVyIHBhbmVsIHN1cHBvcnRzIGZhc3QgdHJhaW5pbmcgKi8KLQlyZXQgPSAgYW5h
bG9naXhfZHBfZmFzdF9saW5rX3RyYWluX2RldGVjdGlvbihkcCk7Ci0JaWYgKHJldCkKLQkJZHAt
PnBzcl9lbmFibGUgPSBmYWxzZTsKIAogCXJldHVybiByZXQ7CiB9Ci0tIApTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
