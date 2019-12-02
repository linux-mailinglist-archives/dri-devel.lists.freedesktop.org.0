Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A510F067
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 20:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11C16E2FF;
	Mon,  2 Dec 2019 19:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313526E2EF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:33:46 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e10so831477ljj.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:33:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M6n2l/EBcueNmX8f7XdGTcQ8vUUpCGLFuWYhReTcoKE=;
 b=mKD+dKlB6wRb1kKvE4qa1nRUvN5EPEPey1mR0o0puRVVxt+G/GaX2ahV7FIZYOQsJs
 NUX6GUgom/0N+l3Nzq34+bWCXPZ7NrrrkCuo2VF2Vixsfr8XMRRAWFt2rpf1as/+ZFj+
 RrwMXUbeIUvwlaKAdn92HHZi9HrueWQ951a4P1rmF5iith2DMsgYBgurboYI0VgeJgV3
 PlFbmDGKtJ/g/EOTYsWLooZlOx0hhapQ5o4xjDaZLEWidV6TKImGcmB4P6BPR7sgd37K
 JAKteGr4rlhlffKSfb0iJYUF59EyrfClE8A54J+ePqlI2+SPnFXDYt1r6ER1Ydfb8pbp
 uXyw==
X-Gm-Message-State: APjAAAWFBDRgQZTJzAeK66zhvEvVig5+xDDRqFmI2TlhMpMEGCWz9up8
 aPu1NokknOTb4YOk/I+JXLCGYWz4EPtdBw==
X-Google-Smtp-Source: APXvYqyrVRyyR4w53XWdXd/Ds8WXmJXF4JV6lta6C9GpnzvDF7NujpVpoOacgf9V4KFroqTFA7Q4PA==
X-Received: by 2002:a2e:8804:: with SMTP id x4mr277866ljh.2.1575315224026;
 Mon, 02 Dec 2019 11:33:44 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:43 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 21/26] drm/panel: sharp-lq101r1sx01: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:25 +0100
Message-Id: <20191202193230.21310-22-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6n2l/EBcueNmX8f7XdGTcQ8vUUpCGLFuWYhReTcoKE=;
 b=IoKSmzU7gpDxUkxl0EdaC0gWScyLrTcPd3YGGa7b4HdIqDI8G1e8FafzmGs6jogxMu
 4PaXLxX2BIT63x1BMLWqC0EPxIfNV0uUXhjGCBjRnJ95PdBZFSepRhXi48HzJsmPgR6p
 nThEDz1xjPUYPgGBuMacP2vLvP9wWncj/fCylCldeMQpyFCLJm5HWIrbkmRKu/suIXcT
 vIYjVTMiZs6FqypDWxZOFvWoZcnXdjd+tuFuhS6aQUTO3t/0WeH9ez7RD5TQj5BoePw9
 HzDH58XmVFP8bucXCVQ2dtV46btVIkJ2YXGk7aWvtGn8MUVFB/j0ggZVaoWoBhBKZ+LB
 gSjw==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzog
VGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1s
cTEwMXIxc3gwMS5jICAgfCAyMSArKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHExMDFyMXN4MDEuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1zaGFycC1scTEwMXIxc3gwMS5jCmluZGV4IDE3ZDQwNmY0OWMzZC4uYjVkMTk3
NzIyMWE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHEx
MDFyMXN4MDEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHExMDFy
MXN4MDEuYwpAQCAtMyw3ICszLDYgQEAKICAqIENvcHlyaWdodCAoQykgMjAxNCBOVklESUEgQ29y
cG9yYXRpb24KICAqLwogCi0jaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+CiAjaW5jbHVkZSA8
bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+CiAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+CkBAIC0yMyw3ICsyMiw2IEBAIHN0cnVjdCBzaGFycF9wYW5lbCB7
CiAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqbGluazE7CiAJc3RydWN0IG1pcGlfZHNpX2Rldmlj
ZSAqbGluazI7CiAKLQlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmFja2xpZ2h0OwogCXN0cnVj
dCByZWd1bGF0b3IgKnN1cHBseTsKIAogCWJvb2wgcHJlcGFyZWQ7CkBAIC05NCw4ICs5Miw2IEBA
IHN0YXRpYyBpbnQgc2hhcnBfcGFuZWxfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkK
IAlpZiAoIXNoYXJwLT5lbmFibGVkKQogCQlyZXR1cm4gMDsKIAotCWJhY2tsaWdodF9kaXNhYmxl
KHNoYXJwLT5iYWNrbGlnaHQpOwotCiAJc2hhcnAtPmVuYWJsZWQgPSBmYWxzZTsKIAogCXJldHVy
biAwOwpAQCAtMjU4LDggKzI1NCw2IEBAIHN0YXRpYyBpbnQgc2hhcnBfcGFuZWxfZW5hYmxlKHN0
cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCWlmIChzaGFycC0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7
CiAKLQliYWNrbGlnaHRfZW5hYmxlKHNoYXJwLT5iYWNrbGlnaHQpOwotCiAJc2hhcnAtPmVuYWJs
ZWQgPSB0cnVlOwogCiAJcmV0dXJuIDA7CkBAIC0zMTcsNyArMzExLDcgQEAgTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgc2hhcnBfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgaW50IHNoYXJwX3BhbmVsX2Fk
ZChzdHJ1Y3Qgc2hhcnBfcGFuZWwgKnNoYXJwKQogewotCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZz
aGFycC0+bGluazEtPmRldjsKKwlpbnQgcmV0OwogCiAJc2hhcnAtPm1vZGUgPSAmZGVmYXVsdF9t
b2RlOwogCkBAIC0zMjUsMTQgKzMxOSwxMyBAQCBzdGF0aWMgaW50IHNoYXJwX3BhbmVsX2FkZChz
dHJ1Y3Qgc2hhcnBfcGFuZWwgKnNoYXJwKQogCWlmIChJU19FUlIoc2hhcnAtPnN1cHBseSkpCiAJ
CXJldHVybiBQVFJfRVJSKHNoYXJwLT5zdXBwbHkpOwogCi0Jc2hhcnAtPmJhY2tsaWdodCA9IGRl
dm1fb2ZfZmluZF9iYWNrbGlnaHQoZGV2KTsKLQotCWlmIChJU19FUlIoc2hhcnAtPmJhY2tsaWdo
dCkpCi0JCXJldHVybiBQVFJfRVJSKHNoYXJwLT5iYWNrbGlnaHQpOwotCiAJZHJtX3BhbmVsX2lu
aXQoJnNoYXJwLT5iYXNlLCAmc2hhcnAtPmxpbmsxLT5kZXYsICZzaGFycF9wYW5lbF9mdW5jcywK
IAkJICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwogCisJcmV0ID0gZHJtX3BhbmVsX29m
X2JhY2tsaWdodCgmc2hhcnAtPmJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAly
ZXR1cm4gZHJtX3BhbmVsX2FkZCgmc2hhcnAtPmJhc2UpOwogfQogCkBAIC00MDgsNyArNDAxLDcg
QEAgc3RhdGljIGludCBzaGFycF9wYW5lbF9yZW1vdmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAq
ZHNpKQogCQlyZXR1cm4gMDsKIAl9CiAKLQllcnIgPSBzaGFycF9wYW5lbF9kaXNhYmxlKCZzaGFy
cC0+YmFzZSk7CisJZXJyID0gZHJtX3BhbmVsX2Rpc2FibGUoJnNoYXJwLT5iYXNlKTsKIAlpZiAo
ZXJyIDwgMCkKIAkJZGV2X2VycigmZHNpLT5kZXYsICJmYWlsZWQgdG8gZGlzYWJsZSBwYW5lbDog
JWRcbiIsIGVycik7CiAKQEAgLTQyOSw3ICs0MjIsNyBAQCBzdGF0aWMgdm9pZCBzaGFycF9wYW5l
bF9zaHV0ZG93bihzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kpCiAJaWYgKCFzaGFycCkKIAkJ
cmV0dXJuOwogCi0Jc2hhcnBfcGFuZWxfZGlzYWJsZSgmc2hhcnAtPmJhc2UpOworCWRybV9wYW5l
bF9kaXNhYmxlKCZzaGFycC0+YmFzZSk7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgbWlwaV9kc2lfZHJp
dmVyIHNoYXJwX3BhbmVsX2RyaXZlciA9IHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
