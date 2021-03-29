Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB434D68D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 20:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE766E4A2;
	Mon, 29 Mar 2021 18:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF336E4A1;
 Mon, 29 Mar 2021 18:04:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id bx7so15198242edb.12;
 Mon, 29 Mar 2021 11:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=91f+t4KKqAvvbgMruzc8afBLkhYSXYPNhwopXJ4FvVA=;
 b=p6FRuPHxYfTgUMm71UKWithIReDTZW6SeruOWNV5sOveBvkwcHbRXfHKWUKErqFjv4
 VnseLfIZ+uJXbhBFCOgoZiIF2USLUIHX8guz67aa7SeGe11LtVAGOftJ8rpQYzABxZv0
 NBGKe3elev+KxtqxnS/kfj6uTohaKbXdcMYSJgcmQP/m93VQC0iZ5hAhIGx0Vm3NOhd/
 fz6BPNiXsw7YJn8r+AIL+RtgZ1wnaaiCC4DYk44V8NMxun+pnLMhD/XuSL9iBWztZI3T
 dFVtrMO23I9KORs2uL48iAYqFmQXkBmVF0QeRvWJntphdGHVrrY0CyCA0WqebLbC+C2w
 k8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=91f+t4KKqAvvbgMruzc8afBLkhYSXYPNhwopXJ4FvVA=;
 b=gBR1TfI3OgWeYYe+TaVAw+wK6jWDM0bXSuVJMMVTf8p1o5NyK7du5lTyNTSDIVfiM7
 N5thgCqVvB4NxgojCxUS/SOCaWJNtpl41YHPNRU6aerwK+WhIDWI2JzniI0SNrsGMXOi
 cLc8H4ytObgGUku9lx+X1Mku3VquP4e9Bk9yrKv5QMIBdTX6WOf7iQEY+PJTpLzbwAuN
 Z5leIj3emIO/faSln9cFYq7joEP1G6f21UC8in2JW01vXllSekCNH2cLIkS+wQUPth8r
 6hMh8j27K0zUj+aHtzDKE0Yy8Bzt9ZfqI5FZqNvswqpdun5X4pqmJW0a9eWymvAfawOI
 +42g==
X-Gm-Message-State: AOAM5337gXrIPx1hgEo7rTG8Xbm6KbHNbRMbpw0s1x3L+zeE9fsNLGEb
 cKaSOjHmQCh+/7iNmbhA9xo=
X-Google-Smtp-Source: ABdhPJySGC280M1HDveYNoXLySwn5Qy7wl8t1bmn1rG2whFdiva4yYtWd0vkZ3aI0+Zv6ITZX6kE+Q==
X-Received: by 2002:aa7:db53:: with SMTP id n19mr30446881edt.330.1617041041521; 
 Mon, 29 Mar 2021 11:04:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8415:4d1c:ad0a:e8fd?
 ([2a02:908:1252:fb60:8415:4d1c:ad0a:e8fd])
 by smtp.gmail.com with ESMTPSA id cf4sm9446313edb.19.2021.03.29.11.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 11:04:01 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
To: =?UTF-8?B?WOKEuSBSdW95YW8=?= <xry111@mengyan1223.wang>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
Date: Mon, 29 Mar 2021 20:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329175348.26859-1-xry111@mengyan1223.wang>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Dan_Hor=c3=a1k?= <dan@danny.cz>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDMuMjEgdW0gMTk6NTMgc2NocmllYiBY4oS5IFJ1b3lhbzoKPiBJZiB0aGUgaW5pdGlh
bCB2YWx1ZSBvZiBgbnVtX2VudGlyZXNgIChjYWxjdWxhdGVkIGF0IGxpbmUgMTY1NCkgaXMgbm90
Cj4gYW4gaW50ZWdyYWwgbXVsdGlwbGUgb2YgYEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0Vg
LCBpbiBsaW5lIDE2ODEgYQo+IHZhbHVlIGdyZWF0ZXIgdGhhbiB0aGUgaW5pdGlhbCB2YWx1ZSB3
aWxsIGJlIGFzc2lnbmVkIHRvIGl0LiAgVGhhdCBjYXVzZXMKPiBgc3RhcnQgPiBsYXN0ICsgMWAg
YWZ0ZXIgbGluZSAxNzA4LiAgVGhlbiBpbiB0aGUgbmV4dCBpdGVyYXRpb24gYW4KPiB1bmRlcmZs
b3cgaGFwcGVucyBhdCBsaW5lIDE2NTQuICBJdCBjYXVzZXMgbWVzc2FnZQo+Cj4gICAgICAqRVJS
T1IqIENvdWxkbid0IHVwZGF0ZSBCT19WQSAoLTEyKQo+Cj4gcHJpbnRlZCBpbiBrZXJuZWwgbG9n
LCBhbmQgR1BVIGhhbmdpbmcuCj4KPiBGb3J0aWZ5IHRoZSBjcml0ZXJpYSBvZiB0aGUgbG9vcCB0
byBmaXggdGhpcyBpc3N1ZS4KCk5BSyB0aGUgdmFsdWUgb2YgbnVtX2VudHJpZXMgbXVzdCBhbHdh
eXMgYmUgYSBtdWx0aXBsZSBvZiAKQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSBvciBvdGhl
cndpc2Ugd2UgY29ycnVwdCB0aGUgcGFnZSB0YWJsZXMuCgpIb3cgZG8geW91IHRyaWdnZXIgdGhh
dD8KCkNocmlzdGlhbi4KCj4KPiBCdWdMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvZHJtL2FtZC8tL2lzc3Vlcy8xNTQ5Cj4gRml4ZXM6IGEzOWYyYThkNzA2NiAoImRybS9hbWRn
cHU6IG51a2UgYW1kZ3B1X3ZtX2JvX3NwbGl0X21hcHBpbmcgdjIiKQo+IFJlcG9ydGVkLWJ5OiBY
aSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgo+IFJlcG9ydGVkLWJ5OiBEYW4gSG9y
w6FrIDxkYW5AZGFubnkuY3o+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAyICstCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4gaW5kZXggYWQ5MWMwYzNjNDIzLi5jZWUwY2M5YzgwODUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IEBAIC0xNzA3LDcgKzE3
MDcsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKPiAgIAkJfQo+ICAgCQlzdGFydCA9IHRtcDsKPiAgIAo+IC0JfSB3
aGlsZSAodW5saWtlbHkoc3RhcnQgIT0gbGFzdCArIDEpKTsKPiArCX0gd2hpbGUgKHVubGlrZWx5
KHN0YXJ0IDwgbGFzdCArIDEpKTsKPiAgIAo+ICAgCXIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5jb21t
aXQoJnBhcmFtcywgZmVuY2UpOwo+ICAgCj4KPiBiYXNlLWNvbW1pdDogYTVlMTNjNmRmMGU0MTcw
MmQyYjJjNzdjOGFkNDE2NzdlYmIwNjViMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
