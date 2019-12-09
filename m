Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95DA116F12
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BCF6E46E;
	Mon,  9 Dec 2019 14:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26556E46E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:36:31 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id l24so10385566vsr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wqsvJLNuRAF3S+hG7dtzuws5G6FC9X5BTsWk3Y3yK5s=;
 b=aqIfEPEBKMwuL6XwCnz493SwmXJtNttdW003LcRKABxblsPGinh1nz3nOB9KbXb50T
 BXXVFicOEXEsotoxsXk+hORX1+7ErhpRXnth+SKX13DrBGW0aKKWOa+q/4AULCQj83bz
 I51PlkBx1IqoceY3QGE2S6V7DQ30nxOaYsnsBsng6GfMcLUDldDSCAzcHi3yHHelp/9v
 UCsKmUEbrNWIHQvQZ+9YbQ6PILXJ939GaDEJ1vO7NdoX78v1F0cdZY5gJf+Exs+M6NOm
 7/LCh7VW6O+ay6KE53XTBIb/hWWRfaHdja+vX707kdd8+ytZxFouUqsDq6bSP9lWmV9p
 PuhQ==
X-Gm-Message-State: APjAAAW+fHR9OehOhtpIQewbv4WXNgbPEQV0+6wtnVffi2XVaaawzWT3
 UT/zbzjG5eabM6Xe3Vibk95pskvT+HG/XXbz5kSMaJIz
X-Google-Smtp-Source: APXvYqxmgeXYS0kDa2NqnTZblBbbmPSo85T3i/pqMEkMwmSbSv5CJYL/VHB3ccyrtq0vuTQJ/RBu7BGc91zwo1SCdWk=
X-Received: by 2002:a67:c204:: with SMTP id i4mr21189042vsj.118.1575902190864; 
 Mon, 09 Dec 2019 06:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20191206124713.5748-1-tzimmermann@suse.de>
 <20191206124713.5748-5-tzimmermann@suse.de>
In-Reply-To: <20191206124713.5748-5-tzimmermann@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 9 Dec 2019 14:35:17 +0000
Message-ID: <CACvgo53UE9WpQUHu1ftxAVBW98hDsEyqvE6a6r=UUrX1Rm7x3Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/udl: Inline DPMS code into CRTC enable and
 disable functions
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wqsvJLNuRAF3S+hG7dtzuws5G6FC9X5BTsWk3Y3yK5s=;
 b=tPK9R3sccZhPi0D8dEo3YVpy3fizezjJkzDXhDGNXrukv9uQZbmHi75pu49H/VImmU
 9DmaYH+La2FmPErEbBn7Y+2mdpx4mPF0hoZuyk9T/ZDQQ9VxbTAciULl18VDBtIOX63h
 RfXcbRwlVWYjXDQv1W1FwVk59ctvCWB0BZl5RvHWC9FEdChIuyUQrRlHsC5MN6TMVWMm
 OYmWCO3c5HwLTGgGitzWfuZczvBcTlHNwOHgKmKwQnyghDDVkySgmOQmim/Rf/TXTMTA
 N7UrO25SZRV2NOVFMuBRWD6UiC+fJgtpwLGbml6tx10fEe9DbLZo2B7CQlysT2qmjlg/
 h9DQ==
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA2IERlYyAyMDE5IGF0IDEyOjQ3LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBEUE1TIGZ1bmN0aW9uYWxpdHkgaXMgb25seSB1c2VkIGJ5
IHRoZSBDUlRDJ3MgZW5hYmxlIGFuZCBkaXNhYmxlCj4gZnVuY3Rpb25zLiBJbmxpbmUgdGhlIGNv
ZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIHwgODQgKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCj4g
aW5kZXggNzI4ODRjYmRhMTMxLi40NjgxNDQ2YzIzMjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
bW9kZXNldC5jCj4gQEAgLTQ4LDI1ICs0OCw5IEBAIHN0YXRpYyBjaGFyICp1ZGxfdmlkcmVnX3Vu
bG9jayhjaGFyICpidWYpCj4gICAqICAweDAxIEggYW5kIFYgc3luYyBvZmYgKHNjcmVlbiBibGFu
ayBidXQgcG93ZXJlZCkKPiAgICogIDB4MDcgRFBNUyBwb3dlcmRvd24gKHJlcXVpcmVzIG1vZGVz
ZXQgdG8gY29tZSBiYWNrKQo+ICAgKi8KPiAtc3RhdGljIGNoYXIgKnVkbF9zZXRfYmxhbmsoY2hh
ciAqYnVmLCBpbnQgZHBtc19tb2RlKQo+ICtzdGF0aWMgY2hhciAqdWRsX3NldF9ibGFua19tb2Rl
KGNoYXIgKmJ1ZiwgdTggbW9kZSkKPiAgewo+IC0gICAgICAgdTggcmVnOwo+IC0gICAgICAgc3dp
dGNoIChkcG1zX21vZGUpIHsKPiAtICAgICAgIGNhc2UgRFJNX01PREVfRFBNU19PRkY6Cj4gLSAg
ICAgICAgICAgICAgIHJlZyA9IDB4MDc7Cj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAg
ICAgY2FzZSBEUk1fTU9ERV9EUE1TX1NUQU5EQlk6Cj4gLSAgICAgICAgICAgICAgIHJlZyA9IDB4
MDU7Cj4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgY2FzZSBEUk1fTU9ERV9EUE1T
X1NVU1BFTkQ6Cj4gLSAgICAgICAgICAgICAgIHJlZyA9IDB4MDE7Cj4gLSAgICAgICAgICAgICAg
IGJyZWFrOwo+IC0gICAgICAgY2FzZSBEUk1fTU9ERV9EUE1TX09OOgo+IC0gICAgICAgICAgICAg
ICByZWcgPSAweDAwOwo+IC0gICAgICAgICAgICAgICBicmVhazsKPiAtICAgICAgIH0KPiAtCkFz
IGEgZm9sbG93LXVwLCBwbGVhc2UgYWRkL3VzZSBzeW1ib2xpYyBuYW1lcyBmb3IgdGhlIHRoZSBm
b3VyIHN0YXRlcy4KQXBhcnQgZnJvbSB0aGUgY29zbWV0aWMgYXNwZWN0LCB0aGlzIGFsbG93cyB1
cyB0byB0cml2aWFsbHkgY2hhbmdlCmZyb20gRFBNU19PRkYgdG8gRFBNU19TVVNQRU5EIG9yIERQ
TVNfU1RBTkRCWSBhdCBhbnkgcmFuZG9tIHBvaW50LgoKQXMtaXMgdGhlIHNlcmllcyBpczoKUmV2
aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgoKVGhhbmtz
CkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
