Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE1100072
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 09:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71BF89F49;
	Mon, 18 Nov 2019 08:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Sun, 17 Nov 2019 17:32:49 UTC
Received: from mta-p0.oit.umn.edu (mta-p0.oit.umn.edu [134.84.196.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EEB8999E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 17:32:49 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p0.oit.umn.edu (Postfix) with ESMTP id 47GJnY17bRzcnV
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 17:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p0.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p0.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hmVRNmvpR2r for <dri-devel@lists.freedesktop.org>;
 Sun, 17 Nov 2019 11:22:57 -0600 (CST)
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p0.oit.umn.edu (Postfix) with ESMTPS id 47GJnX746HzbKx
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 11:22:56 -0600 (CST)
Received: by mail-yb1-f200.google.com with SMTP id u10so10528414ybj.17
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 09:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RIby2qRx5cEwNIrcIoDIHdDJ6ejQhdeyp3owCLM8obk=;
 b=XBIeP4gsfCFCHdxVqLkulfHmB5z/JyOj9gnzuEngc8jAPUM46CMS0efAo6ti1GOkUn
 pZasFCtmYS75whZyXnx38nnDyyHhk1RIhPRGQmhSudLe2eIN64upZAd4IRX7fjlfZOFH
 0B7aW7B3k0Q/tsf9LHw9X6eoSb2bPN4LKC9Z0uGJwkRtcv8Kw3953YmJdzFnjtJShDOG
 33CkxBefbT5nZD5cSNATGR+gChxQ7OAxg2253JU9KuccNGqOIETcC/NoRGiNho0LqaOQ
 k+81TWSxHkh3cMM5D2GnMPzaedW5+Wy4/HlAf9TVEroAy06cPPSnrVdvJRZJhVSPvjAa
 J4cQ==
X-Gm-Message-State: APjAAAUuks3UhQJ3nxXtZchHvqJ6/zIUd9n9qWGSqj5yDhEvOb7/LjKV
 YVj+pOoN/pguSowlQvZO3ydqmEiHDBg/RhvDwJznBEGVNHGnwww9fOqUXPryLQXwjH2zlD3ZT9j
 ZrA0DFtb4HRALaP4grCWUmFO84w78FlAe
X-Received: by 2002:a81:71c4:: with SMTP id
 m187mr16741540ywc.327.1574011375501; 
 Sun, 17 Nov 2019 09:22:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRSZyGvEeTEQTqYLBwcl2GMjbN83a4HUDRBI+2xrk9iViMa5K8z+axNVTrtuWEQ1cR/lc6Mw==
X-Received: by 2002:a81:71c4:: with SMTP id
 m187mr16741510ywc.327.1574011375242; 
 Sun, 17 Nov 2019 09:22:55 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id 124sm6654970ywo.98.2019.11.17.09.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 09:22:54 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/amd/display: Fix error returned by program_hpd_filter
Date: Sun, 17 Nov 2019 11:22:34 -0600
Message-Id: <20191117172236.2140-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 18 Nov 2019 08:36:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=RIby2qRx5cEwNIrcIoDIHdDJ6ejQhdeyp3owCLM8obk=;
 b=IRanUKstwT1MnUfDW4znsizornJMbx0pRICZZKzplIGIiA3OJ+MupXA0DK7QXt6M9c
 hLWZAgq6YTjDz4dClo6XI8qh6O0AEshigJzSARu8dQPCU/R2YI+MPH1d8HMEVvptX2LP
 2CqovGn7TmSCS387hLEScYeCaCvqJ7vdrnljOcqfc19SjC6HnDNMpXbGuCNHzOtb4iDh
 bzFKDt1m+gnvDulkJgW4pgrRQ6i895IiisubEZ7hz9iMljjm1AQWK17ZTWMch9u/EvYT
 NccpkOgcjITRXlYagZbOT2+7he8di4ZPpkTv9UfOdlWEinhxUTaz056LWuOkx75Bq4gO
 mg0A==
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
Cc: dri-devel@lists.freedesktop.org, Chris Park <Chris.Park@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Eric Bernstein <eric.bernstein@amd.com>, David Galiffi <david.galiffi@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cHJvZ3JhbV9ocGRfZmlsdGVyKCkgY3VycmVudGx5IGZhaWxzIHRvIGNoZWNrIGZvciB0aGUgZXJy
b3JzCnJldHVybmVkIGluIGNvbnN0cnVjdCgpLiBUaGlzIHBhdGNoIHJldHVybnMgZXJyb3IgaW4K
Y2FzZSBvZiBmYWlsdXJlLgoKU2lnbmVkLW9mZi1ieTogQWRpdHlhIFBha2tpIDxwYWtraTAwMUB1
bW4uZWR1PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsu
YyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlu
ay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCmluZGV4
IGNhMjBiMTUwYWZjYy4uYmJiNjQ4YTUwYzQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC0xMzc5LDkgKzEzNzksOCBAQCBzdGF0aWMgYm9v
bCBjb25zdHJ1Y3QoCiAJICogSWYgR1BJTyBpc24ndCBwcm9ncmFtbWVkIGNvcnJlY3RseSBIUEQg
bWlnaHQgbm90IHJpc2Ugb3IgZHJhaW4KIAkgKiBmYXN0IGVub3VnaCwgbGVhZGluZyB0byBib3Vu
Y2VzLgogCSAqLwotCXByb2dyYW1faHBkX2ZpbHRlcihsaW5rKTsKKwlyZXR1cm4gcHJvZ3JhbV9o
cGRfZmlsdGVyKGxpbmspOwogCi0JcmV0dXJuIHRydWU7CiBkZXZpY2VfdGFnX2ZhaWw6CiAJbGlu
ay0+bGlua19lbmMtPmZ1bmNzLT5kZXN0cm95KCZsaW5rLT5saW5rX2VuYyk7CiBsaW5rX2VuY19j
cmVhdGVfZmFpbDoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
