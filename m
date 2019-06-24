Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8060852458
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4495089F31;
	Tue, 25 Jun 2019 07:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80B789DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f15so5491601wrp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rs1sEkzygtR6lbRJ0eUbAFkZlHYnT1CPNgA7awG9NQc=;
 b=edxOt0OM6k16+wD0qfYr1+21GgOaVnqoh+Qhu1RmlKUDFWOuF/SJkFDL6T/mVwEU0z
 6FfLTJgfuuhyIbhp41ADD9YTADCGWZQUIFYE//myahOzEOHOZSxfk8xkQEHSXrjf4YPr
 TAQZeqdubpvA+E4U2Ui1BAEZAyrJGRvR2TqIwonbNHWUqRZfQtt1S0Tk9SGFlXikMsx2
 yTMpVsEs4hgTcjE23N+ZDqJBLTJUpwRVjsE/Yti8FjorhpvP6PcrJt5bszQrlGyqVF0n
 Yu8aRnElFJnU3ez05Q/aB0LTvE3tS7AXXYsMzlv3OS4zzUbIYaYUbX40MRuD+KPmMKP+
 JyeQ==
X-Gm-Message-State: APjAAAXzsynq/n50QSQzeICxGgfPz2r7+AVVKc12SFtRlvziQ7JYsZAb
 k6yunqJEaLkPMEk1nBSCsFq3aQ==
X-Google-Smtp-Source: APXvYqxoDaUcVHfte6JF2hIkD4U/Q2PNoEzAwuS3zYv3vRjkVzwDyM9fIRPi2AhLNMqFWzhsn/OFnQ==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr102260622wrv.164.1561410123399; 
 Mon, 24 Jun 2019 14:02:03 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id h14sm11086221wrs.66.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6D-0001Mp-1k; Mon, 24 Jun 2019 18:02:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 09/12] mm/hmm: Remove racy protection against
 double-unregistration
Date: Mon, 24 Jun 2019 18:01:07 -0300
Message-Id: <20190624210110.5098-10-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rs1sEkzygtR6lbRJ0eUbAFkZlHYnT1CPNgA7awG9NQc=;
 b=f0F8mUp38+BSw/O1WjANVXVVMw8zhFZORjdRX1RtgtwdBgUWBtS4DuFgknhtRckqjJ
 fDPYac3PHVynkBRdhou+SH6UptVQIxVUIQifavRFZYv+BeWfES7diE3vVczt6RfpUEOL
 HKyKRdDLLYkWyPF33zlBvSCxa/KBn2/+Y2Sy1hmyEQzxoSkWZdP4GxRWfGqLBUquGL9C
 Ly8tJeOzyL9mpaDnKGNVFtycDXcnewWGVJEzIZFjBXuryCCVlKkVubMEGUB9qDKesfui
 S5zt2wnmoNX0dsm2two3hmXge0XbsLY2LY0GsVP/TYD0CD+hqf8x5J0pMRR0Lz+jvG54
 bukQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTm8gb3RoZXIgcmVnaXN0
ZXIvdW5yZWdpc3RlciBrZXJuZWwgQVBJIGF0dGVtcHRzIHRvIHByb3ZpZGUgdGhpcyBraW5kIG9m
CnByb3RlY3Rpb24gYXMgaXQgaXMgaW5oZXJlbnRseSByYWN5LCBzbyBqdXN0IGRyb3AgaXQuCgpD
YWxsZXJzIHNob3VsZCBwcm92aWRlIHRoZWlyIG93biBwcm90ZWN0aW9uLCBhbmQgaXQgYXBwZWFy
cyBub3V2ZWF1CmFscmVhZHkgZG9lcy4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUBy
ZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29t
PgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClRlc3RlZC1ieTogUGhpbGlw
IFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQp2MwotIERyb3AgcG9pc29uLCBsb29rcyBs
aWtlIHRoZXJlIGFyZSBubyBuZXcgcGF0Y2hlcyB0aGF0IHdpbGwgdXNlIHRoaXMKICB3cm9uZyAo
Q2hyaXN0b3BoKQotLS0KIG1tL2htbS5jIHwgOCArLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0v
aG1tLmMKaW5kZXggNmY1ZGM2ZDU2OGZlYjEuLjJlZjE0YjJiNTUwNWY2IDEwMDY0NAotLS0gYS9t
bS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtMjc2LDE3ICsyNzYsMTEgQEAgRVhQT1JUX1NZTUJP
TChobW1fbWlycm9yX3JlZ2lzdGVyKTsKICAqLwogdm9pZCBobW1fbWlycm9yX3VucmVnaXN0ZXIo
c3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcikKIHsKLQlzdHJ1Y3QgaG1tICpobW0gPSBSRUFEX09O
Q0UobWlycm9yLT5obW0pOwotCi0JaWYgKGhtbSA9PSBOVUxMKQotCQlyZXR1cm47CisJc3RydWN0
IGhtbSAqaG1tID0gbWlycm9yLT5obW07CiAKIAlkb3duX3dyaXRlKCZobW0tPm1pcnJvcnNfc2Vt
KTsKIAlsaXN0X2RlbF9pbml0KCZtaXJyb3ItPmxpc3QpOwotCS8qIFRvIHByb3RlY3QgdXMgYWdh
aW5zdCBkb3VibGUgdW5yZWdpc3RlciAuLi4gKi8KLQltaXJyb3ItPmhtbSA9IE5VTEw7CiAJdXBf
d3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOwotCiAJaG1tX3B1dChobW0pOwogfQogRVhQT1JUX1NZ
TUJPTChobW1fbWlycm9yX3VucmVnaXN0ZXIpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
