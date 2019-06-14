Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0245610
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06C78982A;
	Fri, 14 Jun 2019 07:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29498929F;
 Fri, 14 Jun 2019 00:12:05 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02e6550000>; Thu, 13 Jun 2019 17:12:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 17:12:05 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 13 Jun 2019 17:12:05 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 00:12:04 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 00:12:00 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 14 Jun 2019 00:12:00 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d02e64f0000>; Thu, 13 Jun 2019 17:11:59 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: Jerome Glisse <jglisse@redhat.com>, David Airlie <airlied@linux.ie>, "Ben
 Skeggs" <bskeggs@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Subject: [PATCH] drm/nouveau/dmem: missing mutex_lock in error path
Date: Thu, 13 Jun 2019 17:11:21 -0700
Message-ID: <20190614001121.23950-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560471125; bh=2rNJ7DTMjMPhOlVosuT+dcn+kIR1ESSVOR99OmM6ZKM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=neN3kBOM4fwFzxxjmxWL1ltp+tFO8bAcbqFK/NkF6ljwaGDjCyCUNjyfFcYeKG9T4
 5LdGR7QCJzezPlMCmrdKYb1uNBS/iIAEnpK1hMJVC4YlXEsNnr9L2qFHaYil+aBIyJ
 60wMyDHM5XN/zwZxTsCkESQujXLaoeWvhG5kKgnBZubuDk3cxpKMsqfWLQComwBkgO
 y8MOe90H/Rqb7zeWBsQG5hqIu9N7CqlNp/FIgtnz3xiNXN0ispWt/+exKroPpJ9wCJ
 Pz57q/vucsb+GtG/qX1XENQ8dZu+F/CYr0G+CV/G3g2ekKciae45Ha0N3zk6j+9N+U
 gbTCIFIddddug==
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
Cc: nouveau@lists.freedesktop.org, Ralph
 Campbell <rcampbell@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gbm91dmVhdV9kbWVtX3BhZ2VzX2FsbG9jKCksIHRoZSBkcm0tPmRtZW0tPm11dGV4IGlzIHVu
bG9ja2VkIGJlZm9yZQpjYWxsaW5nIG5vdXZlYXVfZG1lbV9jaHVua19hbGxvYygpLgpSZWFjcXVp
cmUgdGhlIGxvY2sgYmVmb3JlIGNvbnRpbnVpbmcgdG8gdGhlIG5leHQgcGFnZS4KClNpZ25lZC1v
ZmYtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KLS0tCgpJIGZvdW5k
IHRoaXMgd2hpbGUgdGVzdGluZyBKYXNvbiBHdW50aG9ycGUncyBobW0gdHJlZSBidXQgdGhpcyBp
cwppbmRlcGVuZGFudCBvZiB0aG9zZSBjaGFuZ2VzLiBJIGd1ZXNzIGl0IGNvdWxkIGdvIHRocm91
Z2gKRGF2aWQgQWlybGllJ3MgdHJlZSBmb3Igbm91dmVhdSBvciBKYXNvbidzIHRyZWUuCgogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kbWVtLmMKaW5kZXggMjdhYTRlNzJhYmU5Li4wMGY3MjM2YWYxYjkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCkBAIC0zNzksOSArMzc5LDEwIEBAIG5vdXZl
YXVfZG1lbV9wYWdlc19hbGxvYyhzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwKIAkJCXJldCA9IG5v
dXZlYXVfZG1lbV9jaHVua19hbGxvYyhkcm0pOwogCQkJaWYgKHJldCkgewogCQkJCWlmIChjKQot
CQkJCQlicmVhazsKKwkJCQkJcmV0dXJuIDA7CiAJCQkJcmV0dXJuIHJldDsKIAkJCX0KKwkJCW11
dGV4X2xvY2soJmRybS0+ZG1lbS0+bXV0ZXgpOwogCQkJY29udGludWU7CiAJCX0KIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
