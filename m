Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB444B39
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E227489873;
	Thu, 13 Jun 2019 18:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502B389873
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:54:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id p184so9091123pfp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nMcHhUCCSqrQ8w5r0SBOHVWgQpyokTTOxyC10sE/a4o=;
 b=goBYDzl2rhxf/iHhU0pUVRZKXqOD/2FWikfv5dwGl0FOkpJytSTBtk6w6/c2BvrY7d
 GAmSXmTdHJmX0aVnVT9iM+YtPgIT+AW3iDe6N7WvH+Pb2xEblAa/OfdDqRN7WWWJJvMp
 ZKJF71zngdwswM4iCsfQcmGpWfDxC0ZJk34LoQtnVoOaZO8C95Xl3ZC6wMx46XYHZjQz
 qpNvI0QiME6oK5R+O9qJjg8OXAgCwQPP38BgjZV7DvgqmMiegiLhaCp8rxu7U02hYVSv
 zZ96Boa6g9s8aTV2PsuJPxOxwoKdGFoygH+lxgGzYOgxe7Ts2zjrArORMnIWmyzpKi3c
 LK3g==
X-Gm-Message-State: APjAAAUx5lu0U71Lk4xSIVax1x6f2UdgeXG1riShx4smCDRpRn2BbeYl
 W9tZQYixEBz/1NIWEG7BexF0mQ==
X-Google-Smtp-Source: APXvYqxrRxrN92j6nLSvDJAzSmADkZczeGaGVbTYryt+foAPqo3y92wRc9rutMzZqwiIuC90V9eyBg==
X-Received: by 2002:a63:ec02:: with SMTP id j2mr33010098pgh.340.1560452045846; 
 Thu, 13 Jun 2019 11:54:05 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.54.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:54:05 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 4/9] drm/sun4i: tcon_top: Use clock name index macros
Date: Fri, 14 Jun 2019 00:22:36 +0530
Message-Id: <20190613185241.22800-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nMcHhUCCSqrQ8w5r0SBOHVWgQpyokTTOxyC10sE/a4o=;
 b=aJ8KuW1/a6+tHfGMTMvAFMkE+bE512jfVE8Ts4fTzh36vUnZpd+YOgfEhA4vkVqhT9
 /IqxU6qDHF8aTkLeF/19ZAFzqB0zV8mcUhuKGrxQLVSZVICNkaUrWBm82hc2XyUcWIKC
 j7qefAWyIFHU22ZcbluSMxnkMZvJGGqgeAX2k=
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
Cc: linux-sunxi@googlegroups.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VENPTiBUT1AgbXV4IGJsb2NrcyBpbiBSNDAgYXJlIHJlZ2lzdGVyaW5nIGNsb2NrIHVzaW5nCnRj
b24gdG9wIGNsb2NrIGluZGV4IG51bWJlcnMuCgpSaWdodCBub3cgdGhlIGNvZGUgaXMgdXNpbmcs
IHJlYWwgbnVtYmVycyBzdGFydCB3aXRoIDAsIGJ1dAp3ZSBoYXZlIHByb3BlciBtYWNyb3MgdGhh
dCBkZWZpbmVkIHRoZXNlIG5hbWUgaW5kZXggbnVtYmVycy4KClVzZSB0aGUgZXhpc3RpbmcgbWFj
cm9zLCBpbnN0ZWFkIG9mIHJlYWwgbnVtYmVycyBmb3IgbW9yZQpjb2RlIHJlYWRhYmlsaXR5LgoK
U2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX3Rjb25fdG9wLmMgfCA5ICsrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW44aV90Y29uX3RvcC5jCmluZGV4IDMyNjdkMGY5YjliMi4uNDY1ZTliMGNk
ZmVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfdGNvbl90b3AuYwpAQCAtMTk0LDE5ICsx
OTQsMjIgQEAgc3RhdGljIGludCBzdW44aV90Y29uX3RvcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCWNsa19kYXRhLT5od3NbQ0xLX1RDT05fVE9QX1RW
MF0gPQogCQlzdW44aV90Y29uX3RvcF9yZWdpc3Rlcl9nYXRlKGRldiwgInRjb24tdHYwIiwgcmVn
cywKIAkJCQkJICAgICAmdGNvbl90b3AtPnJlZ19sb2NrLAotCQkJCQkgICAgIFRDT05fVE9QX1RD
T05fVFYwX0dBVEUsIDApOworCQkJCQkgICAgIFRDT05fVE9QX1RDT05fVFYwX0dBVEUsCisJCQkJ
CSAgICAgQ0xLX1RDT05fVE9QX1RWMCk7CiAKIAlpZiAocXVpcmtzLT5oYXNfdGNvbl90djEpCiAJ
CWNsa19kYXRhLT5od3NbQ0xLX1RDT05fVE9QX1RWMV0gPQogCQkJc3VuOGlfdGNvbl90b3BfcmVn
aXN0ZXJfZ2F0ZShkZXYsICJ0Y29uLXR2MSIsIHJlZ3MsCiAJCQkJCQkgICAgICZ0Y29uX3RvcC0+
cmVnX2xvY2ssCi0JCQkJCQkgICAgIFRDT05fVE9QX1RDT05fVFYxX0dBVEUsIDEpOworCQkJCQkJ
ICAgICBUQ09OX1RPUF9UQ09OX1RWMV9HQVRFLAorCQkJCQkJICAgICBDTEtfVENPTl9UT1BfVFYx
KTsKIAogCWlmIChxdWlya3MtPmhhc19kc2kpCiAJCWNsa19kYXRhLT5od3NbQ0xLX1RDT05fVE9Q
X0RTSV0gPQogCQkJc3VuOGlfdGNvbl90b3BfcmVnaXN0ZXJfZ2F0ZShkZXYsICJkc2kiLCByZWdz
LAogCQkJCQkJICAgICAmdGNvbl90b3AtPnJlZ19sb2NrLAotCQkJCQkJICAgICBUQ09OX1RPUF9U
Q09OX0RTSV9HQVRFLCAyKTsKKwkJCQkJCSAgICAgVENPTl9UT1BfVENPTl9EU0lfR0FURSwKKwkJ
CQkJCSAgICAgQ0xLX1RDT05fVE9QX0RTSSk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgQ0xLX05VTTsg
aSsrKQogCQlpZiAoSVNfRVJSKGNsa19kYXRhLT5od3NbaV0pKSB7Ci0tIAoyLjE4LjAuMzIxLmdm
ZmM2ZmEwZTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
