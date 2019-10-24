Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52208E38AE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAE46E4B0;
	Thu, 24 Oct 2019 16:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E73B6E4BA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g24so3592884wmh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v7sIBy+NeFxNLTjK62J325/VvVdEVUMB1reiPu3pIc8=;
 b=ShH6gxUNIMVXwrw5awm7XMbMTlx8GFLuNBnqZwCLOIU/nmqdmE76iJwjZmZvngVRsL
 vmpWhWLD+uSJjInS9dLetAANbBU5h/LwX22EsKvFZJBUb7ERY/18n1tnrYQZCDpDa7ps
 PEree52n5A+Jxh8+flD0tsF2BHSbLQQaO8fkPsxbBfT4ggZoaQR/8uIE3vfqBoktOjTF
 IOLriEd3/6OZ2wwfHoYJw9Vbm7ubFRSA+Q0JUQLHw23XZUHk4ULhNYA+M5tr9fDo0Fu9
 2/ImEUeN7aDBt4iJ7twFc2c0AYRVZr4+BMV8wzDzhGF5gsx+R4/zRsve0qJmfzIdNJHR
 Q7Tg==
X-Gm-Message-State: APjAAAXHeaQ+vk2UG0k0Y79Pa20vSVAyGQqUeYwNwV072KzUDRnnG5iI
 6gQcjizcwyK3encwwXnPzY8=
X-Google-Smtp-Source: APXvYqzNMQfQSe21eo66v5s9QJVWKaQWzPmmQo+HbPGXpXR1lqS8E7bqjTx+spu0jHtb5iCHVx5TQQ==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr6063460wma.81.1571935565957; 
 Thu, 24 Oct 2019 09:46:05 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id r3sm42193380wre.29.2019.10.24.09.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:05 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 13/32] drm/tegra: dp: Enable alternate scrambler reset when
 supported
Date: Thu, 24 Oct 2019 18:45:15 +0200
Message-Id: <20191024164534.132764-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v7sIBy+NeFxNLTjK62J325/VvVdEVUMB1reiPu3pIc8=;
 b=h2AkK8Fk42hDKnysvCBeOGI1jEnFs/G/r+XJcTwS4ymT5ODIFNyQGWEPknw1kx6V1i
 QvibakSkAbdHHpT/L0egKH5XsGcX3ntr5VS6QASDLiVIMdWCu/qyhl3VPTjyxxWlZeqC
 cOq9PCsJoRIxzwcVaEr8zdDrUnLtzWVS6j8cwzry2JAghgu4Mqv195T3aqMefkZXmqOq
 tuXucWEQY6Bu+nxz1OKB7RiMKmlmG1QvfI2QQgnC41DDD0SnD0WyaFqc99T0fe/TVlVR
 GmwRL/ZxJxF70qpNaXSAIoTzag4cTjaKdDo3vvHKZp5iXkdpMtg0l5JksOTvwQi8KN8s
 sTNQ==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBzaW5rIGlz
IGVEUCBhbmQgc3VwcG9ydHMgdGhlIGFsdGVybmF0ZSBzY3JhbWJsZXIgcmVzZXQsIGVuYWJsZQpp
dC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAu
YyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jCmluZGV4IGNhMjg3YjUwZmFkOC4uNjM4MDgx
YjU2OGY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwpAQCAtMjI1LDUgKzIyNSwxMiBAQCBpbnQgZHJtX2RwX2xp
bmtfY29uZmlndXJlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBfbGluayAq
bGluaykKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAorCWlmIChsaW5rLT5jYXBzLmFs
dGVybmF0ZV9zY3JhbWJsZXJfcmVzZXQpIHsKKwkJZXJyID0gZHJtX2RwX2RwY2Rfd3JpdGViKGF1
eCwgRFBfRURQX0NPTkZJR1VSQVRJT05fU0VULAorCQkJCQkgRFBfQUxURVJOQVRFX1NDUkFNQkxF
Ul9SRVNFVF9FTkFCTEUpOworCQlpZiAoZXJyIDwgMCkKKwkJCXJldHVybiBlcnI7CisJfQorCiAJ
cmV0dXJuIDA7CiB9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
