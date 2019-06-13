Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7443D87
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 17:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC1689B66;
	Thu, 13 Jun 2019 15:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA6C89B62
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:44:00 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b7so3277251pls.6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 08:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5o6Xk9ScYRxy+DZ0+69hUl5hUqdW0wuATddsUALu0XI=;
 b=OGwOES1ePtg8GXVhYV/nPMTihZHKX6yBpDv9X9wWSJtO2pCCnk5T6sQEAkHihNxI/J
 40kG877XT5W+HhXMjVNPc62b4ggQRk52X/92yzsqO9nA0sZ4RcnbvCmlwRkzZ5gpU9oX
 thyrVjMUw3yHpDKNsB35ykr6m912flr6fsNOPKMoCAtfzyplnxfxpy3L/ykhNT7jhPP2
 uMAlIyqhukDwsc1fKj0CdE5n4S+19PljHDHCxQF20xcZLFMLpoHiQPJzSYcl/VfXUJAS
 tQEtgk3skveEoVGPPosePQFi0AN6dVu5IClItkwTBbL7LP5Hig+ddHHvtSs3wBEovJZ0
 mD/w==
X-Gm-Message-State: APjAAAVMm+YeGPXvRDUYF5cCGFpU4t7YNcqxvtGlIlONJ/beOx/8SOfD
 McVFEG+oTdV3HNXC6n+Mm5843w==
X-Google-Smtp-Source: APXvYqyUWEmrNpFQmfgtHCbIExuUeMkq+BRkR8ZCRXQoaIKlUEIUFqCdlOi/wTKoB6TrOa2pgQk8TQ==
X-Received: by 2002:a17:902:24d:: with SMTP id
 71mr90950845plc.166.1560440640131; 
 Thu, 13 Jun 2019 08:44:00 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id w66sm83713pfb.47.2019.06.13.08.43.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 08:43:59 -0700 (PDT)
Date: Thu, 13 Jun 2019 08:43:57 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] backlight: pwm_bl: Fix heuristic to determine number of
 brightness levels
Message-ID: <20190613154357.GN137143@google.com>
References: <20190612180003.161966-1-mka@chromium.org>
 <fd554750-7ec6-73e1-be3a-5bac0749fa0b@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd554750-7ec6-73e1-be3a-5bac0749fa0b@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5o6Xk9ScYRxy+DZ0+69hUl5hUqdW0wuATddsUALu0XI=;
 b=YrwQDeew1cdkq1HePhmUGExkzD7Hw0Tl9YIAShml3dVLN1XHu+g9LfJ8uAgS7R5RWE
 vVD76Aa60Fl6EQMMI+h5azGxOGo1dv54iB0+mySBPTr0F49K8qblZ6aupnQqoMwUQR64
 MMj6txi1/IGCtz2lKZFK2F0nwMFKLYBfm/IC4=
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
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6MTQ6NTVBTSArMDIwMCwgRW5yaWMgQmFsbGV0Ym8g
aSBTZXJyYSB3cm90ZToKPiBIaSBNYXR0aGlhcywKPiAKPiBPbiAxMi82LzE5IDIwOjAwLCBNYXR0
aGlhcyBLYWVobGNrZSB3cm90ZToKPiA+IFdpdGggY29tbWl0IDg4YmE5NWJlZGI3OSAoImJhY2ts
aWdodDogcHdtX2JsOiBDb21wdXRlIGJyaWdodG5lc3Mgb2YKPiA+IExFRCBsaW5lYXJseSB0byBo
dW1hbiBleWUiKSB0aGUgbnVtYmVyIG9mIHNldCBiaXRzIChha2EgaHdlaWdodCgpKQo+ID4gaW4g
dGhlIFBXTSBwZXJpb2QgaXMgdXNlZCBpbiB0aGUgaGV1cmlzdGljIHRvIGRldGVybWluZSB0aGUg
bnVtYmVyCj4gPiBvZiBicmlnaHRuZXNzIGxldmVscywgd2hlbiB0aGUgYnJpZ2h0bmVzcyB0YWJs
ZSBpc24ndCBzcGVjaWZpZWQgaW4KPiA+IHRoZSBEVC4gVGhlIG51bWJlciBvZiBzZXQgYml0cyBk
b2Vzbid0IHByb3ZpZGUgYSByZWxpYWJsZSBjbHVlIGFib3V0Cj4gPiB0aGUgbGVuZ3RoIG9mIHRo
ZSBwZXJpb2QsIGluc3RlYWQgY2hhbmdlIHRoZSBoZXVyaXN0aWMgdG86Cj4gPiAKPiA+ICBubGV2
ZWxzID0gcGVyaW9kIC8gZmxzKHBlcmlvZCkKPiA+IAo+ID4gQWxzbyBsaW1pdCB0aGUgbWF4aW11
bSBudW1iZXIgb2YgYnJpZ2h0bmVzcyBsZXZlbHMgdG8gNDA5NiB0byBhdm9pZAo+ID4gZXhjZXNz
aXZlbHkgbGFyZ2UgdGFibGVzLgo+ID4gCj4gPiBXaXRoIHRoaXMgdGhlIG51bWJlciBvZiBsZXZl
bHMgaW5jcmVhc2VzIG1vbm90b25pY2FsbHkgd2l0aCB0aGUgUFdNCj4gPiBwZXJpb2QsIHVudGls
IHRoZSBtYXhpbXVtIG9mIDQwOTYgbGV2ZWxzIGlzIHJlYWNoZWQ6Cj4gPiAKPiA+IHBlcmlvZCAo
bnMpICAgICMgbGV2ZWxzCj4gPiAKPiA+IDEwMCAgICAJICAgICAgIDE2Cj4gPiA1MDAJICAgICAg
IDYyCj4gPiAxMDAwCSAgICAgICAxMTEKPiA+IDUwMDAJICAgICAgIDQxNgo+ID4gMTAwMDAJICAg
ICAgIDc2OQo+ID4gNTAwMDAJICAgICAgIDMzMzMKPiA+IDEwMDAwMAkgICAgICAgNDA5Ngo+ID4g
Cj4gPiBGaXhlczogODhiYTk1YmVkYjc5ICgiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJp
Z2h0bmVzcyBvZiBMRUQgbGluZWFybHkgdG8gaHVtYW4gZXllIikKPiA+IFNpZ25lZC1vZmYtYnk6
IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+IAo+IFRlc3RlZCBvbiBTYW1z
dW5nIENocm9tZWJvb2sgUGx1cyAoMTYtYml0IHB3bSkKPiAKPiBUZXN0ZWQtYnk6IEVucmljIEJh
bGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+CgpUaGFua3MhCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
