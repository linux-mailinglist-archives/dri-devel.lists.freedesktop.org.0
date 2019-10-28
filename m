Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6236E7172
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FAF6E81E;
	Mon, 28 Oct 2019 12:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1116E81E
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:37:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w18so9725261wrt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6jAETuFf+roFoMMRMhX/zKde2GbyLswiJsVFqHMPnLg=;
 b=qK3LeoL9QYUl7h1hpdcbqCxRIaR6gACi0okCzC2Oni8PC2XxaAmSSu9kMsdQVkcZTY
 zPZvh57FkVYBcE7suNhsfaLwADyFuoE35O7TVY3+9QmLTtenMgaf9GLCX0ubQlDNN3Ha
 Sjf8/R1yORK43+QZ3vX+p/dWs+II140iSqP7rsj7g/VsUY7Vvol7EuIJkZNCstNiKwiB
 4XFUOwCJUFfFDfXLQ/m96Tn/q6GpbaTE2XoRYFxsFDICKyeSrNAEkgAq+fXrMsx6iLRt
 LTfMOFABxxYJFHrMTo4KNdIOvVwpNXhLILlZTl4EcG4ow1+oalxqgCUNfNH/9i2FZIiA
 OOKA==
X-Gm-Message-State: APjAAAVwBxAUuMJf04EwZGL1uvafTaevtqsbKdGURSV3HK+x18EQspCg
 UfPdLjrllBVsiSVvG5BK35y26mrI
X-Google-Smtp-Source: APXvYqxx/dmQYEYE/WkvloYY3t2QSmY0mSX+m9bywcAPzviQk1/HzYNjDz3YrI52nTsVJ6wHIi76Dg==
X-Received: by 2002:a05:6000:10d:: with SMTP id
 o13mr14456404wrx.321.1572266241346; 
 Mon, 28 Oct 2019 05:37:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c21sm10483174wmb.46.2019.10.28.05.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 05:37:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 00/12] drm/tegra: Support IOMMU-backed DMA API
Date: Mon, 28 Oct 2019 13:37:06 +0100
Message-Id: <20191028123718.3890217-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6jAETuFf+roFoMMRMhX/zKde2GbyLswiJsVFqHMPnLg=;
 b=U3Lzu5G7veVfI68uRWdSpFeid+7/B4JhM6RnnBxQYyBXEvkP2MS0DPkiBlb9mdczdx
 fpLkiCziXz2ORSYVpoiCffEQx+SsqBqLEOdKEQ8WesyvLMqKpacj1w5ObH2N0nlYijF1
 IPlSvqRubRpi9lcY2l/+vEEzEt3tUjGovmQunBMeprrQTcmhYBXE9ZdQQZ9RuIZEmQIj
 o7G1YaXv3E3zfwrvyu5iMyjB+oVFjgV0GGDW1nFEr4r/QSgrr0mgBpjUfus5p+3NeNAC
 l1Jd6wukOQqr58kh0xyCVDKFXu2nbbRdzW0VCfdqEuYBGhXFqG8KQ+pKABzscJdwKjOq
 y0rw==
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
 dri-devel@lists.freedesktop.org, Puneet Saxena <puneets@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoaXMgc2VyaWVzIGlz
IGEgY29udGludWF0aW9uIG9mIHRoZSB3b3JrIHRvIG1vdmUgaG9zdDF4IGFuZCBUZWdyYSBEUk0K
dG93YXJkcyBiZWluZyBhYmxlIHRvIHVzZSB0aGUgSU9NTVUtYmFja2VkIERNQSBBUEkuCgpUaGUg
Zmlyc3QgdHdvIHBhdGNoZXMgYXJlIHJlcXVpcmVkIHRvIHdvcmthcm91bmQgdGhlIHNob3J0YWdl
IG9mIElPTU1VCmRvbWFpbnMgb24gb2xkZXIgVGVncmEgU29DIGdlbmVyYXRpb25zLiBUaGUgcmVt
YWluZGVyIG9mIHRoZSBwYXRjaGVzIGlzCm1vc3RseSBwcmVwYXJhdG9yeSB3b3JrIHRvIHNtb290
aGVuIHRoZSB0cmFuc2l0aW9uIHRvIHRoZSBETUEgQVBJLiBXaXRoCmFsbCBvZiB0aGVzZSBwYXRj
aGVzIGFwcGxpZWQsIGl0J3MgcG9zc2libGUgZm9yIHRoZSBkcml2ZXJzIHRvIGVpdGhlcgp1c2Ug
dGhlIElPTU1VIEFQSSBleHBsaWNpdGx5LCBvciwgaWYgYWxyZWFkeSBhdHRhY2hlZCB0byBhbiBE
TUEgSU9NTVUKZG9tYWluLCBjb250aW51ZSB0byB1c2UgdGhhdCBleGlzdGluZyBtYXBwaW5nIHdp
dGggdGhlIERNQSBBUEkuCgpUaGVzZSBwYXRjaGVzIGFwcGx5IG9uIHRvcCBvZiBsaW51eC1uZXh0
IGFuZCB0aGUgLT5sb2FkKCkvLT51bmxvYWQoKQpyZW1vdmFsIHBhdGNoIGZyb20gaGVyZToKCglo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzM3ODk2LwoKVGhpZXJyeQoK
VGhpZXJyeSBSZWRpbmcgKDEyKToKICBtZW1vcnk6IHRlZ3JhOiBBZGQgZ3IyZCBhbmQgZ3IzZCB0
byBEUk0gSU9NTVUgZ3JvdXAKICBkcm0vdGVncmE6IFNpbXBsaWZ5IElPTU1VIGdyb3VwIHNlbGVj
dGlvbgogIGdwdTogaG9zdDF4OiBPdmVyaGF1bCBob3N0MXhfYm9fe3Bpbix1bnBpbn0oKSBBUEkK
ICBncHU6IGhvc3QxeDogQ2xlYW4gdXAgZGVidWdmcyBvbiByZW1vdmFsCiAgZ3B1OiBob3N0MXg6
IEFkZCBkaXJlY3Rpb24gZmxhZ3MgdG8gcmVsb2NhdGlvbnMKICBncHU6IGhvc3QxeDogQWxsb2Nh
dGUgZ2F0aGVyIGNvcHkgZm9yIGhvc3QxeAogIGdwdTogaG9zdDF4OiBTdXBwb3J0IERNQSBtYXBw
aW5nIG9mIGJ1ZmZlcnMKICBncHU6IGhvc3QxeDogU2V0IERNQSBtYXNrIGJhc2VkIG9uIElPTU1V
IHNldHVwCiAgZHJtL3RlZ3JhOiBSZW1vdmUgbWVtb3J5IGFsbG9jYXRpb24gZnJvbSBGYWxjb24g
bGlicmFyeQogIGRybS90ZWdyYTogZmFsY29uOiBDbGFyaWZ5IGFkZHJlc3MgdXNhZ2UKICBkcm0v
dGVncmE6IFN1cHBvcnQgRE1BIEFQSSBmb3IgZGlzcGxheSBjb250cm9sbGVycwogIGRybS90ZWdy
YTogT3B0aW9uYWxseSBhdHRhY2ggY2xpZW50cyB0byB0aGUgSU9NTVUKCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZGMuYyAgICAgIHwgIDEwICstCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMg
ICAgIHwgIDgyICsrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5oICAgICB8
ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZhbGNvbi5jICB8ICA2NCArKy0tLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYWxjb24uaCAgfCAgMTYgKy0tCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZ2VtLmMgICAgIHwgIDQ2ICsrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9n
cjJkLmMgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9ncjNkLmMgICAgfCAgIDIg
Ky0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9odWIuYyAgICAgfCAgIDYgKy0KIGRyaXZlcnMvZ3B1
L2RybS90ZWdyYS9wbGFuZS5jICAgfCAxMDQgKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvcGxhbmUuaCAgIHwgICA4ICsrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMg
ICAgIHwgIDkxICsrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2hvc3QxeC9kZXYuYyAgICAgICAg
fCAyMjMgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2hvc3Qx
eC9kZXYuaCAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvaG9zdDF4L2pvYi5jICAgICAgICB8
ICA5MSArKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9ob3N0MXgvam9iLmggICAgICAgIHwgICA0
ICsKIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTE0LmMgfCAgMTAgKy0KIGRyaXZlcnMvbWVt
b3J5L3RlZ3JhL3RlZ3JhMTI0LmMgfCAgIDggKy0KIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3Jh
MzAuYyAgfCAgMTEgKy0KIGluY2x1ZGUvbGludXgvaG9zdDF4LmggICAgICAgICAgfCAgMjEgKyst
CiAyMCBmaWxlcyBjaGFuZ2VkLCA1NTIgaW5zZXJ0aW9ucygrKSwgMjUyIGRlbGV0aW9ucygtKQoK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
