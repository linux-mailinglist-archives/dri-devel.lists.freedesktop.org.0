Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BCE58D36
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 23:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE17E6E84C;
	Thu, 27 Jun 2019 21:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B776E84C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 21:37:13 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id j2so1860485pfe.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 14:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lnYGFx8CYsH6vPjtWwJaAsoQv2lSpTxEyZZY8jL5vW4=;
 b=M3nbI79dIAr7BPFOqMIygfS6Rqr/+HjyBLuPjO59ymgAuhvSXGrlVHjBgMzdF588yK
 qDDC1RaXb6iNoJoLnDfK8yQHSeas6AxYGbWVYaE4q8GHA+2wxIZaDXyHMm+864yMOqWm
 2NmoIlj09go+Ap+co44dnKitTD3dMbWJVrUJYv58RHf0jFkCkSdKI+QuT0XeFnVLjf/r
 GBs4hRLCpYEXitGF4/K8O/5OGicShyaVOgtZi7PguXG+aStYwTpAPDHD2sheiIa0gEZK
 /F09mLMK75PVMqNAnEXWv9xyh8VWslodhMCfW+713DH5UNieIVa1IyRjfodfuhC57yBy
 JBtg==
X-Gm-Message-State: APjAAAV9vEHX8CSF0E3iQL9yWK0nznJG4ALCthTkXpIm5YyoP9+zUSPF
 SGVz2Kg9ARs8/+O32rK6MxbimfRIFFo=
X-Google-Smtp-Source: APXvYqzY9KfA/DPuUq0A6665WMnGE5zQtZi5aTJobFd/CJsCQRAK+MKmlKJympq0hV3h0DoStErXsA==
X-Received: by 2002:a65:50cb:: with SMTP id s11mr5778345pgp.371.1561671432655; 
 Thu, 27 Jun 2019 14:37:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id a4sm56288pff.9.2019.06.27.14.37.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 14:37:11 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3] libdrm: modetest: Allow selecting modes by index
Date: Thu, 27 Jun 2019 21:37:07 +0000
Message-Id: <20190627213707.46094-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=lnYGFx8CYsH6vPjtWwJaAsoQv2lSpTxEyZZY8jL5vW4=;
 b=qV7s6bLTLwTMcfMAeuufxfY9ClWV5jsO+sI8rRv/8h/LCMIaQJaTtcKgONtxUrMHXq
 wAOWhYb/9icet5V6Azfcc7IrWzquCuHDCmuDTO0ND/EL7uD55fRZyhsUiunQzE3wqViK
 SQYQOvUCqx8eKSHn4r+O+a4zPi5+tWu3zPpB6Tq6mFVtdDWOsABFbX6lNkv6rk3Ve/U4
 5Qx/WWeCKirAFfSHcpUxNNB9+WFdOmjv9EKL5F1kDV1FztpbfhhIzsvhD9TcYbf7qJ+T
 3vkKLTUZt8X4VkFfJuiJhGS+7HGIGUG2H8cjbMj5V+QKudRULmU10Q77XZtWui6+WfeE
 eufA==
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
UmV2aWV3ZWQtYnk6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KU2lnbmVkLW9m
Zi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQp2MjogUmV3b3Jr
ZWQgbW9kZV9zdHIgY2hlY2sgcGVyIElsaWEncyBzdWdnZXN0aW9uCnYzOiBBZGRlZCBpbmRleCA8
IDAgY2hlY2sgcGVyIElsaWEncyBzdWdnZXN0aW9uCi0tLQogdGVzdHMvbW9kZXRlc3QvbW9kZXRl
c3QuYyB8IDIzICsrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9tb2RldGVzdC9t
b2RldGVzdC5jIGIvdGVzdHMvbW9kZXRlc3QvbW9kZXRlc3QuYwppbmRleCA5Yzg1YzA3Yi4uNWUx
YjYyM2EgMTAwNjQ0Ci0tLSBhL3Rlc3RzL21vZGV0ZXN0L21vZGV0ZXN0LmMKKysrIGIvdGVzdHMv
bW9kZXRlc3QvbW9kZXRlc3QuYwpAQCAtMjA0LDkgKzIwNCwxMCBAQCBzdGF0aWMgdm9pZCBkdW1w
X2VuY29kZXJzKHN0cnVjdCBkZXZpY2UgKmRldikKIAlwcmludGYoIlxuIik7CiB9CiAKLXN0YXRp
YyB2b2lkIGR1bXBfbW9kZShkcm1Nb2RlTW9kZUluZm8gKm1vZGUpCitzdGF0aWMgdm9pZCBkdW1w
X21vZGUoZHJtTW9kZU1vZGVJbmZvICptb2RlLCBpbnQgaW5kZXgpCiB7Ci0JcHJpbnRmKCIgICVz
ICVkICVkICVkICVkICVkICVkICVkICVkICVkICVkIiwKKwlwcmludGYoIiAgIyVpICVzICVkICVk
ICVkICVkICVkICVkICVkICVkICVkICVkIiwKKwkgICAgICAgaW5kZXgsCiAJICAgICAgIG1vZGUt
Pm5hbWUsCiAJICAgICAgIG1vZGUtPnZyZWZyZXNoLAogCSAgICAgICBtb2RlLT5oZGlzcGxheSwK
QEAgLTQ0MywxMCArNDQ0LDEwIEBAIHN0YXRpYyB2b2lkIGR1bXBfY29ubmVjdG9ycyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiAKIAkJaWYgKGNvbm5lY3Rvci0+Y291bnRfbW9kZXMpIHsKIAkJCXByaW50
ZigiICBtb2RlczpcbiIpOwotCQkJcHJpbnRmKCJcdG5hbWUgcmVmcmVzaCAoSHopIGhkaXNwIGhz
cyBoc2UgaHRvdCB2ZGlzcCAiCisJCQlwcmludGYoIlx0aW5kZXggbmFtZSByZWZyZXNoIChIeikg
aGRpc3AgaHNzIGhzZSBodG90IHZkaXNwICIKIAkJCSAgICAgICAidnNzIHZzZSB2dG90KVxuIik7
CiAJCQlmb3IgKGogPSAwOyBqIDwgY29ubmVjdG9yLT5jb3VudF9tb2RlczsgaisrKQotCQkJCWR1
bXBfbW9kZSgmY29ubmVjdG9yLT5tb2Rlc1tqXSk7CisJCQkJZHVtcF9tb2RlKCZjb25uZWN0b3It
Pm1vZGVzW2pdLCBqKTsKIAkJfQogCiAJCWlmIChfY29ubmVjdG9yLT5wcm9wcykgewpAQCAtNDc4
LDcgKzQ3OSw3IEBAIHN0YXRpYyB2b2lkIGR1bXBfY3J0Y3Moc3RydWN0IGRldmljZSAqZGV2KQog
CQkgICAgICAgY3J0Yy0+YnVmZmVyX2lkLAogCQkgICAgICAgY3J0Yy0+eCwgY3J0Yy0+eSwKIAkJ
ICAgICAgIGNydGMtPndpZHRoLCBjcnRjLT5oZWlnaHQpOwotCQlkdW1wX21vZGUoJmNydGMtPm1v
ZGUpOworCQlkdW1wX21vZGUoJmNydGMtPm1vZGUsIDApOwogCiAJCWlmIChfY3J0Yy0+cHJvcHMp
IHsKIAkJCXByaW50ZigiICBwcm9wczpcbiIpOwpAQCAtODI5LDYgKzgzMCwxNiBAQCBjb25uZWN0
b3JfZmluZF9tb2RlKHN0cnVjdCBkZXZpY2UgKmRldiwgdWludDMyX3QgY29uX2lkLCBjb25zdCBj
aGFyICptb2RlX3N0ciwKIAlpZiAoIWNvbm5lY3RvciB8fCAhY29ubmVjdG9yLT5jb3VudF9tb2Rl
cykKIAkJcmV0dXJuIE5VTEw7CiAKKwkvKiBQaWNrIGJ5IEluZGV4ICovCisJaWYgKG1vZGVfc3Ry
WzBdID09ICcjJykgeworCQlpbnQgaW5kZXggPSBhdG9pKG1vZGVfc3RyICsgMSk7CisKKwkJaWYg
KGluZGV4ID49IGNvbm5lY3Rvci0+Y291bnRfbW9kZXMgfHwgaW5kZXggPCAwKQorCQkJcmV0dXJu
IE5VTEw7CisJCXJldHVybiAmY29ubmVjdG9yLT5tb2Rlc1tpbmRleF07CisJfQorCisJLyogUGlj
ayBieSBOYW1lICovCiAJZm9yIChpID0gMDsgaSA8IGNvbm5lY3Rvci0+Y291bnRfbW9kZXM7IGkr
KykgewogCQltb2RlID0gJmNvbm5lY3Rvci0+bW9kZXNbaV07CiAJCWlmICghc3RyY21wKG1vZGUt
Pm5hbWUsIG1vZGVfc3RyKSkgewpAQCAtMTc1Miw3ICsxNzYzLDcgQEAgc3RhdGljIHZvaWQgdXNh
Z2UoY2hhciAqbmFtZSkKIAogCWZwcmludGYoc3RkZXJyLCAiXG4gVGVzdCBvcHRpb25zOlxuXG4i
KTsKIAlmcHJpbnRmKHN0ZGVyciwgIlx0LVAgPHBsYW5lX2lkPkA8Y3J0Y19pZD46PHc+eDxoPlsr
PHg+Kzx5Pl1bKjxzY2FsZT5dW0A8Zm9ybWF0Pl1cdHNldCBhIHBsYW5lXG4iKTsKLQlmcHJpbnRm
KHN0ZGVyciwgIlx0LXMgPGNvbm5lY3Rvcl9pZD5bLDxjb25uZWN0b3JfaWQ+XVtAPGNydGNfaWQ+
XTo8bW9kZT5bLTx2cmVmcmVzaD5dW0A8Zm9ybWF0Pl1cdHNldCBhIG1vZGVcbiIpOworCWZwcmlu
dGYoc3RkZXJyLCAiXHQtcyA8Y29ubmVjdG9yX2lkPlssPGNvbm5lY3Rvcl9pZD5dW0A8Y3J0Y19p
ZD5dOlsjPG1vZGUgaW5kZXg+XTxtb2RlPlstPHZyZWZyZXNoPl1bQDxmb3JtYXQ+XVx0c2V0IGEg
bW9kZVxuIik7CiAJZnByaW50ZihzdGRlcnIsICJcdC1DXHR0ZXN0IGh3IGN1cnNvclxuIik7CiAJ
ZnByaW50ZihzdGRlcnIsICJcdC12XHR0ZXN0IHZzeW5jZWQgcGFnZSBmbGlwcGluZ1xuIik7CiAJ
ZnByaW50ZihzdGRlcnIsICJcdC13IDxvYmpfaWQ+Ojxwcm9wX25hbWU+Ojx2YWx1ZT5cdHNldCBw
cm9wZXJ0eVxuIik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
