Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE140298AEB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 11:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABDC6E87E;
	Mon, 26 Oct 2020 10:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5396E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:58:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h5so11861683wrv.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm+L1OZ5vnKeOGH1XwjpH65CAXQE2qGCwQHeV0BfCbo=;
 b=WDXic3xEelIUmmKBuCaAQhWAocM+J6l4Fj4ebPaY2TA7KjqktouI6kx1cuzB8y9UHb
 BFENQYpFYRrnf8V4M8FMdw5d3WVXp99ZQMaG9LdvbhHrDb1RPzEBMwS3mFEVGyKOFx19
 gvYOzFywjU6mguxvCAHNCjVghPiiwoY0kNQWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fm+L1OZ5vnKeOGH1XwjpH65CAXQE2qGCwQHeV0BfCbo=;
 b=FU3I+z+OsaQhaY4yY2l/oDRdRnSI5GIXwfdz1CEAaAVdbuPMD74LqdjHL27gC5mdEA
 7wkPpczafSOPQsfH7ny7jDLZGI1N/J2P/zxSAWG3MYAxR7sVJ2/RznRyFFzbI79BSIXj
 OqaZEWvp/LmultJOscniiPFNEEdrrhxCwwYvmapmNz9o8AlCeatncnxB+Nr7Yue7Vv0p
 eMOU29xavzNC7Np0jwX/O8sHOdBuYMVfDEKB1PFD8TOuVyi9yFu5BQTNzPrEfFgfCjX7
 qp8h/reqG3RnyGwAEQAwJtEZA8VdGN0iityoj+GBYxlm/AWRqT0rM1dcdncU0TRzj1q0
 NtUQ==
X-Gm-Message-State: AOAM532fHLKpO9O+X97TVhwr1KBhYd+03qmN0+AGvLWMRIl8yxUPTuuv
 BPYyvcVNr+uI89edIcEkn/I4orMT8Vn1f5Ug
X-Google-Smtp-Source: ABdhPJweUKS7rePvehoYbUjnZ9k8M/DdLl55bpzabm8YcXT6EbKByVlIbEgXWPVVGpbtM3F7y6c03w==
X-Received: by 2002:adf:fa0e:: with SMTP id m14mr16288559wrr.134.1603709911230; 
 Mon, 26 Oct 2020 03:58:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w83sm21165156wmg.48.2020.10.26.03.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 03:58:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/15] misc/habana: Use FOLL_LONGTERM for userptr
Date: Mon, 26 Oct 2020 11:58:07 +0100
Message-Id: <20201026105818.2585306-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Pawel Piskorski <ppiskorski@habana.ai>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ofir Bitton <obitton@habana.ai>, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, Omer Shpigelman <oshpigelman@habana.ai>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Moti Haimovski <mhaimovski@habana.ai>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIHBlcnNpc3RlbnQsIG5vdCBqdXN0IGZvciB0aGUgZHVyYXRpb24gb2YgYSBkbWEg
b3BlcmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
Q2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogT2RlZCBHYWJiYXkgPG9kZWQu
Z2FiYmF5QGdtYWlsLmNvbT4KQ2M6IE9tZXIgU2hwaWdlbG1hbiA8b3NocGlnZWxtYW5AaGFiYW5h
LmFpPgpDYzogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPgpDYzogVG9tZXIgVGF5YXIg
PHR0YXlhckBoYWJhbmEuYWk+CkNjOiBNb3RpIEhhaW1vdnNraSA8bWhhaW1vdnNraUBoYWJhbmEu
YWk+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFBhd2VsIFBpc2tv
cnNraSA8cHBpc2tvcnNraUBoYWJhbmEuYWk+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29t
bW9uL21lbW9yeS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24v
bWVtb3J5LmMgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKaW5kZXgg
MzI3YjY0NDc5Zjk3Li43NjdkMzY0NGMwMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWlzYy9oYWJh
bmFsYWJzL2NvbW1vbi9tZW1vcnkuYworKysgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21t
b24vbWVtb3J5LmMKQEAgLTEyODgsNyArMTI4OCw4IEBAIHN0YXRpYyBpbnQgZ2V0X3VzZXJfbWVt
b3J5KHN0cnVjdCBobF9kZXZpY2UgKmhkZXYsIHU2NCBhZGRyLCB1NjQgc2l6ZSwKIAkJcmV0dXJu
IC1FTk9NRU07CiAJfQogCi0JcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucGFnZXMs
IEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFLAorCXJjID0gcGluX3VzZXJfcGFnZXNfZmFzdChzdGFy
dCwgbnBhZ2VzLAorCQkJCSBGT0xMX0ZPUkNFIHwgRk9MTF9XUklURSB8IEZPTExfTE9OR1RFUk0s
CiAJCQkJIHVzZXJwdHItPnBhZ2VzKTsKIAogCWlmIChyYyAhPSBucGFnZXMpIHsKLS0gCjIuMjgu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
