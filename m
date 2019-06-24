Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FF151C45
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 22:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC8D89D79;
	Mon, 24 Jun 2019 20:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0705089D79
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 20:27:42 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 145so7710897pgh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 13:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Xm3E2aGr5dZvLkpn1QbXOhXQmIbRzV9KHBP8zZjQp7Y=;
 b=hqXQ31wYyp7qlzvB7l/+GmblgKNAywF9lut8NrSJHAaXZPcsKUELWqHV9f0kNYgy3S
 bsTSgxcYEWdm7Mr+eh+iRel7LGsxHo5Hqtmcn450Q/MZeqXzYqX76HQOnTtGVSbRWMJO
 fPqNj1NDi0m9OlluPJJg2yvhXu0Gk8SZ32uH4kj6dSW68K+oNexmk8V1q4XhD4gnmEVE
 s+AjJHwSNE8OpJ65J25qreCyZ7d8pyTiub2KyxrpSr/sMSz8zzFR1FHplQgwhTmGSy4j
 UHSUYffCJ2XcRLNUZ4raf+FkUSs/DSgU/Yosny9iPaA+CWXpUXYWF5DByKk6sYRbeDOi
 Yj+g==
X-Gm-Message-State: APjAAAXnLtDXVvRH+1B3NZ/M5ff+H/1L9CFyEePTD4AfWpBIBcqQbwgf
 2I3aVIeWRdKvsSALpgKbm5wVRo6+fzU=
X-Google-Smtp-Source: APXvYqwTdunXVLHzE98ld4jY9SPbBpG1RfzwPwbc0dz5O1z2DA5FG4FNhdVPjdxui0JexmKV10pU6g==
X-Received: by 2002:a63:4e58:: with SMTP id o24mr6317258pgl.366.1561408060852; 
 Mon, 24 Jun 2019 13:27:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y12sm11466778pgi.10.2019.06.24.13.27.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 13:27:40 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] libdrm: modetest: Allow selecting modes by index
Date: Mon, 24 Jun 2019 20:27:35 +0000
Message-Id: <20190624202735.125139-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Xm3E2aGr5dZvLkpn1QbXOhXQmIbRzV9KHBP8zZjQp7Y=;
 b=hVIJS0MK27V9qFYbti2Qc+HlVtqB9uaniCdnm5dMUAtDQP+o+v/SSmz0KeLVIyArq/
 E97JrMzLhsq+lcR40Bm79qD/yfUGYLtTcDgUl5aq1TO12UmzFeYnaP23IAKe2YC2w+hX
 HaFD5ZQMrv1C6tA+bv3dx9WtYmsvCcAxbPxCHWXbVinwOoxuggNxUCsFnQs2Kn+zJ6W9
 c8gbNc/oSCrd6H9ArHhF+UYt9q0gk9QgdYAFGsdph68p0nhSeidNG9wK8jMpz12bL2+C
 Zsl+vj2o3kurawIvRntaP9prlcJm7PV4d/+4/WtgjN1kPl/v7AqdK9i0z8tpIGPcc9QY
 COPw==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T2Z0ZW4gdGhlcmUgYXJlIG1hbnkgc2ltaWxhciBtb2Rlcywgd2hpY2ggY2Fubm90IGJlIHNlbGVj
dGVkCnZpYSBtb2RldGVzdCBkdWUgdG8gaXRzIHNpbXBsZSBzdHJpbmcgbWF0Y2hpbmcuCgpUaGlz
IGNoYW5nZSBhZGRzIGEgbW9kZSBpbmRleCBpbiB0aGUgZGlzcGxheSBvdXRwdXQsIHdoaWNoIGNh
bgp0aGVuIGJlIHVzZWQgdG8gc3BlY2lmeSBhIHNwZWNpZmljIG1vZGVsaW5lIHRvIGJlIHNldC4K
CkNjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+CkNjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BjaHJvbWl1bS5vcmc+CkNjOiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3Nv
bkBsaW5hcm8ub3JnPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4K
U2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQp2
MjogUmV3b3JrZWQgbW9kZV9zdHIgY2hlY2sgcGVyIElsaWEncyBzdWdnZXN0aW9uCi0tLQogdGVz
dHMvbW9kZXRlc3QvbW9kZXRlc3QuYyB8IDIzICsrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwpp
bmRleCA5Yzg1YzA3Yi4uNWEwNDE5MGMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0
ZXN0LmMKKysrIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwpAQCAtMjA0LDkgKzIwNCwxMCBA
QCBzdGF0aWMgdm9pZCBkdW1wX2VuY29kZXJzKHN0cnVjdCBkZXZpY2UgKmRldikKIAlwcmludGYo
IlxuIik7CiB9CiAKLXN0YXRpYyB2b2lkIGR1bXBfbW9kZShkcm1Nb2RlTW9kZUluZm8gKm1vZGUp
CitzdGF0aWMgdm9pZCBkdW1wX21vZGUoZHJtTW9kZU1vZGVJbmZvICptb2RlLCBpbnQgaW5kZXgp
CiB7Ci0JcHJpbnRmKCIgICVzICVkICVkICVkICVkICVkICVkICVkICVkICVkICVkIiwKKwlwcmlu
dGYoIiAgIyVpICVzICVkICVkICVkICVkICVkICVkICVkICVkICVkICVkIiwKKwkgICAgICAgaW5k
ZXgsCiAJICAgICAgIG1vZGUtPm5hbWUsCiAJICAgICAgIG1vZGUtPnZyZWZyZXNoLAogCSAgICAg
ICBtb2RlLT5oZGlzcGxheSwKQEAgLTQ0MywxMCArNDQ0LDEwIEBAIHN0YXRpYyB2b2lkIGR1bXBf
Y29ubmVjdG9ycyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAkJaWYgKGNvbm5lY3Rvci0+Y291bnRf
bW9kZXMpIHsKIAkJCXByaW50ZigiICBtb2RlczpcbiIpOwotCQkJcHJpbnRmKCJcdG5hbWUgcmVm
cmVzaCAoSHopIGhkaXNwIGhzcyBoc2UgaHRvdCB2ZGlzcCAiCisJCQlwcmludGYoIlx0aW5kZXgg
bmFtZSByZWZyZXNoIChIeikgaGRpc3AgaHNzIGhzZSBodG90IHZkaXNwICIKIAkJCSAgICAgICAi
dnNzIHZzZSB2dG90KVxuIik7CiAJCQlmb3IgKGogPSAwOyBqIDwgY29ubmVjdG9yLT5jb3VudF9t
b2RlczsgaisrKQotCQkJCWR1bXBfbW9kZSgmY29ubmVjdG9yLT5tb2Rlc1tqXSk7CisJCQkJZHVt
cF9tb2RlKCZjb25uZWN0b3ItPm1vZGVzW2pdLCBqKTsKIAkJfQogCiAJCWlmIChfY29ubmVjdG9y
LT5wcm9wcykgewpAQCAtNDc4LDcgKzQ3OSw3IEBAIHN0YXRpYyB2b2lkIGR1bXBfY3J0Y3Moc3Ry
dWN0IGRldmljZSAqZGV2KQogCQkgICAgICAgY3J0Yy0+YnVmZmVyX2lkLAogCQkgICAgICAgY3J0
Yy0+eCwgY3J0Yy0+eSwKIAkJICAgICAgIGNydGMtPndpZHRoLCBjcnRjLT5oZWlnaHQpOwotCQlk
dW1wX21vZGUoJmNydGMtPm1vZGUpOworCQlkdW1wX21vZGUoJmNydGMtPm1vZGUsIDApOwogCiAJ
CWlmIChfY3J0Yy0+cHJvcHMpIHsKIAkJCXByaW50ZigiICBwcm9wczpcbiIpOwpAQCAtODI5LDYg
KzgzMCwxNiBAQCBjb25uZWN0b3JfZmluZF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgdWludDMy
X3QgY29uX2lkLCBjb25zdCBjaGFyICptb2RlX3N0ciwKIAlpZiAoIWNvbm5lY3RvciB8fCAhY29u
bmVjdG9yLT5jb3VudF9tb2RlcykKIAkJcmV0dXJuIE5VTEw7CiAKKwkvKiBQaWNrIGJ5IEluZGV4
ICovCisJaWYgKG1vZGVfc3RyWzBdID09ICcjJykgeworCQlpbnQgaW5kZXggPSBhdG9pKG1vZGVf
c3RyICsgMSk7CisKKwkJaWYgKGluZGV4ID49IGNvbm5lY3Rvci0+Y291bnRfbW9kZXMpCisJCQly
ZXR1cm4gTlVMTDsKKwkJcmV0dXJuICZjb25uZWN0b3ItPm1vZGVzW2luZGV4XTsKKwl9CisKKwkv
KiBQaWNrIGJ5IE5hbWUgKi8KIAlmb3IgKGkgPSAwOyBpIDwgY29ubmVjdG9yLT5jb3VudF9tb2Rl
czsgaSsrKSB7CiAJCW1vZGUgPSAmY29ubmVjdG9yLT5tb2Rlc1tpXTsKIAkJaWYgKCFzdHJjbXAo
bW9kZS0+bmFtZSwgbW9kZV9zdHIpKSB7CkBAIC0xNzUyLDcgKzE3NjMsNyBAQCBzdGF0aWMgdm9p
ZCB1c2FnZShjaGFyICpuYW1lKQogCiAJZnByaW50ZihzdGRlcnIsICJcbiBUZXN0IG9wdGlvbnM6
XG5cbiIpOwogCWZwcmludGYoc3RkZXJyLCAiXHQtUCA8cGxhbmVfaWQ+QDxjcnRjX2lkPjo8dz54
PGg+Wys8eD4rPHk+XVsqPHNjYWxlPl1bQDxmb3JtYXQ+XVx0c2V0IGEgcGxhbmVcbiIpOwotCWZw
cmludGYoc3RkZXJyLCAiXHQtcyA8Y29ubmVjdG9yX2lkPlssPGNvbm5lY3Rvcl9pZD5dW0A8Y3J0
Y19pZD5dOjxtb2RlPlstPHZyZWZyZXNoPl1bQDxmb3JtYXQ+XVx0c2V0IGEgbW9kZVxuIik7CisJ
ZnByaW50ZihzdGRlcnIsICJcdC1zIDxjb25uZWN0b3JfaWQ+Wyw8Y29ubmVjdG9yX2lkPl1bQDxj
cnRjX2lkPl06WyM8bW9kZSBpbmRleD5dPG1vZGU+Wy08dnJlZnJlc2g+XVtAPGZvcm1hdD5dXHRz
ZXQgYSBtb2RlXG4iKTsKIAlmcHJpbnRmKHN0ZGVyciwgIlx0LUNcdHRlc3QgaHcgY3Vyc29yXG4i
KTsKIAlmcHJpbnRmKHN0ZGVyciwgIlx0LXZcdHRlc3QgdnN5bmNlZCBwYWdlIGZsaXBwaW5nXG4i
KTsKIAlmcHJpbnRmKHN0ZGVyciwgIlx0LXcgPG9ial9pZD46PHByb3BfbmFtZT46PHZhbHVlPlx0
c2V0IHByb3BlcnR5XG4iKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
