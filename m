Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A79D549
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8B6E282;
	Mon, 26 Aug 2019 18:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6EE6E280;
 Mon, 26 Aug 2019 18:02:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d641ea70000>; Mon, 26 Aug 2019 11:02:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 26 Aug 2019 11:02:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 26 Aug 2019 11:02:13 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Aug
 2019 18:02:12 +0000
Subject: Re: [PATCH 1/2] mm/hmm: hmm_range_fault() NULL pointer bug
To: Christoph Hellwig <hch@lst.de>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-2-rcampbell@nvidia.com> <20190824223754.GA21891@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e2ecc1a7-0d2f-5957-e6cb-b3c86c085d80@nvidia.com>
Date: Mon, 26 Aug 2019 11:02:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190824223754.GA21891@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1566842535; bh=q0XlO0WIP1WKl6O/MutlXE9k/HAHL1+wksVgPZA90XQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=d2fknKfO2/+Zv6spaSSH3ujdgxCAZH3q2pr6c/Siwshb41aUxlG/I+6Tyj3fXyYY5
 r1ZUUnxreiuxEswRCYLLZsMIXjsrYEZ2qKObAcIzx4lFW+80OBz929fmspCEwePFSM
 Weh8IBdvRGmAYugnTXZh+qH1U82UBGS1UKNXbJ6ZBS+xJMiQMjfCYuJvF6l51O9pkO
 O0oy/5uowbDESOjWEqnQfr3ZNPKFAUyr/vq/8JL6L4ZXdjyHlF2eCpi6YaUIhZ26eX
 tDQ19l3lAZnppu1N//ySuXInwpJ3YqMTeBXQVmBM1ehXjdv0DZYHvm24rrRDsWS3r/
 wDuGvR7pgamGw==
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
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjQvMTkgMzozNyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gRnJpLCBB
dWcgMjMsIDIwMTkgYXQgMDM6MTc6NTJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4+
IEFsdGhvdWdoIGhtbV9yYW5nZV9mYXVsdCgpIGNhbGxzIGZpbmRfdm1hKCkgdG8gbWFrZSBzdXJl
IHRoYXQgYSB2bWEgZXhpc3RzCj4+IGJlZm9yZSBjYWxsaW5nIHdhbGtfcGFnZV9yYW5nZSgpLCBo
bW1fdm1hX3dhbGtfaG9sZSgpIGNhbiBzdGlsbCBiZSBjYWxsZWQKPj4gd2l0aCB3YWxrLT52bWEg
PT0gTlVMTCBpZiB0aGUgc3RhcnQgYW5kIGVuZCBhZGRyZXNzIGFyZSBub3QgY29udGFpbmVkCj4+
IHdpdGhpbiB0aGUgdm1hIHJhbmdlLgo+IAo+IFNob3VsZCB3ZSBjb252ZXJ0IHRvIHdhbGtfdm1h
X3JhbmdlIGluc3RlYWQ/ICBPciBrZWVwIHdhbGtfcGFnZV9yYW5nZQo+IGJ1dCBkcm9wIHNlYXJj
aGluZyB0aGUgdm1hIG91cnNlbHZlcz8KPiAKPiBFeGNlcHQgZm9yIHRoYXQgdGhlIHBhdGNoIGxv
b2tzIGdvb2QgdG8gbWU6Cj4gCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgo+IAoKSSB0aGluayBrZWVwaW5nIHRoZSBjYWxsIHRvIHdhbGtfcGFnZV9yYW5nZSgp
IG1ha2VzIHNlbnNlLgpKYXNvbiBpcyBob3BpbmcgdG8gYmUgYWJsZSB0byBzbmFwc2hvdCBhIHJh
bmdlIHdpdGggJiB3aXRob3V0IHZtYXMKYW5kIGhhdmUgdGhlIHBmbnNbXSBmaWxsZWQgd2l0aCBl
bXB0eS92YWxpZCBlbnRyaWVzIGFzIGFwcHJvcHJpYXRlLgoKSSBwbGFuIHRvIHJlcG9zdCBteSBw
YXRjaCBjaGFuZ2luZyBobW1fcmFuZ2VfZmF1bHQoKSB0byB1c2UKd2Fsay50ZXN0X3dhbGsgd2hp
Y2ggd2lsbCByZW1vdmUgdGhlIGNhbGwgdG8gZmluZF92bWEoKS4KSmFzb24gaGFkIHNvbWUgY29u
Y2VybnMgYWJvdXQgdGVzdGluZyBpdCBzbyB0aGF0J3Mgd2h5IEkgaGF2ZQpiZWVuIHdvcmtpbmcg
b24gc29tZSBITU0gc2VsZiB0ZXN0cyBiZWZvcmUgcmVzZW5kaW5nIGl0LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
