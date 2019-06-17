Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F67B48ACD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 19:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6745892AA;
	Mon, 17 Jun 2019 17:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AFD892AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 17:52:08 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id x21so10120814otq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 10:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GjmvPRW/EB2UZMiXQmlwdUn3cNZy7MEt9OXtWGJNxz0=;
 b=aLV3m/xFRdLCY+Ob2oeieqX93Bzt4ha5PqEmglGhdT9Rixa3FnLaXpevPsI4FRPzgs
 9Jw7M23BwwrH/sDWUCID2kN5CnPLhckzxxX/N6ChkR4J9ebxPIaOmPXCgwkA80szXFuV
 jkkTwRkgs3Pp2gggsVBC7a+dcHaBoeGv0qLZbrwLWwdZsgYsSlOp8xvMlF0rS3enI1F8
 9vkiUvcfNobo6IUZHFThb8YosjLFK5yRfHocDJlrgYWkhbOlUlgQSCDGjhbJK8BgAGtj
 gMfZxD7+NNiZJDUPhenk8Qw+UMaubKEE3MgwReFehWqvBXIDw2pxbP6nYvzkAUS92nxw
 6FfQ==
X-Gm-Message-State: APjAAAVu5iT2ISf0LZi1+Fepu4hsjk2bkr0+lJQ13vLvFgbH7T5FgMw3
 3gQMc5pUwEnhSRFqmlkGJtV+Nku4YKO3klo+F3zAWw==
X-Google-Smtp-Source: APXvYqyhtBEP50oerFZs8TdK9nCsvOJRWYCWzRd2vhiNPfCpga0Ba5N2yHiBCHm+W4K6XflHhEhbg4A9IXDkc+ucm/c=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr54836696otn.247.1560793907524; 
 Mon, 17 Jun 2019 10:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
In-Reply-To: <20190617122733.22432-9-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 17 Jun 2019 10:51:35 -0700
Message-ID: <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
Subject: Re: [PATCH 08/25] memremap: move dev_pagemap callbacks into a
 separate structure
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GjmvPRW/EB2UZMiXQmlwdUn3cNZy7MEt9OXtWGJNxz0=;
 b=aTNnToCYbt/RLgFmZg1PIvrCe0JVP4C32RN5cfyMVp2zYXXYY11JnD0P5Xn5tfOK6Y
 voW3Syk7UYIIG5SF4LSMDVtOlpmEa0YxFfvlu8+J6wAb/HPFiX2GuYxqo+V2fpMpF+jS
 NlrpFBkRARTzBSJzVDZzE7bQS2UMHOvFRAjYRiT9xL8/lOeALYe1ebk8LfMUYkoFpZaD
 PAFxFM2FYNf4FyGaTFye24KEnD9WdtERxcyZTxLFaidHht03PVJNbu4TuZbdbzHMaWbM
 oEiXMcpcSzAKgjPufMTuJybkt3G4uT6kQCK3aNOgUOJV87J/VA4uKxPCVrEi1MqSqx3i
 hB9A==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNToyNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBUaGUgZGV2X3BhZ2VtYXAgaXMgYSBncm93aW5nIHRvbyBtYW55IGNh
bGxiYWNrcy4gIE1vdmUgdGhlbSBpbnRvIGEKPiBzZXBhcmF0ZSBvcHMgc3RydWN0dXJlIHNvIHRo
YXQgdGhleSBhcmUgbm90IGR1cGxpY2F0ZWQgZm9yIG11bHRpcGxlCj4gaW5zdGFuY2VzLCBhbmQg
YW4gYXR0YWNrZXIgY2FuJ3QgZWFzaWx5IG92ZXJ3cml0ZSB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IExvZ2FuIEd1
bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KPiBSZXZpZXdlZC1ieTogSmFzb24gR3VudGhv
cnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IC0tLQo+ICBkcml2ZXJzL2RheC9kZXZpY2UuYyAgICAg
ICAgICAgICAgfCAxMSArKysrKystLS0tCj4gIGRyaXZlcnMvZGF4L3BtZW0vY29yZS5jICAgICAg
ICAgICB8ICAyICstCj4gIGRyaXZlcnMvbnZkaW1tL3BtZW0uYyAgICAgICAgICAgICB8IDE5ICsr
KysrKysrKy0tLS0tLS0KPiAgZHJpdmVycy9wY2kvcDJwZG1hLmMgICAgICAgICAgICAgIHwgIDkg
KysrKystLS0KPiAgaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oICAgICAgICAgIHwgMzYgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICBrZXJuZWwvbWVtcmVtYXAuYyAgICAgICAgICAg
ICAgICAgfCAxOCArKysrKysrKy0tLS0tLS0tCj4gIG1tL2htbS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEwICsrKysrKy0tLQo+ICB0b29scy90ZXN0aW5nL252ZGltbS90ZXN0L2lvbWFw
LmMgfCAgOSArKysrLS0tLQo+ICA4IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDQ5
IGRlbGV0aW9ucygtKQo+ClsuLl0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9udmRpbW0v
dGVzdC9pb21hcC5jIGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jCj4gaW5kZXgg
MjE5ZGQwYTFjYjA4Li5hNjY3ZDk3NDE1NWUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9u
dmRpbW0vdGVzdC9pb21hcC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21h
cC5jCj4gQEAgLTEwNiwxMSArMTA2LDEwIEBAIEVYUE9SVF9TWU1CT0woX193cmFwX2Rldm1fbWVt
cmVtYXApOwo+Cj4gIHN0YXRpYyB2b2lkIG5maXRfdGVzdF9raWxsKHZvaWQgKl9wZ21hcCkKPiAg
ewo+IC0gICAgICAgc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCA9IF9wZ21hcDsKCldob29wcywg
bmVlZGVkIHRvIGtlZXAgdGhpcyBsaW5lIHRvIGF2b2lkOgoKdG9vbHMvdGVzdGluZy9udmRpbW0v
dGVzdC9pb21hcC5jOjEwOToxMTogZXJyb3I6IOKAmHBnbWFw4oCZIHVuZGVjbGFyZWQKKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmF9wZ21hcOKAmT8KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
