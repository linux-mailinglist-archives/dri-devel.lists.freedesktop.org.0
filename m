Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EEE26561
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42FE89A8C;
	Wed, 22 May 2019 14:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676F589A8B;
 Wed, 22 May 2019 14:08:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y3so2399843wmm.2;
 Wed, 22 May 2019 07:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l9tt9QGc6Bp92n1KiO9WVx9PEjdT55lWsd07JFziKiY=;
 b=N1MO7ui3wmV0rDB+RJW09hjakOemTFt6W/j8SqLh3lVsdUN+FItLmx5jHLIRsEUhoc
 EfuUhzVoku12WtzCrChtpFyi2EgZdJ9o4IXXGEDtlA3mc6UjcHghxkWOXP1TXjD8jrVQ
 mgmwRJkGNvDX1Ji+Q3plfLI7GIXPFhzZPid8TNULA6W8eXMeVEGcep0C85vWtn07bEaI
 a1tWBZQa0HmJtkecoFUxSVyg0XLLRb3WZsq5+1JqslXxmc9solmYsx9t5JbkaFYGiK8c
 F4Uy4N4xXPpDT8+452gc5qjS/ZczWeOfGxj8q/5S2jXK5WFdo6y2xuYaCnX6EeWkmOUM
 3xDA==
X-Gm-Message-State: APjAAAUvoh3F6N2oHEQGEamrKl/xa3cZIGCJFHHR/OMb+IsOTgBHFxjU
 8iSlZqIdtHI/7orzcsa7n4PIeg5Z
X-Google-Smtp-Source: APXvYqz9g8MSnTf14k1/3xMlOUXTO/qRFdUmkNh3unFDlBlPejN7wEvFL2faLMK2EuI9qlvt0KVxqA==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr8241019wmj.46.1558534112175; 
 Wed, 22 May 2019 07:08:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z8sm22685305wrs.84.2019.05.22.07.08.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 07:08:30 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: Fix static checker warning for potential NULL
 ptr
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dan.carpenter@oracle.com
References: <1558533443-7795-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <307e40c1-a25a-42f4-4d19-cffdb521974e@gmail.com>
Date: Wed, 22 May 2019 16:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558533443-7795-1-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l9tt9QGc6Bp92n1KiO9WVx9PEjdT55lWsd07JFziKiY=;
 b=t+uoX5pMCUMIuQKAKZ82Uh9ZpnzDGe/OMhKeUUbG67oDQCD2Y9lzeBdXMGMVrZVDne
 2lZiofmjr46lEysNERHvbOy8go6JzL9/Z2EtbgXJPDuPO47x0oVNAIKTyUGlDWaZTBEv
 TbNXQpsAvXgmdPcToLyTLHmqadX3jQTomqhCIydrAhTAD+FZU6Wk01M+OlbBtCXYDiGK
 AiiVgTeXqpm+qn+wuYKVHEhrDv5Ul/7hrlMPR/smp/RO23Rc8hsH2ccSjoIqYOXwvm6Q
 YcWft7J6bc3YB+wVYaZrDtTAAom2m0yFL8dk41xyinB+ak+RKorFlFl2HBixrGhrN1KP
 1+Xw==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDUuMTkgdW0gMTU6NTcgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAxNyArKysr
KysrKystLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gaW5kZXgg
OTBkN2E4Mi4uZWM3ZmFjYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jCj4gQEAgLTI4NiwxNiArMjg2LDE3IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGlt
ZWRvdXQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAgCWpvYiA9IGxpc3RfZmlyc3RfZW50
cnlfb3JfbnVsbCgmc2NoZWQtPnJpbmdfbWlycm9yX2xpc3QsCj4gICAJCQkJICAgICAgIHN0cnVj
dCBkcm1fc2NoZWRfam9iLCBub2RlKTsKPiAgIAo+IC0JaWYgKGpvYikKPiArCWlmIChqb2IpIHsK
PiAgIAkJam9iLT5zY2hlZC0+b3BzLT50aW1lZG91dF9qb2Ioam9iKTsKPiAgIAo+IC0JLyoKPiAt
CSAqIEd1aWx0eSBqb2IgZGlkIGNvbXBsZXRlIGFuZCBoZW5jZSBuZWVkcyB0byBiZSBtYW51YWxs
eSByZW1vdmVkCj4gLQkgKiBTZWUgZHJtX3NjaGVkX3N0b3AgZG9jLgo+IC0JICovCj4gLQlpZiAo
c2NoZWQtPmZyZWVfZ3VpbHR5KSB7Cj4gLQkJam9iLT5zY2hlZC0+b3BzLT5mcmVlX2pvYihqb2Ip
Owo+IC0JCXNjaGVkLT5mcmVlX2d1aWx0eSA9IGZhbHNlOwo+ICsJCS8qCj4gKwkJICogR3VpbHR5
IGpvYiBkaWQgY29tcGxldGUgYW5kIGhlbmNlIG5lZWRzIHRvIGJlIG1hbnVhbGx5IHJlbW92ZWQK
PiArCQkgKiBTZWUgZHJtX3NjaGVkX3N0b3AgZG9jLgo+ICsJCSAqLwo+ICsJCWlmIChzY2hlZC0+
ZnJlZV9ndWlsdHkpIHsKPiArCQkJam9iLT5zY2hlZC0+b3BzLT5mcmVlX2pvYihqb2IpOwo+ICsJ
CQlzY2hlZC0+ZnJlZV9ndWlsdHkgPSBmYWxzZTsKPiArCQl9Cj4gICAJfQo+ICAgCj4gICAJc3Bp
bl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
