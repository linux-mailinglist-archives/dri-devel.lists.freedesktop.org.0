Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70994906AF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 19:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8B6E36D;
	Fri, 16 Aug 2019 17:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE06E36D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 17:21:53 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id j7so10248156ota.9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zMvxega2p/6F2S/eoDzz+sN4i7bM8B+uz60Grtez1JE=;
 b=V9CQDSEkteMPlMJ/kFZ3q7WOzje0L/gmcHXP8hadlkpZxxfnDiUZqiQ7Ifa4aHPyxr
 ++wnyvXo7AzZ0oFwCJX03RG6Nb6xzBD69s7bdJhg6bm8ntXQyge6FDQ3alSQleH/pdnd
 A/ja80pN4X1I9dIcFddFO5ckcKgS+XxN8H+BSmij9CfHOCjwP379vHhbeQAC9bRx7vBx
 Ysr7fHh4ATtQxAE4V7SPUCGDY/wZa64hF/B/IWK6l1Y+lnP2bS7pLbksKMEaC88d54P/
 7m+gXpc7mANniKOGP8C7cDkPkku8fg2O7BYghFqV7zqT3uSpWzrPcvQgtjj/CQfvnvzn
 tRpg==
X-Gm-Message-State: APjAAAUcx0o84m3okD6WdprBOjs99vhWdffjFpon41M4F257Ay7wAKVH
 EEH0nCCA6lt/L+j+40k9BtsUxzh8eQOW6KP6kqZwwA==
X-Google-Smtp-Source: APXvYqwNxRXX6MojhKuxmTIkgv8yzk3NfRtB0XcnaOCwg7viPPwMQ/JTCtWNqWdiMYWGOJVL8emAQc22ws+XFOORnhM=
X-Received: by 2002:a9d:6b96:: with SMTP id b22mr8643397otq.363.1565976113121; 
 Fri, 16 Aug 2019 10:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
 <20190816004053.GB9929@mellanox.com>
 <CAPcyv4gMPVmY59aQAT64jQf9qXrACKOuV=DfVs4sNySCXJhkdA@mail.gmail.com>
 <20190816122414.GC5412@mellanox.com>
In-Reply-To: <20190816122414.GC5412@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 16 Aug 2019 10:21:41 -0700
Message-ID: <CAPcyv4jgHF05gdRoOFZORqeOBE9Z7PhagsSD+LVnjH2dc3mrFg@mail.gmail.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zMvxega2p/6F2S/eoDzz+sN4i7bM8B+uz60Grtez1JE=;
 b=QCN9eZvxzAPGmUPLnJH/woDtKhvSbyWNPI2WVuuw78XLs8YTeApowbbTpG4QmVhRT8
 KiEz3hmHc4YlVhpGKa4TQ2iVsusMkMmynlM+BCY4q+fdKS3rJPykSdyfO9A3QGOq+bCv
 Ep1qhKfWcW3SsmTBurcp0FktyN0IH0JZXWMk3EtkNfv4UCl45hWL/qKUAJyVWq8HCPc+
 04MySaN5P2L8D4z2nil2AJHtxzcCAXe9+Ae3Qzl3Th1EMpkCiYr6W6vATmErlpeFN+X6
 UckZrP9+cKrZkBK1Mne3Ywq2nD/UZNxrcPAq4iFlzuaxVK76A2sJ0kE48E61MlCk6O69
 /0RQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgNToyNCBBTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxs
YW5veC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDg6NTQ6NDZQTSAt
MDcwMCwgRGFuIFdpbGxpYW1zIHdyb3RlOgo+Cj4gPiA+IEhvd2V2ZXIsIHRoaXMgbWVhbnMgd2Ug
Y2Fubm90IGRvIGFueSBwcm9jZXNzaW5nIG9mIFpPTkVfREVWSUNFIHBhZ2VzCj4gPiA+IG91dHNp
ZGUgdGhlIGRyaXZlciBsb2NrLCBzbyBlZywgZG9pbmcgYW55IERNQSBtYXAgdGhhdCBtaWdodCBy
ZWx5IG9uCj4gPiA+IE1FTU9SWV9ERVZJQ0VfUENJX1AyUERNQSBoYXMgdG8gYmUgZG9uZSBpbiB0
aGUgZHJpdmVyIGxvY2ssIHdoaWNoIGlzCj4gPiA+IGEgYml0IHVuZm9ydHVuYXRlLgo+ID4KPiA+
IFdvdWxkbid0IFAyUERNQSB1c2UgcGFnZSBwaW5zPyBOb3QgbmVlZGluZyB0byBob2xkIGEgbG9j
ayBvdmVyCj4gPiBaT05FX0RFVklDRSBwYWdlIG9wZXJhdGlvbnMgd2FzIG9uZSBvZiB0aGUgbW90
aXZhdGlvbnMgZm9yIHBsdW1iaW5nCj4gPiBnZXRfZGV2X3BhZ2VtYXAoKSB3aXRoIGEgcGVyY3B1
LXJlZi4KPgo+IGhtbV9yYW5nZV9mYXVsdCgpIGRvZXNuJ3QgdXNlIHBhZ2UgcGlucyBhdCBhbGws
IHNvIGlmIGEgWk9ORV9ERVZJQ0UKPiBwYWdlIGNvbWVzIG91dCBvZiBpdCB0aGVuIGl0IG5lZWRz
IHRvIHVzZSBhbm90aGVyIGxvY2tpbmcgcGF0dGVybi4KPgo+IElmIEkgZm9sbG93IGl0IGFsbCBy
aWdodDoKPgo+IFdlIGNhbiBkbyBhIGdldF9kZXZfcGFnZW1hcCBpbnNpZGUgdGhlIHBhZ2Vfd2Fs
ayBhbmQgdG91Y2ggdGhlIHBnbWFwLAo+IG9yIHdlIGNhbiBkbyB0aGUgJ2RldmljZSBtdXRleCAm
JiByZXRyeScgcGF0dGVybiBhbmQgdG91Y2ggdGhlIHBnbWFwCj4gaW4gdGhlIGRyaXZlciwgdW5k
ZXIgdGhhdCBsb2NrLgo+Cj4gSG93ZXZlciBpbiBhbGwgY2FzZXMgdGhlIGN1cnJlbnQgZ2V0X2Rl
dl9wYWdlbWFwKCkncyBpbiB0aGUgcGFnZSB3YWxrCj4gYXJlIG5vdCBuZWNlc3NhcnksIGFuZCB3
ZSBjYW4gZGVsZXRlIHRoZW0uCgpZZXMsIGFzIGxvbmcgYXMgJ3N0cnVjdCBwYWdlJyBpbnN0YW5j
ZXMgcmVzdWx0aW5nIGZyb20gdGhhdCBsb29rdXAgYXJlCm5vdCBwYXNzZWQgb3V0c2lkZSBvZiB0
aGF0IGxvY2suCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
