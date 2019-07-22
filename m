Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428471266
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933D891F8;
	Tue, 23 Jul 2019 07:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E25B89C51
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:03:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y4so39813835wrm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
 b=rUkAxsqiaJSAUAL2Q/OuNoFsRuDFezHppajJQzHmD5cTmtOoDnGRd3pgQlSPDz24UW
 BNjZnxcixHg3/AFyqXrBUiIKITx/UmhRViqzAcoVcyTItGEERKvSWPxXM1zlZwCCepug
 ZYnQ6z/Im4oNp2AXlGNFAzeISZvQNH9eeLpernlIs6af6Gx8kv+i7DOXeoMeWClq2pCo
 sEGcJRPDNo6GrNgdFFvyEU6oBxB+OEeE+MWFSJa6ZBtnh333hFDdm682nZql6RtcLrNf
 dtlTF80Ezz2HqwogH+lx2W6yuHRgYWAucxBGAAaet12ja9NpEKWvYB4qMlKXCNNCyfSj
 Uk/A==
X-Gm-Message-State: APjAAAX5LxhAmPzlpP+rd7HVwSvH4tNsxHjU3Lr2hbEEV1iFwDiJS0R5
 96gtr9Vp9EkZ0LrZMLlTcto=
X-Google-Smtp-Source: APXvYqyD0gk37PBxpZeYy+SsBHOhPvxzoF1iNnmz4Uolt36vrAsN2WrWgoxaLjg7dKr/eB3qFIj57g==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr69095285wrm.68.1563807799269; 
 Mon, 22 Jul 2019 08:03:19 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:03:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 3/7] sh: ecovec24: don't set unused fields in platform data
Date: Mon, 22 Jul 2019 17:02:58 +0200
Message-Id: <20190722150302.29526-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7sHmLWUZTOubwniZNmRjFR+C4eT64A3MhAkvvXjkgx8=;
 b=mrJgOxH8FNxXre25hO4e4JqY5KaSUwL9WKRb7av9PtAPr5yDAKsxN/QNtIEQbMtuXa
 jPjtGQMpFU6ZerdbIG2E5QmtaGj4FkqGBq/hRl+7EGoTSVdZEkAKoQ2B3HjHMrCnc6Rh
 IesPYBLjmdiz5wyfddmoB1EROajzaw2hurkPAf3sjXCNrHA4jrTSOL4dLzyQfzrhZ/O9
 eJLTNmT/646NjjFcp+oYe+2reOatt6QB32QDVcnuEEcI5WAnQpXNx1i23Jgijiux/ZwD
 FKycwkiGTXeeRKkMtPDHeNx+ydKt/8sLZeJjPtJXHLw0FaBI/69FiyYVR7tpJblh3Npv
 06oA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClBs
YXRmb3JtIGRhdGEgZmllbGRzIG90aGVyIHRoYW4gZmJkZXYgYXJlIG5vIGxvbmdlciB1c2VkIGJ5
IHRoZQpiYWNrbGlnaHQgZHJpdmVyLiBSZW1vdmUgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEJhcnRv
c3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogYXJjaC9zaC9i
b2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0
dXAuYyBiL2FyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYwppbmRleCA2OTI2YmIz
ODY1YjkuLjY0YTVhMTY2MmI2ZCAxMDA2NDQKLS0tIGEvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292
ZWMyNC9zZXR1cC5jCisrKyBiL2FyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVjMjQvc2V0dXAuYwpA
QCAtMzg2LDkgKzM4Niw2IEBAIHN0YXRpYyBzdHJ1Y3QgcHJvcGVydHlfZW50cnkgZ3Bpb19iYWNr
bGlnaHRfcHJvcHNbXSA9IHsKIAogc3RhdGljIHN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9y
bV9kYXRhIGdwaW9fYmFja2xpZ2h0X2RhdGEgPSB7CiAJLmZiZGV2ID0gJmxjZGNfZGV2aWNlLmRl
diwKLQkuZ3BpbyA9IEdQSU9fUFRSMSwKLQkuZGVmX3ZhbHVlID0gMSwKLQkubmFtZSA9ICJiYWNr
bGlnaHQiLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaW5mbyBn
cGlvX2JhY2tsaWdodF9kZXZpY2VfaW5mbyA9IHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
