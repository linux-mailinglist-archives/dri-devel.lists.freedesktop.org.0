Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096D118F79B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8024D6E26F;
	Mon, 23 Mar 2020 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F030F6E24E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:51:02 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 31so11420439wrs.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=50EvKYMoILj2aPfjn/Hmz526xC3SseH5NBkdaf27Kgw=;
 b=bGgaG+OtLOnceuZjJpIQblgDW6+sArODIz0nkL+ewFPgjJwh6+oHZXK0UeMi2MIlUH
 fh5lBoHrrT4Q62zNm5lul/36Nd0+xfHgkF1q/4sx19C5qxKdmtve+Kmo0N6l63y7eVVv
 cILqDGQ1gTSvNCOmK2vw60As4xrtqun0SY1M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=50EvKYMoILj2aPfjn/Hmz526xC3SseH5NBkdaf27Kgw=;
 b=c3UF/BKlW+KU0F2bEGjGAN8daexxgMFJqSEiwGKsMblcxdpX8fHfYrkosGFprPWUqi
 wXz+e3B0SVCipW6wwyCMiJnG3TFn1i++ZVlYwXJJEqQYblmra4OMboQTwTBl2Pi62QRB
 ECTer8qXjZwwaOkCCCgq3bZnLCzJ1tEHTBmShsac5gLX1RGeXwf1EEjcgpujPjZou6JD
 axdOlZubjD7GJO9bNwLh8ERN6YPglT8lbmvj8qxuTqE62y1XDdy/oHK3DGzq5Ds/IM5J
 o8K96jZJOmzQPhwpNGzOtdHiNwwpuEzBx7+sbZVYAy+5kRHmwSBzewHmB49ICtdCyajw
 FWTQ==
X-Gm-Message-State: ANhLgQ29jGvdwL9/ink54n4TJJSyMbbnZt1du4UQipRsYZWpV4lS9cHw
 0+7AKRm+vvUznGjgqOQ2Hmio9qfR7vX7TA==
X-Google-Smtp-Source: ADFU+vtGLTcVL1NpXElhTqgDYjk11Z0GhUTSRMtv6BBr/5S/HkwhkseI0DXo27+ow/6UGcKINWGyiQ==
X-Received: by 2002:adf:9321:: with SMTP id 30mr29275077wro.330.1584975061180; 
 Mon, 23 Mar 2020 07:51:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:51:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 46/51] drm/repaper: Drop explicit drm_mode_config_cleanup call
Date: Mon, 23 Mar 2020 15:49:45 +0100
Message-Id: <20200323144950.3018436-47-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
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
TGF1cmVudCkuCgp2MzogVXNlIGRybW1fbW9kZV9jb25maWdfaW5pdCgpIGZvciBtb3JlIGNsYXJp
dHkgKFNhbSwgVGhvbWFzKQpJIGFsc28gbm90aWNlZCB0aGF0IEkndmUgZmFpbGVkIHRvIGFkZCB0
aGUgZXJyb3IgY2hlY2tpbmcsCl9fbXVzdF9jaGVjayBjYXVnaHQgdGhhdC4KCkNjOiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMu
b3JnPiAodjIpClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50
ZWwuY29tPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgfCAxMiArKystLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBl
ci5jCmluZGV4IDQ3NDFmZjY3MGVjOS4uODYyYzNlZTYwNTVkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBl
ci5jCkBAIC05MDksMTMgKzkwOSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29u
ZmlnX2Z1bmNzIHJlcGFwZXJfbW9kZV9jb25maWdfZnVuY3MgPSB7CiAJLmF0b21pY19jb21taXQg
PSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQsCiB9OwogCi1zdGF0aWMgdm9pZCByZXBhcGVyX3Jl
bGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKLXsKLQlEUk1fREVCVUdfRFJJVkVSKCJcbiIp
OwotCi0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKLX0KLQogc3RhdGljIGNvbnN0IHVp
bnQzMl90IHJlcGFwZXJfZm9ybWF0c1tdID0gewogCURSTV9GT1JNQVRfWFJHQjg4ODgsCiB9OwpA
QCAtOTUzLDcgKzk0Niw2IEBAIERFRklORV9EUk1fR0VNX0NNQV9GT1BTKHJlcGFwZXJfZm9wcyk7
CiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgcmVwYXBlcl9kcml2ZXIgPSB7CiAJLmRyaXZlcl9m
ZWF0dXJlcwk9IERSSVZFUl9HRU0gfCBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9BVE9NSUMsCiAJ
LmZvcHMJCQk9ICZyZXBhcGVyX2ZvcHMsCi0JLnJlbGVhc2UJCT0gcmVwYXBlcl9yZWxlYXNlLAog
CURSTV9HRU1fQ01BX1ZNQVBfRFJJVkVSX09QUywKIAkubmFtZQkJCT0gInJlcGFwZXIiLAogCS5k
ZXNjCQkJPSAiUGVydmFzaXZlIERpc3BsYXlzIFJlUGFwZXIgZS1pbmsgcGFuZWxzIiwKQEAgLTEw
MjMsNyArMTAxNSw5IEBAIHN0YXRpYyBpbnQgcmVwYXBlcl9wcm9iZShzdHJ1Y3Qgc3BpX2Rldmlj
ZSAqc3BpKQogCX0KIAlkcm1tX2FkZF9maW5hbF9rZnJlZShkcm0sIGVwZCk7CiAKLQlkcm1fbW9k
ZV9jb25maWdfaW5pdChkcm0pOworCXJldCA9IGRybW1fbW9kZV9jb25maWdfaW5pdChkcm0pOwor
CWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAJZHJtLT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZyZXBh
cGVyX21vZGVfY29uZmlnX2Z1bmNzOwogCiAJZXBkLT5zcGkgPSBzcGk7Ci0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
