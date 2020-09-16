Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2826C3DD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 16:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14DF6E881;
	Wed, 16 Sep 2020 14:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132FF6E881
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 14:49:24 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id o8so10723479ejb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=OwaeFwlEg55yBaxofwPoLpwdQEQd6WPgPYlB8wB6rqU=;
 b=Uv2GvbEJZ5+4ihR3icSvwEmLx4rsakQ0grBvA7rXX3+9arbQ8u6N6K8sLT+ZISCymk
 YWmZ0oiIW37trWO55ns0gPwL3t1P5Fh528CyFNzANXaqDCK34k+k/wFRvmmVaeytWiYY
 GpG/4YSVAtoP0NJICiggO1EU7BTHED6KwU4W6GpkHER+n/GY3SrGEOwPl7Ca99mZ6hsi
 vw/zDorJNkAKl02EaHif4upmMQl0mnrgpBh7ipjSzYhOELuNoFas2zEcbraqolK7AxX+
 cuyHHkZHSvkOh4CwQOsRpuhqW3APOeyXPMrIbN4sCJ9othqdp8piTEpwKrXnWBkp3iHU
 5H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=OwaeFwlEg55yBaxofwPoLpwdQEQd6WPgPYlB8wB6rqU=;
 b=bO4JmFEwLh1wd0kzjSKtLKO9Bx4o24jU/G5XfuvuLH5pbHxqd+04WFGIl3Xrl5c63U
 VKxx6FMf0huLjCHz3S8A57AtIzv/LClU8f40rY+/PjZjuEVNs0GKksa45Zr6ll25XGfV
 dbr6O38sWX5shWilz4cth35rYAKR6CT1pUh0nSk0QvRohO+lyx60aHknzM47zUwaBdfZ
 mpYmRMmJohmUgTUB8RYV36VK2CJBgQ3blOwGTNXnW1IPSjhWAcWALH032LzeN/NfPTk+
 z1WNNucGZZJLCSwhFXBiQRxFxG44mR4FTSPWijFC0nqx9fJVdSo9cjtxGUTEYcROqSNi
 AiFg==
X-Gm-Message-State: AOAM532Yl5/c0VKF+CVPlW4MlUw9Ljm7GOlBxDTYXVs+xJVCYEsUVLm0
 XwG5yy62socTFejcWBUwSMVc2x2UKY8=
X-Google-Smtp-Source: ABdhPJwF0rfk052Vx1LLSgJcI+DmVtu3UE66tn0e3lf/EZyp9eHQJbyZ8Og/X+ZtOr++jtq+v4ShKg==
X-Received: by 2002:a17:906:3a0e:: with SMTP id
 z14mr25121165eje.192.1600267762739; 
 Wed, 16 Sep 2020 07:49:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o11sm14313094edw.80.2020.09.16.07.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 07:49:22 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix incorrect TT->SYSTEM move handling
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org
References: <20200916142406.2379-1-christian.koenig@amd.com>
Message-ID: <06463cba-c21b-c17d-0dea-15dd48060999@gmail.com>
Date: Wed, 16 Sep 2020 16:49:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916142406.2379-1-christian.koenig@amd.com>
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

QW0gMTYuMDkuMjAgdW0gMTY6MjQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IFdoZW4gd2Ug
bW92ZSBmcm9tIHRoZSBTWVNURU0gZG9tYWluIHRvIHRoZSBUVCBkb21haW4KClR5cG8gaW4gdGhl
IHN1YmplY3QsIHRoZSBvcmRlciBpbiB0aGUgc2VudGVuY2UgaGVyZSBpcyB0aGUgY29ycmVjdCBv
bmUuCgpUaGlzIGlzIGFuIGltcG9ydGFudCBidWcgZml4IEknbSBodW50aW5nIGZvciB5ZWFycy4g
UGxlYXNlIHJldmlldy4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPiB3ZSBzdGlsbCBuZWVkIHRvIHBv
dGVudGlhbGx5IGNoYW5nZSB0aGUgY2FjaGluZyBzdGF0ZS4KPgo+IFRoaXMgaXMgbW9zdCBsaWtl
bHkgdGhlIHNvdXJjZSBvZiBhIGJ1bmNoIG9mIHByb2JsZW1zIHdpdGgKPiBBR1AgYW5kIFVTV0Mg
dG9nZXRoZXIgd2l0aCBoaWJlcm5hdGlvbiBhbmQgc3dhcC4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDQzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZwo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDgg
LS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCj4gaW5kZXggZmZiZGMyMGQ4ZThkLi41ZjdlZmM5MDk3MGUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKPiBAQCAtMjY0LDEzICsyNjQsNiBAQCBzdGF0aWMgaW50IHR0bV9ib19oYW5kbGVf
bW92ZV9tZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJCWlmIChyZXQpCj4g
ICAJCQkJZ290byBvdXRfZXJyOwo+ICAgCQl9Cj4gLQo+IC0JCWlmIChiby0+bWVtLm1lbV90eXBl
ID09IFRUTV9QTF9TWVNURU0pIHsKPiAtCQkJaWYgKGJkZXYtPmRyaXZlci0+bW92ZV9ub3RpZnkp
Cj4gLQkJCQliZGV2LT5kcml2ZXItPm1vdmVfbm90aWZ5KGJvLCBldmljdCwgbWVtKTsKPiAtCQkJ
Ym8tPm1lbSA9ICptZW07Cj4gLQkJCWdvdG8gbW92ZWQ7Cj4gLQkJfQo+ICAgCX0KPiAgIAo+ICAg
CWlmIChiZGV2LT5kcml2ZXItPm1vdmVfbm90aWZ5KQo+IEBAIC0yOTMsNyArMjg2LDYgQEAgc3Rh
dGljIGludCB0dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCj4gICAJCWdvdG8gb3V0X2VycjsKPiAgIAl9Cj4gICAKPiAtbW92ZWQ6Cj4gICAJYm8tPmV2
aWN0ZWQgPSBmYWxzZTsKPiAgIAo+ICAgCWN0eC0+Ynl0ZXNfbW92ZWQgKz0gYm8tPm51bV9wYWdl
cyA8PCBQQUdFX1NISUZUOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
