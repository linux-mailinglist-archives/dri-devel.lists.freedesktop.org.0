Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402E2E8F6
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 01:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010D66E0E5;
	Wed, 29 May 2019 23:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC416E0E5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 23:24:03 +0000 (UTC)
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW7vL-0005Ro-9e; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hW7vI-0007xQ-P9; Wed, 29 May 2019 20:23:56 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 11/22] gpu: amdgpu: fix broken amdgpu_dma_buf.c references
Date: Wed, 29 May 2019 20:23:42 -0300
Message-Id: <f7378a751557277eab6f37f3f5692cf5f1aff8c6.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559171394.git.mchehab+samsung@kernel.org>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MWu4b2HnNsZ9u5zNAl68rcYIhiC5L6PnTagFV0A6q48=; b=K1nGrVDBAQC7pk/EbproUAqI1+
 upbz7pNriyhWhaB2djiqMSec90VJVZNZZQPTxHoyvwBeSb9+4/hq+nlbEJx6hWgnrNMbstaqTQ2Li
 x95HPcTDap7E9vEkVXSmTqcpKPKNdypHBw28S7sw2iKBBJx6roKQC1lG1NCQ+VAp1fwwUY2bJs2uM
 qtsk7hulpXxFuLqZQ+pQa47pL/YruplXP3XL1FDPwK2lKynAPopb/tnWEzUdfY0aK6MyIBcZxCfwP
 GHdDcThp2iYi2b7AlAsn+Jgw59ilxzNgwTeed6QXQAuZzz8ggkE5NTJ/U48CU67QHRBmSCslEw14l
 AWEac4qA==;
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWxlIHdhcyByZW5hbWVkLCBidXQgZG9jcyB3ZXJlbid0IHVwZGF0ZWQgYWNjb3JkaW5n
bHkuCgoJV0FSTklORzoga2VybmVsLWRvYyAnLi9zY3JpcHRzL2tlcm5lbC1kb2MgLXJzdCAtZW5h
YmxlLWxpbmVubyAtZnVuY3Rpb24gUFJJTUUgQnVmZmVyIFNoYXJpbmcgLi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcHJpbWUuYycgZmFpbGVkIHdpdGggcmV0dXJuIGNvZGUgMQoJ
V0FSTklORzoga2VybmVsLWRvYyAnLi9zY3JpcHRzL2tlcm5lbC1kb2MgLXJzdCAtZW5hYmxlLWxp
bmVubyAtaW50ZXJuYWwgLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHJpbWUu
YycgZmFpbGVkIHdpdGggcmV0dXJuIGNvZGUgMgoKRml4ZXM6IDk4ODA3NmNkOGM1YyAoImRybS9h
bWRncHU6IHJlbmFtZSBhbWRncHVfcHJpbWUuW2NoXSBpbnRvIGFtZGdwdV9kbWFfYnVmLltjaF0i
KQpTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0Br
ZXJuZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24vZ3B1L2FtZGdwdS5yc3QgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJzdCBiL0RvY3VtZW50YXRpb24vZ3B1L2FtZGdw
dS5yc3QKaW5kZXggYTc0MGU0OTFkZmNjLi5hMTUxOTliMWIwMmUgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZ3B1L2FtZGdwdS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvYW1kZ3B1LnJz
dApAQCAtMzcsMTAgKzM3LDEwIEBAIEJ1ZmZlciBPYmplY3RzCiBQUklNRSBCdWZmZXIgU2hhcmlu
ZwogLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAotLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wcmltZS5jCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwogICAgOmRvYzogUFJJTUUgQnVmZmVyIFNo
YXJpbmcKIAotLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wcmltZS5jCisuLiBrZXJuZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RtYV9idWYuYwogICAgOmludGVybmFsOgogCiBNTVUgTm90aWZpZXIKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
