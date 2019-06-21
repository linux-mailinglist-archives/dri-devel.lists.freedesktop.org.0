Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C74F09E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 00:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD7E6E930;
	Fri, 21 Jun 2019 22:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477F86E92F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 22:07:00 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 19so4260417pfa.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 15:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EmfJxIuxZw+Qe5gMw8AUa2eDjQtUWl8JbQLdvI2SeRM=;
 b=f5ebZF30dAkT0DR/AinThyMFfSbvrDXTqmPmIyig78b8+G+eCv56gHPvoLYK7qHYAI
 kNNt60/EHBi8EcWZL8Z74mm+merJroGHx82+NMJ4Ub7mgVa8u2Bgz0ysIxnxCQHtg7KF
 EcgakWbAA5QgKVwO8lwIlDA92v4s/f9Sajz1JEd0nLKoqg3eqF8qU6V7athPcryc6iqw
 cDdnYxxY6HQ5HRvpfFgX5/4YrunskreD7E8XUWHA9JaphbUs15IxuIYOY2dj1QQceLad
 wHFiesXtA4xfWlqWyNxJTPVWnJR4V9dqNLXja7Bbz0HPRl7MUN6JKijXjwgaa8IMdPFo
 R+ig==
X-Gm-Message-State: APjAAAVfsnbvqoBJS/VKLz9ZKMqTr5IEB4X8xzLdmzYz3B7UMI2rsRJF
 1JktqfmvZKWHKimjsjzFz0RgXklrHRs=
X-Google-Smtp-Source: APXvYqwYmq3dhCHQogticsGtvYjcKhapfx6TjD59uIe9f2saSKMMM1AjeBZVqRXp4CmN+6QYfeFnFA==
X-Received: by 2002:a63:7118:: with SMTP id m24mr5569352pgc.159.1561154819278; 
 Fri, 21 Jun 2019 15:06:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 v10sm3563936pfe.163.2019.06.21.15.06.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 15:06:58 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [RFC][PATCH] libdrm: modetest: Allow selecting modes by index
Date: Fri, 21 Jun 2019 22:06:51 +0000
Message-Id: <20190621220651.62990-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=EmfJxIuxZw+Qe5gMw8AUa2eDjQtUWl8JbQLdvI2SeRM=;
 b=v60XcOqdtn2WYJM63RHZkBXcbutoxVAKaci/5HeVrBR0q70TK9Dg5BZP8a0+JRBKyX
 JWP7Ee5Re4RtEY+14k2HTVzVcwhMgz4uSr9bW7a/8dJRKSx0yFCzpemacBcqdcXhFQZo
 Pe0OUn13NdWR5m6SAbC3tkY6ZSClgeP9aFN3mRFQ1RLOwnSlExwDHDlqIsX/vyt5nyf2
 uALBGcENsHHqrXU/2Vv5kJNLr5o3bWyaHQdWlqGa7klblDpW70B572tglaV8UbV2ohQS
 4GbYvUKGKp9CftPQ74StsLublsyJKbUDA9DnvwjXUE44aYFkFxcP00aeKTRglFXGSBK2
 SoSg==
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
U2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQog
dGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYyB8IDIzICsrKysrKysrKysrKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9tb2RldGVzdC9tb2RldGVzdC5jIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3Qu
YwppbmRleCA5Yzg1YzA3Yi4uNGNhYjUwMTMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21vZGV0ZXN0L21v
ZGV0ZXN0LmMKKysrIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwpAQCAtMjA0LDkgKzIwNCwx
MCBAQCBzdGF0aWMgdm9pZCBkdW1wX2VuY29kZXJzKHN0cnVjdCBkZXZpY2UgKmRldikKIAlwcmlu
dGYoIlxuIik7CiB9CiAKLXN0YXRpYyB2b2lkIGR1bXBfbW9kZShkcm1Nb2RlTW9kZUluZm8gKm1v
ZGUpCitzdGF0aWMgdm9pZCBkdW1wX21vZGUoZHJtTW9kZU1vZGVJbmZvICptb2RlLCBpbnQgaW5k
ZXgpCiB7Ci0JcHJpbnRmKCIgICVzICVkICVkICVkICVkICVkICVkICVkICVkICVkICVkIiwKKwlw
cmludGYoIiAgIyVpICVzICVkICVkICVkICVkICVkICVkICVkICVkICVkICVkIiwKKwkgICAgICAg
aW5kZXgsCiAJICAgICAgIG1vZGUtPm5hbWUsCiAJICAgICAgIG1vZGUtPnZyZWZyZXNoLAogCSAg
ICAgICBtb2RlLT5oZGlzcGxheSwKQEAgLTQ0MywxMCArNDQ0LDEwIEBAIHN0YXRpYyB2b2lkIGR1
bXBfY29ubmVjdG9ycyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAkJaWYgKGNvbm5lY3Rvci0+Y291
bnRfbW9kZXMpIHsKIAkJCXByaW50ZigiICBtb2RlczpcbiIpOwotCQkJcHJpbnRmKCJcdG5hbWUg
cmVmcmVzaCAoSHopIGhkaXNwIGhzcyBoc2UgaHRvdCB2ZGlzcCAiCisJCQlwcmludGYoIlx0aW5k
ZXggbmFtZSByZWZyZXNoIChIeikgaGRpc3AgaHNzIGhzZSBodG90IHZkaXNwICIKIAkJCSAgICAg
ICAidnNzIHZzZSB2dG90KVxuIik7CiAJCQlmb3IgKGogPSAwOyBqIDwgY29ubmVjdG9yLT5jb3Vu
dF9tb2RlczsgaisrKQotCQkJCWR1bXBfbW9kZSgmY29ubmVjdG9yLT5tb2Rlc1tqXSk7CisJCQkJ
ZHVtcF9tb2RlKCZjb25uZWN0b3ItPm1vZGVzW2pdLCBqKTsKIAkJfQogCiAJCWlmIChfY29ubmVj
dG9yLT5wcm9wcykgewpAQCAtNDc4LDcgKzQ3OSw3IEBAIHN0YXRpYyB2b2lkIGR1bXBfY3J0Y3Mo
c3RydWN0IGRldmljZSAqZGV2KQogCQkgICAgICAgY3J0Yy0+YnVmZmVyX2lkLAogCQkgICAgICAg
Y3J0Yy0+eCwgY3J0Yy0+eSwKIAkJICAgICAgIGNydGMtPndpZHRoLCBjcnRjLT5oZWlnaHQpOwot
CQlkdW1wX21vZGUoJmNydGMtPm1vZGUpOworCQlkdW1wX21vZGUoJmNydGMtPm1vZGUsIDApOwog
CiAJCWlmIChfY3J0Yy0+cHJvcHMpIHsKIAkJCXByaW50ZigiICBwcm9wczpcbiIpOwpAQCAtODI5
LDYgKzgzMCwxNiBAQCBjb25uZWN0b3JfZmluZF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgdWlu
dDMyX3QgY29uX2lkLCBjb25zdCBjaGFyICptb2RlX3N0ciwKIAlpZiAoIWNvbm5lY3RvciB8fCAh
Y29ubmVjdG9yLT5jb3VudF9tb2RlcykKIAkJcmV0dXJuIE5VTEw7CiAKKwkvKiBQaWNrIGJ5IElu
ZGV4ICovCisJaWYgKCFzdHJuY21wKG1vZGVfc3RyLCIjIiwxKSkgeworCQlpbnQgaW5kZXggPSBh
dG9pKG1vZGVfc3RyICsgMSk7CisKKwkJaWYgKGluZGV4ID49IGNvbm5lY3Rvci0+Y291bnRfbW9k
ZXMpCisJCQlyZXR1cm4gTlVMTDsKKwkJcmV0dXJuICZjb25uZWN0b3ItPm1vZGVzW2luZGV4XTsK
Kwl9CisKKwkvKiBQaWNrIGJ5IE5hbWUgKi8KIAlmb3IgKGkgPSAwOyBpIDwgY29ubmVjdG9yLT5j
b3VudF9tb2RlczsgaSsrKSB7CiAJCW1vZGUgPSAmY29ubmVjdG9yLT5tb2Rlc1tpXTsKIAkJaWYg
KCFzdHJjbXAobW9kZS0+bmFtZSwgbW9kZV9zdHIpKSB7CkBAIC0xNzUyLDcgKzE3NjMsNyBAQCBz
dGF0aWMgdm9pZCB1c2FnZShjaGFyICpuYW1lKQogCiAJZnByaW50ZihzdGRlcnIsICJcbiBUZXN0
IG9wdGlvbnM6XG5cbiIpOwogCWZwcmludGYoc3RkZXJyLCAiXHQtUCA8cGxhbmVfaWQ+QDxjcnRj
X2lkPjo8dz54PGg+Wys8eD4rPHk+XVsqPHNjYWxlPl1bQDxmb3JtYXQ+XVx0c2V0IGEgcGxhbmVc
biIpOwotCWZwcmludGYoc3RkZXJyLCAiXHQtcyA8Y29ubmVjdG9yX2lkPlssPGNvbm5lY3Rvcl9p
ZD5dW0A8Y3J0Y19pZD5dOjxtb2RlPlstPHZyZWZyZXNoPl1bQDxmb3JtYXQ+XVx0c2V0IGEgbW9k
ZVxuIik7CisJZnByaW50ZihzdGRlcnIsICJcdC1zIDxjb25uZWN0b3JfaWQ+Wyw8Y29ubmVjdG9y
X2lkPl1bQDxjcnRjX2lkPl06WyM8bW9kZSBpbmRleD5dPG1vZGU+Wy08dnJlZnJlc2g+XVtAPGZv
cm1hdD5dXHRzZXQgYSBtb2RlXG4iKTsKIAlmcHJpbnRmKHN0ZGVyciwgIlx0LUNcdHRlc3QgaHcg
Y3Vyc29yXG4iKTsKIAlmcHJpbnRmKHN0ZGVyciwgIlx0LXZcdHRlc3QgdnN5bmNlZCBwYWdlIGZs
aXBwaW5nXG4iKTsKIAlmcHJpbnRmKHN0ZGVyciwgIlx0LXcgPG9ial9pZD46PHByb3BfbmFtZT46
PHZhbHVlPlx0c2V0IHByb3BlcnR5XG4iKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
