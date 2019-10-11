Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F823D3A72
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 09:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63BA6EBC1;
	Fri, 11 Oct 2019 07:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7EA6EBC1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 07:56:47 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c195so6329984lfg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 00:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQGlBjxrbnywssmQJ87NwAoJZT+0lBTYiPkUBZuGVTw=;
 b=V0Y/mw/uq9hKEZ5plb6Bf3RWK129XAnmAI/0SqSjL7oJMEl3f3nxfLj9adZsE0/oxO
 +VHBQTtmZ+GJdEZqXoj2/BAK3bQ6Nwzd4Eum63vD4UVkX5cBzMfGhEl4K8/fnkp3ZJaR
 rcrcw/Tz4MnEIKIA4MViu07t33NuKDIuj9bOSeuWooK84FygUUBMq/BQj345NYXgy40P
 fHKD1dg5Xz6bwdFYmNpBG6Z2mQJ2wQ9pERJzKYMgN0IE+Y6aGCBFMdR3n9s4bUfusIeO
 vFB2k3ciqimfnK4hnD55IPuYb9TsqLGT4yw5Fvwu3WXWE9CkKMPYYfLtzyX/KYUZ+Xrk
 iEsw==
X-Gm-Message-State: APjAAAWeMzmcO6gVX34/mH1fSoTQsmAnbQqeOy4En8LAVMuNBP0S1ROr
 BdtMFjFN+1sVb6vRhu3PC5OsXCg903yAROp+Ax3qVQ==
X-Google-Smtp-Source: APXvYqydtD0YWYlut/gC+NgQe7cNI5MaxlEW5q+G5DXSbrVkjh1YI+pJD62gc97sVpJKCLOnUn61MURODiP2A09VwnY=
X-Received: by 2002:ac2:47f1:: with SMTP id b17mr7461543lfp.31.1570780605507; 
 Fri, 11 Oct 2019 00:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191010092526.10419-1-narmstrong@baylibre.com>
 <20191010092526.10419-5-narmstrong@baylibre.com>
 <20191010132601.GA10110@arm.com>
 <44f1771f-d640-f23d-995f-7bfcadd213bc@baylibre.com>
 <20191010173152.GA575@arm.com>
 <CAKMK7uE2p_VbJB5PfS1DJ5AzOm60p22c+YOJ18FtD4_ec61LwQ@mail.gmail.com>
In-Reply-To: <CAKMK7uE2p_VbJB5PfS1DJ5AzOm60p22c+YOJ18FtD4_ec61LwQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 11 Oct 2019 08:56:26 +0100
Message-ID: <CAPj87rOMupGnq5B=eWjcu0-Bkj_HmfLDR3Aqk1VDCXg8TwYP0w@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/meson: plane: add support for AFBC mode for OSD1
 plane
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UQGlBjxrbnywssmQJ87NwAoJZT+0lBTYiPkUBZuGVTw=;
 b=RgpbaF19+L4HjyZuj1xRpxDlVrIO1vDy19Dfiz5Rl7uDlpaNesNszWjtEE9sDYJAfy
 DWB4PA/scgT+4iGBuozxAmUtD+FvG5SdMxz4IdXLFuMA4xeYGfbdscQx29VS9bKFQrg1
 qbFLHgpt3WwYvkXuPScYudDFc306eo3kz+yGJW+BCD9T8ZJvXFCwnvaX5RdgcCsQqop+
 9rQYMxDyYY2iAN4KShC6XgL/KUfSez5HDUN8kqPDWGWm8zBDdTWRsvEhNP0q0xR/FL8O
 fD+pCT46Vgr14iF3sExQl/Bqn0LM0FNj9b26b1jsI/8mJ7S7/xJzRLVLdLxvJ6Vh2Cyz
 Ee9A==
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
Cc: nd <nd@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBGcmksIDExIE9jdCAyMDE5IGF0IDA4OjQ2LCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+IHdyb3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDE5IGF0IDc6MzIgUE0gQXlhbiBI
YWxkZXIgPEF5YW4uSGFsZGVyQGFybS5jb20+IHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMTAsIDIw
MTkgYXQgMDM6NDE6MTVQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gPiA+IFNvcnJ5
IEkgZG9uJ3QgdW5kZXJzdGFuZCwgeW91IGFzayBtZSB0byBsaW1pdCBBRkJDIHRvIEFCR1I4ODg4
ID8KPiA+Cj4gPiBBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNpb24sIGFzIHBlciB0aGUgbGluaywg
dGhlIGZvcm1hdHMgd2hpY2ggYXJlCj4gPiBzdWdnZXN0ZWQgd2l0aCBBRkJDX0ZPUk1BVF9NT0Rf
WVRSIGFyZSB0aGUgQkdSL0FCR1IgZm9ybWF0cyAoYXMKPiA+IGxpc3RlZCBpbiB0aGUgJ0FGQkMg
Zm9ybWF0cycgdGFibGUpCj4gPgo+ID4gVGh1cywgYW55IG90aGVyIHBlcm11dGF0aW9uIG9mIHRo
ZSBjb21wb25lbnRzIG1pZ2h0IG1ha2UgaXQgaW5jb21wYXRpYmxlCj4gPiB3aXRoIHNvbWUgb3Ro
ZXIgQUZCQyBwcm9kdWNlcnMvY29uc3VtZXJzLgo+Cj4gVWgsIHRoYXQncyBub3QgaG93IHRoaXMg
aXMgc3VwcG9zZWQgdG8gYmUgdXNlZC4gRHJpdmVycyBhcmUgbWVhbnQgdG8KPiBleHBvc2UgX2V2
ZXJ5dGhpbmdfIHRoZXkgc3VwcG9ydCAoYm9udXMgaWYgeW91IHJvdWdobHkgc29ydCBpdCBpbgo+
IHByZWZlcmVuY2Ugb3JkZXIpLiBVc2Vyc3BhY2UgdGhlbiBjb21wdXRlcyB0aGUgaW50ZXJzZWN0
aW9uIG9mCj4gbW9kaWZpZXJzL2Zvcm1hdHMgc3VwcG9ydGVkIGJ5IGFsbCBkZXZpY2VzIGl0IG5l
ZWRzIHRvIHNoYXJlIGEgYnVmZmVyCj4gd2l0aC4gQWxsb3dpbmcgdGhhdCB3YXMgdGhlIGVudGly
ZSBwb2ludCBvZiBtb2RpZmllcnMsIGlmIHdlCj4gYXJ0aWZpY2lhbGx5IGxpbWl0IHRvIHRoZSBj
b21tb24gZGVub21pbmF0b3Igd2UncmUgYmFjayAib25seSBsaW5lYXIKPiB3b3JrcyBldmVyeXdo
ZXJlIi4KCkNvcnJlY3QuCgpBIGxvdCBvZiB1c2Vyc3BhY2Ugd2lsbCBzZWxlY3QgZm9yIGZvcm1h
dCBmaXJzdCwgdGhlbiBmaW5kIGEgbW9kaWZpZXIKd2hpY2ggY2FuIGJlIHVzZWQgd2l0aCB0aGF0
IGZvcm1hdC4gSWYgdXNlcnNwYWNlIGhhcyBzcGVjaWZpYwprbm93bGVkZ2Ugb2YgQUZCQyBhbmQg
ZGVjaWRlcyB0aGF0IGl0IHByZWZlcnMgdG8gdXNlIEFGQkMgc28gd2lsbCBzZWVrCm91dCBhbiBh
bHBoYSBmb3JtYXQgLSBhbmQgbWFrZSBzdXJlIGV2ZXJ5b25lIGZpbGxzIHRoZSBjaGFubmVsIHNv
bGlkIC0KdGhlbiB0aGF0J3MgZmluZS4gQnV0IHRoYXQncyBwdXR0aW5nIHRoZSBjYXJ0IGJlZm9y
ZSB0aGUgaG9yc2UuCgpOb3QgZXhwb3NpbmcgWFJHQjg4ODggb24gdGhlIHByaW1hcnkgcGxhbmUg
d2lsbCBicmVhayBhIGxvdCBvZgp1c2Vyc3BhY2UsIHNvIGluIHRoaXMgY2FzZSBBRkJDIHdvdWxk
IGp1c3QgbmV2ZXIgcmVhbGx5IGJlIHVzZWQuCgpDaGVlcnMsCkRhbmllbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
