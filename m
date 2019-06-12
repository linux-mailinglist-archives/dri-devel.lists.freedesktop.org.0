Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C1642975
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 16:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6AD892BC;
	Wed, 12 Jun 2019 14:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE88F892BC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:36:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a14so24226605edv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 07:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=zgD5nyS+qUbnsse/i2cHRzc4J0BbMGF1GvW16ltfAHk=;
 b=BoCbBUyTGHSlYzW32QJ+3LDKRmCS8jC3JRa6SS+3sNgVh1R1gjzirNja7xrruGR5pm
 xZ/2tjogtQNttdzXgQu00v38yHu+eP+9iVuresHcqC07wyuU8bDENTQP7nLS+hmrAwdH
 IE+Gs5NYL/Q9HlzGhFNgeMNZFuIT2gqsl2ak71yPxxvMAVZJcU5Uo5Ov1s2pN8yI1JWc
 1maOzk1eCd9HA8TM7GvxKT91TaU5tnk2dq1ftPCmRiq1IU+CSvjuAizoHSbYcrw5VZBP
 TM0hfhXhRenPxnxTDXERM/EC1TJMTM+F1qlSHXbDpXwe+1n3NSbnYqKiyjL/w6X6Qni4
 KGtg==
X-Gm-Message-State: APjAAAVTtxc+I5KcV8I0QAvzwWsfxrNbREyo0a2LW7ZjfMHYBAiIldRX
 SG65/CGH5jOg6QIMLNBrvQ4/VirIAFw=
X-Google-Smtp-Source: APXvYqx+vp6YVKG1K+Efz4uOmaUFkKpHo6Bn1l1HPjAImtHXA6aLYXO9t5Td797at1HYQaw4dArvGw==
X-Received: by 2002:a17:906:670c:: with SMTP id
 a12mr25107207ejp.290.1560350198482; 
 Wed, 12 Jun 2019 07:36:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id j3sm18788edh.82.2019.06.12.07.36.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 07:36:37 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:36:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/8] drm/mgag200: Rewrite cursor handling
Message-ID: <20190612143635.GN2458@phenom.ffwll.local>
References: <20190604154201.14460-1-tzimmermann@suse.de>
 <20190604154201.14460-7-tzimmermann@suse.de>
 <20190605095817.ijhq3z7oaptd3wff@sirius.home.kraxel.org>
 <81937cd8-1b1f-007b-97e3-18a3b586b87f@suse.de>
 <CAKMK7uEwoCFWxtD-ktZSxjhS2TyOEoRovBX18gk3doGyCCrS2Q@mail.gmail.com>
 <87d444a2-f897-8989-5453-ebacaaa15964@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d444a2-f897-8989-5453-ebacaaa15964@suse.de>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=zgD5nyS+qUbnsse/i2cHRzc4J0BbMGF1GvW16ltfAHk=;
 b=eF2o+TbTuJ/fbSUbGLYFfcpWhvOgNMnv0yUhvJ5JeuWmVN7TtrSDc38cUBnqCrhqvL
 YQMEGHgUgXMZN8Lcyu/T3OrhhBjNw5L1VymVGQZSqgTIuAad9dWF26pjil8o6v6ijOKk
 yEgGHXP32XtI9iM5T3St1DVyKJrDSvT8R8WeU=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDk6Mjc6MjFBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxMS4wNi4xOSB1bSAxNzozMyBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAyOjMyIFBNIFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToKPiA+Pgo+ID4+IEhpCj4gPj4KPiA+PiBB
bSAwNS4wNi4xOSB1bSAxMTo1OCBzY2hyaWViIEdlcmQgSG9mZm1hbm46Cj4gPj4+IE9uIFR1ZSwg
SnVuIDA0LCAyMDE5IGF0IDA1OjQxOjU5UE0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Ogo+ID4+Pj4gVGhlIGN1cnNvciBoYW5kbGluZyBpbiBtZ2FnMjAwIGlzIGNvbXBsaWNhdGVkIHRv
IHVuZGVyc3RhbmQuIEl0IHRvdWNoZXMgYQo+ID4+Pj4gbnVtYmVyIG9mIGRpZmZlcmVudCBCT3Ms
IGJ1dCBkb2Vzbid0IHJlYWxseSB1c2UgYWxsIG9mIHRoZW0uCj4gPj4+Pgo+ID4+Pj4gUmV3cml0
aW5nIHRoZSBjdXJzb3IgdXBkYXRlIHJlZHVjZXMgdGhlIGFtb3VudCBvZiBjdXJzb3Igc3RhdGUu
IFRoZXJlIGFyZQo+ID4+Pj4gdHdvIEJPcyBmb3IgZG91YmxlLWJ1ZmZlcmVkIEhXIHVwZGF0ZXMu
IFRoZSBzb3VyY2UgQk8gdXBkYXRlcyB0aGUgb25lIHRoYXQKPiA+Pj4+IGlzIGN1cnJlbnRseSBu
b3QgZGlzcGxheWVkIGFuZCB0aGVuIHN3aXRjaGVzIGJ1ZmZlcnMuIEV4cGxpY2l0IEJPIGxvY2tp
bmcKPiA+Pj4+IGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgY29kZS4gQk9zIGFyZSBzaW1wbHkg
cGlubmVkIGFuZCB1bnBpbm5lZCBpbiB2aWRlbwo+ID4+Pj4gUkFNLgo+ID4+Pgo+ID4+PiBDdXJz
b3JzIGFyZSBub3QgdGhhdCBiaWcgYWZ0ZXIgYWxsLCBzbyBtYXliZSBwaW4gdGhlIHR3byBCT3Mg
Zm9yCj4gPj4+IGRvdWJsZS1idWZmZXJpbmcgcGVybWFuZW50bHkgaW4gdnJhbSB0byBzaW1wbGlm
eSB0aGluZ3MgZnVydGhlcj8KPiA+Pj4KPiA+Pj4gQWxzbyBmYWN0b3Jpbmcgb3V0IHRoZSBjb2Rl
IHdoaWNoIHVwZGF0ZXMgdGhlIHR3byBCT3MgdG8gYSBzZXBhcmF0ZQo+ID4+PiBmdW5jdGlvbiBz
aG91bGQgaGVscCBtYWtpbmcgdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPiA+Pgo+ID4+IFRoZSBj
dXJzb3IgaGFuZGxpbmcgaW4gdGhlIGFzdCBkcml2ZXIgaXMgc2ltaWxhciwgYnV0IHVzZXMgb25l
IHNpbmdsZSBCTwo+ID4+IHRvIGhvbGQgYm90aCBjdXJzb3IgYnVmZmVycy4gSSdtIHRoaW5raW5n
IGFib3V0IGhvdyB0byB0dXJuIGJvdGgKPiA+PiBpbXBsZW1lbnRhdGlvbnMgaW50byBhIGdlbmVy
aWMgaGVscGVyIGZvciBsZWdhY3kgY3Vyc29ycyAoaS5lLiwgbG93Cj4gPj4gbnVtYmVyIG9mIGNv
bG9ycyBvciBwYWxldHRlKS4gVGhpcyB3b3VsZCBhbHNvIGJlIGhlbHBmdWwgZm9yIG15IHdvcmsg
b24KPiA+PiBmYmRldiBwb3J0aW5nLgo+ID4+Cj4gPj4gT25lIGlkZWEgaXMgdG8gYWRhcHQgZGVm
ZXJyZWQgSS9PLiBEUk0gd291bGQgZXhwb3NlIGFuIEFSR0Igc2hhZG93Cj4gPj4gYnVmZmVyIHRv
IHVzZXJzcGFjZSBhbmQgbGV0IHRoZSBtbWFwIGltcGxlbWVudGF0aW9uIHVwZGF0ZSB0aGUgSFcK
PiA+PiBidWZmZXJzIChpbmNsdWRpbmcgZGl0aGVyaW5nLCBwYWxldHRlIHNldHVwLCBldGMuKS4K
PiA+IAo+ID4gTm8gbW1hcCBnYW1lcyBuZWVkZWQgd2l0aCBrbXMsIHdlIGV4cGVjdCB1c2Vyc3Bh
Y2UgdG8gZ2l2ZSB1cyBhbiBpb2N0bAo+ID4gY2FsbCBpbiBhbGwgY2FzZXMuIGZiZGV2IGlzIHRo
ZSBsZWdhY3kgaG9ycm9ycyB0aGF0IHdvcmtzIGRpZmZlcmVudGx5Lgo+IAo+IFRoYW5rcyBmb3Ig
Y2xhcmlmeWluZyB0aGlzLiBDb252ZXJzaW9uIHNob3VsZCBiZSBtdWNoIGVhc2llciB0aGlzIHdh
eS4gSQo+IHNhdyB0aGUgZGlydHkgY2FsbGJhY2sgYW5kIHRoZSBESVJUWUZCIGlvY3RsLCBidXQg
SSBkb24ndCBzYXcgYW55dGhpbmcKPiBpbiBXZXN0b24gdGhhdCBjYWxscyBpdC4gU28gSSBhc3N1
bWVkIHRoYXQgaXQncyBvYnNvbGV0ZSBvciBvcHRpb25hbC4KCkl0J3Mgbm90IG9wdGlvbmFsIG5v
ciBvYnNvbGV0ZSwgYnV0IHlvdSBvbmx5IG5lZWQgdG8gY2FsbCBkaXJ0eWZiIGlmIHlvdQpkbyBm
cm9udGJ1ZmZlciByZW5kZXJpbmcuIFdoaWNoIHdlc3RvbiBkb2VzbnQgZG8uIEFzIGxvbmcgYXMg
eW91IHBhZ2VmbGlwLAp0aGUgcGFnZWZsaXAgd2lsbCBtYWtlIHN1cmUgdGhlIGJ1ZmZlciBjb250
ZW50cyBnZXRzIHVwZGF0ZWQuCi1EYW5pZWwKCj4gCj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4g
Cj4gPiBTbyBmb3IgY3Vyc29ycywgYXNzdW1pbmcgeW91IGhhdmUgdW5pdmVyc2FsIGN1cnNvcnMs
IHlvdSBqdXN0IG5lZWQgdG8KPiA+IHVwZGF0ZSB0aGUgc2hhZG93ZWQgY29weSBpbiB0aGUgcHJl
cGFyZV9mYiBwbGFuZSBob29rLiBGb3IKPiA+IG5vbi11bml2ZXJzYWwgcGxhbmUgZHJpdmVycyB5
b3UgbmVlZCB0byBkbyB0aGF0IHNvbWV3aGVyZSBpbiB5b3VyCj4gPiBzZXQvbW92ZV9jdXJzb3Ig
aG9va3MgKEkgdGhpbmsgYm90aCBvZiB0aGVtKS4gQXNpZGU6IEZvciBub24tY3Vyc29ycwo+ID4g
dGhlcmUncyBhbHNvIHRoZSBkaXJ0eWZiIGlvY3RsLCB3aGljaCBzZXJ2ZXMgdGhlIHNhbWUgcHVy
cG9zZS4KPiA+IAo+ID4gQ2hlZXJzLCBEYW5pZWwKPiA+IAo+ID4+Cj4gPj4gQmVzdCByZWdhcmRz
Cj4gPj4gVGhvbWFzCj4gPj4KPiA+Pj4gQnV0IGV2ZW4gYXMtaXMgdGhlIHBhdGNoIGlzIGEgc3Rl
cCBpbnRvIHRoZSByaWdodCBkaXJlY3Rpb24uCj4gPj4+Cj4gPj4+IEFja2VkLWJ5OiBHZXJkIEhv
ZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiA+Pj4KPiA+Pj4gY2hlZXJzLAo+ID4+PiAgIEdl
cmQKPiA+Pj4KPiA+Pgo+ID4+IC0tCj4gPj4gVGhvbWFzIFppbW1lcm1hbm4KPiA+PiBHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyCj4gPj4gU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyYXNzZSA1
LCA5MDQwOSBOdWVybmJlcmcsIEdlcm1hbnkKPiA+PiBHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBN
YXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgKPiA+PiBIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykKPiA+
Pgo+ID4gCj4gPiAKPiAKPiAtLSAKPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXIKPiBTVVNFIExpbnV4IEdtYkgsIE1heGZlbGRzdHJhc3NlIDUsIDkwNDA5IE51
ZXJuYmVyZywgR2VybWFueQo+IEdGOiBGZWxpeCBJbWVuZMO2cmZmZXIsIE1hcnkgSGlnZ2lucywg
U3JpIFJhc2lhaAo+IEhSQiAyMTI4NCAoQUcgTsO8cm5iZXJnKQo+IAoKCgoKLS0gCkRhbmllbCBW
ZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZm
d2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
