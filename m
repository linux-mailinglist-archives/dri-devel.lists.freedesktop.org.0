Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65541E38C6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049D46E52F;
	Thu, 24 Oct 2019 16:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B076E503
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:38 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r141so3264044wme.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZImZ2aYVtus8sIvpoq9U8jJL9U3kFR2rDXns/Vgt5XE=;
 b=LNX77TlqMYUnVBsUgHSDKjtxB/l+jxW6/W1OxYMw/CA8/KcXF15mjUjah09+CsdvN+
 1YjXNvqUDHTYIf1bRz5GgVZgQaO+ypoF6fctXduzZARSj9ksMpipfkphsts92OJ0Lu4+
 0GcpUC7WqF7ep6tpu+/oFj/prXh2nJYM0M/f1EzNzvf9BdriWBslUaXeEblkDEwwT3sh
 +7qUeexS/TQ1ilok3vatinSESQq2urghxpWf2Pk6MO0IUDZbcvxhnkGroRI9y8UeAXt+
 nFt+nGTbcoRAK6800EdA3PjbQ9/EkcCRjW4ZbwSZqREp+/BJLR8UADbptOzatc3L63Ka
 bqfQ==
X-Gm-Message-State: APjAAAXnAVJUAxZVEL14xD10HbIHUKlVWaGDWhtgqPAdjsQzT4CfDR9z
 ilWst8dZ5qyab9O+zF+Vdhs=
X-Google-Smtp-Source: APXvYqyOpLGHJsUa+hisq8WwQTqCNAzEDgyAM1a3TVl4A5vM4r4dOEIwafat4IHDiMZVPKBefDV58Q==
X-Received: by 2002:a7b:cf0d:: with SMTP id l13mr5528270wmg.47.1571935595921; 
 Thu, 24 Oct 2019 09:46:35 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v128sm4455330wmb.14.2019.10.24.09.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 26/32] drm/tegra: sor: Support DisplayPort on Tegra194
Date: Thu, 24 Oct 2019 18:45:28 +0200
Message-Id: <20191024164534.132764-27-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZImZ2aYVtus8sIvpoq9U8jJL9U3kFR2rDXns/Vgt5XE=;
 b=e3YdW4gAuq7BDVpzoPNbRXuhb+yjojW9302LnJrx7BEJmnVsvxyhyMn862RoZBh4Dt
 6Q7zCdjSBcg3HpcmYB2xyM85dtwrZCq3YJ33xKRV+tNN1d+6bUswVcodc6xCt+EUA/P9
 zaC4p96h7ilg5MKZ4pSjvpTITIkB+DdvQqtWSXse1t4am6BnXkqDMKZivwgeE4F9BS2a
 B/a6edUlQ0KBnTLS7O8F4UNA75VegUrbnjqZCFAo4ZdITFcPkX5ZoRf3ASCpT6cMvgU9
 TFTP3dR3mI4CGCvzZCbqMviWka3w1rDXniT7DPX+3uZ3YFj15RAjedhmQvB5Su0N4ywh
 SlMw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJldXNlIHBhcmFtZXRl
cnMgZnJvbSBlYXJsaWVyIGdlbmVyYXRpb25zIHRvIHN1cHBvcnQgRGlzcGxheVBvcnQgb24KVGVn
cmExOTQuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKaW5kZXggYWYyMzRkNWVmYmQ3Li5m
ZGJkNzZlYzFjZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKQEAgLTM3MjcsNiArMzcyNywxMSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHRlZ3JhX3Nvcl9zb2MgdGVncmExOTRfc29yID0gewogCS5zZXR0aW5n
cyA9IHRlZ3JhMTk0X3Nvcl9oZG1pX2RlZmF1bHRzLAogCiAJLnhiYXJfY2ZnID0gdGVncmEyMTBf
c29yX3hiYXJfY2ZnLAorCS5sYW5lX21hcCA9IHRlZ3JhMTI0X3Nvcl9sYW5lX21hcCwKKwkudm9s
dGFnZV9zd2luZyA9IHRlZ3JhMTg2X3Nvcl92b2x0YWdlX3N3aW5nLAorCS5wcmVfZW1waGFzaXMg
PSB0ZWdyYTE4Nl9zb3JfcHJlX2VtcGhhc2lzLAorCS5wb3N0X2N1cnNvciA9IHRlZ3JhMTI0X3Nv
cl9wb3N0X2N1cnNvciwKKwkudHhfcHUgPSB0ZWdyYTEyNF9zb3JfdHhfcHUsCiB9OwogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB0ZWdyYV9zb3Jfb2ZfbWF0Y2hbXSA9IHsKLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
