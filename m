Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D770455EA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D09897E0;
	Fri, 14 Jun 2019 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8869892F8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 00:44:58 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r6so654792qkc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 17:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJP3s5LCTJOa2Bpv3WsF12kBeuFb/g7s2rVIALekTDo=;
 b=sMFXxU1qlhen/k28J4ZE0YPSwhtxBhKK+oKHCvVGAar2wVVLN9eIDHyekhMzxyH1sL
 d0eAcKpKp6MKCvyvWfQkOALUqf9TfuVM4rUD3T51Sqg93GDPp6F2QFznexzX5UOBg4Dc
 aOz0buowX/xqrDgEixY0tTzq5nMWXcmmqwR5IQHDuBmyirHmTiAhtXtlD/bWsvoqIfoq
 K5BNssHuC983a3mCjG6OoZPXrqxwo8tbY4KnjwpR438jBmlGM8RiMcoMA5upoQZcQ++B
 QD4V54Nlk9GiBK6XtJhcweQzGQ6F+lXjOGCOp11IiC6Wr17QjhLyPXQWNGWXy3kpgQDY
 HHaw==
X-Gm-Message-State: APjAAAXHMNVS7U1do4tlkbRxMwXe1ZWtKl5Nlo+ud41i/7QIJb6Tl9cz
 cVWu0pSaXJT4FfrYdcHuf9P++Q==
X-Google-Smtp-Source: APXvYqwYuZdBUIyBE3tnoT2pvasr4EEIwX7YCMbTNFDbznpFFTMobqSAyRGm2KIgVEvCZYbf+NYJww==
X-Received: by 2002:a05:620a:144a:: with SMTP id
 i10mr72376829qkl.130.1560473097962; 
 Thu, 13 Jun 2019 17:44:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id m21sm498643qtp.92.2019.06.13.17.44.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 17:44:54 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hbaKr-0005KE-Ue; Thu, 13 Jun 2019 21:44:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v3 hmm 08/12] mm/hmm: Remove racy protection against
 double-unregistration
Date: Thu, 13 Jun 2019 21:44:46 -0300
Message-Id: <20190614004450.20252-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614004450.20252-1-jgg@ziepe.ca>
References: <20190614004450.20252-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJP3s5LCTJOa2Bpv3WsF12kBeuFb/g7s2rVIALekTDo=;
 b=dyouVytY+jmXKdkQ6AEcE55kZQEWs6bscsYHu17tMqMjO0ykbKjOyu4AZmogdzcKOO
 okRY9yuPH0h4p3cAV4QrnZ4n34NPuyuK97/dkGmB3VzQKnqK9s/XAJtvvIAGZkXqI8Jd
 kp8Bb3YU8e6ArRWr/jcI134rAI1zQOreSW9nSzEGghOTmJk/pJslGcpZKvhe05E8ekCA
 wMSMERjmVYizkkeqJXXp4Y3n+nU+hNQwdsuP0lS3FbYfoYhnJGG75bzPsyyRZjGeXB24
 rhFdNEenuxIK01r0M01cZSie0WszSDebNOB+aFhxWAf9m8Ut+WvZhCrUuTgOing0GJS6
 L08w==
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
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTm8gb3RoZXIgcmVnaXN0
ZXIvdW5yZWdpc3RlciBrZXJuZWwgQVBJIGF0dGVtcHRzIHRvIHByb3ZpZGUgdGhpcyBraW5kIG9m
CnByb3RlY3Rpb24gYXMgaXQgaXMgaW5oZXJlbnRseSByYWN5LCBzbyBqdXN0IGRyb3AgaXQuCgpD
YWxsZXJzIHNob3VsZCBwcm92aWRlIHRoZWlyIG93biBwcm90ZWN0aW9uLCBpdCBhcHBlYXJzIG5v
dXZlYXUgYWxyZWFkeQpkb2VzLCBidXQganVzdCBpbiBjYXNlIGRyb3AgYSBkZWJ1Z2dpbmcgUE9J
U09OLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpS
ZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmlld2Vk
LWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBSYWxw
aCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClRlc3RlZC1ieTogUGhpbGlwIFlhbmcg
PFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQogbW0vaG1tLmMgfCA5ICsrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9t
bS9obW0uYyBiL21tL2htbS5jCmluZGV4IGMwZjYyMmY4NjIyM2MyLi5lM2UwYTgxMWEzYTc3NCAx
MDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTI4MywxOCArMjgzLDEzIEBA
IEVYUE9SVF9TWU1CT0woaG1tX21pcnJvcl9yZWdpc3Rlcik7CiAgKi8KIHZvaWQgaG1tX21pcnJv
cl91bnJlZ2lzdGVyKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IpCiB7Ci0Jc3RydWN0IGhtbSAq
aG1tID0gUkVBRF9PTkNFKG1pcnJvci0+aG1tKTsKLQotCWlmIChobW0gPT0gTlVMTCkKLQkJcmV0
dXJuOworCXN0cnVjdCBobW0gKmhtbSA9IG1pcnJvci0+aG1tOwogCiAJZG93bl93cml0ZSgmaG1t
LT5taXJyb3JzX3NlbSk7CiAJbGlzdF9kZWxfaW5pdCgmbWlycm9yLT5saXN0KTsKLQkvKiBUbyBw
cm90ZWN0IHVzIGFnYWluc3QgZG91YmxlIHVucmVnaXN0ZXIgLi4uICovCi0JbWlycm9yLT5obW0g
PSBOVUxMOwogCXVwX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKLQogCWhtbV9wdXQoaG1tKTsK
KwltZW1zZXQoJm1pcnJvci0+aG1tLCBQT0lTT05fSU5VU0UsIHNpemVvZihtaXJyb3ItPmhtbSkp
OwogfQogRVhQT1JUX1NZTUJPTChobW1fbWlycm9yX3VucmVnaXN0ZXIpOwogCi0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
