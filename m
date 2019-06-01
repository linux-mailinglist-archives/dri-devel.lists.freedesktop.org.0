Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C3131CB4
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEE089C17;
	Sat,  1 Jun 2019 13:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CD989C17;
 Sat,  1 Jun 2019 13:24:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59095264C3;
 Sat,  1 Jun 2019 13:24:29 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 18/99] drm/nouveau/disp/dp: respect sink limits
 when selecting failsafe link configuration
Date: Sat,  1 Jun 2019 09:22:25 -0400
Message-Id: <20190601132346.26558-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132346.26558-1-sashal@kernel.org>
References: <20190601132346.26558-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395470;
 bh=qVIXectfZsHqbZ7VBc05uhjaf7DR5Xsbh8IdrYBVmng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pvr8QkdqlKmqH8XU3csraUZ82LoyY1M1pSIPWy+nUKf3sBx62Ovb1YELg5ZjSCETF
 kWYuixaFKeKvb0frN2pRqeWDQhQeMx/wb3MYkmU3xJgJkr1kp26VlMjwlY4LNm9cqB
 vvX1dR8u7wJkDluEDQwGGi3iTNMG0wZdE3ALRjTI=
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
MTNkMDNlOWRhZjcwZGFiMDMyYzAzZGMxNzJlNzViYjk4YWQ4OTljNCBdCgpXaGVyZSBwb3NzaWJs
ZSwgd2Ugd2FudCB0aGUgZmFpbHNhZmUgbGluayBjb25maWd1cmF0aW9uIChvbmUgd2hpY2ggd29u
J3QKaGFuZyB0aGUgT1IgZHVyaW5nIG1vZGVzZXQgYmVjYXVzZSBvZiBub3QgZW5vdWdoIGJhbmR3
aWR0aCBmb3IgdGhlIG1vZGUpCnRvIGFsc28gYmUgc3VwcG9ydGVkIGJ5IHRoZSBzaW5rLgoKVGhp
cyBwcmV2ZW50cyAibGluayByYXRlIHVuc3VwcG9ydGVkIGJ5IHNpbmsiIG1lc3NhZ2VzIHdoZW4g
bGluayB0cmFpbmluZwpmYWlscy4KClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvZHAuYyB8IDEx
ICsrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rp
c3AvZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvZHAuYwpp
bmRleCA2MTYwYTYxNThjZjI2Li41ZTUxYTVjMWViMDEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC9kcC5jCkBAIC0zNjQsOCArMzY0LDE1IEBAIG52a21f
ZHBfdHJhaW4oc3RydWN0IG52a21fZHAgKmRwLCB1MzIgZGF0YUtCcHMpCiAJICogYW5kIGl0J3Mg
YmV0dGVyIHRvIGhhdmUgYSBmYWlsZWQgbW9kZXNldCB0aGFuIHRoYXQuCiAJICovCiAJZm9yIChj
ZmcgPSBudmttX2RwX3JhdGVzOyBjZmctPnJhdGU7IGNmZysrKSB7Ci0JCWlmIChjZmctPm5yIDw9
IG91dHBfbnIgJiYgY2ZnLT5uciA8PSBvdXRwX2J3KQotCQkJZmFpbHNhZmUgPSBjZmc7CisJCWlm
IChjZmctPm5yIDw9IG91dHBfbnIgJiYgY2ZnLT5uciA8PSBvdXRwX2J3KSB7CisJCQkvKiBUcnkg
dG8gcmVzcGVjdCBzaW5rIGxpbWl0cyB0b28gd2hlbiBzZWxlY3RpbmcKKwkJCSAqIGxvd2VzdCBs
aW5rIGNvbmZpZ3VyYXRpb24uCisJCQkgKi8KKwkJCWlmICghZmFpbHNhZmUgfHwKKwkJCSAgICAo
Y2ZnLT5uciA8PSBzaW5rX25yICYmIGNmZy0+YncgPD0gc2lua19idykpCisJCQkJZmFpbHNhZmUg
PSBjZmc7CisJCX0KKwogCQlpZiAoZmFpbHNhZmUgJiYgY2ZnWzFdLnJhdGUgPCBkYXRhS0JwcykK
IAkJCWJyZWFrOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
