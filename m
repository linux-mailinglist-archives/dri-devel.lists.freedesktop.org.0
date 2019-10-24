Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC5E3268
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C786E394;
	Thu, 24 Oct 2019 12:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161DD6E394
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:32:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a11so9789787wra.6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=0ERfl2WzrxPozUl7AlEGHtBwA+6SHjAbXTy7ECtrlac=;
 b=hPEmgCT8qnY2zW4WwoqLLIXUlSQMIwJYB2uzHMm2KE75PsaCETF92rTimpLtn4aBPS
 QXFSnVOlZxDKtDxgK/P3cxvy5e3WkQfR4eCw8LvLNVAReAQvHsrcJSRC3fzR3vqK3wUp
 sI5G3rAbfUoCzvDacX5PdWoP/Fo1Pc/a2ddJ5B6Cf+7AcDmdGILjYOUMPdHNeey10G1o
 s8Rdv6RtfVGNK3WA7EmnyGEwNShMZDVm4OiKCvDJYTlcBgj8PfAOFwCT7tFl8IMrEjmW
 h8SQYYf/ISURHlic34WvdLko0qcaLZXccroNlBI3o850Hjb3HEUPoqKisy7oFAOwRQab
 a4+w==
X-Gm-Message-State: APjAAAW6V5LApAj0blEzPuZS3Ce9KI1pCIp8gaQvHtOHc06aP3NXgMRh
 +ivXGuuChSPQ20WgzjyVfz7hCw==
X-Google-Smtp-Source: APXvYqxEiJtEZzJCtpUva1QApnqAGPXUV1rQLxGNXaVRpU4/2WpENTIdI5IlhZITK3294ZBryLZCwA==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr3811907wru.196.1571920336624; 
 Thu, 24 Oct 2019 05:32:16 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id g14sm2455138wro.33.2019.10.24.05.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 05:32:15 -0700 (PDT)
Date: Thu, 24 Oct 2019 14:32:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/prime: Fix mmap fake offset for
 drm_gem_object_funcs.mmap
Message-ID: <20191024123214.GE11828@phenom.ffwll.local>
References: <20191023222226.9064-1-robh@kernel.org>
 <20191024090240.jnmbo5ikivdbkbbg@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024090240.jnmbo5ikivdbkbbg@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0ERfl2WzrxPozUl7AlEGHtBwA+6SHjAbXTy7ECtrlac=;
 b=IJvJpoEpJ/iUQcvhc5tnI2yI3o4XhzvaQA9cZSwW+MR7Lu1Eb1JbYv9JmllqgtTIMM
 Dnzcfn6V1XFLPZINpb3FBGyO0bMLzoDXBh4MB0nBXNmAMByKmuaUgzw0V0sUnqjL0WNU
 GsdOyE8N4HI6zrDXu6E56wXg7OT9Da8TaAurQ=
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMTE6MDI6NDBBTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCAwNToyMjoyNlBNIC0wNTAwLCBSb2IgSGVy
cmluZyB3cm90ZToKPiA+IENvbW1pdCBjNDAwNjljYjdiZDYgKCJkcm06IGFkZCBtbWFwKCkgdG8g
ZHJtX2dlbV9vYmplY3RfZnVuY3MiKQo+ID4gaW50cm9kdWNlZCBhIEdFTSBvYmplY3QgbW1hcCgp
IGhvb2sgd2hpY2ggaXMgZXhwZWN0ZWQgdG8gc3VidHJhY3QgdGhlCj4gPiBmYWtlIG9mZnNldCBm
cm9tIHZtX3Bnb2ZmLgo+IAo+IExvbmctdGVybSBpdCBpcyBwcm9iYWJseSBhIGdvb2QgaWRlYSB0
byBqdXN0IHJlbW92ZSB0aGUgZmFrZSBvZmZzZXQKPiBoYW5kbGluZyBmcm9tIGRyaXZlcnMuICBC
dXQgdGhhdCdsbCBvbmx5IHdvcmsgb25jZSBhbGwgZHJpdmVycyBzd2l0Y2hlZAo+IGF3YXkgZnJv
bSBjdXN0b20gZm9wcy0+bW1hcCBoYW5kbGVycyBzbyB3ZSBjYW4gaGFuZGxlIHRoZSBvZmZzZXQg
LT4gb2JqCj4gbG9va3VwIGluIHRoZSBkcm0gY29yZSBmb3IgZXZlcnlib2R5Lgo+IAo+IFNvIGxl
dCdzIGdvIHRoaXMgd2F5IGZvciBub3cuCj4gCj4gQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPgoKVWggdGhpcyBzb3VuZHMgbGlrZSBkb3VibGluZyBkb3duIG9uIHJh
dGhlciBob3JyaWJsZSBzZW1hbnRpY3MuIENhbiB3ZSBhdApsZWFzdCBzdG9wIHRoZSBtZXNzIGlu
c3RlYWQgb2YgYmFraW5nIGl0IGluIGZvciByZWFsPyBUaGUgaG9vayBpcyB2ZXJ5CnZlcnkgbmV3
IGFmdGVyIGFsbC4gSS5lLgotIERvY3VtZW50IHRoYXQgb2JqLT5mdW5jcy0+bW1hcCB3aWxsIGhh
dmUgMCBvZmZzZXQgaW4gdGhlIGtlcm5lbGRvYy4KLSBSZW1vdmUgdGhlIHN1YnRyYWN0aW5nIGZy
b20gdGhlIHNobWVtIGhlbHBlcgotIEluIHR0bV9ib19tbWFwX29iaiByZS1hZGQgdGhlIG9mZnNl
dCB3aXRoIGEgaHVnZSBGSVhNRSBjb21tZW50LgotIEFkanVzdCBkcm1fZ2VtX21tYXBfb2JqIHRv
IGRvIHRoYXQgc2FtZSBmb3Igb2JqLT5mdW5jcy0+bW1hcCBhbmQgYWxzbwogIGRvY3VtZW50IHRo
ZSBleHBlY3RhdGlvbiB0aGVyZSB0b28uCgpUaGlzIGZlZWxzIGxpa2UgdmVyeSBtdWNoIGdvaW5n
IHRoZSB3cm9uZyBkaXJlY3Rpb24gLi4uCgpBbHNvIEkgZ3Vlc3MgR2VyZCBkaWRuJ3QgcmVhbGx5
IHRlc3QgdGhpcyBwcmltZSBtbWFwIHN1cHBvcnQ/CgpUaGFua3MsIERhbmllbAo+IAo+ID4gSG93
ZXZlciwgZm9yIG1tYXAoKSBvbiBkbWFidWZzLCB0aGVyZSBpcyBub3QKPiA+IGEgZmFrZSBvZmZz
ZXQuIFRvIGZpeCB0aGlzLCB3ZSBuZWVkIHRvIGFkZCB0aGUgZmFrZSBvZmZzZXQganVzdCBsaWtl
IHRoZQo+ID4gZHJpdmVyLT5mb3BzLT5tbWFwKCkgY29kZSBwYXRoLgo+ID4gCj4gPiBGaXhlczog
YzQwMDY5Y2I3YmQ2ICgiZHJtOiBhZGQgbW1hcCgpIHRvIGRybV9nZW1fb2JqZWN0X2Z1bmNzIikK
PiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gSSByYW4gaW50byB0aGlzIHdoaWxl
IHdvcmtpbmcgb24gY29udmVydGluZyB2Z2VtIHRvIHNobWVtIGhlbHBlcnMgYW5kCj4gPiB0aGUg
SUdUIHZnZW1fYmFzaWMgZG1hYnVmLW1tYXAgdGVzdCBmYWlsZWQuIFRoaXMgZml4ZXMgc2htZW0s
IGJ1dCBJCj4gPiBoYXZlIGNoZWNrZWQgYW55IG90aGVyIHVzZXJzIG9mIHRoZSBuZXcgbW1hcCBo
b29rLgo+ID4gUm9iCj4gPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCA0ICsr
LS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiBpbmRleCAwODE0MjExYjBmM2YuLjVkMDY2OTBhMmU5
ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4gPiBAQCAtNzEzLDYgKzcxMyw4IEBAIGludCBk
cm1fZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQo+ID4gIAlzdHJ1Y3QgZmlsZSAqZmlsOwo+ID4gIAlpbnQgcmV0Owo+
ID4gIAo+ID4gKwl2bWEtPnZtX3Bnb2ZmICs9IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFf
bm9kZSk7Cj4gPiArCj4gPiAgCWlmIChvYmotPmZ1bmNzICYmIG9iai0+ZnVuY3MtPm1tYXApIHsK
PiA+ICAJCXJldCA9IG9iai0+ZnVuY3MtPm1tYXAob2JqLCB2bWEpOwo+ID4gIAkJaWYgKHJldCkK
PiA+IEBAIC03MzcsOCArNzM5LDYgQEAgaW50IGRybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiAgCWlmIChy
ZXQpCj4gPiAgCQlnb3RvIG91dDsKPiA+ICAKPiA+IC0Jdm1hLT52bV9wZ29mZiArPSBkcm1fdm1h
X25vZGVfc3RhcnQoJm9iai0+dm1hX25vZGUpOwo+ID4gLQo+ID4gIAlyZXQgPSBvYmotPmRldi0+
ZHJpdmVyLT5mb3BzLT5tbWFwKGZpbCwgdm1hKTsKPiA+ICAKPiA+ICAJZHJtX3ZtYV9ub2RlX3Jl
dm9rZSgmb2JqLT52bWFfbm9kZSwgcHJpdik7Cj4gPiAtLSAKPiA+IDIuMjAuMQo+ID4gCj4gCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
