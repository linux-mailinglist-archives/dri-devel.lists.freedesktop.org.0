Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84A4C2C8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 23:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5006E46C;
	Wed, 19 Jun 2019 21:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17D86E46C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 21:11:49 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d126so328620pfd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 14:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hy05C9mn0/yIf2WjCYd8ymGDA+P844rg5bgddBHlUN8=;
 b=bY34Dd2TGo1snWhWXZbB45E4ke6wfb7op6o0rGmkZ8ScLOZys/fTixGqe3rBj/AH4l
 5pysBquK65U2CTCgktPU3h+Gi8YcpVG7o7KN3FD6m/41+MFofz/Pfw6sv2VnzDdkiVmE
 XIZy0qrb6ZY6IZasNSYZsc5xQykKqcJkXAodP0Kq/Lp4GNI6bFLXwY2yRhTBR/XwVq3B
 ikRedALpFnILPJHwK5JfMRfpN1TWFfxaiTBR7qhlMCY1AYfwLFjmEUo2B/tHilwzYWI3
 YdpTO+FSJx3gKC8IOEg+VyR4nXItCBBAGGIAf2oQVvSeQnSOX6NIDSpypNqKcjuTckmI
 FnnA==
X-Gm-Message-State: APjAAAWzcKNLbCG3LoblGp7TMkGp22gAzXSMNs5UHsDXloJqiOYN5DCS
 z6WBek03Lo8lClO9YjWGN7DVCw==
X-Google-Smtp-Source: APXvYqwXqPl24uyJF3v+5dkgkWEhaRF4Tfy/+nmYhsNEFIVfi0rh/PxJeKfAiWOS6/1USM4Ra2YThw==
X-Received: by 2002:a63:6b46:: with SMTP id g67mr1788869pgc.45.1560978708910; 
 Wed, 19 Jun 2019 14:11:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id p7sm35319117pfp.131.2019.06.19.14.11.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 14:11:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, seanpaul@chromium.org
Subject: [PATCH v2 2/2] drm/bridge/synopsys: dw-hdmi: Allow platforms to
 provide custom audio tables
Date: Wed, 19 Jun 2019 14:07:18 -0700
Message-Id: <20190619210718.134951-2-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190619210718.134951-1-dianders@chromium.org>
References: <20190619210718.134951-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hy05C9mn0/yIf2WjCYd8ymGDA+P844rg5bgddBHlUN8=;
 b=KGpaeoheFWBtMSk4WBMgOkawtt9gRWlcsmiS6qSo8xgzQC0X5za9DjD3rUH7b2a0re
 Tfg2n0jZMP+ZXKpDk2U9LapSmaxrigwOaUBbPePTSX7TI28dHCYv/th/bDTLjH3Bs2tJ
 dt8drzYooa55fn0wXwevkiH+aWBOLbRRBPZMs=
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
Cc: jernej.skrabec@siol.net, narmstrong@baylibre.com, maxime.ripard@bootlin.com,
 Zheng Yang <zhengyang@rock-chips.com>, David Airlie <airlied@linux.ie>,
 jonas@kwiboo.se, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org, jbrunet@baylibre.com,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>,
 cychiang@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gc29tZSBwbGF0Zm9ybXMgdXNpbmcgZHdfaGRtaSBpdCBtYXkgbm90IGJlIHBvc3NpYmxlIHRv
IG1ha2UgYW4gSERNSQpwaXhlbCBjbG9jayBleGFjdGx5LCBidXQgaXQgbWF5IGJlIHBvc3NpYmxl
IHRvIG1ha2UgYSByYXRlIHRoYXQgaXMKY2xvc2UgZW5vdWdoIHRvIGJlIHdpdGhpbiBzcGVjLiAg
Rm9yIGluc3RhbmNlIG9uIHJrMzI4OCB3ZSBjYW4gbWFrZQoyNSwxNzYsNDcxIEh6IGluc3RlYWQg
b2YgMjUsMTc0LDgyNS4xNzQ4Li4uIEh6ICgyNS4yIE1IeiAvIDEuMDAxKS4gIEEKZnV0dXJlIHBh
dGNoIHRvIHRoZSByazMyODggcGxhdGZvcm0gY29kZSBjb3VsZCBlbmFibGUgc3VwcG9ydCBmb3Ig
dGhpcwpjbG9jayByYXRlIGFuZCBzcGVjaWZ5IHRoZSBOL0NUUyB0aGF0IHdvdWxkIGJlIGlkZWFs
LgoKTk9URTogSSBoYXZlbid0IHlldCBwb3N0ZWQgc2FpZCBwYXRjaCBkdWUgdG8gY29tcGxleGl0
aWVzIHdpdGgga25vd2luZwp3aGV0aGVyIGR3X2hkbWkgY2FuIGNvbnRyb2wgdGhlIGR5bmFtaWMg
UExMIG9uIHJrMzI4OC4gIFRodXMgZm9yIG5vdwp0aGVyZSBhcmUgbm8gdXNlcnMgb2YgdGhpcyBm
ZWF0dXJlIHlldC4KClNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNo
cm9taXVtLm9yZz4KLS0tCgpDaGFuZ2VzIGluIHYyOgotIFNwbGl0IG91dCB0aGUgYWJpbGl0eSBv
ZiBhIHBsYXRmb3JtIHRvIHByb3ZpZGUgY3VzdG9tIHRhYmxlcy4KCiBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDI3ICsrKysrKysrKysrKysrLS0tLS0tLS0tCiBp
bmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8ICA4ICsrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwppbmRleCA3Y2RmZmViY2M3Y2IuLmI2
MDI3ZWRmMjk0MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMK
QEAgLTYwLDEzICs2MCw2IEBAIGVudW0gaGRtaV9kYXRhbWFwIHsKIAlZQ2JDcjQyMl8xMkIgPSAw
eDEyLAogfTsKIAotc3RydWN0IGR3X2hkbWlfYXVkaW9fdG1kc19uIHsKLQl1bnNpZ25lZCBsb25n
IHRtZHM7Ci0JdW5zaWduZWQgaW50IG5fMzJrOwotCXVuc2lnbmVkIGludCBuXzQ0azE7Ci0JdW5z
aWduZWQgaW50IG5fNDhrOwotfTsKLQogLyoKICAqIFVubGVzcyBvdGhlcndpc2Ugbm90ZWQsIGVu
dHJpZXMgaW4gdGhpcyB0YWJsZSBhcmUgMTAwJSBvcHRpbWl6YXRpb24uCiAgKiBWYWx1ZXMgY2Fu
IGJlIG9idGFpbmVkIGZyb20gaGRtaV9jb21wdXRlX24oKSBidXQgdGhhdCBmdW5jdGlvbiBpcwpA
QCAtNjAzLDYgKzU5Niw3IEBAIHN0YXRpYyB2b2lkIGhkbWlfc2V0X2N0c19uKHN0cnVjdCBkd19o
ZG1pICpoZG1pLCB1bnNpZ25lZCBpbnQgY3RzLAogc3RhdGljIGludCBoZG1pX21hdGNoX3RtZHNf
bl90YWJsZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdW5zaWduZWQgaW50IGZyZXEsCiAJCQkJICAg
dW5zaWduZWQgbG9uZyBwaXhlbF9jbGspCiB7CisJY29uc3Qgc3RydWN0IGR3X2hkbWlfcGxhdF9k
YXRhICpwbGF0X2RhdGEgPSBoZG1pLT5wbGF0X2RhdGE7CiAJY29uc3Qgc3RydWN0IGR3X2hkbWlf
YXVkaW9fdG1kc19uICp0bWRzX24gPSBOVUxMOwogCWludCBtdWx0ID0gMTsKIAlpbnQgaTsKQEAg
LTYxMiwxMCArNjA2LDIxIEBAIHN0YXRpYyBpbnQgaGRtaV9tYXRjaF90bWRzX25fdGFibGUoc3Ry
dWN0IGR3X2hkbWkgKmhkbWksIHVuc2lnbmVkIGludCBmcmVxLAogCQlmcmVxIC89IDI7CiAJfQog
Ci0JZm9yIChpID0gMDsgY29tbW9uX3RtZHNfbl90YWJsZVtpXS50bWRzICE9IDA7IGkrKykgewot
CQlpZiAocGl4ZWxfY2xrID09IGNvbW1vbl90bWRzX25fdGFibGVbaV0udG1kcykgewotCQkJdG1k
c19uID0gJmNvbW1vbl90bWRzX25fdGFibGVbaV07Ci0JCQlicmVhazsKKwlpZiAocGxhdF9kYXRh
LT50bWRzX25fdGFibGUpIHsKKwkJZm9yIChpID0gMDsgcGxhdF9kYXRhLT50bWRzX25fdGFibGVb
aV0udG1kcyAhPSAwOyBpKyspIHsKKwkJCWlmIChwaXhlbF9jbGsgPT0gcGxhdF9kYXRhLT50bWRz
X25fdGFibGVbaV0udG1kcykgeworCQkJCXRtZHNfbiA9ICZwbGF0X2RhdGEtPnRtZHNfbl90YWJs
ZVtpXTsKKwkJCQlicmVhazsKKwkJCX0KKwkJfQorCX0KKworCWlmICh0bWRzX24gPT0gTlVMTCkg
eworCQlmb3IgKGkgPSAwOyBjb21tb25fdG1kc19uX3RhYmxlW2ldLnRtZHMgIT0gMDsgaSsrKSB7
CisJCQlpZiAocGl4ZWxfY2xrID09IGNvbW1vbl90bWRzX25fdGFibGVbaV0udG1kcykgeworCQkJ
CXRtZHNfbiA9ICZjb21tb25fdG1kc19uX3RhYmxlW2ldOworCQkJCWJyZWFrOworCQkJfQogCQl9
CiAJfQogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oIGIvaW5jbHVk
ZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAppbmRleCBjNDAyMzY0YWVjMGQuLjVlZTZiMGExMjdhYSAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaAorKysgYi9pbmNsdWRlL2Ry
bS9icmlkZ2UvZHdfaGRtaS5oCkBAIC05MCw2ICs5MCwxMyBAQCBlbnVtIGR3X2hkbWlfcGh5X3R5
cGUgewogCURXX0hETUlfUEhZX1ZFTkRPUl9QSFkgPSAweGZlLAogfTsKIAorc3RydWN0IGR3X2hk
bWlfYXVkaW9fdG1kc19uIHsKKwl1bnNpZ25lZCBsb25nIHRtZHM7CisJdW5zaWduZWQgaW50IG5f
MzJrOworCXVuc2lnbmVkIGludCBuXzQ0azE7CisJdW5zaWduZWQgaW50IG5fNDhrOworfTsKKwog
c3RydWN0IGR3X2hkbWlfbXBsbF9jb25maWcgewogCXVuc2lnbmVkIGxvbmcgbXBpeGVsY2xvY2s7
CiAJc3RydWN0IHsKQEAgLTEzNyw2ICsxNDQsNyBAQCBzdHJ1Y3QgZHdfaGRtaV9wbGF0X2RhdGEg
ewogCWNvbnN0IHN0cnVjdCBkd19oZG1pX21wbGxfY29uZmlnICptcGxsX2NmZzsKIAljb25zdCBz
dHJ1Y3QgZHdfaGRtaV9jdXJyX2N0cmwgKmN1cl9jdHI7CiAJY29uc3Qgc3RydWN0IGR3X2hkbWlf
cGh5X2NvbmZpZyAqcGh5X2NvbmZpZzsKKwljb25zdCBzdHJ1Y3QgZHdfaGRtaV9hdWRpb190bWRz
X24gKnRtZHNfbl90YWJsZTsKIAlpbnQgKCpjb25maWd1cmVfcGh5KShzdHJ1Y3QgZHdfaGRtaSAq
aGRtaSwKIAkJCSAgICAgY29uc3Qgc3RydWN0IGR3X2hkbWlfcGxhdF9kYXRhICpwZGF0YSwKIAkJ
CSAgICAgdW5zaWduZWQgbG9uZyBtcGl4ZWxjbG9jayk7Ci0tIAoyLjIyLjAuNDEwLmdkOGZkYmUy
MWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
