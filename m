Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D5A9CDB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 10:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45BF89E86;
	Thu,  5 Sep 2019 08:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870E989E86
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 08:21:37 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1872F21883
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 08:21:37 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id z67so1246632qkb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 01:21:37 -0700 (PDT)
X-Gm-Message-State: APjAAAX54Lhgiti04om2ztDZvez65CsgSapgStPaQP/EfAY3yzktlfhN
 rfSWqdqFx8pFvCRSCMsgo0bf2J1TaLUyvyJtwQ==
X-Google-Smtp-Source: APXvYqx5ejCkY9fe72OcGmf94BoTFotctm8sKQHs0c+t28xBDY3kO+0s2f5YYDS6tXkOiP1dIpurVvrb/lgdOXWoFBE=
X-Received: by 2002:a37:682:: with SMTP id 124mr1535692qkg.393.1567671696239; 
 Thu, 05 Sep 2019 01:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190904123032.23263-1-broonie@kernel.org>
In-Reply-To: <20190904123032.23263-1-broonie@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Sep 2019 09:21:24 +0100
X-Gmail-Original-Message-ID: <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
Message-ID: <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
To: Mark Brown <broonie@kernel.org>, Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567671697;
 bh=JFwtoixLuRX1yZtp0YeGec+QR58HWNl8zjVOsKByQsM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X5lZboRCCXqovxducQamdVD/sqmML6m7jOMA77uilL9WBg5nVp4sUCvBgD+09ps7S
 0s40DNA4Y+rNusXtaFq3EGGYifdlyzqk9klC3Z1TUO5mRrPZUkdfPGcZVQ1qWsBbVp
 aEVUHI6I/aTrrfo/MV7xyXEwF83JwpbRISFUz8nE=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K1N0ZXZlbgoKT24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxOjMwIFBNIE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgcGFuZnJvc3QgZHJpdmVyIHJlcXVlc3RzIGEg
c3VwcGx5IHVzaW5nIHJlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoKQo+IGJ1dCBib3RoIHRoZSBuYW1l
IG9mIHRoZSBzdXBwbHkgYW5kIHRoZSB1c2FnZSBwYXR0ZXJuIHN1Z2dlc3QgdGhhdCBpdCBpcwo+
IGJlaW5nIHVzZWQgZm9yIHRoZSBtYWluIHBvd2VyIGZvciB0aGUgZGV2aWNlIGFuZCBpcyBub3Qg
YXQgYWxsIG9wdGlvbmFsCj4gZm9yIHRoZSBkZXZpY2UgZm9yIGZ1bmN0aW9uLCB0aGVyZSBpcyBu
byBtZWFuaW5nZnVsIGhhbmRsaW5nIGZvciBhYnNlbnQKPiBzdXBwbGllcy4gIFN1Y2ggcmVndWxh
dG9ycyBzaG91bGQgdXNlIHRoZSB2YW5pbGxhIHJlZ3VsYXRvcl9nZXQoKQo+IGludGVyZmFjZSwg
aXQgd2lsbCBlbnN1cmUgdGhhdCBldmVuIGlmIGEgc3VwcGx5IGlzIG5vdCBkZXNjcmliZWQgaW4g
dGhlCj4gc3lzdGVtIGludGVncmF0aW9uIG9uZSB3aWxsIGJlIHByb3ZpZGVkIGluIHNvZnR3YXJl
LgoKSSBndWVzcyBjb21taXRzIGUyMWRkMjkwODgxYiAoImRybS9wYW5mcm9zdDogRW5hYmxlIGRl
dmZyZXEgdG8gd29yawp3aXRob3V0IHJlZ3VsYXRvciIpIGFuZCBjOTBmMzA4MTJhNzkgKCJkcm0v
cGFuZnJvc3Q6IEFkZCBtaXNzaW5nIGNoZWNrCmZvciBwZmRldi0+cmVndWxhdG9yIikKaW4gLW5l
eHQgc2hvdWxkIGJlIHJldmVydGVkIG9yIHBhcnRpYWxseSByZXZlcnRlZD8KClJvYgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
