Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CDF2C23D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA4A89F0B;
	Tue, 28 May 2019 09:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAF589E0E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:34 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g24so2698726eds.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OKOX602Fa7Fbm+vbgel7a44WqYHTJVV0M2SnTAYkwyc=;
 b=P6Dwl+D7NKJq6KTMQpsW0C2ErMb4gnd5UlLuBP3wqLzLBEunsMpWu5OMkgN4EKkYNs
 UBJvfn5jpmpo7TjpvwC0cx9iYhaOzOAPrXIS3SqsX82dyICddixxYdsSogWWE0wNXOPq
 PIwAD7w+Hi0BJXh8VU/ZIAWKyu1P1sWgkSdkclJ5a3ZbLWS3OA4QTk7g8KUrHtEB6Dtb
 NNfYy5trcT2AVKoInS1YbKv9jBJWcsXz3pCk5cNXO5Ca/MlL9HvjaVFAzVliFIRLnkGE
 aqpJDmN3ZFDA6Xf63ABfd9o/Qdby4iMEZ1xnnZR7fYDgSZgy7Wgi+G3k9qMQo+Vxj0f+
 hp4A==
X-Gm-Message-State: APjAAAUvGgE69YV5nUk7AjyXPO79UxagqOxDp3+NM1DGTGSQ+3ukSc7Z
 JkwSMG8J0oWegxR8TUkpQK1yBA==
X-Google-Smtp-Source: APXvYqyL24FlvYKpJYYc56lCsYATWOVbIhcR8IC7LZtm5HN5vQe4w00rjmH/HxYYsyvnxUX6o2yynw==
X-Received: by 2002:aa7:db0c:: with SMTP id
 t12mr128412092eds.170.1559034212171; 
 Tue, 28 May 2019 02:03:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 14/33] staging/olpc: lock_fb_info can't fail
Date: Tue, 28 May 2019 11:02:45 +0200
Message-Id: <20190528090304.9388-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKOX602Fa7Fbm+vbgel7a44WqYHTJVV0M2SnTAYkwyc=;
 b=XbjOcs4dHqJnV+UpCk3n+c1kQCjrOCXQqy+ipr/hlU/6I1NQ5nHAEzGop2tsgNjl1i
 9Tu7wqCFwvpTcMG3rcRbnAtrjxRmaWQIlJSWJSG9NdgCSC8R+iKOe/dLKn7BQPvCbHiy
 Us7KBVkIhKGzrJgZJY2qZbATBvZ7UMCUA5Jrc=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Daniel Drake <dsd@laptop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jens Frederich <jfrederich@gmail.com>, linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltcGx5IGJlY2F1c2Ugb2xwYyBuZXZlciB1bnJlZ2lzdGVycyB0aGUgZGFtbiB0aGluZy4gSXQg
YWxzbwpyZWdpc3RlcnMgdGhlIGZyYW1lYnVmZmVyIGRpcmVjdGx5IGJ5IHBva2luZyBhcm91bmQg
aW4gZmJkZXYKY29yZSBpbnRlcm5hbHMsIHNvIGl0J3MgYWxsIGFyb3VuZCByYXRoZXIgYnJva2Vu
LgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
UmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQWNrZWQtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+ClJldmlld2VkLWJ5
OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpD
YzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IEpl
bnMgRnJlZGVyaWNoIDxqZnJlZGVyaWNoQGdtYWlsLmNvbT4KQ2M6IERhbmllbCBEcmFrZSA8ZHNk
QGxhcHRvcC5vcmc+CkNjOiBKb24gTmV0dGxldG9uIDxqb24ubmV0dGxldG9uQGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNfZGNvbi5jIHwgNiArLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNfZGNvbi5jIGIvZHJpdmVycy9zdGFnaW5n
L29scGNfZGNvbi9vbHBjX2Rjb24uYwppbmRleCA2YjcxNGY3NDBhYzMuLmEyNTQyMzhiZTE4MSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL29scGNfZGNvbi9vbHBjX2Rjb24uYworKysgYi9k
cml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNfZGNvbi5jCkBAIC0yNTAsMTEgKzI1MCw3IEBA
IHN0YXRpYyBib29sIGRjb25fYmxhbmtfZmIoc3RydWN0IGRjb25fcHJpdiAqZGNvbiwgYm9vbCBi
bGFuaykKIAlpbnQgZXJyOwogCiAJY29uc29sZV9sb2NrKCk7Ci0JaWYgKCFsb2NrX2ZiX2luZm8o
ZGNvbi0+ZmJpbmZvKSkgewotCQljb25zb2xlX3VubG9jaygpOwotCQlkZXZfZXJyKCZkY29uLT5j
bGllbnQtPmRldiwgInVuYWJsZSB0byBsb2NrIGZyYW1lYnVmZmVyXG4iKTsKLQkJcmV0dXJuIGZh
bHNlOwotCX0KKwlsb2NrX2ZiX2luZm8oZGNvbi0+ZmJpbmZvKTsKIAogCWRjb24tPmlnbm9yZV9m
Yl9ldmVudHMgPSB0cnVlOwogCWVyciA9IGZiX2JsYW5rKGRjb24tPmZiaW5mbywKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
