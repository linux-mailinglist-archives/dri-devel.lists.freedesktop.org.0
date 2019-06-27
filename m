Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CEE57CD2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D2C6E5D7;
	Thu, 27 Jun 2019 07:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6C76E42D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 05:04:28 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id s20so962839otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 22:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWDmwpCTBQqLpDz0dRgn3YK1CHaVNxNkpin7tUBvoI8=;
 b=Spc5rVebhCIw4+MoFgXZoB295O9OhXxnXQLKEShtpByFgekDL6nVsvU8ytieNNM+bB
 iHRlcqSHcw7rOu8bR8pt730yReSjqGTQSgUZoERV4kuBAqJw3nYg5/hx0QPeiit2fUA0
 0xZvKQLdneNOXPZtSVyQrn7TanbxPPcPWaYWWQxTeNPbVbwneZstHQbMmk2xkaQICpyq
 hKCzrgT9BVa5tChF8DsBy4LKKPiaDuIsNPa3bAPuhOK1UsIoHvfMe/EP4sAX3foNWRI1
 GfaPv7TdmrYLg3xa8q/v1p/Pt6p8pxEi832G9LD/IqIcmeogmqRXod3hUYegTUC5YKW4
 Y4qA==
X-Gm-Message-State: APjAAAXAH5gUT/V54PbCpjQOShKPpA7DjzHOELeqVb/Dt8RgL2jomGre
 4nny+QP2RKj4g2MyLQv1tV0=
X-Google-Smtp-Source: APXvYqxrLE7yZDnXYq8JzwdSU6DtCWyCSdlSmxNA0lehODTbPsdrtJtZT2zNCR23dGuXBCCxzQHcIw==
X-Received: by 2002:a9d:774a:: with SMTP id t10mr1613384otl.228.1561611868344; 
 Wed, 26 Jun 2019 22:04:28 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::48])
 by smtp.googlemail.com with ESMTPSA id v18sm613318otn.17.2019.06.26.22.04.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 22:04:27 -0700 (PDT)
From: Jiunn Chang <c0d1n61at3@gmail.com>
To: skhan@linuxfoundation.org
Subject: [Linux-kernel-mentees][PATCH v3] drm/amdkfd: Fix undefined behavior
 in bit shift
Date: Thu, 27 Jun 2019 00:04:25 -0500
Message-Id: <20190627050426.17925-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190627032532.18374-3-c0d1n61at3@gmail.com>
References: <20190627032532.18374-3-c0d1n61at3@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWDmwpCTBQqLpDz0dRgn3YK1CHaVNxNkpin7tUBvoI8=;
 b=X7rsIl/Lss2UF+YgRBSZj01GMxecdMu3tEiMfl78ztSoQvqZHvCjEzk7tQc9zNb/IU
 dESlmnXn3eUZ9wzUSyVZis5KvkU9oyK3IlpkbQyXR45Oo8eWchGmS9pVGSSn5wvXvpaF
 NDB6eaeZy3GcUVDWhherRLmFoQS63A/rjfSh0E6QnFdQOSjsmpfFBQHqjzCu2CJ1skT1
 QnszDP864mFYD+lYyRntgWflyUB72yb34+rOcjJailHP2qYD7TiLaRS7X7xutNCA2FZy
 5xt7TKICFtWbVSCFq7QWILZJCkak+C2W1szmI616AYLR+ZQy46en3VpLr23eMQ4inwsG
 Gd3Q==
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2hpZnRpbmcgc2lnbmVkIDMyLWJpdCB2YWx1ZSBieSAzMSBiaXRzIGlzIHVuZGVmaW5lZC4gIENo
YW5naW5nIG1vc3QKc2lnbmlmaWNhbnQgYml0IHRvIHVuc2lnbmVkLgoKU2lnbmVkLW9mZi1ieTog
Sml1bm4gQ2hhbmcgPGMwZDFuNjFhdDNAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBpbmNsdWRlZCBp
biB2MzoKICAtIHJlbW92ZSBjaGFuZ2UgbG9nIGZyb20gcGF0Y2ggZGVzY3JpcHRpb24KCkNoYW5n
ZXMgaW5jbHVkZWQgaW4gdjI6CiAgLSB1c2Ugc3Vic3lzdGVtIHNwZWNpZmljIHN1YmplY3QgbGlu
ZXMKICAtIENDIHJlcXVpcmVkIG1haWxpbmcgbGlzdHMKCiBpbmNsdWRlL3VhcGkvbGludXgva2Zk
X2lvY3RsLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmggYi9pbmNs
dWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgKaW5kZXggZGMwNjdlZDBiNzJkLi5hZTU2NjkyNzIz
MDMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rZmRfaW9jdGwuaAorKysgYi9pbmNs
dWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgKQEAgLTMzOSw3ICszMzksNyBAQCBzdHJ1Y3Qga2Zk
X2lvY3RsX2FjcXVpcmVfdm1fYXJncyB7CiAjZGVmaW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdT
X1VTRVJQVFIJCSgxIDw8IDIpCiAjZGVmaW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX0RPT1JC
RUxMCSgxIDw8IDMpCiAvKiBBbGxvY2F0aW9uIGZsYWdzOiBhdHRyaWJ1dGVzL2FjY2VzcyBvcHRp
b25zICovCi0jZGVmaW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFCSgxIDw8IDMx
KQorI2RlZmluZSBLRkRfSU9DX0FMTE9DX01FTV9GTEFHU19XUklUQUJMRQkoMVUgPDwgMzEpCiAj
ZGVmaW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX0VYRUNVVEFCTEUJKDEgPDwgMzApCiAjZGVm
aW5lIEtGRF9JT0NfQUxMT0NfTUVNX0ZMQUdTX1BVQkxJQwkJKDEgPDwgMjkpCiAjZGVmaW5lIEtG
RF9JT0NfQUxMT0NfTUVNX0ZMQUdTX05PX1NVQlNUSVRVVEUJKDEgPDwgMjgpCi0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
