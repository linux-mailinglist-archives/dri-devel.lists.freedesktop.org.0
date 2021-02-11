Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D113318F57
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 17:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A256EE54;
	Thu, 11 Feb 2021 16:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F04A6EE54
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 16:04:48 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id t5so7455873eds.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 08:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+8nzVvhvn6fHaXRSAqdpbj00caaTjqJoc5fHwVKcFuI=;
 b=Qb+C+82QKByysuPGH49AaRvfNYf1ELw5sATxedKBXn9c1aU9KzpIJzVPg/pB/VaD8G
 lKi2PldMCF3ECKGSZh3v+9BLaxOf39xUh+3szOVNUcbVmeDQvwrEb7RS3AzrVU7wvGv2
 KeECuvkAVIZ8r8YqxmkeeX6jeKDwQuUHGWK7p4o+xOk25VGoW5S7mt6K8Gq83MflvSxE
 LEfvZ5xYkSVDV53vDbRlIBNnck9onSW3ewy2Nicf+JT/W2nXgurmoZTkneXSqJL/77om
 4hclp+j1mkO0xe1vp0h7i1Gc3OoUBzTRKe/ZV5mYgMJQqm965Se8Q5ooJjU5qQBD472C
 InmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+8nzVvhvn6fHaXRSAqdpbj00caaTjqJoc5fHwVKcFuI=;
 b=QkUG/3vBqlYD/5gTP+DGTuPYBvVazzOqIxZ76wptLqBU7dMOFX7LilHkb6sP7LCcML
 VGIxxUGtHkTlaki54YgVoxHUdi92148K1ldKIcLOTnMCpEM5Cyg+pl4f+xX9Bcc3mdPh
 mWkY6fcaj8s7+S9G0avxOMrDRNQyv9fHyj2XWwXuSOVj8PwvhCXpoewC8v/XOfHLs+0q
 XZnN5lG0hElSGLGLRzUKjpKJuFtoukmnVxXbye6iuXlPwhxDpoz1WekKMizQX/m4t5GJ
 lSOC6y4bQ0SwDaZBzlpQ0qnDaeKFEy2AzlM6egWhNzmAPr+kGdCz5iMwVMulRxlArGTL
 Vemw==
X-Gm-Message-State: AOAM533cNmGAHwd/WeeEXBv97IS7cZBFADPUDk7dMfR/kl+EHlvfTeEN
 4gzU6vMqSsPlr7mzoXmua9o=
X-Google-Smtp-Source: ABdhPJxZFb7nOdftfGC0ZSoSAnsGafnhoNMKlThpzjPeOY7IIiqCGjMB5xQJaukdUi7Wd/C9fZuOgg==
X-Received: by 2002:aa7:d3c7:: with SMTP id o7mr8970830edr.23.1613059487080;
 Thu, 11 Feb 2021 08:04:47 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:128e:c59b:ac8b:316f?
 ([2a02:908:1252:fb60:128e:c59b:ac8b:316f])
 by smtp.gmail.com with ESMTPSA id ha21sm5104787ejb.97.2021.02.11.08.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 08:04:46 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: make sure pool pages are cleared
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210210160549.1462-1-christian.koenig@amd.com>
 <CAKMK7uHYoxc81QW+gDTVVaXdKizSLogr_TfzWyL_8caOx+0JgA@mail.gmail.com>
 <6ea6a18b-e7df-ce8c-903d-a5edd6ef85b6@gmail.com>
 <YCVUDYYQJ4PtwzVI@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <be27c04f-bb27-fab2-a4d6-c5f9b2d9ea0c@gmail.com>
Date: Thu, 11 Feb 2021 17:04:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YCVUDYYQJ4PtwzVI@phenom.ffwll.local>
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

CgpBbSAxMS4wMi4yMSB1bSAxNjo1OCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gT24gV2VkLCBG
ZWIgMTAsIDIwMjEgYXQgMDk6MjM6NTJQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4KPj4gQW0gMTAuMDIuMjEgdW0gMTk6MTUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4gT24g
V2VkLCBGZWIgMTAsIDIwMjEgYXQgNTowNSBQTSBDaHJpc3RpYW4gS8O2bmlnCj4+PiA8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IFRoZSBvbGQgaW1wbGVtZW50
YXRpb24gd2Fzbid0IGNvbnNpc3RlbmQgb24gdGhpcy4KPj4+Pgo+Pj4+IEJ1dCBpdCBsb29rcyBs
aWtlIHdlIGRlcGVuZCBvbiB0aGlzIHNvIGJldHRlciBicmluZyBpdCBiYWNrLgo+Pj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pgo+Pj4+IFJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6IE1pa2UgR2FsYnJhaXRoIDxlZmF1bHRAZ214
LmRlPgo+Pj4+IEZpeGVzOiBkMDk5ZmM4ZjU0MGEgKCJkcm0vdHRtOiBuZXcgVFQgYmFja2VuZCBh
bGxvY2F0aW9uIHBvb2wgdjMiKQo+Pj4gV2VsbCBJIHRoaW5rIGluIGdlbmVyYWwgdGhlcmUncyBh
IGJpdCBhbiBpc3N1ZSBpbiB0dG0gd2l0aCBub3QKPj4+IGNsZWFyaW5nIHN0dWZmIGV2ZXJ5d2hl
cmUuIFNvIGRlZmluaXRlbHkgaW4gZmF2b3VyIG9mIGNsZWFyaW5nIHN0dWZmLgo+Pj4gTG9va2lu
ZyBhdCB0aGUgY29kZSB0aGlzIG9ubHkgZml4ZXMgdGhlIGNsZWFyaW5nLCBhdCBhbGxvYyB0aW1l
IHdlJ3JlCj4+PiBzdGlsbCB2ZXJ5IG9wdGlvbmFsIHdpdGggY2xlYXJpbmcuIEkgdGhpbmsgd2Ug
c2hvdWxkIGp1c3Qgc2V0Cj4+PiBfX0dGUF9aRVJPIHVuY29uZGl0aW9uYWxseSB0aGVyZSB0b28u
Cj4+IE5vLCB0aGUgYWxsb2MgaGFuZGxpbmcgaXMgYWN0dWFsbHkgY29ycmVjdC4KPj4KPj4gV2Ug
YXJlIGNsZWFyaW5nIG9ubHkgd2hlbiB3ZSBhbGxvY2F0ZSBwYWdlcyBmb3IgdXNlcnNwYWNlLiBO
b3QgZm9yIHRoZQo+PiBrZXJuZWwgbm9yIGZvciBldmljdGlvbiB3aGVuIHBhZ2VzIGFyZSBvdmVy
d3JpdHRlbiBhbnl3YXkuCj4+Cj4+IFRoZSBrZXkgcG9pbnQgaXMgdGhhdCB0aGUgb2xkIHBhZ2Ug
cG9vbCB3YXMgaWdub3JpbmcgdGhlIGZsYWcgZm9yIHRoaXMgaW4KPj4gc29tZSBjb2RlIHBhdGhz
IGFuZCBJIHdhc24ndCBzdXJlIGlmIHRoYXQncyBzdGlsbCBuZWNlc3Nhcnkgb3Igbm90Lgo+Pgo+
PiBUdXJuZWQgb3V0IGl0IHdhcyBuZWNlc3NhcnkgYWZ0ZXIgYWxsLgo+IFNvbWVob3cgbXkgZ2l0
IGdyZXAgd2VudCB3cm9uZyBhbmQgSSBkaWRuJ3QgZmluZCB0aGUgdXNlcnMuIFlvdSdyZSByaWdo
dCwKPiBhbmQgSSBsZWFybmVkIGEgZmV3IHRoaW5ncyBtb3JlIDotKQo+Cj4gSSdtIGtpbmRhIHdv
bmRlcmluZywgc2hvdWxkIHdlIHBlcmhhcHMgbW92ZSB0aGUgY2xlYXJpbmcgdG8gdGhlIHVzZSBz
aWRlLAo+IGFuZCB0aGVuIG9ubHkgZG8gd2hlbiByZXF1aXJlZD8gTWlnaHQgYWxsb3cgdXMgdG8g
c2F2ZSBpdCBxdWl0ZSBhIGZldwo+IHRpbWVzIHdoZW4gd2UncmUgdGhyYXNoaW5nIGFyb3VuZCBi
dWZmZXJzIGluL291dCBvZiB2cmFtLCBhdCB0aGUgY29zdCBvZgo+IG1vdmluZyBpdCB0byB0aGUg
YWxsb2Mgc2lkZSBmb3Igb3RoZXIgY2FzZXMuCgpJIHdhcyBwbGF5aW5nIHdpdGggdGhhdCBpZGVh
IGluIG15IG1pbmQgYXMgd2VsbC4KClRoZSBrZXkgYXJndW1lbnQgYWdhaW5zdCBpdCBpcyB0aGF0
IHRoZSBwb29sIGNhbiBvcHRpbWl6ZSBieSBjbGVhcmluZyBvbiAKZnJlZSBpbnN0ZWFkIG9mIGR1
cmluZyBhbGxvY2F0aW9uLgoKVGhpcyB3YXkgd2UgYWxzbyBpbXBsZW1lbnQgYSBiaXQgaGV1cmlz
dGljIGluIHRoZSBwb29sIGFuZCBoYXZlIGEgbGlzdCAKb2YgY2xlYXJlZCBhbmQgbm90IGNsZWFy
ZWQgcGFnZXMuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gSnVzdCBhbiBpZGVhLgo+IC1EYW5p
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
