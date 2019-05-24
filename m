Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51329384
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11F16E0AB;
	Fri, 24 May 2019 08:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A6B89FEC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:05 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p27so13375618eda.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ap6gHVfG6PM+wYbkqC4KGmp/roHspJTrFKWjjYMA/To=;
 b=m/SLiPxZgOBEmnchnbqGzZlcJrRbwjZJMeXGJGsHbWGZELCWMyHIsKNkiDG2EGDYDB
 Xr73AKxdFOpRrmSwo5235lK7As+lqTzMpy9rbO/dC1Deno0MQTnrE3L90b89CECU1DGy
 wM0rCjm2HhlpFEwrj2VElbxAyoMglGXLrAu6TtDgtjv2ocFmP9CSI223vN7W7j233avI
 F99tbbvnJEor+v4Bbk7kGCGIfcamK073ccudREoAcztkb28zI7YlQFPB63toHpOkGZpV
 vUR7rXvrB+GvvkOK6yjaMg/9gqCVTEcVoGIdJneYrYUtklWM3lcwNfbK3Dxr4EJEm4lQ
 Z+wA==
X-Gm-Message-State: APjAAAXSRvgx64klrAQfT7ctPsqEJaVPKYjaRb+BavnmjAumcyRoXFgO
 JHUZCK1aWq7ooVMkzit+M6yvsQ==
X-Google-Smtp-Source: APXvYqzhd4f3rrF1WDIdoewCydKwsOVaIfyCIIjufiU3/tV42BLUr8ae9tm+UecNxlXgltqO2gHb8w==
X-Received: by 2002:a05:6402:1214:: with SMTP id
 c20mr101983320edw.38.1558688044363; 
 Fri, 24 May 2019 01:54:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/33] vt: might_sleep() annotation for do_blank_screen
Date: Fri, 24 May 2019 10:53:24 +0200
Message-Id: <20190524085354.27411-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ap6gHVfG6PM+wYbkqC4KGmp/roHspJTrFKWjjYMA/To=;
 b=TcHOFSYpTZDVzEzFDwDdhVIyODgONPMw+T3NbmiYfQjRtHLOh8DAwQFpc9neVEvsg5
 3o1EvHY3jdbyMeWHIJy+cFE0Sf636G/ypqXGntdQR0FIhJ98nrM9Cb6YYB4awpiVkYmt
 LnPJOFzsIhXefcJvhqHx3iX6Le26pu/IwJvSY=
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
 Adam Borowski <kilobyte@angband.pl>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Martin Hostettler <textshell@uchuujin.de>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHN5bW1ldHJ5IHJlYXNvbnMgd2l0aCBkb191bmJsYW5rX3NjcmVlbiwgZXhjZXB0IHdpdGhv
dXQgdGhlCm9vcHNfaW5fcHJvZ3Jlc3Mgc3BlY2lhbCBjYXNlLgoKSnVzdCBhIGRyaXZlLWJ5IGFu
bm90YXRpb24gd2hpbGUgSSdtIHRyeWluZyB0byB1bnRhbmdsZSB0aGUgZmJjb24gdnMuCmZiZGV2
IHNjcmVlbiBibGFuay91bmJsYW5rIG1hemUuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNjOiBOaWNvbGFzIFBpdHJlIDxuaWNvbGFzLnBpdHJlQGxp
bmFyby5vcmc+CkNjOiBBZGFtIEJvcm93c2tpIDxraWxvYnl0ZUBhbmdiYW5kLnBsPgpDYzogTWFy
dGluIEhvc3RldHRsZXIgPHRleHRzaGVsbEB1Y2h1dWppbi5kZT4KQ2M6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thQHJl
ZGhhdC5jb20+Ci0tLQogZHJpdmVycy90dHkvdnQvdnQuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS92dC92dC5jIGIvZHJp
dmVycy90dHkvdnQvdnQuYwppbmRleCBmZGQxMmY4YzNkZWIuLmJjOTgxM2IxNGM1OCAxMDA2NDQK
LS0tIGEvZHJpdmVycy90dHkvdnQvdnQuYworKysgYi9kcml2ZXJzL3R0eS92dC92dC5jCkBAIC00
MTU5LDYgKzQxNTksOCBAQCB2b2lkIGRvX2JsYW5rX3NjcmVlbihpbnQgZW50ZXJpbmdfZ2Z4KQog
CXN0cnVjdCB2Y19kYXRhICp2YyA9IHZjX2NvbnNbZmdfY29uc29sZV0uZDsKIAlpbnQgaTsKIAor
CW1pZ2h0X3NsZWVwKCk7CisKIAlXQVJOX0NPTlNPTEVfVU5MT0NLRUQoKTsKIAogCWlmIChjb25z
b2xlX2JsYW5rZWQpIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
