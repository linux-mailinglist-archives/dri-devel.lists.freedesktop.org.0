Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBC3A5C7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47C689428;
	Sun,  9 Jun 2019 12:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5C989A34
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 20:49:31 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so3905557qto.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 13:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=xpue/yTKTfw/egd/V5x6eR0dUTrWX63mNojFgXXVaNY=;
 b=GxDPphp/bLbg8zfZV/jIeF3mS1oOluiol0x83IFZcXtFnxL5Phgu+ApVD9+fJHlcsq
 1MyVtf5nK4rblzyKOea5/mnfLvPXJA9r6OqEFJowPqlHdRenkO1JjLlVqrmeUVwQOJ0v
 jXtFZ5u0i0QPW2CaPAobk1w/UiNzY24C5sRJQdgYYnalpGDIgeMild5YKKJ19F7qVzj5
 wgc3DMet9fAEdCD289bGoRXEqXQLZZGaACdwV1nkxNshYtZTsOrl+Goi+tGiYafLazKj
 vLJBFJYKnSFBq2GWodMBBroipcRM1svkok03+aSLer7dZ8mz0SLDsvucCZ0sCKm2GkOh
 8ZIQ==
X-Gm-Message-State: APjAAAWz3yvRspugzBHxoSGNqzcW+IwwBIxFOfeXLH8fZmDiZkstADHN
 YraKDOAOZmyT+mSSmQaslXa9Eg==
X-Google-Smtp-Source: APXvYqzPKIbGhJdstJ73Gy3kLdTzS56fHmRoDPMXyiprmrDID4cHA2htBZhMjn4/4PIp+2lgQ2jdNg==
X-Received: by 2002:ac8:3325:: with SMTP id t34mr44082999qta.172.1559940571006; 
 Fri, 07 Jun 2019 13:49:31 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id b66sm1666176qkd.37.2019.06.07.13.49.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 13:49:30 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZLnm-0001TA-75; Fri, 07 Jun 2019 17:49:30 -0300
Date: Fri, 7 Jun 2019 17:49:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 09/11] mm/hmm: Poison hmm_range during unregister
Message-ID: <20190607204930.GV14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-10-jgg@ziepe.ca>
 <96a2739f-6902-05be-7143-289b41c4304d@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96a2739f-6902-05be-7143-289b41c4304d@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=xpue/yTKTfw/egd/V5x6eR0dUTrWX63mNojFgXXVaNY=;
 b=XXE969tPj//9W51VkE9buoc1JR7bmeVIhDAenkig2qDcQeGQ9MQNdB4210YOgBQ6Ee
 urj3N09P7L5Mjvi4xbXHFj8HKfPprYKq7M7k/EcjofeMB2GoxEsuqBmDRxsipmPauBqe
 JJ48ov9QD+JiHQdqD9ykoXBcB6idhYNIBBpzZJ3zljvLxzfdUEHW6WPXsiiOISOg1mj6
 7DBax0TlpUXdzKzMpIHUKAbPg2PH7L5VNttRwq2gKh2xi8KiWg94GJWmCGzV9d7EA4dS
 T2I4WYqCFPx5kBGsqWXqkhkJCYicSNB5CNfx8sekAbHUUM1GtLdieXZWKGLrM/mxrLUx
 C/1Q==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6NDY6MzBQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiAKPiA+IFRyeWlu
ZyB0byBtaXN1c2UgYSByYW5nZSBvdXRzaWRlIGl0cyBsaWZldGltZSBpcyBhIGtlcm5lbCBidWcu
IFVzZSBXQVJOX09OCj4gPiBhbmQgcG9pc29uIGJ5dGVzIHRvIGRldGVjdCB0aGlzIGNvbmRpdGlv
bi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3gu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+
Cj4gCj4gPiB2Mgo+ID4gLSBLZWVwIHJhbmdlIHN0YXJ0L2VuZCB2YWxpZCBhZnRlciB1bnJlZ2lz
dHJhdGlvbiAoSmVyb21lKQo+ID4gICBtbS9obW0uYyB8IDcgKysrKystLQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+ID4gaW5kZXggNjgwMmRlNzA4MGQxNzIuLmMyZmVj
YjNlY2IxMWUxIDEwMDY0NAo+ID4gKysrIGIvbW0vaG1tLmMKPiA+IEBAIC05MzcsNyArOTM3LDcg
QEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKPiA+
ICAgCXN0cnVjdCBobW0gKmhtbSA9IHJhbmdlLT5obW07Cj4gPiAgIAkvKiBTYW5pdHkgY2hlY2sg
dGhpcyByZWFsbHkgc2hvdWxkIG5vdCBoYXBwZW4uICovCj4gPiAtCWlmIChobW0gPT0gTlVMTCB8
fCByYW5nZS0+ZW5kIDw9IHJhbmdlLT5zdGFydCkKPiA+ICsJaWYgKFdBUk5fT04ocmFuZ2UtPmVu
ZCA8PSByYW5nZS0+c3RhcnQpKQo+ID4gICAJCXJldHVybjsKPiAKPiBXQVJOX09OKCkgaXMgZGVm
aW5pdGVseSBiZXR0ZXIgdGhhbiBzaWxlbnQgcmV0dXJuIGJ1dCBJIHdvbmRlciBob3cKPiB1c2Vm
dWwgaXQgaXMgc2luY2UgdGhlIGNhbGxlciBzaG91bGRuJ3QgYmUgbW9kaWZ5aW5nIHRoZSBobW1f
cmFuZ2UKPiBvbmNlIGl0IGlzIHJlZ2lzdGVyZWQuIE90aGVyIGZpZWxkcyBjb3VsZCBiZSBjaGFu
Z2VkIHRvby4uLgoKSSBkZWxldGVkIHRoZSB3YXJuIG9uIChzZWUgdGhlIG90aGVyIHRocmVhZCks
IGJ1dCBJJ20gY29uZnVzZWQgYnkgeW91ciAKInNob3VsZG4ndCBiZSBtb2RpZmllZCIgc3RhdGVt
ZW50LgoKVGhlIG9ubHkgdGhpbmcgdGhhdCBuZWVkcyB0byBiZSBzZXQgYW5kIHJlbWFpbiB1bmNo
YW5nZWQgZm9yIHJlZ2lzdGVyCmlzIHRoZSB2aXJ0dWFsIHN0YXJ0L2VuZCBhZGRyZXNzLiBFdmVy
eXRoaW5nIGVsc2Ugc2hvdWxkIGJlIGRvbmUgb25jZQppdCBpcyBjbGVhciB0byBwcm9jZWVkIGJh
c2VkIG9uIHRoZSBjb2xsaXNpb24tcmV0cnkgbG9ja2luZyBzY2hlbWUKdGhpcyB1c2VzLgoKQmFz
aWNhbGx5IHRoZSByYW5nZSByZWdpc3RlciBvbmx5IHNldHVwcyBhICdkZXRlY3RvcicgZm9yIGNv
bGxpZGluZwppbnZhbGlkYXRpb25zLiBUaGUgb3RoZXIgc3R1ZmYgaW4gdGhlIHN0cnVjdCBpcyBq
dXN0IHJhbmRvbSB0ZW1wb3JhcnkKc3RvcmFnZSBmb3IgdGhlIEFQSS4KCkFGQUlDUyBhdCBsZWFz
dC4uCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
