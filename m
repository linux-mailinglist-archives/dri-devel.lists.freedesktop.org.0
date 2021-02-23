Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F75A322EF1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 17:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1A46E9EA;
	Tue, 23 Feb 2021 16:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A0C6E9E6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 16:41:05 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id l23so16177623otn.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0c/u13FM+Tf/KWUJ42CsXaFbjEuSkNXvNOWD9RPO8Y0=;
 b=gZCrv9K37FrE8yh54ngDFZenukJiscdBn5za9Vh/7lNUf7eiW+AFpK1WVNHM9f1+m7
 upom1kTHDaozIP6bRRPbmAMaJ5mdk1KR6py4cxsU1ZcT/KjFJmDywYowFnExPH8ysd2h
 KND0sQzt2xkABPLax494HE/oS82YZ4VGhAJ1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0c/u13FM+Tf/KWUJ42CsXaFbjEuSkNXvNOWD9RPO8Y0=;
 b=r2aW4wxnsS7x0mmH86BGqqnbXOzqkTSDAOA5CT5TnK+LuXmmke6dXwaVae0V1Dk7GV
 v24TuIq+Mw8l800kxVId6RhagSy2/Nfvz5Vouu9dlOL6pHGaZFy378GRAd6KYqsxIKIg
 xPodNR2rws54nl12/f/XOBEMhpbOVEn7fx/go0S5xrAG1Qe4pR/OdSL9zXRzkVaUuEVn
 GypXYYyzNA6sBAwByYSy7vxW7mBwVaL7vJyEh0qqnfc+nYLyeFa9JiEGF7Lduj7T/zde
 jdgz5B1j/b7SR4X+m7Z+1j1YIF/L+3H9Qe/6d8jDh0xh1O5PPTCb0GLyMWmCRwohTKrz
 YvZA==
X-Gm-Message-State: AOAM5337Io4SbcxQuiT+e7e5bHBUBek7bPj7wDzq0spBiMf/K6DZyOjC
 tX/UwZgjax8URgZa3DPuTnfhKAAACkD1Tq7Rvi7T7g==
X-Google-Smtp-Source: ABdhPJyVbhfjqVLGph+y+VQ/XgXZuGNrzcx43gSB0U4RJTOk5HkC7HU+/JjJ8TM0cbPcw4wMhHcmv2gjUgvSRXi6Pw4=
X-Received: by 2002:a9d:2270:: with SMTP id
 o103mr20658797ota.303.1614098464392; 
 Tue, 23 Feb 2021 08:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <87lfbfc5w2.fsf@yahoo.co.uk>
 <CAKMK7uFs7z6fAXOntWwBNPBq26PBOkHJ09atv_cYeJCpk4FwjQ@mail.gmail.com>
 <87im6idbca.fsf@yahoo.co.uk>
In-Reply-To: <87im6idbca.fsf@yahoo.co.uk>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 23 Feb 2021 17:40:53 +0100
Message-ID: <CAKMK7uG6b-YX7sTTsabQVxA+F9Em42t=SpV-5DL2mWwTcZgD2A@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Neil Roberts <nroberts@igalia.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjMsIDIwMjEgYXQgNDo1OSBQTSBOZWlsIFJvYmVydHMgPG5yb2JlcnRzQGln
YWxpYS5jb20+IHdyb3RlOgo+Cj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cml0
ZXM6Cj4KPiA+IGRybV9nZW1fc2htZW1fZmF1bHQoKSBkb2VzIG5vdCBzZWVtIHRvIGNoZWNrIGZv
ciBwdXJnZWQgb2JqZWN0cyBhdCBhbGwuCj4gPgo+ID4gTm8gaWRlYSBob3cgdGhpcyB3b3Jrcywg
b3IgaWYgaXQgZXZlciB3b3JrZWQsIGJ1dCB5ZWFoIHNvbWV0aGluZyBpcwo+ID4gY2xlYXJseSBz
dGlsbCBidXN0ZWQuCj4KPiBPaCBvZiBjb3Vyc2UsIHRoZSBmYXVsdCBoYW5kbGVyIGRvZXNu4oCZ
dCBjaGVjayB0aGlzLiBJ4oCZdmUgYWRkZWQgYSBzZWNvbmQKPiBwYXRjaCB0byBtYWtlIGl0IGNo
ZWNrIGFuZCBwb3N0ZWQgaXQgYXMgYSBzZXBhcmF0ZSBzZXJpZXMgaGVyZToKPgo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDIxLUZlYnJ1YXJ5LzI5
ODE3MC5odG1sCj4KPiBUaGUgdHdvIHBhdGNoZXMgY29tYmluZWQgbWFrZSB0aGUgSUdUIHRlc3Qg
cGFzcy4KPgo+ID4gRGVmaW5pdGVseSBhIGdvb2QgaWRhZSB0byBoYXZlIGFuIGlndC4gYnR3IHRv
IG1ha2UgdGhhdCBmYXN0ZXIgeW91IGNhbgo+ID4gZWl0aGVyIHVzZSB0aGUgdm1fZHJvcF9jYWNo
ZXMgZmlsZSBmcm9tIHByb2MgKGl0J3MgYSBiaXQgYSBoYW1tZXIpLCBvcgo+ID4gd2hhdCBJIHJl
Y29tbWVuZDogSGF2ZSBhIGRlZGljYXRlZCBkZWJ1Z2ZzIGZpbGUgdG8gb25seSBkcm9wCj4gPiBl
dmVyeXRoaW5nIGZyb20geW91ciBzaHJpbmtlci4gVGhhdCdzIG11Y2ggcXVpY2tlciBhbmQgIGNv
bnRyb2xsZWQuCj4gPiBTZWUgZS5nLiB0dG1fdHRfZGVidWdmc19zaHJpbmsgZnJvbSBkNGJkNzc3
NmE3YWMgKCJkcm0vdHRtOiByZXdvcmsKPiA+IHR0bV90dCBwYWdlIGxpbWl0IHY0Iikgd2hpY2gg
cmVjZW50bHkgbGFuZGVkIGluIGRybS1taXNjLW5leHQuCj4KPiBJIGFncmVlIGl0IHdvdWxkIGJl
IGdyZWF0IHRvIGhhdmUgYSBkZWJ1Z2ZzIG9wdGlvbiB0byB0cmlnZ2VyIHRoZSBwdXJnZS4KPiBJ
IHdvbmRlciBpZiBzb21lb25lIG1vcmUgaW52b2x2ZWQgaW4gUGFuZnJvc3Qgd291bGQgbGlrZSB0
byBpbXBsZW1lbnQKPiB0aGlzLCBiZWNhdXNlIEkgYW0gYWN0dWFsbHkgdHJ5aW5nIHRvIHdvcmsg
b24gVkM0IGFuZCB0aGlzIGlzIGFscmVhZHkKPiB0dXJuaW5nIG91dCB0byBiZSBxdWl0ZSBhIGxv
dCBvZiB5YWsgc2hhdmluZyA6KSBJ4oCZZCBhbHNvIGxpa2UgdG8KPiBpbXBsZW1lbnQgdGhlIHNh
bWUgZGVidWdmcyBvcHRpb24gYW5kIElHVCB0ZXN0IGZvciBWQzQuCgpJZiB3ZSBwdXNoIHRoZSBz
aHJpbmtlciBzZXR1cCBpbnRvIHRoZSBoZWxwZXJzICh0aGlzIG1lYW5zIHdlCm1pbmltYWxseSBu
ZWVkIGFuIGxydSwgYW5kIHByb2JhYmx5IG1vcmUgcmVhc29uYWJsZSBsb2NraW5nIHRoYXQgc2ht
ZW0KaGVscGVycyB1c2VzIHJpZ2h0IG5vdykgdGhlbiB3ZSBjb3VsZCBoYXZlIG9uZSBkZWJ1Z2Zz
IGZpbGUgZm9yIGFsbApkcml2ZXJzIHN1cHBvcnRpbmcgcHVyZ2VhYmxlIG9iamVjdHMuIENvdWxk
IHRoZW4gZXZlbiBzaGFyZSBzb21lIG9mCnRoZSBpZ3QsIG9ubHkgdGhlIGlvY3RsIGNvZGUgd291
bGQgbmVlZCB0byBiZSBkcml2ZXIgc3BlY2lmaWMuCgpJdCdzIGEgYml0IG9mIHdvcmsgdGhvdWdo
LgotRGFuaWVsCgo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgo+Cj4gUmVnYXJkcywKPiAtIE5l
aWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
