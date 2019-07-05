Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 273DE61B07
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1B989A59;
	Mon,  8 Jul 2019 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F80B89862;
 Fri,  5 Jul 2019 19:24:48 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id u19so21236712ior.9;
 Fri, 05 Jul 2019 12:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zRb65W3CSh6kt4Vgzb6vItxrEN29lrJAYQzpEQzbVII=;
 b=d6b4X9E8B6LUwBTGbUnFPAo9BiBaeX2FkX61IiZxQiVWIZ+BvJsLXgAgLX4gnk/76Q
 3ZfjufFNmbrjP/y0tWX4ZJLSG1wWYvWucvf5+dXimmGpjIZO62MP63fLaUZ2XozlSzEh
 6ONHizz/wo7fGLpXS6/vQ9kfdhN0VPldtsckmYHV+/XXuQkLi4xXBnkiyej9tM1rq7gv
 jnF/kZuGKPBPyAUL/ZmRazZlRBupKqSTv/20ava1UD1mmWUCVOTQ5h56mGKHkG/7fsDQ
 0IObM/xqImweO5+tVVEOYIAXRnhT9qHlQKVk0K+Sr/X1CHL3oKz97LkcI2gNQjPC0Ng6
 rZUQ==
X-Gm-Message-State: APjAAAVisWYIB1LpE+mkRDUKvXkCLvcrfjNDvJT5tDrKMDbwc9C/j4Lw
 X9uLRBwfUVI5gCSXFeM5+ve7F4jsLSmwchwhDFI=
X-Google-Smtp-Source: APXvYqzBIuakKtxq8PhyT5SD6ZKgdCKGE0KpmSS7hRvQNo8wkQr2muelU6+8A9w9N+1CFSl0An79Y6QAV/ejkoJl1QA=
X-Received: by 2002:a6b:f607:: with SMTP id n7mr4367876ioh.263.1562354687930; 
 Fri, 05 Jul 2019 12:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com>
 <CAF6AEGsGRcuk3xnWG8KspW4wzG38o-Xg8tybnND9Lb24PWP5dw@mail.gmail.com>
In-Reply-To: <CAF6AEGsGRcuk3xnWG8KspW4wzG38o-Xg8tybnND9Lb24PWP5dw@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Fri, 5 Jul 2019 13:24:37 -0600
Message-ID: <CAOCk7Nrxhf7YNkmtM1G-TE=rNC=L2zk4AJcGNvvcHpOMEMW6Tg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use eariler mixers when possible
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zRb65W3CSh6kt4Vgzb6vItxrEN29lrJAYQzpEQzbVII=;
 b=VBwKZc9v6eG+kEN6cYdqeUM8TLOB0E4CdynlREvI2S6FYkq015fmIZjeB680Av4quX
 GTY/G8e/miWfQ/DbeDV8WRsL6DzzEqjH7s8TmsZyiQrkilyYliTWJZFJkwpwEb95VuaH
 MRyPFaIkHOAehbOLR2EwoagnYUmM2jdan5yq1m1SxOlEdfIEvh21U+PKDYuP0DlgdIdd
 eReyvta7q++lyFlUY0XWJr6bY2JcjiimWY8v8xdMd+fStaOp6ZLY4ZbENlUqLvlj44Xd
 L/Sfm91Xzsrz46gi2/GvxsJWRa+oy4YV3iSn1UtY2V86A3Gji/0wm9GdnPRNNnweoEs3
 sbdQ==
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMSwgMjAxOSBhdCAxOjU1IFBNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAxLCAyMDE5IGF0IDEwOjQxIEFNIEplZmZyZXkg
SHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBXaGVuIGFzc2ln
bmluZyBhIG1peGVyLCB3ZSB3aWxsIGl0ZXJhdGUgdGhyb3VnaCB0aGUgZW50aXJlIGxpc3QgbG9v
a2luZyBmb3IKPiA+IGEgc3VpdGFibGUgbWF0Y2guICBUaGlzIHJlc3VsdHMgaW4gc2VsZWN0aW5n
IHRoZSBsYXN0IG1hdGNoLiAgV2Ugc2hvdWxkCj4gPiBzdG9wIGF0IHRoZSBmaXJzdCBtYXRjaCwg
c2luY2UgbG93ZXIgbnVtYmVyZWQgbWl4ZXJzIHdpbGwgdHlwaWNhbGx5IGhhdmUKPiA+IG1vcmUg
Y2FwYWJpbGl0aWVzLCBhbmQgYXJlIGxpa2VseSB0byBiZSB3aGF0IHRoZSBib290bG9hZGVyIHVz
ZWQsIGlmIHdlCj4gPiBhcmUgbG9va2luZyB0byByZXVzZSB0aGUgYm9vdGxvYWRlciBjb25maWcg
aW4gZnV0dXJlLgo+Cj4gSSB0aGluayBmb3IgbWF0Y2hpbmcgYm9vdGxvYWRlciBjb25maWcsIHdl
IG5lZWQgdG8gcmVhZCBpdCBvdXQgb2YgdGhlCj4gaHcgYW5kIGRvIGl0IHRoZSBoYXJkIHdheSwg
cmF0aGVyIHRoYW4gbWFraW5nIGFzc3VtcHRpb25zLgo+Cj4gRm9yIHBpY2tpbmcgaHdwaXBlIGZv
ciBhIHBsYW5lLCBJIG1hZGUgYW4gZWZmb3J0IHRvIHBpY2sgdGhlIGF2YWlsYWJsZQo+IGh3cGlw
ZSB3LyB0aGUgKmxlYXN0KiBjYXBhYmlsaXRpZXMgdGhhdCBmaXQgdGhlIHJlcXVpcmVtZW50cyAo
aWUuCj4gc2NhbGluZy95dXYvZXRjKSBpbiBvcmRlciB0byBsZWF2ZSB0aGUgbW9yZSBjYXBhYmxl
IGh3cGlwZSBhdmFpbGFibGUKPiBmb3IgZnV0dXJlIHVzZS4gIE5vdCBzdXJlIGlmIHNhbWUgYXBw
cm9hY2ggd291bGQgbWFrZSBzZW5zZSBmb3IKPiBtaXhlcnM/ICBCdXQgbm90IHN1cmUgaWYgcGlj
a2luZyBzb21ldGhpbmcgdGhhdCBib290bG9hZGVyIHByb2JhYmx5Cj4gYWxzbyB3b3VsZCBoYXZl
IHBpY2tlZCBpcyBhIGdyZWF0IGFyZ3VtZW50Lgo+Cj4gSSBkbyBoYXZlIHNvbWUgKG5vdyBhbmNp
ZW50KSBjb2RlIGZyb20gZGI0MTAvbWRwNSB0byByZWFkIG91dCBoZSBodwo+IHN0YXRlLi4gSSAq
dGhpbmsqIHRoYXQgbWlnaHQgaGF2ZSBwb3N0LWRhdGVkIGR5bmFtaWNhbGx5IHBpY2tpbmcKPiBt
aXhlcnMuICAoVGhlIG9sZGVyIG1kcDUgb24gZGI0MTBjIGFsc28gaGFkIHRvIGRlYWwgd2l0aCBm
aWd1cmluZyBvdXQKPiBTTVAgYmxvY2sgY29uZmlnLCBpaXJjLi4gdGhhbmtmdWxseSBuZXdlciBt
ZHA1IGRvZXNuJ3QgaGF2ZSB0byBkZWFsCj4gd2l0aCB0aGF0LikKClNvIEkgcmlwcGVkIHRoaXMg
b3V0IGFuZCByZXRlc3RlZCBhcyBJIHdhcyBsb29raW5nIGJhY2sgYXQgaXQuICBUaGluZ3MKc3Rp
bGwgd29yay4gIEkgcHJvYmFibHkgc2F3IGEgbmVlZCBmb3IgdGhpcyBpbiB0aGUgbWlkZGxlIG9m
IG15CmhhY2tpbmcsIGJ1dCBpdHMgY2xlYXJseSBub3QgbmVlZGVkIGFueW1vcmUgc28gbGV0cyBk
cm9wIGl0IGZvciBub3cuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
