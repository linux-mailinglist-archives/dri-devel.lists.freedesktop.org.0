Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E556DEFB0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD846E11D;
	Mon, 21 Oct 2019 14:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CE06E11A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:34:50 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g24so4427946wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46GAsIYP4qs2QOk9IyZbTEBdF4khhbTUFGaQ2NMA/kI=;
 b=iLY3+NMvjH5UI10wNXLAe/lVDP/WkWqnYI5SmEOlmkxUmhEb+5TCdvzEdscUMCFQb7
 I2Z9a3+HQL/3hyuyx1FFJAi/w4G9Wfbvj34tZofduUdKOTAsUBYkAgBocfgRUERdd7ps
 tYVkkTj1OSXsDl0jrUIfsVznhUnvsuhRx2K7nY0IbOplthYREGGrCDpdo3CXH1NH2ilw
 NdkPVQgr6QM8Z27SESyeDx3kc9CCJTVJ2m92EX6BvzBXhwta46mzyoC95h0akwkNmGcx
 6z3Y0neaDm3wbChdWMMwZ8oC1UV6QVsrhoavKNWLvUDPNIVcpdl97bzcvMRLu0ArFaSO
 FXZQ==
X-Gm-Message-State: APjAAAXLJvAz6FbudLzZFv0owcrvXj1N0cpkfWtsMvzMDR0425p3iZjc
 TfHKjtVMTTqvRQ+eHpL3fwk2rWbf
X-Google-Smtp-Source: APXvYqyP2nxeWLGHi1/RM7GKUuYuCc3bo4H/Qygc+AtCH0Ok9lCX8w3cwYNtN24zdiJN80A8/FEY8g==
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr6647578wmd.128.1571668488486; 
 Mon, 21 Oct 2019 07:34:48 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id a5sm15092wrm.78.2019.10.21.07.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/13] drm/dp: Add drm_dp_fast_training_cap() helper
Date: Mon, 21 Oct 2019 16:34:27 +0200
Message-Id: <20191021143437.1477719-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46GAsIYP4qs2QOk9IyZbTEBdF4khhbTUFGaQ2NMA/kI=;
 b=PvwB+m9lr2axSZwb3RtKhrcrLDPn9jSEPtdpaI3B4CmSkfKwphR2CFnMlkAUylQVZs
 MpGz+42GPx8W80YmtCc8JZiFbD3N1OTC+1uwQ1FdbEsXqKOE3XwmTwsEkHZYlsX87Aad
 Qx61JergDdsXPsxuUHvnYYvlU3e1fWik5KcguuHTHDPIvEvg2Sobe8wD21yjGQz0FKak
 2+xrx4d1n6GnufVaegLz1zwuUaznOXvGGdp1h1tqtvPPXcoGjwdLJXZsB0xCix7wMkAC
 2kx2iCnUpoZfqHdFVh9ejct0yWG1YWSVwBLqC1Nk/jU9IWrDjMZ0SKNc3qiMfZ4FhFXL
 KL3g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBhIGhlbHBlciB0
aGF0IGNoZWNrcyBmb3IgdGhlIGZhc3QgdHJhaW5pbmcgY2FwYWJpbGl0eSBnaXZlbiB0aGUgRFBD
RApyZWNlaXZlciBjYXBhYmlsaXRpZXMgYmxvYi4KClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgotLS0KIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCB8IDcgKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCBlMGU3
NmY3NjM0YTkuLjExNzlkM2YyYmE3YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTIxNSw2ICsxMjE1
LDEzIEBAIGRybV9kcF9lbmhhbmNlZF9mcmFtZV9jYXAoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZF
Ul9DQVBfU0laRV0pCiAJCShkcGNkW0RQX01BWF9MQU5FX0NPVU5UXSAmIERQX0VOSEFOQ0VEX0ZS
QU1FX0NBUCk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbAorZHJtX2RwX2Zhc3RfdHJhaW5pbmdf
Y2FwKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQoreworCXJldHVybiBkcGNk
W0RQX0RQQ0RfUkVWXSA+PSAweDExICYmCisJCShkcGNkW0RQX01BWF9ET1dOU1BSRUFEXSAmIERQ
X05PX0FVWF9IQU5EU0hBS0VfTElOS19UUkFJTklORyk7Cit9CisKIHN0YXRpYyBpbmxpbmUgYm9v
bAogZHJtX2RwX3RwczNfc3VwcG9ydGVkKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJ
WkVdKQogewotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
