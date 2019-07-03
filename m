Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3425EAD9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 19:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6DD6E181;
	Wed,  3 Jul 2019 17:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855B06E0D8;
 Wed,  3 Jul 2019 17:50:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u8so3347092wmm.1;
 Wed, 03 Jul 2019 10:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hndznlvzR7hCc155DH4EmepiersU9zF+O4Q02wI0fg0=;
 b=C68Unjn9yyyk7451aal2yiBo7ojHUzp3wVIF0XBuTMal7+6pG15LP/vzGQWZOJ+KZC
 2Jje+3C0m2OrEXntedBGBye4eAJiCulddi4eZtOSoT2xvJ9EieVhQCF11QKkRFcOSj3D
 l/P8RgfEMoTmpqpg4+wRnPUl5DXWEQY2t5WOZaeZYCI/iE+7tmq2YCC5tTQm3Rlb1B4W
 sX8Yatk7tBMplNNCluYGQajZWVfeDSq8uFvz2r7vzKl83iOoy1aTLCdmZilshnnvbNPo
 tB3Ls3hAhb6e6QiQ2Mal93KhYxcW3K6IfQHh9rVQv6ZWWlqrDOW+LzEuWixxl1V8uMI8
 Ncgg==
X-Gm-Message-State: APjAAAUWGzDPxkL+ZfKVbopwe7yTQKtVl+A4BwObeyiVbncEMaS5mL04
 GY9GKILGSQvsNCnNjoNOyb6y+aHKGT/9IjbQyCs=
X-Google-Smtp-Source: APXvYqwbLyqNJUgVnFhv0lbJ8SC5c/0yPQg1tb9jN6EfSosXHl80EFPU2XUiDskY7sdqSQfVQLihXsM+BDW3vYzudVA=
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr8920034wmc.169.1562176256213; 
 Wed, 03 Jul 2019 10:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-21-hch@lst.de>
 <a3108540-e431-2513-650e-3bb143f7f161@nvidia.com>
In-Reply-To: <a3108540-e431-2513-650e-3bb143f7f161@nvidia.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 3 Jul 2019 13:50:45 -0400
Message-ID: <CAKb7Uvid7xfWNRxee4YoDSKu5-eizo-0Bqb3amFczEDXmSKLMA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 20/22] mm: move hmm_vma_fault to nouveau
To: Ralph Campbell <rcampbell@nvidia.com>
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
Cc: linux-nvdimm@lists.01.org, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCAxOjQ5IFBNIFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxA
bnZpZGlhLmNvbT4gd3JvdGU6Cj4gT24gNi8zMC8xOSAxMToyMCBQTSwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gPiBobW1fdm1hX2ZhdWx0IGlzIG1hcmtlZCBhcyBhIGxlZ2FjeSBBUEkgdG8g
Z2V0IHJpZCBvZiwgYnV0IHF1aXRlIHN1aXRlcwo+ID4gdGhlIGN1cnJlbnQgbm91dmVhIGZsb3cu
ICBNb3ZlIGl0IHRvIHRoZSBvbmx5IHVzZXIgaW4gcHJlcGFyYXRpb24gZm9yCj4KPiBJIGRpZG4n
dCBxdWl0ZSBwYXJzZSB0aGUgcGhyYXNlICJxdWl0ZSBzdWl0ZXMgdGhlIGN1cnJlbnQgbm91dmVh
IGZsb3cuIgo+IHMvbm91dmVhL25vdXZlYXUvCgpBcyBsb25nIGFzIHlvdSdyZSBmaXhpbmcgdHlw
b3MsIHN1aXRlcyAtPiBzdWl0cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
