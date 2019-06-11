Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4CE3D1D1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0518924B;
	Tue, 11 Jun 2019 16:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD708924B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:09:47 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c11so7992205qkk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5KL5I0SAkC3HgYY38CLkIrnaNCzSCjH7Gekw6kD3yas=;
 b=DcirixfkrHazfITRT//jP244W1nB5HHSHzHPszqDsVCb+V9clZmGOd7tX+MrIYgtWu
 5yOI39YwEWpz8XV57IUjQ1OTRjSx6Wr2vVcCI+SLZK+LX5pVEqAa3cWkNXX+9iG/+JR1
 h/sduT1tyZmmUInHIVZ+ZsEjsilcqKx7BSvwBTii58L/trUvMtkaAVP/n2kiDFwpMb4C
 KgQDZBbehGibMaluFUqpOg795l/l6MEfC1lXO+gSqZr6jAI8Lzv3ZWZjuheOIM+tbN3y
 s4YTint5Cfj12mEuPtJBPVYzWyC8hrYr+cqJbZKNT1p2YC2XgQTrzo88WkedEV153ZWA
 SuMg==
X-Gm-Message-State: APjAAAU+P93tHDmE9HCnbxt7pwfroaTl4QpyktCuTih95bFzPIPIwLms
 hBuCriPBfO+ciVbkMAjbCDiEtV56Wzs=
X-Google-Smtp-Source: APXvYqyouimZW0B4aAIYOj5G80WyFXPhJBMKXWTYK8Mb73HlKgta+rCD0kZUTBneLOUCeujgCmbY7g==
X-Received: by 2002:a37:502:: with SMTP id 2mr57254612qkf.93.1560269386635;
 Tue, 11 Jun 2019 09:09:46 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d188sm6755094qkf.40.2019.06.11.09.09.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 09:09:46 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/11] drm/rockchip: Use dirtyfb helper
Date: Tue, 11 Jun 2019 12:08:20 -0400
Message-Id: <20190611160844.257498-7-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611160844.257498-1-sean@poorly.run>
References: <20190611160844.257498-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5KL5I0SAkC3HgYY38CLkIrnaNCzSCjH7Gekw6kD3yas=;
 b=Dhyyf6Zs2HJKXIA76COVerElgsDhNbHhr+jXsqwtv8uMA34bUEia2lD2YjSnWtRQkd
 aOfZ+XHC44LA2MnyWyibwejHLvta4yB1SAHpkH1gwGqNFPWrv/XfjUc7ewC1PKLqE6pP
 y4/SIIlXJZQnnuU6ZwYAcs7bnUMnQMqxxcZh2m2LttRmcoZllCMXiLJEr/Co/FKzBtbH
 z+cYWR5m55ciVzS1VYKKy1LL1HmmUA40AxOLfkQm/h7/HL4Z5vgHdGGz69k0qcQz7n64
 3e6aD2610yVgT5q9qbL5NjbeI3FG8rixtayH0FjJcomDORrVIFnNmwtnWPPNo9JBESkW
 4ZfQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJbnN0ZWFkIG9mIGZsdXNo
aW5nIGFsbCB2b3BzIGV2ZXJ5IHRpbWUgd2UgZ2V0IGEgZGlydHlmYiBjYWxsLCB1c2UgdGhlCmRh
bWFnZSBoZWxwZXIgdG8ga2ljayBvZmYgYW4gYXRvbWljIGNvbW1pdC4gRXZlbiB0aG91Z2ggd2Ug
ZG9uJ3QgdXNlCmRhbWFnZSBjbGlwcywgdGhlIGhlbHBlciBjb21taXQgd2lsbCBmb3JjZSB1cyB0
aHJvdWdoIHRoZSBub3JtYWwKcHNyX2luaGliaXRfZ2V0L3B1dCBzZXF1ZW5jZS4KCkNoYW5nZXMg
aW4gdjM6Ci0gQWRkZWQgdG8gdGhlIHNldApDaGFuZ2VzIGluIHY0OgotIE5vbmUKQ2hhbmdlcyBp
biB2NToKLSBOb25lCgpMaW5rIHRvIHYzOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvbXNnaWQvMjAxOTA1MDIxOTQ5NTYuMjE4NDQxLTctc2VhbkBwb29ybHkucnVuCkxp
bmsgdG8gdjQ6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8y
MDE5MDUwODE2MDkyMC4xNDQ3MzktNy1zZWFuQHBvb3JseS5ydW4KClN1Z2dlc3RlZC1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21p
dW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYyB8
IDEzICsrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hp
cF9kcm1fZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmIuYwpp
bmRleCAzMTAzMGNmODFiYzk3Li5hODg4ZTMxYWE1NDVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCkBAIC0xNiw2ICsxNiw3IEBACiAjaW5jbHVkZSA8ZHJt
L2RybS5oPgogI2luY2x1ZGUgPGRybS9kcm1QLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWMu
aD4KKyNpbmNsdWRlIDxkcm0vZHJtX2RhbWFnZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X2ZiX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5o
PgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+CkBAIC0yNSwyMCArMjYsMTAgQEAK
ICNpbmNsdWRlICJyb2NrY2hpcF9kcm1fZ2VtLmgiCiAjaW5jbHVkZSAicm9ja2NoaXBfZHJtX3Bz
ci5oIgogCi1zdGF0aWMgaW50IHJvY2tjaGlwX2RybV9mYl9kaXJ0eShzdHJ1Y3QgZHJtX2ZyYW1l
YnVmZmVyICpmYiwKLQkJCQkgc3RydWN0IGRybV9maWxlICpmaWxlLAotCQkJCSB1bnNpZ25lZCBp
bnQgZmxhZ3MsIHVuc2lnbmVkIGludCBjb2xvciwKLQkJCQkgc3RydWN0IGRybV9jbGlwX3JlY3Qg
KmNsaXBzLAotCQkJCSB1bnNpZ25lZCBpbnQgbnVtX2NsaXBzKQotewotCXJvY2tjaGlwX2RybV9w
c3JfZmx1c2hfYWxsKGZiLT5kZXYpOwotCXJldHVybiAwOwotfQotCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyByb2NrY2hpcF9kcm1fZmJfZnVuY3MgPSB7CiAJLmRl
c3Ryb3kgICAgICAgPSBkcm1fZ2VtX2ZiX2Rlc3Ryb3ksCiAJLmNyZWF0ZV9oYW5kbGUgPSBkcm1f
Z2VtX2ZiX2NyZWF0ZV9oYW5kbGUsCi0JLmRpcnR5CSAgICAgICA9IHJvY2tjaGlwX2RybV9mYl9k
aXJ0eSwKKwkuZGlydHkJICAgICAgID0gZHJtX2F0b21pY19oZWxwZXJfZGlydHlmYiwKIH07CiAK
IHN0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUg
RW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
