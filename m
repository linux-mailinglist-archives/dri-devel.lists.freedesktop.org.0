Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6350EE6F2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 19:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE5D6E7DB;
	Mon,  4 Nov 2019 18:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D996E7DB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:11:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a11so18204936wra.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 10:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=j2dTn7Wj7MGJZeGgFXPtBogE4qg0BoOVrIkL6wJedbU=;
 b=iM6gSAzqyZp7w+9r/H2YRmyTo0/cd5tKWLBq4xes1ZzooYvqY6lkPLwz/tHVrAWrAC
 Vsyj0LvUy+THNPCIdhTEl28jk7hf7+ci3Jg9FcPjYCeXqZD1+pTExm+CbZTuXVTcCViF
 i4jN2F9Da1ETyxlEvQT/hMeFItiaiRDCraG8x8d1vyZ83XPgRhH4M2DQzXkhOJfD3uSy
 DUB4I5WkXp1bMUR4YfH/2CvnETYexSlYCNlSxTeSqmRja4Za4nBAiVqxB7SuBQyffMUc
 x/QyEBXmzJOYAXgshx2aeg4dV9LNzBCIH/a6pLEim2miFzROo0R0RNd1h1PZ7hHQvsd3
 ETcg==
X-Gm-Message-State: APjAAAXsFjHKDGsvFyxZNBvUM0I6qM3gJ53t/tXa2uknMHSeJU35ZYBw
 sIwyKrG3AX7g+9n4OuH6XA3u4g==
X-Google-Smtp-Source: APXvYqwKkCPGo7mLK0jIbZGuRHh4x9upKlx8LPQBL5XTz+fwA202HVPHUNfjQCRnXVzy4o6JxOqyww==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr25997024wrq.79.1572891058912; 
 Mon, 04 Nov 2019 10:10:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id f13sm17508153wrq.96.2019.11.04.10.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 10:10:57 -0800 (PST)
Date: Mon, 4 Nov 2019 19:10:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 09/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
Message-ID: <20191104181055.GP10326@phenom.ffwll.local>
Mail-Followup-To: Ira Weiny <ira.weiny@intel.com>,
 John Hubbard <jhubbard@nvidia.com>,
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031233628.GI14771@iweiny-DESK2.sc.intel.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=j2dTn7Wj7MGJZeGgFXPtBogE4qg0BoOVrIkL6wJedbU=;
 b=RPIdhIouR3j/Ac7neKFnGVsgwJtt56byt4O2813ik4ObcxN+6tPIIPEpIvd4bHdCQy
 xfCULaOlOfNgr9pPNLunatyY1TT5oMd7MopfAimYN7Fzif9xA431/mZ6rvrz1NeweKf9
 nhCRlvw6Mqd6dfgcS8I0AQ1BearSl/gQZ3yck=
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
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

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDQ6MzY6MjhQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0IDAzOjQ5OjIwUE0gLTA3MDAsIEpvaG4gSHViYmFy
ZCB3cm90ZToKPiA+IENvbnZlcnQgZHJtL3ZpYSB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdl
c19mYXN0KCkgY2FsbCwgd2hpY2ggc2V0cwo+ID4gRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4g
aXMgbm93IHJlcXVpcmVkIGZvciBjb2RlIHRoYXQgcmVxdWlyZXMKPiA+IHRyYWNraW5nIG9mIHBp
bm5lZCBwYWdlcywgYW5kIHRoZXJlZm9yZSBmb3IgYW55IGNvZGUgdGhhdCBjYWxscwo+ID4gcHV0
X3VzZXJfcGFnZSgpLgo+ID4gCj4gCj4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55
QGludGVsLmNvbT4KCk5vIG9uZSdzIHRvdWNoaW5nIHRoZSB2aWEgZHJpdmVyIGFueW1vcmUsIHNv
IGZlZWwgZnJlZSB0byBtZXJnZSB0aGlzCnRocm91Z2ggd2hhdGV2ZXIgdHJlZSBzdWl0cyBiZXN0
IChha2EgSSdsbCBkcm9wIHRoaXMgb24gdGhlIGZsb29yIGFuZApmb3JnZXQgYWJvdXQgaXQgbm93
KS4KCkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyB8IDIgKy0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyBiL2RyaXZlcnMvZ3B1
L2RybS92aWEvdmlhX2RtYWJsaXQuYwo+ID4gaW5kZXggM2RiMDAwYWFjZDI2Li4zN2M1ZTU3Mjk5
M2EgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYwo+ID4gQEAgLTIzOSw3ICsy
MzksNyBAQCB2aWFfbG9ja19hbGxfZG1hX3BhZ2VzKGRybV92aWFfc2dfaW5mb190ICp2c2csICBk
cm1fdmlhX2RtYWJsaXRfdCAqeGZlcikKPiA+ICAJdnNnLT5wYWdlcyA9IHZ6YWxsb2MoYXJyYXlf
c2l6ZShzaXplb2Yoc3RydWN0IHBhZ2UgKiksIHZzZy0+bnVtX3BhZ2VzKSk7Cj4gPiAgCWlmIChO
VUxMID09IHZzZy0+cGFnZXMpCj4gPiAgCQlyZXR1cm4gLUVOT01FTTsKPiA+IC0JcmV0ID0gZ2V0
X3VzZXJfcGFnZXNfZmFzdCgodW5zaWduZWQgbG9uZyl4ZmVyLT5tZW1fYWRkciwKPiA+ICsJcmV0
ID0gcGluX3VzZXJfcGFnZXNfZmFzdCgodW5zaWduZWQgbG9uZyl4ZmVyLT5tZW1fYWRkciwKPiA+
ICAJCQl2c2ctPm51bV9wYWdlcywKPiA+ICAJCQl2c2ctPmRpcmVjdGlvbiA9PSBETUFfRlJPTV9E
RVZJQ0UgPyBGT0xMX1dSSVRFIDogMCwKPiA+ICAJCQl2c2ctPnBhZ2VzKTsKPiA+IC0tIAo+ID4g
Mi4yMy4wCj4gPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
