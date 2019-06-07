Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A973948A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 20:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485B89E3F;
	Fri,  7 Jun 2019 18:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD45D89E3F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 18:44:02 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so4340944edr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 11:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=K7L6biRcKX6DrezW4PMdqKYrIiMvXHXwBuoc6gYVa/w=;
 b=cCkgC65b+5JVF6l+XcjiwqR1PMj10u94C4RTb9551JIbcwNv7LkaJJ6JrQG3vCamV3
 mIUQKme/Hb18XIrxDP0nUyhwDv2MqGvpBapKVuVLRqOHaWD+MEMznIrnUgCe3pOGL7vD
 AnT90qtkzI6oRbnewcqap4JRIxn3xfnQnya1LwUqlCgy/LmeQgGqsclH52BsMH4v8+21
 jLoXoRpWqw0h33afLoVVYI+WIiA3pYAVcn+EQMiIzEkPW4GbTkmFB7MVOTpziuhi1D7/
 /lzoGPacY829O9GF9zEb7u1EwhUMfiUezuO6r/XFU/2X9X75Ri3KtdtUeg0ZlS/2W60B
 lB5w==
X-Gm-Message-State: APjAAAW/BGTRNB56t6Nk+B8iP/JBSHK8CfqiPYAwkNDaRwlnCDzguh1P
 +ZXpiMjGqKc3QmaRhrsw2Kkb1bI4gKE=
X-Google-Smtp-Source: APXvYqz+W+mLqbjAldc2HSzNebmlzsH6nUBt9KIy52rZiVEtEipYLpgZF5FCR2QdI9uXC4d/Abd8Cg==
X-Received: by 2002:a50:b4fd:: with SMTP id x58mr49653551edd.190.1559933041486; 
 Fri, 07 Jun 2019 11:44:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z3sm664237edh.71.2019.06.07.11.43.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 11:43:58 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:43:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Throw away the BIOS fb if has
 the wrong depth/bpp
Message-ID: <20190607184356.GO21222@phenom.ffwll.local>
References: <20190607162611.23514-1-ville.syrjala@linux.intel.com>
 <20190607162611.23514-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607162611.23514-4-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=K7L6biRcKX6DrezW4PMdqKYrIiMvXHXwBuoc6gYVa/w=;
 b=F8kv8zSrARdvl48m4JuaKfTvQzPFo0YlZqH3v51mbV803/uRs2k10jhahSiUSaqhQZ
 BjkRYZoFtopF/AGhjdrQJK84wnqG52v6Y9EzJlVTRopRQzBZrmPoVswpS8pAm9Z7IjsL
 8q3Gif829udIOP5HgszOFu8rqJ0Q/MER0tktI=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDc6MjY6MTFQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFJlc3BlY3QgdGhlIHVzZXIncyBjaG9pY2Ugb2YgZGVwdGgvYnBwIGZvciB0aGUg
ZmJkZXYgZnJhbWVidWZmZXIKPiBhbmQgdGhyb3cgb3V0IHRoZSBmYiB3ZSBpbmhlcml0ZWQgZnJv
bSB0aGUgQklPUyBpZiBpdCBkb2Vzbid0Cj4gbWF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkgZ3Vlc3Mgd2Un
cmUgZ29pbmcgYm9vbSByaWdodCBub3csIHdoaWNoIGlzIG1heWJlIGEgYml0IG11Y2g/IGkuZS4K
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZmJkZXYuYyB8IDExICsrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2ZiZGV2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9mYmRldi5jCj4gaW5kZXggMGQzYTZmYTY3
NGU2Li4xYTkzNWRjNzRkMjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZmJkZXYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2ZiZGV2LmMKPiBA
QCAtMTk5LDYgKzE5OSwxNyBAQCBzdGF0aWMgaW50IGludGVsZmJfY3JlYXRlKHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpoZWxwZXIsCj4gIAkJZHJtX2ZyYW1lYnVmZmVyX3B1dCgmaW50ZWxfZmItPmJh
c2UpOwo+ICAJCWludGVsX2ZiID0gaWZiZGV2LT5mYiA9IE5VTEw7Cj4gIAl9Cj4gKwlpZiAoaW50
ZWxfZmIgJiYKPiArCSAgICAoc2l6ZXMtPnN1cmZhY2VfZGVwdGggIT0gaW50ZWxfZmItPmJhc2Uu
Zm9ybWF0LT5kZXB0aCB8fAo+ICsJICAgICBzaXplcy0+c3VyZmFjZV9icHAgIT0gaW50ZWxfZmIt
PmJhc2UuZm9ybWF0LT5jcHBbMF0gKiA4KSkgewoKQmlrZXNoZWQ6IEEgbGl0dGxlIGhlbHBlciB0
aGF0IGRvZXMgYWxsIHRoZXNlIGNoZWNrcyB3aXRoIGRlYnVnIG91dHB1dCwKYW5kIGp1c3Qgb25l
ICJ0aHJvdyBiaW9zIGZiIGF3YXkiIHBhdGggd291bGQgbG9vayBhIGxvdCBuZWF0ZXIuCi1EYW5p
ZWwKCj4gKwkJRFJNX0RFQlVHX0tNUygiQklPUyBmYiB1c2luZyB3cm9uZyBkZXB0aC9icHAgKCVk
LyVkKSwgd2UgcmVxdWlyZSAoJWQvJWQpLCIKPiArCQkJICAgICAgIiByZWxlYXNpbmcgaXRcbiIs
Cj4gKwkJCSAgICAgIGludGVsX2ZiLT5iYXNlLmZvcm1hdC0+ZGVwdGgsCj4gKwkJCSAgICAgIGlu
dGVsX2ZiLT5iYXNlLmZvcm1hdC0+Y3BwWzBdICogOCwKPiArCQkJICAgICAgc2l6ZXMtPnN1cmZh
Y2VfZGVwdGgsIHNpemVzLT5zdXJmYWNlX2JwcCk7Cj4gKwkJZHJtX2ZyYW1lYnVmZmVyX3B1dCgm
aW50ZWxfZmItPmJhc2UpOwo+ICsJCWludGVsX2ZiID0gaWZiZGV2LT5mYiA9IE5VTEw7Cj4gKwl9
Cj4gIAlpZiAoIWludGVsX2ZiIHx8IFdBUk5fT04oIWludGVsX2ZiX29iaigmaW50ZWxfZmItPmJh
c2UpKSkgewo+ICAJCURSTV9ERUJVR19LTVMoIm5vIEJJT1MgZmIsIGFsbG9jYXRpbmcgYSBuZXcg
b25lXG4iKTsKPiAgCQlyZXQgPSBpbnRlbGZiX2FsbG9jKGhlbHBlciwgc2l6ZXMpOwo+IC0tIAo+
IDIuMjEuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
