Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53092A6973
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 15:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B489B8951E;
	Tue,  3 Sep 2019 13:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DCF8951E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 13:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D148940484;
 Tue,  3 Sep 2019 15:15:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-yWj3dTeUAj; Tue,  3 Sep 2019 15:15:18 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0FBE54041E;
 Tue,  3 Sep 2019 15:15:17 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 51241360160;
 Tue,  3 Sep 2019 15:15:17 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, pv-drivers@vmware.com,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Have TTM support SEV encryption with coherent memory
Date: Tue,  3 Sep 2019 15:15:00 +0200
Message-Id: <20190903131504.18935-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567516517; bh=k4qD2CIRuiMN+/xCKKla+Pb1zrd34KXbguPhrJpEa9w=;
 h=From:To:Cc:Subject:Date:From;
 b=O9fDiiLPidkXIiDD+2AOf1LSKTXeBllefKQIB4cGYnYURPm/Ao8IIhnmzodXJ2kd3
 INfw0V3l/64MsjqLjhWg3dMb8Y9OqPgTiEJcgKU3Vbqm1TIyVryZG/2vLPwFWrdkzM
 SxwiygpkgqkOiMD9gHGVwNkOkvx6hE822WJPMW/A=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=O9fDiiLP; 
 dkim-atps=neutral
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCBTRVYgbWVtb3J5IGVuY3J5cHRpb24gYW5kIGluIHNvbWUgY2FzZXMgYWxzbyB3aXRoIFNN
RSBtZW1vcnkKZW5jcnlwdGlvbiwgY29oZXJlbnQgbWVtb3J5IGlzIHVuZW5jcnlwdGVkLiBJbiB0
aG9zZSBjYXNlcywgVFRNIGRvZXNuJ3QKc2V0IHVwIHRoZSBjb3JyZWN0IHBhZ2UgcHJvdGVjdGlv
bi4gRml4IHRoaXMgYnkgaGF2aW5nIHRoZSBUVE0KY29oZXJlbnQgcGFnZSBhbGxvY2F0b3IgY2Fs
bCBpbnRvIHRoZSBwbGF0Zm9ybSBjb2RlIHRvIGRldGVybWluZSB3aGV0aGVyCmNvaGVyZW50IG1l
bW9yeSBpcyBlbmNyeXB0ZWQgb3Igbm90LCBhbmQgbW9kaWZ5IHRoZSBwYWdlIHByb3RlY3Rpb24g
aWYKaXQgaXMgbm90LgoKdjI6Ci0gVXNlIGZvcmNlX2RtYV91bmVuY3J5cHRlZCgpIHJhdGhlciB0
aGFuIHNldl9hY3RpdmUoKSB0byBjYXRjaCBhbHNvIHRoZQogIHNwZWNpYWwgU01FIGVuY3J5cHRp
b24gY2FzZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
