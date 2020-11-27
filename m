Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 842312C6789
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C856EDDE;
	Fri, 27 Nov 2020 14:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBB76EDDE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 14:11:15 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k4so5896260edl.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 06:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tKrwY3IGesa817yoAyqu5N7Ell9pnXqraCUvhrrkQGQ=;
 b=Mir8tFh1ezh/xOx3ejk3RfUzI+I78ReYDhwYVVbWMlTLNPobB2ecuvLN8ewR5GsrEv
 TXcyH4VFMllxtLrfMeTEwFo8Ho3U8MGbQksrurrj6DeuFofxVMEoOE2PTA1ABTBepOJB
 99d82G1yaqWlcivlv3EVAdT3EAA6BrHteKuew1TIyl3Nu5NVU0S/+/Ir8kBDHhQzVRkM
 LRsbO4QOtw4KWfpXTWOum97AgV4yEn1ImphDKMFtFU4RpAx/IDeI2z8kVKb+pzxTMdX1
 sw8UwEB0ISTwbQCge/IiS51ZCjmWfCT0Yp6ZUF4f+E9tCzuc+CxUkyg9pS7Eo5okQOyH
 CbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tKrwY3IGesa817yoAyqu5N7Ell9pnXqraCUvhrrkQGQ=;
 b=Z7cj8kFW0Z14L/ZBQQ14zmCQEf0Ty0Rh1LsQ1SbR8XfuRCYAZGAcum/FnhWXS3gvDG
 N49mRAaPHQm87iW8hOV8GkTsGZco9MJ8oyEX4rZNbuTGvEJh9alz5kkd8k7K9ipDy5ro
 x7ob5oXRIahR2Wtgq3OhBlCd9PQqAIt6+pjhaXlThViTCl8dTCIGMcGnGkRfiHSi7Kxq
 b6fCJAs+i2S211rzfHsdfZvK4okxULQCkr/WhqTWeES+DcOSmIQUxJtJ28zbbuWvy3tj
 je3xlpL6qGSgKuTW1mzrJhueigGbJyJPk8J0jCWLkSwRRWSZ96ju9xDxcxM5cBn+ithF
 zWsA==
X-Gm-Message-State: AOAM5330SFYCuyJKA7n3spbiHeZrBGVJ3H61dY7r4s949RosOxSmQGuU
 m1WzGaEDoAu9vuViswthtV28Q9cs3HM=
X-Google-Smtp-Source: ABdhPJx+xQSIAwMCjuGMPERFc348CErjfHJt9vsz7UnoXsBJx7Bt9aec781o7ZS4BKp9FNO3+AzuvQ==
X-Received: by 2002:aa7:dccd:: with SMTP id w13mr8094858edu.385.1606486274506; 
 Fri, 27 Nov 2020 06:11:14 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b9sm4977360ejb.0.2020.11.27.06.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 06:11:09 -0800 (PST)
Subject: Re: [PATCH 1/7] drm/radeon: stop using pages with
 drm_prime_sg_to_page_addr_arrays v2
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org
References: <20201125125919.1372-1-christian.koenig@amd.com>
Message-ID: <30ce8840-c74a-5f16-1892-6b9066f8d0de@gmail.com>
Date: Fri, 27 Nov 2020 15:11:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125125919.1372-1-christian.koenig@amd.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZz8gRGFuaWVsIGFueSBtb3JlIGlkZWFzIG9uIHRoaXMgb3Igc2hvdWxkIHdlIHB1c2ggaXQ/
CgpUaGFua3MsCkNocmlzdGlhbi4KCkFtIDI1LjExLjIwIHVtIDEzOjU5IHNjaHJpZWIgQ2hyaXN0
aWFuIEvDtm5pZzoKPiBUaGlzIGlzIGRlcHJlY2F0ZWQuCj4KPiB2MjogYWxzbyB1c2UgdHRtX3Nn
X3R0X2luaXQgdG8gYXZvaWQgYWxsb2NhdGluZyB0aGUgcGFnZSBhcnJheS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwgMTEgKysrKysrLS0tLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+IGluZGV4IDBjYTM4MWI5NWQzZC4uNWQwMGIz
ZGZmMzg4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiBAQCAtNDAxLDgg
KzQwMSw4IEBAIHN0YXRpYyBpbnQgcmFkZW9uX3R0bV90dF9waW5fdXNlcnB0cihzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldiwgc3RydWN0IHR0bV90dCAqCj4gICAJaWYgKHIpCj4gICAJCWdvdG8g
cmVsZWFzZV9zZzsKPiAgIAo+IC0JZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRt
LT5zZywgdHRtLT5wYWdlcywKPiAtCQkJCQkgZ3R0LT50dG0uZG1hX2FkZHJlc3MsIHR0bS0+bnVt
X3BhZ2VzKTsKPiArCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIE5V
TEwsIGd0dC0+dHRtLmRtYV9hZGRyZXNzLAo+ICsJCQkJCSB0dG0tPm51bV9wYWdlcyk7Cj4gICAK
PiAgIAlyZXR1cm4gMDsKPiAgIAo+IEBAIC01NDIsNyArNTQyLDcgQEAgc3RhdGljIHN0cnVjdCB0
dG1fdHQgKnJhZGVvbl90dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
Cj4gICAJZWxzZQo+ICAgCQljYWNoaW5nID0gdHRtX2NhY2hlZDsKPiAgIAo+IC0JaWYgKHR0bV9k
bWFfdHRfaW5pdCgmZ3R0LT50dG0sIGJvLCBwYWdlX2ZsYWdzLCBjYWNoaW5nKSkgewo+ICsJaWYg
KHR0bV9zZ190dF9pbml0KCZndHQtPnR0bSwgYm8sIHBhZ2VfZmxhZ3MsIGNhY2hpbmcpKSB7Cj4g
ICAJCWtmcmVlKGd0dCk7Cj4gICAJCXJldHVybiBOVUxMOwo+ICAgCX0KPiBAQCAtNTgwLDggKzU4
MCw5IEBAIHN0YXRpYyBpbnQgcmFkZW9uX3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwKPiAgIAl9Cj4gICAKPiAgIAlpZiAoc2xhdmUgJiYgdHRtLT5zZykgewo+IC0J
CWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIHR0bS0+cGFnZXMsCj4g
LQkJCQkJCSBndHQtPnR0bS5kbWFfYWRkcmVzcywgdHRtLT5udW1fcGFnZXMpOwo+ICsJCWRybV9w
cmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIE5VTEwsCj4gKwkJCQkJCSBndHQt
PnR0bS5kbWFfYWRkcmVzcywKPiArCQkJCQkJIHR0bS0+bnVtX3BhZ2VzKTsKPiAgIAkJcmV0dXJu
IDA7Cj4gICAJfQo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
