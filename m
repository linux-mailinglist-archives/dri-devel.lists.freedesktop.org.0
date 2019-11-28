Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B1A10CD05
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD466E867;
	Thu, 28 Nov 2019 16:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4946E867
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:47:17 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id r24so22656781otk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 08:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xEF8388JpCWdGO3Z924sD6jEvM1dtRC0Ytr2Lujvu4c=;
 b=ZdYX+lep0cn8N02qAi8WIpIraRfx1KJUlPi4UOae2qeF6B8GkchzZLvQjMBmRFbd1A
 WwkyslhWsHNabUo+g9W5xrmwlMakNcpcIL/u2LlbUBohAfYGSc3GjRForqNybptAw/tA
 Gjh4IOm05Xpn+9ACPR6fLrEQ0MQg+Zs5qKnlwE6JCPVk4N8ZcebUvxr4tX85/lsfsUtw
 5KykViU5lbqblawvZWTlJ5cO72JE5qkuAffScmum9dckf99ShDjTitBmrUTIIyvReXXl
 aNVCYlU32rl/jVOH/7Ar6ghjSLzIyalSGCnY6rIhYnjv9dMkpwf9k+5kVxT2bkm6Qwze
 u1EQ==
X-Gm-Message-State: APjAAAVtSVI7pctcINOEiKSZEfZDF4OVoC2hRRZjybw31uQuDBan5T+F
 K9XuIAmupbyWVGRzUyl1TmF5JOPnWwZeaM4C/dHMMg==
X-Google-Smtp-Source: APXvYqwCryT1buetqq0JAH1U2u1s/YFyNlRbJhsnooRrprXXGE8iD+IQCtG6XEpiECoSOYxdWfWLcQiw4XK67k2HNJ0=
X-Received: by 2002:a05:6830:1649:: with SMTP id
 h9mr8398542otr.281.1574959636929; 
 Thu, 28 Nov 2019 08:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
In-Reply-To: <20191128160314.2381249-1-thierry.reding@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 28 Nov 2019 17:47:05 +0100
Message-ID: <CAKMK7uFEwChTesKdWAOfi3evLO=d0MsPDdK8gizH-jLk4uBdFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xEF8388JpCWdGO3Z924sD6jEvM1dtRC0Ytr2Lujvu4c=;
 b=dwPDA5V+mkVIHCoTwJauYbm3KJspHLKs3Tct8PXh5aYVO6cDq8BOsp/f5n4FHXvrtg
 TegpF+sCLqHgKS7WzPiQam/09x3AO/GNG1obOBivTNSIXR5tdc4ii3FeLq7Prcrw/mHh
 EGCtJDXXYaD7bC28AhSGXwRU/W1nXsmnwZkqc=
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
Cc: Len Brown <len.brown@intel.com>, Linux PM list <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgNTowMyBQTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5n
QG52aWRpYS5jb20+Cj4KPiBUaGlzIGlzIGEgcmVzdWx0IG9mIGxvb2tpbmcgaW50byBhIG1vcmUg
Zm9ybWFsIHdheSBvZiBkb2luZyB3aGF0IHdhcwo+IHByb3Bvc2VkIGhlcmU6Cj4KPiAgICAgICAg
IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMTQ1MzYzLwo+Cj4gVGhlIFRlZ3Jh
IERSTSBkcml2ZXIgaXMgd3JpdHRlbiBzdWNoIHRoYXQgcnVudGltZSBQTSBjb250cm9scyBhbGwK
PiBhc3BlY3RzIG9mIGJyaW5naW5nIHVwIGFuZCBzaHV0dGluZyBkb3duIHRoZSBoYXJkd2FyZSBh
c3NvY2lhdGVkIHdpdGggYQo+IGRpc3BsYXkgcGlwZWxpbmUuIFRoaXMgd29ya3MgdmVyeSBuaWNl
bHkgd2l0aCB0aGUgRFJNL0tNUyBhdG9taWMgbW9kZS0KPiBzZXR0aW5nIGZyYW1ld29yayB0aGF0
IGhhcyB2ZXJ5IHJpZ29yb3VzIGNhbGwgc2VxdWVuY2VzLiBUaGVyZSBhcmUgYWxzbwo+IHN1c3Bl
bmQvcmVzdW1lIGhlbHBlcnMgZm9yIHN5c3RlbSBzbGVlcCB0aGF0IGFyZSBidWlsdCBvbiB0b3Ag
b2YgdGhlc2UKPiBnZW5lcmljIGhlbHBlcnMgYW5kIHRoYXQgY2F1c2UgdGhlIHNhbWUgY29kZSBz
ZXF1ZW5jZXMgdG8gYmUgcnVuIGFzIGlmCj4gdXNlcnMgaGFkIHNpbXBseSBjaG9zZW4gdG8gZGlz
YWJsZSBhbGwgZGlzcGxheSBwaXBlbGluZXMgYXQgbm9ybWFsCj4gcnVudGltZS4KPgo+IFRoZSBj
dXJyZW50IGJlaGF2aW91ciBvZiB0aGUgUE0gY29yZSB0byBkaXNhbGxvdyBydW50aW1lIHN1c3Bl
bmQvcmVzdW1lCj4gZHVyaW5nIHN5c3RlbSBzbGVlcCBnZXRzIGluIHRoZSB3YXkgb2YgdGhpcyBi
ZWNhdXNlIHRoZSBkZXZpY2VzIGRvIG5vdAo+IGluIGZhY3QgcnVudGltZSBzdXNwZW5kL3Jlc3Vt
ZSBkdXJpbmcgdGhhdCB0aW1lLiBNb3N0IG9mIHRoZSB0aW1lIHRoaXMKPiBjYXVzZXMgZGlzcGxh
eSBvdXRwdXRzIHRvIG1hbGZ1bmN0aW9uIHVwb24gcmVzdW1lLgo+Cj4gTm93LCB0aGVyZSBhcmUg
Z29vZCByZWFzb25zIGZvciBwcmV2ZW50aW5nIHJ1bnRpbWUgc3VzcGVuZCBkdXJpbmcgc3lzdGVt
Cj4gc2xlZXAsIGFzIGdpdmVuIGluIGNvbW1pdCBlZWEzZmMwMzU3ZWIgKCJQQ0kgLyBQTTogRGV0
ZWN0IGVhcmx5IHdha2V1cAo+IGluIHBjaV9wbV9wcmVwYXJlKCkiKSB0aGF0IG9yaWdpbmFsbHkg
aW50cm9kdWNlZCB0aGlzIG1lY2hhbmlzbS4gVGhlcmUKPiBjYW4sIGhvd2V2ZXIsIGFsc28gYmUg
Y2FzZXMsIGxpa2UgdGhlIG9uZSBkZXNjcmliZWQgYWJvdmUsIHdoZXJlIGl0IGlzCj4gc2FmZSB0
byBhbGxvdyB0aGlzLiBBZGQgYSBmbGFnIGFuZCBhIHNldCBvZiBoZWxwZXJzIHRvIHNldCBvciBj
bGVhciB0aGF0Cj4gbmV3IGZsYWcgc28gdGhhdCBkcml2ZXJzIHRoYXQga25vdyBpdCB3aWxsIGJl
IHNhZmUgdG8gcnVudGltZSBzdXNwZW5kIGEKPiBkZXZpY2UgYXQgc3lzdGVtIHNsZWVwIHRpbWUg
Y2FuIG1hcmsgdGhlIGRldmljZSBhcyBzdWNoLgo+Cj4gSWYgYSBkZXZpY2UgaGFzIHRoZSBmbGFn
IHNldCwgdGhlIFBNIGNvcmUgd2lsbCBubyBsb25nZXIgdGFrZSBhIHJ1bnRpbWUKPiBQTSByZWZl
cmVuY2UgZm9yIGl0LCB0aHVzIGFsbG93aW5nIHRoZSBkZXZpY2UgdG8gcnVudGltZSBzdXNwZW5k
IGF0IHRoZQo+IGV4cGVjdGVkIHRpbWUuCgpXaGF0IGFib3V0IHNwcmlua2xpbmcgdG9ucyBvZiBk
ZXZpY2VfbGlua3MgYWxsIG92ZXIgdGhpcyB0byBtYWtlIHN1cmUKc3lzdGVtIHN1c3BlbmQvcmVz
dW1lIGlzIGRvbmUgaW4gdGhlIHNhbWUgb3JkZXIgdG9vPyBTbGlnaHRseSBsZXNzCm5lYXQgZnJv
bSBhIGRyaXZlciBwb3YsIGJ1dCBJIHRoaW5rIHRoYXQgc2hvdWxkIGdldCB0aGUgam9iIGRvbmUu
Ck1heWJlIGNvdWxkIGV2ZW4gZG8gYSBjb252ZW5pZW5jZSBmdW5jdGlvbiB3aGljaCBjb252ZXJ0
cyBhIGR0IHBoYW5kbGUKKG9yIHdoYXRldmVyIHRoYXQgd2FzIGNhbGxlZCBhZ2FpbikgaW50byBh
IGRldmljZV9saW5rPwotRGFuaWVsCgo+IFRoaWVycnkKPgo+IFRoaWVycnkgUmVkaW5nICgyKToK
PiAgIFBNIC8gcnVudGltZTogQWxsb3cgZHJpdmVycyB0byBvdmVycmlkZSBydW50aW1lIFBNIGJl
aGF2aW91ciBvbiBzbGVlcAo+ICAgZHJtL3RlZ3JhOiBBbGxvdyBydW50aW1lIHN1c3BlbmQgb24g
c3lzdGVtIHNsZWVwCj4KPiAgZHJpdmVycy9iYXNlL3Bvd2VyL21haW4uYyAgICB8ICA2ICsrKyst
LQo+ICBkcml2ZXJzL2Jhc2UvcG93ZXIvcnVudGltZS5jIHwgMTYgKysrKysrKysrKysrKysrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyAgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvZHNpLmMgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvaGRtaS5jIHwgIDEg
Kwo+ICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvaHViLmMgIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvc29yLmMgIHwgIDEgKwo+ICBpbmNsdWRlL2xpbnV4L3BtLmggICAgICAgICAgIHwg
IDEgKwo+ICBpbmNsdWRlL2xpbnV4L3BtX3J1bnRpbWUuaCAgIHwgIDIgKysKPiAgOSBmaWxlcyBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjIzLjAK
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoK
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
KzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
