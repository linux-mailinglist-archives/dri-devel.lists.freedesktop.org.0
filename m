Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F0293A7
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690546E0C2;
	Fri, 24 May 2019 08:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DA46E0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:23 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f37so13271667edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qFqlt6mo9F4Pd9G7O8MT8qo6u/5jZNMJ/2yl3qsAQiY=;
 b=bMlcNpws1PkkPgCQg8gNXTH805Inw+EQurKf+pCQHjpTDJ/vXV6yMJnw2klssw0TP8
 d8mRJkMLYVx3N2J9d2VDqQyBDi6r3Ko32EQMalnUsXWBh+mQCDa69zkElCfuNTQXH/Yn
 avo/U1s354bIA73tr5b4Uzk2rq9hrZfawehrOFOseU90C0f48g1gHxbWOVySz97tY/Ro
 fAL913TE9bfoucVmIVgQoLdPSn1C7KTSVagkn7mN3CcqxGUMo+6dJEH6Wy5VPOegxMH3
 vGVIaVEaINjL+EboRjKE/n4JJWXo+/sFTaqddbaidtAAkDBqkCQQNT8N3R0gZtOULwDk
 vfQg==
X-Gm-Message-State: APjAAAXsxUYGkVyhMovw2yZ9FzSMjgNLJQfhy+OqPJvuFZgOR52sLMpg
 zs+FklMAVJm0196PQmWd51U0YQ==
X-Google-Smtp-Source: APXvYqxfH4m8cM3kQ2a9m5Bu7sZt3awOs0EZLiDpP3Rw5DPOFSPeezL+a7RRX9L5t0jF0ChIS5R+Zw==
X-Received: by 2002:a50:908a:: with SMTP id
 c10mr102215126eda.226.1558688060655; 
 Fri, 24 May 2019 01:54:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 14/33] staging/olpc: lock_fb_info can't fail
Date: Fri, 24 May 2019 10:53:35 +0200
Message-Id: <20190524085354.27411-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qFqlt6mo9F4Pd9G7O8MT8qo6u/5jZNMJ/2yl3qsAQiY=;
 b=EgPw0s1XuffFZvuQmIb+u1grhbjqLNzg/527P2g071z9I1Srgh63ZYAtIrTqJ9/3WB
 4fGr4+vWcQgnQhJwsaUixthTYD4PW/g7mB8dJEg2qZkoDJYIjq9AS/XYnSozEbuQlWH0
 0XPhcaEJ9eNRxGY5BRpufgjXn4h9qrDKGVZ08=
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
Cc: Daniel Drake <dsd@laptop.org>, Jens Frederich <jfrederich@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltcGx5IGJlY2F1c2Ugb2xwYyBuZXZlciB1bnJlZ2lzdGVycyB0aGUgZGFtbiB0aGluZy4gSXQg
YWxzbwpyZWdpc3RlcnMgdGhlIGZyYW1lYnVmZmVyIGRpcmVjdGx5IGJ5IHBva2luZyBhcm91bmQg
aW4gZmJkZXYKY29yZSBpbnRlcm5hbHMsIHNvIGl0J3MgYWxsIGFyb3VuZCByYXRoZXIgYnJva2Vu
LgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
Q2M6IEplbnMgRnJlZGVyaWNoIDxqZnJlZGVyaWNoQGdtYWlsLmNvbT4KQ2M6IERhbmllbCBEcmFr
ZSA8ZHNkQGxhcHRvcC5vcmc+CkNjOiBKb24gTmV0dGxldG9uIDxqb24ubmV0dGxldG9uQGdtYWls
LmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNfZGNvbi5jIHwgNiArLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNfZGNvbi5jIGIvZHJpdmVycy9z
dGFnaW5nL29scGNfZGNvbi9vbHBjX2Rjb24uYwppbmRleCA2YjcxNGY3NDBhYzMuLmEyNTQyMzhi
ZTE4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL29scGNfZGNvbi9vbHBjX2Rjb24uYwor
KysgYi9kcml2ZXJzL3N0YWdpbmcvb2xwY19kY29uL29scGNfZGNvbi5jCkBAIC0yNTAsMTEgKzI1
MCw3IEBAIHN0YXRpYyBib29sIGRjb25fYmxhbmtfZmIoc3RydWN0IGRjb25fcHJpdiAqZGNvbiwg
Ym9vbCBibGFuaykKIAlpbnQgZXJyOwogCiAJY29uc29sZV9sb2NrKCk7Ci0JaWYgKCFsb2NrX2Zi
X2luZm8oZGNvbi0+ZmJpbmZvKSkgewotCQljb25zb2xlX3VubG9jaygpOwotCQlkZXZfZXJyKCZk
Y29uLT5jbGllbnQtPmRldiwgInVuYWJsZSB0byBsb2NrIGZyYW1lYnVmZmVyXG4iKTsKLQkJcmV0
dXJuIGZhbHNlOwotCX0KKwlsb2NrX2ZiX2luZm8oZGNvbi0+ZmJpbmZvKTsKIAogCWRjb24tPmln
bm9yZV9mYl9ldmVudHMgPSB0cnVlOwogCWVyciA9IGZiX2JsYW5rKGRjb24tPmZiaW5mbywKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
