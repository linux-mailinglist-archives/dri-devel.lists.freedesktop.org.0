Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909F2B429
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FAA89C48;
	Mon, 27 May 2019 12:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F9A6E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 18:17:37 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q62so9464535ljq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 11:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZLJylrKPY9cIPHU1KLx/+Qa13CwoeXrjMSis4aiXyQ=;
 b=dmx10KIT+H7BQnjWjgbjwCfBHvct7OqId9K1SBxtVDvnjDvDDswEBEr7KCLwFS3txE
 3wrtnFghvYPtA/rQXjnFExrpe2sC+aXBEdsUVptt+dtHgNv5O25af8PXaW0QnMmGei1u
 ml4VSURFMercC6bgVXxbPOaLxR3HNqLN2uF3T98N8unyQy/V9YPjk4Sw0tm5mzPCc2+l
 saUhpPSNlhcyqjBbI+KX9nOeO5Z1R47FO7vMtSQs1Z2fDW8kjqhFde8Xb5XiwygBBVMI
 UAKtvSFogVrp3QHuqAsPJh5AqHWZ47vNo5a9caE9M8WOzF/t1D2ScRDiTaARXKEPHP7S
 SBzA==
X-Gm-Message-State: APjAAAWto9Fh1Ed+UomT2QmrY/wCYBNVRTqCBT6SXGM9hq0WcfA40hml
 AK+MaUfgrA5/sF6dsVPdi60=
X-Google-Smtp-Source: APXvYqzQDpQf4taQPQ0+N0zlhXKjhzSExlxGCn7TIRKcSHyOzlRbAbBNabgP/sDaWPgca0JNeGDAIw==
X-Received: by 2002:a2e:8741:: with SMTP id q1mr30887422ljj.97.1558721856334; 
 Fri, 24 May 2019 11:17:36 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
 by smtp.gmail.com with ESMTPSA id h10sm810376ljm.9.2019.05.24.11.17.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 11:17:35 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/3] Tegra DRM: Support memory bandwidth management for
 display
Date: Fri, 24 May 2019 21:16:24 +0300
Message-Id: <20190524181627.16490-1-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZLJylrKPY9cIPHU1KLx/+Qa13CwoeXrjMSis4aiXyQ=;
 b=q73TMsSrItUyBJV1N2QyvAJoX7fAF13rJWWq3easmo9d37yyaUudaE8S8D1WYmmR9p
 2g9VYM08K9SuuDnunqKrVLMRwSOMgjuKjw+xryXe8nwZfQfLWb8OkgMyct5h3EojlPQH
 cteKo3KAuozVrVQO9hzVCaTmXDdNAPATbyACYfrKUWqH+RzZ0TzY7UKm5QTy+TvFM+Lg
 tuSk1MXWRCTJ9HAisTixIus1NViaGPYFI6bPMxLl07sScj41w0ySWKq/BM8/xr/hPXL8
 VIs38SXaik28mZfTFtCkKkGoXZ0Z+qHsqFG3ilY9NBHq0Iz+nQJpsk1JOhkT8JopXYPT
 Muhg==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpEaXNwbGF5IGNvbnRyb2xsZXJzIGhhdmUgYSBuZWVkIGZvciBtaW5pbXVtIG1lbW9y
eSBiYW5kd2lkdGggaW4gb3JkZXIgdG8KbWFpbnRhaW4gZGF0YS1zdHJlYW0gdG8gb3V0cHV0IGF0
IGEgcmVxdWlyZWQgcmF0ZS4gVGhlcmUgaXMgYSB2aXN1YWwKY29ycnVwdGlvbiBvbmNlIHRoZSBy
ZXF1aXJlbWVudCBpcyB2aW9sYXRlZCBhbmQgQ1JUQyByZXNldCBtYXkgYmUgcmVxdWlyZWQKaW4g
b3JkZXIgdG8gcmVjb3Zlci4gVGhpcyBzZXJpZXMgYWRkcyBwcmVsaW1pbmFyeSBzdXBwb3J0IGZv
ciB0aGUgbWVtb3J5CmJhbmR3aWR0aCBtYW5hZ2VtZW50LCBpdCB3aWxsIGJlY29tZSBhY3RpdmUg
b25jZSBNZW1vcnkgQ29udHJvbGxlciBkcml2ZXJzCndpbGwgZ2V0IHN1cHBvcnQgZm9yIHRoZSBQ
TSBtZW1vcnkgYmFuZHdpZHRoIFFvUy4KCkNoYW5nZWxvZzoKCnYyOiBUaGUgdG90YWwgc2l6ZSBv
ZiBmcmFtZWJ1ZmZlciBpcyBub3cgY2FsY3VsYXRlZCBtb3JlIGFjY3VyYXRlbHkgZm9yCiAgICBw
bGFuYXIgZm9ybWF0cywgdGFraW5nIGludG8gYWNjb3VudCBjaHJvbWEgc3ViLXNhbXBsaW5nLgoK
RG1pdHJ5IE9zaXBlbmtvICgzKToKICBkcm0vdGVncmE6IGRjOiBUdW5lIHVwIGhpZ2ggcHJpb3Jp
dHkgcmVxdWVzdCBjb250cm9scyBvbiBUZWdyYTIwCiAgZHJtL3RlZ3JhOiBkYzogRXh0ZW5kIGRl
YnVnIHN0YXRzIHdpdGggdG90YWwgbnVtYmVyIG9mIGV2ZW50cwogIGRybS90ZWdyYTogU3VwcG9y
dCBQTSBRb1MgbWVtb3J5IGJhbmR3aWR0aCBtYW5hZ2VtZW50CgogZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RjLmMgICAgfCAyNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2RjLmggICAgfCAgMTMgKysKIGRyaXZlcnMvZ3B1L2RybS90ZWdy
YS9kcm0uYyAgIHwgIDE4ICsrKwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmMgfCAgIDEg
KwogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmggfCAgIDQgKy0KIDUgZmlsZXMgY2hhbmdl
ZCwgMjgwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
