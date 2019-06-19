Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074424C04F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 19:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B76F6E448;
	Wed, 19 Jun 2019 17:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA7B6E444;
 Wed, 19 Jun 2019 17:51:28 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id c4so340545uad.1;
 Wed, 19 Jun 2019 10:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v5bEwkDeCMuPVRQ3IGzhhiMQVUfjn6iaA7PObTZvYCQ=;
 b=CIBR1TI1RZkb3OiSvjMZq3ZlMHQiBtodAY108h3RDVEhkxhBITphcsPdyWCIKfx3eV
 PvxumpHdHR9dwa4ku/IZdanQb31mS5ZvYae22KFzUXAMMNkU2tHyNBzELGj/tFrcpXcT
 YwJV4AI5qmriue9cjmca68fsRNaKPRl67ZTLltn3fvvLMyfuPSjFT3/Oq03aXYJ/HvdI
 9nhpsY5XTRl1W36uGg7d1qzlDAyCNHkAjssUtHwuz9McDEm4DTJmR9QaLdGwNlGel/kX
 7fZKUHTSWmbFDF2GSbuNB6AnN1mEhGO9jrCziL2vzoKFic7axnegX4S3EwohdAZyIIkq
 OnLw==
X-Gm-Message-State: APjAAAUrkMpcrAq0bNuihG8L8pHJDJPxthe2nNDaeyzdqzLoYu3Lz3JU
 9/+o+PIWR8dLKS7EVEJAvvat10ETPoZWuP09r7c=
X-Google-Smtp-Source: APXvYqxWjduc0NBL5hCgwCOdJDa51mVPSr8O7aqOW7mQDiSkaNjrKtGOqCtonSa2eAnqp6f6QaDq9/1MVMbv/67n+e8=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr48194653uaq.106.1560966686393; 
 Wed, 19 Jun 2019 10:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190619160353.GE1896@arch-x1c3> <20190619163327.GC5942@intel.com>
In-Reply-To: <20190619163327.GC5942@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 19 Jun 2019 18:49:11 +0100
Message-ID: <CACvgo52N9MMDrVcofD8AB-nFiuGiwBGxf5NbKBRN4cV+v9YsQg@mail.gmail.com>
Subject: Re: [RFC] Exposing plane type mask and handling 'all' planes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v5bEwkDeCMuPVRQ3IGzhhiMQVUfjn6iaA7PObTZvYCQ=;
 b=pRGCBqGjWg4/gf5YDo2PoqO1nI7HI67wyM1NJ/6qb4a+AuxHB8fYmGg4XM3pMFJ9D8
 ekn8FCqkWXzU01oHyKZXj9mLnh3GlIOvWVBQu7emRZEkDPOHF54fTCwK/UpbZcQ7i789
 kx9Xwc7WLC/h/SC6Hk8LymxU6whaYFkSqrxZgPIt/4sqTgtTWfAo6Nw0nfFLJqLYx5IV
 65HnbXPHG/lcpmzB8lIy1fJhF8pLNx5ASh5CdztGmy4oYtL4FbCVOc82R7RDjGxiPFOE
 KYIJZgxIUOgiKgGSOTWwfwaQDBkTnHKBsve689XBDOm/Pff/75i3+kc3mMK8n1l2qquT
 8sOw==
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Miguel Casas-Sanchez <mcasas@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandros Frantzis <alexandros.frantzis@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSBhdCAxNzozMywgVmlsbGUgU3lyasOkbMOkCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAw
NTowMzo1M1BNICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiBIaSBhbGwsCj4gPgo+ID4g
UmVjZW50bHkgSSBoYXZlIGJlZW4gbG9va2luZyBhdCBpOTE1IGFuZCBpdHMgcmF0aGVyIGludGVy
ZXN0aW5nIHBsYW5lcy4KPiA+Cj4gPiBJbiBwYXJ0aWN1bGFyIG5ld2VyIGhhcmR3YXJlIGlzIGNh
cGFibGUgb2YgdXNpbmcgMyB1bml2ZXJzYWwgcGxhbmVzIGFuZAo+ID4gYSBzZXBhcmF0ZSBjdXJz
b3Itb25seSBwbGFuZS4gQXQgdGhlIHNhbWUgdGltZSBvbmx5IDEgdG9wLW1vc3QgcGxhbmUgY2Fu
Cj4gPiBiZSBlbmFibGVkIC0gbGV0cyBjYWxscyB0aG9zZSBwbGFuZTMgb3IgY3Vyc29yLgo+ID4K
PiA+IEhlbmNlIGN1cnJlbnRseSB0aGUgaGFyZHdhcmUgaGFzIGFuIGV4dHJhIHBsYW5lIHdoaWNo
IHdlIGRvIG5vdCB1c2UuCj4KPiBPbmx5IHNrbCAoYW5kIGRlcml2YXRpdmVzKSBoYXZlIHRoYXQu
IE1vcmUgbW9kZXJuIHBsYXRmb3JtcyB3ZW50IGJhY2sgdG8KPiB0aGUgZGVkaWNhdGVkIGN1cnNv
ciBwbGFuZS4gU28gSU1PIG5vIHBvaW50IGluIGV4cG9zaW5nIHRoaXMgbWVzcyBhdAo+IGFsbC4K
PgpJIHN1c3BlY3QgeW91J3JlIHRhbGtpbmcgYWJvdXQgSWNlIExha2UsIGNvcnJlY3Q/Cgo+ID4K
PiA+IFRoZSBjdXJyZW50IERSTSBkZXNpZ24gZG9lcyBub3QgYWxsb3cgdXMgdG8gZnVsbHkgdXRp
bGlzZSB0aGUgSFcgYW5kIEkKPiA+IHdvdWxkIGxvdmUgdG8gYWRkcmVzcyB0aGF0LiBIZXJlIGFy
ZSB0aHJlZSBhcHByb2FjaGVzIHRoYXQgY29tZSB0byBtaW5kOgo+ID4KPiA+IDEpIEV4dGVuZCB0
aGUgRFJNIHBsYW5lIFVBUEkgdG86Cj4gPiAgLSBleHBvc2UgYSBtYXNrIG9mIHN1cHBvcnRlZCB0
eXBlcywgYW5kCj4gPiAgLSBhbGxvdyB1c2Vyc3BhY2UgdG8gc2VsZWN0IHRoZSB0eXBlCj4gPgo+
ID4gMikgS2VlcCB0aGUgZXhwb3NlZCBwbGFuZXMgYXMtaXMgYW5kIGxldCB0aGUgZHJpdmVyIG9y
Y2hlc3RyYXRlIHdoaWNoCj4gPiAgICBvbmUgZ2V0cyB1c2VkLgo+ID4gIC0gZmxpcCBiZXR3ZWVu
IGN1cnNvci9wbGFuZTMgYmFzZWQgb24gdGhlIHVzZS1jYXNlL0FQSSB1c2VkLCBvcgo+ID4gIC0g
b3B0IGZvciBwbGFuZTMvY3Vyc29yIGZvciBhdG9taWMgYW5kIGxlZ2FjeSBtb2Rlc2V0IGNvZGUg
cGF0aCwgb3IKPiA+ICAtIG90aGVyCj4gPgo+ID4gMykgRXhwb3NlIHBsYW5lMyBhbmQgY3Vyc29y
LCB3aGVyZWJ5IHVzaW5nIG9uZSBvZiB0aGVtICJtYXJrcyIgdGhlIG90aGVyCj4gPiAgICBhcyB1
c2VkLgo+ID4gIC0gaXMgdGhpcyBhbGxvd2VkIGJ5IHRoZSBtb2Rlc2V0IHNlbWFudGljcy9wb2xp
Y3k/Cj4gPiAgLSBkb2VzIGV4aXN0aW5nIHVzZXItc3BhY2UgaGF2ZSBmYWxsYmFjayBwYXRoPwo+
ID4KPiA+Cj4gPiBQZXJzb25hbGx5LCBJIHdvdWxkIGxvdmUgZXhpc3RpbmcgdXNlci1zcGFjZSB0
byBqdXN0IHdvcmsgd2l0aG91dAo+ID4gbW9kaWZpY2F0aW9uLiBBdCB0aGUgc2FtZSB0aW1lIG9w
dGluZyBmb3IgMiB0aGlzIHdpbGwgY2F1c2UgYSBzZXJpb3VzCj4gPiBhbW91bnQgb2YgY29tcGxp
Y2F0aW9uLCBhbmQgaW4gY2FzZSBvZiAzIHRoZSB3aG9sZSB0aGluZyB3aWxsIGJlIHZlcnkKPiA+
IGZyYWdpbGUuIFNvIG15IGN1cnJlbnQgaW5jbGluYXRpb24gaXMgdG93YXJkcyAxLgo+ID4KPiA+
IE9wZW4gcXVlc3Rpb25zOgo+ID4gIC0gRG8gd2Uga25vdyBvZiBvdGhlciBoYXJkd2FyZSB3aXRo
IHRoaXMgb3IgcmVsYXRlZCBkZXNpZ24gd2hpY2ggZG9lcwo+ID4gbm90IGZpdCB0aGUgY3VycmVu
dCBEUk0gZGVzaWduPwo+ID4gIC0gVmVuZG9yIEtNUyBzcGVjaWZpYyBVQVBJLCBpcyBmcm93bmVk
IHVwb24uIFNvIGlmIHdlIGFyZSB0byBleHRlbmQgdGhlCj4gPiBVQVBJLCBkb2VzIHRoZSBjdXJy
ZW50IGFwcHJvYWNoIHNvdW5kIHVzZWZ1bCBmb3Igb3RoZXIgSFc/Cj4gPiAgLSBEb2VzIHRoaXMg
YXBwcm9hY2ggc291bmQgcmVhc29uYWJsZSwgY2FuIG90aGVyIHNoYXJlIHRoZWlyIHZpZXcgb24g
YQo+ID4gYmV0dGVyIGFwcHJvYWNoLCB0aGF0IGFjaGlldmVzIHRoZSBnb2FsPwo+ID4KU3BlYWtp
bmcgaHlwb3RoZXRpY2FsbHk6CgpJZiB0aGUgbXV0dWFsbHkgZXhjbHVzaXZlIGRlc2lnbiB3YXMg
dmVyeSBjb21tb24sIHdoaWNoIG9mIHRoZQpwcm9wb3NlZCBzb2x1dGlvbnMgeW91IHRoaW5rIHdp
bGwgYmUgdGhlIGJlc3QgZml0PwpNYXkgSSBhc2sgeW91IGZvciBhIG1pbmktYnJhaW4gZHVtcCBo
b3cgeW91IGZvcmVzZWUgdGhhdCBiZWluZyBpbXBsZW1lbnRlZCA6LSkKClRoYW5rcwpFbWlsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
