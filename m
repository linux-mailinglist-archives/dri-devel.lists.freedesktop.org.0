Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30345084
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 02:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BBE892BC;
	Fri, 14 Jun 2019 00:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E517892BC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 00:27:16 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l128so624962qke.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 17:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7C0S5WJfNJgOiJ52J26beAsusEAv+KWpAN7qYsheGE=;
 b=PZHt1JksQV1IC2j5Y0NEF6I6P/ubgkCNSHt4qQJwjrPOPXnmtTWa9OUfmK/hHcp0Eu
 TgYR5fg36ktYudThdGsFv4d6dMHop/LVSrcSJu8hp3x8yrUHy0b5vZKeLhm/G1/UgpU/
 BJ+2nrKsdbKftAoULByQhHexB9ZPBVzC2iZksVQzmEM+Dzy4OJtgoSFI4gls2ZhUeSGB
 bPxpig5ana40FB5oDjwTWFYztExmjPxqbbp7fmLpjEKgA3yaNpuV3kD4LifALvw/Hh2L
 vbkQVD+d9pN8xvZheIGhQnOHenNMVSVMpc0pW/B5kTZxNAbpfZO4rkPLM+LXq3LBPvqW
 a0Yw==
X-Gm-Message-State: APjAAAXDGIXUGvn6NjpGBLyB/htQ9xbFAMaWqZVNoxSy+3Soz2VqKdSc
 xXvFgFahLJ1Drwmwj6U7KltZ2M+YWrc=
X-Google-Smtp-Source: APXvYqyyRZKo36Hih+LhL9ssw2RDugm/GxI/CEdMIrA92jp9jxXVdjxKImfgSr4FB+cE1T6TocYo+g==
X-Received: by 2002:a37:9c8:: with SMTP id 191mr72861748qkj.341.1560472035395; 
 Thu, 13 Jun 2019 17:27:15 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id x10sm982920qtc.34.2019.06.13.17.27.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 17:27:14 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Fix connector atomic_check compilation fail
Date: Thu, 13 Jun 2019 20:27:00 -0400
Message-Id: <20190614002713.141340-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l7C0S5WJfNJgOiJ52J26beAsusEAv+KWpAN7qYsheGE=;
 b=eB9KHsQFoDVQBCbvWWjk4NNJVeOT6qXMnZMoAb+7XVeblYYU6KS0h8f1wlsXwuUyYq
 dHHr0KQiFB9xM0BiVk5qCkyxRu+NwoklEQwxKSqCKukuAzhlPg+4luqI2XOTHJ0ZPyp2
 prmwNGDLYcF1MraHo3cP5WaAm6CoH9F29RCjd2u89p2DI6/LqPSt7RYLtatx0CH6f9um
 Y8fID80t77YMhvbXA30oyIDSOvGkVQNFrRsvb7XDcpnflzb3a7n2Q5nxSBYaY7NgOpmn
 GYM38LUW1K3iprHANmHmaNwGNyvemPDCeJcBypBDmgqKh4mwUaJB1rptuWg8ux/IuWyL
 42vg==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Ben Skeggs <bskeggs@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Karol Herbst <karolherbst@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJIG1pc3NlZCBhbWRncHUg
aW4gbXkgY29ubm5lY3Rvcl9oZWxwZXJfZnVuY3MtPmF0b21pY19jaGVjayBjb252ZXJzaW9uLAp3
aGljaCBpcyB1bmRlcnN0YW5kYWJseSBjYXVzaW5nIGNvbXBpbGF0aW9uIGZhaWx1cmVzLgoKRml4
ZXM6IDZmM2I2Mjc4MWJiZCAoImRybTogQ29udmVydCBjb25uZWN0b3JfaGVscGVyX2Z1bmNzLT5h
dG9taWNfY2hlY2sgdG8gYWNjZXB0IGRybV9hdG9taWNfc3RhdGUiKQpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5j
b20+CkNjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+
CkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNjOiBCZW4gU2tlZ2dz
IDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0r
cmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5l
dD4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4gW2ZvciByY2FyIGx2ZHNdCkNjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQ
YXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogS2Fyb2wgSGVyYnN0IDxrYXJv
bGhlcmJzdEBnbWFpbC5jb20+CkNjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcKUmVw
b3J0ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpTaWduZWQt
b2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNSArKystLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAzYTcyM2U1
NTNhMTkzLi4zZDVlODI4YzNkMjg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTM5NTMsOSArMzk1MywxMCBAQCBpc19oZHJf
bWV0YWRhdGFfZGlmZmVyZW50KGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpvbGRf
c3RhdGUsCiAKIHN0YXRpYyBpbnQKIGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2NoZWNrKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uLAotCQkJCSBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0
ZSAqbmV3X2Nvbl9zdGF0ZSkKKwkJCQkgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQog
ewotCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSA9IG5ld19jb25fc3RhdGUtPnN0YXRl
OworCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpuZXdfY29uX3N0YXRlID0KKwkJZHJtX2F0
b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9zdGF0ZShzdGF0ZSwgY29ubik7CiAJc3RydWN0IGRybV9j
b25uZWN0b3Jfc3RhdGUgKm9sZF9jb25fc3RhdGUgPQogCQlkcm1fYXRvbWljX2dldF9vbGRfY29u
bmVjdG9yX3N0YXRlKHN0YXRlLCBjb25uKTsKIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSBuZXdf
Y29uX3N0YXRlLT5jcnRjOwotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xl
IC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
