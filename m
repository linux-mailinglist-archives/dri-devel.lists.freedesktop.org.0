Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6EC064D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E42C6E0F0;
	Fri, 27 Sep 2019 13:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348506E0F0;
 Fri, 27 Sep 2019 13:29:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o18so2711017wrv.13;
 Fri, 27 Sep 2019 06:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Yvc/nzaZmJBsmJXhAJkLnQVaJpozJnKbpg0eQa5Qo8=;
 b=cGrvYEwwH4GJb8ZeMpr/iYH+CI81rguk8Sq0Y0S0DG2YQmCCdBXhfrTSQAkTSItmSV
 fSb2myjcRyRUzUYhbwgz7iWjNQp2YP0dUCj42wx2i2keHKrbNTksOOYMt2rOs5hhUnNt
 Rx4GJcWtR2+hd0uccG/H2VXcZNhPKcYGimbzyBUEMdE/nG0OnCMMBU99lJp+HVxYVs4/
 9I2EpMRg74PVZ2jVkOPEAgnZs8EJMXP+Z4R+VL1oabxUZht7sDqVFCvBrvvXugsOzpuI
 af7sc45DqOKc+0UnnnZHOlcws2v6fmrU0JbRa/qbSFDngtN8qvNRcQYIcKwc7B5aZdFu
 1kBA==
X-Gm-Message-State: APjAAAVDzQGnZMA7j+t+Gypp5Du8GZ4gq/nEwxSDtdKcC4jTklRsObeO
 jyd9gtzUBdWNbE4uObSbqopAEvPY6usma2XjTqk=
X-Google-Smtp-Source: APXvYqyd9x7rEK/DDeeWCHCfRX/0NNTZ/TC215iR0DBDc11VFkiBI++Nb2bl54FbIbjw+94zKIPa6bAwUkoUlmkJjy0=
X-Received: by 2002:a5d:4444:: with SMTP id x4mr2947156wrr.11.1569590974750;
 Fri, 27 Sep 2019 06:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190903204645.25487-25-lyude@redhat.com>
 <20190925215251.10030-1-lyude@redhat.com>
In-Reply-To: <20190925215251.10030-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Sep 2019 09:29:22 -0400
Message-ID: <CADnq5_OhiBZ=S1d4o+4yn1YB9cNagxXLdFWZ-A8ZQeo-FdK9Aw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amdgpu/dm: Resume short HPD IRQs before resuming
 MST topology
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Yvc/nzaZmJBsmJXhAJkLnQVaJpozJnKbpg0eQa5Qo8=;
 b=fnq+kjqskJS0KuwpQa0gPSbJKen8LBIvM3oDdLqPi6RPoCGHCT/4RqBXsLqvzMLxoS
 9acZZJ6G+8oD5O7zL8pGtmAOO/thWwbIAHHIA1PSTgiQuUtw4VhzwGFWNAcISUb/+f10
 z2zbXo3IlThJroWUWgAHdqvC3gT82IO/4DizaAznpHNCaMNF5cZrz3UQkU8E4IOwA9i7
 gxvBmzu8rmUCUNn7GK5PcOy7nr2hD9mh/C+Sz+ofC+m/p3RTNTCRPkpwVyYIuKzz7xIV
 +s/Tb2DTk9C4GFk2KUXS+Xr6kVVyDebHGqud3w3nsOA4P5LREX/vCxPXmElY7vi9uX76
 x15w==
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
Cc: Leo Li <sunpeng.li@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harry Wentland <hwentlan@amd.com>, David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgNTo1MyBQTSBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IFNpbmNlIHdlJ3JlIGdvaW5nIHRvIGJlIHJlcHJvYmluZyB0aGUgZW50
aXJlIHRvcG9sb2d5IHN0YXRlIG9uIHJlc3VtZQo+IG5vdyB1c2luZyBzaWRlYmFuZCB0cmFuc2Fj
dGlvbnMsIHdlIG5lZWQgdG8gZW5zdXJlIHRoYXQgd2UgYWN0dWFsbHkgaGF2ZQo+IHNob3J0IEhQ
RCBpcnFzIGVuYWJsZWQgYmVmb3JlIGNhbGxpbmcgZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfcmVz
dW1lKCkuCj4gU28sIGRvIHRoYXQuCj4KPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+ICogRml4IHR5cG8g
aW4gY29tbWVudHMKPgo+IENjOiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+Cj4gQ2M6
IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50
bGFuQGFtZC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
Cj4gU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiBBY2tlZC1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKQXBwbGllZC4gIFRo
YW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMgfCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gaW5kZXggMTg5Mjc3NThhMDEwLi5iY2U5YTI5OGJj
NDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKPiBAQCAtMTE4NiwxNSArMTE4NiwxNSBAQCBzdGF0aWMgaW50IGRtX3Jlc3Vt
ZSh2b2lkICpoYW5kbGUpCj4gICAgICAgICAvKiBwcm9ncmFtIEhQRCBmaWx0ZXIgKi8KPiAgICAg
ICAgIGRjX3Jlc3VtZShkbS0+ZGMpOwo+Cj4gLSAgICAgICAvKiBPbiByZXN1bWUgd2UgbmVlZCB0
byAgcmV3cml0ZSB0aGUgTVNUTSBjb250cm9sIGJpdHMgdG8gZW5hbWJsZSBNU1QqLwo+IC0gICAg
ICAgczNfaGFuZGxlX21zdChkZGV2LCBmYWxzZSk7Cj4gLQo+ICAgICAgICAgLyoKPiAgICAgICAg
ICAqIGVhcmx5IGVuYWJsZSBIUEQgUnggSVJRLCBzaG91bGQgYmUgZG9uZSBiZWZvcmUgc2V0IG1v
ZGUgYXMgc2hvcnQKPiAgICAgICAgICAqIHB1bHNlIGludGVycnVwdHMgYXJlIHVzZWQgZm9yIE1T
VAo+ICAgICAgICAgICovCj4gICAgICAgICBhbWRncHVfZG1faXJxX3Jlc3VtZV9lYXJseShhZGV2
KTsKPgo+ICsgICAgICAgLyogT24gcmVzdW1lIHdlIG5lZWQgdG8gcmV3cml0ZSB0aGUgTVNUTSBj
b250cm9sIGJpdHMgdG8gZW5hYmxlIE1TVCovCj4gKyAgICAgICBzM19oYW5kbGVfbXN0KGRkZXYs
IGZhbHNlKTsKPiArCj4gICAgICAgICAvKiBEbyBkZXRlY3Rpb24qLwo+ICAgICAgICAgZHJtX2Nv
bm5lY3Rvcl9saXN0X2l0ZXJfYmVnaW4oZGRldiwgJml0ZXIpOwo+ICAgICAgICAgZHJtX2Zvcl9l
YWNoX2Nvbm5lY3Rvcl9pdGVyKGNvbm5lY3RvciwgJml0ZXIpIHsKPiAtLQo+IDIuMjEuMAo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
