Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7821B6B2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 15:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98E6EC4B;
	Fri, 10 Jul 2020 13:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76776EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:41:42 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9122E207DD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594388502;
 bh=i75CBXIgGhcZUa4Q5eVv78+LmWfKj2lmU+kA47/adfU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BVP2jY9BJ54jjApBEPD0xvCJ3d7zT7Oyt4yCdw6oxKWIRmgnSMcGpIU28L0X3wCxh
 bXzut1P37bZxexmGGjWs8ERCJodOW/vggL3EuRUxtOy4TZBDtPsFf8/2Lxaz6AIvYX
 2BbnS0Pdbqa9ra4kz6hbuXtlqtqQ4nbR47BzrjBc=
Received: by mail-ot1-f50.google.com with SMTP id 72so4223546otc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 06:41:42 -0700 (PDT)
X-Gm-Message-State: AOAM531touwLWgna9XkwGOU5lRKDI/7Ndv21uc4IFY75YyWpHRlCX9Tz
 8ksbsyWdD76HqYwXxWVEBasoy6WbxmXdgetqaI8=
X-Google-Smtp-Source: ABdhPJzMDks2bKtBSSU06I1kMxmshqTzgvxqZ+s5CEUL5PYeC51lRTbaxITZFvhimohokw08oLmR71FMFMUIrqKF7Zk=
X-Received: by 2002:a9d:7553:: with SMTP id b19mr11274563otl.77.1594388501943; 
 Fri, 10 Jul 2020 06:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200610141052.13258-1-jgross@suse.com>
 <094be567-2c82-7d5b-e432-288286c6c3fb@suse.com>
 <CGME20200709091750eucas1p18003b0c8127600369485c62c1e587c22@eucas1p1.samsung.com>
 <ec21b883-dc5c-f3fe-e989-7fa13875a4c4@suse.com>
 <170e01b1-220d-5cb7-03b2-c70ed3ae58e4@samsung.com>
 <CAMj1kXGE52Y6QQhGLU6r_9x6TVftZqfS7zyLCiDusZhV4tbhjg@mail.gmail.com>
 <b4e60a2f-e761-d9ad-88ad-fe041109c063@suse.com>
In-Reply-To: <b4e60a2f-e761-d9ad-88ad-fe041109c063@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jul 2020 16:41:30 +0300
X-Gmail-Original-Message-ID: <CAMj1kXGsAsOiBsbhT9TXNBsjba=GXHegYbGOpaVFR0vZ8w3+bw@mail.gmail.com>
Message-ID: <CAMj1kXGsAsOiBsbhT9TXNBsjba=GXHegYbGOpaVFR0vZ8w3+bw@mail.gmail.com>
Subject: Re: [PATCH] efi: avoid error message when booting under Xen
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMCBKdWwgMjAyMCBhdCAxNjozOCwgSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2Uu
Y29tPiB3cm90ZToKPgo+IE9uIDEwLjA3LjIwIDE1OjI3LCBBcmQgQmllc2hldXZlbCB3cm90ZToK
PiA+IE9uIEZyaSwgMTAgSnVsIDIwMjAgYXQgMTM6MTcsIEJhcnRsb21pZWogWm9sbmllcmtpZXdp
Y3oKPiA+IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4KPiA+PiBb
IGFkZGVkIEVGSSBNYWludGFpbmVyICYgTUwgdG8gQ2M6IF0KPiA+Pgo+ID4+IEhpLAo+ID4+Cj4g
Pj4gT24gNy85LzIwIDExOjE3IEFNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+ID4+PiBPbiAyOC4w
Ni4yMCAxMDo1MCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiA+Pj4+IFBpbmc/Cj4gPj4+Pgo+ID4+
Pj4gT24gMTAuMDYuMjAgMTY6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPj4+Pj4gZWZpZmJf
cHJvYmUoKSB3aWxsIGlzc3VlIGFuIGVycm9yIG1lc3NhZ2UgaW4gY2FzZSB0aGUga2VybmVsIGlz
IGJvb3RlZAo+ID4+Pj4+IGFzIFhlbiBkb20wIGZyb20gVUVGSSBhcyBFRklfTUVNTUFQIHdvbid0
IGJlIHNldCBpbiB0aGlzIGNhc2UuIEF2b2lkCj4gPj4+Pj4gdGhhdCBtZXNzYWdlIGJ5IGNhbGxp
bmcgZWZpX21lbV9kZXNjX2xvb2t1cCgpIG9ubHkgaWYgRUZJX1BBUkFWSVJUCj4gPj4+Pj4gaXNu
J3Qgc2V0Lgo+ID4+Pj4+Cj4gPgo+ID4gV2h5IG5vdCB0ZXN0IGZvciBFRklfTUVNTUFQIGluc3Rl
YWQgb2YgRUZJX0JPT1Q/Cj4KPiBIb25lc3RseSBJJ20gbm90IHN1cmUgRUZJX0JPT1QgaXMgYWx3
YXlzIHNldCBpbiB0aGF0IGNhc2UuIElmIHlvdSB0ZWxsCj4gbWUgaXQgaXMgZmluZSB0byBqdXN0
IHJlcGxhY2UgdGhlIHRlc3QgdG8gY2hlY2sgZm9yIEVGSV9NRU1NQVAgSSdtIGZpbmUKPiB0byBt
b2RpZnkgbXkgcGF0Y2guCj4KCgpZZXMgcGxlYXNlCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
