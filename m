Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C163E97C9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120C26EC9F;
	Wed, 30 Oct 2019 08:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A8E6E8A7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 07:43:25 +0000 (UTC)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andrea.righi@canonical.com>) id 1iPidX-0006NZ-Ie
 for dri-devel@lists.freedesktop.org; Wed, 30 Oct 2019 07:43:23 +0000
Received: by mail-wm1-f72.google.com with SMTP id o8so491515wmc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 00:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r2kgY/Eb4NrL0J9edPQFC8rYWl1U1ZwS7+lel270Qps=;
 b=A/vkFRcxkMEuLhpHoIyAh79XhvzZc2RsMs4YepVQ2FL8OcEGk6d5LzvqN7OGvd5K44
 S9EknIvJFnGd11nOT9jaUGG6upM04Tndn/39jEWfaYzbZNT09+k/CaBfF2Id+9SgPzHy
 /p8X8AAlBNqr81LfzlQgVSw8x8tzY+mmmFhWJHbh2BmD4/63TfU92IGyKk6eFUzmEGON
 9FCiGXiRmra2u22R+pr5WJ7x9WyH1jJ5vzUn92oMesMYQ0/qKhgk1C0ThgaTQOcr00We
 sCFO5rpDfShvIbD7K/EFRGGD4lqAPw3zvtA5NCElip5d2apwdoTztwRTTDIyBuaN69ZJ
 cyNQ==
X-Gm-Message-State: APjAAAXcG3UIBQFh+Ugifkd/xw9wx9dZhlJnMDOqcedEwlSGWfMC38T4
 l4XXDzcAdKOUG4ILG3bfRfiD1OMKarXY+HLQX9TUZ9GlIAHEdnHEchf9vI2mWDtmMOyyBRAoT5a
 W/Bhaxs8Q7Znz3dv5dLDsOOPHZvZaJDbWi0SEs8jpNc/5lw==
X-Received: by 2002:adf:b219:: with SMTP id u25mr22414470wra.327.1572421403154; 
 Wed, 30 Oct 2019 00:43:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLmwt311jFlTSkqSoJBn/UrU6mv9JWrlxZTNb9CaaMKdyQWyaslF1hIc5G7liA+tivNC4DKA==
X-Received: by 2002:adf:b219:: with SMTP id u25mr22414436wra.327.1572421402800; 
 Wed, 30 Oct 2019 00:43:22 -0700 (PDT)
Received: from localhost ([91.217.168.176])
 by smtp.gmail.com with ESMTPSA id c8sm1149783wml.44.2019.10.30.00.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 00:43:22 -0700 (PDT)
Date: Wed, 30 Oct 2019 08:43:21 +0100
From: Andrea Righi <andrea.righi@canonical.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
Message-ID: <20191030074321.GD2656@xps-13>
References: <20191029182320.GA17569@mwanda>
 <87zhhjjryk.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhhjjryk.fsf@x220.int.ebiederm.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
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
Cc: linux-fbdev@vger.kernel.org, security@kernel.org,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia Lawall <Julia.Lawall@lip6.fr>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDI6MDI6MTFQTSAtMDUwMCwgRXJpYyBXLiBCaWVkZXJt
YW4gd3JvdGU6Cj4gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cml0
ZXM6Cj4gCj4gPiBUaGUgImZpeCIgc3RydWN0IGhhcyBhIDIgYnl0ZSBob2xlIGFmdGVyIC0+eXdy
YXBzdGVwIGFuZCB0aGUKPiA+ICJmaXggPSBpbmZvLT5maXg7IiBhc3NpZ25tZW50IGRvZXNuJ3Qg
bmVjZXNzYXJpbHkgY2xlYXIgaXQuICBJdCBkZXBlbmRzCj4gPiBvbiB0aGUgY29tcGlsZXIuCj4g
Pgo+ID4gRml4ZXM6IDFmNWUzMWQ3ZTU1YSAoImZibWVtOiBkb24ndCBjYWxsIGNvcHlfZnJvbS90
b191c2VyKCkgd2l0aCBtdXRleCBoZWxkIikKPiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50
ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPiA+IC0tLQo+ID4gSSBoYXZlIDEzIG1vcmUg
c2ltaWxhciBwbGFjZXMgdG8gcGF0Y2guLi4gIEknbSBub3QgdG90YWxseSBzdXJlIEkKPiA+IHVu
ZGVyc3RhbmQgYWxsIHRoZSBpc3N1ZXMgaW52b2x2ZWQuCj4gCj4gV2hhdCBJIGhhdmUgZG9uZSBp
biBhIHNpbWlsYXIgc2l0dWF0aW9uIHdpdGggc3RydWN0IHNpZ2luZm8sIGlzIHRoYXQKPiB3aGVy
ZSB0aGUgc3RydWN0dXJlIGZpcnN0IGFwcGVhcnMgSSBoYXZlIGluaXRpYWxpemVkIGl0IHdpdGgg
bWVtc2V0LAo+IGFuZCB0aGVuIGZpZWxkIGJ5IGZpZWxkLgo+IAo+IFRoZW4gd2hlbiB0aGUgc3Ry
dWN0dXJlIGlzIGNvcGllZCBJIGNvcHkgdGhlIHN0cnVjdHVyZSB3aXRoIG1lbWNweS4KPiAKPiBU
aGF0IGVuc3VyZXMgYWxsIG9mIHRoZSBieXRlcyBpbiB0aGUgb3JpZ2luYWwgc3RydWN0dXJlIGFy
ZSBpbml0aWFsaXplZAo+IGFuZCB0aGF0IGFsbCBvZiB0aGUgYnl0ZXMgYXJlIGNvcGllZC4KPiAK
PiBUaGUgZ29hbCBpcyB0byBhdm9pZCBtZW1vcnkgdGhhdCBoYXMgdmFsdWVzIG9mIHRoZSBwcmV2
aW91cyB1c2VycyBvZgo+IHRoYXQgbWVtb3J5IHJlZ2lvbiBmcm9tIGxlYWtpbmcgdG8gdXNlcnNw
YWNlLiAgV2hpY2ggZGVwZW5kaW5nIG9uIHdobwo+IHRoZSBwcmV2aW91cyB1c2VyIG9mIHRoYXQg
bWVtb3J5IHJlZ2lvbiBpcyBjb3VsZCB0ZWxsIHVzZXJzcGFjZQo+IGluZm9ybWF0aW9uIGFib3V0
IHdoYXQgdGhlIGtlcm5lbCBpcyBkb2luZyB0aGF0IGl0IHNob3VsZCBub3QgYmUgYWxsb3dlZAo+
IHRvIGZpbmQgb3V0Lgo+IAo+IEkgdHJpZWQgdG8gdHJhY2UgdGhyb3VnaCB3aGVyZSAiaW5mbyIg
YW5kIHRodXMgcHJlc3VtYWJseSAiaW5mby0+Zml4IiBpcwo+IGNvbWluZyBmcm9tIGFuZCBvbmx5
IG1hZGUgaXQgYXMgZmFyIGFzICByZWdpc3Rlcl9mcmFtZWJ1ZmZlci4gIEdpdmVuCj4gdGhhdCBJ
IHN1c3BlY3QgYSBsb2NhbCBtZW1zZXQsIGFuZCB0aGVuIGEgZmllbGQgYnkgZmllbGQgY29weSBy
aWdodAo+IGJlZm9yZSBjb3B5X3RvX3VzZXIgbWlnaHQgYmUgYSBzb3VuZCBzb2x1dGlvbi4gIEJ1
dCBpY2suICBUaGF0IGlzIGEgbG90Cj4gb2YgZmllbGRzIHRvIGNvcHkuCgpJIGtub3cgaXQgbWln
aHQgc291bmQgcXVpdGUgaW5lZmZpY2llbnQsIGJ1dCB3aGF0IGFib3V0IG1ha2luZyBzdHJ1Y3QK
ZmJfZml4X3NjcmVlbmluZm8gX19wYWNrZWQ/CgpUaGlzIGRvZXNuJ3Qgc29sdmUgb3RoZXIgcG90
ZW50aWFsIHNpbWlsYXIgaXNzdWVzLCBidXQgZm9yIHRoaXMKcGFydGljdWxhciBjYXNlIGl0IGNv
dWxkIGJlIGEgcmVhc29uYWJsZSBhbmQgc2ltcGxlIGZpeC4KCi1BbmRyZWEKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
