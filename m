Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D463179
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1052F89BBE;
	Tue,  9 Jul 2019 07:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB63D89F53;
 Mon,  8 Jul 2019 17:30:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d237dcc0001>; Mon, 08 Jul 2019 10:30:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 08 Jul 2019 10:30:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 08 Jul 2019 10:30:56 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Jul
 2019 17:30:55 +0000
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>
References: <20190703220214.28319-1-hch@lst.de>
 <20190704164236.GP3401@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <41dbb308-fc9e-d730-ffb0-6ce051dff1e1@nvidia.com>
Date: Mon, 8 Jul 2019 10:30:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190704164236.GP3401@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562607052; bh=uAosH4rcWhCpsYgdv7tD56ho8lbt2DTohfs/exVueGE=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jHtVNZux6j3btAC9zECxouW2X2X+bK1i9oF4C4A/Q9DWBR6i+sgDlWhjq9OHySob+
 NKYQ+ttlZ144MP71OeW7R8RFbx3dpzYZtDFxJ4U8MMtirXaSFOMFf5Wrr/ALyvn0NV
 ImhfP70z7sKEnSBaWwJDHhcwMQ7Lzp2xgBPbUa5ma7/wScK0abV/JFCWJFKePtyEiY
 3wz80LEdu5nuw/rDGedPWDuwfuYUC1cP3J4H+C0Ewt3gXjrcCe8fQAHRVFUUmKBA3V
 pPffYKMqtSM0gysCMdxQnW88TizXrXplVyoXYIzb8LYYAAFg8PE1kZsaKHw5TlXlOl
 tHpsXfTMIiEcw==
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvNC8xOSA5OjQyIEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MDMsIDIwMTkgYXQgMDM6MDI6MDhQTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+
IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLAo+Pgo+PiBiZWxvdyBpcyBhIHNlcmllcyBhZ2Fp
bnN0IHRoZSBobW0gdHJlZSB3aGljaCBmaXhlcyB1cCB0aGUgbW1hcF9zZW0KPj4gbG9ja2luZyBp
biBub3V2ZWF1IGFuZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhN
TSBBUElzCj4+IG9ubHkgdXNlZCBieSBub3V2ZWF1Lgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+
PiAgIC0gZG9uJ3QgcmV0dXJuIHRoZSB2YWxpZCBzdGF0ZSBmcm9tIGhtbV9yYW5nZV91bnJlZ2lz
dGVyCj4+ICAgLSBhZGRpdGlvbmFsIG5vdXZlYXUgY2xlYW51cHMKPiAKPiBSYWxwaCwgc2luY2Ug
bW9zdCBvZiB0aGlzIGlzIG5vdXZlYXUgY291bGQgeW91IGNvbnRyaWJ1dGUgYQo+IFRlc3RlZC1i
eT8gVGhhbmtzCj4gCj4gSmFzb24KPiAKCkkgY2FuIHRlc3QgdGhpbmdzIGZhaXJseSBlYXNpbHkg
YnV0IHdpdGggYWxsIHRoZSBkaWZmZXJlbnQgcGF0Y2hlcywKY29uZmxpY3RzLCBhbmQgcGVyc29u
YWwgZ2l0IHRyZWVzLCBjYW4geW91IHNwZWNpZnkgdGhlIGdpdCB0cmVlCmFuZCBicmFuY2ggd2l0
aCBldmVyeXRoaW5nIGFwcGxpZWQgdGhhdCB5b3Ugd2FudCBtZSB0byB0ZXN0PwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
