Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CD37AFC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 19:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA629892C2;
	Thu,  6 Jun 2019 17:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB5C892C2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 17:25:51 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id i189so1902634pfg.10
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 10:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=3LKp2333dAsdHgcKPbSCpFKyWi/YPsxy5d/uBrW1vJw=;
 b=Yg2iQk5nzaGtkRLOh0d8sMPUHu7bOnYMCD70FvMDpMae6p069yw7jDYVOiXnonCzxR
 I8Jo2k0GUbfvefxs7yCEj20ExfdndFNxwqZgmohwpOSYdam1F+P21UHOE9bQ1wgzEEBO
 F2OqEs1W1Z4o/q4gWsS7yAHHbUFMM/+dmVQGriKpeRf4I6rtm10YFhARQkVA8yCkPcLi
 IqEPzPGB+Dl1uyWjwg7uSz3IX9/6iPrxz6eBGxa9NSyWk9d4s+dR62VnvhHXRQhp1kH4
 pUuNcs7D6JAFEhGoMHG2wuiUHMj88zfc29W/pV7BjRunkFKeLAD7g4PEecNmv0PzqD1C
 wgWw==
X-Gm-Message-State: APjAAAUQc21byLl0K5rdz9803apEmrerVrTyKm7waEbuWOaAzJOB1D60
 c0H4g7wb7DsU4wAz/ECW1O5Pew==
X-Google-Smtp-Source: APXvYqwY6ai4KXXEJsOuFBjETzbH/6l5KeGhPhmBm9jpS8OgNIxzeR41NaXMlAcOyAEwxTNJhTZOnQ==
X-Received: by 2002:a63:445b:: with SMTP id t27mr4314682pgk.56.1559841950934; 
 Thu, 06 Jun 2019 10:25:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id t4sm2201097pjq.19.2019.06.06.10.25.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 10:25:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/meson: fix primary plane disabling
In-Reply-To: <20190605141253.24165-2-narmstrong@baylibre.com>
References: <20190605141253.24165-1-narmstrong@baylibre.com>
 <20190605141253.24165-2-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 10:25:49 -0700
Message-ID: <7h8sueeici.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version;
 bh=3LKp2333dAsdHgcKPbSCpFKyWi/YPsxy5d/uBrW1vJw=;
 b=ufbn7N0jryrG0HOBOgiTOLSXC+8CPoOdNvpRg5ioCQ2Qnq3/MrgCcULLU781HRzV/Q
 FyI1xMLATPNfnzoHevVmHhEXmu0Xb3yn/a/9SpyrVKYJmdbTqEyUtphCSQkrcuaaX+p2
 adStH4+ROigx3lYaPqm8G8VWsXfWia6rq8hgPt3dBflYTEzen7o/cT/jlTXf/BHfde5S
 Rvg73ZoiiSSqjn6td0HTTOV6iHyNqYfY9lysMaLD7aAicDH2SlsSwX1J4n1H/vRwl6MB
 VGx72V80nauy5tZgAFakAmBVh8F0Ja4xXvg/+RxALTR++Q0atOThCsvkcv1gNEd/HkWz
 LwNw==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cgo+IFRoZSBw
cmltYXJ5IHBsYW5lIGRpc2FibGUgbG9naWMgaXMgZmxhd2VkLCB3aGVuIHRoZSBwcmltYXJ5IHBs
YW5lIGlzCj4gZGlzYWJsZWQsIGl0IGlzIHJlLWVuYWJsZWQgaW4gdGhlIHZzeW5jIGlycSB3aGVu
IGFub3RoZXIgcGxhbmUgaXMgdXBkYXRlZC4KPgo+IEhhbmRsZSB0aGUgcGxhbmUgZGlzYWJsaW5n
IGNvcnJlY3RseSBieSBoYW5kbGluZyB0aGUgcHJpbWFyeSBwbGFuZQo+IGVuYWJsZSBmbGFnIGlu
IHRoZSBwcmltYXJ5IHBsYW5lIHVwZGF0ZSAmIGRpc2FibGUgY2FsbGJhY2tzLgo+Cj4gRml4ZXM6
IDQ5MGY1MGMxMDlkMSAoImRybS9tZXNvbjogQWRkIEcxMkEgc3VwcG9ydCBmb3IgT1NEMSBQbGFu
ZSIpCj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgoKUmV2aWV3ZWQtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
