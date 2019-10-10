Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5375D2A9D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1B56EB2B;
	Thu, 10 Oct 2019 13:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA3B6EB2B;
 Thu, 10 Oct 2019 13:14:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r2so4343830lfn.8;
 Thu, 10 Oct 2019 06:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C0vnKt7A5LqxtaENHa2gtLyhDwSuKtDsHcAbgoX1Zl0=;
 b=amo5EeeW38zmhV8hw1eDSllgNV7Utg4k8OJKcmHXG5ZV3Mt2RZoXJCEyZSeywGlz6M
 enG3czf/3wyoEyngw+kjBpEH176yhR4TBr4CAG6dEAbbyLNbMX95Bnmsbt+IwhczIMqY
 e8hGw9Xc8zPF7W7y/ZvFVB0EtmhusCg59XS2AmxSSRtv7bQCh+1UDglbhNQcgnMSy6Z4
 nyFtWjrLElo79F5CpLj3NHkdWD3mx2gyhez/hOKqwTX+iPxDolbEdILNTmTRTJO4P5ET
 QZXjtjjMWH9xdddT40UaSqDLzC2/c5TAgGHqBWqQLRK69GNhsVGh1lzvAZF4AeWB0j52
 5HCw==
X-Gm-Message-State: APjAAAVNG5I02dqLmaf2v3pmR2xLNDNOgyC+3VE1ZwROCox8dhrRaR+q
 YP+0g2eKod2gSPZnsoxCC6Q=
X-Google-Smtp-Source: APXvYqzmken7paFvOEfr/CD2e/T7S2TzQVEBo50hTfTSua/scq6cymNNbisN35TBca4BLqUtqWWS/w==
X-Received: by 2002:a19:c514:: with SMTP id w20mr6058964lfe.135.1570713276057; 
 Thu, 10 Oct 2019 06:14:36 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id w27sm1233549ljd.55.2019.10.10.06.14.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:14:34 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@xi.terra>)
 id 1iIYHF-0006Ap-GZ; Thu, 10 Oct 2019 15:14:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>
Subject: [PATCH 2/4] media: bdisp: fix memleak on release
Date: Thu, 10 Oct 2019 15:13:31 +0200
Message-Id: <20191010131333.23635-3-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131333.23635-1-johan@kernel.org>
References: <20191010131333.23635-1-johan@kernel.org>
MIME-Version: 1.0
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hans Verkuil <hans.verkuil@cisco.com>, stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYSBwcm9jZXNzIGlzIGludGVycnVwdGVkIHdoaWxlIGFjY2Vzc2luZyB0aGUgdmlkZW8gZGV2
aWNlIGFuZCB0aGUKZGV2aWNlIGxvY2sgaXMgY29udGVuZGVkLCByZWxlYXNlKCkgY291bGQgcmV0
dXJuIGVhcmx5IGFuZCBmYWlsIHRvIGZyZWUKcmVsYXRlZCByZXNvdXJjZXMuCgpOb3RlIHRoYXQg
dGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgdjRsMiByZWxlYXNlIGZpbGUgb3BlcmF0aW9uIGlzCmln
bm9yZWQuCgpGaXhlczogMjhmZmVlYmJiN2JkICgiW21lZGlhXSBiZGlzcDogMkQgYmxpdHRlciBk
cml2ZXIgdXNpbmcgdjRsMiBtZW0ybWVtIGZyYW1ld29yayIpCkNjOiBzdGFibGUgPHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmc+ICAgICAjIDQuMgpDYzogRmFiaWVuIERlc3Nlbm5lIDxmYWJpZW4uZGVz
c2VubmVAc3QuY29tPgpDYzogSGFucyBWZXJrdWlsIDxoYW5zLnZlcmt1aWxAY2lzY28uY29tPgpD
YzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQG9zZy5zYW1zdW5nLmNvbT4KU2lnbmVk
LW9mZi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLXY0bDIuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jCmluZGV4IGU5MGYxYmEzMDU3NC4uNjc1YjVmMmI0
YzJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC12
NGwyLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5j
CkBAIC02NTEsOCArNjUxLDcgQEAgc3RhdGljIGludCBiZGlzcF9yZWxlYXNlKHN0cnVjdCBmaWxl
ICpmaWxlKQogCiAJZGV2X2RiZyhiZGlzcC0+ZGV2LCAiJXNcbiIsIF9fZnVuY19fKTsKIAotCWlm
IChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJmJkaXNwLT5sb2NrKSkKLQkJcmV0dXJuIC1FUkVT
VEFSVFNZUzsKKwltdXRleF9sb2NrKCZiZGlzcC0+bG9jayk7CiAKIAl2NGwyX20ybV9jdHhfcmVs
ZWFzZShjdHgtPmZoLm0ybV9jdHgpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
