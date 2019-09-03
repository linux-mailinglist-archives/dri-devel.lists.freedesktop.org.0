Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05428A765D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 23:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957198987A;
	Tue,  3 Sep 2019 21:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4004A8987A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 21:41:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFAB623400
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 21:41:17 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id 30so8053964wrk.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 14:41:17 -0700 (PDT)
X-Gm-Message-State: APjAAAWfvHBD1OwrtZkDTYX0h97dhC9UPfxnCjOOWNI5UTBe5uGtC29W
 lfLZf8sCUBHhH4zFgv4H/E1n7KfyAmfDFyIOGVHV6w==
X-Google-Smtp-Source: APXvYqzXcGyhT7f6XzavKD8KtKDX192fuzOKz0PBM2Wt291z3usBndyfuiJ+RvAT2J7wZHZ6dOtxhDeApHOfWbN1k5E=
X-Received: by 2002:adf:dcc4:: with SMTP id x4mr34060906wrm.221.1567546876229; 
 Tue, 03 Sep 2019 14:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-2-thomas_os@shipmail.org>
 <20190903134627.GA2951@infradead.org>
 <f85e7fa6-54e1-7ac5-ce6c-96349c7af322@shipmail.org>
 <20190903162204.GB23281@infradead.org>
 <558f1224-d157-5848-1752-1430a5b3947e@shipmail.org>
In-Reply-To: <558f1224-d157-5848-1752-1430a5b3947e@shipmail.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 3 Sep 2019 14:41:05 -0700
X-Gmail-Original-Message-ID: <CALCETrX4mP51QeoCJU=eebctGuDQ7QdabjGVSgF4G4_8mwg7zA@mail.gmail.com>
Message-ID: <CALCETrX4mP51QeoCJU=eebctGuDQ7QdabjGVSgF4G4_8mwg7zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] x86/mm: Export force_dma_unencrypted
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567546878;
 bh=VqAnzrjf/HwxuTo5b9fu2nIOvRGN3IVBpWlDHgaD82o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LAbf/z07Pl1PYgNwoGYPR1oPh0yq5P3VlyH4JVOIQYeJN0JLmc1QXmfdlDiAg7sQj
 dlMGly7VCcR4ImsGR2wEST293fgQYIjhlgEpw8lVvHU8AKGIR8/OJXQCNtj6B4sU96
 4qCDRP3X1o2fIJ1Ao+yDDTk2abJ2fTw1yqBys5C0=
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCAxOjQ2IFBNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
Cjx0aG9tYXNfb3NAc2hpcG1haWwub3JnPiB3cm90ZToKPgo+IE9uIDkvMy8xOSA2OjIyIFBNLCBD
aHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDA0OjMy
OjQ1UE0gKzAyMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+ID4+IElzIHRo
aXMgYSBsYXllciB2aW9sYXRpb24gY29uY2VybiwgdGhhdCBpcywgd291bGQgeW91IGJlIG9rIHdp
dGggYSBzaW1pbGFyCj4gPj4gaGVscGVyIGZvciBUVE0sIG9yIGlzIGl0IHRoYXQgeW91IHdhbnQg
dG8gZm9yY2UgdGhlIGdyYXBoaWNzIGRyaXZlcnMgaW50bwo+ID4+IGFkaGVyaW5nIHN0cmljdGx5
IHRvIHRoZSBETUEgYXBpLCBldmVuIHdoZW4gaXQgZnJvbSBhbiBlbmdpbmVlcmluZwo+ID4+IHBl
cnNwZWN0aXZlIG1ha2VzIG5vIHNlbnNlPwo+ID4gPkZyb20gbG9va2luZyBhdCBEUk0gSSBzdHJv
bmdseSBiZWxpZXZlIHRoYXQgbWFraW5nIERSTSB1c2UgdGhlIERNQQo+ID4gbWFwcGluZyBwcm9w
ZXJseSBtYWtlcyBhIGxvdCBvZiBzZW5zZSBmcm9tIHRoZSBlbmdpbmVlcmluZyBwZXJzcGVjdGl2
ZSwKPiA+IGFuZCB0aGlzIHNlcmllcyBpcyBhIGdvb2QgYXJndW1lbnQgZm9yIHRoYXQgcG9zaXRp
b25zLgo+Cj4gV2hhdCBJIG1lYW4gd2l0aCAiZnJvbSBhbiBlbmdpbmVlcmluZyBwZXJzcGVjdGl2
ZSIgaXMgdGhhdCBkcml2ZXJzIHdvdWxkCj4gZW5kIHVwIHdpdGggYSBub24tdHJpdmlhbCBhbW91
bnQgb2YgY29kZSBzdXBwb3J0aW5nIHB1cmVseSBhY2FkZW1pYwo+IGNhc2VzOiBTZXR1cHMgd2hl
cmUgc29mdHdhcmUgcmVuZGVyaW5nIHdvdWxkIGJlIGZhc3RlciB0aGFuIGdwdQo+IGFjY2VsZXJh
dGVkLCBhbmQgc2V0dXBzIG9uIHBsYXRmb3JtcyB3aGVyZSB0aGUgZHJpdmVyIHdvdWxkIG5ldmVy
IHJ1bgo+IGFueXdheSBiZWNhdXNlIHRoZSBkZXZpY2Ugd291bGQgbmV2ZXIgYmUgc3VwcG9ydGVk
IG9uIHRoYXQgcGxhdGZvcm0uLi4KPgo+ID4gICBJZiBEUk0gd2FzIHVzaW5nCj4gPiB0aGUgRE1B
IHByb3Blcmwgd2Ugd291bGQgbm90IG5lZWQgdGhpcyBzZXJpZXMgdG8gc3RhcnQgd2l0aCwgYWxs
IHRoZQo+ID4gU0VWIGhhbmRsaW5nIGlzIGhpZGRlbiBiZWhpbmQgdGhlIERNQSBBUEkuICBXaGls
ZSB3ZSBoYWQgb2NjYXNpb25hbAo+ID4gYnVncyBpbiB0aGF0IHN1cHBvcnQgZml4aW5nIGl0IG1l
YW50IHRoYXQgaXQgY292ZXJlZCBhbGwgZHJpdmVycwo+ID4gcHJvcGVybHkgdXNpbmcgdGhhdCBB
UEkuCj4KPiBUaGF0IGlzIG5vdCByZWFsbHkgdHJ1ZS4gVGhlIGRtYSBBUEkgY2FuJ3QgaGFuZGxl
IGZhdWx0aW5nIG9mIGNvaGVyZW50Cj4gcGFnZXMgd2hpY2ggaXMgd2hhdCB0aGlzIHNlcmllcyBp
cyByZWFsbHkgYWxsIGFib3V0IHN1cHBvcnRpbmcgYWxzbyB3aXRoCj4gU0VWIGFjdGl2ZS4gVG8g
aGFuZGxlIHRoZSBjYXNlIHdoZXJlIHdlIG1vdmUgZ3JhcGhpY3MgYnVmZmVycyBvciBzZW5kCj4g
dGhlbSB0byBzd2FwIHNwYWNlIHdoaWxlIHVzZXItc3BhY2UgaGF2ZSB0aGVtIG1hcHBlZC4KPgo+
IFRvIGRvIHRoYXQgYW5kIHN0aWxsIGJlIGZ1bGx5IGRtYS1hcGkgY29tcGxpYW50IHdlIHdvdWxk
IGlkZWFsbHkgbmVlZCwKPiBmb3IgZXhhbXBsZSwgYW4gZXhwb3J0ZWQgZG1hX3BncHJvdCgpLiAo
ZG1hX3BncHJvdCgpIGJ5IHRoZSB3YXkgaXMgc3RpbGwKPiBzdWZmZXJpbmcgZnJvbSBvbmUgb2Yg
dGhlIGJ1Z3MgdGhhdCB5b3UgbWVudGlvbiBhYm92ZSkuCj4KPiBTdGlsbCwgSSBuZWVkIGEgd2F5
IGZvcndhcmQgYW5kIG15IHF1ZXN0aW9ucyB3ZXJlbid0IHJlYWxseSBhbnN3ZXJlZCBieQo+IHRo
aXMuCj4KPgoKSSByZWFkIHRoaXMgcGF0Y2gsIEkgcmVhZCBmb3JjZV9kbWFfZW5jcnlwdGVkKCks
IEkgcmVhZCB0aGUgY2hhbmdlbG9nCmFnYWluLCBhbmQgSSBoYXZlbid0IHRoZSBmYWludGVzdCBj
bHVlIHdoYXQgVFRNIGNvdWxkIHBvc3NpYmx5IGJlCmRvaW5nIHdpdGggZm9yY2VfZG1hX2VuY3J5
cHRlZCgpLgoKWW91J3JlIHNheWluZyB0aGF0IFRUTSBuZWVkcyB0byB0cmFuc3BhcmVudGx5IGNo
YW5nZSBtYXBwaW5ncyB0bwpyZWxvY2F0ZSBvYmplY3RzIGluIG1lbW9yeSBiZXR3ZWVuIHN5c3Rl
bSBtZW1vcnkgYW5kIGRldmljZSBtZW1vcnkuCkdyZWF0LCBJIGRvbid0IHNlZSB0aGUgcHJvYmxl
bS4gIElzIHRoZSBpc3N1ZSB0aGF0IHlvdSBuZWVkIHRvCmFsbG9jYXRlIHN5c3RlbSBtZW1vcnkg
dGhhdCBpcyBhZGRyZXNzYWJsZSBieSB0aGUgR1BVIGFuZCB0aGF0LCBpZiB0aGUKR1BVIGhhcyBp
bnN1ZmZpY2llbnQgUEEgYml0cywgeW91IG5lZWQgdW5lbmNyeXB0ZWQgbWVtb3J5PyAgSWYgc28s
CnRoaXMgc291bmRzIGxpa2UgYW4gZXhjZWxsZW50IHVzZSBmb3IgdGhlIERNQSBBUEkuICAgUmF0
aGVyIHRoYW4Ka2x1ZGdpbmcgZGlyZWN0bHkga25vd2xlZGdlIG9mIGZvcmNlX2RtYV9lbmNyeXB0
ZWQoKSBpbnRvIHRoZSBkcml2ZXIsCmNhbid0IHlvdSBhdCBsZWFzdCBhZGQsIGlmIG5lZWRlZCwg
YSBuZXcgaGVscGVyIHNwZWNpZmljYWxseSB0bwphbGxvY2F0ZSBtZW1vcnkgdGhhdCBjYW4gYmUg
YWRkcmVzc2VkIGJ5IHRoZSBkZXZpY2U/ICBMaWtlCmRtYV9hbGxvY19jb2hlcmVudCgpPyAgT3Is
IGlmIGZvciBzb21lIHJlYXNvbiwgZG1hX2FsbG9jX2NvaGVyZW50KCkKZG9lc24ndCBkbyB3aGF0
IHlvdSBuZWVkIG9yIHlvdXIgZHJpdmVyIGlzbid0IHJlYWR5IHRvIHVzZSBpdCwgdGhlbgpleHBs
YWluICp3aHkqIGFuZCBpbnRyb2R1Y2UgYSBuZXcgZnVuY3Rpb24gdG8gc29sdmUgeW91ciBwcm9i
bGVtPwoKS2VlcCBpbiBtaW5kIHRoYXQsIGRlcGVuZGluZyBvbiBqdXN0IGhvdyBNS1RNRSBlbmRz
IHVwIGJlaW5nIHN1cHBvcnRlZAppbiBMaW51eCwgaXQncyBlbnRpcmVseSBwb3NzaWJsZSB0aGF0
IGl0IHdpbGwgYmUgKmJhY2t3YXJkcyogZnJvbSB3aGF0CnlvdSBleHBlY3QgLS0gaGlnaCBhZGRy
ZXNzIGJpdHMgd2lsbCBiZSBuZWVkZWQgdG8gYXNrIGZvcgoqdW5lbmNyeXB0ZWQqIG1lbW9yeS4K
Ci0tQW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
