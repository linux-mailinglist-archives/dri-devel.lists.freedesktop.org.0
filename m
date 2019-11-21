Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BA21053C3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 15:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6266E135;
	Thu, 21 Nov 2019 14:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9806E135;
 Thu, 21 Nov 2019 14:02:29 +0000 (UTC)
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDE4020679;
 Thu, 21 Nov 2019 14:02:28 +0000 (UTC)
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH v2 0/7] PCI: Prefer pcie_capability_read_word()
Date: Thu, 21 Nov 2019 08:02:13 -0600
Message-Id: <20191121140220.38030-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574344949;
 bh=kegAbqQ55YAKJFVhHNJc+bQ0rbgYivDuVa8I99XBJ9c=;
 h=From:To:Cc:Subject:Date:From;
 b=2GwomWDZvpK92iHDorjwezZ5/4UYvebR151EZGZfqqlASQxqholOLgorVKdkbFWVw
 YdmgL7/pi5HxEhqxeWxTshMRLxwChujHVtmORfyy8/eHF8Is1ZT7ErJwWM26jA4UQq
 FGE0WL6vIXveCEfARsgvY03PTEZJX8q1ujxCFors=
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
Cc: Frederick Lawler <fred@fredlawl.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, amd-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KClVzZSBwY2llX2NhcGFi
aWxpdHlfcmVhZF93b3JkKCkgYW5kIHNpbWlsYXIgaW5zdGVhZCBvZiB1c2luZwpwY2lfcmVhZF9j
b25maWdfd29yZCgpIGRpcmVjdGx5LiAgQWRkICNkZWZpbmVzIHRvIHJlcGxhY2Ugc29tZSBtYWdp
YwpudW1iZXJzLiAgRml4IHR5cG9zIGluIHVzZSBvZiBUcmFuc21pdCBNYXJnaW4gZmllbGQuCgpU
aGVzZSBhcmUgY3VycmVudGx5IG9uIG15IHBjaS9taXNjIGJyYW5jaCBmb3IgdjUuNS4gIExldCBt
ZSBrbm93IGlmIHlvdSBzZWUKYW55IGlzc3Vlcy4KCgpCam9ybiBIZWxnYWFzICg1KToKICBQQ0k6
IEFkZCAjZGVmaW5lcyBmb3IgRW50ZXIgQ29tcGxpYW5jZSwgVHJhbnNtaXQgTWFyZ2luCiAgZHJt
L2FtZGdwdTogQ29ycmVjdCBUcmFuc21pdCBNYXJnaW4gbWFza3MKICBkcm0vYW1kZ3B1OiBSZXBs
YWNlIG51bWJlcnMgd2l0aCBQQ0lfRVhQX0xOS0NUTDIgZGVmaW5pdGlvbnMKICBkcm0vcmFkZW9u
OiBDb3JyZWN0IFRyYW5zbWl0IE1hcmdpbiBtYXNrcwogIGRybS9yYWRlb246IFJlcGxhY2UgbnVt
YmVycyB3aXRoIFBDSV9FWFBfTE5LQ1RMMiBkZWZpbml0aW9ucwoKRnJlZGVyaWNrIExhd2xlciAo
Mik6CiAgZHJtL2FtZGdwdTogUHJlZmVyIHBjaWVfY2FwYWJpbGl0eV9yZWFkX3dvcmQoKQogIGRy
bS9yYWRlb246IFByZWZlciBwY2llX2NhcGFiaWxpdHlfcmVhZF93b3JkKCkKCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9jaWsuYyB8IDk1ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMgIHwgOTcgKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgICAgIHwgOTQg
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9z
aS5jICAgICAgfCA5NyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogaW5jbHVkZS91
YXBpL2xpbnV4L3BjaV9yZWdzLmggICAgfCAgMiArCiA1IGZpbGVzIGNoYW5nZWQsIDI0MyBpbnNl
cnRpb25zKCspLCAxNDIgZGVsZXRpb25zKC0pCgotLSAKMi4yNC4wLjQzMi5nOWQzZjVmNWI2My1n
b29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
