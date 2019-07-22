Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7208070868
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 20:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D4489DB9;
	Mon, 22 Jul 2019 18:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D33289DB8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:25:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c73so17763988pfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 11:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qfwsnuJ0Fo+yki7MwdfIhdjj83zSVUakcOxDUEqYWuw=;
 b=U3ZsGGrAmgR5uNcY94gJp1OG+14wnBaR6B+K4wrI+JqMAxEtcRdGycBollj8D7eCZv
 XKmTOsuEqCqyVxemWkjnX9IUlBLgFSv4F337UphTTn1639p7P7KjtkjlPgu6fzdXP3RN
 gV1GT5Vmvt0t6btrNuHXNt1NhpFSc+80SA+AXPCY+At63c8Z56p2uPk34keXJiu9fbOI
 rJOI/pWLpd3kmOnJbM64mFVNg5sdzUK3S8+R1TEpD+lnFZOAHv5D22C91KTEj+4C3szS
 mnRqOgmh/pD4AOb8f9Q05MpFwqVfJuHnMcVaTn57JSMcrR9maCJ/9U7miATD6wlblE6j
 UCIg==
X-Gm-Message-State: APjAAAX/eBZ6/zWGaqEft3XqGhkAr1s3z/Ep4MlegE4Yt3WTKTa03yAj
 lBmNunJv6wcmJO2cV63HOwhGdg==
X-Google-Smtp-Source: APXvYqyEp+PIjudMUc2kzpn+Zl2EC+eIJeevs//E8DRu5CFrWzPYRAgF8677H9fM7Q0RWCkvTACSQA==
X-Received: by 2002:a17:90a:23ce:: with SMTP id
 g72mr47354809pje.77.1563819906950; 
 Mon, 22 Jul 2019 11:25:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id a3sm36117683pfl.145.2019.07.22.11.25.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 11:25:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 3/4] drm: panel-lvds: Spout an error if
 of_get_display_timing() gives an error
Date: Mon, 22 Jul 2019 11:24:38 -0700
Message-Id: <20190722182439.44844-4-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
In-Reply-To: <20190722182439.44844-1-dianders@chromium.org>
References: <20190722182439.44844-1-dianders@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qfwsnuJ0Fo+yki7MwdfIhdjj83zSVUakcOxDUEqYWuw=;
 b=BMAJB7zCPWaxxlsIZhliKtF/Of3RCfBU19X2PdSfplILj6yScV53dJKd9GpZMW00sX
 21AvgBuU29a+7Tczy51BqeRf390trbirmAtQOeTwHaDaAgO71WXOqgW9qVG4I/0QwhsF
 fHbjC8EReFF044ivDo+ipVHhRsr2EV6EnYpNY=
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIHBhdGNoICgidmlkZW86IG9mOiBkaXNwbGF5X3RpbWluZzogRG9uJ3QgeWVsbCBpZiBu
byB0aW1pbmcgbm9kZQppcyBwcmVzZW50Iikgd2UnbGwgc3RvcCBzcG91dGluZyBhbiBlcnJvciBk
aXJlY3RseSBpbgpvZl9nZXRfZGlzcGxheV90aW1pbmcoKSBpZiBubyBub2RlIGlzIHByZXNlbnQu
ICBQcmVzdW1hYmx5IHBhbmVsLWx2ZHMKc2hvdWxkIHRha2UgY2hhcmdlIG9mIHNwb3V0aW5nIGl0
cyBvd24gZXJyb3Igbm93LgoKTk9URTogd2UnbGwgcHJpbnQgdHdvIGVycm9ycyBpZiB0aGUgbm9k
ZSB3YXMgcHJlc2VudCBidXQgdGhlcmUgd2VyZQpwcm9ibGVtcyBwYXJzaW5nIHRoZSB0aW1pbmcg
bm9kZSAob25lIGluIG9mX3BhcnNlX2Rpc3BsYXlfdGltaW5nKCkgYW5kCnRoaXMgbmV3IG9uZSku
ICBTaW5jZSB0aGlzIGlzIGEgZmF0YWwgZXJyb3IgZm9yIHRoZSBkcml2ZXIncyBwcm9iZQooYW5k
IHByZXN1bWFibHkgc29tZW9uZSB3aWxsIGJlIGRlYnVnZ2luZyksIHRoaXMgc2hvdWxkIGJlIE9L
LgoKU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
PgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jIHwgNSArKysrLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtbHZkcy5jCmluZGV4IDFlYzU3ZDA4MDZhOC4uYWQ0N2NjOTU0NTllIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKQEAgLTE0Nyw4ICsxNDcsMTEgQEAgc3RhdGljIGludCBw
YW5lbF9sdmRzX3BhcnNlX2R0KHN0cnVjdCBwYW5lbF9sdmRzICpsdmRzKQogCWludCByZXQ7CiAK
IAlyZXQgPSBvZl9nZXRfZGlzcGxheV90aW1pbmcobnAsICJwYW5lbC10aW1pbmciLCAmdGltaW5n
KTsKLQlpZiAocmV0IDwgMCkKKwlpZiAocmV0IDwgMCkgeworCQlkZXZfZXJyKGx2ZHMtPmRldiwg
IiVwT0Y6IHByb2JsZW1zIHBhcnNpbmcgcGFuZWwtdGltaW5nICglZClcbiIsCisJCQlucCwgcmV0
KTsKIAkJcmV0dXJuIHJldDsKKwl9CiAKIAl2aWRlb21vZGVfZnJvbV90aW1pbmcoJnRpbWluZywg
Jmx2ZHMtPnZpZGVvX21vZGUpOwogCi0tIAoyLjIyLjAuNjU3Lmc5NjBlOTJkMjRmLWdvb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
