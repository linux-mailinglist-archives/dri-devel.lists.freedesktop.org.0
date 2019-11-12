Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C673FAB72
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 08:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569EE6E5B4;
	Wed, 13 Nov 2019 07:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587A56EBD4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 20:44:51 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o49so21306196qta.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XIC1APSxWrFcW1GblyShF0CTBN3WBCz4HlbvzX3i8nA=;
 b=kY4XF86iWmV9VSW8kxC2vXUAyC8t+nw6yOoXCeG7ZcJo5auA3yJbT0gyZYgRlQgpwI
 4DPd/4qvGI9co0YXNtJC6px1doL7deTyngLRgelP2T4i5ZN23LnmEiVZdQdlbK1ZKIYa
 KnUKemRnN22M2HQAOxc2cG3Q7gSUmE7+64jn2uMyy4fInyrOKK9Q6LqvsxxZgzibkt3R
 VvEoJ2Yp6uS7F96n/qPn1FhQim2f15S6LJzUHmoulpx2S/gGlSZEk5A7Q8P02Tfh4oZ7
 y3+bw7d1gUizJuHq+kO6Cv8VAJ+Aj4cBePvDJxNlRLF5+u+WLgQKbymzmO69kNgdslE6
 1hQg==
X-Gm-Message-State: APjAAAVOcCoc4QzDyznAQo6Be9c2TZOq/SU5WvSwrpOgE0cbz94vzJyh
 OuGKavG2aS60nLuTBmV1xsHing==
X-Google-Smtp-Source: APXvYqxT1AevYU83mBSAAzVL5cKCr9RO3QTTsZEZsQx1j+Xe2+nGL/UnUh0Po7qNt16fHJ031L5RZg==
X-Received: by 2002:ac8:6641:: with SMTP id j1mr34362241qtp.48.1573591490500; 
 Tue, 12 Nov 2019 12:44:50 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id u67sm4906223qkf.115.2019.11.12.12.44.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:44:49 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUd1t-00047P-Dy; Tue, 12 Nov 2019 16:44:49 -0400
Date: Tue, 12 Nov 2019 16:44:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 11/23] IB/{core,hw,umem}: set FOLL_PIN, FOLL_LONGTERM
 via pin_longterm_pages*()
Message-ID: <20191112204449.GF5584@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-12-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112000700.3455038-12-jhubbard@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 13 Nov 2019 07:55:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XIC1APSxWrFcW1GblyShF0CTBN3WBCz4HlbvzX3i8nA=;
 b=AsvHvDs3axCMUqe+N7mXppqZcG4z4QzjW7DgwuxQQSvowjzw09zSM8n30iqPxyhiVG
 Xh8VyKwma0MzyaZ4I7in3iXleDEuEusIaoOY6nDlenNeAk67Wg5jNcvcitJtB14ouZSU
 jEwtlMvkVKE/9wAQOETCpzIOvdkPz6MUeIKWQaYMSrFJbWX7VcVwtA5CNXlEKm0VsyqY
 ifzvXwANYm60xkTRX8oLmVVhv+FGDqeTm28/AUUM6Qiw102m5SB7HZ3RG7baH2DiI3v+
 pcZdlJkq9BzOBgC+D5ynKGUuwhq6rk47T2j6RjHfuuaJ84S/d0bRcfAl5P4tkZR1pUiM
 WWGA==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDQ6MDY6NDhQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEBAIC01NDIsNyArNTQxLDcgQEAgc3RhdGljIGludCBpYl91bWVtX29kcF9tYXBfZG1h
X3NpbmdsZV9wYWdlKAo+ICAJfQo+ICAKPiAgb3V0Ogo+IC0JcHV0X3VzZXJfcGFnZShwYWdlKTsK
PiArCXB1dF9wYWdlKHBhZ2UpOwo+ICAKPiAgCWlmIChyZW1vdmVfZXhpc3RpbmdfbWFwcGluZykg
ewo+ICAJCWliX3VtZW1fbm90aWZpZXJfc3RhcnRfYWNjb3VudCh1bWVtX29kcCk7Cj4gQEAgLTYz
OSwxMyArNjM4LDE0IEBAIGludCBpYl91bWVtX29kcF9tYXBfZG1hX3BhZ2VzKHN0cnVjdCBpYl91
bWVtX29kcCAqdW1lbV9vZHAsIHU2NCB1c2VyX3ZpcnQsCj4gIAkJLyoKPiAgCQkgKiBOb3RlOiB0
aGlzIG1pZ2h0IHJlc3VsdCBpbiByZWR1bmRlbnQgcGFnZSBnZXR0aW5nLiBXZSBjYW4KPiAgCQkg
KiBhdm9pZCB0aGlzIGJ5IGNoZWNraW5nIGRtYV9saXN0IHRvIGJlIDAgYmVmb3JlIGNhbGxpbmcK
PiAtCQkgKiBnZXRfdXNlcl9wYWdlcy4gSG93ZXZlciwgdGhpcyBtYWtlIHRoZSBjb2RlIG11Y2gg
bW9yZQo+IC0JCSAqIGNvbXBsZXggKGFuZCBkb2Vzbid0IGdhaW4gdXMgbXVjaCBwZXJmb3JtYW5j
ZSBpbiBtb3N0IHVzZQo+IC0JCSAqIGNhc2VzKS4KPiArCQkgKiBnZXRfdXNlcl9wYWdlcy4gSG93
ZXZlciwgdGhpcyBtYWtlcyB0aGUgY29kZSBtdWNoCj4gKwkJICogbW9yZSBjb21wbGV4IChhbmQg
ZG9lc24ndCBnYWluIHVzIG11Y2ggcGVyZm9ybWFuY2UgaW4gbW9zdAo+ICsJCSAqIHVzZSBjYXNl
cykuCj4gIAkJICovCj4gIAkJbnBhZ2VzID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKG93bmluZ19w
cm9jZXNzLCBvd25pbmdfbW0sCj4gLQkJCQl1c2VyX3ZpcnQsIGd1cF9udW1fcGFnZXMsCj4gLQkJ
CQlmbGFncywgbG9jYWxfcGFnZV9saXN0LCBOVUxMLCBOVUxMKTsKPiArCQkJCQkgICAgICAgdXNl
cl92aXJ0LCBndXBfbnVtX3BhZ2VzLAo+ICsJCQkJCSAgICAgICBmbGFncywgbG9jYWxfcGFnZV9s
aXN0LCBOVUxMLAo+ICsJCQkJCSAgICAgICBOVUxMKTsKPiAgCQl1cF9yZWFkKCZvd25pbmdfbW0t
Pm1tYXBfc2VtKTsKClRoaXMgaXMganVzdCB3aGl0ZXNwYWNlIGNodXJuPyBEcm9wIGl0Li4KCkph
c29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
