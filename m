Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEAE1E593C
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6968A6E40D;
	Thu, 28 May 2020 07:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D641898CA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:28:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id v63so11447947pfb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PnARTlRhVkBUQkPqC454r4YU05zMHZz2LfM1l53WRb0=;
 b=j/De+h+QmNQ49bidmH96zLrOu2OBXrIIB6Y9QUEalQjZ1catzyle70SRBwOcwMWe+z
 iZIt54zFlbJqY6v33AGBhOtUxRV6Szu1l68EY9j0+rctjO15uFYPrWRUy3ghFb1xW7/H
 abClqYr3/WLdGWazduydiccGKMYgnyX/8lNoQoRJwJbpCE62LWArAo1EIY7SkaA1x3Hy
 nzV7QCUDYFaESm+gzjKIQGUvU0Na2CtsCyVwB+tlMQSf8mPIG7N0fY14a/SFd+dOWhAt
 0otXEMgwfJZ4aADjlvQwy4zZJ3PleE0M9x94oSgoEBNHkCtYi9ZFIcjq5FV59Ysyeooz
 E3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PnARTlRhVkBUQkPqC454r4YU05zMHZz2LfM1l53WRb0=;
 b=iUYXnSg7yLOcXzB02OKxIK5XWRRbE9Cf55O9UVVmG6EOS/cB//mq6N6NgoMENB8yTF
 i9o6f7BtEZCl1GucYZrbYBRgtLn5Yf/v4419pLAAapiVevnMuFnUW8pDGdEMitU6ZQtn
 tNgqkCM0riJpxxVN7bikm7QVnp/6OykBnPWkTbyT8iCssRfCCBjO4rXPRAxbFlTSt0Ml
 mPCLLU1yqrdOKvfP7xBByKtFsikZ5tgPLZmKsJH5mNRlh9G4msqt8skkwS+OKp+0Q8cd
 1Xb/9xxYeTGROSefVdOoO3ecIBSw8M3UI0/NXCA/3rFXwftiyuuzVZMK2bKvxnREeDp5
 aKpQ==
X-Gm-Message-State: AOAM5336nJ2UklR7k5gZkSaOvGSKfswkY0M0sIldmBbmf6tj+nT7oBmr
 JlQSfQwZ7gF7GuTaQWNK+H4=
X-Google-Smtp-Source: ABdhPJx3SUGNW2XD8h8US9uScxTycxVHXeqpLbmx7fMrRID3k4oOipLAcBnlwkA/Q3ap+M2eKxw16w==
X-Received: by 2002:aa7:9ab6:: with SMTP id x22mr2661695pfi.136.1590564486694; 
 Wed, 27 May 2020 00:28:06 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.44])
 by smtp.gmail.com with ESMTPSA id q201sm1371842pfq.40.2020.05.27.00.28.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 May 2020 00:28:06 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, thierry.reding@gmail.com, sam@ravnborg.org,
 airlied@linux.ie, daniel@ffwll.ch, mturquette@baylibre.com,
 sboyd@kernel.org, andy.shevchenko@gmail.com, noralf@tronnes.org,
 linus.walleij@linaro.org, broonie@kernel.org
Subject: [PATCH v6 5/9] clk: stm32: Fix stm32f429's ltdc driver hang in set
 clock rate
Date: Wed, 27 May 2020 15:27:29 +0800
Message-Id: <1590564453-24499-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogZGlsbG9uIG1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+CgpUaGlzIGlzIGR1ZSB0
byBtaXN1c2Ug4oCYUExMX1ZDT19TQUknIGFuZCdQTExfU0FJJyBpbiBjbGstc3RtMzJmNC5jCidQ
TExfU0FJJyBpcyAyLCAnUExMX1ZDT19TQUknIGlzIDcoZGVmaW5lZCBpbgppbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL3N0bTMyZngtY2xvY2suaCkuCgoncG9zdF9kaXYnIHBvaW50IHRvICdwb3N0
X2Rpdl9kYXRhW10nLCAncG9zdF9kaXYtPnBsbF9udW0nCmlzIFBMTF9JMlMgb3IgUExMX1NBSS4K
CidjbGtzW1BMTF9WQ09fU0FJXScgaGFzIHZhbGlkICdzdHJ1Y3QgY2xrX2h3KiAnIHJldHVybgpm
cm9tIHN0bTMyZjRfcmNjX3JlZ2lzdGVyX3BsbCgpIGJ1dCwgYXQgbGluZSAxNzc3IG9mCmRyaXZl
ci9jbGsvY2xrLXN0bTMyZjQuYywgdXNlIHRoZSAnY2xrc1twb3N0X2Rpdi0+cGxsX251bV0nLApl
cXVhbCB0byAnY2xrc1tQTExfU0FJXScsIHRoaXMgaXMgaW52YWxpZCBhcnJheSBtZW1iZXIgYXQg
dGhhdCB0aW1lLgoKRml4ZXM6IDUxNzYzM2VmNjMwZSAoImNsazogc3RtMzJmNDogQWRkIHBvc3Qg
ZGl2aXNvciBmb3IgSTJTICYgU0FJIFBMTHMiKQpTaWduZWQtb2ZmLWJ5OiBkaWxsb24gbWluIDxk
aWxsb24ubWluZmVpQGdtYWlsLmNvbT4KLS0tCgpIaSBTdGVwaGVuIEJveWQsCgpUaGlzIHVwZGF0
ZSBpbmNsdWRlIGJlbG93IGNoYW5nZXMgc2luY2UgVjUKMSBzZXBhcmF0ZSAnW1BBVENIIHY1IDUv
OF0nIHBhdGNoIHRvIHR3byBzdWJtaXRzCjIgZWFjaCBvbmUgaGFzIGEgRml4ZXMgdGFncwoKYmVz
dCByZWdhcmRzLgoKIGRyaXZlcnMvY2xrL2Nsay1zdG0zMmY0LmMgfCA2ICsrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9jbGstc3RtMzJmNC5jIGIvZHJpdmVycy9jbGsvY2xrLXN0bTMyZjQuYwppbmRl
eCAxODExN2NlNWZmODUuLjQyY2EyZGQ4NmFlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvY2xr
LXN0bTMyZjQuYworKysgYi9kcml2ZXJzL2Nsay9jbGstc3RtMzJmNC5jCkBAIC01NTcsMTMgKzU1
NywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19kaXZfdGFibGUgcG9zdF9kaXZyX3RhYmxl
W10gPSB7CiAKICNkZWZpbmUgTUFYX1BPU1RfRElWIDMKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Rt
MzJmNF9wbGxfcG9zdF9kaXZfZGF0YSAgcG9zdF9kaXZfZGF0YVtNQVhfUE9TVF9ESVZdID0gewot
CXsgQ0xLX0kyU1FfUERJViwgUExMX0kyUywgInBsbGkycy1xLWRpdiIsICJwbGxpMnMtcSIsCisJ
eyBDTEtfSTJTUV9QRElWLCBQTExfVkNPX0kyUywgInBsbGkycy1xLWRpdiIsICJwbGxpMnMtcSIs
CiAJCUNMS19TRVRfUkFURV9QQVJFTlQsIFNUTTMyRjRfUkNDX0RDS0NGR1IsIDAsIDUsIDAsIE5V
TEx9LAogCi0JeyBDTEtfU0FJUV9QRElWLCBQTExfU0FJLCAicGxsc2FpLXEtZGl2IiwgInBsbHNh
aS1xIiwKKwl7IENMS19TQUlRX1BESVYsIFBMTF9WQ09fU0FJLCAicGxsc2FpLXEtZGl2IiwgInBs
bHNhaS1xIiwKIAkJQ0xLX1NFVF9SQVRFX1BBUkVOVCwgU1RNMzJGNF9SQ0NfRENLQ0ZHUiwgOCwg
NSwgMCwgTlVMTCB9LAogCi0JeyBOT19JRFgsIFBMTF9TQUksICJwbGxzYWktci1kaXYiLCAicGxs
c2FpLXIiLCBDTEtfU0VUX1JBVEVfUEFSRU5ULAorCXsgTk9fSURYLCBQTExfVkNPX1NBSSwgInBs
bHNhaS1yLWRpdiIsICJwbGxzYWktciIsIENMS19TRVRfUkFURV9QQVJFTlQsCiAJCVNUTTMyRjRf
UkNDX0RDS0NGR1IsIDE2LCAyLCAwLCBwb3N0X2RpdnJfdGFibGUgfSwKIH07CiAKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
