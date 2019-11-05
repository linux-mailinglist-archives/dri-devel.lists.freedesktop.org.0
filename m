Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF05BEF9FF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF3B6E980;
	Tue,  5 Nov 2019 09:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E02F6E980
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:49:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c17so12725702wmk.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 01:49:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=oRi35sDRRYSuldGaopElz5IjGs2HKuOAcqpcVoq2wdY=;
 b=doWFzq8kjbaYzXcnoIweSIMjjK5oyk2MkHCIMMK0GJtd63yzqBkpfJgUN9dvw+KdIh
 NUQFZLW4ly2IdiSLeh1Ulv4o8Hj0zcK0MlWSlHsKNdAHXYxJD7MwKluHbKBTuA0tH2lf
 lz7vvuHM6STR5PNdUu7+YZm8Y7TEjUp+A0Nk3X+Va5Ub00AlvjR0GqhHd+UM5O15j1nA
 A72Fbh0XcCt4HoKVx7e1FrOdrztzDpnvolIdgk2HttHpR5ugVd3zPpKMYtEizlG/JKz5
 w9sOxEd4tPjOJv08/BOogP2CReag30DlHZpXE2WWZ1ixj3m+h9/sgxY3tYY+2K9PJSmS
 Z5CA==
X-Gm-Message-State: APjAAAW0rlBfiJaXshL3mu2m9NsdS9fJ5SJp8rSFWiGvpzljrA7xsz+A
 RW9M+K4rv3im0Cso61lIVdOo0w==
X-Google-Smtp-Source: APXvYqy+m+ZJ5zxOn/Dji3l65qB+TEfMmH5EiR/oP/iFPjGmYGokusjpTK+YoOlM7MNeuKLe8vHIRQ==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr3591415wml.115.1572947379914; 
 Tue, 05 Nov 2019 01:49:39 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j19sm25704277wre.0.2019.11.05.01.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 01:49:39 -0800 (PST)
Date: Tue, 5 Nov 2019 10:49:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 09/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
Message-ID: <20191105094936.GZ10326@phenom.ffwll.local>
Mail-Followup-To: John Hubbard <jhubbard@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alex Williamson <alex.williamson@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Chinner <david@fromorbit.com>, David Airlie <airlied@linux.ie>,
 "David S . Miller" <davem@davemloft.net>, Jan Kara <jack@suse.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
 Jonathan Corbet <corbet@lwn.net>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-10-jhubbard@nvidia.com>
 <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
 <20191104181055.GP10326@phenom.ffwll.local>
 <48d22c77-c313-59ff-4847-bc9a9813b8a7@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48d22c77-c313-59ff-4847-bc9a9813b8a7@nvidia.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=oRi35sDRRYSuldGaopElz5IjGs2HKuOAcqpcVoq2wdY=;
 b=KE3dP9KvcLUq0hJbOhSYMXJr4Z1Cuc2Vc3sYtj3A588K1AxiPBhNRv2jLPVvg3HpiB
 asO9jGRsCrrAGrGXQuynbnaqIOtPdku/48txDbkC3jyEv0zbAYA99l9MmTsEF4lXmu4c
 UlGTi/e9P81uVhAoSbMh6OU7HFW5tO869wbeU=
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTE6MjA6MzhBTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDExLzQvMTkgMTA6MTAgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBU
aHUsIE9jdCAzMSwgMjAxOSBhdCAwNDozNjoyOFBNIC0wNzAwLCBJcmEgV2Vpbnkgd3JvdGU6Cj4g
Pj4gT24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDM6NDk6MjBQTSAtMDcwMCwgSm9obiBIdWJiYXJk
IHdyb3RlOgo+ID4+PiBDb252ZXJ0IGRybS92aWEgdG8gdXNlIHRoZSBuZXcgcGluX3VzZXJfcGFn
ZXNfZmFzdCgpIGNhbGwsIHdoaWNoIHNldHMKPiA+Pj4gRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9Q
SU4gaXMgbm93IHJlcXVpcmVkIGZvciBjb2RlIHRoYXQgcmVxdWlyZXMKPiA+Pj4gdHJhY2tpbmcg
b2YgcGlubmVkIHBhZ2VzLCBhbmQgdGhlcmVmb3JlIGZvciBhbnkgY29kZSB0aGF0IGNhbGxzCj4g
Pj4+IHB1dF91c2VyX3BhZ2UoKS4KPiA+Pj4KPiA+Pgo+ID4+IFJldmlld2VkLWJ5OiBJcmEgV2Vp
bnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gPiAKPiA+IE5vIG9uZSdzIHRvdWNoaW5nIHRoZSB2
aWEgZHJpdmVyIGFueW1vcmUsIHNvIGZlZWwgZnJlZSB0byBtZXJnZSB0aGlzCj4gPiB0aHJvdWdo
IHdoYXRldmVyIHRyZWUgc3VpdHMgYmVzdCAoYWthIEknbGwgZHJvcCB0aGlzIG9uIHRoZSBmbG9v
ciBhbmQKPiA+IGZvcmdldCBhYm91dCBpdCBub3cpLgo+ID4gCj4gPiBBY2tlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiA+IAo+IAo+IE9LLCBncmVhdC4gWWVz
LCBpbiBmYWN0LCBJJ20gaG9waW5nIEFuZHJldyBjYW4ganVzdCBwdXNoIHRoZSB3aG9sZSBzZXJp
ZXMKPiBpbiB0aHJvdWdoIHRoZSBtbSB0cmVlLCBiZWNhdXNlIHRoYXQgd291bGQgYWxsb3cgaXQg
dG8gYmUgZG9uZSBpbiBvbmUgCj4gc2hvdCwgaW4gNS41CgpidHcgaXMgdGhlcmUgbW9yZT8gV2Ug
c2hvdWxkIGhhdmUgYSBidW5jaCBtb3JlIHVzZXJwdHIgc3R1ZmYgaW4gdmFyaW91cwpkcml2ZXJz
LCBzbyB3YXMgcmVhbGx5IHN1cnByaXNlZCB0aGF0IGRybS92aWEgaXMgdGhlIG9ubHkgdGhpbmcg
aW4geW91cgpzZXJpZXMuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5l
ZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
