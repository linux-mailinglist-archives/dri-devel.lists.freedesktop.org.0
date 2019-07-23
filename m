Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B790E7176D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 13:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7C89864;
	Tue, 23 Jul 2019 11:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2467289864;
 Tue, 23 Jul 2019 11:49:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 207so38221536wma.1;
 Tue, 23 Jul 2019 04:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CTjlryGUCBY4EgZvXjYZHP1qciuwHo0VIfQPP1fnM50=;
 b=Vr592Yq4I5q3tAL7Z+8M8LzBMQHmYtf1iHDlMGfcM+6DFdDaxSawBQhHMJmnJeEPi0
 OlPC4NtN2UYKGA6soBvC41nv3KBCDe8f++mYHflCouKAnleH0ACFY3SLFP+0yLzAKxwi
 /5lAIegKioUb8FvWBf3Ym+vAIzY4NmoJxr5rruP1sdnZzbq01sBCXtbNkls0H3i3zCB8
 oikXF3ht+siZW2hpgpfa62emz+QW3Kfg6vu9qhUlpmtGQG4rasidRelc8dM13e1wZ7rS
 k152Lm6V63lZrhbL8kIYkgFXgP6CuE6y5jfRGFgG/JHt/AOt4dNg9MQ/RlRghDEGkaZW
 Dbqw==
X-Gm-Message-State: APjAAAVP2hjgrsSMcAz0gVCLwf/jaCxZVa+1JDD72TPY/s6Ng7aPF1TK
 61iZIlNg5JJ5Dzw76qJIgEA=
X-Google-Smtp-Source: APXvYqyaW65w0EUkxD1UKRx3itL30d+INIGAUX7fs1EdHx1b+hwShkMbK5PMkXx584kVwTmz2zMKDg==
X-Received: by 2002:a1c:988a:: with SMTP id
 a132mr67245914wme.165.1563882585675; 
 Tue, 23 Jul 2019 04:49:45 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id c65sm40115559wma.44.2019.07.23.04.49.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 04:49:44 -0700 (PDT)
Date: Tue, 23 Jul 2019 12:49:28 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/4] drm/via: drop use of DRM(READ|WRITE) macros
Message-ID: <20190723114928.GA12807@arch-x1c3>
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-2-sam@ravnborg.org>
 <CACvgo52wD5pMjz4jEFMJXQ3kb-PDOkjyfGHhR5PeAT72otjv1g@mail.gmail.com>
 <20190722161720.GA14638@ravnborg.org>
 <CACvgo51_T1rcTnK7dYtQVdRTtcEd8am04THidD-CrHwdS3hk9w@mail.gmail.com>
 <20190722182731.GA791@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722182731.GA791@ravnborg.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CTjlryGUCBY4EgZvXjYZHP1qciuwHo0VIfQPP1fnM50=;
 b=SKFnv8rRxYsSU79+FWJohk3LnTQhuF+wbG67bnrHz6Lpp4c1bkAgt+JEmdXSTZb7C/
 oiRVe8brcS9Z6xDHQEgIDwqfo1iUUeN6NKyJvsSQEfIFyhyFFdUo8XSKFr1hbxg8nBIY
 1DWDnsTd8reZvCRTEVlhQm/sZ8hztlYsg0BZPKR5Dz/+oVILah6UrRA/sPphj9I/5Mwe
 ypV6xKVu7Cvdx8HqN3yKUBL1hb70Vui1aTYnkG9okRObXCyqq6gKg1FI0ISFqP+R4Dcu
 hLCTGDyXtCgmRi4EZHyr8YPS0jSSNJB4SYWYc0n6Kp7MJoOcLjphZCbxfp8RL52H0IyF
 +xhw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ira Weiny <ira.weiny@intel.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8yMiwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIEVtYWlsLgo+IAo+ID4gPiA+
IElNSE8gYSBmYXIgYmV0dGVyIGlkZWEgaXMgdG8gZXhwYW5kIHRoZXNlIG1hY3JvcyBhcyBzdGF0
aWMgaW5saW5lIGZ1bmN0aW9ucy4KPiA+ID4gPiBUaGUgZXh0cmEgYm9udXMgaGVyZSBpcyB0aGF0
IHRoZSBwc2V1ZG8tbWFnaWNhbCBWSUFfQkFTRSB3aWxsIGFsc28gZGlzYXBwZWFyLgo+ID4gPiA+
Cj4gPiA+ID4gU2luY2UgYWxsIHRoZSBWSUFfUkVBRDggYXJlIHVzZWQgZm9yIG1hc2tpbmcsIG9u
ZSBtaWdodCBhcyB3ZWxsIGRyb3AKPiA+ID4gPiB0aGVtIGluIGZhdm91ciBvZiB2aWFfbWFzaygp
Lgo+IAo+IExpa2UgdGhpczoKPiBzdGF0aWMgaW5saW5lIHUzMiB2aWFfcmVhZChzdHJ1Y3QgZHJt
X3ZpYV9wcml2YXRlICpkZXZfcHJpdiwgdTMyIHJlZykKPiB7Cj4gICAgICAgICByZXR1cm4gcmVh
ZGwoKHZvaWQgX19pb21lbSAqKShkZXZfcHJpdi0+bW1pby0+aGFuZGxlICsgcmVnKSk7Cj4gfQo+
IAo+IHN0YXRpYyBpbmxpbmUgdm9pZCB2aWFfd3JpdGUoc3RydWN0IGRybV92aWFfcHJpdmF0ZSAq
ZGV2X3ByaXYsIHUzMiByZWcsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgdmFs
KQo+IHsKPiAgICAgICAgIHdyaXRlbCh2YWwsICh2b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1t
aW8tPmhhbmRsZSArIHJlZykpOwo+IH0KPiAKPiBzdGF0aWMgaW5saW5lIHZvaWQgdmlhX3dyaXRl
OChzdHJ1Y3QgZHJtX3ZpYV9wcml2YXRlICpkZXZfcHJpdiwgdTMyIHJlZywKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgdmFsKQo+IHsKPiAgICAgICAgIHdyaXRlYih2YWwsICh2
b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1taW8tPmhhbmRsZSArIHJlZykpOwo+IH0KPiAKPiBz
dGF0aWMgaW5saW5lIHZvaWQgdmlhX3dyaXRlOF9tYXNrX29yKHN0cnVjdCBkcm1fdmlhX3ByaXZh
dGUgKmRldl9wcml2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IHJlZywgdTMyIG1hc2spCj4gewo+ICAgICAgICAgdTMyIHZhbDsKPiAKPiAgICAgICAgIHZhbCA9
IHJlYWRiKCh2b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1taW8tPmhhbmRsZSArIHJlZykpOwo+
ICAgICAgICAgd3JpdGViKHZhbCB8IG1hc2ssICh2b2lkIF9faW9tZW0gKikoZGV2X3ByaXYtPm1t
aW8tPmhhbmRsZSArIHJlZykpOwo+IH0KPiAKPiBzdGF0aWMgaW5saW5lIHZvaWQgdmlhX3dyaXRl
OF9tYXNrX2FuZChzdHJ1Y3QgZHJtX3ZpYV9wcml2YXRlICpkZXZfcHJpdiwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgcmVnLCB1MzIgbWFzaykKPiB7Cj4gICAg
ICAgICB1MzIgdmFsOwo+IAo+ICAgICAgICAgdmFsID0gcmVhZGIoKHZvaWQgX19pb21lbSAqKShk
ZXZfcHJpdi0+bW1pby0+aGFuZGxlICsgcmVnKSk7Cj4gICAgICAgICB3cml0ZWIodmFsICYgbWFz
aywgKHZvaWQgX19pb21lbSAqKShkZXZfcHJpdi0+bW1pby0+aGFuZGxlICsgcmVnKSk7Cj4gfQo+
IAo+IFBhdGNoZXMgYXJlIGFsbW9zdCByZWFkeSwgYnV0IGlmIHRoZXJlIGlzIGFueSBxdWljayBm
ZWVkYmFjayBsZXQgbWUKPiBrbm93Lgo+IAoKRG9uJ3QgdGhpbmsgSSd2ZSBzZWVuIGFueSAibWFz
a19hbmQiICJtYXNrX29yIiBBUEkgaW4gRFJNLiBUaGUgY29tbW9uCnRoZW1lIHNlZW1zIHRvIGJl
OgoKbXRrX2NlY19tYXNrKGRyaXZlcl9wcml2LCBvZmZzZXQsIHZhbHVlLCBtYXNrKQptYWxpZHBf
d3JpdGUzMl9tYXNrKGRyaXZlcl9wcml2LCBvZmZzZXQsIG1hc2ssIHZhbHVlKQpudmlmX21hc2so
ZHJpdmVyX3ByaXYsIGFkZHJlc3MsIG1hc2ssIHZhbHVlKQoKSFRICkVtaWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
