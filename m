Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E558946AA2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F12895B9;
	Fri, 14 Jun 2019 20:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CFD894DE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so3058767edo.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09V0MjekpLdHC852h4xPIU9vdb05vowz3v43PyqT5EE=;
 b=fUDB4Ki9U4lY0+1RGG6n9r1L3YaSSNbC8ulhjf/Wd7Qa34eH/isEcpQEcDpuxxhVjR
 828gsy5F9d7WYB83Sy7GyMjMd2a+yECGZI9ypQ51g3BhcSpVGA+cu8FbWblZE2IlOC7X
 9HwpzszLR1YN4XhpUwl6dqwsStPA5A5W30n3UbDqndaerSsP7wXcYvK5uR8v6vkTgBDJ
 CkJl5Xw7pkbwXD2E0jsB3ydDK0ZsCm0snXpAPPnDlAN6J0qzRiuMBn9MnqBzJ2x2vlb/
 I5bKJtE4WeaAEyMIe7KsUVFQVqmW9IkUDglK347GYiR7rMKX+oP724i3uIAuAAZlzhhu
 tb8A==
X-Gm-Message-State: APjAAAW5VFjc1lfZlH5z0YxRZ4AB7k5VsSFLymQn5iD01mYFp/JI1ToZ
 UQ7kge1/FviXRV74YIGSisHP6/XfmNI=
X-Google-Smtp-Source: APXvYqwsNY02FEfQHlqC+BZ6/bDUcOQBorUnJqWM1mr37hzvg/htxDkdTS91HtG3+fbjnKiW4M7RZw==
X-Received: by 2002:a50:8be8:: with SMTP id n37mr82216648edn.216.1560544625875; 
 Fri, 14 Jun 2019 13:37:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 38/59] drm/xen: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:54 +0200
Message-Id: <20190614203615.12639-39-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=09V0MjekpLdHC852h4xPIU9vdb05vowz3v43PyqT5EE=;
 b=VYxfPxU3oxDnY3fO4EnZ5Z9V4K4fVsbdhYnR95Dk4yfQaSMGl1kLydyk/qu00S6Cwi
 5zEnobT1sJlWyjN0YG/38g77W/YvcXrqFGP7y8msd2MrdY/Y9qqBTOGoS2b4VeBnkkjk
 9IA4tSgO/NfNyyrNATIY0094hdnyMYG4GlbrU=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9k
cm1fZnJvbnQuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKaW5kZXggYWVmZmVjODJhNWNlLi4wNTE4MjJlZTViMzYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCkBAIC00OTEsOCArNDkxLDYgQEAgc3Rh
dGljIHN0cnVjdCBkcm1fZHJpdmVyIHhlbl9kcm1fZHJpdmVyID0gewogCS5nZW1fZnJlZV9vYmpl
Y3RfdW5sb2NrZWQgID0geGVuX2RybV9kcnZfZnJlZV9vYmplY3RfdW5sb2NrZWQsCiAJLnByaW1l
X2hhbmRsZV90b19mZCAgICAgICAgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJp
bWVfZmRfdG9faGFuZGxlICAgICAgICA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAotCS5n
ZW1fcHJpbWVfaW1wb3J0ICAgICAgICAgID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCi0JLmdlbV9w
cmltZV9leHBvcnQgICAgICAgICAgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKIAkuZ2VtX3ByaW1l
X2ltcG9ydF9zZ190YWJsZSA9IHhlbl9kcm1fZnJvbnRfZ2VtX2ltcG9ydF9zZ190YWJsZSwKIAku
Z2VtX3ByaW1lX2dldF9zZ190YWJsZSAgICA9IHhlbl9kcm1fZnJvbnRfZ2VtX2dldF9zZ190YWJs
ZSwKIAkuZ2VtX3ByaW1lX3ZtYXAgICAgICAgICAgICA9IHhlbl9kcm1fZnJvbnRfZ2VtX3ByaW1l
X3ZtYXAsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
