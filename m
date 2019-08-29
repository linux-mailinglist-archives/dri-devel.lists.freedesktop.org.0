Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E282A2172
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 18:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60CA6E13B;
	Thu, 29 Aug 2019 16:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6186E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 16:52:25 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id 1so1413485ybj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 09:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IWHGTbjCnJwyiyI9Ca3d5eKUwHiljjpclYfL/wFTtyU=;
 b=JkgGW7/rwgLoJgcH75aCYpyIb6av5SHUaE+md6mHEoUSQguxAYi0OFEIaN2ZW7cnTi
 eL/PcvaF1tN111xdbkDhOsupgbx2oYEb0gqnVFfbWxcy/PPyg30FQIeM4ZzSDPRLIpMx
 /1vIj1HDLw8SBTyJm1IxbEHdcUzBqEzt2jKVwaBiX4m4eb+mTNFTAyHaTvpLB6eqP9Bi
 FebS23L5e3ijDO9Zd/Eywbxi16jOypOwHO1KpKvYJCXS9vxTD6X+rB6FIyA0+F4o/Smx
 9mdhy/zbMExm9Jdqx4b97bGRYzkKjA/7uDLdIWEgvnNrqdH5BYTTIDP4DtpfC/rQ4AHX
 K26Q==
X-Gm-Message-State: APjAAAVwira7vtVM7yJ8vzkU3n+bfJLxoivL/zyQ6zoXMqYua7hEUdxA
 P9pKqY7lOiDoI3hebdkHWs8pZtINz6M=
X-Google-Smtp-Source: APXvYqwNz943O/0Sm7Mch5qv38P9Uj6/qzSYIsI+XhYIjhV0Kbf6nhbnvWbCRbzRopUXgwjXE6n/uw==
X-Received: by 2002:a25:37c7:: with SMTP id e190mr7698196yba.117.1567097544968; 
 Thu, 29 Aug 2019 09:52:24 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d9sm620595ywd.55.2019.08.29.09.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:52:24 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: mst: Fix query_payload ack reply struct
Date: Thu, 29 Aug 2019 12:52:19 -0400
Message-Id: <20190829165223.129662-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IWHGTbjCnJwyiyI9Ca3d5eKUwHiljjpclYfL/wFTtyU=;
 b=HnHdjDcSHvDje8oZPzGSbFwk5vBbRKynW8WE1qn9oYUAqXENEds0d/fluwd/RR1fpd
 VsF0HoxjBgf8UuEip4jHNCbW3nUVpvhPDOvjWVqiV5h5cv30PVWJ17FsTK6VQlAkC8e3
 TkEpDUUUYD+Q06WbisqP5f/wWlm42KRYuNWBaGOwWFd+/dw3rXHgux4PXoR7LugRHzlE
 zF+qDnLDx46k1mc/KN6y9Kv17ZFg/Bn07HmFYAABP6akdker9Tiqtb3JDAr3uB7cPYTk
 Oa/+Ul3GZBXscNHuYROHQCRKaSmBwT09rubf/0RmcJ+XQE+LTsEbLn27grG9ukx+RO+Z
 FNvw==
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
Cc: Todd Previte <tprevite@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, stable@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpTcGVjIHNheXNbMV0gQWxs
b2NhdGVkX1BCTiBpcyAxNiBiaXRzCgpbMV0tIERpc3BsYXlQb3J0IDEuMiBTcGVjLCBTZWN0aW9u
IDIuMTEuOS44LCBUYWJsZSAyLTk4CgpGaXhlczogYWQ3ZjhhMWY5Y2VkICgiZHJtL2hlbHBlcjog
YWRkIERpc3BsYXlwb3J0IG11bHRpLXN0cmVhbSBoZWxwZXIgKHYwLjYpIikKQ2M6IEx5dWRlIFBh
dWwgPGx5dWRlQHJlZGhhdC5jb20+CkNjOiBUb2RkIFByZXZpdGUgPHRwcmV2aXRlQGdtYWlsLmNv
bT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHku
cnVuPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpD
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjMuMTcrClNpZ25lZC1vZmYtYnk6IFNlYW4g
UGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGluY2x1ZGUvZHJtL2RybV9kcF9tc3Rf
aGVscGVyLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAppbmRleCAyYmE2MjUzZWE2ZDMuLmZjMzQ5MjA0
YTcxYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAorKysgYi9p
bmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oCkBAIC0zMzQsNyArMzM0LDcgQEAgc3RydWN0
IGRybV9kcF9yZXNvdXJjZV9zdGF0dXNfbm90aWZ5IHsKIAogc3RydWN0IGRybV9kcF9xdWVyeV9w
YXlsb2FkX2Fja19yZXBseSB7CiAJdTggcG9ydF9udW1iZXI7Ci0JdTggYWxsb2NhdGVkX3BibjsK
Kwl1MTYgYWxsb2NhdGVkX3BibjsKIH07CiAKIHN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3Jl
cV9ib2R5IHsKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
