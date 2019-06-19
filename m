Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E564C0AE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 20:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F626E44B;
	Wed, 19 Jun 2019 18:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE266E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 18:19:54 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d17so125289qtj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8gaGsAxBQTelnZZ0SJOq1SzgW7Jm91FjOBQ5oH/bkng=;
 b=R2UtI7uTKxi/ysofb8rTL3N33AXChhez/JDwRki8cRtZcLXyOITBzbfSZmN8nQWNSQ
 FPnR1DAL0TWL3kkJRTMacHPDASTuRvOuKZxEyxBA+9fASzntGnJyddYMMFcNLEibBh5H
 Xfn53gAqiBBaKNTZK1Tc8wYc70DsS1X8p77dfAe2UjyNatVKKnhXo04cCw0uOeq/YPlU
 rlvXBYjelwvrjQEUVUYWMOFJHECFF6vUR2Ivdm5f2xyhurVgeUZYgl5lcEXvh73WCVo2
 AtcXO8VBFnD1fuVpFT3LVkoBjePyeXpklpPZVR7zwd+Mdqt6NmEN2YaUU+2bWXUp6Oyk
 IbMw==
X-Gm-Message-State: APjAAAXBNqlDpnrVBLk40nyX738ktdM5GF4B0DA1nEoD+q0oVMIMvswj
 q+1LLdJTQehnS5taRojjRnmzvkrYSv8=
X-Google-Smtp-Source: APXvYqzo+XJsugt5hB0u6K2mTfSTR3XwF7LvyY97zejuxp7eEMEZ+G6Hf7u9GqwpgcAsC6gPW7mibQ==
X-Received: by 2002:ac8:34f4:: with SMTP id x49mr97190999qtb.95.1560968392921; 
 Wed, 19 Jun 2019 11:19:52 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id m6sm9303963qte.17.2019.06.19.11.19.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 11:19:52 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/self_refresh: Fix possible NULL deref in failure path
Date: Wed, 19 Jun 2019 14:19:47 -0400
Message-Id: <20190619181951.192305-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190619094151.GI18776@kadam>
References: <20190619094151.GI18776@kadam>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8gaGsAxBQTelnZZ0SJOq1SzgW7Jm91FjOBQ5oH/bkng=;
 b=bTvrLwjKX8Q5u6oUL6C43a7jMfzK7cT7R8/DrQheDCjQyKRyxDgQ4cAeDKcozDWKWB
 3o62I/GR3LjOujYbsfe6pCIH6LHAj5e+t8i0QAPjQ9s0GOGUJKxLk2Fbzn6eTTl/vdcf
 AlHm8RaQeLzZgP6RFFfsCO3jnGXyYUnxYKaKqBHOCvQWlqMc5OPJ8Wo2n1cCS2jb86Qs
 hS4IHcvmj0fDy5fLw7jQX4XquRKaA/oOG5FXtdnKnqqY4zmI+fqSfLrdpSps8T/Ai/bQ
 2gewt+wKpq585I/hvcpk2D610j4q+4hoeMP8mG5quxgBaDu/xdlyWUcAg947UOuxCWYf
 DEyg==
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
Cc: Zain Wang <wzz@rock-chips.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, Jose Souza <jose.souza@intel.com>,
 Tomasz Figa <tfiga@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJZiBzdGF0ZSBhbGxvY2F0
aW9uIGZhaWxzLCB3ZSBzdGlsbCB0cnkgdG8gZ2l2ZSBiYWNrIHRoZSByZWZlcmVuY2Ugb24KaXQu
IEFsc28gaW5pdGlhbGl6ZSByZXQgaW4gY2FzZSB0aGUgY3J0YyBpcyBub3QgZW5hYmxlZCBhbmQg
d2UgaGl0IHRoZQplamVjdCBidXR0b24uCgpGaXhlczogMTQ1MmMyNWIwZTYwICgiZHJtOiBBZGQg
aGVscGVycyB0byBraWNrIG9mZiBzZWxmIHJlZnJlc2ggbW9kZSBpbiBkcml2ZXJzIikKQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEpvc2UgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPgpDYzogWmFpbiBXYW5nIDx3enpAcm9jay1jaGlwcy5jb20+CkNjOiBUb21hc3og
RmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
Q2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1
bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1
bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMgfCA2
ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jCmluZGV4IGUwZDJhZDFm
MDcwY2IuLjRiOTQyNGE4ZjFmMWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2Vs
Zl9yZWZyZXNoX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNo
X2hlbHBlci5jCkBAIC02OSwxNCArNjksMTQgQEAgc3RhdGljIHZvaWQgZHJtX3NlbGZfcmVmcmVz
aF9oZWxwZXJfZW50cnlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm47CiAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3Rh
dGU7CiAJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0YXRlOwotCWludCBpLCByZXQ7CisJ
aW50IGksIHJldCA9IDA7CiAKIAlkcm1fbW9kZXNldF9hY3F1aXJlX2luaXQoJmN0eCwgMCk7CiAK
IAlzdGF0ZSA9IGRybV9hdG9taWNfc3RhdGVfYWxsb2MoZGV2KTsKIAlpZiAoIXN0YXRlKSB7CiAJ
CXJldCA9IC1FTk9NRU07Ci0JCWdvdG8gb3V0OworCQlnb3RvIG91dF9kcm9wX2xvY2tzOwogCX0K
IAogcmV0cnk6CkBAIC0xMTYsNiArMTE2LDggQEAgc3RhdGljIHZvaWQgZHJtX3NlbGZfcmVmcmVz
aF9oZWxwZXJfZW50cnlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJfQogCiAJZHJt
X2F0b21pY19zdGF0ZV9wdXQoc3RhdGUpOworCitvdXRfZHJvcF9sb2NrczoKIAlkcm1fbW9kZXNl
dF9kcm9wX2xvY2tzKCZjdHgpOwogCWRybV9tb2Rlc2V0X2FjcXVpcmVfZmluaSgmY3R4KTsKIH0K
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
