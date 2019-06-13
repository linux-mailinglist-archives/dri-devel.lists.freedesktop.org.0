Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B80D44B35
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78E189861;
	Thu, 13 Jun 2019 18:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583B889861
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:53:57 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id s27so43344pgl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0BqE/PvwTCOuDfT7ziZnBtJoPRweQQwkvxwrMq6Xa0=;
 b=D9zqbrP+LyIppK3O8yzTwuZS3crdkdj1S66nxen7IFCrgzPpAHT7rqbLMFM22gRhSs
 LtrOMwrLnjsa+VAgJWHiCNnqg8cEACtl7alp6Vb/ogDUHiFz+ZVgnd6fmgNdK91hWJhb
 QZZMSzo0v7WeBXiQM57tVggS4CAFof2k7HbSTgEnMS1rSAikPdSdSsoP8n7G5MCM8DpW
 eXV9F/wo/4JHtPhv41GB5TH4AFgLSpMvPj2e1xPaBsEXXMp2e3FT4ATYv7u4q5w4h/2W
 CH6FU5nMXhAddvX+bvqCldNV6I0dvlWiqmQETLEzIIQyoMJZhu/6bzArKFYqPoxJ5pHj
 yUpQ==
X-Gm-Message-State: APjAAAXUHLq0HuBrhydbZuKLG5d5yDtWOaqtAUiWbog+Pob4jHM+f+fa
 XsaYPjoegKEnuVdX6ZETy7yeqg==
X-Google-Smtp-Source: APXvYqwjcj/D4tJfxviPJ3DAP+ga6noWng4Pb876f1LgU512Tm5hDPwAQYW1f6WUhPSgbRzbYQRvtw==
X-Received: by 2002:a17:90a:a10f:: with SMTP id
 s15mr7164601pjp.30.1560452036899; 
 Thu, 13 Jun 2019 11:53:56 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.18])
 by smtp.gmail.com with ESMTPSA id p43sm946314pjp.4.2019.06.13.11.53.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 11:53:56 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 2/9] drm/sun4i: tcon: Add TCON LCD support for R40
Date: Fri, 14 Jun 2019 00:22:34 +0530
Message-Id: <20190613185241.22800-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0BqE/PvwTCOuDfT7ziZnBtJoPRweQQwkvxwrMq6Xa0=;
 b=aiVm+Ij7KcL3D/0YWJ8nXlH+dgfcDlsdPwTvVK7cZVI0JKLrd/YYhm2+Cq76YkYLL5
 +phoUjSXOTIFC6r/5BNh/LSGecRqCp5OmsC+IYPu1fqgZLYit3+9HgiLNkwfgHCj0V7q
 RmkSuKtICHPNKPfeEpAIaKJAo9jVsCTYxn+ek=
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

VENPTiBMQ0QwLCBMQ0QxIGluIGFsbHdpbm5lciBSNDAsIGFyZSB1c2VkIGZvciBtYW5hZ2luZwpM
Q0QgaW50ZXJmYWNlcyBsaWtlIFJHQiwgTFZEUyBhbmQgRFNJLgoKTGlrZSBUQ09OIFRWMCwgVFYx
IHRoZXNlIExDRDAsIExDRDEgYXJlIGFsc28gbWFuYWdlZCB2aWEKdGNvbiB0b3AuCgpBZGQgc3Vw
cG9ydCBmb3IgaXQsIGluIHRjb24gZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8
amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjRpX3Rjb24uYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCmluZGV4IDllOWQwOGVlODM4Ny4uODU1MzA2NmU3
YmVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKQEAgLTE0NzEsNiArMTQ3MSwxMiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjRpX3Rjb25fcXVpcmtzIHN1bjhpX2E4M3RfdHZfcXVp
cmtzID0gewogCS5oYXNfY2hhbm5lbF8xCQk9IHRydWUsCiB9OwogCitzdGF0aWMgY29uc3Qgc3Ry
dWN0IHN1bjRpX3Rjb25fcXVpcmtzIHN1bjhpX3I0MF9sY2RfcXVpcmtzID0geworCS5zdXBwb3J0
c19sdmRzCQk9IHRydWUsCisJLmhhc19jaGFubmVsXzAJCT0gdHJ1ZSwKKwkuc2V0X211eAkJPSBz
dW44aV9yNDBfdGNvbl90dl9zZXRfbXV4LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40
aV90Y29uX3F1aXJrcyBzdW44aV9yNDBfdHZfcXVpcmtzID0gewogCS5oYXNfY2hhbm5lbF8xCQk9
IHRydWUsCiAJLnNldF9tdXgJCT0gc3VuOGlfcjQwX3Rjb25fdHZfc2V0X211eCwKQEAgLTE1MDEs
NiArMTUwNyw3IEBAIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3VuNGlfdGNvbl9vZl90YWJs
ZVtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhpLWEzMy10Y29uIiwgLmRh
dGEgPSAmc3VuOGlfYTMzX3F1aXJrcyB9LAogCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1
bjhpLWE4M3QtdGNvbi1sY2QiLCAuZGF0YSA9ICZzdW44aV9hODN0X2xjZF9xdWlya3MgfSwKIAl7
IC5jb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1hODN0LXRjb24tdHYiLCAuZGF0YSA9ICZz
dW44aV9hODN0X3R2X3F1aXJrcyB9LAorCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjhp
LXI0MC10Y29uLWxjZCIsIC5kYXRhID0gJnN1bjhpX3I0MF9sY2RfcXVpcmtzIH0sCiAJeyAuY29t
cGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGktcjQwLXRjb24tdHYiLCAuZGF0YSA9ICZzdW44aV9y
NDBfdHZfcXVpcmtzIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuOGktdjNzLXRj
b24iLCAuZGF0YSA9ICZzdW44aV92M3NfcXVpcmtzIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJhbGx3
aW5uZXIsc3VuOWktYTgwLXRjb24tbGNkIiwgLmRhdGEgPSAmc3VuOWlfYTgwX3Rjb25fbGNkX3F1
aXJrcyB9LAotLSAKMi4xOC4wLjMyMS5nZmZjNmZhMGUzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
