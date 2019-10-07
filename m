Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E68BDCE797
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368A36E134;
	Mon,  7 Oct 2019 15:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BA86E134
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 15:32:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 5so13187679wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 08:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=n+UUyJ3n1ncJEha1n4+/C9IqVhKV2cn/9xer57zUNQg=;
 b=l1Igi3QfLOl3jzMT2dYHTfAwezHrzYxvW4ZFloXMlDYyhYoAmd0xsgxetQhnJSza4G
 TAEU4gnHt8JpshunnQ6itKEq9CynLHCr2JJ8KlBuMmIYYx+XFL0m9gFb9/yQ86uO5jxe
 a0Q+mKxLUhqBtb/YXDESJeFttGG+QyDH10sZbME051IHWwmvfBZfJeUW9r+yznViQk8r
 CWZUTkbJ6tl3QqbIf3l5gHNTblGG6Z76M+6OTZY+G+e6KjssxzTFlA344dt/4s8vFGLF
 ej6UbcFa8E2kHW6Ic204E58oG6cv2OqiQOmAUJ9ycB/J7awqYkdQwrxrGqwMzU3zQjpA
 uc8w==
X-Gm-Message-State: APjAAAVzsGkVYWzZkhRpc+21nPwHjLZrbZXu1VW5cVgQQ1jZYe4yZZDU
 BpdvTpc3TySJAlx4hJ3NH1YtYQ==
X-Google-Smtp-Source: APXvYqx/10sp6D2JJFW3HuaJH4t65Gd2W/SNMkSW3PcA850egBFe5G6/UYiwi8Ay9MMJ3nADgeKQZQ==
X-Received: by 2002:a1c:720e:: with SMTP id n14mr11930483wmc.11.1570462330132; 
 Mon, 07 Oct 2019 08:32:10 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id t13sm40397699wra.70.2019.10.07.08.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:32:09 -0700 (PDT)
Date: Mon, 7 Oct 2019 16:32:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 4/5] backlight: pwm_bl: switch to power-of-2 base for
 fixed-point math
Message-ID: <20191007153207.t5kehxs2znu5z6yx@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-4-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919140620.32407-4-linux@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=n+UUyJ3n1ncJEha1n4+/C9IqVhKV2cn/9xer57zUNQg=;
 b=M4l5WQnY/5/LYnOXzKCnELHG/dlhUcnZ94WpkSICHsRATKoJHNQZb1WTLQ4HMXk87/
 1ao78TZuxeEd9reB94SSdWD6Llt0ewQX0Lcxb0sczQ+zs1jVRmndlox2A0zXuBjZFV88
 aMGt+pqdnc3IUASMZ/59ziu0+ZF//5EKF4g/k/YOIQupNJg80Wd7ujtm7BOgLg1ZxPgF
 Jih5mb/YWFHIZrkV+6wJCapJl2I8w2QgWrh+iCzDMl+edqvYSa7uz+D3I7sSsrlJ+ip5
 siuFmIAzl+mPgyM78IHo2h/gTJZlDnKCaOKUohtwGNKWUjUt9V3abxFoOSimMI8RI/3U
 cYlg==
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDQ6MDY6MTlQTSArMDIwMCwgUmFzbXVzIFZpbGxlbW9l
cyB3cm90ZToKPiBVc2luZyBhIHBvd2VyLW9mLTIgaW5zdGVhZCBvZiBwb3dlci1vZi0xMCBiYXNl
IG1ha2VzIHRoZSBjb21wdXRhdGlvbnMKPiBtdWNoIGNoZWFwZXIuIDJeMTYgaXMgc2FmZTsgcmV0
dmFsIG5ldmVyIGJlY29tZXMgbW9yZSB0aGFuIDJeNDggKwo+IDJeMTYvMi4gT24gYSAzMiBiaXQg
cGxhdGZvcm0sIHRoZSB2ZXJ5IGV4cGVuc2l2ZSA2NC8zMiBkaXZpc2lvbiBhdCB0aGUKPiBlbmQg
b2YgY2llMTkzMSgpIGluc3RlYWQgYmVjb21lcyBlc3NlbnRpYWxseSBmcmVlIChhIHNoaWZ0IGJ5
IDMyIGlzCj4ganVzdCBhIHJlZ2lzdGVyIHJlbmFtZSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFz
bXVzIFZpbGxlbW9lcyA8bGludXhAcmFzbXVzdmlsbGVtb2VzLmRrPgoKUmV2aWV3ZWQtYnk6IERh
bmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cgo+IC0tLQo+ICBkcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyB8IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gaW5kZXggYWVlNjgzOWUwMjRhLi4xMDJiYzE5MTMx
MGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+IEBAIC0xNDgsNyArMTQ4LDggQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIHB3bV9iYWNrbGlnaHRfb3BzID0gewo+
ICB9Owo+ICAKPiAgI2lmZGVmIENPTkZJR19PRgo+IC0jZGVmaW5lIFBXTV9MVU1JTkFOQ0VfU0NB
TEUJMTAwMDAgLyogbHVtaW5hbmNlIHNjYWxlICovCj4gKyNkZWZpbmUgUFdNX0xVTUlOQU5DRV9T
SElGVAkxNgo+ICsjZGVmaW5lIFBXTV9MVU1JTkFOQ0VfU0NBTEUJKDEgPDwgUFdNX0xVTUlOQU5D
RV9TSElGVCkgLyogbHVtaW5hbmNlIHNjYWxlICovCj4gIAo+ICAvKgo+ICAgKiBDSUUgbGlnaHRu
ZXNzIHRvIFBXTSBjb252ZXJzaW9uLgo+IEBAIC0xNjUsMjMgKzE2NiwyNSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGJhY2tsaWdodF9vcHMgcHdtX2JhY2tsaWdodF9vcHMgPSB7Cj4gICAqIFRoZSBm
b2xsb3dpbmcgZnVuY3Rpb24gZG9lcyB0aGUgZml4ZWQgcG9pbnQgbWF0aHMgbmVlZGVkIHRvIGlt
cGxlbWVudCB0aGUKPiAgICogYWJvdmUgZm9ybXVsYS4KPiAgICovCj4gLXN0YXRpYyB1NjQgY2ll
MTkzMSh1bnNpZ25lZCBpbnQgbGlnaHRuZXNzLCB1bnNpZ25lZCBpbnQgc2NhbGUpCj4gK3N0YXRp
YyB1NjQgY2llMTkzMSh1bnNpZ25lZCBpbnQgbGlnaHRuZXNzKQo+ICB7Cj4gIAl1NjQgcmV0dmFs
Owo+ICAKPiAgCS8qCj4gIAkgKiBAbGlnaHRuZXNzIGlzIGdpdmVuIGFzIGEgbnVtYmVyIGJldHdl
ZW4gMCBhbmQgMSwgZXhwcmVzc2VkCj4gLQkgKiBhcyBhIGZpeGVkLXBvaW50IG51bWJlciBpbiBz
Y2FsZSBAc2NhbGUuIENvbnZlcnQgdG8gYQo+IC0JICogcGVyY2VudGFnZSwgc3RpbGwgZXhwcmVz
c2VkIGFzIGEgZml4ZWQtcG9pbnQgbnVtYmVyLCBzbyB0aGUKPiAtCSAqIGFib3ZlIGZvcm11bGFz
IGNhbiBiZSBhcHBsaWVkLgo+ICsJICogYXMgYSBmaXhlZC1wb2ludCBudW1iZXIgaW4gc2NhbGUK
PiArCSAqIFBXTV9MVU1JTkFOQ0VfU0NBTEUuIENvbnZlcnQgdG8gYSBwZXJjZW50YWdlLCBzdGls
bAo+ICsJICogZXhwcmVzc2VkIGFzIGEgZml4ZWQtcG9pbnQgbnVtYmVyLCBzbyB0aGUgYWJvdmUg
Zm9ybXVsYXMKPiArCSAqIGNhbiBiZSBhcHBsaWVkLgo+ICAJICovCj4gIAlsaWdodG5lc3MgKj0g
MTAwOwo+IC0JaWYgKGxpZ2h0bmVzcyA8PSAoOCAqIHNjYWxlKSkgewo+ICsJaWYgKGxpZ2h0bmVz
cyA8PSAoOCAqIFBXTV9MVU1JTkFOQ0VfU0NBTEUpKSB7Cj4gIAkJcmV0dmFsID0gRElWX1JPVU5E
X0NMT1NFU1QobGlnaHRuZXNzICogMTAsIDkwMzMpOwo+ICAJfSBlbHNlIHsKPiAtCQlyZXR2YWwg
PSAobGlnaHRuZXNzICsgKDE2ICogc2NhbGUpKSAvIDExNjsKPiArCQlyZXR2YWwgPSAobGlnaHRu
ZXNzICsgKDE2ICogUFdNX0xVTUlOQU5DRV9TQ0FMRSkpIC8gMTE2Owo+ICAJCXJldHZhbCAqPSBy
ZXR2YWwgKiByZXR2YWw7Cj4gLQkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NFU1RfVUxMKHJldHZh
bCwgKHNjYWxlICogc2NhbGUpKTsKPiArCQlyZXR2YWwgKz0gUFdNX0xVTUlOQU5DRV9TQ0FMRS8y
Owo+ICsJCXJldHZhbCA+Pj0gMipQV01fTFVNSU5BTkNFX1NISUZUOwo+ICAJfQo+ICAKPiAgCXJl
dHVybiByZXR2YWw7Cj4gQEAgLTIxNSw4ICsyMTgsNyBAQCBpbnQgcHdtX2JhY2tsaWdodF9icmln
aHRuZXNzX2RlZmF1bHQoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJLyogRmlsbCB0aGUgdGFibGUg
dXNpbmcgdGhlIGNpZTE5MzEgYWxnb3JpdGhtICovCj4gIAlmb3IgKGkgPSAwOyBpIDwgZGF0YS0+
bWF4X2JyaWdodG5lc3M7IGkrKykgewo+ICAJCXJldHZhbCA9IGNpZTE5MzEoKGkgKiBQV01fTFVN
SU5BTkNFX1NDQUxFKSAvCj4gLQkJCQkgZGF0YS0+bWF4X2JyaWdodG5lc3MsIFBXTV9MVU1JTkFO
Q0VfU0NBTEUpICoKPiAtCQkJCSBwZXJpb2Q7Cj4gKwkJCQkgZGF0YS0+bWF4X2JyaWdodG5lc3Mp
ICogcGVyaW9kOwo+ICAJCXJldHZhbCA9IERJVl9ST1VORF9DTE9TRVNUX1VMTChyZXR2YWwsIFBX
TV9MVU1JTkFOQ0VfU0NBTEUpOwo+ICAJCWlmIChyZXR2YWwgPiBVSU5UX01BWCkKPiAgCQkJcmV0
dXJuIC1FSU5WQUw7Cj4gLS0gCj4gMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
