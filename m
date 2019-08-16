Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97FA91194
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F1A6EB4C;
	Sat, 17 Aug 2019 15:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE6989F5B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 15:14:54 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id m2so4961363qkd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 08:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fov2CgaO1O1CFkZX4IfqnTZnTK7C3zpSvYgzXGSY56g=;
 b=Y88KH0NiH169kiA5Nv+6rDyoB+Ky0980qnFZOBMouqRwfdzyV2G6rGcyIENgIbe3o3
 8ZIRY5TmG1ozepm65rPXcJN5SQKXQ7SqSTok/s38w5qiATRA3Bpwrjg5hGjhaXjHfZCt
 uANMrMXGJAPZXdIh45UUU4mudm7br3ne5Oe8kbzIUkHAcavOz/Y5rvKd0fG+Z1e0pVTX
 /pU5cFMFenyurs370OhJJbf9TVnSaGg6wryVte485pSxHz2R89uYwLX5MJ/NzFx0ttGt
 CX/P3hSZtLfGFWBECzh6vw8eWozYamc9E+naMm8JnvYPHOaTrmm1SQuUIuFljD+nSkCY
 c7iA==
X-Gm-Message-State: APjAAAWnxBd8gPnj9/NBihiI2T9L8HnzHO/erUgBExwntnzbexEaWX0d
 6E+Rm4kt6px5YKih6TXQs+mPpQ==
X-Google-Smtp-Source: APXvYqxJQYOJO15q7RlRP/vufAQqFSxN3g0+gtugu+v5p95C5icfuXRjyKSuaK0zmQH83GKJGhGMfA==
X-Received: by 2002:a05:620a:1590:: with SMTP id
 d16mr9385834qkk.18.1565968493491; 
 Fri, 16 Aug 2019 08:14:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id o127sm3158342qkd.104.2019.08.16.08.14.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Aug 2019 08:14:53 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hydwK-0003JY-LJ; Fri, 16 Aug 2019 12:14:52 -0300
Date: Fri, 16 Aug 2019 12:14:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: Re: [PATCH v3 hmm 00/11] Add mmu_notifier_get/put for managing mmu
 notifier registrations
Message-ID: <20190816151452.GA8562@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fov2CgaO1O1CFkZX4IfqnTZnTK7C3zpSvYgzXGSY56g=;
 b=oy5sZFjQp1BCVaEwQsb3+KNPFbSHSZHWPBMzBnqM3YkM8M6TeLN/TchFjkEdsICSuJ
 1C+Aqtldy/Y4ldUDXhcLTuhfNncF7+Dyd3fNJ1bom3uP8hS9LridrmdEdsAQXWEZtKjz
 7XP3pkdVorvFX0x7VQ1DMygwaFOvfV+UwasgUORcn3BEim4b1kFT8oE06M97uDUrjOv5
 mMHA/Z8hsM7HRGW+maHrZQD/1QDaaYGCk/ab/4r4vI2lVu52wx2id8gV5icj3phd9BLt
 KUOXu736r5AT7W/9wY/TxeK4Ryn6yfFSyNCnwDYASLlBBEV0NjKDADW49yLgEKf3SWZn
 2lUw==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDg6MTU6MzdQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFRoaXMgc2VyaWVzIGlzIGFscmVhZHkgZW50YW5nbGVkIHdpdGggcGF0Y2hlcyBp
biB0aGUgaG1tICYgUkRNQSB0cmVlIGFuZAo+IHdpbGwgcmVxdWlyZSBzb21lIGdpdCB0b3BpYyBi
cmFuY2hlcyBmb3IgdGhlIFJETUEgT0RQIHN0dWZmLiBJIGludGVuZCBmb3IKPiBpdCB0byBnbyB0
aHJvdWdoIHRoZSBobW0gdHJlZS4KCj4gSmFzb24gR3VudGhvcnBlICgxMSk6Cj4gICBtbS9tbXVf
bm90aWZpZXJzOiBob2lzdCBkb19tbXVfbm90aWZpZXJfcmVnaXN0ZXIgZG93bl93cml0ZSB0byB0
aGUKPiAgICAgY2FsbGVyCj4gICBtbS9tbXVfbm90aWZpZXJzOiBkbyBub3Qgc3BlY3VsYXRpdmVs
eSBhbGxvY2F0ZSBhIG1tdV9ub3RpZmllcl9tbQo+ICAgbW0vbW11X25vdGlmaWVyczogYWRkIGEg
Z2V0L3B1dCBzY2hlbWUgZm9yIHRoZSByZWdpc3RyYXRpb24KPiAgIG1pc2Mvc2dpLWdydTogdXNl
IG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgZ3J1X21tX3N0cnVjdAo+ICAgaG1tOiB1
c2UgbW11X25vdGlmaWVyX2dldC9wdXQgZm9yICdzdHJ1Y3QgaG1tJwo+ICAgZHJtL3JhZGVvbjog
dXNlIG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciBzdHJ1Y3QgcmFkZW9uX21uCj4gICBkcm0vYW1k
a2ZkOiBmaXggYSB1c2UgYWZ0ZXIgZnJlZSByYWNlIHdpdGggbW11X25vdGlmZXIgdW5yZWdpc3Rl
cgo+ICAgZHJtL2FtZGtmZDogdXNlIG1tdV9ub3RpZmllcl9wdXQKCk90aGVyIHRoYW4gdGhlc2Ug
cGF0Y2hlczoKCj4gICBSRE1BL29kcDogdXNlIG1tdV9ub3RpZmllcl9nZXQvcHV0IGZvciAnc3Ry
dWN0IGliX3Vjb250ZXh0X3Blcl9tbScKPiAgIFJETUEvb2RwOiByZW1vdmUgaWJfdWNvbnRleHQg
ZnJvbSBpYl91bWVtCj4gICBtbS9tbXVfbm90aWZpZXJzOiByZW1vdmUgdW5yZWdpc3Rlcl9ub19y
ZWxlYXNlCgpUaGlzIHNlcmllcyBoYXMgYmVlbiBhcHBsaWVkLgoKSSB3aWxsIGFwcGx5IHRoZSBP
RFAgcGF0Y2hlcyB3aGVuIHRoZSBzZXJpZXMgdGhleSBkZXBlbmQgb24gaXMgbWVyZ2VkCnRvIHRo
ZSBSRE1BIHRyZWUKCkFueSBmdXJ0aGVyIGFja3MvcmVtYXJrcyBJIHdpbGwgYW5ub3RhdGUsIHRo
YW5rcyBpbiBhZHZhbmNlCgpUaGFua3MgdG8gYWxsIHJldmlld2VycywKSmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
