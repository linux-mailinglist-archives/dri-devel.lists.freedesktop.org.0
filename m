Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A95FF923
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3B6E373;
	Sun, 17 Nov 2019 11:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F926E49B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 11:39:57 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p18so10367622ljc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 03:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UmAi2H6KzYBMsHnO/QLE+PxP3dI7L9bn6T/LMsCVk58=;
 b=M1cK4+l5mTjiMj5kAQOeULS4pyDsFI7zYebdnobG8rFZveJfvSTciWuzbmi1gpnOxB
 d1ZJ3609OwUv5XMMoehcXT51BSP5MJnv2cZYWAUr0qf+AbCXoTCg+oCnr+iyXA+N8xCJ
 ib8UbSWj4e/vxF3SKh0BhOd9B47EG0aVZmEGpL+kizZvaUhA61HhfPZ07AoxNkJbmDP1
 eaAO7veYgCQM34GAm8QfttOLUMRe4MC4muVW0RAIeGNG0zo6YXW1UusVw73p+Vt3e4bn
 8gQtgKv+ulhNZbqHtWLnHftDopAEEwAHe/pL0NNqx0i+c1cL+QgvREqSnFdBhomaqXiJ
 8guw==
X-Gm-Message-State: APjAAAXkaCW1a32WCRoYCKLuSZjHJiWrK7dS/7xQsd2AibfDlHkDmkwK
 UB9+mrYBxndr/GhDC3bl7+o=
X-Google-Smtp-Source: APXvYqxw/RuX+HC0aay7/RhWP6COvieyS/R8ADY2Pgeb/UJPnoCtNftVN+PW0z9r8FrtZdTBXp08Rg==
X-Received: by 2002:a2e:9712:: with SMTP id r18mr11130390lji.12.1573817996154; 
 Fri, 15 Nov 2019 03:39:56 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id r22sm4067987lji.71.2019.11.15.03.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2019 03:39:55 -0800 (PST)
Subject: Re: [PATCH v2] drm/tegra: Turn off and reset hardware across
 suspend-resume
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190811183932.15850-1-digetx@gmail.com>
 <20191114203117.GA761559@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3b8e79ad-598c-f0f7-4589-00bb0acc1867@gmail.com>
Date: Fri, 15 Nov 2019 14:39:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191114203117.GA761559@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UmAi2H6KzYBMsHnO/QLE+PxP3dI7L9bn6T/LMsCVk58=;
 b=pUFG1AdqOH3wjtFFxLf+iHxJHmMCAwgWgYt+Kf3UyMAZ8bJihvtybvsikZGmmp112C
 Lpw3J8laa3CZUtx8wTHJAINyLMHI3B1wa6KPuYAJ9i1wsDm34ZXeacBUzobWMT2TFXVx
 appDjFnTPzXY3pC/qtpoxSZYWha+Xe0qEFthv24Zm1aGzVhCX9jCPHsdh+yI5Et/hSM4
 Ha/wxLHHxJ9z5P1/DkG4lij87MvGa1CpJ2mXBBXzE3PGJlkuayMX1e8pEp+B1IwfNv7p
 q4m9I5adKBIsEa8r//xd0qs9+FrMAR+0xOQdEb2gHugAYWx8j1sfvzNmmbbqU/nv6vO4
 FTjQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTQuMTEuMjAxOSAyMzozMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBTdW4sIEF1
ZyAxMSwgMjAxOSBhdCAwOTozOTozMlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IFRoZSBkcml2ZXJzIGNvcmUgYnVtcHMgcnVudGltZSBQTSByZWZjb3VudCBkdXJpbmcgb2YgZW50
ZXJpbmcgaW50bwo+PiBzdXNwZW5kIHRvIHdvcmthcm91bmQgc29tZSBwcm9ibGVtIHdoZXJlIHBh
cmVudCBkZXZpY2UgbWF5IGJlY29tZSB0dXJuZWQKPj4gb2ZmIGJlZm9yZSBpdHMgY2hpbGRyZW4u
IEluIG9yZGVyIHRvIGRpc2FibGUgYW5kIHJlc2V0IENSVENzL0hETUkvZXRjCj4+IGhhcmR3YXJl
LCB0aGUgcnVudGltZSBQTSBuZWVkcyB0byBiZSAiZm9yY2VkIiBpbnRvIHN1c3BlbmQgbW9kZS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+
PiAtLS0KPj4KPj4gQ2hhbmdlbG9nOgo+Pgo+PiB2MjogVGhlIFNZU1RFTV9TTEVFUF9QTV9PUFMg
YXJlIG5vdyBzZXQgZm9yIGFsbCBvZiB0aGUgcmVsZXZhbnQgZHJpdmVycyBhbmQKPj4gICAgIG5v
dCBvbmx5IGZvciB0aGUgREMgYmVjYXVzZSB0dXJuZWQgb3V0IHRoYXQgdGhleSBhbGwgc2hvdWxk
IGVuZm9yY2UgdGhlCj4+ICAgICBzdXNwZW5kaW5nLgo+Pgo+PiAgZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RjLmMgICAgfCAyICsrCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHBhdXguYyB8IDIg
KysKPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kc2kuYyAgIHwgMiArKwo+PiAgZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL2hkbWkuYyAgfCAyICsrCj4+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvaHVi
LmMgICB8IDIgKysKPj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgIHwgMiArKwo+PiAg
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jICAgfCAyICsrCj4+ICA3IGZpbGVzIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKykKPiAKPiBJJ20gbm90IGV4YWN0bHkgc3VyZSBJIHVuZGVyc3RhbmQg
d2h5IHRoaXMgaXMgbmVjZXNzYXJ5LiBSdW50aW1lIFBNIGlzCj4gY29udHJvbGxlZCBieSB0aGUg
ZHJpdmVycyB0aGVtc2VsdmVzIHNvIHRoYXQgd2hlbiBhbiBvdXRwdXQgKHNheSBTT1IpIGlzCj4g
ZGlzYWJsZWQsIGl0IGRyb3BzIHRoZSBydW50aW1lIFBNIHJlZmVyZW5jZS4gVGhlIGlkZWEgaXMg
dGhhdCBzaW5jZSB0aGUKPiBkaXNhYmxlZCBvdXRwdXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCBpdCBj
YW4ganVzdCBnbyBpbnRvIGEgbG93IHBvd2VyIG1vZGUKPiB3aGljaCBvbiBUZWdyYSB1c3VhbGx5
IG1lYW5zIGNsb2NrcyBvZmYgYW5kIHJlc2V0IGFzc2VydGVkIChhbmQgaW4gc29tZQo+IGNhc2Vz
IGFsc28gcG93ZXIgZG9tYWluIG9mZikuCj4gCj4gRFJNL0tNUyBoYXMgc3lzdGVtLWxldmVsIHN1
c3BlbmQgc3VwcG9ydCwgd2hpY2ggd2UgdXNlIHRvIGRpc2FibGUgYWxsCj4gb3V0cHV0cyB3aGVu
IGVudGVyaW5nIHN1c3BlbmQuIEkgc2VlIHRoYXQsIHVuZm9ydHVuYXRlbHksIHRoaXMgZG9lc24n
dAo+IHNlZW0gdG8gYWN0dWFsbHkgY2F1c2UgdGhlIGRldmljZXMgdG8gcnVudGltZSBzdXNwZW5k
LiBJJ20gcHJldHR5IHN1cmUKPiB0aGF0IHRoaXMgdXNlZCB0byB3b3JrIGF0IHNvbWUgcG9pbnQs
IHNvIEkgZG9uJ3Qga25vdyB3aGF0IGNoYW5nZWQuIEknZAo+IGhhdmUgdG8gbG9vayBpbnRvIHRo
aXMgYSBsaXR0bGUgbW9yZS4gVGhlIGNvcmUgZG9pbmcgc29tZXRoaW5nIGxpa2UgdGhpcwo+IGJl
aGluZCB0aGUgZHJpdmVyJ3MgYmFjayBzZWVtcyB3cm9uZyBhbmQgaGF2aW5nIHRvIGZvcmNlIHRo
ZSBkZXZpY2UgaW50bwo+IHN1c3BlbmQgbW9kZSBzZWVtcyBsaWtlIGl0J3MganVzdCBwaWxpbmcg
dXAgb24gdGhlIHdvcmthcm91bmRzLgoKUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSdsbCBmaW5k
IGEgYmV0dGVyIHNvbHV0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
