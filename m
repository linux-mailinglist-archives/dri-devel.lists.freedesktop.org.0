Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB90F0ED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 09:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F93F89415;
	Tue, 30 Apr 2019 07:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DCA890F4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 20:15:55 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t17so17819814wrw.13
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 13:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vCxinVg6A2SbZ9ILJWHL9gGNmahRdcgdd1xrKNk0P5I=;
 b=cwSDgO2K8O+XFXJ55U8ANKY2D7WkLem1vQK5GGVD8lV59jU0i1NRwxmsI4kKvG9BwA
 qHBRmfPrpoSBnIMIR6CqRDgP3rqVEj7aiPXSUbhfwzBAJ1TNNmbMdNWgIN0h7rurvMDl
 7gC+6d+U6URl4RowYvqnpO8rXP7W1VqWFTtkB0S9BGFKbtyzoxGg/agAT6wXP1+OYXTs
 seclFAkQ9ogQfHACgMC2KpWJzWHbW7Cfm/hMIeUiarqh7tr99MovfRxAXm2SFoC1sqxs
 9Pb+wzLAEc4zTe10vNiekBvJYD0pi3mss0pVO8MDxbdg0ja72lGcpptDZVgxEqbir6CB
 vhDg==
X-Gm-Message-State: APjAAAViCV9DfSd7V/L4Y5xmWErRzOwcg8nlFAI4DtC23WG6OYh5+ofO
 pSN9w6shbbiTaTDes3JSJhP1Fw==
X-Google-Smtp-Source: APXvYqw63jnClhdJcOMmVCX4Q14I5kSfu+qjnhDfPAb2p9j2fIrWdfwp6P5Jp2R5xGLI7EjMZ+WPsA==
X-Received: by 2002:a05:6000:12cb:: with SMTP id
 l11mr703764wrx.89.1556568954590; 
 Mon, 29 Apr 2019 13:15:54 -0700 (PDT)
Received: from localhost.localdomain (ip-93-97.sn2.clouditalia.com.
 [83.211.93.97])
 by smtp.gmail.com with ESMTPSA id k6sm22864019wrd.20.2019.04.29.13.15.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 29 Apr 2019 13:15:53 -0700 (PDT)
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/msm: Fix improper uses of smp_mb__{before,
 after}_atomic()
Date: Mon, 29 Apr 2019 22:14:57 +0200
Message-Id: <1556568902-12464-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556568902-12464-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1556568902-12464-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailman-Approved-At: Tue, 30 Apr 2019 07:09:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vCxinVg6A2SbZ9ILJWHL9gGNmahRdcgdd1xrKNk0P5I=;
 b=l1Fo0n6uuK81vsv4KUn6MAwronVLRTlTPD56VCaSdgU8NGFkVEOa609qnKppM/uCO2
 HRgtrD83lc/5DFL2xOjq3oahOEW1qqD3ehf1gcdxcWCNoazbEXEAR2cf5vf3SeNvIXu8
 xGW9OWHJbo1YhQVyG7oYR8xqAkT/BUsxIeWqo=
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
Cc: Andrea Parri <andrea.parri@amarulasolutions.com>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYmFycmllcnMgb25seSBhcHBseSB0byB0aGUgcmVhZC1tb2RpZnktd3JpdGUgb3BlcmF0
aW9uczsgaW4KcGFydGljdWxhciwgdGhleSBkbyBub3QgYXBwbHkgdG8gdGhlIGF0b21pY19zZXQo
KSBwcmltaXRpdmUuCgpSZXBsYWNlIHRoZSBiYXJyaWVycyB3aXRoIHNtcF9tYigpcy4KCkZpeGVz
OiBiMWZjMjgzOWQyZjkyICgiZHJtL21zbTogSW1wbGVtZW50IHByZWVtcHRpb24gZm9yIEE1WFgg
dGFyZ2V0cyIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJlcG9ydGVkLWJ5OiAiUGF1bCBF
LiBNY0tlbm5leSIgPHBhdWxtY2tAbGludXguaWJtLmNvbT4KUmVwb3J0ZWQtYnk6IFBldGVyIFpp
amxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmVhIFBhcnJp
IDxhbmRyZWEucGFycmlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBSb2IgQ2xhcmsgPHJvYmRj
bGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+CkNjOiBsaW51
eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwotLS0KIGRyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E1eHhfcHJlZW1wdC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2E1eHhfcHJlZW1wdC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTV4eF9wcmVlbXB0LmMKaW5kZXggM2Q2MjMxMGE1MzVmYi4uZWUwODIwZWUwYzY2NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVlbXB0LmMKQEAgLTM5LDEwICszOSwx
MCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3ByZWVtcHRfc3RhdGUoc3RydWN0IGE1eHhfZ3B1
ICpncHUsCiAJICogcHJlZW1wdGlvbiBvciBpbiB0aGUgaW50ZXJydXB0IGhhbmRsZXIgc28gYmFy
cmllcnMgYXJlIG5lZWRlZAogCSAqIGJlZm9yZS4uLgogCSAqLwotCXNtcF9tYl9fYmVmb3JlX2F0
b21pYygpOworCXNtcF9tYigpOwogCWF0b21pY19zZXQoJmdwdS0+cHJlZW1wdF9zdGF0ZSwgbmV3
KTsKIAkvKiAuLi4gYW5kIGFmdGVyKi8KLQlzbXBfbWJfX2FmdGVyX2F0b21pYygpOworCXNtcF9t
YigpOwogfQogCiAvKiBXcml0ZSB0aGUgbW9zdCByZWNlbnQgd3B0ciBmb3IgdGhlIGdpdmVuIHJp
bmcgaW50byB0aGUgaGFyZHdhcmUgKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
