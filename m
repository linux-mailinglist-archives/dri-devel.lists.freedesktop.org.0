Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE5AD1BFE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 00:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D94A6E347;
	Wed,  9 Oct 2019 22:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B376EA63
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 22:41:22 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r4so3625647edy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 15:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/hPWHGF5rg5791D6HcAHL3fPUMzZ6UUsGWeysiv7Fw=;
 b=RBIb7PM2fb8xCsGIsADMUi1v+SyPVfmwoRrDPP+2cWDFrgE3AoweUiuwgOGSEuJrOA
 Ca4GRrSpE7xnQAyqjjYZbnr38x6KWDTTyQH+t00Y4QsSbI4ppRv0YkGS2H8GAHreHyYR
 HKOg/5JW1E+mzMsgZxFd8Zdhjso+/5BcrqDDKzVsIBmLNDkKnOOK9BYDltRehpCWM+FS
 gLRmhZToRUib5cVCfjfbYqVTUuwVW/Jb+BaBcfqa697TCHfAFdt+KPsf0oUNxc8yz32g
 jOxFqb8Ulu+aJiMK551Npikpz/2th3xU2M+Yk9xNHr1Bsp1XYGLEhXO6sNu8/DASzRQe
 k26A==
X-Gm-Message-State: APjAAAVyzAcXWpuDRd+o5mXDWJsTzwKUtNQxVjkAJc+h0TTrsP/YkVb1
 J1VmEp8ss3YEA0IABBWzOCkU6Mk4J8c=
X-Google-Smtp-Source: APXvYqxJqg8jK0y7Au5yA+5eyRYHvNVscG3Ars/els20Y/PiLvhhRW94w7pPF5QOgajEtG8ZUN8kvg==
X-Received: by 2002:a50:ee12:: with SMTP id g18mr5163084eds.114.1570660880503; 
 Wed, 09 Oct 2019 15:41:20 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id a19sm559403edy.37.2019.10.09.15.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 15:41:18 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/dp-mst: Drop connection_mutex check
Date: Thu, 10 Oct 2019 00:41:13 +0200
Message-Id: <20191009224113.5432-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/hPWHGF5rg5791D6HcAHL3fPUMzZ6UUsGWeysiv7Fw=;
 b=EQ5y/epsWhCfagZBHOtxU35cFaq62yKsV7zzbDpX8YsdSb0Ny4G05Ozcr9oAxGIy0b
 XjYbynkREiCP1Oomr18TIY6QYPEMeYALrUhjGEuqtpr4ztcbdujzu/pu6CySzPGJR4fj
 j9Vped1Xnk6ZWSBqHoUkIG9VylZlFQW/nEmlU=
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJpdmF0ZSBhdG9taWMgb2JqZWN0cyBoYXZlIGdyb3duIHRoZWlyIG93biBsb2NraW5nIHdpdGgK
CmNvbW1pdCBiOTYyYTEyMDUwYTM4N2U0YmJmM2E0ODc0NWFmZTFkMjlkMzk2YjBkCkF1dGhvcjog
Um9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpEYXRlOiAgIE1vbiBPY3QgMjIgMTQ6MzE6
MjIgMjAxOCArMDIwMAoKICAgIGRybS9hdG9taWM6IGludGVncmF0ZSBtb2Rlc2V0IGxvY2sgd2l0
aCBwcml2YXRlIG9iamVjdHMKCndoaWNoIG1lYW5zIHdlJ3JlIG5vIGxvbmdlciByZWx5aW5nIG9u
IGNvbm5lY3Rpb25fbXV0ZXggZm9yIG1zdCBzdGF0ZQpsb2NraW5nIG5lZWRzLgoKQ2M6IEx5dWRl
IFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4K
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDEgLQogMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpp
bmRleCA2YjE0YjYzYjhkNjIuLjkzNjRlNGY0Mjk3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCkBAIC00MTg2LDcgKzQxODYsNiBAQCBzdHJ1Y3QgZHJtX2RwX21zdF90b3Bv
bG9neV9zdGF0ZSAqZHJtX2F0b21pY19nZXRfbXN0X3RvcG9sb2d5X3N0YXRlKHN0cnVjdCBkcm1f
YQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtZ3ItPmRldjsKIAotCVdBUk5fT04oIWRy
bV9tb2Rlc2V0X2lzX2xvY2tlZCgmZGV2LT5tb2RlX2NvbmZpZy5jb25uZWN0aW9uX211dGV4KSk7
CiAJcmV0dXJuIHRvX2RwX21zdF90b3BvbG9neV9zdGF0ZShkcm1fYXRvbWljX2dldF9wcml2YXRl
X29ial9zdGF0ZShzdGF0ZSwgJm1nci0+YmFzZSkpOwogfQogRVhQT1JUX1NZTUJPTChkcm1fYXRv
bWljX2dldF9tc3RfdG9wb2xvZ3lfc3RhdGUpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
