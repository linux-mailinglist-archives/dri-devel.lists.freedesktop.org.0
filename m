Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DC419F1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 03:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A85C8800A;
	Wed, 12 Jun 2019 01:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A9F891D6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:25:32 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s11so8543059pfm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/4mZhjz2dkfafdy2bqfClO5VTqYAkHEFd5uOF7sABt0=;
 b=gwnaaUoP52UHFGFFNPoPYbR6MTfY0Z5xMbjbHoHPoFccoBFO4LnuYtDxt1vG+oHogE
 +hTBO63fjJFDugtmzwpNs2I705W3CrUEvJM54UyLGxhW6iN+P8OAC7KEKLrW0sl/Lesf
 74SJ3a7svlCZr9dZLBQe4Mw2Hf9oD87jQHoF1kstQg2R6ux7ZqW7Wv4NvkYEWZbS76gQ
 TGu+5LdBpUbKgHJ05KtepXShkRT7KV6zbQ5AqSVKctPKE2iyGokYqg5xillf0mSd7kDe
 Pw78U+z+hwXLuL+oVgoGTOokIsTrubrs0OOlCSpnT/oxkrJ/TYNTkmZtbo91XyIeLA+i
 ZzEA==
X-Gm-Message-State: APjAAAXRclc4PUp8vhrxZn8zGps5G39irSQyy/L02uLorJwRD+Qphyql
 NXLPXAXHCscsU84Z3VlRYis=
X-Google-Smtp-Source: APXvYqx8w3UNZJYyEfyesl8GJz44ySL1V6YwpvRUhn3tlhK/Vom10lrDEoqmya0nS0qFRQcHkUOFAA==
X-Received: by 2002:a17:90a:290b:: with SMTP id
 g11mr29801294pjd.122.1560302225650; 
 Tue, 11 Jun 2019 18:17:05 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-185-39.hsd1.ca.comcast.net.
 [107.3.185.39])
 by smtp.gmail.com with ESMTPSA id y22sm13257015pgj.38.2019.06.11.18.17.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 18:17:05 -0700 (PDT)
From: Steve Longerbeam <slongerbeam@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/3] gpu: ipu-v3: image-convert: Fix input bytesperline for
 packed formats
Date: Tue, 11 Jun 2019 18:16:56 -0700
Message-Id: <20190612011657.12119-2-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612011657.12119-1-slongerbeam@gmail.com>
References: <20190612011657.12119-1-slongerbeam@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/4mZhjz2dkfafdy2bqfClO5VTqYAkHEFd5uOF7sABt0=;
 b=PmVQmVsONHga6z7L+7IIh6Vn/kPjgNT39RFZMidKSw3Pgd/4JDPThUO75CI9v/y44p
 CecZm6fAk7kAc/6KJJ2TC/0a2uH5FikGxfqcCFyimpHf/N9hXZ1ErtF870SdTKdGIwM2
 BY07MsFVyL9kUD155wafDB6U621Vj+775KUvYStLxHoNpiZULS67vpHLWfo8CoZEx2Jm
 jhmb15UNv70f9hPKn7B9FLK0adghG3I/eJVS4tsA+fn+Cg6xwPL8ORyr87boMRkPg5cf
 FdDkHxtnXxH5asbRveQGAFLr5nPthyykU2pHMDlKujuK/iZbRsTHykR9f4KBamyhsP9C
 Qoww==
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
 <dri-devel@lists.freedesktop.org>, Steve Longerbeam <slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGlucHV0IGJ5dGVzcGVybGluZSBjYWxjdWxhdGlvbiBmb3IgcGFja2VkIHBpeGVsIGZvcm1h
dHMgd2FzCmluY29ycmVjdC4gVGhlIG1pbi9tYXggY2xhbXBpbmcgdmFsdWVzIG11c3QgYmUgbXVs
dGlwbGllZCBieSB0aGUKcGFja2VkIGJpdHMtcGVyLXBpeGVsLiBUaGlzIHdhcyBjYXVzaW5nIGNv
cnJ1cHRlZCBjb252ZXJ0ZWQgaW1hZ2VzCndoZW4gdGhlIGlucHV0IGZvcm1hdCB3YXMgUkdCNCAo
cHJvYmFibHkgYWxzbyBvdGhlciBpbnB1dCBwYWNrZWQKZm9ybWF0cykuCgpGaXhlczogZDk2NmUy
M2Q2MWEyYyAoImdwdTogaXB1LXYzOiBpbWFnZS1jb252ZXJ0OiBmaXggYnl0ZXNwZXJsaW5lCmFk
anVzdG1lbnQiKQoKUmVwb3J0ZWQtYnk6IEhhcnNoYSBNYW5qdWxhIE1hbGxpa2FyanVuIDxIYXJz
aGEuTWFuanVsYU1hbGxpa2FyanVuQGluLmJvc2NoLmNvbT4KU3VnZ2VzdGVkLWJ5OiBIYXJzaGEg
TWFuanVsYSBNYWxsaWthcmp1biA8SGFyc2hhLk1hbmp1bGFNYWxsaWthcmp1bkBpbi5ib3NjaC5j
b20+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIExvbmdlcmJlYW0gPHNsb25nZXJiZWFtQGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYyB8IDQgKysrLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jIGIvZHJpdmVycy9ncHUv
aXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMKaW5kZXggMzZlYjRjNzdhZDkxLi40ZGZkYmQxYWRm
MGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCkBAIC0xOTMzLDcgKzE5
MzMsOSBAQCB2b2lkIGlwdV9pbWFnZV9jb252ZXJ0X2FkanVzdChzdHJ1Y3QgaXB1X2ltYWdlICpp
biwgc3RydWN0IGlwdV9pbWFnZSAqb3V0LAogCQljbGFtcF9hbGlnbihpbi0+cGl4LndpZHRoLCAy
IDw8IHdfYWxpZ25faW4sIE1BWF9XLAogCQkJICAgIHdfYWxpZ25faW4pIDoKIAkJY2xhbXBfYWxp
Z24oKGluLT5waXgud2lkdGggKiBpbmZtdC0+YnBwKSA+PiAzLAotCQkJICAgIDIgPDwgd19hbGln
bl9pbiwgTUFYX1csIHdfYWxpZ25faW4pOworCQkJICAgICgoMiA8PCB3X2FsaWduX2luKSAqIGlu
Zm10LT5icHApID4+IDMsCisJCQkgICAgKE1BWF9XICogaW5mbXQtPmJwcCkgPj4gMywKKwkJCSAg
ICB3X2FsaWduX2luKTsKIAlpbi0+cGl4LnNpemVpbWFnZSA9IGluZm10LT5wbGFuYXIgPwogCQko
aW4tPnBpeC5oZWlnaHQgKiBpbi0+cGl4LmJ5dGVzcGVybGluZSAqIGluZm10LT5icHApID4+IDMg
OgogCQlpbi0+cGl4LmhlaWdodCAqIGluLT5waXguYnl0ZXNwZXJsaW5lOwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
