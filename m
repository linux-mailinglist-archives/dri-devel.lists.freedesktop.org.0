Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C04337AAC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 18:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDFE6E4A2;
	Thu, 11 Mar 2021 17:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400816E438
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 17:23:51 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f26so3162794ljp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NLoHiP3d+5lNwT7CIKnzK9m4XZbys2sERvq2/PuPWts=;
 b=OjWK3wFbksojHdfmupqd5gy+Mg37v24f6j+8Ol8GghZXgYnlKwjv0D+10szaRXsatR
 Oah/RPo7tgEpMBJvtNSlw0maRM+Sy/z6e7DURhN2dDk/0BLd9NniGeCDGeycTjsx+L8E
 4UMAh+a7sNYJQFfJOsTBYMQv/v48mlax2rcic89sVYfdHzmpUrULmLBDcYK1Z7GwuyRl
 cNgSclfnXPb2kTyAkNE4QRXrg2GSwJYRhApcLxH8VbA0uhwWzXpWSbwu4ZfpXCw8Rz63
 VjQ4PcqUSKPdcy1A+adzAjOr/G75y9nppt6Wc9Rl8SkKovZ2g5jDen6onnP4LRhGSFFD
 dY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NLoHiP3d+5lNwT7CIKnzK9m4XZbys2sERvq2/PuPWts=;
 b=mFKRPmK11qXElr0N14AFBDXdQ22sn79ea/OhJpApofjMHE2CYEnVBavbDObE8F0DYe
 XVXPVcSJNgMzh7IpuYrCkbsBYR0PqFvSl2wGksG72oNDub3D8r9Jo/1cYc+iUTlmtDoJ
 vrrtX9Lt1t7Z0R9lwWQVdGw7KuNxUYXA267GOX8izXO9BWm5z4LQ9IqNcPPlazbffOOK
 EeNcjHsubOK2Fknmt3VdC3UAJHBL4/bYgjSW+G0gmPG0lOz2KEK09k4h18l8xnL+/2iM
 sfaTrV1X+xN2LGpJ49cCHSApLNpWKlPOQI5MmSTaccbKLjgeFXjJZDu7iVotFPTlUkFc
 KNVg==
X-Gm-Message-State: AOAM533qgNLczbglSJeDFaJO93oigR5GqiMO+6KKsFHL0ON0wnQ1yk/3
 PyvPPLNF94zEXzOFQH53s5k=
X-Google-Smtp-Source: ABdhPJxudYcrz6shnnCY/yzrTieJmSXgC6cgM00Md07ielNo75CBMq/9vqKKoCu2ueg5MihZZ1OejQ==
X-Received: by 2002:a2e:8111:: with SMTP id d17mr5366586ljg.337.1615483429543; 
 Thu, 11 Mar 2021 09:23:49 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id p5sm1180088ljj.26.2021.03.11.09.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:23:49 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v15 0/2] Add memory bandwidth management to NVIDIA Tegra DRM
 driver
Date: Thu, 11 Mar 2021 20:22:53 +0300
Message-Id: <20210311172255.25213-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBtZW1vcnkgYmFuZHdpZHRoIG1hbmFnZW1lbnQgdG8gdGhlIE5WSURJ
QSBUZWdyYSBEUk0gZHJpdmVyLAp3aGljaCBpcyBkb25lIHVzaW5nIGludGVyY29ubmVjdCBmcmFt
ZXdvcmsuIEl0IGZpeGVzIGRpc3BsYXkgY29ycnVwdGlvbiB0aGF0CmhhcHBlbnMgZHVlIHRvIGlu
c3VmZmljaWVudCBtZW1vcnkgYmFuZHdpZHRoLgoKQ2hhbmdlbG9nOgoKdjE1OiAtIENvcnJlY3Rl
ZCB0ZWdyYV9wbGFuZV9pY2NfbmFtZXNbXSBOVUxMLWNoZWNrIHRoYXQgd2FzIHBhcnRpYWxseSBs
b3N0CiAgICAgICBieSBhY2NpZGVudCBpbiB2MTQgYWZ0ZXIgdW5zdWNjZXNzZnVsIHJlYmFzZS4K
CnYxNDogLSBNYWRlIGltcHJvdmVtZW50cyB0aGF0IHdlcmUgc3VnZ2VzdGVkIGJ5IE1pY2hhxYIg
TWlyb3PFgmF3IHRvIHYxMzoKCiAgICAgICAtIENoYW5nZWQgJ3Vuc2lnbmVkIGludCcgdG8gJ2Jv
b2wnLgogICAgICAgLSBSZW5hbWVkIGZ1bmN0aW9ucyB3aGljaCBjYWxjdWxhdGUgYmFuZHdpZHRo
IHN0YXRlLgogICAgICAgLSBSZXdvcmtlZCBjb21tZW50IGluIHRoZSBjb2RlIHRoYXQgZXhwbGFp
bnMgd2h5IGRvd25zY2FsZWQgcGxhbmUKICAgICAgICAgcmVxdWlyZSBoaWdoZXIgYmFuZHdpZHRo
LgogICAgICAgLSBBZGRlZCByb3VuZC11cCB0byBiYW5kd2lkdGggY2FsY3VsYXRpb24uCiAgICAg
ICAtIEFkZGVkIHNhbml0eSBjaGVja3Mgb2YgdGhlIHBsYW5lIGluZGV4IGFuZCBmaXhlZCBvdXQt
b2YtYm91bmRzCiAgICAgICAgIGFjY2VzcyB3aGljaCBoYXBwZW5lZCBvbiBUMTI0IGR1ZSB0byB0
aGUgY3Vyc29yIHBsYW5lIGluZGV4LgoKdjEzOiAtIE5vIGNvZGUgY2hhbmdlcy4gUGF0Y2hlcyBt
aXNzZWQgdjUuMTIsIHJlLXNlbmRpbmcgdGhlbSBmb3IgdjUuMTMuCgpEbWl0cnkgT3NpcGVua28g
KDIpOgogIGRybS90ZWdyYTogZGM6IFN1cHBvcnQgbWVtb3J5IGJhbmR3aWR0aCBtYW5hZ2VtZW50
CiAgZHJtL3RlZ3JhOiBkYzogRXh0ZW5kIGRlYnVnIHN0YXRzIHdpdGggdG90YWwgbnVtYmVyIG9m
IGV2ZW50cwoKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9LY29uZmlnIHwgICAxICsKIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kYy5jICAgIHwgMzYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oICAgIHwgIDE5ICsrCiBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHJtLmMgICB8ICAxNCArKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2h1Yi5j
ICAgfCAgIDMgKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmMgfCAxMjcgKysrKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuaCB8ICAxNSArKwogNyBmaWxlcyBjaGFu
Z2VkLCA1NDEgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
