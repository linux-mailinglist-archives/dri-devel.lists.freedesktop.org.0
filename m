Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2D09117D
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0E56E9FF;
	Sat, 17 Aug 2019 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1526E96C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 18:00:42 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id v12so3477455pfn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 11:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wATUQ5AhTqVsNORBNhI3H9hrgxCh4ZvalSiVwIYDNT0=;
 b=XF8fXpF809+FaA5YLcvj6N5bZUTa8B5R+PH8HpWhiljiOT3tYA69PSxitXp/PFg8LP
 YpaM5tDfGLEfVkqjVCqGjDYOsxqzqEsiMjiVOCblEQtjhtX5JZ2Jvner2/nWo8CYzTm/
 KP+9jC+d2HTc9TtkemZ7RBbEDEhASw01SutE+pbL1NIhGyZvH6ghmF2X8auH/pXAPt32
 PXqlOtOIrmpOLN5WpTei0a4LZjobYy1pTF8CxJlRrDSXg/ZPbjmfDghljh+GrNa2/SW/
 iDjKVllRRvRDBsHKnN1qjxlJMousOMZ61R/gmMn+yboZdMa0aW+Bs2dih3eLNBQvvOh3
 VGIQ==
X-Gm-Message-State: APjAAAV/HNb9OBjopYaWlfRINtQugGoWm7Bw3upJCuVQwr3bYIJyNDfc
 u5TPLHNzDTjIOUd7dqrjCmQ=
X-Google-Smtp-Source: APXvYqzg9EbcnjeIhLdeH5kFtiTthmbzOmZ7YYmw/QcVioc8vm7RaE1mqcqla5aXgXAhOFrNJ8Mu/w==
X-Received: by 2002:aa7:9638:: with SMTP id r24mr11489219pfg.68.1565978441649; 
 Fri, 16 Aug 2019 11:00:41 -0700 (PDT)
Received: from bharath12345-Inspiron-5559 ([103.110.42.34])
 by smtp.gmail.com with ESMTPSA id 185sm11019906pff.54.2019.08.16.11.00.40
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 16 Aug 2019 11:00:41 -0700 (PDT)
From: Bharath Vedartham <linux.bhar@gmail.com>
To: sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: Fix memory leak in dma_buf_set_name
Date: Fri, 16 Aug 2019 23:30:22 +0530
Message-Id: <1565978422-9661-1-git-send-email-linux.bhar@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wATUQ5AhTqVsNORBNhI3H9hrgxCh4ZvalSiVwIYDNT0=;
 b=WOyQ3WS/UO5ayKgN7fhfS2CGPYMqEaBxODLrYtdL5AZTCzK//pmkhLJjk22WwH2EgH
 gQ1lP/Gx8XdKY5FYQzXzHFU8AiQbLcIHi6gQf2p9/kaHkJCKGjuWVzhzLgt+KQLvBPOs
 omInQTPSACaKEaoX36Wby+FrsUAd9a3z9Ia6aRuIdNpn4/CFhV/KJvtdQURuqYlGtf1b
 +Jlg4iGbyePWwUg0yElh+c8T5cAI5LWhSWEiT0p1YGts5ltHEnbgEAEdvdCeSgV7MGsn
 ehboJZbJ7egDKE56CG8e2UZ3gYx32ye3qu0T9cu2yfKDd2Gsqp2WCrq4wNp5UYuxiRwp
 gJqg==
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
Cc: linaro-mm-sig@lists.linaro.org, Bharath Vedartham <linux.bhar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXhlcyBhIG1lbW9yeSBsZWFrIGJ1ZyByZXBvcnRlZCBieSBzeXpib3QuIExp
bmsgdG8gdGhlCmJ1ZyBpcyBnaXZlbiBhdCBbMV0uCgpBIGxvY2FsIHZhcmlhYmxlIG5hbWUgaXMg
dXNlZCB0byBob2xkIHRoZSBjb3BpZWQgdXNlciBidWZmZXIgc3RyaW5nCnVzaW5nIHN0cm5kdXBf
dXNlci4gc3RybmR1cF91c2VyIGFsbG9jYXRlcyBtZW1vcnkgdXNpbmcKa21hbGxvY190cmFja19j
YWxsZXIgaW4gbWVtZHVwX3VzZXIuIFRoaXMga21hbGxvYyBhbGxvY2F0aW9uIG5lZWRzIHRvIGJl
CmZvbGxvd2VkIGJ5IGEga2ZyZWUuCgpUaGlzIHBhdGNoIGhhcyBiZWVuIHRlc3RlZCBieSBhIGNv
bXBpbGUgdGVzdC4KClsxXSBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/aWQ9Y2U2
OTJhM2FhMTNlMDBlMzM1ZTA5MGJlNzg0NmM2ZWI2MGRkZmY3YQoKUmVwb3J0ZWQtYnk6IHN5emJv
dCtiMjA5OGJjNDQ3MjhhNGVmYjNlOUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tClNpZ25lZC1v
ZmYtYnk6IEJoYXJhdGggVmVkYXJ0aGFtIDxsaW51eC5iaGFyQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYuYwppbmRleCBmNDViZmIyLi45Nzk4ZjZkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWJ1Zi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKQEAgLTM0
Miw2ICszNDIsNyBAQCBzdGF0aWMgbG9uZyBkbWFfYnVmX3NldF9uYW1lKHN0cnVjdCBkbWFfYnVm
ICpkbWFidWYsIGNvbnN0IGNoYXIgX191c2VyICpidWYpCiAJfQogCWtmcmVlKGRtYWJ1Zi0+bmFt
ZSk7CiAJZG1hYnVmLT5uYW1lID0gbmFtZTsKKwlrZnJlZShuYW1lKTsKIAogb3V0X3VubG9jazoK
IAltdXRleF91bmxvY2soJmRtYWJ1Zi0+bG9jayk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
