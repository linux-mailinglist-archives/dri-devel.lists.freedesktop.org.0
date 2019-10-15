Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C7D78A9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D326E823;
	Tue, 15 Oct 2019 14:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B793B6E823
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z9so24161027wrl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sehfG95Y/xCYaQOSIPlOJfHvnqlpo/pLvE9SBNhZ9Dg=;
 b=Q9gqrFuk9DYMGue5R/QSCXpCP2eENzsfUs30+qtmOm4JMmdnuNu3HdqPYBnqc9Rp+C
 au+GJwtXWMLlfKH6I/fC/xVd5vLPodD9q5fI4SpXMC0nksGzHZvaF/V99CLnL309MrDV
 Sxd5efL7T1Tvpv36gqv0/jEwOAzyqczVrhsiO+BM5W7EF9cyUsYq1EDZwB7P5er5WanW
 bfOrXpOOVXJPMBoYi8GGfXk/NevM9mF6PddKkScIjpV1APQiIyxUDwlRtzEqwqFuZByK
 n2R/42nKaoIzYvi9rGnoR0SIMVFhxABDWxbYXAmH9MHv00Z4Y7wJw2l/fRvHJO3UA2ba
 Lh8A==
X-Gm-Message-State: APjAAAX4KEtjpTxKkfLQaT1qj/XdCoBB2bbPEVE5loMHfryleAT2RP49
 wEAUq5UUrnUZxgXcOqAZ+GoQ2RbD
X-Google-Smtp-Source: APXvYqwQV2NQ45WIdNyXSd6JhY7OJaxK9vxaCyW2b1vay1iUioGCf/AzFPJI2TzpzmXhwZuqEURKHw==
X-Received: by 2002:a5d:4a03:: with SMTP id m3mr19741581wrq.359.1571150122436; 
 Tue, 15 Oct 2019 07:35:22 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id y5sm22445753wma.14.2019.10.15.07.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/15] drm/dp: Add drm_dp_channel_coding_supported() helper
Date: Tue, 15 Oct 2019 16:34:58 +0200
Message-Id: <20191015143509.1104985-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sehfG95Y/xCYaQOSIPlOJfHvnqlpo/pLvE9SBNhZ9Dg=;
 b=XL15vo1uVDG5dChccmBK8rPFf96222teHeS2AhUUROksThj884k9haAwG/vgoOnZHP
 eMvMgywsWEk/6pWu4gy3hYp9Vss4wMcV5ujNeJN0wodEeaMxnx/k5WvtfWACU1ugjIvM
 rP6BQKz/vkreWUCcZI7iX1Q+rV20xqHefSExwlzZatbC3LirA1zdUYs41Dyxu+uhBOAP
 nTFMqPXJ4/J9e0UqLqvMgDdwU8pf+oMUmIBoVbfEWXApN4xZhCtZ2GocmFgXMZshWyyK
 VQCpkRnPKoi2C0f6BI+Wva+ZXC7h2kCli9xwCNJs0QeIpGLK+neaVHfh2wJkN6kHmuTl
 MPUg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFkZCBhIGhlbHBlciB0
byBjaGVjayB3aGV0aGVyIHRoZSBzaW5rIHN1cHBvcnRzIEFOU0kgOEIvMTBCIGNoYW5uZWwKY29k
aW5nIGNhcGFiaWxpdHkgYXMgc3BlY2lmaWVkIGluIEFOU0kgWDMuMjMwLTE5OTQsIGNsYXVzZSAx
MS4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0t
LQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IGRlZjNiM2E1NDNhMi4uN2Zm
N2JmMGU3NDJkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBAIC0xMzcsNiArMTM3LDcgQEAKICMgZGVmaW5l
IERQX0RFVEFJTEVEX0NBUF9JTkZPX0FWQUlMQUJMRQkgICAgKDEgPDwgNCkgLyogRFBJICovCiAK
ICNkZWZpbmUgRFBfTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HICAgICAgICAgMHgwMDYKKyMgZGVm
aW5lIERQX0NBUF9BTlNJXzhCMTBCCQkgICAgKDEgPDwgMCkKIAogI2RlZmluZSBEUF9ET1dOX1NU
UkVBTV9QT1JUX0NPVU5UCSAgICAweDAwNwogIyBkZWZpbmUgRFBfUE9SVF9DT1VOVF9NQVNLCQkg
ICAgMHgwZgpAQCAtMTI4Myw2ICsxMjg0LDEyIEBAIGRybV9kcF9zaW5rX3N1cHBvcnRzX2ZlYyhj
b25zdCB1OCBmZWNfY2FwYWJsZSkKIAlyZXR1cm4gZmVjX2NhcGFibGUgJiBEUF9GRUNfQ0FQQUJM
RTsKIH0KIAorc3RhdGljIGlubGluZSBib29sCitkcm1fZHBfY2hhbm5lbF9jb2Rpbmdfc3VwcG9y
dGVkKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQoreworCXJldHVybiBkcGNk
W0RQX01BSU5fTElOS19DSEFOTkVMX0NPRElOR10gJiBEUF9DQVBfQU5TSV84QjEwQjsKK30KKwog
LyoKICAqIERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCiAgKi8KLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
