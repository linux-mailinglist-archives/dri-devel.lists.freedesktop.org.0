Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B084E845
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 14:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C066E8A7;
	Fri, 21 Jun 2019 12:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77BA6E8A7;
 Fri, 21 Jun 2019 12:50:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g135so6206679wme.4;
 Fri, 21 Jun 2019 05:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xXehgg4WqjFUJs7cTioC8C9cagukYi5KP+ybrrumBnE=;
 b=D/gmC4k/IJ2HMftPJhcDgD0f2rE6EfwsvVjk6+Gp22kDzu0sSFt8KHUXFNlnZiq3As
 U02M156SD1fUEU/MbCEscES2609koPzjSqEzpeI0f3VBSIWKqemgtW11llrU4dzJ3nO9
 psy9a0RGQ625M5YxV6uRWBp5A1SFnelH7MO4GkPMqHdJKpdZiTtNpsv2/Wxj5o2l6BQP
 lN7+pmpNV27IsNL0rRMJjaqUjDBYH+QV/52O23Vo/Ri0C4Z6xqwpBRzmF15ZRo1jrDzs
 F9EdHISDJk9u+luzKpeFNaH1dtCDNZeUKt3AEw67j/xqJsRtjU70TMLademMUh72sDAZ
 ZROQ==
X-Gm-Message-State: APjAAAU8FwLEzFas/qLzCPuxDWGOvo8ZMdwPxE07CRabF1T4wcKzj88F
 o/WXOGkfnbj/+vT24XNYpqt1NWuQ
X-Google-Smtp-Source: APXvYqzXamRFWld+gKbmSybTmh1N6EgUO6ONSoiffLPClrEeyjY0ztFQAe3uLEIAh9yShc+g03kY7g==
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr4140365wme.146.1561121400406; 
 Fri, 21 Jun 2019 05:50:00 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id o8sm2379088wrj.71.2019.06.21.05.49.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 05:49:59 -0700 (PDT)
Date: Fri, 21 Jun 2019 13:47:51 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
Message-ID: <20190621124751.GE21486@arch-x1c3>
References: <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
 <20190621105347.GB21486@arch-x1c3>
 <338bb519-05f1-cb76-d965-81237f432937@amd.com>
 <20190621115845.GC21486@arch-x1c3>
 <76158d1f-676d-2afa-244b-934967a9cb75@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <76158d1f-676d-2afa-244b-934967a9cb75@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xXehgg4WqjFUJs7cTioC8C9cagukYi5KP+ybrrumBnE=;
 b=ocWTqD8eQ7hwzSOjtYSB2hJ7t2NxP1QbCTi6OcrnBsSsZlSh1cWnGinvzf8I6/qw9K
 w+mCkiVlGWHG9Lwf052D5AyD+eHINRfn1xnRANSo0qp8EwhfMN6OShCzn8n7MxCBY5ni
 L4MdhWl9lyG+Rv1T6jckyiyjgoJscteJeTQU9wvZ7INTa1ogiZwqLSH98MwDkBFHfehx
 Tr2tYe0sWYHDqaPX2i7o0LhrdWayc1A3pyPgMzuhRwjCeG32D8Gk/RhtHOciVwmKSo9k
 W2tt1XYZlEjAaaj3Z+WeAj0FakzF3CnVyF4UzkSVEWGonccvD2eTGhB/rC/YYm5GZaQw
 BMJg==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8yMSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gQW0gMjEuMDYuMTkgdW0g
MTM6NTggc2NocmllYiBFbWlsIFZlbGlrb3Y6Cj4gPiBPbiAyMDE5LzA2LzIxLCBLb2VuaWcsIENo
cmlzdGlhbiB3cm90ZToKPiA+PiBBbSAyMS4wNi4xOSB1bSAxMjo1MyBzY2hyaWViIEVtaWwgVmVs
aWtvdjoKPiA+Pj4gT24gMjAxOS8wNi8yMSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4gPj4+
PiBbU05JUF0KPiA+Pj4+IFdlbGwgcGFydGlhbGx5LiBUaGF0IFJBRFYgYnJva2UgaXMgdW5mb3J0
dW5hdGUsIGJ1dCB3ZSBoYXZlIGRvbmUgc28gbWFueQo+ID4+Pj4gY3VzdG9taXplZCB1c2Vyc3Bh
Y2Ugc3R1ZmYgYm90aCBiYXNlZCBvbiBNZXNhL0REWCBhcyB3ZWxsIGFzIGNsb3NlZAo+ID4+Pj4g
c291cmNlIGNvbXBvbmVudHMgdGhhdCBpdCBpcyBqdXN0IGhpZ2hseSBsaWtlbHkgdGhhdCB3ZSB3
b3VsZCBicmVhawo+ID4+Pj4gc29tZXRoaW5nIGVsc2UgYXMgd2VsbC4KPiA+Pj4+Cj4gPj4+IEFz
IGFuIGVuZ2luZWVyIEkgbGlrZSB0byB3b3JrIHdpdGggdGFuZ2libGVzLiBUaGUgaGlnaGx5IGxp
a2VseSBwYXJ0IGlzCj4gPj4+IHByb2JhYmxlLCBidXQgYXMgbWVudGlvbmVkIG11bHRpcGxlIHRp
bWVzIHRoZSBzZXJpZXMgYWxsb3dzIGZvciBhIF9kZWFkXwo+ID4+PiB0cml2aWFsIHdheSB0byBh
ZGRyZXNzIGFueSBzdWNoIHByb2JsZW1zLgo+ID4+IFdlbGwgdG8gY2xhcmlmeSBteSBjb25jZXJu
IGlzIHRoYXQgdGhpcyB3b24ndCBiZSBzbyB0cml2aWFsLgo+ID4+Cj4gPj4gWW91IGltcGxlbWVu
dGVkIG9uIHdvcmthcm91bmQgZm9yIG9uZSBzcGVjaWZpYyBjYXNlIGFuZCBpdCBpcyBwZXJmZWN0
bHkKPiA+PiBwb3NzaWJsZSB0aGF0IGZvciBvdGhlciBjYXNlcyB3ZSB3b3VsZCBoYXZlIHRvIGNv
bXBsZXRlbHkgcmV2ZXJ0IHRoZQo+ID4+IHJlbW92YWwgb2YgRFJNX0FVVEguCj4gPj4KPiA+IEkg
d291bGQgZW5jb3VyYWdlIHlvdSB0byB0YWtlIGEgY2xvc2VyIGxvb2sgYXQgbXkgcGF0Y2ggYW5k
IHBvaW50IG91dAo+ID4gaG93IHBhcmNpY3VsYXIgY2FzZXMgY2Fubm90IGJlIGhhbmRsZWQuCj4g
Cj4gV2VsbCB0aGUgbGFzdCB0aW1lIEkgbG9va2VkIGl0IG9ubHkgYmxvY2tlZCB0aGUgZmlyc3Qg
Y2FsbCB0byB0aGUgSU9DVEwuCj4gCkhtbSBpbnRlcmVzdGluZywgeW91J3JlIHJlcGxpZWQgdG8g
bXkgcGF0Y2ggd2l0aG91dCBldmVuIHJlYWRpbmcgaXQgOictKApDYW4geW91IHBsZWFzZSBnaXZl
IGl0IGEgY2xvc2UgbG9vayBhbmQgcmVwbHkgaW5saW5lPwoKWzFdIGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU1heS8yMTkyMzguaHRtbAoKPiA+
ICBGcm9tIHlvdXIgZXhwZXJpZW5zZSwgZG8gdXNlci1zcGFjZSBkZXZlbG9wZXJzIGNhcmUgYWJv
dXQgZG9pbmcgKG9yCj4gPiBnZW5lcmFsbHkgZG8pIHRoZSByaWdodCB0aGluZz8KPiAKPiBObywg
bm90IGF0IGFsbC4gRXhjZXB0IGZvciBNYXJlayBhbmQgTWljaGVsIHRoZXkganVzdCB0YWtlIHdo
YXQgd29ya3MgCj4gYW5kIGV2ZW4gTWFyZWsgaXMgb2Z0ZW4gc2hvcnQtY3V0dGluZyBvbiB0aGlz
Lgo+IApJbnRlcmVzdGluZywgZ3Vlc3MgSSBzaG91bGQgaGF2ZSBhc2tlZCB0aGlzIHF1ZXN0aW9u
IGZyb20gdGhlIHN0YXJ0LgoKVGhhbmtzCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
