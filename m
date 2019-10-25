Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F41E573B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 01:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2D6EBD3;
	Fri, 25 Oct 2019 23:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE106EBD6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 23:48:38 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c7so1490983pfo.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 16:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Bhq3e5+uTtbnGM7apONt9dMc+TmRaAuRWUEzjpFFxKA=;
 b=a77Ah38eIdbNS3t38PYhdWG1cmNbNUXcJrPkWA5wMScoVTtXEa/UHwad1NpMcfOt7q
 8JfOcw/ODlbjj1bO08CErMRaDq7Ng9AKnvJrKwtQWOVz0nNcKzj0Y33QHFQYRFmC4e8h
 YAJK9cFK9zFSaNpZx4pXo9u3xNOjPc1PBHItW8pwhXZkaRPYqNE8JY/DTVa6ypcYyxjN
 3T4ZMM6kHJIMKJfLDIX10L5kri4nQva1JPkFuE4KxPWNls0d2s37J6BIBiXhUxBCS5lc
 /udpp0fUSFV4+zktxCgnFatk2WeBFBZcJqH8CIL5wHnx4HE69tZjZYRmxV4dbQCSl6pL
 tZqw==
X-Gm-Message-State: APjAAAVB39J1J2HIc9FllGovDPold/KBUsBED61DoEQ7ez6JrndZg7Ny
 h2l1YVkvZNNBq6zgXovVi/3bCA==
X-Google-Smtp-Source: APXvYqxK5zzLBLTheaoqGS6HUi/9jdNBz4CMzP1n1AQBGIWin5A7To0oQJs4sRbfzAk1m2zELppMdw==
X-Received: by 2002:a62:4d04:: with SMTP id a4mr7431646pfb.71.1572047318043;
 Fri, 25 Oct 2019 16:48:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 cx22sm2817179pjb.19.2019.10.25.16.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 16:48:37 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 0/2] Allow DMA BUF heaps to be loaded as modules
Date: Fri, 25 Oct 2019 23:48:32 +0000
Message-Id: <20191025234834.28214-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Bhq3e5+uTtbnGM7apONt9dMc+TmRaAuRWUEzjpFFxKA=;
 b=BYPTEufAVLkHLG6Q3wf3G8dMHPiwZIiYsyj+S/697RWsfwa4c9jd2jJRLAAI6tNE5/
 m6ooU4AS61vxB4eWwc/gMw0I6ZRirirCkWb6cNM3lEFq16sXWQZdsyUaXQyaNVlqWkRf
 BtdDVyXgRgcMr6T9KEd41anhcn1llPhz2mwydOKMwn6LTs2HQxcFMHkupJgq01MNgo4W
 5oz3n0ihU4nVYVEMw1Fn/wbsQ0VwgkpToV06QLqlc6ZrZ6QQM1+oRzY6c1z3qMdbCpN/
 /sWbw8DaH9fC5a72hETtdQHBjO7CoWh2mrjP+c5mf3RSONmIB2rOuPH3hdpu03xNcTGx
 VnOw==
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
Cc: Sandeep Patil <sspatil@google.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIERNQSBCVUYgaGVhcHMgY29yZSBjb2RlIGhhcyBiZWVuIHF1ZXVlZCwgSSB3
YW50ZWQKdG8gc2VuZCBvdXQgc29tZSBvZiB0aGUgcGVuZGluZyBjaGFuZ2VzIHRoYXQgSSd2ZSBi
ZWVuIHdvcmtpbmcKb24uCgpGb3IgdXNlIHdpdGggQW5kcm9pZCBhbmQgdGhlaXIgR0tJIGVmZm9y
dCwgaXQgaXMgZGVzaXJlZCB0aGF0CkRNQSBCVUYgaGVhcHMgYXJlIGFibGUgdG8gYmUgbG9hZGVk
IGFzIG1vZHVsZXMuIFRoaXMgaXMgcmVxdWlyZWQKZm9yIG1pZ3JhdGluZyB2ZW5kb3JzIG9mZiBv
ZiBJT04gd2hpY2ggd2FzIGFsc28gcmVjZW50bHkgY2hhbmdlZAp0byBzdXBwb3J0IG1vZHVsZXMu
CgpTbyB0aGlzIHBhdGNoIHNlcmllcyBzaW1wbHkgcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBleHBv
cnRlZApzeW1ib2xzIGFuZCBhbGxvd3MgdGhlIHN5c3RlbSBhbmQgQ01BIGRyaXZlcnMgdG8gYmUg
YnVpbHQKYXMgbW9kdWxlcy4KCkR1ZSB0byB0aGUgZmFjdCB0aGF0IGRtYWJ1ZidzIGFsbG9jYXRl
ZCBmcm9tIGEgaGVhcCBtYXkKYmUgaW4gdXNlIGZvciBxdWl0ZSBzb21lIHRpbWUsIHRoZXJlIGlz
bid0IGEgd2F5IHRvIHNhZmVseQp1bmxvYWQgdGhlIGRyaXZlciBvbmNlIGl0IGhhcyBiZWVuIGxv
YWRlZC4gVGh1cyB0aGVzZQpkcml2ZXJzIGRvIG5vIGltcGxlbWVudCBtb2R1bGVfZXhpdCgpIGZ1
bmN0aW9ucyBhbmQgd2lsbApzaG93IHVwIGluIGxzbW9kIGFzICJbcGVybWFuZW50XSIKCkZlZWRi
YWNrIGFuZCB0aG91Z2h0cyBvbiB0aGlzIHdvdWxkIGJlIGdyZWF0bHkgYXBwcmVjaWF0ZWQhCgp0
aGFua3MKLWpvaG4KCkNjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KQ2M6IEJl
bmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpDYzogU3VtaXQg
U2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IExpYW0gTWFyayA8bG1hcmtAY29k
ZWF1cm9yYS5vcmc+CkNjOiBQcmF0aWsgUGF0ZWwgPHByYXRpa3BAY29kZWF1cm9yYS5vcmc+CkNj
OiBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+CkNjOiBBbmRyZXcgRi4gRGF2
aXMgPGFmZEB0aS5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24u
b3JnPgpDYzogWXVlIEh1IDxodXl1ZTJAeXVsb25nLmNvbT4KQ2M6IE1pa2UgUmFwb3BvcnQgPHJw
cHRAbGludXguaWJtLmNvbT4KQ2M6IENoZW5ibyBGZW5nIDxmZW5nY0Bnb29nbGUuY29tPgpDYzog
QWxpc3RhaXIgU3RyYWNoYW4gPGFzdHJhY2hhbkBnb29nbGUuY29tPgpDYzogU2FuZGVlcCBQYXRp
bCA8c3NwYXRpbEBnb29nbGUuY29tPgpDYzogSHJpZHlhIFZhbHNhcmFqdSA8aHJpZHlhQGdvb2ds
ZS5jb20+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCgpKb2huIFN0dWx0eiAo
MSk6CiAgZG1hLWJ1ZjogaGVhcHM6IEFsbG93IHN5c3RlbSAmIGNtYSBoZWFwcyB0byBiZSBjb25m
aWd1cmVkIGFzIGEgbW9kdWxlcwoKU2FuZGVlcCBQYXRpbCAoMSk6CiAgbW06IGNtYTogRXhwb3J0
IGNtYSBzeW1ib2xzIGZvciBjbWEgaGVhcCBhcyBhIG1vZHVsZQoKIGRyaXZlcnMvZG1hLWJ1Zi9k
bWEtaGVhcC5jICAgICAgICAgICB8IDIgKysKIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmln
ICAgICAgICB8IDQgKystLQogZHJpdmVycy9kbWEtYnVmL2hlYXBzL2hlYXAtaGVscGVycy5jIHwg
MiArKwoga2VybmVsL2RtYS9jb250aWd1b3VzLmMgICAgICAgICAgICAgIHwgMSArCiBtbS9jbWEu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA1ICsrKysrCiA1IGZpbGVzIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
