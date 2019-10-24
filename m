Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C911E389F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D400D6E4C9;
	Thu, 24 Oct 2019 16:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257F06E4BB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:02 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q13so21890205wrs.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yty/EJuHbPo+sV+vw2W6VylZ7J8vhVAzp70Ulfh9+0w=;
 b=sH3WyTrPYHhxPQak8qoSkfUrp35mW7SnqTj5B6TEecgllUE+jqcHWtcGzykf3q6ekc
 AI4iHj9NkgTcyvKNdP7rOA9+3DFqAyu+XnnXy9ZZuDxjCflLXlkd5iD2a+V9Pp1mR++H
 FnkIlRpYO2AHr/VWFRUP2/Df+lqrargqMj/mF4/uovawya3r5aMCj0NokUDX3xi7CASJ
 nGnTM75b2waFYVroY3AyWyPipVZbDqUSr9FmX6V78Fzs7yVeaexLNjcxAxC0i8rXhDDg
 2rsTTB9QLaJWJMau5gYwWBVhPxlT9FWFZLP/phSGxKVktzpOX6WHxJ1hXXCQQx5g2W6y
 spsg==
X-Gm-Message-State: APjAAAX1ya44gOzGA6R8UVceKNjTSbeMlKnWR3FG6b52meHWd3klg1Om
 VaGxkWsT2aOuf42q7CcBSik=
X-Google-Smtp-Source: APXvYqwCFC6iF6CMbRgp6QF+yXHQtCqN51M4/rI8h1YavptNKwRXtJXI6zlQTsvG9F9hgqpdktAg3A==
X-Received: by 2002:adf:a48c:: with SMTP id g12mr4473270wrb.212.1571935559735; 
 Thu, 24 Oct 2019 09:45:59 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id p1sm3658391wmg.11.2019.10.24.09.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 10/32] drm/tegra: dp: Read eDP version from DPCD
Date: Thu, 24 Oct 2019 18:45:12 +0200
Message-Id: <20191024164534.132764-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yty/EJuHbPo+sV+vw2W6VylZ7J8vhVAzp70Ulfh9+0w=;
 b=XhRXcDJ0B/zJO6GUyxCfZStm1mqzsaFnI3qf5hqPARKj4v55F4UNEGAjVr07eQlZTL
 tDugAZbbwl6PGa3htJmzf3TLaVtra2qQ4c9v7k8rWCo9PaJKp0DXmuidAWxXX2lX9ast
 i0ohrEAkh/HoQ34k6OO824pIXjXXZP4i9y1HmGkpEgD1EMNdTQvgSGWl+w4PnnSJleFN
 6zfA+e2pHLLZH/SUiF3V3iiXVKprW5bVKt8+d5rMmQMc3uL0TYdtMtQdXfLSFKiqqbQC
 7z80ZtPNugV3exg1SPmfmqyiNXmsY8U/+cUKVcegxbZur1hMwIzwG3gY6u7W3hGWH9WF
 FruQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBzaW5rIHN1
cHBvcnRzIGVEUCwgcmVhZCB0aGUgZURQIHJldmlzaW9uIGZyb20gaXQncyBEUENELgoKU2lnbmVk
LW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvZHAuYyB8IDE4ICsrKysrKysrKysrKysrKystLQogZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2RwLmggfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5j
IGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMKaW5kZXggMWY0OGMyMTkwZTNiLi4yYmUwYTQ3
ZWNiZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcC5jCkBAIC01LDkgKzUsMTIgQEAKICAqLwogCiAjaW5jbHVkZSA8
ZHJtL2RybV9kcF9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAKICNpbmNs
dWRlICJkcC5oIgogCitzdGF0aWMgY29uc3QgdTggZHJtX2RwX2VkcF9yZXZpc2lvbnNbXSA9IHsg
MHgxMSwgMHgxMiwgMHgxMywgMHgxNCB9OworCiBzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19jYXBz
X3Jlc2V0KHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpjYXBzKQogewogCWNhcHMtPmVuaGFuY2Vk
X2ZyYW1pbmcgPSBmYWxzZTsKQEAgLTM3LDYgKzQwLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2xp
bmtfcmVzZXQoc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQogCWxpbmstPm1heF9sYW5lcyA9IDA7
CiAKIAlkcm1fZHBfbGlua19jYXBzX3Jlc2V0KCZsaW5rLT5jYXBzKTsKKwlsaW5rLT5lZHAgPSAw
OwogCiAJbGluay0+cmF0ZSA9IDA7CiAJbGluay0+bGFuZXMgPSAwOwpAQCAtNTUsNyArNTksNyBA
QCBzdGF0aWMgdm9pZCBkcm1fZHBfbGlua19yZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmsp
CiAgKi8KIGludCBkcm1fZHBfbGlua19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1
Y3QgZHJtX2RwX2xpbmsgKmxpbmspCiB7Ci0JdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV07
CisJdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0sIHZhbHVlOwogCWludCBlcnI7CiAKIAlk
cm1fZHBfbGlua19yZXNldChsaW5rKTsKQEAgLTczLDkgKzc3LDE5IEBAIGludCBkcm1fZHBfbGlu
a19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmsp
CiAJbGluay0+Y2Fwcy5mYXN0X3RyYWluaW5nID0gZHJtX2RwX2Zhc3RfdHJhaW5pbmdfY2FwKGRw
Y2QpOwogCWxpbmstPmNhcHMuY2hhbm5lbF9jb2RpbmcgPSBkcm1fZHBfY2hhbm5lbF9jb2Rpbmdf
c3VwcG9ydGVkKGRwY2QpOwogCi0JaWYgKGRybV9kcF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0
X2NhcChkcGNkKSkKKwlpZiAoZHJtX2RwX2FsdGVybmF0ZV9zY3JhbWJsZXJfcmVzZXRfY2FwKGRw
Y2QpKSB7CiAJCWxpbmstPmNhcHMuYWx0ZXJuYXRlX3NjcmFtYmxlcl9yZXNldCA9IHRydWU7CiAK
KwkJZXJyID0gZHJtX2RwX2RwY2RfcmVhZGIoYXV4LCBEUF9FRFBfRFBDRF9SRVYsICZ2YWx1ZSk7
CisJCWlmIChlcnIgPCAwKQorCQkJcmV0dXJuIGVycjsKKworCQlpZiAodmFsdWUgPj0gQVJSQVlf
U0laRShkcm1fZHBfZWRwX3JldmlzaW9ucykpCisJCQlEUk1fRVJST1IoInVuc3VwcG9ydGVkIGVE
UCB2ZXJzaW9uOiAlMDJ4XG4iLCB2YWx1ZSk7CisJCWVsc2UKKwkJCWxpbmstPmVkcCA9IGRybV9k
cF9lZHBfcmV2aXNpb25zW3ZhbHVlXTsKKwl9CisKIAlsaW5rLT5yYXRlID0gbGluay0+bWF4X3Jh
dGU7CiAJbGluay0+bGFuZXMgPSBsaW5rLT5tYXhfbGFuZXM7CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcC5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmgKaW5kZXgg
NDVlOGZmMThhYjZhLi42ODFjYmQwYTAwOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCkBAIC02MCw2ICs2MCw3
IEBAIHZvaWQgZHJtX2RwX2xpbmtfY2Fwc19jb3B5KHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpk
ZXN0LAogICogQG1heF9yYXRlOiBtYXhpbXVtIGNsb2NrIHJhdGUgc3VwcG9ydGVkIG9uIHRoZSBs
aW5rCiAgKiBAbWF4X2xhbmVzOiBtYXhpbXVtIG51bWJlciBvZiBsYW5lcyBzdXBwb3J0ZWQgb24g
dGhlIGxpbmsKICAqIEBjYXBzOiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkIG9uIHRoZSBsaW5rIChz
ZWUgJmRybV9kcF9saW5rX2NhcHMpCisgKiBAZWRwOiBlRFAgcmV2aXNpb24gKDB4MTE6IGVEUCAx
LjEsIDB4MTI6IGVEUCAxLjIsIC4uLikKICAqIEByYXRlOiBjdXJyZW50bHkgY29uZmlndXJlZCBs
aW5rIHJhdGUKICAqIEBsYW5lczogY3VycmVudGx5IGNvbmZpZ3VyZWQgbnVtYmVyIG9mIGxhbmVz
CiAgKi8KQEAgLTY5LDYgKzcwLDcgQEAgc3RydWN0IGRybV9kcF9saW5rIHsKIAl1bnNpZ25lZCBp
bnQgbWF4X2xhbmVzOwogCiAJc3RydWN0IGRybV9kcF9saW5rX2NhcHMgY2FwczsKKwl1bnNpZ25l
ZCBjaGFyIGVkcDsKIAogCXVuc2lnbmVkIGludCByYXRlOwogCXVuc2lnbmVkIGludCBsYW5lczsK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
