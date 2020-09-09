Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E054F2627CD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5C06E9CA;
	Wed,  9 Sep 2020 07:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB216E20F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 00:07:52 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a15so1200844ljk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gFlcAAsDYlhs7hF5vV+AU7U0ApBxXIpeXIiSma9GXmk=;
 b=KFXFjZSAwXE0q9Mf2nmdqQWHJH9yT8mLauIcyuKKYvLZdcJY1hun5ldhzItg637iZ7
 habRQQmIX8WufQWFOpy8/y82FWcRofi+dE3zjC4V/It7rpimTsjzTcITNCr1S5qD9pCG
 LCyAuFM0kEc0Hy/hy4ndmx0u7fnThZTQdgkCIwpQkuy9vmLB72EleN+gRA1hyD6VY9UZ
 C/NZnhxwQGVhFbDOYs0eAHSNMR7kaFhJOuX9hzeNHC024T5zlz0mlTrUqSgspTI1d0U+
 JoelaK/TIni03vcq9KSSpeRa4ynx29eGmrcZ5JQrq6xMV2wGk9uhTybrsKGmbAKvwwuE
 K4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gFlcAAsDYlhs7hF5vV+AU7U0ApBxXIpeXIiSma9GXmk=;
 b=NyrbDH1Gh5HnyCh3eVre/eUehw2YubYjzQWo1qjHdaRD3wKDnWqh54bKQuxXLQRqBY
 12fHNY0//qqUvqsoS0t9hMC2ttFLSgaLI8tRrRqvEvdVhUvk69+hr1iyuOmGgRIyeHqh
 LWADcEFkgpKw2S7gHDKh8F94DEua+9hEdnRMzkCWahdlMoantG7UL0nIFjZea/oLI6ao
 fp4ow9zpOCanRUax/dOCW4SZyMIE3ALsnIVZfgM6IbU4uST3Ls8+d57yYuZhFEjfFVj7
 kGdA9FcbnZ04MWAKAU8MsXaZ+d27R8vzHs0d3rax9AqsBJWila3TztiRmwyu0xjyZeZd
 deIQ==
X-Gm-Message-State: AOAM530R9Q4Dmp6YKp/A4oOXK9qG/Ej3lcu2BnQQufRXU4ypw5zGQvpq
 Xy4rXdtGoEQ4QumWV/71HC8=
X-Google-Smtp-Source: ABdhPJz/xD8b9NGav1Lg2Hmb7hJrJfoV9dAA/XK3ByW07jPq1QnTEGtLf8Hlca4oVxUarL2oa/b4AA==
X-Received: by 2002:a2e:b00e:: with SMTP id y14mr441571ljk.427.1599610071177; 
 Tue, 08 Sep 2020 17:07:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id 78sm212252lfn.20.2020.09.08.17.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 17:07:50 -0700 (PDT)
Subject: Re: [RFC PATCH v2 06/17] gpu: host1x: Cleanup and refcounting for
 syncpoints
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-7-mperttunen@nvidia.com>
 <913a625c-9630-92af-aba0-fdddf6bbdb29@gmail.com>
 <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a7213cd6-3bba-95a2-1f88-b8a64a5c2e87@gmail.com>
Date: Wed, 9 Sep 2020 03:07:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e9cce9d5-1a63-077e-1ca6-ac5d5112d5fe@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDkuMjAyMCAxNzo1MywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+PiBIZWxs
bywgTWlra28hCj4+Cj4+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRvIG9wZW4tY29kZSBhbGwg
dGhlIGhvc3QxeCBzdHJ1Y3RzIGJ5IG1vdmluZwo+PiB0aGVtIGFsbCBvdXQgaW50byB0aGUgcHVi
bGljIGxpbnV4L2hvc3QxeC5oPyBUaGVuIHdlIGNvdWxkIGlubGluZSBhbGwKPj4gdGhlc2UgdHJp
dmlhbCBzaW5nbGUtbGluZSBmdW5jdGlvbnMgYnkgaGF2aW5nIHRoZW0gZGVmaW5lZCBpbiB0aGUg
cHVibGljCj4+IGhlYWRlci4gVGhpcyB3aWxsIGF2b2lkIGFsbCB0aGUgdW5uZWNlc3Nhcnkgb3Zl
cmhlYWQgYnkgYWxsb3dpbmcKPj4gY29tcGlsZXIgdG8gb3B0aW1pemUgdGhlIGNvZGUgbmljZWx5
Lgo+Pgo+PiBPZiBjb3Vyc2UgdGhpcyBjb3VsZCBiZSBhIHNlcGFyYXRlIGNoYW5nZSBhbmQgaXQg
Y291bGQgYmUgZG9uZSBzb21ldGltZQo+PiBsYXRlciwgSSBqdXN0IHdhbnRlZCB0byBzaGFyZSB0
aGlzIHF1aWNrIHRob3VnaHQgZm9yIHRoZSBzdGFydCBvZiB0aGUKPj4gcmV2aWV3Lgo+Pgo+IAo+
IEhpIDopCj4gCj4gSSB0aGluayBmb3Igc3VjaCBtaWNyby1vcHRpbWl6YXRpb25zIHdlIHNob3Vs
ZCBoYXZlIGEgYmVuY2htYXJrIHRvCj4gZXZhbHVhdGUgYWdhaW5zdC4gSSdtIG5vdCBzdXJlIHdl
IGhhdmUgYWxsIHRoYXQgbWFueSBmdW5jdGlvbiBjYWxscyBpbnRvCj4gaGVyZSBvdmVyYWxsIHRo
YXQgaXQgd291bGQgbWFrZSBhIG5vdGljZWFibGUgZGlmZmVyZW5jZS4gSW4gYW55IGNhc2UsIGFz
Cj4geW91IHNhaWQsIEknZCBwcmVmZXIgdG8ga2VlcCBmdXJ0aGVyIHJlZmFjdG9yaW5nIHRvIGEg
c2VwYXJhdGUgc2VyaWVzIHRvCj4gYXZvaWQgZ3Jvd2luZyB0aGlzIHNlcmllcyB0b28gbXVjaC4K
ClRoZSBwZXJmb3JtYW5jZSBkaWZmZXJlbmNlIGRvZXNuJ3QgYm90aGVyIG1lLCBpdCBzaG91bGQg
YmUgaW5zaWduaWZpY2FudAppbiB0aGlzIHBhcnRpY3VsYXIgY2FzZS4gVGhlIGFtb3VudCBvZiB0
aGUgZXhwb3J0ZWQgZnVuY3Rpb25zIGlzIHdoYXQKbWFrZXMgbWUgZmVlbCB1bmNvbWZvcnRhYmxl
LCBhbmQgZXNwZWNpYWxseSB0aGF0IG1vc3Qgb2YgdGhvc2UgZnVuY3Rpb25zCmFyZSB0cml2aWFs
LgoKTXkgY29uY2VybiBpcyB0aGF0IGRvaW5nIGNsZWFudXBzIG9mIHRoZSB1cHN0cmVhbSBkcml2
ZXJzIHVzdWFsbHkgbm90CmVhc3kuIEhlbmNlIGl0IGNvdWxkIGJlIGEgZ29vZCB0aGluZyB0byBw
dXQgZWZmb3J0IGludG8gcmVzdHJ1Y3R1cmluZwp0aGUgY3VycmVudCBjb2RlIGJlZm9yZSBuZXcg
Y29kZSBpcyBhZGRlZC4gQnV0IGF0IGZpcnN0IHdlIG5lZWQgdG8gaGF2ZQphIGZ1bGwtZmVhdHVy
ZWQgZHJhZnQgaW1wbGVtZW50YXRpb24gdGhhdCB3aWxsIHNob3cgd2hhdCBwYXJ0cyBvZiB0aGUK
ZHJpdmVyIHJlcXVpcmUgcmVmYWN0b3JpbmcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
