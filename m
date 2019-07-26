Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A87AB75C57
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 02:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8DD6E857;
	Fri, 26 Jul 2019 00:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B25E6E856;
 Fri, 26 Jul 2019 00:57:16 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3a4feb0000>; Thu, 25 Jul 2019 17:57:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jul 2019 17:57:14 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 17:57:14 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 00:57:13 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 00:57:08 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 26 Jul 2019 00:57:08 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d3a4fe40001>; Thu, 25 Jul 2019 17:57:08 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH v2 6/7] mm/hmm: remove hugetlbfs check in hmm_vma_walk_pmd
Date: Thu, 25 Jul 2019 17:56:49 -0700
Message-ID: <20190726005650.2566-7-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726005650.2566-1-rcampbell@nvidia.com>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564102635; bh=D2MJs2fZHD43Md8ZpV6DlNuTDZTSVoq5UF6AxcLBY88=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=dDhXdZ0fq+/bJJsVQCR7FJrU8TlXvz2itR9WvHA+D+zGwHRjQv48omdl45RnxXmpB
 lVwB46LJQ7I1jmYZq8f2HDTONx4QL6yNAHgoDlCDzhsrayuWPJZUlqCiHsvrejtQAo
 IzffaEtC6GLs+mrZgw+/TfanZcDKiKjQzJg6UcKUCcQzs0xxBR7vdmXnZdWx1QuO65
 lsl3wTSKpIjNMBnruP2rDqPtA1oWApYCh1VuHm12T+FlHh0ONlL8rrfRqIuenKDf4H
 l85a/V9vbnHfXJYcg4Hz8fOoowAC4ZLQH9YSs7dtBwWkS9sagT3o5JY0D0Y19kfUqB
 dfO9F2MBE+xGg==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

d2Fsa19wYWdlX3JhbmdlKCkgd2lsbCBvbmx5IGNhbGwgaG1tX3ZtYV93YWxrX2h1Z2V0bGJfZW50
cnkoKSBmb3IKaHVnZXRsYmZzIHBhZ2VzIGFuZCBkb2Vzbid0IGNhbGwgaG1tX3ZtYV93YWxrX3Bt
ZCgpIGluIHRoaXMgY2FzZS4KVGhlcmVmb3JlLCBpdCBpcyBzYWZlIHRvIHJlbW92ZSB0aGUgY2hl
Y2sgZm9yIHZtYS0+dm1fZmxhZ3MgJiBWTV9IVUdFVExCCmluIGhtbV92bWFfd2Fsa19wbWQoKS4K
ClNpZ25lZC1vZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KQ2M6
ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+CkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBtbS9obW0uYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDgzOGNkMWQ1MDQ5Ny4uMjlmMzIy
Y2E1ZDU4IDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtNjMwLDkgKzYz
MCw2IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX3BtZChwbWRfdCAqcG1kcCwKIAlpZiAocG1k
X25vbmUocG1kKSkKIAkJcmV0dXJuIGhtbV92bWFfd2Fsa19ob2xlKHN0YXJ0LCBlbmQsIHdhbGsp
OwogCi0JaWYgKHBtZF9odWdlKHBtZCkgJiYgKHJhbmdlLT52bWEtPnZtX2ZsYWdzICYgVk1fSFVH
RVRMQikpCi0JCXJldHVybiBobW1fcGZuc19iYWQoc3RhcnQsIGVuZCwgd2Fsayk7Ci0KIAlpZiAo
dGhwX21pZ3JhdGlvbl9zdXBwb3J0ZWQoKSAmJiBpc19wbWRfbWlncmF0aW9uX2VudHJ5KHBtZCkp
IHsKIAkJYm9vbCBmYXVsdCwgd3JpdGVfZmF1bHQ7CiAJCXVuc2lnbmVkIGxvbmcgbnBhZ2VzOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
