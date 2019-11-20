Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DB4103167
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 03:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E126E6E98B;
	Wed, 20 Nov 2019 02:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880506E3F0;
 Wed, 20 Nov 2019 02:07:54 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b72so18936513edf.1;
 Tue, 19 Nov 2019 18:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=leI8OhqohePWOlkdPTemzLi1NRpfftWG+eO8CdevCXU=;
 b=cE2TM6c4yubv1Osd6zxcmhb7r+GeZzQcQnmCBWsMmG7MBFRVYQLBMTd9HlKUGzGsK2
 xLFSYgJc0ssVctM7HlTdxHCWpOapWmhZkIZ4fP07ZkDyj7qJ2wmFubGWBcFMJ3Z3i/xy
 DlQzG3s+qNErCbOLg0pVcycEZ6AYekwPL8q8iG0+42mt7Z9y5LGmkuBJ7oqlknq6q5d4
 ST9FqsIpfUbzrYd9kFMMcBx0Td6whuF1BLN2FfT32bpPz0ly9np5sSZS41Wvgm1YtF78
 7EFMUZxDG7mXlfIEtStGQubdtEk1n/UWKN8nl18dhzkHXcUM9rE0bNq7s8oIJEe+dLiq
 6CRw==
X-Gm-Message-State: APjAAAWPLhYyHxQ8eA8Eu1y7ZsibF+aDkaaJPu/xb2MU5UHibEAGMAU8
 CysENj89f1eEbp0bR/kshinl8wP5L6sElrZdEhM=
X-Google-Smtp-Source: APXvYqy1ZQ/g6M9ktZ6IXOPfOHzygUaFoQ0fkF+w8lDXn4TNU75klS4SyXPIPjl4H3FVXXP7nfumycR4Hr2GGK3yfls=
X-Received: by 2002:a17:906:b7c6:: with SMTP id
 fy6mr1542397ejb.90.1574215672969; 
 Tue, 19 Nov 2019 18:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
 <20191119210844.16947-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 19 Nov 2019 18:07:41 -0800
Message-ID: <CAF6AEGuPtwFjM12MRBf_X7GUqJBHt+Xb8vKrT+dddic093Ki6g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Don't init ww_mutec acquire ctx before needed
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=leI8OhqohePWOlkdPTemzLi1NRpfftWG+eO8CdevCXU=;
 b=iRelNh8nJPkzm+EFeaNAC0Zs13dmWzMIzrf0e+4z07JxywsoFeUJGMAvCBSscs+mx7
 FFawXT13NEgmen5Mni6eax8MQZviYHspdwYspDP4kaKtU8DDnoBaQTpWk5W4QDViggYA
 87+AOTElFXW7VeQ0jN08Lde6acPDOqtLPf2dRb38OKB5UCbjSky0Y8sSRXAtANS130pT
 /5F1P3coS8/pDjrJF5lBWvCfHB0BHO8vbVSfFhmylY5hHN1ASfMbvN6fIhQUEnfQCh4F
 c9EV4RaVx7WDshlIpdOkusXOOkrqfpcUpvcEzbz2r36ZXHEoWMMrURfT0S8L0rFGhnn9
 E+qg==
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTksIDIwMTkgYXQgMTowOCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPgo+IEZvciBsb2NraW5nIHNlbWFudGljcyBpdCByZWFsbHkg
ZG9lc24ndCBtYXR0ZXIgd2hlbiB3ZSBncmFiIHRoZQo+IHRpY2tldC4gQnV0IGZvciBsb2NrZGVw
IHZhbGlkYXRpb24gaXQgZG9lczogdGhlIGFjcXVpcmUgY3R4IGlzIGEgZmFrZQo+IGxvY2tkZXAu
IFNpbmNlIG90aGVyIGRyaXZlcnMgbWlnaHQgd2FudCB0byBkbyBhIGZ1bGwgbXVsdGktbG9jayBk
YW5jZQo+IGluIHRoZWlyIGZhdWx0LWhhbmRsZXIsIG5vdCBqdXN0IGxvY2sgYSBzaW5nbGUgZG1h
X3Jlc3YuIFRoZXJlZm9yZSB3ZQo+IG11c3QgaW5pdCB0aGUgYWNxdWlyZV9jdHggb25seSBhZnRl
ciB3ZSd2ZSBkb25lIGFsbCB0aGUgY29weV8qX3VzZXIgb3IKPiBhbnl0aGluZyBlbHNlIHRoYXQg
bWlnaHQgdHJpZ2dlciBhIHBhZ2VmYXVsdC4gRm9yIG1zbSB0aGlzIG1lYW5zIHdlCj4gbmVlZCB0
byBtb3ZlIGl0IHBhc3Qgc3VibWl0X2xvb2t1cF9vYmplY3RzLgoKc2VlbXMgcmVhc29uYWJsZS4u
IGJ1dCBtYXliZSBhIGNvbW1lbnQgd291bGQgYmUgdXNlZnVsIHRvIHByZXZlbnQKZnV0dXJlLW1l
IGZyb20gImNsZWFuaW5nLXRoaXMtdXAiIGJhY2sgdG8gdGhlIHdheSBpdCB3YXMKCndpdGggdGhh
dCwgci1iCgo+Cj4gQXNpZGU6IFdoeSBpcyBtc20gc3RpbGwgdXNpbmcgc3RydWN0X211dGV4LCBp
dCBzZWVtcyB0byBiZSB1c2luZwo+IGRtYV9yZXN2X2xvY2sgZm9yIGdlbmVyYWwgYnVmZmVyIHN0
YXRlIHByb3RlY3Rpb24/Cgpvbmx5IGJlY2F1c2UgSSAob3IgYW55b25lIGVsc2UpIGhhc24ndCBo
YWQgdGltZSB0byByZXZpc2l0IHRoZQpzdHJ1Y3RfbXV0ZXggdXNhZ2Ugc2luY2Ugd2UgbW92ZWQg
dG8gcGVyLW9iamVjdC1sb2Nrcy4uIHRoZSBkb3duc2lkZSwKSSBzdXBwb3NlLCBvZiBrZXJuZWwg
Z2VuZXJhbGx5IHdvcmtpbmcgb2sgYW5kIHRoaXMgbm90IGJlaW5nIGEgYmlnCmVub3VnaCBmaXJl
IHRvIGJ1YmJsZSB1cCB0byB0aGUgdG9wIG9mIG15IHRvZG8gbGlzdAoKQlIsCi1SCgo+Cj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+Cj4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ2VtX3N1Ym1pdC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9n
ZW1fc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKPiBpbmRl
eCBmYjFmZGQ3ZmEzZWYuLjEyNmIyZjYyYmZlNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9nZW1fc3VibWl0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9n
ZW1fc3VibWl0LmMKPiBAQCAtNTQsNyArNTQsNiBAQCBzdGF0aWMgc3RydWN0IG1zbV9nZW1fc3Vi
bWl0ICpzdWJtaXRfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4KPiAgICAgICAgIElO
SVRfTElTVF9IRUFEKCZzdWJtaXQtPm5vZGUpOwo+ICAgICAgICAgSU5JVF9MSVNUX0hFQUQoJnN1
Ym1pdC0+Ym9fbGlzdCk7Cj4gLSAgICAgICB3d19hY3F1aXJlX2luaXQoJnN1Ym1pdC0+dGlja2V0
LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3MpOwo+Cj4gICAgICAgICByZXR1cm4gc3VibWl0Owo+ICB9
Cj4gQEAgLTQ4OSw2ICs0ODgsNyBAQCBpbnQgbXNtX2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+Cj4gKyAgICAgICB3d19hY3F1aXJlX2luaXQoJnN1Ym1pdC0+dGlj
a2V0LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3MpOwo+ICAgICAgICAgcmV0ID0gc3VibWl0X2xvY2tf
b2JqZWN0cyhzdWJtaXQpOwo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gLS0KPiAyLjI0LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
