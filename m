Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2ABDF7F0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191186E29B;
	Mon, 21 Oct 2019 22:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA816E176;
 Mon, 21 Oct 2019 21:14:59 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t5so13399834ilh.10;
 Mon, 21 Oct 2019 14:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LR3+seWWFASqTSZQrCeqQuAxv454H5+n1q+3KOFbBcs=;
 b=ALPryS71TneRlDMJ7owthI529LX9FUw+fUOgYwkvqalgaSp8m6VjYXXIfP9hSbEEt1
 RldPw5UMbex+PHr0EuQXzpdk+PDl4sUHdpop+XbcBo1goBQaKjywduaZMkDdDN/ycNVf
 oGf4a647iPZ2d/Th0feF6+Atc92EOqaAE1EeIFOkOx4m+IXq+HPHHeMV3+QTb0v8kpYu
 tEZlXydTOOwNBzBNgJ8yW9mKghsE5XuZmz3Bk+G6MbQKLLElVL+DtZQShEI2G7TOfXVg
 FHZdffmj9JxRNsvTqxrKehIocPTU26N5wLe0xKPIIzbDy80pm9mcQEoY0cxvJO9nxCKp
 ePJA==
X-Gm-Message-State: APjAAAWEH4Lh+bnhga52r1Y0a2NM55R3Wb5rebZMfzgqHavjZ5ntHu/1
 Dzkxy/AMALscAY/rEImoPwA=
X-Google-Smtp-Source: APXvYqyUmrw7izwsnnLUWNHlEPHYO40uOt6aOQoTUw2Mw/Tsn91K4k/anOyP4E2hJDIrHP3dqzyD8w==
X-Received: by 2002:a92:5b16:: with SMTP id p22mr29585825ilb.226.1571692498435; 
 Mon, 21 Oct 2019 14:14:58 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id m9sm6722618ilc.44.2019.10.21.14.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:14:57 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/nouveau: Fix memory leak in nouveau_bo_alloc
Date: Mon, 21 Oct 2019 16:14:48 -0500
Message-Id: <20191021211449.9104-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LR3+seWWFASqTSZQrCeqQuAxv454H5+n1q+3KOFbBcs=;
 b=G1I6gh7o/OFhK2+ufBpndx46sR9cyY67N6CBxIyxkgWvcaRC5RoOzDnEuqkOFFZ9Xh
 G2lGR9XhD9UJd43XoN6GjpKobREtEatr0444g4HiQ0vIp6qcNtT9izy8dxqFp7CXKHce
 8ZBaD4kQTeheSROXlCqCHJqYicJ5iQ9VeVlwsT+l0LYnADQQy12XeEgxz24VbihIbmas
 EBjpvrrl1tTvDVxNOoo+e8t7++Ptu20ey5KWx8LMT5lgriVDB4E5qG+qhKZbKmv0K1nQ
 sj6wWW0LedhBb9aXveHWrW2drichJEGv+dQwI930GHMCZji2BtPwr2uJu7Pbcz+SohQR
 h8iA==
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 emamd001@umn.edu, Ben Skeggs <bskeggs@redhat.com>, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIG5vdXZlYXVfYm9fYWxsb2MoKSBpZiBpdCBmYWlscyB0
byBkZXRlcm1pbmUgdGhlCnRhcmdldCBwYWdlIHNpemUgdmlhIHBpLCB0aGVuIHRoZSBhbGxvY2F0
ZWQgbWVtb3J5IGZvciBudmJvIHNob3VsZCBiZQpyZWxlYXNlZC4KCkZpeGVzOiAwMTljYmQ0YTRm
ZWIgKCJkcm0vbm91dmVhdTogSW5pdGlhbGl6ZSBHRU0gb2JqZWN0IGJlZm9yZSBUVE0gb2JqZWN0
IikKU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8IDQgKysrLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCBmODAxNWUwMzE4ZDcuLjE4ODU3Y2Y0NDA2OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMjc2LDggKzI3NiwxMCBAQCBu
b3V2ZWF1X2JvX2FsbG9jKHN0cnVjdCBub3V2ZWF1X2NsaSAqY2xpLCB1NjQgKnNpemUsIGludCAq
YWxpZ24sIHUzMiBmbGFncywKIAkJCWJyZWFrOwogCX0KIAotCWlmIChXQVJOX09OKHBpIDwgMCkp
CisJaWYgKFdBUk5fT04ocGkgPCAwKSkgeworCQlrZnJlZShudmJvKTsKIAkJcmV0dXJuIEVSUl9Q
VFIoLUVJTlZBTCk7CisJfQogCiAJLyogRGlzYWJsZSBjb21wcmVzc2lvbiBpZiBzdWl0YWJsZSBz
ZXR0aW5ncyBjb3VsZG4ndCBiZSBmb3VuZC4gKi8KIAlpZiAobnZiby0+Y29tcCAmJiAhdm1tLT5w
YWdlW3BpXS5jb21wKSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
