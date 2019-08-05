Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E763980FE6
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 03:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A299189DEA;
	Mon,  5 Aug 2019 01:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3E289DEA;
 Mon,  5 Aug 2019 01:03:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id j17so2569960lfp.3;
 Sun, 04 Aug 2019 18:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmrFAHC07DlrBROd7WWwjkRjuc3qzI6oUcV/GoHKzYk=;
 b=EPZ23ZnKprNSy+VgUX8TZCuJPcs7aPK5UceoiYkbGMLDDbTLVkpSFff/2ucrz7KHlr
 hLfx5GP07VgXbZpHmxk5Crz3matkz3UEUpbFXNpLd4YAlbxgoyYlk1OObEOlBknz83FW
 UQyDTbsm5bDXwTd0ZXi63QShWefS7U8FdBdV8PxWB/Q0De+EqmMU7zxT329uspH0SOT8
 Z486pLzXEk4A4TbRu7ce37g7q4LKftwjzvw4F0u1xLY9oI3Kb8pKN55kDSYHwJaDYato
 P9IlM3CAd6oumTGAfY5XGxRmprmQNK/Ep159uEBfaXcogopcSOCkVrechKT/HyDKqS/y
 zkKw==
X-Gm-Message-State: APjAAAXjYfFm3Zm6Ja/MFS1efbYlMJWLKJ1b4mLJxN46TQxgkbEK9Ipd
 +UOnLobW8GgbwtRFvJD5M6hbDYEjE1lm7oozGBY=
X-Google-Smtp-Source: APXvYqySxgn/5teLdmDwFi+c6xRp59f1ywZmW6wEWVf6qrCjqr3LJLIRyhDIvjAYIsznufd8BX4pO11hDUMPPEIQZIw=
X-Received: by 2002:a05:6512:4c8:: with SMTP id
 w8mr4546391lfq.98.1564967026478; 
 Sun, 04 Aug 2019 18:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNDYzcpDCM5P0fVWF30N+TMD62CXjv902z39mrCWULsjA@mail.gmail.com>
In-Reply-To: <CABXGCsNDYzcpDCM5P0fVWF30N+TMD62CXjv902z39mrCWULsjA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 5 Aug 2019 11:03:34 +1000
Message-ID: <CAPM=9tw5By7txR8UVriLxyveX0kff3aNNiMWCTjbVyk33wp5XQ@mail.gmail.com>
Subject: Re: The issue with page allocation 5.3 rc1-rc2 (seems drm culprit
 here)
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WmrFAHC07DlrBROd7WWwjkRjuc3qzI6oUcV/GoHKzYk=;
 b=iWafSLJaEp0VfnD00FV8DkZCUUcui7hR/eLGX47Wh4alduSlUkHdl2PLoX4j7wOFa7
 6ioeaUayLRoYahIpLPfCvenkZhbZa2hGi8TR1xpLJB0APzD8KaDBmk19+sSntPXAP6Jm
 apFDkyNwhJuMQbTmX+wVAmuSpgEOMg1RZ3QZo0pNu46Au5ZsIY6O4fyEMXd7Qjytukj1
 gCY1722Mgxhy25un956dYmMT9K5cmutcjHyf3K0uuoTb7d0oSE1caneCpy2NY5EnQj7w
 0cwKdkXDQEX7VhwGKXsDqWdsgURGy7ulZu+0cfXEdfOOc1Ggr7LB4JYDU/WTWcFVDkrI
 D0gw==
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA1IEF1ZyAyMDE5IGF0IDA4OjIzLCBNaWtoYWlsIEdhdnJpbG92CjxtaWtoYWlsLnYu
Z2F2cmlsb3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIGZvbGtzLAo+IFR3byB3ZWVrcyBhZ28g
d2hlbiBjb21taXQgMjIwNTFkOWM0YTU3IGNvbWluZyB0byBteSBzeXN0ZW0uCj4gU3RhcnRlZCBo
YXBwZW4gcmFuZG9tbHkgZXJyb3JzOgo+ICJnbm9tZS1zaGVsbDogcGFnZSBhbGxvY2F0aW9uIGZh
aWx1cmU6IG9yZGVyOjQsCj4gbW9kZToweDQwY2MwKEdGUF9LRVJORUx8X19HRlBfQ09NUCksCj4g
bm9kZW1hc2s9KG51bGwpLGNwdXNldD0vLG1lbXNfYWxsb3dlZD0wIgo+IFN5bXB0b21zOgo+IFRo
ZSBzY3JlZW4gZ29lcyBvdXQgYXMgaW4gZW5lcmd5IHNhdmluZy4KPiBBbmQgaXQgaXMgaW1wb3Nz
aWJsZSB0byB3YWtlIHRoZSBjb21wdXRlciBpbiBhIGZldyBtaW51dGVzLgo+Cj4gSSBhbSBtYWtp
bmcgYmlzZWN0IGFuZCBsb29rcyBsaWtlIHRoZSBmaXJzdCBiYWQgY29tbWl0IGlzIDQ3NmU5NTVk
ZDY3OS4KPiBIZXJlIGZ1bGwgYmlzZWN0IGxvZ3M6IGh0dHBzOi8vbWVnYS5uei8jRiFrZ1lGeEFJ
YiF2MXRjSEFOUHkybnMxbGg0TFFMZUlnCj4KPiBJIHdyb3RlIGFib3V0IG15IGZpbmQgdG8gdGhl
IGFtZC1nZnggbWFpbGluZyBsaXN0LCBidXQgbm8gb25lIGFuc3dlciBtZS4KPiBVbnRpbCB5ZXN0
ZXJkYXksIEkgdGhvdWdodCBpdCB3YXMgYSBidWcgaW4gdGhlIGFtZGdwdSBkcml2ZXIuCj4gQnV0
IHllc3RlcmRheSwgYWZ0ZXIgdGhlIG5leHQgb2NjdXJyZW5jZSBvZiBhbiBlcnJvciwgdGhlIHN5
c3RlbSBoYW5ncwo+IGNvbXBsZXRlbHkgYWxyZWFkeSB3aXRoIGFub3RoZXIgZXJyb3IuCgpEb2Vz
IGl0IGhhcHBlbiBpZiB5b3UgZGlzYWJsZSBDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzAsIEknbSBh
c3N1bWluZwp5b3UgZG9uJ3QgaGF2ZSBhIG5hdmkgZ3B1LgoKSSB0aGluayBzb21lIHN0cnVjdCBn
cmV3IHRvbyBsYXJnZSBpbiB0aGUgbmF2aSBtZXJnZSwgaG9wZWZ1bGx5IGFtZApjYXJlLCBlbHNl
IHdlIGhhdmUgdG8gZGlzYWJsZSBuYXZpIGJlZm9yZSByZWxlYXNlLgoKSSd2ZSBkaXJlY3RlZCB0
aGlzIGF0IHRoZSBtYWluIEFNRCBkZXZzIHdobyBtaWdodCBiZSBoZWxwZnVsLgoKRGF2ZS4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
