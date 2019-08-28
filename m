Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEFCA0314
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 15:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477789C60;
	Wed, 28 Aug 2019 13:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D8D89C60
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 13:23:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y19so2516499wrd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 06:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMEwDnA8PK409z+Aw0DoKAxN3PbjiYfTei3jRL70xXE=;
 b=PVY16Q8dAQQT8FGKpq866/zJrdjpaDy71WJjkaL1A69+Xyp06ULuohlQ7mJqsjigft
 o8Ym2nLqJz63pM/enB9Gtcl6ORS7/nt+fgMs9YdiilNs+lVOEqtHdwcAowUuI1xQ0nUr
 g47kyCTT4CLuxtxb/lk49BcQUMqZx3U+RhzbGLEaI4qN0jwqLclk2WOCw4AG5nMUO+o4
 PCIdhXUU0E2/Zd15ULsXuPA/6WTSmxEdh81CqE8Qnoiui9GfWdw93QPvWu++uml1fJCA
 PtHe/+Nwm2zDD97o0isWg6o0aKWXycNms03N8dE3qgVQXeBeOgW/3F2Rh1zS5lbBF3Br
 rHCA==
X-Gm-Message-State: APjAAAVnvAwDrjEaBVC+Gxapliic7DjFIKGioF55OTKlKr+jn3K/cNrh
 E6sQqFRYH3TkkJhXXBTlLbxQ4AtRV2ozBw==
X-Google-Smtp-Source: APXvYqwSRs75Y6JmL0J+jZ9ePz6PFEOEGjCGu9Py7xJQeuRqpBpdE3NXmyi2gk1js3KzTuh8qnnuxw==
X-Received: by 2002:adf:ba4a:: with SMTP id t10mr4522910wrg.325.1566998595621; 
 Wed, 28 Aug 2019 06:23:15 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z7sm2785505wrh.67.2019.08.28.06.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 06:23:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm/meson: vclk: use the correct G12A frac max value
Date: Wed, 28 Aug 2019 15:23:11 +0200
Message-Id: <20190828132311.23881-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SMEwDnA8PK409z+Aw0DoKAxN3PbjiYfTei3jRL70xXE=;
 b=Uqh5RTPxsxlgO6fW+/GUp4PHz90/PXrd2mH3+ERhbCtOXr5thlsbr2p/LwY2qGqpwp
 VuHQen7EZmGCxAiXC1cfifEbYOaAC+p3+x/DJIs3P+8EgDXQ89qvHHqwqrG8nhBdxW+c
 tJwQqCHExOTpgBG9ImlyJxpAel/U4SnSMOwbYsPe88WLxu7Pmq5UYVC9duZEaD1GaLZo
 81vaNBLxSAlavlQjnWQ2ndvY1rZyH4+flemGFSIF98DM/qchwIzCXEG3n9t79jy2Y7TM
 jXnrU60lr0P44mWM3EoDT07kZ+I4m5LUEMwJfftMdDRo8EuKrXUMraB10G9aCyud/5+t
 tuPg==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxjdWxhdGluZyB0aGUgSERNSSBQTEwgc2V0dGluZ3MgZm9yIGEgRE1UIG1vZGUgUEhZ
IGZyZXF1ZW5jeSwKdXNlIHRoZSBjb3JyZWN0IG1heCBmcmFjdGlvbmFsIFBMTCB2YWx1ZSBmb3Ig
RzEyQSBWUFUuCgpXaXRoIHRoaXMgZml4LCB3ZSBjYW4gZmluYWxseSBzZXR1cCB0aGUgMTAyNHg3
NjgtNjAgbW9kZS4KCkZpeGVzOiAyMDJiOTgwOGY4ZWQgKCJkcm0vbWVzb246IEFkZCBHMTJBIFZp
ZGVvIENsb2NrIHNldHVwIikKU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJv
bmdAYmF5bGlicmUuY29tPgotLS0KRml4ZWQgdHlwbyBpbiBjb21taXQgbG9nLCAxMDI0eDc2ID0+
IDEwMjR4NzY4CgogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYyB8IDkgKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fdmNsay5jCmluZGV4IGFjNDkxYTc4MTk1Mi4uZjY5MDc5M2FlMmQ1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMKQEAgLTYzOCwxMyArNjM4LDE4IEBAIHN0
YXRpYyBib29sIG1lc29uX2hkbWlfcGxsX3ZhbGlkYXRlX3BhcmFtcyhzdHJ1Y3QgbWVzb25fZHJt
ICpwcml2LAogCQlpZiAoZnJhYyA+PSBIRE1JX0ZSQUNfTUFYX0dYQkIpCiAJCQlyZXR1cm4gZmFs
c2U7CiAJfSBlbHNlIGlmIChtZXNvbl92cHVfaXNfY29tcGF0aWJsZShwcml2LCBWUFVfQ09NUEFU
SUJMRV9HWE0pIHx8Ci0JCSAgIG1lc29uX3ZwdV9pc19jb21wYXRpYmxlKHByaXYsIFZQVV9DT01Q
QVRJQkxFX0dYTCkgfHwKLQkJICAgbWVzb25fdnB1X2lzX2NvbXBhdGlibGUocHJpdiwgVlBVX0NP
TVBBVElCTEVfRzEyQSkpIHsKKwkJICAgbWVzb25fdnB1X2lzX2NvbXBhdGlibGUocHJpdiwgVlBV
X0NPTVBBVElCTEVfR1hMKSkgewogCQkvKiBFbXBpcmljIHN1cHBvcnRlZCBtaW4vbWF4IGRpdmlk
ZXJzICovCiAJCWlmIChtIDwgMTA2IHx8IG0gPiAyNDcpCiAJCQlyZXR1cm4gZmFsc2U7CiAJCWlm
IChmcmFjID49IEhETUlfRlJBQ19NQVhfR1hMKQogCQkJcmV0dXJuIGZhbHNlOworCX0gZWxzZSBp
ZiAobWVzb25fdnB1X2lzX2NvbXBhdGlibGUocHJpdiwgVlBVX0NPTVBBVElCTEVfRzEyQSkpIHsK
KwkJLyogRW1waXJpYyBzdXBwb3J0ZWQgbWluL21heCBkaXZpZGVycyAqLworCQlpZiAobSA8IDEw
NiB8fCBtID4gMjQ3KQorCQkJcmV0dXJuIGZhbHNlOworCQlpZiAoZnJhYyA+PSBIRE1JX0ZSQUNf
TUFYX0cxMkEpCisJCQlyZXR1cm4gZmFsc2U7CiAJfQogCiAJcmV0dXJuIHRydWU7Ci0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
