Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C06F1CE5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BDA6E065;
	Wed,  6 Nov 2019 17:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADD26E065
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:56:24 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id c19so5487336otr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 09:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wVNAkLALcXf3ECseCh6fIvYcw+YM/ecsEduyd+L1OzY=;
 b=J//aoOUTug7tJRcolWuhTX47P9+FrPBhPIN5iOxBMzOBuQX1W4u5b9bh9K3H5tIZMd
 eqNMGawSH0KcUnu4K3/wcDTGBgyioR7y21nvNyVoSh+hb0+r8Is3J7iIr3TY34csSlH+
 Nm1uSl38SJuRyzC5hVvbdPdaEHp4sdPv+qS5agfkHqoZW+st7VXtdtDb0buSz5PTQxij
 Tih5JbYYexvO1yTFog1I84d9Gj1p4WI2f8EtGSHg3CL7MkdF7F75JZT5EkF33OHYObt5
 R67IXQE1TgEwl8MMPSDN0l1YuBFOFE9bEeQoQaHN1DHTiCObofAc6Ha79Zd7GHl4fz8y
 ci6w==
X-Gm-Message-State: APjAAAWRBXi6SH59hVRIAc2nnv9060xcvjSS9DZpnJ5+tSJRbexC+JG9
 c477E7iLGfMEV8eWV5upP0g1dgD80KgPv3tQZsuUHikh
X-Google-Smtp-Source: APXvYqzxbABqhuHazS+yjloa/OpTTnWvOIpez+z4/iPCKEvqK9ko+QH4PbBYKrqM2WqcfHeTeq609guGaPY66JUrYAc=
X-Received: by 2002:a9d:62d8:: with SMTP id z24mr2924164otk.188.1573062983862; 
 Wed, 06 Nov 2019 09:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20191106164755.31478-1-daniel.vetter@ffwll.ch>
 <201911060920.71D7E76E@keescook>
In-Reply-To: <201911060920.71D7E76E@keescook>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 6 Nov 2019 18:56:12 +0100
Message-ID: <CAKMK7uGq5o+jj-YigTomfx2XEHh5eUjnKD70Trkc6opZOViUHg@mail.gmail.com>
Subject: Re: [PATCH] drm: Limit to INT_MAX in create_blob ioctl
To: Kees Cook <keescook@chromium.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wVNAkLALcXf3ECseCh6fIvYcw+YM/ecsEduyd+L1OzY=;
 b=Zb6XWmzK5jZjbch2MifX0aU6MslUtqvH7JbhSPtSBmHPH66O7HbtFoy6LpphJKLUwB
 723tGBxQfPxaoBW6PpvIpwg6lf3XhiiVWKXW1UzkcxiMbWml24UT3FTI+Lageu5vNGFT
 INVLdgOdIaQLo3ou/yTt8IgVtwT6MW23mq+KA=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 syzbot <syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA2OjI0IFBNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDA1OjQ3OjU1UE0gKzAx
MDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBUaGUgaGFyZGVuZWQgdXNlcmNweSBjb2RlIGlz
IHRvbyBwYXJhbm9pZCBldmVyIHNpbmNlOgo+ID4KPiA+IGNvbW1pdCA2YTMwYWZhOGMxZmJkZTVm
MTBmOWM1ODRjMjk5MmFhM2M3ZjdhOGZlCj4gPiBBdXRob3I6IEtlZXMgQ29vayA8a2Vlc2Nvb2tA
Y2hyb21pdW0ub3JnPgo+ID4gRGF0ZTogICBXZWQgTm92IDYgMTY6MDc6MDEgMjAxOSArMTEwMAo+
ID4KPiA+ICAgICB1YWNjZXNzOiBkaXNhbGxvdyA+IElOVF9NQVggY29weSBzaXplcwo+ID4KPiA+
IENvZGUgaXRzZWxmIHNob3VsZCBoYXZlIGJlZW4gZmluZSBhcy1pcy4KPgo+IEkgaGFkIHRvIGdv
IHJlYWQgdGhlIHN5emJvdCByZXBvcnQgdG8gdW5kZXJzdGFuZCB3aGF0IHdhcyBhY3R1YWxseSBi
ZWluZwo+IGZpeGVkIGhlcmUuIENhbiB5b3UgYmUgYSBiaXQgbW9yZSB2ZXJib3NlIGluIHRoaXMg
Y29tbWl0IGxvZz8gSXQgc291bmRzCj4gbGlrZSBodWdlIHVzZXJjb3B5IHNpemVzIHdlcmUgYWxs
b3dlZCBieSBkcm0gKHRob3VnaCBJIGd1ZXNzIHRoZXkgd291bGQKPiBmYWlsIGdyYWNlZnVsbHkg
aW4gc29tZSBvdGhlciB3YXk/KSBidXQgYWZ0ZXIgNmEzMGFmYThjMWZiLCB0aGUgY29weQo+IHdv
dWxkIHllbGwgYWJvdXQgc2l6ZXMgd2hlcmUgSU5UX01BWCA8IHNpemUgPCBVTE9OR19NQVggLSBz
aXplb2YoLi4uKSA/CgpUaGUgV0FSTklORyBzZWVtcyB0byBoYXZlIGJlZW4gdGhlIG9ubHkgYmFk
IGVmZmVjdC4gSSBndWVzcyBpbgpwcmFjdGljZSB0aGUgcmVhbCBiaWcgc3R1ZmYgZmFpbHMgYXQg
bWVtb3J5IGFsbG9jYXRpb24gdGltZSwgYnV0CnNob3VsZG4ndCBvdmVyZmxvdy4gT3IgbWF5YmUg
SSBzdGlsbCBkb24ndCBnZXQgaG93IHRoaXMgQyB0aGluZyB3b3Jrcy4KQW55d2F5IEkgZmlndXJl
ZCB0aGUgY2l0ZWQgcGF0Y2ggaXMgZ29vZCBlbm91Z2gsIHVzZXJwdHIgY29waWVzID4KSU5UX01B
WCBhcmVuJ3QgYWxsb3dlZCBhbnltb3JlLCBzbyB3ZSBuZWVkIHRvIGFkanVzdCBvdXIgb3ZlcmZs
b3cKY2hlY2tzLgotRGFuaWVsCgo+IFdoYXQgd2FzIHRoZSBwcmlvciBmYWlsdXJlIG1vZGUgdGhh
dCBtYWRlIHRoZSBleGlzdGluZyBVTE9OR19NQVggY2hlY2sKPiBzYWZlPyBZb3VyIHBhdGNoIGxv
b2tzIGZpbmUsIHRob3VnaDoKPgo+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNo
cm9taXVtLm9yZz4KPgo+ID4gUmVwb3J0ZWQtYnk6IHN5emJvdCtmYjc3ZTk3ZWJmMDYxMmVlNjkx
NEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gPiBGaXhlczogNmEzMGFmYThjMWZiICgidWFj
Y2VzczogZGlzYWxsb3cgPiBJTlRfTUFYIGNvcHkgc2l6ZXMiKQo+ID4gQ2M6IEtlZXMgQ29vayA8
a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+ID4gQ2M6IEFsZXhhbmRlciBWaXJvIDx2aXJvQHplbml2
LmxpbnV4Lm9yZy51az4KPiA+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgo+ID4gQ2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+
ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Cj4gPiAtLQo+ID4gS2Vlcy9BbmRyZXcsCj4gPgo+ID4gU2luY2UgdGhpcyBpcyAtbW0gY2FuIEkg
aGF2ZSBhIHN0YWJsZSBzaGExIG9yIHNvbWV0aGluZyBmb3IKPiA+IHJlZmVyZW5jaW5nPyBPciBk
byB5b3Ugd2FudCB0byBpbmNsdWRlIHRoaXMgaW4gdGhlIC1tbSBwYXRjaCBib21iIGZvcgo+ID4g
dGhlIG1lcmdlIHdpbmRvdz8KPgo+IFRyYWRpdGlvbmFsbHkgdGhlc2UgdGhpbmdzIGxpdmUgaW4g
YWtwbSdzIHRyZWUgd2hlbiB0aGV5IGFyZSBmaXhlcyBmb3IKPiBwYXRjaGVzIGluIHRoZXJlLiBJ
IGhhdmUgbm8gaWRlYSBob3cgdGhlIEZpeGVzIHRhZ3Mgd29yayBpbiB0aGF0IGNhc2UsCj4gdGhv
dWdoLi4uCj4KPiAtS2Vlcwo+Cj4gPiAtRGFuaWVsCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX3Byb3BlcnR5LmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJvcGVydHkuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVydHkuYwo+ID4gaW5kZXgg
ODkyY2U2MzZlZjcyLi42ZWUwNDgwM2MzNjIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3Byb3BlcnR5LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvcGVydHku
Ywo+ID4gQEAgLTU2MSw3ICs1NjEsNyBAQCBkcm1fcHJvcGVydHlfY3JlYXRlX2Jsb2Ioc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IGxlbmd0aCwKPiA+ICAgICAgIHN0cnVjdCBkcm1fcHJv
cGVydHlfYmxvYiAqYmxvYjsKPiA+ICAgICAgIGludCByZXQ7Cj4gPgo+ID4gLSAgICAgaWYgKCFs
ZW5ndGggfHwgbGVuZ3RoID4gVUxPTkdfTUFYIC0gc2l6ZW9mKHN0cnVjdCBkcm1fcHJvcGVydHlf
YmxvYikpCj4gPiArICAgICBpZiAoIWxlbmd0aCB8fCBsZW5ndGggPiBJTlRfTUFYIC0gc2l6ZW9m
KHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYikpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBFUlJf
UFRSKC1FSU5WQUwpOwo+ID4KPiA+ICAgICAgIGJsb2IgPSBrdnphbGxvYyhzaXplb2Yoc3RydWN0
IGRybV9wcm9wZXJ0eV9ibG9iKStsZW5ndGgsIEdGUF9LRVJORUwpOwo+ID4gLS0KPiA+IDIuMjQu
MC5yYzIKPiA+Cj4KPiAtLQo+IEtlZXMgQ29vawoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
