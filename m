Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB204E840
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAB06E8AE;
	Fri, 21 Jun 2019 12:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25F96E8AE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 12:49:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 207so6236380wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 05:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1W2WjOrHyAQxbAms+0lUtVAz8eLCNhjimYeSWnn2kxY=;
 b=c2IolDdcJgGAmYT2WEht9o6MTYIRD3nSZk2yRuefHaPGqKh0E8wrwRbINImc7fu0/5
 Ngop8vGnpuU9qY9Z3TAExgxzOYRh+Y86fT/VQjOFuBpj3oFFnUoI+MjSNueCKZY3ym6u
 1d6MPC9SJQuZyMO21eGRlbTIwNxB2Xb2DTFU0XmGdY443Oh2GjYNMnvHduUnzZ8cgZ1Y
 0yViZiAK0VjFQzCH+hZm2DjoCSQ49GyyJk1S/ig5spbf8/eawxbd9164JmIwLBvQRwIb
 1VpFzu7VaPHiA+sN4k4DVmycRtHsh1ZuPQ8PrC1Lfo4NOBCUMRcbLYsM7aAHCvxdBM7B
 /gBQ==
X-Gm-Message-State: APjAAAUyzy+p1ks8CjY754Q+6D8c4XY08W7ii5MbL0DpQmwmSGRxsQw5
 BsM9mKrzAAuxHDIAe6hUCCpBbw==
X-Google-Smtp-Source: APXvYqzzAFNVEwfP98oYEgpzs3sVfqEHFy4Wk/kg/CY26BKqOzSTI2d+xIIWa5QU568W7TC2Lndjqg==
X-Received: by 2002:a05:600c:2388:: with SMTP id
 m8mr3862455wma.23.1561121374405; 
 Fri, 21 Jun 2019 05:49:34 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id j32sm5690957wrj.43.2019.06.21.05.49.33
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 05:49:33 -0700 (PDT)
Subject: Re: [PATCH] backlight: pwm_bl: Fix heuristic to determine number of
 brightness levels
To: Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190612180003.161966-1-mka@chromium.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <bf229b34-2b76-90f7-3e48-102f473b3b52@linaro.org>
Date: Fri, 21 Jun 2019 13:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612180003.161966-1-mka@chromium.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1W2WjOrHyAQxbAms+0lUtVAz8eLCNhjimYeSWnn2kxY=;
 b=g6dZCD+0BKGgFTxVXquMah27DBoxfovfxxX56Mb73a05HlB2qIrrf8g+SEftMtzlhD
 t2ZmeKQkKEqdJoh0k840zL94hKMkX2Cr3jFPzhyXuuPzIuzZI8n2v6V0CKpcvkP3onEG
 ANAjEFLKx38eZ1JlUKG0zzImhRZGY/9GTpMJoEH/sA2yxdJIOMeW8oxUvpI5N4uQG9z6
 QyZAwFS7+whdd+jEHONQAhNRAf2v7RIJGmv718aiN3zc9iGCiJgcdOe4+qpfp5BgUMEI
 lI9onn9PFGeLpa7SJ99NelRtcQQrUG1r2rMHjx38oPYsVjwX/6soInLmMx6HSHceYYpI
 7Jjw==
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
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMDYvMjAxOSAxOTowMCwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gV2l0aCBjb21t
aXQgODhiYTk1YmVkYjc5ICgiYmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJpZ2h0bmVzcyBv
Zgo+IExFRCBsaW5lYXJseSB0byBodW1hbiBleWUiKSB0aGUgbnVtYmVyIG9mIHNldCBiaXRzIChh
a2EgaHdlaWdodCgpKQo+IGluIHRoZSBQV00gcGVyaW9kIGlzIHVzZWQgaW4gdGhlIGhldXJpc3Rp
YyB0byBkZXRlcm1pbmUgdGhlIG51bWJlcgo+IG9mIGJyaWdodG5lc3MgbGV2ZWxzLCB3aGVuIHRo
ZSBicmlnaHRuZXNzIHRhYmxlIGlzbid0IHNwZWNpZmllZCBpbgo+IHRoZSBEVC4gVGhlIG51bWJl
ciBvZiBzZXQgYml0cyBkb2Vzbid0IHByb3ZpZGUgYSByZWxpYWJsZSBjbHVlIGFib3V0Cj4gdGhl
IGxlbmd0aCBvZiB0aGUgcGVyaW9kLCBpbnN0ZWFkIGNoYW5nZSB0aGUgaGV1cmlzdGljIHRvOgo+
IAo+ICAgbmxldmVscyA9IHBlcmlvZCAvIGZscyhwZXJpb2QpCj4gCj4gQWxzbyBsaW1pdCB0aGUg
bWF4aW11bSBudW1iZXIgb2YgYnJpZ2h0bmVzcyBsZXZlbHMgdG8gNDA5NiB0byBhdm9pZAo+IGV4
Y2Vzc2l2ZWx5IGxhcmdlIHRhYmxlcy4KPiAKPiBXaXRoIHRoaXMgdGhlIG51bWJlciBvZiBsZXZl
bHMgaW5jcmVhc2VzIG1vbm90b25pY2FsbHkgd2l0aCB0aGUgUFdNCj4gcGVyaW9kLCB1bnRpbCB0
aGUgbWF4aW11bSBvZiA0MDk2IGxldmVscyBpcyByZWFjaGVkOgo+IAo+IHBlcmlvZCAobnMpICAg
ICMgbGV2ZWxzCj4gCj4gMTAwICAgIAkgICAgICAgMTYKPiA1MDAJICAgICAgIDYyCj4gMTAwMAkg
ICAgICAgMTExCj4gNTAwMAkgICAgICAgNDE2Cj4gMTAwMDAJICAgICAgIDc2OQo+IDUwMDAwCSAg
ICAgICAzMzMzCj4gMTAwMDAwCSAgICAgICA0MDk2Cj4gCj4gRml4ZXM6IDg4YmE5NWJlZGI3OSAo
ImJhY2tsaWdodDogcHdtX2JsOiBDb21wdXRlIGJyaWdodG5lc3Mgb2YgTEVEIGxpbmVhcmx5IHRv
IGh1bWFuIGV5ZSIpCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJv
bWl1bS5vcmc+CgpBcyBJIHVuZGVyc3RhbmQgaXQgd2UgY2FuJ3QgZGV0ZXJtaW5lIHRoZSBQV00g
cXVhbnRpemF0aW9uIHdpdGhvdXQgCmFjdHVhbGx5IHByb2dyYW1taW5nIGl0IHNvIHRoZSB0YWJs
ZSBjb3VsZCBzdGlsbCBiZSBvdmVyc2l6ZWQgYWZ0ZXIgdGhpcyAKcGF0Y2ggKGUuZy4gbXVsdGlw
bGUgZW50cmllcyBlbmQgdXAgd2l0aCBzYW1lIHBoeXNpY2FsIGJyaWdodG5lc3MpIGJ1dCAKc2lu
Y2UgaXQgc2hvdWxkIGFsd2F5cyBiZSBtb25vdG9uaWMgYW5kIHRoZSB0YWJsZSBzaXplIHdpbGwg
Y2FwIG91dCBhdCBhIApzYW5lIHZhbHVlIHRoZW46CgpBY2tlZC1ieTogRGFuaWVsIFRob21wc29u
IDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KCgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9i
YWNrbGlnaHQvcHdtX2JsLmMgfCAyNCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlkZW8vYmFj
a2xpZ2h0L3B3bV9ibC5jCj4gaW5kZXggZmI0NWY4NjZiOTIzLi4wYjcxNTJmYTI0ZjcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+IEBAIC0xOTQsMjkgKzE5NCwxNyBAQCBpbnQgcHdt
X2JhY2tsaWdodF9icmlnaHRuZXNzX2RlZmF1bHQoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCQkJ
CSAgICAgc3RydWN0IHBsYXRmb3JtX3B3bV9iYWNrbGlnaHRfZGF0YSAqZGF0YSwKPiAgIAkJCQkg
ICAgIHVuc2lnbmVkIGludCBwZXJpb2QpCj4gICB7Cj4gLQl1bnNpZ25lZCBpbnQgY291bnRlciA9
IDA7Cj4gLQl1bnNpZ25lZCBpbnQgaSwgbjsKPiArCXVuc2lnbmVkIGludCBpOwo+ICAgCXU2NCBy
ZXR2YWw7Cj4gICAKPiAgIAkvKgo+IC0JICogQ291bnQgdGhlIG51bWJlciBvZiBiaXRzIG5lZWRl
ZCB0byByZXByZXNlbnQgdGhlIHBlcmlvZCBudW1iZXIuIFRoZQo+IC0JICogbnVtYmVyIG9mIGJp
dHMgaXMgdXNlZCB0byBjYWxjdWxhdGUgdGhlIG51bWJlciBvZiBsZXZlbHMgdXNlZCBmb3IgdGhl
Cj4gLQkgKiBicmlnaHRuZXNzLWxldmVscyB0YWJsZSwgdGhlIHB1cnBvc2Ugb2YgdGhpcyBjYWxj
dWxhdGlvbiBpcyBoYXZlIGEKPiAtCSAqIHByZS1jb21wdXRlZCB0YWJsZSB3aXRoIGVub3VnaCBs
ZXZlbHMgdG8gZ2V0IGxpbmVhciBicmlnaHRuZXNzCj4gLQkgKiBwZXJjZXB0aW9uLiBUaGUgcGVy
aW9kIGlzIGRpdmlkZWQgYnkgdGhlIG51bWJlciBvZiBiaXRzIHNvIGZvciBhCj4gLQkgKiA4LWJp
dCBQV00gd2UgaGF2ZSAyNTUgLyA4ID0gMzIgYnJpZ2h0bmVzcyBsZXZlbHMgb3IgZm9yIGEgMTYt
Yml0IFBXTQo+IC0JICogd2UgaGF2ZSA2NTUzNSAvIDE2ID0gNDA5NiBicmlnaHRuZXNzIGxldmVs
cy4KPiAtCSAqCj4gLQkgKiBOb3RlIHRoYXQgdGhpcyBtZXRob2QgaXMgYmFzZWQgb24gZW1waXJp
Y2FsIHRlc3Rpbmcgb24gZGlmZmVyZW50Cj4gLQkgKiBkZXZpY2VzIHdpdGggUFdNIG9mIDggYW5k
IDE2IGJpdHMgb2YgcmVzb2x1dGlvbi4KPiArCSAqIE9uY2Ugd2UgaGF2ZSA0MDk2IGxldmVscyB0
aGVyZSdzIGxpdHRsZSBwb2ludCBnb2luZyBtdWNoIGhpZ2hlci4uLgo+ICsJICogbmVpdGhlciBp
bnRlcmFjdGl2ZSBzbGlkZXJzIG5vciBhbmltYXRpb24gYmVuZWZpdHMgZnJvbSBoYXZpbmcKPiAr
CSAqIG1vcmUgdmFsdWVzIGluIHRoZSB0YWJsZS4KPiAgIAkgKi8KPiAtCW4gPSBwZXJpb2Q7Cj4g
LQl3aGlsZSAobikgewo+IC0JCWNvdW50ZXIgKz0gbiAlIDI7Cj4gLQkJbiA+Pj0gMTsKPiAtCX0K
PiArCWRhdGEtPm1heF9icmlnaHRuZXNzID0KPiArCQltaW4oKGludClESVZfUk9VTkRfVVAocGVy
aW9kLCBmbHMocGVyaW9kKSksIDQwOTYpOwo+ICAgCj4gLQlkYXRhLT5tYXhfYnJpZ2h0bmVzcyA9
IERJVl9ST1VORF9VUChwZXJpb2QsIGNvdW50ZXIpOwo+ICAgCWRhdGEtPmxldmVscyA9IGRldm1f
a2NhbGxvYyhkZXYsIGRhdGEtPm1heF9icmlnaHRuZXNzLAo+ICAgCQkJCSAgICBzaXplb2YoKmRh
dGEtPmxldmVscyksIEdGUF9LRVJORUwpOwo+ICAgCWlmICghZGF0YS0+bGV2ZWxzKQo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
