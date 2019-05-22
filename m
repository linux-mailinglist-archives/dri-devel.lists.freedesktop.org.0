Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 299D725B71
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 03:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21872896BF;
	Wed, 22 May 2019 01:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0237896BF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 01:03:27 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a5so177139pls.12
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 18:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hZxOPx40sM31sXATrJWIrdV0RTZA1DlPQH1xR20a6EI=;
 b=YNQJJfd7vl1qiBM8V3vSANOKijAKYEXmWs1eoYoXQOvqzVnWqXeDZFuYNntgA9JyMp
 ZWb7/XPGrJqjH9NlQCt7nfvPrCPtO838UEP9sG/kctyVW8aaRf64FUr1B7S+XD5HLN+7
 oVDCOtkrQnTa4spNxZezIjSXJC65/ydosPtjn+1c+9TO87zA1YS1CEENa5OG3vL38RmB
 WAmsKNyUIt4/avLtr7S8rbHRVj4BEqJSVBuQCpkPNVC71p4LcDdZ5cfIuS0LjfrcUUWv
 EC7IYXjkFp7bN4XnB4y5eyLTEXK0ivj7TvdZO2CMDrZfiOXEUPMZoisAIfwPNsyJ7jiF
 j0lg==
X-Gm-Message-State: APjAAAXxWjAEeqr5PNlpYa9R5lhZYnTP8RnmuiIv8G8H025/JJ0ls3Rc
 XSIF46j5Th0712uxTmAOUBs=
X-Google-Smtp-Source: APXvYqxX3046Ypk/1iJeTlE7JccOi5IUU7WTFVOh31S6dnrg9pgR8igRa5NROi7akpn4K9HbrvEROQ==
X-Received: by 2002:a17:902:424:: with SMTP id
 33mr87086594ple.102.1558487007261; 
 Tue, 21 May 2019 18:03:27 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net.
 [73.202.231.77]) by smtp.googlemail.com with ESMTPSA id
 q193sm34291242pfc.52.2019.05.21.18.03.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 18:03:26 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH v8 1/5] gpu: ipu-v3: ipu-ic: Fix saturation bit offset in TPMEM
Date: Tue, 21 May 2019 18:03:13 -0700
Message-Id: <20190522010317.23710-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522010317.23710-1-slongerbeam@gmail.com>
References: <20190522010317.23710-1-slongerbeam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hZxOPx40sM31sXATrJWIrdV0RTZA1DlPQH1xR20a6EI=;
 b=jgen3ia4nDSmuFARPMsvjj7DWaO1iW//OuXl403j+o/G/TeeSqMiVvZ0ntMuQMMXz6
 dtYV3xJmd6l827CYLhYs0ByM6njiVjg79s2sLCEs10WDDns51gcmIiqVYfDp/6R1nW+G
 D7wCvEhSSQapr8PxP9ML32wzLwnQZxIdUggSCXCB7IypYUWUyr8i5evxZj6HPi+WRFmO
 yXzbdeJePZ2tMsOKiODoiM6UEvZefm+7ELDy419DUzcbnyj1I3a46oV0Ah5yp0TC7bIQ
 KccvvkiC4s8eBlLscwu0inRFcPY4XG+2RKJmEymnUlEEow92i0+LBjTtou2cCMaAb2x1
 Njgg==
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR FREESCALE IMX"
 <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Steve Longerbeam <slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNhdHVyYXRpb24gYml0IHdhcyBiZWluZyBzZXQgYXQgYml0IDkgaW4gdGhlIHNlY29uZCAz
Mi1iaXQgd29yZApvZiB0aGUgVFBNRU0gQ1NDLiBUaGlzIGlzbid0IGNvcnJlY3QsIHRoZSBzYXR1
cmF0aW9uIGJpdCBpcyBiaXQgNDIsCndoaWNoIGlzIGJpdCAxMCBvZiB0aGUgc2Vjb25kIHdvcmQu
CgpGaXhlczogMWFhOGVhMGQyYmQ1ZCAoImdwdTogaXB1LXYzOiBBZGQgSW1hZ2UgQ29udmVydGVy
IHVuaXQiKQoKU2lnbmVkLW9mZi1ieTogU3RldmUgTG9uZ2VyYmVhbSA8c2xvbmdlcmJlYW1AZ21h
aWwuY29tPgpSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1
LWljLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWljLmMgYi9kcml2ZXJzL2dw
dS9pcHUtdjMvaXB1LWljLmMKaW5kZXggNTk0YzNjYmM4MjkxLi4xODgxNmNjZjYwMGUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaWMuYworKysgYi9kcml2ZXJzL2dwdS9pcHUt
djMvaXB1LWljLmMKQEAgLTI1Nyw3ICsyNTcsNyBAQCBzdGF0aWMgaW50IGluaXRfY3NjKHN0cnVj
dCBpcHVfaWMgKmljLAogCXdyaXRlbChwYXJhbSwgYmFzZSsrKTsKIAogCXBhcmFtID0gKChhWzBd
ICYgMHgxZmUwKSA+PiA1KSB8IChwYXJhbXMtPnNjYWxlIDw8IDgpIHwKLQkJKHBhcmFtcy0+c2F0
IDw8IDkpOworCQkocGFyYW1zLT5zYXQgPDwgMTApOwogCXdyaXRlbChwYXJhbSwgYmFzZSsrKTsK
IAogCXBhcmFtID0gKChhWzFdICYgMHgxZikgPDwgMjcpIHwgKChjWzBdWzFdICYgMHgxZmYpIDw8
IDE4KSB8Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
