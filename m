Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D587E38BD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5059B6E51D;
	Thu, 24 Oct 2019 16:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E7D6E4B0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w18so26324238wrt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D2UeHNMAu5Kp/NPx+tAQiEXLV+mubgyLK0Vp0oNiIw4=;
 b=OFxhayJ2OpxbKPMvSYhued0WmKehtRuKdC0WwGLlD4qtVjiFFAgVO/CMPo6VIYXUmm
 m2QUppQvFrRM79ooEfmzP3rgp8zNt44OP9Ycxz7nQfQHgfTIPaog8WJoeY+8wfRak1KY
 nG78eDSDfgMlZUxy1b6srcjf+ROWh7yBCTo/79Xkoq0vcT1jANmnKgXwuchnEy2xgphf
 MU/MtgIsXxMYPFK22ttGpkYHxigfog8fykzy0ZEvabW+xT/Dr6ERRhJXq2i/nMmwX3/5
 USWKPYWgrX8NRGbKnnDqFpnvQALujGDjfQyYOL9aYwWhFiVXr7q0EPOI/q6ckIqjQHz8
 97pQ==
X-Gm-Message-State: APjAAAXBDb8YqeNvqL48xcDGTMgzFc5nAUzZVD16Bd1DyRjWMLVpFQ0+
 N/MaVN/Mx7cfTd0bQEC4rAk=
X-Google-Smtp-Source: APXvYqzGma/6UYiNaI9+S5cw8bjU4PeFSo4H3FYFriV7jsX8/NdZXwin70oGzSbXfI/jbdfyI0l1nQ==
X-Received: by 2002:adf:b219:: with SMTP id u25mr4502900wra.327.1571935589180; 
 Thu, 24 Oct 2019 09:46:29 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id p1sm3659739wmg.11.2019.10.24.09.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 23/32] drm/tegra: sor: Use correct SOR index on Tegra210
Date: Thu, 24 Oct 2019 18:45:25 +0200
Message-Id: <20191024164534.132764-24-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2UeHNMAu5Kp/NPx+tAQiEXLV+mubgyLK0Vp0oNiIw4=;
 b=X9rcVWrs/1mfietCC2Er6ap+BVS2bZF8wpnpbAb+UxfvqyrEPrvT0pmGgLzuLi7iTE
 xL//lYlvsOAnDFOPFrBHZWhNYLo3PF+Wke7ApVj5xqvkVSbAs7DsP6aJ6bOfxWVGa39i
 hOCgIF3R3LiLBZfrJJxnWB1NRTN+akgb5dQZ6EtiyXu6HVOLrk5zFryt46fpcyFjPyk6
 iBjXn6Y0dca9oW+5vgb4g73Jnaf85320gIZ96QScP2k3+CaHdXZTF1xvOHcDPLb7+OZG
 MxloX42KS60/VyYHyCBn3qJ0/P6q9ljEv91y4PRJBqSAlgVC64u97AFyh2ZFsuSI7+aC
 4FEg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBkZXZpY2UgdHJl
ZSBiaW5kaW5ncyBmb3IgdGhlIFRlZ3JhMjEwIFNPUiBkb24ndCByZXF1aXJlIHRoZQpjb250cm9s
bGVyIGluc3RhbmNlIHRvIGJlIGRlZmluZWQsIHNpbmNlIHRoZSBpbnN0YW5jZSBjYW4gYmUgZGVy
aXZlZApmcm9tIHRoZSBjb21wYXRpYmxlIHN0cmluZy4gVGhlIGluZGV4IGlzIG5ldmVyIHVzZWQg
b24gVGVncmEyMTAsIHNvIHdlCmdvdCBhd2F5IHdpdGggaXQgbm90IGdldHRpbmcgc2V0LiBIb3dl
dmVyLCBzdWJzZXF1ZW50IHBhdGNoZXMgd2lsbApjaGFuZ2UgdGhhdCwgc28gbWFrZSBzdXJlIHRo
ZSBwcm9wZXIgaW5kZXggaXMgdXNlZC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0
cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jIHwgNSAr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9zb3IuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwppbmRl
eCA0ZTQ2NTI0ZjIyZTMuLmM3ZmFmMDg4Y2FiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3Nvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYwpAQCAtMzc1OSw2
ICszNzU5LDExIEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3BhcnNlX2R0KHN0cnVjdCB0ZWdyYV9z
b3IgKnNvcikKIAkJICogZWFybGllcgogCQkgKi8KIAkJc29yLT5wYWQgPSBURUdSQV9JT19QQURf
SERNSV9EUDAgKyBzb3ItPmluZGV4OworCX0gZWxzZSB7CisJCWlmIChzb3ItPnNvYy0+c3VwcG9y
dHNfZWRwKQorCQkJc29yLT5pbmRleCA9IDA7CisJCWVsc2UKKwkJCXNvci0+aW5kZXggPSAxOwog
CX0KIAogCWVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KG5wLCAibnZpZGlhLHhiYXIt
Y2ZnIiwgeGJhcl9jZmcsIDUpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
