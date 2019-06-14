Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF546AAA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884BB89791;
	Fri, 14 Jun 2019 20:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740A89561
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:58 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so5269539edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBWG1/N0+LvEZ6uCwdhrYMnJvIvD0qmv1VyQaIMwTtA=;
 b=C40R0KnCOojCou7gIEsermdyICG9bAW3wE4cxgKaFR2sTS/7oIzRO6zqNHRiJ5peMJ
 JU7FpYdsjhJ78Nzb0dwONy7hV9IjQT6rk7dQnBNRA9/23cZlQmh1VPtLdMb+X3xLgRp+
 /0irmsBhJhgjjcAZJyV6+hWcAP/0xaqs9cCwfvDgExep7BiEOeixUmui7gKVlhry39RI
 vm3cPGKyw4A76UxHtQKHbWfanaWwQQlRg9EoUT0UPFdioX/4+nvzYwexRiawws0nPKuE
 kKrAzrQuYgIQewkq938B18sVlLfm3ty2C1PdK48Id4c1xImwuX2nnnsMEUjGJEQlRPQT
 9C2A==
X-Gm-Message-State: APjAAAVa/t2nVLeVQ5UBfBHIfngrMu06LmSoU82yzXydobn3tasmwrCH
 P4ugYgVk5Uvvno2fknZTugTz4u217Io=
X-Google-Smtp-Source: APXvYqwPMEc8FYi6lS+722FehIBIdaF7/9dHp0qvNZR0OU0SWpzWu4FMznELavDMjpI6+yK++1DnHw==
X-Received: by 2002:a17:906:2890:: with SMTP id
 o16mr58729664ejd.80.1560544616483; 
 Fri, 14 Jun 2019 13:36:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/59] drm/stm: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:46 +0200
Message-Id: <20190614203615.12639-31-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBWG1/N0+LvEZ6uCwdhrYMnJvIvD0qmv1VyQaIMwTtA=;
 b=MnAT1Ta2fJrQ+MzHqIGw7Shq8DQY0UyfJXcxciD2tMsWXkM/e+djKuILD3xOuf0Uz3
 UiwlDWaJoYEWLwTa5q+H6pfZUOWppMtUjYUczcOj3scDCe6su+59j1Kiq/rPHRe9B2nK
 zkOqwlOWco8m2GkXoVjE8GSKN8dWCnDhizRbs=
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgpDYzogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBl
LmNvcm51QHN0LmNvbT4KQ2M6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBs
aW5hcm8ub3JnPgpDYzogVmluY2VudCBBYnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4KQ2M6
IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KQ2M6IEFsZXhhbmRy
ZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgpDYzogbGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCmluZGV4IDQwMjZjMzNjY2MzOS4uMzMxZjVl
OGQ3NzliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9zdG0vZHJ2LmMKQEAgLTY3LDggKzY3LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1f
ZHJpdmVyIGRydl9kcml2ZXIgPSB7CiAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJp
bWVfZmRfdG9faGFuZGxlLAogCS5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQgPSBkcm1fZ2VtX2Nt
YV9mcmVlX29iamVjdCwKIAkuZ2VtX3ZtX29wcyA9ICZkcm1fZ2VtX2NtYV92bV9vcHMsCi0JLmdl
bV9wcmltZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKLQkuZ2VtX3ByaW1lX2ltcG9y
dCA9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAogCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gZHJt
X2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxl
ID0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfdm1hcCA9
IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
