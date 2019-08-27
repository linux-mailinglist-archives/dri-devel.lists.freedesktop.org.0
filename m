Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13A9FD05
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1689CE3;
	Wed, 28 Aug 2019 08:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC8089BA5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 22:22:22 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j15so689937qtl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 15:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O/Eb9Yv9aHdMVq7eZpOlz+xzQGez6PZaf9uMsvKFVSk=;
 b=eicY86P84gZBR5zpCK2IuSGu3Np6+LyhIK0TDnX6XeGlH2A8dTasRMUXKZWHXbOLUH
 ExuoVS7YUXghBSCIxICdjLflHBwv+Fm1t4PCc/+i+f0W715HdctD6tiLM8oVx9M9/R8Q
 sB36kN+SZ94woM54xIDGeC43JTi6kIXZuPJyWThZ9pYLG5BlDr++dm40Jl0nRnJq/XDO
 U8dRStF4zsXz7FGnfAF2lQLg/huiQKDMM9vlb2ZkByP8LYv8reltcmd/B9MPzFNOpeKD
 KmDi62XzG4vJ8EWnes0Wt/O9Y2GRxlBMZhZ2U7XF7tElDMayMYgKCNeO9gWZ0nFGptYZ
 wQXw==
X-Gm-Message-State: APjAAAVxqk4eoG1vrBhvHmenRx5RqT+Hk5mUFg9NNaQlxH0k/dzSAaBv
 Gs5W3VjiR9h+n36R3SdppbSZbA==
X-Google-Smtp-Source: APXvYqyjufzPEUsNxQkLMwFYT3vRSJjpNbEwwYE37k3KlJ9jZ4hz+iVzDJ0578B4zjHZuy1e3Jd+Ag==
X-Received: by 2002:ad4:47c3:: with SMTP id p3mr808533qvw.120.1566944540997;
 Tue, 27 Aug 2019 15:22:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-216-168.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.216.168])
 by smtp.gmail.com with ESMTPSA id y25sm408767qkj.35.2019.08.27.15.22.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Aug 2019 15:22:20 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1i2jr1-00080x-Hu; Tue, 27 Aug 2019 19:22:19 -0300
Date: Tue, 27 Aug 2019 19:22:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/2] mm/hmm: hmm_range_fault() infinite loop
Message-ID: <20190827222219.GA30700@ziepe.ca>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-3-rcampbell@nvidia.com>
 <20190827184157.GA24929@ziepe.ca>
 <f5c1f198-4bdd-3c23-428f-764f894b9997@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5c1f198-4bdd-3c23-428f-764f894b9997@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O/Eb9Yv9aHdMVq7eZpOlz+xzQGez6PZaf9uMsvKFVSk=;
 b=S5udK1mCM17tEnM8qe/Euf0h6hUrQ+FsIrJswR0TUa9fPCRYoUQo2Bj0vFq0Fv5x7W
 brf7rtaaLWpCWBBcKPEArqo55P7LK9Y+3eaAJqaKFm9q2TqOIryQNcOTxeO43ahRyXMz
 +78BCiCK8tOS1KfOCv/vOzajMjclnKu+sqNB45ittMbYMfVVgnS3nM2+4LsDNk/3U5wE
 KGi8UiI7+GqWkinARDlIKI/eUAIOW3lDoAfSJWFqbiG0llZz8rTszgW14HlsyNgX7pzb
 W7N9EDComqNskKX+zkqao8RVYlPByzJ2Rr93KmNG9Ioy0A2C6bMSUxiivkfsaaJUAjXo
 HBtw==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDE6MTY6MTNQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gOC8yNy8xOSAxMTo0MSBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTc6NTNQTSAtMDcwMCwgUmFscGggQ2FtcGJl
bGwgd3JvdGU6Cj4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1w
YmVsbEBudmlkaWEuY29tPgo+ID4gPiAgIG1tL2htbS5jIHwgMyArKysKPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvbW0vaG1t
LmMgYi9tbS9obW0uYwo+ID4gPiBpbmRleCAyOTM3MTQ4NWZlOTQuLjQ4ODJiODNhZWNjYiAxMDA2
NDQKPiA+ID4gKysrIGIvbW0vaG1tLmMKPiA+ID4gQEAgLTI5Miw2ICsyOTIsOSBAQCBzdGF0aWMg
aW50IGhtbV92bWFfd2Fsa19ob2xlXyh1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcg
ZW5kLAo+ID4gPiAgIAlobW1fdm1hX3dhbGstPmxhc3QgPSBhZGRyOwo+ID4gPiAgIAlpID0gKGFk
ZHIgLSByYW5nZS0+c3RhcnQpID4+IFBBR0VfU0hJRlQ7Cj4gPiA+ICsJaWYgKHdyaXRlX2ZhdWx0
ICYmIHdhbGstPnZtYSAmJiAhKHdhbGstPnZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkpCj4gPiA+
ICsJCXJldHVybiAtRVBFUk07Cj4gPiAKPiA+IENhbiB3YWxrLT52bWEgYmUgTlVMTCBoZXJlPyBo
bW1fdm1hX2RvX2ZhdWx0KCkgdG91Y2hlcyBpdAo+ID4gdW5jb25kaXRpb25hbGx5Lgo+ID4gCj4g
PiBKYXNvbgo+ID4gCj4gd2Fsay0+dm1hIGNhbiBiZSBOVUxMLiBobW1fdm1hX2RvX2ZhdWx0KCkg
bm8gbG9uZ2VyIHRvdWNoZXMgaXQKPiB1bmNvbmRpdGlvbmFsbHksIHRoYXQgaXMgd2hhdCB0aGUg
cHJlY2VkaW5nIHBhdGNoIGZpeGVzLgo+IEkgc3VwcG9zZSBJIGNvdWxkIGNoYW5nZSBobW1fdm1h
X3dhbGtfaG9sZV8oKSB0byBjaGVjayBmb3IgTlVMTAo+IGFuZCBmaWxsIGluIHRoZSBwZm5zW10g
YXJyYXksIEkganVzdCBjaG9zZSB0byBoYW5kbGUgaXQgaW4KPiBobW1fdm1hX2RvX2ZhdWx0KCku
CgpPa2F5LCB5ZXMgbWF5YmUgbG9uZyB0ZXJtIGl0IHdvdWxkIGJlIGNsZWFyZXIgdG8gZG8gdGhl
IHZtYSBudWxsIGNoZWNrCmNsb3NlciB0byB0aGUgc3RhcnQgb2YgdGhlIGNhbGxiYWNrLCBidXQg
dGhpcyBpcyBhIGdvb2QgZW5vdWdoIGJ1ZyBmaXgKClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
