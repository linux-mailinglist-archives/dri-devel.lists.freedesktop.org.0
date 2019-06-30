Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19A5B158
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE4589D7C;
	Sun, 30 Jun 2019 18:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4643889D7C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 18:48:05 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k20so23614653ios.10
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 11:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M3e5wbnegHeRX/hJTHNWrhDPE+mePTed2TBFVD0zzdU=;
 b=goZ31DIgqzHN6LbqYJWLVuew3m10NzVq2rTsliNizdl/2zS3yY31H6mIvV06LgSojv
 eNVnlrKQB8xoa0iAHyP64e/s5PHdYNU812lbhzkV580a1kFNh7j5l3aDUDhxmNFtZXu7
 ZTJUsb2FkHP83XzO3Qq13SBhuH55/3XlI+cfrQdPcP0y9CBgjfMe81VAw146RDlhb/0i
 KLSZKIeCwlBas8700QFV+rxMerVtCv8lrHbrTNe+Wx5A/zcFzt720f8xyhjoFhuaX2p/
 jpc6iBK8BdR04tlUmnuYh9qpnqERAo7jr9lTU56c/elpe/p6OqdICNEqvGNpKM65prX8
 Gslw==
X-Gm-Message-State: APjAAAU88aBNtBf/cvEFsoDd6nx+4WK5UeWaXDIpCxKB0dcHIXEN2ZNw
 pZ4QyUgryinVLAgLFxDcvVwvaVxYUL/VJkTS5p3dtjeN
X-Google-Smtp-Source: APXvYqxNLFDvF0Jc8OwVu9LJ+6zdM0k+fYaovAM8wP7F1mMOdc1R0K9E7gAjVdtCsigB5xj68Ba+RU7xru8auhzN0q4=
X-Received: by 2002:a05:6602:104:: with SMTP id
 s4mr14718033iot.200.1561920484443; 
 Sun, 30 Jun 2019 11:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190620060726.926-1-kraxel@redhat.com>
 <20190620060726.926-9-kraxel@redhat.com>
 <CAPaKu7QjuKMJfhTVOzBsUb8cT9cGgesG_-skQeBO8hL8UqcAzw@mail.gmail.com>
 <20190628103412.f2n7ybp3qtxbhdk4@sirius.home.kraxel.org>
In-Reply-To: <20190628103412.f2n7ybp3qtxbhdk4@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 30 Jun 2019 11:47:53 -0700
Message-ID: <CAPaKu7Qvxp1poDoKz5Rft1uG0-7ijtTJQ-sLibvtewdZyVjXug@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
 fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=M3e5wbnegHeRX/hJTHNWrhDPE+mePTed2TBFVD0zzdU=;
 b=tH//MheYyEsn2cxzZcYSNMd+x21QhqkEDOTdsUgDTmN3b9XSew6Pn+SqEv9spR2WhZ
 oaaQdZOwvfuYIbxcPsJYN6PUQ5YtwmgqAweWZGr2Ox7OjAbjQv3Wo55QQP3UgID2jXbk
 dwwWHTEHh988J92DKnx0jDLBSrHt1xGdV9D+7X8wox+1mQoSkxs03p/mzf4SAL2qJMuh
 DMzwRPnR4b/toWdtVkwZWjmc8PdtL75iXOVVT+cGk+FnWAW9BP0oNiHa5SGhpnVHA7jO
 w2IpzFALFSSoV7m7r2nXqYZ+yJBmLMEB/uN0tes/tmRr8ZcRUgaJdLpqoxmZJMhHIDAF
 K0vQ==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMzozNCBBTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9kcnYuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZHJ2LmgKPiA+ID4gQEAgLTEyMCw5ICsxMjAsOSBAQCBzdHJ1Y3QgdmlydGlvX2dwdV92
YnVmZmVyIHsKPiA+ID4KPiA+ID4gICAgICAgICBjaGFyICpyZXNwX2J1ZjsKPiA+ID4gICAgICAg
ICBpbnQgcmVzcF9zaXplOwo+ID4gPiAtCj4gPiA+ICAgICAgICAgdmlydGlvX2dwdV9yZXNwX2Ni
IHJlc3BfY2I7Cj4gPiA+Cj4gPiA+ICsgICAgICAgc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0X2Fy
cmF5ICpvYmpzOwo+ID4gVGhpcyBjYW4gdXNlIGEgY29tbWVudCAoZS5nLiwgb2JqZWN0cyByZWZl
cmVuY2VkIGJ5IHRoZSB2YnVmZmVyKQo+Cj4gSU1ITyB0aGlzIGlzIG9idmlvdXMgLi4uCj4KPiA+
ID4gIHZvaWQgdmlydGlvX2dwdV9jbWRfc3VibWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
dmdkZXYsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEsIHVpbnQz
Ml90IGRhdGFfc2l6ZSwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
Y3R4X2lkLCBzdHJ1Y3QgdmlydGlvX2dwdV9mZW5jZSAqZmVuY2UpOwo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBjdHhfaWQsIHN0cnVjdCB2aXJ0aW9fZ3B1X2ZlbmNl
ICpmZW5jZSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZpcnRpb19n
cHVfb2JqZWN0X2FycmF5ICpvYmpzKTsKPiA+IENhbiB3ZSBrZWVwIGZlbmNlLCB3aGljaCBpcyB1
cGRhdGVkLCBhcyB0aGUgbGFzdCBwYXJhbWV0ZXI/Cj4KPiBGaXhlZC4KPgo+ID4gPiArICAgICAg
IGlmIChidWZsaXN0KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgZXhi
dWYtPm51bV9ib19oYW5kbGVzOyBpKyspCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
c2VydmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5jZShidWZsaXN0LT5vYmpzW2ldLT5yZXN2LAo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJm91dF9mZW5jZS0+Zik7Cj4gPiA+ICsgICAgICAgICAgICAgICBkcm1fZ2VtX3VubG9j
a19yZXNlcnZhdGlvbnMoYnVmbGlzdC0+b2JqcywgYnVmbGlzdC0+bmVudHMsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnRpY2tldCk7Cj4gPiA+ICsg
ICAgICAgfQo+ID4gV2UgdXNlZCB0byB1bmxvY2sgYWZ0ZXIgdmlydGlvX2dwdV9jbWRfc3VibWl0
Lgo+ID4KPiA+IEkgZ3Vlc3MsIHRoZSBmZW5jZSBpcyBjb25zaWRlcmVkIHNpZ25hbGVkIChiZWNh
dXNlIGl0cyBzZXFubyBpcyBzdGlsbAo+ID4gMCkgdW50aWwgYWZ0ZXIgdmlydGlvX2dwdV9jbWRf
c3VibWl0LiAgV2UgcHJvYmFibHkgZG9uJ3Qgd2FudCBvdGhlcgo+ID4gcHJvY2Vzc2VzIHRvIHNl
ZSB0aGUgc2VtaS1pbml0aWFsaXplZCBmZW5jZS4KPgo+IEdvb2QgcG9pbnQuICBGaXhlZC4KPgo+
ID4gPiAgb3V0X21lbWR1cDoKPiA+ID4gICAgICAgICBrZnJlZShidWYpOwo+ID4gPiAgb3V0X3Vu
cmVzdjoKPiA+ID4gLSAgICAgICB0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigmdGlja2V0LCAm
dmFsaWRhdGVfbGlzdCk7Cj4gPiA+IC1vdXRfZnJlZToKPiA+ID4gLSAgICAgICB2aXJ0aW9fZ3B1
X3VucmVmX2xpc3QoJnZhbGlkYXRlX2xpc3QpOwo+ID4gS2VlcGluZyBvdXRfZnJlZSB0byBmcmVl
IGJ1Zmxpc3Qgc2VlbXMganVzdCBmaW5lLgo+Cj4gV2UgZG9uJ3QgbmVlZCB0aGUgc2VwYXJhdGUg
bGFiZWwgdGhvdWdoIC4uLgo+Cj4gPiA+ICsgICAgICAgZHJtX2dlbV91bmxvY2tfcmVzZXJ2YXRp
b25zKGJ1Zmxpc3QtPm9ianMsIGJ1Zmxpc3QtPm5lbnRzLCAmdGlja2V0KTsKPiA+ID4gIG91dF91
bnVzZWRfZmQ6Cj4gPiA+ICAgICAgICAga3ZmcmVlKGJvX2hhbmRsZXMpOwo+ID4gPiAtICAgICAg
IGt2ZnJlZShidWZsaXN0KTsKPiA+ID4gKyAgICAgICBpZiAoYnVmbGlzdCkKPiA+ID4gKyAgICAg
ICAgICAgICAgIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWUoYnVmbGlzdCk7Cj4KPiAuLi4gYW5k
IHRoZSBidWZsaXN0IGlzIHJlbGVhc2VkIGhlcmUgaWYgbmVlZGVkLgo+Cj4gQnV0IHdlIG5lZWQg
aWYgKGJ1Zmxpc3QpIGZvciBkcm1fZ2VtX3VubG9ja19yZXNlcnZhdGlvbnMgdG9vLiAgRml4ZWQu
Cj4KPiA+ID4gLQo+ID4gPiAtICAgICAgICAgICAgICAgbGlzdF9kZWwoJmVudHJ5LT5saXN0KTsK
PiA+ID4gLSAgICAgICAgICAgICAgIGZyZWVfdmJ1Zih2Z2RldiwgZW50cnkpOwo+ID4gPiAgICAg
ICAgIH0KPiA+ID4gICAgICAgICB3YWtlX3VwKCZ2Z2Rldi0+Y3RybHEuYWNrX3F1ZXVlKTsKPiA+
ID4KPiA+ID4gICAgICAgICBpZiAoZmVuY2VfaWQpCj4gPiA+ICAgICAgICAgICAgICAgICB2aXJ0
aW9fZ3B1X2ZlbmNlX2V2ZW50X3Byb2Nlc3ModmdkZXYsIGZlbmNlX2lkKTsKPiA+ID4gKwo+ID4g
PiArICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShlbnRyeSwgdG1wLCAmcmVjbGFpbV9s
aXN0LCBsaXN0KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoZW50cnktPm9ianMpCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHZpcnRpb19ncHVfYXJyYXlfcHV0X2ZyZWUoZW50cnkt
Pm9ianMpOwo+ID4gPiArICAgICAgICAgICAgICAgbGlzdF9kZWwoJmVudHJ5LT5saXN0KTsKPiA+
IFdlIGFyZSBjbGVhcmluZyB0aGUgbGlzdC4gIEkgZ3Vlc3MgbGlzdF9kZWwgaXMgbm90IG5lZWRl
ZC4KPiA+ID4gKyAgICAgICAgICAgICAgIGZyZWVfdmJ1Zih2Z2RldiwgZW50cnkpOwo+Cj4gVGhp
cyBqdXN0IHNodWZmbGVzIGFyb3VuZCB0aGUgY29kZS4gIERyb3BwaW5nIGxpc3RfZGVsKCkgaXMg
dW5yZWxhdGVkCj4gYW5kIHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgpGYWlyIHBvaW50LiAg
V2Ugbm93IGxvb3AgdGhlIGxpc3QgdHdpY2UgYW5kIEkgd2FzIGp1c3QgbG9va2luZyBmb3IKY2hh
bmNlcyBmb3IgbWljcm8tb3B0aW1pemF0aW9ucy4KPgo+IEJlc2lkZSB0aGF0IEknbSBub3Qgc3Vy
ZSBpdCBhY3R1YWxseSBjYW4gYmUgZHJvcHBlZC4gIGZyZWVfdmJ1ZigpIHdpbGwKPiBub3Qga2Zy
ZWUoKSB0aGUgdmJ1ZiBidXQga2VlcCBpdCBjYWNoZWQgaW4gYSBmcmVlbGlzdCBpbnN0ZWFkLgp2
YnVmIGlzIGNyZWF0ZWQgd2l0aCBrbWVtX2NhY2hlX3phbGxvYyB3aGljaCBhbHdheXMgemVyb3Mg
dGhlIHN0cnVjdC4KCj4KPiBjaGVlcnMsCj4gICBHZXJkCj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
