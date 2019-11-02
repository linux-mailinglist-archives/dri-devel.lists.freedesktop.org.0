Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B9ED021
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 18:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649E86E4EC;
	Sat,  2 Nov 2019 17:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6376E4EC;
 Sat,  2 Nov 2019 17:56:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id m17so3275037wmi.5;
 Sat, 02 Nov 2019 10:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
 b=HRsHfYkIIJl1W2fu+VZ9twOupEGQt0Yo+EdUYvFlo0ExpPvX2cniR4FHCWD05h1p5l
 YNDZXkevmixIXTYWd/6jr0EoDuWSdDHo23wMCqgW0zEfMMC8zEDjjG1hkDdkTNN15yIN
 +BDYFpCv38Nhlmx4Q/VMvr2swCFRm1K2vT0cWbgCAsxUMZMvXEm/XHq9mGAC1yI0Wtmy
 wbqESGxJ9YAQMCrG2lKcY7nO8ZUW3htxWh1du51jb3LsVM1/Mx2dIw9q/XEpcfTaokxl
 lkvBcszChijp4jMSDSbSqjhyEq99pAR4Wv+NLsBOEcX4N/NiXjPzQDCBuqeQslcP09TO
 Ue+Q==
X-Gm-Message-State: APjAAAURzLFrBzsfeVJ3i4jUt5NGqgAYg+K3sZRQ82YFfI+mn+baRsGA
 OE9bhnDBGmzRK0uFmdTkSuI=
X-Google-Smtp-Source: APXvYqyS7+gBjnA3J0Ipl+n3F4+f2+CSBvOI/VkWKB6mZCfhDy76c/tr0ezPCPCD4eQtO1Cds5+7Rw==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr16105671wmd.48.1572717411603; 
 Sat, 02 Nov 2019 10:56:51 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id u1sm8614139wrp.56.2019.11.02.10.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2019 10:56:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 5/9] drm/nouveau: tegra: Avoid pulsing reset twice
Date: Sat,  2 Nov 2019 18:56:33 +0100
Message-Id: <20191102175637.3065-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPyrNYuh+D9sdc90p8MGbT53BzBTuJgc562Xscp47+M=;
 b=nP2SGINI4Ur/eHW/lspNtR35xdwGU7jvbgoMCmGYHbG8Pf1PrfIk9Y0NDM6F85H7Fv
 sZZZ0s/ojJj4ZbV79PnHQHspwJMQ5Ee7/HWruEjifAUdh3OxVaoedI4loPy+m8uYUlBz
 49Sv69d5FDwE2LGgjDSqAW+UoahBppg/LHNrovn3wVJiNIhtvSnFF4RVqoM2apOP/l6y
 WYRJMLzsx8B52UTxPys49YFNpglgtIW6Du0D+zAD4akodfQ7iy6W9r8v+zfyMyMcHBWL
 Co++vpyUFGjVUAwiSzCRM6ETL1ub638Wz//133ii8rWFxsJp3nZnYqlqwhAzqJrbwONB
 vpHw==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoZW4gdGhlIEdQVSBw
b3dlcmdhdGUgaXMgY29udHJvbGxlZCBieSBhIGdlbmVyaWMgcG93ZXIgZG9tYWluIHByb3ZpZGVy
LAp0aGUgcmVzZXQgd2lsbCBhdXRvbWF0aWNhbGx5IGJlIGFzc2VydGVkIGFuZCBkZWFzc2VydGVk
IGFzIHBhcnQgb2YgdGhlCnBvd2VyLXVuZ2F0aW5nIHByb2NlZHVyZS4KCk9uIHNvbWUgSmV0c29u
IFRYMiBib2FyZHMsIGRvaW5nIGFuIGFkZGl0aW9uYWwgYXNzZXJ0IGFuZCBkZWFzc2VydCBvZgp0
aGUgR1BVIG91dHNpZGUgb2YgdGhlIHBvd2VyLXVuZ2F0ZSBwcm9jZWR1cmUgY2FuIGNhdXNlIHRo
ZSBHUFUgdG8gZ28KaW50byBhIGJhZCBzdGF0ZSB3aGVyZSB0aGUgbWVtb3J5IGludGVyZmFjZSBj
YW4gbm8gbG9uZ2VyIGFjY2VzcyBzeXN0ZW0KbWVtb3J5LgoKU2lnbmVkLW9mZi1ieTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2RldmljZS90ZWdyYS5jCmluZGV4IDBlMzcyYTE5
MGQzZi4uNzQ3YTc3NTEyMWNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmttL2VuZ2luZS9kZXZpY2UvdGVncmEuYwpAQCAtNTIsMTggKzUyLDE4IEBAIG52a21fZGV2aWNl
X3RlZ3JhX3Bvd2VyX3VwKHN0cnVjdCBudmttX2RldmljZV90ZWdyYSAqdGRldikKIAljbGtfc2V0
X3JhdGUodGRldi0+Y2xrX3B3ciwgMjA0MDAwMDAwKTsKIAl1ZGVsYXkoMTApOwogCi0JcmVzZXRf
Y29udHJvbF9hc3NlcnQodGRldi0+cnN0KTsKLQl1ZGVsYXkoMTApOwotCiAJaWYgKCF0ZGV2LT5w
ZGV2LT5kZXYucG1fZG9tYWluKSB7CisJCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KHRkZXYtPnJzdCk7
CisJCXVkZWxheSgxMCk7CisKIAkJcmV0ID0gdGVncmFfcG93ZXJnYXRlX3JlbW92ZV9jbGFtcGlu
ZyhURUdSQV9QT1dFUkdBVEVfM0QpOwogCQlpZiAocmV0KQogCQkJZ290byBlcnJfY2xhbXA7CiAJ
CXVkZWxheSgxMCk7Ci0JfQogCi0JcmVzZXRfY29udHJvbF9kZWFzc2VydCh0ZGV2LT5yc3QpOwot
CXVkZWxheSgxMCk7CisJCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQodGRldi0+cnN0KTsKKwkJdWRl
bGF5KDEwKTsKKwl9CiAKIAlyZXR1cm4gMDsKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
