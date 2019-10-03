Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D8C99F3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A423A6E975;
	Thu,  3 Oct 2019 08:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7066F6E975
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:34:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r19so1548592wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 01:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=pI9C6ahl+nbQHPAC35dp9wq8rqxSsDDWofoWIyRDkLM=;
 b=GyprUSRRHMl9f6ci9rgUhwh2KqZD3A/UPIl93/Gl73GqE4oyEwQMoy3oPpGp/PBonh
 GRgqpi3WumS49v+yM0QEHfy9u+CLFJz3zcaR4K5VYpykeaPIXMMEoTv/tg0F6KnIgk/c
 HwC+ZYUn+XMHpRicDGLlmn07Fc31pMULjriQkxeTsMeg24KeyFejBRlrrkCjB0My8Y7l
 vfCWcO9IStFvW8kAtIaG4pHzvt4FPdTumIDPYlPf1Mdq4eJ0hL/cYcdJ5UA2gekx606R
 57X4U3Myt0h4aSAkvOYmI09t8942Xty2RIIRnz3ypzRXdQ+Galtn2nkIZl70ysJJwGZg
 +A0A==
X-Gm-Message-State: APjAAAWfi2hiuE+3dgiWg9XfWD9qA2sVSw3QrZWnqhfIE8HnPnRqw2tU
 NVErslp7GpwH4rSWYPvVAZ0tgw==
X-Google-Smtp-Source: APXvYqw4bv6iyI1N5Z9utskDI3+DaWWDjbAcHP6jbcMIYZDH9RbG+kUfYFbm+NrAdKLO8R+/Yht+8Q==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr6042506wmi.151.1570091661782; 
 Thu, 03 Oct 2019 01:34:21 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 x129sm2591475wmg.8.2019.10.03.01.34.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Oct 2019 01:34:20 -0700 (PDT)
Subject: Re: drm_sched with panfrost crash on T820
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 Hillf Danton <hdanton@sina.com>
References: <e450fbe6-dec7-2704-59c2-db7e869d67f5@baylibre.com>
 <f0ab487e-8d49-987b-12b8-7a115a6543e1@amd.com>
 <20190930145228.14000-1-hdanton@sina.com>
 <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <7339b7a1-2d1c-4379-89a0-daf8b28d81c8@baylibre.com>
Date: Thu, 3 Oct 2019 10:34:19 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <d2888614-8644-7d04-b73b-3ab7c6623e9a@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=pI9C6ahl+nbQHPAC35dp9wq8rqxSsDDWofoWIyRDkLM=;
 b=zTchbkJbgDTpNLzYwpdrWTE/gd+vuOPqap7nsSbbZ7+8Ec77H1VBaUDGtFpxoA8Wsy
 rO2dvutBNGUKTXyH+TJSnv6zLMGC8UBJjbZ/DzCH3ko9E+3EEUAZNvxBnKTjImTxKGHg
 dFid8JAY3zOjgb0NKCgxcHpbwJXFBuGJR2nOeNlybSaS3hFq9eIa1e8Diqpp1nosCmjz
 GNr1KuzN7K3FCz0nMCInp5KFNv0xH8+1uC1g3VYS9Qm449WqeUoPFBSFasSQLUn/U4eM
 tBhXWmFRC05WZo/hqCw1XiR8CdQT8uhC6ekLnd1hwADf8pIesbTUpa81F+D60JXHYCOC
 xmzg==
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5kcmV5LAoKTGUgMDIvMTAvMjAxOSDDoCAxNjo0MCwgR3JvZHpvdnNreSwgQW5kcmV5IGEg
w6ljcml0IDoKPiAKPiBPbiA5LzMwLzE5IDEwOjUyIEFNLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4+
IE9uIE1vbiwgMzAgU2VwIDIwMTkgMTE6MTc6NDUgKzAyMDAgTmVpbCBBcm1zdHJvbmcgd3JvdGU6
Cj4+PiBEaWQgYSBuZXcgcnVuIGZyb20gNS4zOgo+Pj4KPj4+IFsgICAzNS45NzE5NzJdIENhbGwg
dHJhY2U6Cj4+PiBbICAgMzUuOTc0MzkxXSAgZHJtX3NjaGVkX2luY3JlYXNlX2thcm1hKzB4NWMv
MHhmMAo+Pj4gCQkJZmZmZjAwMDAxMDY2N2YzOAlGRkZGMDAwMDEwNjY3Rjk0Cj4+PiAJCQlkcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYzozMzUKPj4+Cj4+PiBUaGUgY3Jhc2hp
bmcgbGluZSBpcyA6Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmFk
LT5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA9PQo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVudGl0eS0+ZmVuY2VfY29udGV4dCkgewo+Pj4KPj4+IERvZXNuJ3Qg
c2VlbSByZWxhdGVkIHRvIGd1aWx0eSBqb2IuCj4+IEJhaWwgb3V0IGlmIHNfZmVuY2UgaXMgbm8g
bG9uZ2VyIGZyZXNoLgo+Pgo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+
PiBAQCAtMzMzLDYgKzMzMywxMCBAQCB2b2lkIGRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYShzdHJ1
Y3QgZHJtCj4+ICAgCj4+ICAgCQkJc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+ICAgCQkJbGlzdF9m
b3JfZWFjaF9lbnRyeV9zYWZlKGVudGl0eSwgdG1wLCAmcnEtPmVudGl0aWVzLCBsaXN0KSB7Cj4+
ICsJCQkJaWYgKCFzbXBfbG9hZF9hY3F1aXJlKCZiYWQtPnNfZmVuY2UpKSB7Cj4+ICsJCQkJCXNw
aW5fdW5sb2NrKCZycS0+bG9jayk7Cj4+ICsJCQkJCXJldHVybjsKPj4gKwkJCQl9Cj4+ICAgCQkJ
CWlmIChiYWQtPnNfZmVuY2UtPnNjaGVkdWxlZC5jb250ZXh0ID09Cj4+ICAgCQkJCSAgICBlbnRp
dHktPmZlbmNlX2NvbnRleHQpIHsKPj4gICAJCQkJCWlmIChhdG9taWNfcmVhZCgmYmFkLT5rYXJt
YSkgPgo+PiBAQCAtNTQzLDcgKzU0Nyw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2pvYl9p
bml0KTsKPj4gICB2b2lkIGRybV9zY2hlZF9qb2JfY2xlYW51cChzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqam9iKQo+PiAgIHsKPj4gICAJZG1hX2ZlbmNlX3B1dCgmam9iLT5zX2ZlbmNlLT5maW5pc2hl
ZCk7Cj4+IC0Jam9iLT5zX2ZlbmNlID0gTlVMTDsKPj4gKwlzbXBfc3RvcmVfcmVsZWFzZSgmam9i
LT5zX2ZlbmNlLCAwKTsKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfam9iX2Ns
ZWFudXApOwo+IAoKVGhpcyBmaXhlZCB0aGUgcHJvYmxlbSBvbiB0aGUgMTAgQ0kgcnVucy4KCk5l
aWwKCj4gCj4gRG9lcyB0aGlzIGNoYW5nZSBoZWxwIHRoZSBwcm9ibGVtID8gTm90ZSB0aGF0IGRy
bV9zY2hlZF9qb2JfY2xlYW51cCBpcyAKPiBjYWxsZWQgZnJvbSBzY2hlZHVsZXIgdGhyZWFkIHdo
aWNoIGlzIHN0b3BwZWQgYXQgYWxsIHRpbWVzIHdoZW4gd29ya190ZHIgCj4gdGhyZWFkIGlzIHJ1
bm5pbmcgYW5kIGFueXdheSB0aGUgJ2JhZCcgam9iIGlzIHN0aWxsIGluIHRoZSAKPiByaW5nX21p
cnJvcl9saXN0IHdoaWxlIGl0J3MgYmVpbmcgYWNjZXNzZWQgZnJvbSAgCj4gZHJtX3NjaGVkX2lu
Y3JlYXNlX2thcm1hIHNvIEkgZG9uJ3QgdGhpbmsgZHJtX3NjaGVkX2pvYl9jbGVhbnVwIGNhbiBi
ZSAKPiBjYWxsZWQgZm9yIGl0IEJFRk9SRSBvciB3aGlsZSBkcm1fc2NoZWRfaW5jcmVhc2Vfa2Fy
bWEgaXMgZXhlY3V0ZWQuCj4gCj4gQW5kcmV5Cj4gCj4gCj4+ICAgCj4+IC0tCj4+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
