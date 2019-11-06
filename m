Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB893F156A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 12:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C766ECEC;
	Wed,  6 Nov 2019 11:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1BB6ECEC;
 Wed,  6 Nov 2019 11:49:36 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 82603611A7; Wed,  6 Nov 2019 11:49:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: smasetty@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BFE3160EE3;
 Wed,  6 Nov 2019 11:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFE3160EE3
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm: msm: a6xx: fix debug bus register configuration
Date: Wed,  6 Nov 2019 17:19:23 +0530
Message-Id: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573040976;
 bh=1dpV706bZTuScFAR17edEPKOVhlZyfhlbJYNG58DizU=;
 h=From:To:Cc:Subject:Date:From;
 b=RaSSsofD1vViYXpfy4/wmxyzmwv1qsn0N+iYoTIDofh59P6E4hN+Jf1dV7OKrsduu
 Ln2tfuzSZ5V8tFVmt2Ko61ErevMu1/gAO0KaPw2hVi//6R6kZ/SgrghgjqHNsMxrq/
 jKB9K3viFZR27exdUB0KLJhBBizBM6onSbD82wFM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1573040976;
 bh=1dpV706bZTuScFAR17edEPKOVhlZyfhlbJYNG58DizU=;
 h=From:To:Cc:Subject:Date:From;
 b=RaSSsofD1vViYXpfy4/wmxyzmwv1qsn0N+iYoTIDofh59P6E4hN+Jf1dV7OKrsduu
 Ln2tfuzSZ5V8tFVmt2Ko61ErevMu1/gAO0KaPw2hVi//6R6kZ/SgrghgjqHNsMxrq/
 jKB9K3viFZR27exdUB0KLJhBBizBM6onSbD82wFM=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=smasetty@codeaurora.org
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
Cc: linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBjeCBkZWJ1Z2J1cyByZWxhdGVkIHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24sIHRvIGNv
bGxlY3QgYWNjdXJhdGUKYnVzIGRhdGEgZHVyaW5nIGdwdSBzbmFwc2hvdC4gVGhpcyBoZWxwcyB3
aXRoIGNvbXBsZXRlIHNuYXBzaG90IGR1bXAKYW5kIGFsc28gY29tcGxldGUgcHJvcGVyIEdQVSBy
ZWNvdmVyeS4KClNpZ25lZC1vZmYtYnk6IFNoYXJhdCBNYXNldHR5IDxzbWFzZXR0eUBjb2RlYXVy
b3JhLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5j
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ3B1X3N0YXRlLmMKaW5kZXggNDgzZTEwMC4uYzU3NjRiNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hNnh4X2dwdV9zdGF0ZS5jCkBAIC0zNTMsMjYgKzM1MywyNiBAQCBzdGF0
aWMgdm9pZCBhNnh4X2dldF9kZWJ1Z2J1cyhzdHJ1Y3QgbXNtX2dwdSAqZ3B1LAogCQljeGRiZyA9
IGlvcmVtYXAocmVzLT5zdGFydCwgcmVzb3VyY2Vfc2l6ZShyZXMpKTsKCiAJaWYgKGN4ZGJnKSB7
Ci0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfQ05UTFQsCisJ
CWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfQ05UTFQsCiAJ
CQlBNlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMVF9TRUdUKDB4ZikpOwoKLQkJY3hkYmdfd3JpdGUo
Y3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMTSwKKwkJY3hkYmdfd3JpdGUoY3hk
YmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19DTlRMTSwKIAkJCUE2WFhfREJHQ19DRkdf
REJHQlVTX0NOVExNX0VOQUJMRSgweGYpKTsKCi0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZY
WF9EQkdDX0NGR19EQkdCVVNfSVZUTF8wLCAwKTsKLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19B
NlhYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzEsIDApOwotCQljeGRiZ193cml0ZShjeGRiZywgUkVH
X0E2WFhfREJHQ19DRkdfREJHQlVTX0lWVExfMiwgMCk7Ci0JCWN4ZGJnX3dyaXRlKGN4ZGJnLCBS
RUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8zLCAwKTsKKwkJY3hkYmdfd3JpdGUoY3hkYmcs
IFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzAsIDApOworCQljeGRiZ193cml0ZShj
eGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0lWVExfMSwgMCk7CisJCWN4ZGJnX3dy
aXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfSVZUTF8yLCAwKTsKKwkJY3hk
Ymdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0NYX0RCR0NfQ0ZHX0RCR0JVU19JVlRMXzMsIDApOwoK
LQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZHX0RCR0JVU19CWVRFTF8wLAor
CQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19DRkdfREJHQlVTX0JZVEVMXzAs
CiAJCQkweDc2NTQzMjEwKTsKLQkJY3hkYmdfd3JpdGUoY3hkYmcsIFJFR19BNlhYX0RCR0NfQ0ZH
X0RCR0JVU19CWVRFTF8xLAorCQljeGRiZ193cml0ZShjeGRiZywgUkVHX0E2WFhfQ1hfREJHQ19D
RkdfREJHQlVTX0JZVEVMXzEsCiAJCQkweEZFRENCQTk4KTsKCi0JCWN4ZGJnX3dyaXRlKGN4ZGJn
LCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMCwgMCk7Ci0JCWN4ZGJnX3dyaXRlKGN4
ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMSwgMCk7Ci0JCWN4ZGJnX3dyaXRl
KGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMiwgMCk7Ci0JCWN4ZGJnX3dy
aXRlKGN4ZGJnLCBSRUdfQTZYWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMywgMCk7CisJCWN4ZGJn
X3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMCwgMCk7CisJ
CWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFTS0xfMSwg
MCk7CisJCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdCVVNfTUFT
S0xfMiwgMCk7CisJCWN4ZGJnX3dyaXRlKGN4ZGJnLCBSRUdfQTZYWF9DWF9EQkdDX0NGR19EQkdC
VVNfTUFTS0xfMywgMCk7CiAJfQoKIAlucl9kZWJ1Z2J1c19ibG9ja3MgPSBBUlJBWV9TSVpFKGE2
eHhfZGVidWdidXNfYmxvY2tzKSArCi0tCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
