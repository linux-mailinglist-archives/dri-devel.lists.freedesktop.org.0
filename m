Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9E6B133
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 23:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF236E0DD;
	Tue, 16 Jul 2019 21:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6E36E0DC;
 Tue, 16 Jul 2019 21:40:01 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i18so10069003pgl.11;
 Tue, 16 Jul 2019 14:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oew0rHc9LPVEYVoKj5FLWcwETCU8bWgVAiMOY+m8rQs=;
 b=tqqy2geeMIJD4WRZmG9z4mWom3L+cT5y6cao4oq09NGFA8zVSA2kkrCtptNzkreKlL
 XfQQnIjkUhxnrLoKqrqNLIkaBeNuCZg8JYxH4bTZNlsjGBVlAXrYz/6v2PdEObi5xMTT
 +AeHa8po0fISrqVJnpG+ljzRt4xHsXDRoQbiaAqoK3QXPMRzHI6C6SN+YeEqbf4qHOBE
 qvfMlr3yblfwe1M6dSopxqvM5xeGfPXJxSTyyNrBYlLOWdcuviXXx5PBt1ooj0uN5+Bs
 eJEDwrL9wT8UFmefA6+WhW1RyB3iHmrQdvCrtjhtCQLTio0SL4QqIqA1ZIsj4CcE73zX
 QR+g==
X-Gm-Message-State: APjAAAVf5958Rkdg4fjP/dPpKE+89NdTHG2ry1DdAQFJHYIoJNk0g12M
 kdqFy8dQG6F/3kyoBb7ytmPWs0cZUBg=
X-Google-Smtp-Source: APXvYqx+31ux3AoWLdoZRzOA2Sk4B6TvHUXDsOvZ3wbk2EHT9+znE5RnV6rR626W6uSBer+MHEIXzw==
X-Received: by 2002:a63:c1c:: with SMTP id b28mr4522700pgl.354.1563313200857; 
 Tue, 16 Jul 2019 14:40:00 -0700 (PDT)
Received: from localhost ([100.118.89.203])
 by smtp.gmail.com with ESMTPSA id o95sm18933486pjb.4.2019.07.16.14.39.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 14:40:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/gem: don't force writecombine mmap'ing
Date: Tue, 16 Jul 2019 14:37:40 -0700
Message-Id: <20190716213746.4670-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oew0rHc9LPVEYVoKj5FLWcwETCU8bWgVAiMOY+m8rQs=;
 b=cUmEeelpLLzt9uU8Kc5mtrmDCofKp6X62YT8kg/ywsuaaY8eOtghanE3divC3APozs
 zMV9jm3NA63gOSuu1qez7JLtbuX3jNGjtG1WOsP/e15FGrjLeXocrvK2uwbZLoEBTgE2
 Rzm/RXF2QeCU7EKIKsNnrCjUKiehEqvPsoqntBznIBgG+GAdeBwmIZuXfjiQqJDTMfsC
 HoWWGDkZx63oyErc2+yq2911qfeYNM4u7m4u01zirPyN0QqnGd9Kg9QyFzDhbPLczZDy
 ltsboE+bBTErk6of4euwNt+WJMu9sGGruYa+sS9s6DBd8A3MklOaO07qzZWB60JrUjkt
 pkIQ==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIGRyaXZlciBzaG91
bGQgYmUgaW4gY29udHJvbCBvZiB0aGlzLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgotLS0KSXQgaXMgcG9zc2libGUgdGhhdCB0aGlzIHdhcyBtYXNr
aW5nIGJ1Z3MgKGllLiBub3Qgc2V0dGluZyBhcHByb3ByaWF0ZQpwZ3Byb3QpIGluIGRyaXZlcnMu
ICBJIGRvbid0IGhhdmUgYSBwYXJ0aWN1bGFybHkgZ29vZCBpZGVhIGZvciB0cmFja2luZwp0aG9z
ZSBkb3duIChzaW5jZSBJIGRvbid0IGhhdmUgdGhlIGh3IGZvciBtb3N0IGRyaXZlcnMpLiAgVW5s
ZXNzIHNvbWVvbmUKaGFzIGEgYmV0dGVyIGlkZWEsIG1heWJlIGxhbmQgdGhpcyBhbmQgbGV0IGRy
aXZlciBtYWludGFpbmVycyBmaXggYW55CnBvdGVudGlhbCBmYWxsb3V0IGluIHRoZWlyIGRyaXZl
cnM/CgpUaGlzIGlzIG5lY2Vzc2FyeSBmb3IgdGhlIGxhc3QgcGF0Y2ggdG8gZml4IFZHRU0gYnJv
a2VubmVzcyBvbiBhcm0uCgp2MzogcmViYXNlZCBvbiBkcm0tdGlwCgogZHJpdmVycy9ncHUvZHJt
L2RybV9nZW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbS5jCmluZGV4IGU2YzEyYzZlYzcyOC4uODQ2ODljY2FlODg1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtLmMKQEAgLTExMDksNyArMTEwOSw3IEBAIGludCBkcm1fZ2VtX21tYXBfb2JqKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqLCB1bnNpZ25lZCBsb25nIG9ial9zaXplLAogCiAJdm1hLT52
bV9mbGFncyB8PSBWTV9JTyB8IFZNX1BGTk1BUCB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVN
UDsKIAl2bWEtPnZtX3ByaXZhdGVfZGF0YSA9IG9iajsKLQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBn
cHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7CisJdm1h
LT52bV9wYWdlX3Byb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwogCXZtYS0+
dm1fcGFnZV9wcm90ID0gcGdwcm90X2RlY3J5cHRlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7CiAKIAkv
KiBUYWtlIGEgcmVmIGZvciB0aGlzIG1hcHBpbmcgb2YgdGhlIG9iamVjdCwgc28gdGhhdCB0aGUg
ZmF1bHQKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
