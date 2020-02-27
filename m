Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE401726BD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323256ED04;
	Thu, 27 Feb 2020 18:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF036ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a5so454626wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q7TJHDqj8/6sjzRbpshntBJrPdaYH+7eV+1SBaB2f20=;
 b=i8v7+aLrC92CsQSMXJPKOTbK0B3BoAibdT5a4uhdZj0kxmrmmyPwZF4QwW7Jh/7kpI
 wXs0FlB/IsfStm4anE78rFz3LK/qqkORwSUN1Lc2ynwic4KPLek0E79PCJoAh1CDFzmp
 L48IegsfAmiG4z/wsltrZUPxxas7dGfASC6es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7TJHDqj8/6sjzRbpshntBJrPdaYH+7eV+1SBaB2f20=;
 b=PXN/e69pa/Qrr2RIG7cK51Fb9UlTMwL263fm7Sudq6kGOMibTWcfTJubX5yDliuNXE
 JNUzJZ1E/JhUaroHQ/6QfI/U0KgieHruzar9Xms3T9vLaCVougHLu7saXzirQGBeOMfk
 nVm0+uiO7VKyoXTDXhGKebIPgmHdYAHO8ZR5CPaMjTFpyP7TvemZxSmXe+XO5MPSV4xk
 tOXVQquW1Us8bvp/4r+0DV2Q9nsYm3NVOP0pr35VO2WbVYymFHGA1Djjv3clTYHhDAl5
 GHqi89eWG8SxZbHLRuqmrnYLZECNG5UDpxiAD7v92yvxNpZWzYyjTC88PR0RzlEebh4a
 I3hw==
X-Gm-Message-State: APjAAAU/QTjOtSYvJEzrQmfY6IREzVCPKXajBQYrocQc4+qbWpXgBfo7
 mPpOOT+Abw9RtAlQEhaBe5DdxzDbqA8=
X-Google-Smtp-Source: APXvYqw5Lug4TaB5woiW4R4DBqkFD5ZYx0Vz/K7K9pF3q+gD4sQJo6ua9FxuobtZBr56mLkbHBjUpg==
X-Received: by 2002:a1c:4341:: with SMTP id q62mr12341wma.107.1582827388084;
 Thu, 27 Feb 2020 10:16:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:26 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 46/51] drm/repaper: Drop explicit drm_mode_config_cleanup call
Date: Thu, 27 Feb 2020 19:15:17 +0100
Message-Id: <20200227181522.2711142-47-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 m.felsch@pengutronix.de, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3dzIHVzIHRvIGRyb3AgdGhlIGRybV9kcml2ZXIucmVsZWFzZSBjYWxsYmFjay4KClRoaXMg
aXMgbWFkZSBwb3NzaWJsZSBieSBhIHByZWNlZWRpbmcgcGF0Y2ggd2hpY2ggYWRkZWQgYSBkcm1t
XwpjbGVhbnVwIGFjdGlvbiB0byBkcm1fbW9kZV9jb25maWdfaW5pdCgpLCBoZW5jZSBhbGwgd2Ug
bmVlZCB0byBkbyB0bwplbnN1cmUgdGhhdCBkcm1fbW9kZV9jb25maWdfY2xlYW51cCgpIGlzIHJ1
biBvbiBmaW5hbCBkcm1fZGV2aWNlCmNsZWFudXAgaXMgY2hlY2sgdGhlIG5ldyBlcnJvciBjb2Rl
IGZvciBfaW5pdCgpLgoKdjI6IEV4cGxhaW4gd2h5IHRoaXMgY2xlYW51cCBpcyBwb3NzaWJsZSAo
TGF1cmVudCkuCgpDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5v
cmc+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
PgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgfCA4IC0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKaW5kZXggNDc0MWZmNjcwZWM5Li4yZjcw
ZmIxYmUyMDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKQEAgLTkwOSwxMyArOTA5LDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgcmVwYXBlcl9tb2RlX2NvbmZp
Z19mdW5jcyA9IHsKIAkuYXRvbWljX2NvbW1pdCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCwK
IH07CiAKLXN0YXRpYyB2b2lkIHJlcGFwZXJfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
KQotewotCURSTV9ERUJVR19EUklWRVIoIlxuIik7Ci0KLQlkcm1fbW9kZV9jb25maWdfY2xlYW51
cChkcm0pOwotfQotCiBzdGF0aWMgY29uc3QgdWludDMyX3QgcmVwYXBlcl9mb3JtYXRzW10gPSB7
CiAJRFJNX0ZPUk1BVF9YUkdCODg4OCwKIH07CkBAIC05NTMsNyArOTQ2LDYgQEAgREVGSU5FX0RS
TV9HRU1fQ01BX0ZPUFMocmVwYXBlcl9mb3BzKTsKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBy
ZXBhcGVyX2RyaXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVzCT0gRFJJVkVSX0dFTSB8IERSSVZF
Ul9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQywKIAkuZm9wcwkJCT0gJnJlcGFwZXJfZm9wcywKLQku
cmVsZWFzZQkJPSByZXBhcGVyX3JlbGVhc2UsCiAJRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BT
LAogCS5uYW1lCQkJPSAicmVwYXBlciIsCiAJLmRlc2MJCQk9ICJQZXJ2YXNpdmUgRGlzcGxheXMg
UmVQYXBlciBlLWluayBwYW5lbHMiLAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
