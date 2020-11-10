Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153152ADF6F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DC189C14;
	Tue, 10 Nov 2020 19:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A34E89BF8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 23so14002468wrc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Cw+c1bijBRNEJBNcuwyoDPT+QgFeRvOvo7TvhybLeo=;
 b=PWC66NBKBqbAKeaPvh+fIwPsUTrr77JZ5lJi/VUiSXJz+i6RhEnKMMZYfcZ/G2UmHS
 a+YlBfDGygGt7q/35lioOB52huJFQ/4W9ARw4RzVniBughzQAP5QgMHLhRrq49dkGIZQ
 mrepcU/Fv2c8lxZAr8DKuEPWqETk1RPZplypE7HhSn+lhM5ghhYl6M7bZ4qm3m1/kyOX
 ZhiIum/62edwMQSW1uEp2T+OvozCXyvm6gkVMi+ecPlH/CDWgw/452hJo0RsadXjeS8O
 7o3rXLRHMKFP34+OMUWPe7ofQIIgEZYs93wyJzCrnPT1ezVxMW9/AgiXTgoXrIqC1yNL
 57Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Cw+c1bijBRNEJBNcuwyoDPT+QgFeRvOvo7TvhybLeo=;
 b=jlK1v/R6q4+IXKQz/8x6bfFtzzG9g3377OopqiOz5+K/Q7/r3rLtsYh1Wb0XOBESWM
 +2wQji/6Upu8M4H8NMpVQDtenX7xFuL9DL6gTESHu7xeNk2C83rO8sS/dU1LQsQ+wFAR
 U5rS0H6Atdqzh34kAVV5jcR/rm6hTdN+8ZT+oOau5KhjIowGkJvc17JJSTP6OBukwwqg
 JLViZ1NiczuTJVprnQ15OlqfzrrAHwoGDduayMuaN8innF5JvnC1B9S0szKCX2bNex9M
 8xPze4Xoksdwft+6o2cs/wPAau1J0s16NTOx3nOFp5tPavROQpLaQVx96NBw/qX8fULG
 mW7g==
X-Gm-Message-State: AOAM5316b2zi2r5DlmKVP2jVpbUOJ+xP1ytSDZD7CIzE6QmcIdy2EFUz
 qW7AYrAejeN0qEweqTUkn+5U0g==
X-Google-Smtp-Source: ABdhPJwObJNUH9bI5UnaQ5h1STq51/iqMrbw6I4FyP3eBEcoNXfxnJeJsn/CCHYRK5M0Re6eIDZ8gg==
X-Received: by 2002:a5d:67c4:: with SMTP id n4mr25343044wrw.125.1605036698892; 
 Tue, 10 Nov 2020 11:31:38 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:38 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/30] drm/radeon/evergreen_cs: Fix misnaming issues
 surrounding 'p' param
Date: Tue, 10 Nov 2020 19:31:00 +0000
Message-Id: <20201110193112.988999-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3MuYzoxMDI2OiB3YXJuaW5nOiBGdW5jdGlvbiBw
YXJhbWV0ZXIgb3IgbWVtYmVyICdwJyBub3QgZGVzY3JpYmVkIGluICdldmVyZ3JlZW5fY3NfcGFj
a2V0X3BhcnNlX3ZsaW5lJwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3MuYzox
MDI2OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdwYXJzZXInIGRlc2NyaXB0
aW9uIGluICdldmVyZ3JlZW5fY3NfcGFja2V0X3BhcnNlX3ZsaW5lJwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9ldmVyZ3JlZW5fY3MuYzoxMDk1OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIg
b3IgbWVtYmVyICdwJyBub3QgZGVzY3JpYmVkIGluICdldmVyZ3JlZW5fY3NfaGFuZGxlX3JlZycK
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmM6MTA5NTogd2FybmluZzogRXhj
ZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAncGFyc2VyJyBkZXNjcmlwdGlvbiBpbiAnZXZlcmdyZWVu
X2NzX2hhbmRsZV9yZWcnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jOjE3
NTc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ3AnIG5vdCBkZXNjcmli
ZWQgaW4gJ2V2ZXJncmVlbl9pc19zYWZlX3JlZycKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZl
cmdyZWVuX2NzLmM6MTc1Nzogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAncGFy
c2VyJyBkZXNjcmlwdGlvbiBpbiAnZXZlcmdyZWVuX2lzX3NhZmVfcmVnJwoKQ2M6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2ln
bmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZl
cmdyZWVuX2NzLmMKaW5kZXggYzQxMGNhZDI4ZjE5Zi4uNTNiNzVjZjIwMTk1OCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3MuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jCkBAIC0xMDE1LDcgKzEwMTUsNyBAQCBzdGF0aWMg
aW50IGV2ZXJncmVlbl9jc190cmFja19jaGVjayhzdHJ1Y3QgcmFkZW9uX2NzX3BhcnNlciAqcCkK
IAogLyoqCiAgKiBldmVyZ3JlZW5fY3NfcGFja2V0X3BhcnNlX3ZsaW5lKCkgLSBwYXJzZSB1c2Vy
c3BhY2UgVkxJTkUgcGFja2V0Ci0gKiBAcGFyc2VyOgkJcGFyc2VyIHN0cnVjdHVyZSBob2xkaW5n
IHBhcnNpbmcgY29udGV4dC4KKyAqIEBwOgkJcGFyc2VyIHN0cnVjdHVyZSBob2xkaW5nIHBhcnNp
bmcgY29udGV4dC4KICAqCiAgKiBUaGlzIGlzIGFuIEV2ZXJncmVlbigrKS1zcGVjaWZpYyBmdW5j
dGlvbiBmb3IgcGFyc2luZyBWTElORSBwYWNrZXRzLgogICogUmVhbCB3b3JrIGlzIGRvbmUgYnkg
cjYwMF9jc19jb21tb25fdmxpbmVfcGFyc2UgZnVuY3Rpb24uCkBAIC0xMDg3LDcgKzEwODcsNyBA
QCBzdGF0aWMgaW50IGV2ZXJncmVlbl9jc19wYXJzZV9wYWNrZXQwKHN0cnVjdCByYWRlb25fY3Nf
cGFyc2VyICpwLAogCiAvKioKICAqIGV2ZXJncmVlbl9jc19oYW5kbGVfcmVnKCkgLSBwcm9jZXNz
IHJlZ2lzdGVycyB0aGF0IG5lZWQgc3BlY2lhbCBoYW5kbGluZy4KLSAqIEBwYXJzZXI6IHBhcnNl
ciBzdHJ1Y3R1cmUgaG9sZGluZyBwYXJzaW5nIGNvbnRleHQKKyAqIEBwOiBwYXJzZXIgc3RydWN0
dXJlIGhvbGRpbmcgcGFyc2luZyBjb250ZXh0CiAgKiBAcmVnOiByZWdpc3RlciB3ZSBhcmUgdGVz
dGluZwogICogQGlkeDogaW5kZXggaW50byB0aGUgY3MgYnVmZmVyCiAgKi8KQEAgLTE3NDcsNyAr
MTc0Nyw3IEBAIHN0YXRpYyBpbnQgZXZlcmdyZWVuX2NzX2hhbmRsZV9yZWcoc3RydWN0IHJhZGVv
bl9jc19wYXJzZXIgKnAsIHUzMiByZWcsIHUzMiBpZHgpCiAKIC8qKgogICogZXZlcmdyZWVuX2lz
X3NhZmVfcmVnKCkgLSBjaGVjayBpZiByZWdpc3RlciBpcyBhdXRob3JpemVkIG9yIG5vdAotICog
QHBhcnNlcjogcGFyc2VyIHN0cnVjdHVyZSBob2xkaW5nIHBhcnNpbmcgY29udGV4dAorICogQHA6
IHBhcnNlciBzdHJ1Y3R1cmUgaG9sZGluZyBwYXJzaW5nIGNvbnRleHQKICAqIEByZWc6IHJlZ2lz
dGVyIHdlIGFyZSB0ZXN0aW5nCiAgKgogICogVGhpcyBmdW5jdGlvbiB3aWxsIHRlc3QgYWdhaW5z
dCByZWdfc2FmZV9ibSBhbmQgcmV0dXJuIHRydWUKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
