Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B56EDAE14
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 15:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F1A6EA88;
	Thu, 17 Oct 2019 13:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1283B6EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:18:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r3so2325676wrj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 06:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=cnpSCcayXdtfAHtCUFMXrFZL6KEYCeuqv7WiBW7eAsk=;
 b=AyxM9UL58S2Ckn7gd9aGYK49cAhDRVMtuxZjmxyGvb7ng+IU+DdqAhY/0ne+ngiHX6
 9hmE4LOrM4EAXdNisjvkN1apQBw4qQU4fxcjNbEIJdeIUKCPgI3JoTcnfhTwsaehheo6
 Uu9dKAL9g9sm91i+RwbGS/wkb5dMdO3hPxnPhvF5SpkJ6oBVbfCJCLjz+ac4La9+BTr1
 GHuRGXrV4SBOVCxb+zIqQxK4QdkG2OzUwlOUTkhu6QGkfF4QZFfViBwLGoyMD9qGHyR7
 /I8KI2MUr+P6ZyyonU1kUMgi7b0UM41d+N71CacSaxDlw1dQCIjJMfE+QAe5Z9UrHreY
 P9jw==
X-Gm-Message-State: APjAAAVs3Uc3GltLmqrjRy5LV4HuPw/7Brd1LImUHwotBgJ07MxmR8Tp
 5opI1PWSw84zS6eczgFyTxFdpQ==
X-Google-Smtp-Source: APXvYqzax72zGGa/8GfFC/1gUgf3ogq64ZV1WMrPeMkHHIDDZZ+s8cVAxrVHqoWuoadFrZkVC0N7aw==
X-Received: by 2002:a5d:65c1:: with SMTP id e1mr3027610wrw.364.1571318284604; 
 Thu, 17 Oct 2019 06:18:04 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id r7sm2121756wrt.28.2019.10.17.06.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:18:03 -0700 (PDT)
Date: Thu, 17 Oct 2019 14:18:02 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: configure pwm only once per backlight
 toggle
Message-ID: <20191017131802.defwuzrgq4ai4mud@holly.lan>
References: <20191017081059.31761-1-u.kleine-koenig@pengutronix.de>
 <20191017114727.fy5tg2kgi6mr2sei@holly.lan>
 <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017121945.cmcvaffmbd7zydrm@pengutronix.de>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=cnpSCcayXdtfAHtCUFMXrFZL6KEYCeuqv7WiBW7eAsk=;
 b=R8MAXqGEPp4uF8Ou/83nAFN3Z+rasG/Zv/HjWepBgZNdfqXiwwQ5UQDGiqbcO28QYk
 8qlUZSuXj7HloTdE2+peaEoQo2qddUW4CMJGYiqM7Ue5jlt33HrXfrHDAuwkPcZ0Qb/u
 1ixypQtbH1IGYkIJN16QxC/Eh8XFjnJ4WcPCJhD/fS4b31i5W0WGtSQhl4Q7uJ59+/s3
 3QtvjmbG/1QDu/pBg7LIX+CSdYjbCaqWIAwF3DNww9C3tblosaj/nGtxT3fL1tdbOHTP
 Y87kVKjXEF7l/qZsJKTIF+56bewNUaqAvCam4ita0nZ5KwXOm4P4pcPNZZCAJnQI7Eiw
 HOYw==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Jingoo Han <jingoohan1@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDI6MTk6NDVQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTI6NDc6MjdQTSArMDEwMCwgRGFu
aWVsIFRob21wc29uIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTA6MTA6NTlB
TSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiA+IEEgcHJldmlvdXMgY2hhbmdl
IGluIHRoZSBwd20gY29yZSAobmFtZWx5IDAxY2NmOTAzZWRkNiAoInB3bTogTGV0Cj4gPiA+IHB3
bV9nZXRfc3RhdGUoKSByZXR1cm4gdGhlIGxhc3QgaW1wbGVtZW50ZWQgc3RhdGUiKSkgY2hhbmdl
ZCB0aGUKPiA+ID4gc2VtYW50aWMgb2YgcHdtX2dldF9zdGF0ZSgpIGFuZCBkaXNjbG9zZWQgYW4g
KGFzIGl0IHNlZW1zKSBjb21tb24KPiA+ID4gcHJvYmxlbSBpbiBsb3dsZXZlbCBQV00gZHJpdmVy
cy4gQnkgbm90IHJlbHlpbmcgb24gdGhlIHBlcmlvZCBhbmQgZHV0eQo+ID4gPiBjeWNsZSBiZWlu
ZyByZXRyaWV2YWJsZSBmcm9tIGEgZGlzYWJsZWQgUFdNIHRoaXMgdHlwZSBvZiBwcm9ibGVtIGlz
Cj4gPiA+IHdvcmtlZCBhcm91bmQuCj4gPiA+IAo+ID4gPiBBcGFydCBmcm9tIHRoaXMgaXNzdWUg
b25seSBjYWxsaW5nIHRoZSBwd21fZ2V0X3N0YXRlL3B3bV9hcHBseV9zdGF0ZQo+ID4gPiBjb21i
byBvbmNlIGlzIGFsc28gbW9yZSBlZmZlY3RpdmUuCj4gPiAKPiA+IEknbSBvbmx5IGludGVyZXN0
ZWQgaW4gdGhlIHNlY29uZCBwYXJhZ3JhcGggaGVyZS4KPiA+IAo+ID4gVGhlcmUgc2VlbXMgdG8g
YmUgYSByZWFzb25hYmxlIGNvbnNlbnN1cyB0aGF0IHRoZSBpLk1YMjcgYW5kIGNyb3MtZWMKPiA+
IFBXTSBkcml2ZXJzIHNob3VsZCBiZSBmaXhlZCBmb3IgdGhlIGJlbmVmaXQgb2Ygb3RoZXIgUFdN
IGNsaWVudHMuCj4gPiBTbyB3ZSBtYWtlIHRoaXMgY2hhbmdlIGJlY2F1c2UgaXQgbWFrZXMgdGhl
IHB3bS1ibCBiZXR0ZXIuLi4gbm90IHRvCj4gPiB3b3JrIGFyb3VuZCBidWdzIDstKS4KPiAKPiBU
aGF0J3MgZmluZSwgc3RpbGwgSSB0aGluayBpdCdzIGZhaXIgdG8gZXhwbGFpbiB0aGUgbW90aXZh
dGlvbiBvZgo+IGNyZWF0aW5nIHRoaXMgcGF0Y2guCgpNYXliZS4KCldoZXRoZXIgdGhpcyBwYXRj
aCBpcyBhIHdvcmthcm91bmQgb3Igc2ltcGx5IGFuIGltcHJvdmVtZW50IHRvIHB3bS1ibApkb2Vz
IG5lZWQgdG8gYmUgY2xlYXIgc2luY2UgaXQgYWZmZWN0cyB3aGV0aGVyIExlZSBzdGVlcnMgaXQg
dG93YXJkcwp2NS40LXJjWCBvciBsaW51eC1uZXh0IC4KCgpEYW5pZWwuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
