Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BF1CF02E
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 11:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2626E8BB;
	Tue, 12 May 2020 09:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E176E8C1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 09:00:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l17so794109wrr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 02:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6eMxQ6gGsP+PGOv8CvoIWRRS5TJUyI8UxMjiqc47Mo=;
 b=PnuV7xflEjOlvfaUhZ+KpylEZ6B+nAuxnCL/fVvuzcQE1nkl8ut88s1ez31P+4ljF4
 iSgH127tca2DU8l3HJWyuwwLmSRVfbD3QBzO1HejgP3sc52tGIzmsdHjyMsMiHc5wDaC
 KKhsrvU1VK5jPM+f5/epbuW0a2Bm2UKTZqW0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6eMxQ6gGsP+PGOv8CvoIWRRS5TJUyI8UxMjiqc47Mo=;
 b=nODxnRVzfdTKZ0m6IUavE4xA06nb1gAbhVw1jDTRpc7ujihEKT+Xh4lKhdLI1uXLHc
 1RNoWkYUSCip9nKDuy5bcp5JUn2bsKuBQc7lV3H2fwcdwbWCIIiyAKIWIKiE3wWYci6U
 ZnMt5OrUqUnoX9BD51PR1ls0hUKLU/882QtU0ThMkPByvZ5uHc4QkfoyCjFZwRnrcmD/
 vfEb/vHUFhfS33Uu0ICi7GBX8fQPOk0BwYfl579reKswG2jgUaZ/rSIM3W6tactvZQCy
 Msr0iBSSDlNkroIT1lCLgvC0WN5rk425ORHg0MXFAeVwBwqjKRbneIVdJvVt2yQR9rNz
 b9cA==
X-Gm-Message-State: AGi0PubAZs9Q9X0OTXBCFXl7jFOKKuV9+7PbSXxpCQ4yqeYQAOeSsGbh
 3k7DydAnhgdrGAqE5cA/h99W3xubvs4=
X-Google-Smtp-Source: APiQypLQNaARhwh4BlYnWAU5WfsoUDeU0pdENYNXKn3KrAt4Qe7dKmRwhwnGgQvcs+0sUHauBpwL7w==
X-Received: by 2002:adf:e751:: with SMTP id c17mr25218165wrn.351.1589274009683; 
 Tue, 12 May 2020 02:00:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:00:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [RFC 12/17] drm/amdgpu/dc: Stop dma_resv_lock inversion in commit_tail
Date: Tue, 12 May 2020 10:59:39 +0200
Message-Id: <20200512085944.222637-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJ5aW5nIHRvIGdyYWIgZG1hX3Jlc3ZfbG9jayB3aGlsZSBpbiBjb21taXRfdGFpbCBiZWZvcmUg
d2UndmUgZG9uZQphbGwgdGhlIGNvZGUgdGhhdCBsZWFkcyB0byB0aGUgZXZlbnR1YWwgc2lnbmFs
bGluZyBvZiB0aGUgdmJsYW5rIGV2ZW50Cih3aGljaCBjYW4gYmUgYSBkbWFfZmVuY2UpIGlzIGRl
YWRsb2NrLXkuIERvbid0IGRvIHRoYXQuCgpIZXJlIHRoZSBzb2x1dGlvbiBpcyBlYXN5IGJlY2F1
c2UganVzdCBncmFiYmluZyBsb2NrcyB0byByZWFkCnNvbWV0aGluZyByYWNlcyBhbnl3YXkuIFdl
IGRvbid0IG5lZWQgdG8gYm90aGVyLCBSRUFEX09OQ0UgaXMKZXF1aXZhbGVudC4gQW5kIGF2b2lk
cyB0aGUgbG9ja2luZyBpc3N1ZS4KCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6
IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAxMCAr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDliZmFh
NGNhZDQ4My4uMjhlMWFmOWY4MjNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTY2OTksNyArNjY5OSwxMSBAQCBzdGF0aWMg
dm9pZCBhbWRncHVfZG1fY29tbWl0X3BsYW5lcyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3Rh
dGUsCiAJCSAqIGV4cGxpY2l0bHkgb24gZmVuY2VzIGluc3RlYWQKIAkJICogYW5kIGluIGdlbmVy
YWwgc2hvdWxkIGJlIGNhbGxlZCBmb3IKIAkJICogYmxvY2tpbmcgY29tbWl0IHRvIGFzIHBlciBm
cmFtZXdvcmsgaGVscGVycworCQkgKgorCQkgKiBZZXMsIHRoaXMgZGVhZGxvY2tzLCBzaW5jZSB5
b3UncmUgY2FsbGluZyBkbWFfcmVzdl9sb2NrIGluIGEKKwkJICogcGF0aCB0aGF0IGxlYWRzIHRv
IGEgZG1hX2ZlbmNlX3NpZ25hbCgpLiBEb24ndCBkbyB0aGF0LgogCQkgKi8KKyNpZiAwCiAJCXIg
PSBhbWRncHVfYm9fcmVzZXJ2ZShhYm8sIHRydWUpOwogCQlpZiAodW5saWtlbHkociAhPSAwKSkK
IAkJCURSTV9FUlJPUigiZmFpbGVkIHRvIHJlc2VydmUgYnVmZmVyIGJlZm9yZSBmbGlwXG4iKTsK
QEAgLTY3MDksNiArNjcxMywxMiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29tbWl0X3BsYW5l
cyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJCXRtel9zdXJmYWNlID0gYW1kZ3B1
X2JvX2VuY3J5cHRlZChhYm8pOwogCiAJCWFtZGdwdV9ib191bnJlc2VydmUoYWJvKTsKKyNlbmRp
ZgorCQkvKgorCQkgKiB0aGlzIHJhY2VzIGFueXdheSwgc28gUkVBRF9PTkNFIGlzbid0IGFueSBi
ZXR0ZXIgb3Igd29yc2UKKwkJICogdGhhbiB0aGUgc3R1ZmYgYWJvdmUuIEV4Y2VwdCB0aGUgc3R1
ZmYgYWJvdmUgY2FuIGRlYWRsb2NrLgorCQkgKi8KKwkJdGlsaW5nX2ZsYWdzID0gUkVBRF9PTkNF
KGFiby0+dGlsaW5nX2ZsYWdzKTsKIAogCQlmaWxsX2RjX3BsYW5lX2luZm9fYW5kX2FkZHIoCiAJ
CQlkbS0+YWRldiwgbmV3X3BsYW5lX3N0YXRlLCB0aWxpbmdfZmxhZ3MsCi0tIAoyLjI2LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
