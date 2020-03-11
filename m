Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01C7182A98
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B41E6EA44;
	Thu, 12 Mar 2020 08:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2AA89973
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:38:37 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d8so2286397qka.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=PSztimMeir0ZgjSVqMD6MDxbcT2ircpEjh/pBUCcxkE=;
 b=FqfCvHapVnhq0xpRTYom+2RXHtw7BJZ1GSWjsT5QgRWp5xKKUn/ynSLhJ1BU3W8k4g
 MvjeU/FL2p3j21fqNCQ/0VFYKMxCgO8Tpn6vVtaZDrU9v+7ZI6bQx7w31p4IEtdSE0BP
 O/xmclvaX+H+Nr+2ROKTGBT9c+aP3OJDWq0En3wPLiW39rAOyOLkaR0tHRMaaGAWO/HX
 JfE41JbIGBB2NppZaIoyMakVi23plnH4dsOKBiwOHDlAY2ySolghrhuMA0dZJoH4UPj2
 fIaogi+yGs2hq+RmzAl9rUHjMUt2qyc6fMxdayyYAM7qoF+upz6aqEoRlRJfNT47hsz2
 QNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=PSztimMeir0ZgjSVqMD6MDxbcT2ircpEjh/pBUCcxkE=;
 b=ubkBup7ipgZYGrCEYBlRoDsmRjHYAbDX6TlTNGffA/JmSeVNH2rj9PODVauL0e+Mql
 6DVDucVStWdkyLifDps+y4atdbLN2tcRRnaff/1TfDQbzs4MpES0Ygbf1spKUKT7Bbo4
 M6WlHXWBh34+t5mB0hMKnoLsTaScPLZ9zj/FuV3paOCG4Y2rtBza0l2agrev5oriUEv6
 3yAWLgzXAUww9CV2ttEBq7bV8R5jdQUw7XRAvna5SXrKuri2nZd2rM6jpoj8pro7Sesl
 XI5ERsuioJVjbJOeG/OpqUgPpl0jMoDB1gYJFrEYS0Y4K1cP6JCs373+jv91K82on8CV
 41Zw==
X-Gm-Message-State: ANhLgQ3XANsKbsJz+8Qkh4CsJMjJqMJd0y5H+P1EbbtEhrKlJhh3/QK6
 OUBPRiIvlU+seOxddgg+ieRJMQ==
X-Google-Smtp-Source: ADFU+vtrYi8syGwRALzru/6pjS/74XrJyzkc1WPhc99FqeQUk8Mp5gEOoHSzyQHoCPd/niKYP+gD2w==
X-Received: by 2002:a37:b944:: with SMTP id j65mr3045791qkf.374.1583937516721; 
 Wed, 11 Mar 2020 07:38:36 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id w132sm3269729qkb.96.2020.03.11.07.38.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:38:36 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC2VH-0004r9-NZ; Wed, 11 Mar 2020 11:38:35 -0300
Date: Wed, 11 Mar 2020 11:38:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: christian.koenig@amd.com
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
Message-ID: <20200311143835.GD31668@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
 <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Logan Gunthorpe <logang@deltatee.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDM6MzM6MDFQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxMS4wMy4yMCB1bSAxNTowNCBzY2hyaWViIEphc29uIEd1bnRob3JwZToK
PiA+IE9uIFdlZCwgTWFyIDExLCAyMDIwIGF0IDAyOjUxOjU2UE0gKzAxMDAsIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4gPiA+IENoZWNrIGlmIHdlIGNhbiBkbyBwZWVyMnBlZXIgb24gdGhlIFBD
SWUgYnVzLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+ID4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kbWFfYnVmLmMgfCA0ICsrKysKPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kbWFfYnVmLmMKPiA+ID4gaW5kZXggYWVmMTJlZTJmMWUzLi5iYmY2NzgwMGM4YTYgMTAwNjQ0
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMK
PiA+ID4gQEAgLTM4LDYgKzM4LDcgQEAKPiA+ID4gICAjaW5jbHVkZSA8ZHJtL2FtZGdwdV9kcm0u
aD4KPiA+ID4gICAjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgo+ID4gPiAgICNpbmNsdWRlIDxs
aW51eC9kbWEtZmVuY2UtYXJyYXkuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wY2ktcDJwZG1h
Lmg+Cj4gPiA+ICAgLyoqCj4gPiA+ICAgICogYW1kZ3B1X2dlbV9wcmltZV92bWFwIC0gJmRtYV9i
dWZfb3BzLnZtYXAgaW1wbGVtZW50YXRpb24KPiA+ID4gQEAgLTE3OSw2ICsxODAsOSBAQCBzdGF0
aWMgaW50IGFtZGdwdV9kbWFfYnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAo+ID4g
PiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJv
LmJkZXYpOwo+ID4gPiAgIAlpbnQgcjsKPiA+ID4gKwlpZiAocGNpX3AycGRtYV9kaXN0YW5jZV9t
YW55KGFkZXYtPnBkZXYsICZhdHRhY2gtPmRldiwgMSwgdHJ1ZSkgPCAwKQo+ID4gPiArCQlhdHRh
Y2gtPnBlZXIycGVlciA9IGZhbHNlOwo+ID4gPiArCj4gPiBBcmUgdGhlcmUgb3RoZXIgcmVsYXRl
ZCBwYXRjaGVzIHRoYW4gdGhpcyBzZXJpZXM/Cj4gPiAKPiA+IHAycCBkbWEgbWFwcGluZyBuZWVk
cyB0byBiZSBkb25lIGluIGNvbW1vbiBjb2RlLCBpbiBwMnBkbWEuYyAtIGllIHRoaXMKPiA+IG9w
ZW4gY29kaW5nIGlzIG1pc3NpbmcgdGhlIGJ1c19vZmZzZXQgc3R1ZmYsIGF0IGxlYXN0Lgo+IAo+
IFllYWgsIEknbSBhd2FyZSBvZiB0aGlzLiBCdXQgSSBjb3VsZG4ndCBmaW5kIGEgYmV0dGVyIHdh
eSBmb3Igbm93LgoKV2VsbCwgaXQgaXNuJ3Qgb3B0aW9uYWwgOikKIAo+ID4gSSByZWFsbHkgZG8g
bm90IHdhbnQgdG8gc2VlIGRyaXZlcnMgb3BlbiBjb2RlIHRoaXMgc3R1ZmYuCj4gPiAKPiA+IFdl
IGFscmVhZHkgaGF2ZSBhIHAycGRtYSBBUEkgZm9yIGhhbmRsaW5nIHRoZSBzdHJ1Y3QgcGFnZSBj
YXNlLCBzbyBJCj4gPiBzdWdnZXN0IGFkZGluZyBzb21lIG5ldyBwMnBkbWEgQVBJIHRvIGhhbmRs
ZSB0aGlzIGZvciBub24tc3RydWN0IHBhZ2UKPiA+IGNhc2VzLgo+ID4gCj4gPiBpZSBzb21lIHRo
aW5nIGxpa2U6Cj4gPiAKPiA+IGludCAncDJwZG1hIG1hcCBiYXInKAo+ID4gICAgIHN0cnVjdCBw
Y2lfZGV2aWNlICpzb3VyY2UsCj4gPiAgICAgdW5zaWduZWQgaW50IHNvdXJjZV9iYXJfbnVtYmVy
LAo+ID4gICAgIHN0cnVjdCBwY2lfZGV2aWNlICpkZXN0LAo+ID4gICAgIHBoeXNhZGRyJmxlbiAq
YXJyYXlfb2Zfb2Zmc2V0cyAmIGxlbmd0aCBwYWlycyBpbnRvIHNvdXJjZSBiYXIsCj4gPiAgICAg
c3RydWN0IHNjYXR0ZXJsaXN0ICpvdXRwdXRfc2dsKQo+IAo+IFdlbGwgdGhhdCdzIGV4YWN0bHkg
d2hhdCBJIGhhdmUgdG8gYXZvaWQgc2luY2UgSSBkb24ndCBoYXZlIHRoZSBhcnJheSBvZgo+IG9m
ZnNldHMgYXJvdW5kIGFuZCB3YW50IHRvIGF2b2lkIGNvbnN0cnVjdGluZyBpdC4KCk1heWJlIGl0
IGRvZXNuJ3QgbmVlZCBhbiBhcnJheSBvZiBvZmZzZXRzIC0ganVzdCBhIHNpbmdsZSBvZmZzZXQg
YW5kCmNhbGxlcnMgY2FuIGl0ZXJhdGUgdGhlIEFQST8KCj4gU2ltaWxhciBwcm9ibGVtIGZvciBk
bWFfbWFwX3Jlc291cmNlKCkuIE15IGV4YW1wbGUgZG9lcyB0aGlzIG9uIGRlbWFuZCwgYnV0Cj4g
ZXNzZW50aWFsbHkgd2UgYWxzbyBoYXZlIHVzZSBjYXNlcyB3aGVyZSB0aGlzIGlzIGRvbmUgb25s
eSBvbmNlLgoKSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgcG9ydGFibGUuIERvZXMgYW55IElPTU1V
IEhXIG5lZWQgdG8ga25vdyBQMlAKaXMgaGFwcGVuaW5nIHRvIHNldHVwIHN1Y2Nlc3NmdWxseT8g
V2UgY3VycmVudGx5IHN1cHBvcnQgc3VjaCBhIG5hcnJvdwpzY29wZSBvZiBIVyBmb3IgUDJQLi4K
Cj4gSWRlYWxseSB3ZSB3b3VsZCBoYXZlIHNvbWUgZnVuY3Rpb24gdG8gY3JlYXRlIGFuIHNnbCBi
YXNlZCBvbiBzb21lIGFyYml0cmFyeQo+IGNvbGxlY3Rpb24gb2Ygb2Zmc2V0cyBhbmQgbGVuZ3Ro
IGluc2lkZSBhIEJBUi4KCklzbid0IHRoYXQgd2hhdCBJIGp1c3QgcHJvcG9zZWQgYWJvdmUgPwoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
