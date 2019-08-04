Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8387180C69
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 22:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1611F89E50;
	Sun,  4 Aug 2019 20:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1D89E50
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 20:17:26 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id x3so56459729lfc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 13:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s4/lZRelptHc104CnII3uRWlwirvAGTIUK7NUlarcVo=;
 b=jSjAVeElKiuOqMgHld4CDAl1Oz9CloKVvV3Ng+49kNeRCOfdQqaVRk0Z3z5L4bF8zL
 7foOLKa/7Vp8kDkxQc0h64/OJf1uvg38NNjqHw8Olrw3XFCKGmQapasOMVft+FUt9S+D
 nLuGYbmKrWUuch3weA2bCxaQSeixmjBvczY8iTGygSyt61eeFNr0FvQ503iRWgSuc7Fo
 rrAdx/yTtvdF9ngcsbjxK+FFEDNkq8oeT2bc27EKXFgqaJ6ax/5UC1NOw4xpT2e31a+o
 Ws32HzPGnuVGZLYPcy8fwPLxTpYkZ+vP/1gb/k8xoxHFrOe4FkM5fKFmAn+SUOkd9BFm
 51hQ==
X-Gm-Message-State: APjAAAX0a/Uu4S5Nyzl84bFeecr9kZIV+glgufNEFBa/MQ71fXoabMXu
 nLfrkdRd6mcmTmxPz0pooamcNs8i2+Wcig==
X-Google-Smtp-Source: APXvYqxkQf3a/qXtHlYJbVGarQ0L/TPLy9TUhSmBsSYBja6fNZHhdSSpkgaaQyEfjze7v8D/ne+SQQ==
X-Received: by 2002:a19:6d02:: with SMTP id i2mr4308705lfc.191.1564949844127; 
 Sun, 04 Aug 2019 13:17:24 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 p87sm16540794ljp.50.2019.08.04.13.17.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 13:17:23 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 08/16] drm/sti: fix opencoded use of drm_panel_*
Date: Sun,  4 Aug 2019 22:16:29 +0200
Message-Id: <20190804201637.1240-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4/lZRelptHc104CnII3uRWlwirvAGTIUK7NUlarcVo=;
 b=hWmKbfmQQIVJxZRPfrherAkt3SNEI7zhPoih2CPXgPp9jEQCRH+yG/dl/c4qYD3qd5
 BQI3l70sYIQvQDJ9NIAS65Ozt5RyiuzKOYLtizitbR4GCGx+pB+ZedWJqT2vpMYOCLTp
 B5ECOtlrzZvDWx8KKENhQ9ldmy5PzoDHXyDkM7hz673pvh90w4XxURDWocdf0c8Y137Z
 SALN0A2sGAt6p2c2hcNPXagGlykyVJPMLdz2sy5ITY0lYhMstc5IOEAz5RiiBgYmiBvA
 10rXPPBW/fAA2pN/XyW63cSzbrBUTCCPu9UWF0Xyu2c4EqeaYded+97H70L3wbNH98Wb
 2yyw==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Kukjin Kim <kgene@kernel.org>,
 Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Alison Wang <alison.wang@nxp.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Shawn Guo <shawnguo@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBkcm1fcGFuZWxfKGVuYWJsZXxkaXNhYmxlfGdldF9tb2RlcykgZnVuY3Rpb25zLgoK
U2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpDYzogQmVuamFt
aW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+CkNjOiBWaW5jZW50IEFi
cmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2R2by5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYyBi
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jCmluZGV4IDllNmQ1ZDhiNzAzMC4uZTU1ODcw
MTkwYmY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kdm8uYwpAQCAtMjIxLDggKzIyMSw3IEBAIHN0YXRpYyB2
b2lkIHN0aV9kdm9fZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCiAJd3JpdGVs
KDB4MDAwMDAwMDAsIGR2by0+cmVncyArIERWT19ET0ZfQ0ZHKTsKIAotCWlmIChkdm8tPnBhbmVs
KQotCQlkdm8tPnBhbmVsLT5mdW5jcy0+ZGlzYWJsZShkdm8tPnBhbmVsKTsKKwlkcm1fcGFuZWxf
ZGlzYWJsZShkdm8tPnBhbmVsKTsKIAogCS8qIERpc2FibGUvdW5wcmVwYXJlIGR2byBjbG9jayAq
LwogCWNsa19kaXNhYmxlX3VucHJlcGFyZShkdm8tPmNsa19waXgpOwpAQCAtMjYyLDggKzI2MSw3
IEBAIHN0YXRpYyB2b2lkIHN0aV9kdm9fcHJlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlKQogCWlmIChjbGtfcHJlcGFyZV9lbmFibGUoZHZvLT5jbGspKQogCQlEUk1fRVJST1IoIkZh
aWxlZCB0byBwcmVwYXJlL2VuYWJsZSBkdm8gY2xrXG4iKTsKIAotCWlmIChkdm8tPnBhbmVsKQot
CQlkdm8tPnBhbmVsLT5mdW5jcy0+ZW5hYmxlKGR2by0+cGFuZWwpOworCWRybV9wYW5lbF9lbmFi
bGUoZHZvLT5wYW5lbCk7CiAKIAkvKiBTZXQgTFVUICovCiAJd3JpdGVsKGNvbmZpZy0+bG93Ynl0
ZSwgIGR2by0+cmVncyArIERWT19MVVRfUFJPR19MT1cpOwpAQCAtMzQwLDcgKzMzOCw3IEBAIHN0
YXRpYyBpbnQgc3RpX2R2b19jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCiAJc3RydWN0IHN0aV9kdm8gKmR2byA9IGR2b19jb25uZWN0b3ItPmR2bzsK
IAogCWlmIChkdm8tPnBhbmVsKQotCQlyZXR1cm4gZHZvLT5wYW5lbC0+ZnVuY3MtPmdldF9tb2Rl
cyhkdm8tPnBhbmVsKTsKKwkJcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMoZHZvLT5wYW5lbCk7
CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
