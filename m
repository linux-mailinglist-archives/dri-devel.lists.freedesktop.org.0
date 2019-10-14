Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F064D5C66
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 09:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B1E6E11D;
	Mon, 14 Oct 2019 07:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDFE6E11D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:27:49 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y19so18378202wrd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 00:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Q5BHsZHxaQuBnsC0n/rsVoiaHAm2VXfTTXiC030BJgs=;
 b=dHmBn/QkrbZaupyalXCQGOIFwnqMo75x9+sycB3X7QxLP5KZ9rnwxUpvspF14Ah1zM
 zs9O0hz6dU9NB84DR5PMNuF9wLbkdWtGJFrHZetIEMja8zbsae7ITpNaNJEEfffRqgSp
 bHJm6e1jaVnms3iRAoArCbUYZtiiZXw7GdrG/pQXdOviSmayissjTkwev6IW8KPJUogb
 wAGLSxfwtVxH8xwi3U2FR4a6MEufHlbHFLj17JuxepjqbYv7b7ytmzrHksgk03I41c2W
 6kX+UKc1Gsw87My+B93/I7I5JHhc0/ySQYV6IMmI/AumnnWEJBUd7lC3jPfpPM9a9OAA
 fOGg==
X-Gm-Message-State: APjAAAUZZH3E5he/aWa0kGSwou1fYEMeYAe1SRDQ0+xqLs1RB90H/Nl1
 /+aFqKa5dmyuQznPe1XLwQdIww==
X-Google-Smtp-Source: APXvYqwDm2Pu3gF5wLWhDaqvm22UpUh6vWq/BlOq37ZQHR6R8Ub8u3VH4fE0xrIa7I5M58b1ImJhUQ==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr20624080wrv.8.1571038067578; 
 Mon, 14 Oct 2019 00:27:47 -0700 (PDT)
Received: from dell ([2.27.167.11])
 by smtp.gmail.com with ESMTPSA id n3sm7073653wrr.50.2019.10.14.00.27.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Oct 2019 00:27:47 -0700 (PDT)
Date: Mon, 14 Oct 2019 08:27:45 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 4/4] backlight: pwm_bl: switch to power-of-2 base for
 fixed-point math
Message-ID: <20191014072745.GH4545@dell>
References: <20191008120327.24208-1-linux@rasmusvillemoes.dk>
 <20191008120327.24208-5-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008120327.24208-5-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Q5BHsZHxaQuBnsC0n/rsVoiaHAm2VXfTTXiC030BJgs=;
 b=K8uBglN/gYVEhhG9uvD0jxpL+kBC7VMC3W6M/I1GYQtLwoF+9PBzncmew5ihD7lRR/
 TNfGGegf5VdqF1Bz+s6k/sVm2IVvUeOPyQsiHPQ0px5gkz9Rd9s6Pm6s0Rnl8GdvL1pt
 sCt23Tm3/dh+zeCrWdDNF2Mxmt3Ok4iwrRpVu3+vJCEi4yulCnHktAiOkCRJjIFBcq9m
 eKdm5Op2XTuFc4d0ys4Jqpxa6y1uZlSo9BAgkCq7WwhELcX0kF2OB+OB+k7UhSEjrxU+
 QrLa9LQ8Urk0ltRsYf74NGzLUvIPrvWYHhtlZuuLXN7ZVXrtxOxZGzYVJ4z+xf+D/Q6m
 CMQw==
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAwOCBPY3QgMjAxOSwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToKCj4gVXNpbmcgYSBw
b3dlci1vZi0yIGluc3RlYWQgb2YgcG93ZXItb2YtMTAgYmFzZSBtYWtlcyB0aGUgY29tcHV0YXRp
b25zCj4gbXVjaCBjaGVhcGVyLiAyXjE2IGlzIHNhZmU7IHJldHZhbCBuZXZlciBiZWNvbWVzIG1v
cmUgdGhhbiAyXjQ4ICsKPiAyXjMyLzIuIE9uIGEgMzIgYml0IHBsYXRmb3JtLCB0aGUgdmVyeSBl
eHBlbnNpdmUgNjQvMzIgZGl2aXNpb24gYXQgdGhlCj4gZW5kIG9mIGNpZTE5MzEoKSBpbnN0ZWFk
IGJlY29tZXMgZXNzZW50aWFsbHkgZnJlZSAoYSBzaGlmdCBieSAzMiBpcwo+IGp1c3QgYSByZWdp
c3RlciByZW5hbWUpLgo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50
aG9tcHNvbkBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPGxp
bnV4QHJhc211c3ZpbGxlbW9lcy5kaz4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
cHdtX2JsLmMgfCAyMiArKysrKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
