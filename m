Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3E46A13
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD3889358;
	Fri, 14 Jun 2019 20:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70CC89341
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k21so5261999edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yfT7CblPLWiMt1j2utL2KCYyZxJ5cieGPzhj9h2kPG8=;
 b=jBZJLfU7IsN3k4UuHzSp+fHY1Ucw8g1pf1OGmAICy4qPF62jwWKOXf5lDvUD40jxFb
 dhNy0EXWe/JuVZFrHxpm4oi4ViStc7PE66gLtaWBiL2z4kirwdPIpTjV0MMYB+sL3Lww
 G32MVbci5yFMiWuCMu3rRYviYQFGyZvaELH9Fw8xXJMWNFlbpz+duhxhfTDDUSXSKr9a
 DF8JU/KhCqiMN5CABKJ3FtgBLh4afg2NuRojrykdEgH0AWAW1nNMih6Hj68iQlBUpMmD
 OVpgdDRzyUYkBWdb9F8d9hN0rSGVWh4SYmDffyZl9Dq3uKt2hF72kTHR1ew5r2JKbPP+
 TVyQ==
X-Gm-Message-State: APjAAAWZvYY3RE05mVmZnzvCBRyO1DVejBHt1YaJvk2/+SLIoEWG4H1T
 bBdU6lyjm2cLUZKiUf5cYNjRtiK2oXw=
X-Google-Smtp-Source: APXvYqwAZfOuxJk/13+G21w6VmXHt6KP4bVEBCbTZSUmlkyy1pAnCyywEhuGa7l/8/OUkLOosujFlA==
X-Received: by 2002:a50:bd83:: with SMTP id y3mr87292469edh.120.1560544586311; 
 Fri, 14 Jun 2019 13:36:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:25 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/59] drm/prime: Make DRIVER_PRIME a no-op
Date: Fri, 14 Jun 2019 22:35:21 +0200
Message-Id: <20190614203615.12639-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yfT7CblPLWiMt1j2utL2KCYyZxJ5cieGPzhj9h2kPG8=;
 b=bR9fLRsvKhe2GR4NavKMJDCGDlI1eUC17FzLFksadf6M4UCZctc61EK3DstRqWXJ31
 TEPbhLZCFQkJYKa1zgd62bF/ZMVc8bDqVPQLsZv2EoiB50ee0OyTKXhKaGPqKniIeuJf
 XWOLd+9smGwN0VKqk/rtc26NoAFPuweXQBP/Y=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJpdmVycyBtdXN0IGZpbGwgb3V0IHRoZSBoYW5kbGVfdG9fZmQgYW5kIGZkX3RvX2hhbmRsZSBo
b29rcyB0bwplbmFibGUgZXhwb3J0L2ltcG9ydCBwcmltZSBmdW5jdGlvbmFsaXR5IGFscmVhZHku
IFRoZSBhZGRpdGlvbmFsCkRSSVZFUl9QUklNRSBmbGFnIGRvZXNuJ3Qgc2VydmUgYW55IHJlYWwg
cHVycG9zZSwgc2luY2UgdGhlIG92ZXJhbGwKZmxhZyBkb2Vzbid0IGV2ZW4gdGVsbCB5b3Ugd2hl
dGhlciBpbXBvcnQgb3IgZXhwb3J0IG9yIG1heWJlIGV2ZW4gYm90aAppcyBzdXBwb3J0ZWQuCgpE
aXRjaCBpdC4KClRoaXMgcGF0Y2gganVzdCBtYWtlcyBpdCBkZWZ1bmN0LCBzdWJzZXF1ZW50IHBh
dGNoZXMgd2lsbCByZW1vdmUgaXQKZnJvbSBhbGwgdGhlIGRyaXZlcnMuCgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX3ByaW1lLmMgfCA5ICstLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwppbmRleCBmMDgxNTlhOGIwM2Eu
Ljc4ZjZmMTBiMjA2MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwpAQCAtNDcsOCArNDcsNyBAQAogICogYmV0
d2VlbiBhcHBsaWNhdGlvbnMsIHRoZXkgY2FuJ3QgYmUgZ3Vlc3NlZCBsaWtlIHRoZSBnbG9iYWxs
eSB1bmlxdWUgR0VNCiAgKiBuYW1lcy4KICAqCi0gKiBEcml2ZXJzIHRoYXQgc3VwcG9ydCB0aGUg
UFJJTUUgQVBJIG11c3Qgc2V0IHRoZSBEUklWRVJfUFJJTUUgYml0IGluIHRoZQotICogJmRybV9k
cml2ZXIuZHJpdmVyX2ZlYXR1cmVzIGZpZWxkLCBhbmQgaW1wbGVtZW50IHRoZQorICogRHJpdmVy
cyB0aGF0IHN1cHBvcnQgdGhlIFBSSU1FIEFQSSBpbXBsZW1lbnQgdGhlCiAgKiAmZHJtX2RyaXZl
ci5wcmltZV9oYW5kbGVfdG9fZmQgYW5kICZkcm1fZHJpdmVyLnByaW1lX2ZkX3RvX2hhbmRsZSBv
cGVyYXRpb25zLgogICogR0VNIGJhc2VkIGRyaXZlcnMgbXVzdCB1c2UgZHJtX2dlbV9wcmltZV9o
YW5kbGVfdG9fZmQoKSBhbgogICogZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoKSB0byBpbXBs
ZW1lbnQgdGhlc2UuIEZvciBHRU0gYmFzZWQgZHJpdmVycyB0aGUKQEAgLTM2MSw5ICszNjAsNiBA
QCBpbnQgZHJtX3ByaW1lX2ZkX3RvX2hhbmRsZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAogewogCXN0cnVjdCBkcm1fcHJpbWVfaGFuZGxlICphcmdzID0gZGF0YTsK
IAotCWlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9QUklNRSkpCi0JCXJl
dHVybiAtRU9QTk9UU1VQUDsKLQogCWlmICghZGV2LT5kcml2ZXItPnByaW1lX2ZkX3RvX2hhbmRs
ZSkKIAkJcmV0dXJuIC1FTk9TWVM7CiAKQEAgLTUxMiw5ICs1MDgsNiBAQCBpbnQgZHJtX3ByaW1l
X2hhbmRsZV90b19mZF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAog
ewogCXN0cnVjdCBkcm1fcHJpbWVfaGFuZGxlICphcmdzID0gZGF0YTsKIAotCWlmICghZHJtX2Nv
cmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9QUklNRSkpCi0JCXJldHVybiAtRU9QTk9UU1VQ
UDsKLQogCWlmICghZGV2LT5kcml2ZXItPnByaW1lX2hhbmRsZV90b19mZCkKIAkJcmV0dXJuIC1F
Tk9TWVM7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
