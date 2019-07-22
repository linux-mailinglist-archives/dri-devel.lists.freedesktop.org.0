Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D507084A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7507189D8E;
	Mon, 22 Jul 2019 18:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0EA89D8E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:19:50 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c73so17757420pfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEY3bYOzp3RlSizWjVehuryQ18nF3wYfUG0Q8twJJZM=;
 b=gP4jRiJSWRfI6U5aT/7OAXKfwfqFFwP4Jw3cqfwlVUCmWqNESHr/8Q0bQeoQB/NIIz
 EDVUj2LoEkG3Fqq8sOWg6od8TAlOtu+Oc7eMjhRDC+RjK7+TKAJBPz6rZ3UOt8O9Mpf2
 VY0Cy+RA4fDFDPjsGsOPvAZo8T2hY73HUiZY0BPWyYrPa+pqLznGJzGyNgumpGFj6zXk
 NX+XcrQmEkxAzuWv/+sQnBgaTPdlG7TtpuY9D9olzeKbs56z2DsfYPJ9Kydx3ah9et9S
 6uwrax5pPkoHLVwKNXBLgAkgA17/uCKWK96D94FOEuw9zCpq2TrRa5mZTHSp0XWpiq3Y
 ceJQ==
X-Gm-Message-State: APjAAAU6UpINH+oAIZ5GSgNFKzghzyVy2g2HAuFY1t3R7nxS4BFqYTVR
 /EI5ABOo2oo3BjbA4RAzZpOe+w==
X-Google-Smtp-Source: APXvYqzcCvGl88snNa9+grlHY4RHCbVeyINhZTleoFs/SYk/vhYy08CTLaQNOJJrxO9skTUVFTtHJw==
X-Received: by 2002:a63:6c02:: with SMTP id h2mr71668487pgc.61.1563819590479; 
 Mon, 22 Jul 2019 11:19:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id v10sm41283234pfe.163.2019.07.22.11.19.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 11:19:49 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/bridge: dw-hdmi: Refuse DDC/CI transfers on the
 internal I2C controller
Date: Mon, 22 Jul 2019 11:19:45 -0700
Message-Id: <20190722181945.244395-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEY3bYOzp3RlSizWjVehuryQ18nF3wYfUG0Q8twJJZM=;
 b=MURvjPXpQv5UN7mAWkHfdQhSjEwS47X0WVij4lXD6DFvDLOxfR9xyMTRP16hP5J4eJ
 RPGo+ay9cCo0tGH8itIzhdtsLIADAq2Wk8JgklQ9PW1rEW7SJvZ0B0eztFO8ExaQLn/C
 DTGohGh7GIxojqBTtmb63srZUTv7lTEhhtuTA=
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEREQy9DSSBwcm90b2NvbCBpbnZvbHZlcyBzZW5kaW5nIGEgbXVsdGktYnl0ZSByZXF1ZXN0
IHRvIHRoZQpkaXNwbGF5IHZpYSBJMkMsIHdoaWNoIGlzIHR5cGljYWxseSBmb2xsb3dlZCBieSBh
IG11bHRpLWJ5dGUKcmVzcG9uc2UuIFRoZSBpbnRlcm5hbCBJMkMgY29udHJvbGxlciBvbmx5IGFs
bG93cyBzaW5nbGUgYnl0ZQpyZWFkcy93cml0ZXMgb3IgcmVhZHMgb2YgOCBzZXF1ZW50aWFsIGJ5
dGVzLCBoZW5jZSBEREMvQ0kgaXMgbm90CnN1cHBvcnRlZCB3aGVuIHRoZSBpbnRlcm5hbCBJMkMg
Y29udHJvbGxlciBpcyB1c2VkLiBUaGUgSTJDCnRyYW5zZmVycyBjb21wbGV0ZSB3aXRob3V0IGVy
cm9ycywgaG93ZXZlciB0aGUgZGF0YSBpbiB0aGUgcmVzcG9uc2UKaXMgZ2FyYmFnZS4gQWJvcnQg
dHJhbnNmZXJzIHRvL2Zyb20gc2xhdmUgYWRkcmVzcyAweDM3IChEREMpIHdpdGgKLUVPUE5PVFNV
UFAsIHRvIG1ha2UgaXQgZXZpZGVudCB0aGF0IHRoZSBjb21tdW5pY2F0aW9uIGlzIGZhaWxpbmcu
CgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KLS0t
CkNoYW5nZXMgaW4gdjI6Ci0gY2hhbmdlZCBERENfSTJDX0FERFIgdG8gRERDX0NJX0FERFIKLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDggKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
c3lub3BzeXMvZHctaGRtaS5jCmluZGV4IDA0NWIxYjEzZmQwZS4uMjg5MzM2MjlmM2M3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMzUsNiArMzUsNyBA
QAogCiAjaW5jbHVkZSA8bWVkaWEvY2VjLW5vdGlmaWVyLmg+CiAKKyNkZWZpbmUgRERDX0NJX0FE
RFIJCTB4MzcKICNkZWZpbmUgRERDX1NFR01FTlRfQUREUgkweDMwCiAKICNkZWZpbmUgSERNSV9F
RElEX0xFTgkJNTEyCkBAIC0zMjIsNiArMzIzLDEzIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9pMmNf
eGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsCiAJdTggYWRkciA9IG1zZ3NbMF0uYWRkcjsK
IAlpbnQgaSwgcmV0ID0gMDsKIAorCWlmIChhZGRyID09IEREQ19DSV9BRERSKQorCQkvKgorCQkg
KiBUaGUgaW50ZXJuYWwgSTJDIGNvbnRyb2xsZXIgZG9lcyBub3Qgc3VwcG9ydCB0aGUgbXVsdGkt
Ynl0ZQorCQkgKiByZWFkIGFuZCB3cml0ZSBvcGVyYXRpb25zIG5lZWRlZCBmb3IgRERDL0NJLgor
CQkgKi8KKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJZGV2X2RiZyhoZG1pLT5kZXYsICJ4ZmVy
OiBudW06ICVkLCBhZGRyOiAlI3hcbiIsIG51bSwgYWRkcik7CiAKIAlmb3IgKGkgPSAwOyBpIDwg
bnVtOyBpKyspIHsKLS0gCjIuMjIuMC42NTcuZzk2MGU5MmQyNGYtZ29vZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
