Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DFDA911
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0C6E471;
	Thu, 17 Oct 2019 09:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C726E471
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 09:48:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n14so1553357wrw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 02:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycCmZDffE4SSe1RIfJEgO6drqf4qkUDKv8PrM8jzmGs=;
 b=SHOH0HTmaSbH7zYYXpjLdhySsscbMmxXpNe5M4MUt5+6H5jGK/glNH90yveff0/CiD
 dpzUngfdxl8X0D7mP9M/wydWvljW6ohWYHGrbJokB5QMvlVbyUkMIe1PkMl0e9qaxCWu
 bVISt2ze/mByY0C1h25nSDvjpDGhnd7Tbjzm7OxCkaNx7kbBs8kGXyO3PK+4XI0DSAvA
 h8NXtb6TI1TZ6GqVhwIdrqnzAppldi3NP+CWGZUcKhJuoW2wI7H4OzXnwlkh3M8YYdlc
 EsU0u6kOg7soGCv17r0qdnAlKzI9Yin0VpWFyWZViqYjs2vhauMEQ4j/Qnm0w5/2gJ3D
 FIhA==
X-Gm-Message-State: APjAAAXI4e9lW6kHYwIKth+Pufsls+FwUHkC473+6AhL7duqqfPH7ImC
 FWjmF8/zFAszdjLxLDZsBpCy4fKw4ysJ6g==
X-Google-Smtp-Source: APXvYqz7lZeF4JPmS/79/W03GEEs4vSLOmEToTSvkJdKYaxmzoCNaHLXPQWRtoZxQiaqzU8AiTTmsQ==
X-Received: by 2002:adf:92e7:: with SMTP id 94mr2311076wrn.199.1571305711121; 
 Thu, 17 Oct 2019 02:48:31 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t83sm2764506wmt.18.2019.10.17.02.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 02:48:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/meson: implement RDMA for AFBC reset on vsync
Date: Thu, 17 Oct 2019 11:48:23 +0200
Message-Id: <20191017094826.21552-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ycCmZDffE4SSe1RIfJEgO6drqf4qkUDKv8PrM8jzmGs=;
 b=Q5lA972D7OIIkFBlV5IpEVNZrb3KvRhz42JwEx9gFIFhMJIEh7PRi51gHsbX+wVRxD
 PZdmgX4rNQCIkN/h9XwxrMRc5ZAdx0B38BM9AGTBua1KG2hpq0tfxa+ou7YncWQ5eQD8
 ByFlhwF5PxIEgeShlB+E4flH+rb5F54YoLfjJSbRtf9T+dvI5PjcV+LPVXKxm+SPrapo
 FSxLHrw/dLIteXR99i8EOR6s0EDwU7VPXxUVkvKBi+p3lMLg6ChAWalbPShydhGdVTTo
 c2V9aTiYgVRHJyee9Is2v0Jor6zmPb6TEq/YV68iBVZB21b0vLXVaHPLbsMKnoEKQ9Wx
 JqRw==
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFZQVSBlbWJlZHMgYSAiUmVnaXN0ZXIgRE1BIiB0aGF0IGNhbiB3cml0ZSBhIHNlcXVlbmNl
IG9mIHJlZ2lzdGVycwpvbiB0aGUgVlBVIEFIQiBidXMsIGVpdGhlciBtYW51YWxseSBvciB0cmln
Z2VyZWQgYnkgYW4gaW50ZXJuYWwgSVJRCmV2ZW50IGxpa2UgVlNZTkMgb3IgYSBsaW5lIGlucHV0
IGNvdW50ZXIuCgpUaGUgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiBoYW5kbGVzIGEgc2luZ2xlIGNo
YW5uZWwgKG92ZXIgOCksIHRyaWdnZXJlZApieSB0aGUgVlNZTkMgaXJxIGFuZCBkb2VzIG5vdCBo
YW5kbGUgdGhlIFJETUEgaXJxLgoKVGhlIFJETUEgd2lsbCBiZSB1c2VmdWxsIHRvIHJlc2V0IGFu
ZCBwcm9ncmFtIHRoZSBBRkJDIGRlY29kZXIgdW5pdApvbiBlYWNoIHZzeW5jIHdpdGhvdXQgaW52
b2x2aW5nIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0aGF0IGNhbgpiZSBtYXNrZWQgZm9yIGEgbG9u
ZyBwZXJpb2Qgb2YgdGltZSwgcHJvZHVjaW5nIGRpc3BsYXkgZ2xpdGNoZXMuCgpGb3IgdGhpcyB3
ZSB1c2UgdGhlIG1lc29uX3JkbWFfd3JpdGVsX3N5bmMoKSB3aGljaCBhZGRzIHRoZSByZWdpc3Rl
cgp3cml0ZSB0dXBsZSAoVlBVIHJlZ2lzdGVyIG9mZnNldCBhbmQgcmVnaXN0ZXIgdmFsdWUpIHRv
IHRoZSBSRE1BIGJ1ZmZlcgphbmQgd3JpdGUgdGhlIHZhbHVlIHRvIHRoZSBIVy4KCldoZW4gZW5h
YmxlZCwgdGhlIFJETUEgaXMgZW5hYmxlZCB0byByZXdyaXR0ZSB0aGUgc2FtZSBzZXF1ZW5jZSBh
dCB0aGUKbmV4dCBWU1lOQyBldmVudCwgdW50aWwgYSBuZXcgYnVmZmVyIGlzIGNvbW1pdHRlZCB0
byB0aGUgT1NEIHBsYW5lLgoKVGhlIHRoZSBBbWxvZ2ljIEcxMkEgaXMgc3dpdGNoZWQgdG8gUkRN
QSwgdGhlIEFtbG9naWMgR1hNIERlY29kZXIKZG9lc24ndCBuZWVkIGEgcmVzZXQvcmVwcm9ncmFt
IGF0IGVhY2ggdnN5bmMuCgpDaGFuZ2VzIHNpbmNlIHYxIGF0IFsxXToKLSBGaXhlZCBhIHJlZ3Jl
c3Npb24gd2hlbiBBRkJDIHdhcyBub3QgdXNlZCwgYWRkaW5nIGEgcmVzZXQoKSBjYWxsIGZvciB0
aGUgYWZiYyBtb2R1bGUKLSBBZGRlZCBhIGRlZmluZSBmb3IgdGhlIFJETUEgZGVzY3JpcHRvciBz
aXplCi0gRml4ZWQgb3ZlcmZsb3cgZGV0ZWN0aW9uCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy82ODAyMS8jcmV2MQoKTmVpbCBBcm1zdHJvbmcgKDMpOgogIGRy
bS9tZXNvbjogYWRkIFJETUEgcmVnaXN0ZXIgYml0cyBkZWZpbmVzCiAgZHJtL21lc29uOiBhZGQg
UkRNQSBtb2R1bGUgZHJpdmVyCiAgZHJtL21lc29uOiB1c2UgUkRNQSB0byByZWNvbmZpZ3VyZSBB
RkJDIG9uIHZzeW5jCgogZHJpdmVycy9ncHUvZHJtL21lc29uL01ha2VmaWxlICAgICAgICAgIHwg
ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fY3J0Yy5jICAgICAgfCAgMjcgKyst
LS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYyAgICAgICB8ICAxNCArKy0KIGRy
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuaCAgICAgICB8ICAgNiArKwogZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX29zZF9hZmJjZC5jIHwgMTAwICsrKysrKysrKystLS0tLS0tLQog
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JkbWEuYyAgICAgIHwgMTMyICsrKysrKysrKysr
KysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3JkbWEuaCAgICAgIHwg
IDIxICsrKysKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZWdpc3RlcnMuaCB8ICA0OCAr
KysrKysrKysKIDggZmlsZXMgY2hhbmdlZCwgMjgzIGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9yZG1h
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmRtYS5o
CgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
