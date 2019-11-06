Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1DF13C3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B076ECB2;
	Wed,  6 Nov 2019 10:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95776ECB1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 10:22:00 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q130so2662762wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 02:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9yNVNgBBSkVScmiJzjXLSO6CUJVFcHzlTXO1T7PjZ9o=;
 b=WHnFzlAkmf3mP/E3kDMupFBb5LrjSJrstTMIVslBq8eLuLTv0D87SkZU0SSRMz+/ki
 qBkwQqkjO2enHpLaAKn5JhSaK/rWbQwoYCaOxzyh9H0qyA5+W11ZDSSa4yV0PJfDG0sE
 nsczFUq5oFBaDtb88H99UEc3HR7c0R40ImBcBQGfqYdTLcMHiH1UgVkIbpaIEmFA4GHV
 5pm02iTRjNtJYhUDgycw8fl1/d/qCkHmRjVdUaXRobdUd0ent5zI/p4NdqNufj5z/Iph
 iq2BT4eJv3vJnmv9QViNPUsHS7jL5p/WPSG9jfzwQ+PP6EaY5gB+4tbfmD19HEvIUe+Z
 Vb1Q==
X-Gm-Message-State: APjAAAWpqfpzgVTm+LSNSImkBpSwIbN0vJyMiJx0kDOanDOXp1zcgD2P
 RSEaIhTvBZ0Su9SO3lIWAZO8aZdKj0s=
X-Google-Smtp-Source: APXvYqygyH2+QJ6prSbQVvZYeCcKlDoKErf/yAals8AN0QwyJ2w8AX6TOAWu1o0eMIY05ziZnlh8gA==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr1649016wmj.106.1573035719455; 
 Wed, 06 Nov 2019 02:21:59 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g4sm16093575wru.75.2019.11.06.02.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 02:21:58 -0800 (PST)
Date: Wed, 6 Nov 2019 11:21:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 3/3] drm/prime: Use anon_drm_getfile() for an internal
 drm struct file
Message-ID: <20191106102157.GF23790@phenom.ffwll.local>
References: <20191106100716.18181-1-chris@chris-wilson.co.uk>
 <20191106100716.18181-3-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106100716.18181-3-chris@chris-wilson.co.uk>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9yNVNgBBSkVScmiJzjXLSO6CUJVFcHzlTXO1T7PjZ9o=;
 b=ZxhGeN6BpXe9iUldSx7sEIEs2ULE9wI66Z8GyckaL+nx/dDn5+GTrTwAmIPrZJJVTc
 j5/VAhS3WRtgfFlDjJkEGMhH8N2njOUXLyiVozSsc5Ya9vJQM4UVM4i0OXMxbhb+SAdi
 51AShXDHSDjhq8ZP1zWbICnVCWa9S7qMQUHic=
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMTA6MDc6MTZBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IEN1cnJlbnRseSB0aGUgZHJtX3ByaW1lIG1tYXAgZmFsbGJhY2sgdXNlcyBhIG1vY2sg
c3RydWN0IGZpbGUgdG8gcHJvdmlkZQo+IHRoZSBmaWxlIHBvaW50ZXIgaW50byB0aGUgYmFja2Vu
ZCBtbWFwIHJvdXRpbmUuIE5vdyB0aGF0IHdlIGNhbiBjcmVhdGUKPiBmdWxseSBmbGVkZ2VkIGFu
b255bW91cyBzdHJ1Y3QgZmlsZSBhcm91bmQgdGhlIGRybSBkZXZpY2UsIHB1dCBpdCB0bwo+IHVz
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMjYgKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+IGluZGV4IDA4MTQyMTFiMGYzZi4uNWZh
YTYzNzEzZWM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+IEBAIC03MDksOCArNzA5LDcgQEAgRVhQ
T1JUX1NZTUJPTChkcm1fZ2VtX2RtYWJ1Zl92dW5tYXApOwo+ICAgKi8KPiAgaW50IGRybV9nZW1f
cHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpCj4gIHsKPiAtCXN0cnVjdCBkcm1fZmlsZSAqcHJpdjsKPiAtCXN0cnVjdCBmaWxl
ICpmaWw7Cj4gKwlzdHJ1Y3QgZmlsZSAqZmlsZTsKPiAgCWludCByZXQ7Cj4gIAo+ICAJaWYgKG9i
ai0+ZnVuY3MgJiYgb2JqLT5mdW5jcy0+bW1hcCkgewoKb2JqLT5mdW5jcy0+bW1hcCBpcyB0aGUg
bmV3IHdheSBvZiBkb2luZyB0aGlzIChhbmQgaG9wZWZ1bGx5IGZpbmFsbHkKc29tZXRoaW5nIGNs
ZWFuKSwgSSdkIHJlYWxseSBsaWtlIHRvIHJldGlyZSB0aGUgYmVsb3cgaGFjayBvdXRyaWdodC4K
ClBsdXMgSSdtIG5vdCBzdXJlIHdoeSB5b3UgbmVlZCBhbiBhbm9uIGlub2RlIGhlcmU/IElmIGEg
ZHJpdmVyIG5lZWRzIHRoaXMKZm9yIHVubWFwX21hcHBpbmdfcmFuZ2Ugb3Igc2ltaWxhciBJIHRo
aW5rIGl0J2QgYmUgYmV0dGVyIHRvIHRyeSBhbmQgbWFrZQpzb21ldGhpbmcgd29yayBjbGVhbmx5
IGZvciBvYmotPmZ1bmNzLT5tbWFwLgotRGFuaWVsCgo+IEBAIC03MjIsMzAgKzcyMSwyMSBAQCBp
bnQgZHJtX2dlbV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgCQlyZXR1cm4gMDsKPiAgCX0KPiAgCj4gLQlwcml2ID0g
a3phbGxvYyhzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKPiAtCWZpbCA9IGt6YWxsb2Moc2l6
ZW9mKCpmaWwpLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghcHJpdiB8fCAhZmlsKSB7Cj4gLQkJcmV0
ID0gLUVOT01FTTsKPiAtCQlnb3RvIG91dDsKPiAtCX0KPiArCWZpbGUgPSBhbm9uX2RybV9nZXRm
aWxlKG9iai0+ZGV2LT5wcmltYXJ5LCBPX1JEV1IpOwo+ICsJaWYgKElTX0VSUihmaWxlKSkKPiAr
CQlyZXR1cm4gUFRSX0VSUihmaWxlKTsKPiAgCj4gLQkvKiBVc2VkIGJ5IGRybV9nZW1fbW1hcCgp
IHRvIGxvb2t1cCB0aGUgR0VNIG9iamVjdCAqLwo+IC0JcHJpdi0+bWlub3IgPSBvYmotPmRldi0+
cHJpbWFyeTsKPiAtCWZpbC0+cHJpdmF0ZV9kYXRhID0gcHJpdjsKPiAtCj4gLQlyZXQgPSBkcm1f
dm1hX25vZGVfYWxsb3coJm9iai0+dm1hX25vZGUsIHByaXYpOwo+ICsJcmV0ID0gZHJtX3ZtYV9u
b2RlX2FsbG93KCZvYmotPnZtYV9ub2RlLCBmaWxlLT5wcml2YXRlX2RhdGEpOwo+ICAJaWYgKHJl
dCkKPiAgCQlnb3RvIG91dDsKPiAgCj4gIAl2bWEtPnZtX3Bnb2ZmICs9IGRybV92bWFfbm9kZV9z
dGFydCgmb2JqLT52bWFfbm9kZSk7Cj4gIAo+IC0JcmV0ID0gb2JqLT5kZXYtPmRyaXZlci0+Zm9w
cy0+bW1hcChmaWwsIHZtYSk7Cj4gKwlyZXQgPSBmaWxlLT5mX29wLT5tbWFwKGZpbGUsIHZtYSk7
Cj4gIAo+IC0JZHJtX3ZtYV9ub2RlX3Jldm9rZSgmb2JqLT52bWFfbm9kZSwgcHJpdik7Cj4gKwlk
cm1fdm1hX25vZGVfcmV2b2tlKCZvYmotPnZtYV9ub2RlLCBmaWxlLT5wcml2YXRlX2RhdGEpOwo+
ICBvdXQ6Cj4gLQlrZnJlZShwcml2KTsKPiAtCWtmcmVlKGZpbCk7Cj4gLQo+ICsJZnB1dChmaWxl
KTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ByaW1lX21t
YXApOwo+IC0tIAo+IDIuMjQuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
