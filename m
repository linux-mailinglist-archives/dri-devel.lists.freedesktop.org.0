Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DEC317140
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 21:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282076ECD5;
	Wed, 10 Feb 2021 20:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6886ECD5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 20:23:55 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lg21so6480092ejb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uUEijRUvAm4Lid1A8ZI4kF3GIJ7C2RVsucz6tdFm6Kc=;
 b=C0tO1YRfRV1FP2h034lqWgl/dZF1diQcHJVv/wPyC9+/Y9oL5Rhq9Yxry/cg+/mSg3
 rrgn7EOV6x1cjv7gjTtETkEkmNbGTRSZHcmGus9AYrFne4ZiAm5pio8c4pgs1vN0r2qI
 VgK3JM3vqImEaimi2IIS4FWIVkJYjZE6Oe2pwQrggdh7mib7Xzb/puG3DFLfzOy+H3Wi
 5/cX0FH8xn7YTOf/u7V0XRIYliRIzV6TnhrjnMSi8IKy7YXQ2bK7Bl28nLUF/DwSHg25
 LfFSP5aTj8sjXHDgv4ymxXhM/IXh8buf25Up8tDAhp4WI614YmV+w+WmoBuQvQVVrX+a
 u3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uUEijRUvAm4Lid1A8ZI4kF3GIJ7C2RVsucz6tdFm6Kc=;
 b=g6UDGmxS9tVoifwrpSH9nIsvfUrbaC0NarzbKVFHnZJHQxj0tm5BQQVoPrvzF1Az/Z
 fQIJyvfn9sU7puMrygXhDLGJ9sLDeZCKAeXsjqupQ2bD0lqLeiu6SS+qHVvEXITIJm00
 zG+0P8Pp6bUcv4oGrH8s7mFdOyYiYNLwITK/8JG1Jj2J+kKel+gwF0X0qfvujEWA7ipW
 malYGD/MDcgPb9WCtqPI0hy6fgZQhRsLuYWcT/77OJB27+KrMFZgo89FZAS2bqdDdRrK
 1EOOhFYpe1pfqri5lY+KowJ6p68SCSAL9KpSORhhkMekwbTZzvN0oYZnYTfke7cAISIk
 +qxw==
X-Gm-Message-State: AOAM531Zf5wDAO+opEvrwJR1qsp6LlVBqlDc0Ws/laWWlk9UxWe/v/Nm
 RxmLvR7Sl1PmNf582rLZRrU=
X-Google-Smtp-Source: ABdhPJynSDSTBP9PPLhOIBCWuSYvB7XIzdmMI7UjRoeIhKSy6LqY/+LQztrhdBFs7YO5lpWEN3sPjA==
X-Received: by 2002:a17:907:7811:: with SMTP id
 la17mr4532798ejc.436.1612988634234; 
 Wed, 10 Feb 2021 12:23:54 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:834b:fea0:7851:d7c?
 ([2a02:908:1252:fb60:834b:fea0:7851:d7c])
 by smtp.gmail.com with ESMTPSA id ar9sm2490948ejc.32.2021.02.10.12.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 12:23:53 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: make sure pool pages are cleared
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210210160549.1462-1-christian.koenig@amd.com>
 <CAKMK7uHYoxc81QW+gDTVVaXdKizSLogr_TfzWyL_8caOx+0JgA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6ea6a18b-e7df-ce8c-903d-a5edd6ef85b6@gmail.com>
Date: Wed, 10 Feb 2021 21:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHYoxc81QW+gDTVVaXdKizSLogr_TfzWyL_8caOx+0JgA@mail.gmail.com>
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
Cc: Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 efault@gmx.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMC4wMi4yMSB1bSAxOToxNSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gV2VkLCBG
ZWIgMTAsIDIwMjEgYXQgNTowNSBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0
enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4gVGhlIG9sZCBpbXBsZW1lbnRhdGlvbiB3YXNu
J3QgY29uc2lzdGVuZCBvbiB0aGlzLgo+Pgo+PiBCdXQgaXQgbG9va3MgbGlrZSB3ZSBkZXBlbmQg
b24gdGhpcyBzbyBiZXR0ZXIgYnJpbmcgaXQgYmFjay4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiBSZXBvcnRlZC1hbmQt
dGVzdGVkLWJ5OiBNaWtlIEdhbGJyYWl0aCA8ZWZhdWx0QGdteC5kZT4KPj4gRml4ZXM6IGQwOTlm
YzhmNTQwYSAoImRybS90dG06IG5ldyBUVCBiYWNrZW5kIGFsbG9jYXRpb24gcG9vbCB2MyIpCj4g
V2VsbCBJIHRoaW5rIGluIGdlbmVyYWwgdGhlcmUncyBhIGJpdCBhbiBpc3N1ZSBpbiB0dG0gd2l0
aCBub3QKPiBjbGVhcmluZyBzdHVmZiBldmVyeXdoZXJlLiBTbyBkZWZpbml0ZWx5IGluIGZhdm91
ciBvZiBjbGVhcmluZyBzdHVmZi4KPiBMb29raW5nIGF0IHRoZSBjb2RlIHRoaXMgb25seSBmaXhl
cyB0aGUgY2xlYXJpbmcsIGF0IGFsbG9jIHRpbWUgd2UncmUKPiBzdGlsbCB2ZXJ5IG9wdGlvbmFs
IHdpdGggY2xlYXJpbmcuIEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3Qgc2V0Cj4gX19HRlBfWkVSTyB1
bmNvbmRpdGlvbmFsbHkgdGhlcmUgdG9vLgoKTm8sIHRoZSBhbGxvYyBoYW5kbGluZyBpcyBhY3R1
YWxseSBjb3JyZWN0LgoKV2UgYXJlIGNsZWFyaW5nIG9ubHkgd2hlbiB3ZSBhbGxvY2F0ZSBwYWdl
cyBmb3IgdXNlcnNwYWNlLiBOb3QgZm9yIHRoZSAKa2VybmVsIG5vciBmb3IgZXZpY3Rpb24gd2hl
biBwYWdlcyBhcmUgb3ZlcndyaXR0ZW4gYW55d2F5LgoKVGhlIGtleSBwb2ludCBpcyB0aGF0IHRo
ZSBvbGQgcGFnZSBwb29sIHdhcyBpZ25vcmluZyB0aGUgZmxhZyBmb3IgdGhpcyAKaW4gc29tZSBj
b2RlIHBhdGhzIGFuZCBJIHdhc24ndCBzdXJlIGlmIHRoYXQncyBzdGlsbCBuZWNlc3Nhcnkgb3Ig
bm90LgoKVHVybmVkIG91dCBpdCB3YXMgbmVjZXNzYXJ5IGFmdGVyIGFsbC4KClRoYW5rcywKQ2hy
aXN0aWFuLgoKPgo+IFdpdGggdGhhdDogUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cG9vbC5jIHwgMTAgKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPj4gaW5kZXggNzRiZjFjODRiNjM3Li42ZTI3
Y2IxYmY0OGIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPj4gQEAgLTMzLDYgKzMzLDcg
QEAKPj4KPj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4
L2RtYS1tYXBwaW5nLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+Pgo+PiAgICNp
ZmRlZiBDT05GSUdfWDg2Cj4+ICAgI2luY2x1ZGUgPGFzbS9zZXRfbWVtb3J5Lmg+Cj4+IEBAIC0y
MTgsNiArMjE5LDE1IEBAIHN0YXRpYyB2b2lkIHR0bV9wb29sX3VubWFwKHN0cnVjdCB0dG1fcG9v
bCAqcG9vbCwgZG1hX2FkZHJfdCBkbWFfYWRkciwKPj4gICAvKiBHaXZlIHBhZ2VzIGludG8gYSBz
cGVjaWZpYyBwb29sX3R5cGUgKi8KPj4gICBzdGF0aWMgdm9pZCB0dG1fcG9vbF90eXBlX2dpdmUo
c3RydWN0IHR0bV9wb29sX3R5cGUgKnB0LCBzdHJ1Y3QgcGFnZSAqcCkKPj4gICB7Cj4+ICsgICAg
ICAgdW5zaWduZWQgaW50IGksIG51bV9wYWdlcyA9IDEgPDwgcHQtPm9yZGVyOwo+PiArCj4+ICsg
ICAgICAgZm9yIChpID0gMDsgaSA8IG51bV9wYWdlczsgKytpKSB7Cj4+ICsgICAgICAgICAgICAg
ICBpZiAoUGFnZUhpZ2hNZW0ocCkpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsZWFyX2hp
Z2hwYWdlKHAgKyBpKTsKPj4gKyAgICAgICAgICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY2xlYXJfcGFnZShwYWdlX2FkZHJlc3MocCArIGkpKTsKPj4gKyAgICAgICB9Cj4+
ICsKPj4gICAgICAgICAgc3Bpbl9sb2NrKCZwdC0+bG9jayk7Cj4+ICAgICAgICAgIGxpc3RfYWRk
KCZwLT5scnUsICZwdC0+cGFnZXMpOwo+PiAgICAgICAgICBzcGluX3VubG9jaygmcHQtPmxvY2sp
Owo+PiAtLQo+PiAyLjI1LjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
