Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0802188740
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89FC6E187;
	Tue, 17 Mar 2020 14:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F4989F69
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 19:23:10 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id i26so5519634qtq.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=japvuDOw9SGBqSZApCc07hbPuberx25oVTkg1eTKZyE=;
 b=CFIdmYKPQbgW8rXZ3LC8dolLHGk7btoV/9hlvb5sqVhK0DUjJDXu0iZhOjxeCn2MXG
 /GdpkxMBbg8aF1rAo+EIq7OH9mCMBe/2T+Mh4ULqx3GrLCMKdXErAZkN3EWgrvUYiE/9
 YOsEl53+z1kUZvnp9AIkcpOSLh2XFfGBeR7YGg5KYZoOCJ6Llm4hGbCu+XkywWZBzH6h
 lD7jhCnLSACgr36Z/dqlVpfUUV//Vd/IFcrfepwwWKxrbVILimo/2vBi7XDedG9mtfvN
 spfwCyQk9XfHm7OxqBw8vX0OWPo5Guzt+vsjlAGKsVxpRbMFXYbmNK2g1DeKIpHUtd2q
 IWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=japvuDOw9SGBqSZApCc07hbPuberx25oVTkg1eTKZyE=;
 b=G3sTgLFEXUAkJY/yx7ZwzDrUjzsvd/NNg32xMF1jybhlrPKyfidtugBuDEqwFbYrDO
 n/cS937jULoGdtHFEwoXeJNgDXG0AVAB5vdagll6lTQ38QuOWJM4qT8UY2og4355U0Bc
 WBUQCRWXebK00U6kAWBsxwBUd+qS4WiOOOB5s7HEQoJGVbrERxVLQfAKFrtP5BJCp3L7
 hApaMTivqOoSIykFItK0PqMV13feuNgg/KuUjEAtft7NaCZzsKToJDd9mORBKY7OakzL
 wCmBHFRTTPWeWHcwMcSybze1ABjGZKiXq/KZ8XFMtCYDogCiALyBCPIksEw36qyqwhu2
 bJSg==
X-Gm-Message-State: ANhLgQ1Kj3/+94DovXq98RkvD34w+jkMHWxWiSe0Fw/LYw0Y9PinhcJ0
 MU7lJCNT7fKmpId4sbo12M2EWQ==
X-Google-Smtp-Source: ADFU+vvVMnfIMif/CgGrxSyHwE3QBkrQjxwCDJ989v5erqtbWFOprWqGIpfeC4BCoYoIRoAt/XoJLQ==
X-Received: by 2002:aed:32e7:: with SMTP id z94mr1723801qtd.382.1584386589754; 
 Mon, 16 Mar 2020 12:23:09 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id w30sm528758qtw.21.2020.03.16.12.23.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 12:23:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDvKO-0006vf-S6; Mon, 16 Mar 2020 16:23:08 -0300
Date: Mon, 16 Mar 2020 16:23:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH  hmm 2/8] mm/hmm: don't free the cached pgmap while
 scanning
Message-ID: <20200316192308.GO20941@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-3-jgg@ziepe.ca>
 <20200316090250.GB12439@lst.de> <20200316180713.GI20941@ziepe.ca>
 <20200316181324.GA24533@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316181324.GA24533@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMDc6MTM6MjRQTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMDM6MDc6MTNQTSAtMDMwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gSSBjaG9zZSB0aGlzIHRvIGJlIHNpbXBsZSB3aXRob3V0
IGhhdmluZyB0byBnb3RvIHVud2luZCBpdC4KPiA+IAo+ID4gU28sIGluc3RlYWQgbGlrZSB0aGlz
Ogo+IAo+IEFzINGVYWlkLCBhbmQgcGVyIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uOiAgSSB0aGlu
ayBqdXN0IHJlbW92aW5nIHRoZQo+IHBnbWFwIGxvb2t1cCBpcyB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8gaGVyZS4gIFNvbWV0aGluZyBsaWtlIHRoaXMgcGF0Y2g6CgpPSy4gSSB0aGluayBJIGdldCBp
dCBub3cuCgpXZSBkb24ndCBldmVuIHNpZ25hbCB0aGF0IHRoZSBwZm4gaXMgYSBwZ21hcCB0byB0
aGUgY2FsbGVyLCBzbyB0aGUKY2FsbGVyIG11c3QgYXNzdW1lIHRoZSBwZm4gaXMgQ1BVIG1lbW9y
eSBhbmQgY2FuIGJlIGRtYSBtYXBwZWQuIEF0CnRoYXQgcG9pbnQgaXQgZG9lc24ndCBtYXR0ZXIg
d2hhdCBraW5kIG9mIHBnbWFwIGl0IGlzLgoKUmFjZXMgaGVyZSBhcmUgcmVzb2x2ZWQgYnkgbm90
aWZpZXJzIGFzIHdlIGNhbid0IGRlc3Ryb3kgdGhlIHBnbWFwCndpdGhvdXQgdHJpZ2dlcmluZyBp
bnZhbGlkYXRpb24gb2YgdGhlIHB0ZQoKU28gcmVtb3ZpbmcgaXMgdGhlIHJpZ2h0IHRoaW5nIHRv
IGRvLCBhbmQgdGhlIGZpeGluZyBmb3IgdGhlCmRldmljZV9wcml2YXRlIGNhc2UgaXMgY2xvc2Vy
IHRvIHRoZSBodW5rIEkganVzdCBzZW50LgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
