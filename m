Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5FAECBB3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB0C6F892;
	Fri,  1 Nov 2019 22:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73F96F85B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 19:54:08 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t8so14474290qtc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 12:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z+FjZERGJpTwj4Fyw0MaJE9Sqa2BYsQ42uoE0CYrL0A=;
 b=YWDrU0h+/CIqIeeAP2GcH/wFp99Dcle3XNL30744EPPEUC0tAt/1isJ7O4MrJZJ2R7
 zkrkt2oOmV0qs68SxmOfVJC81T2AYCCfeIJomiEbiy1D5ZJP7+YnQO6x710QUMWhGmAK
 bgqQ8F61NoP/xpAVm5gAQVsWbXmRyagrxm4COI4zXz3OdP3uZCbgM8NN507stR/q5c/A
 gH/pPnqeKSNO9SNtFpcirMGBu72as8nXHPIREFPIxjsXM0jEqXHuqzhsAIwp4VeP1KA1
 aUkQsAFQqggSV8ak7kyksDXh31u9WYgqKVk153PModBmX/gKYCC5btpiqu0kR1HJ1xgk
 QjUA==
X-Gm-Message-State: APjAAAWWULS5s5+nGOZzt7h8zwsCT8AFxLlGkBakrkeqKCDW6DTxONrb
 93kh+yMTdPBz4MkB6D8ErhjWUw==
X-Google-Smtp-Source: APXvYqwugaF2JaYgADF6rOYRryDEd9+U+cO7L5fZ9F8hMoRL3wZJoN0ghN8hXeUNkkXowjkn9kbsRA==
X-Received: by 2002:a0c:fdcc:: with SMTP id g12mr11930964qvs.104.1572638047703; 
 Fri, 01 Nov 2019 12:54:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id a18sm4727748qkc.2.2019.11.01.12.54.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 12:54:07 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iQczm-00025n-Ng; Fri, 01 Nov 2019 16:54:06 -0300
Date: Fri, 1 Nov 2019 16:54:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: Re: [PATCH v2 00/15] Consolidate the mmu notifier interval_tree and
 locking
Message-ID: <20191101195406.GA6732@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:50:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z+FjZERGJpTwj4Fyw0MaJE9Sqa2BYsQ42uoE0CYrL0A=;
 b=YeDYRdeeYeznofBfYHEGTgJUYYibnJM0tHbeYYbzhUa89eqWcwDFuoBvkqzuDcLc2T
 ofUfxex6y2BB77lEIINYfCe3LRDUm2ccatiS5G5es+IEQBkayJMlTpCysQ5WVX1USGCS
 jgTaU5H2sKmYyCCp5OAsj9y1/GibOpmNaDDE7+kpDMj1ch/KbEMGdmr4C8OACqF5MRIR
 AUJyBIqsDG9vpkYNm8vhMLDcsm1loVPhr52oeBb6m4QlAeB/pAlZ5GeOmXDE0INv1FyD
 pucRz+47DC7NbtxxhTdRuHewQn65NgI1RX8osOjLNPQ54S6sL1WB7AFJyClzypTR7d0s
 bh6w==
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
Cc: Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Petr Cvek <petrcvekcz@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDU6MTA6MTdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiA4
IG9mIHRoZSBtbXVfbm90aWZpZXIgdXNpbmcgZHJpdmVycyAoaTkxNV9nZW0sIHJhZGVvbl9tbiwg
dW1lbV9vZHAsIGhmaTEsCj4gc2NpZl9kbWEsIHZob3N0LCBnbnRkZXYsIGhtbSkgZHJpdmVycyBh
cmUgdXNpbmcgYSBjb21tb24gcGF0dGVybiB3aGVyZQo+IHRoZXkgb25seSB1c2UgaW52YWxpZGF0
ZV9yYW5nZV9zdGFydC9lbmQgYW5kIGltbWVkaWF0ZWx5IGNoZWNrIHRoZQo+IGludmFsaWRhdGlu
ZyByYW5nZSBhZ2FpbnN0IHNvbWUgZHJpdmVyIGRhdGEgc3RydWN0dXJlIHRvIHRlbGwgaWYgdGhl
Cj4gZHJpdmVyIGlzIGludGVyZXN0ZWQuIEhhbGYgb2YgdGhlbSB1c2UgYW4gaW50ZXJ2YWxfdHJl
ZSwgdGhlIG90aGVycyBhcmUKPiBzaW1wbGUgbGluZWFyIHNlYXJjaCBsaXN0cy4KCk5vdyB0aGF0
IHdlIGhhdmUgdGhlIG1vc3Qgb2YgdGhlIGRyaXZlciBjaGFuZ2VzIHRlc3RlZCBhbmQgcmV2aWV3
ZWQKSSdtIGdvaW5nIHRvIG1vdmUgdGhpcyBzZXJpZXMgaW50byBsaW51eC1uZXh0IHZpYSB0aGUg
aG1tIHRyZWUsIG1pbnVzCnRoZSB4ZW4gZ250ZGV2IHBhdGNoZXMgYXMgdGhleSBhcmUgbm90IHdv
cmtpbmcgeWV0LgoKSSB3aWxsIGtlZXAgY29sbGVjdGluZyBhY2tzIGFuZCBhbnkgYWRkaXRpb25h
bCBjaGFuZ2VzLgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
