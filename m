Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5AEF41BE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015F36F872;
	Fri,  8 Nov 2019 08:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265876E4EC;
 Thu,  7 Nov 2019 19:39:41 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 3DD6A60A66; Thu,  7 Nov 2019 19:39:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from cohens-linux.qualcomm.com (global_nat1_iad_fw.qualcomm.com
 [129.46.232.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: cohens@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B2382602DD;
 Thu,  7 Nov 2019 19:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2382602DD
From: Steve Cohen <cohens@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/3] allow DRM drivers to limit creation of blobs
Date: Thu,  7 Nov 2019 14:39:11 -0500
Message-Id: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155580;
 bh=s8/45v5G6sYOnvFu3XWNdQAqwNhGFfHSa6sUorRdCyI=;
 h=From:To:Cc:Subject:Date:From;
 b=Tpff5KXpq2Yk9IxoeZOAFF+mQ1JT+Fr3gNDQKEZSW2vYNTLDMF0GpxnOulpkw436t
 Lxw9vMCM5IEM0rXJQg5bhcklGGrF2RPzSu7WwLyti6aUOrqUrhkTAbh6laetzaHL6J
 fJwLeGqcNSqX4fkdOn0MzvK9COMZHLWqWAV3IE6E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573155579;
 bh=s8/45v5G6sYOnvFu3XWNdQAqwNhGFfHSa6sUorRdCyI=;
 h=From:To:Cc:Subject:Date:From;
 b=mazqS+9zaJ+eGp/W0lmFjd9/mm8PFHeQ9VXGpxppH/EHhqx1K5KRAu5rhOXKT35qG
 Dr4R3ckBy+RdIBHB+uB8N0aSFLN1wGBRfAYB7UnduTCFS4salRLpd722lkECUAfTcA
 TL8c6iIT7pMZ+9XuMglvoi5dfDov9Gw/ib9+iWZQ=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=cohens@codeaurora.org
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
Cc: adelva@google.com, Steve Cohen <cohens@codeaurora.org>,
 pdhaval@codeaurora.org, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnV6emVycyB1c2VkIGluIEFuZHJvaWQgY29tcGxpYW5jZSB0ZXN0aW5nIHJlcGVhdGVkbHkgY2Fs
bCB0aGUKY3JlYXRlIGJsb2IgSU9DVEwgd2hpY2ggZXZlbnR1YWxseSBleGhhdXN0cyB0aGUgc3lz
dGVtIG1lbW9yeS4KVGhpcyBzZXJpZXMgYWRkcyBhIGhvb2sgd2hpY2ggYWxsb3dzIGRyaXZlcnMg
dG8gaW1wb3NlIHRoZWlyIG93bgpsaW1pdGF0aW9ucyBvbiB0aGUgc2l6ZSBhbmQvb3IgbnVtYmVy
IG9mIGJsb2JzIGNyZWF0ZWQuCgpTdGV2ZSBDb2hlbiAoMyk6CiAgZHJtOiBhZGQgZHJpdmVyIGhv
b2sgZm9yIGNyZWF0ZSBibG9iIGxpbWl0YXRpb25zCiAgZHJtL21zbTogYWRkIHN1cHBvcnQgZm9y
IGNyZWF0ZWJsb2JfY2hlY2sgZHJpdmVyIGhvb2sKICBkcm0vbXNtL2RwdTogY2hlY2sgYmxvYiBs
aW1pdGF0aW9ucyBkdXJpbmcgY3JlYXRlIGJsb2IgaW9jdGwKCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X3Byb3BlcnR5LmMgICAgICAgICAgfCAgNyArKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvZHB1MS9kcHVfa21zLmMgfCAxNCArKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZHJ2LmMgICAgICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fa21zLmggICAgICAgICAgIHwgIDEgKwogaW5jbHVkZS9kcm0v
ZHJtX2Rydi5oICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCiA1IGZpbGVzIGNoYW5n
ZWQsIDU2IGluc2VydGlvbnMoKykKCi0tIApUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIs
IEluYy4gaXMgYSBtZW1iZXIgb2YgdGhlIENvZGUgQXVyb3JhIEZvcnVtLAphIExpbnV4IEZvdW5k
YXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
