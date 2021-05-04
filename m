Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6E372AF6
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB86F6EAD6;
	Tue,  4 May 2021 13:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F976E442
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:34 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y7so13136848ejj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NHm+ZFPJ9DE+vEHPzRqOrLbYfvk1y1Gjl7YgQatO0w0=;
 b=cyyv+HNzJND4FWdNmhiPn8Q1QJuowaELAbeNoJb22pT6Lbej0V9kJkVCqwpuME730O
 eSul+/MUqFQ6IkZhFQ4e2UYmAEiJZE/ZSuTJ3uOOcEqqUbR7/josC2mJHMd4PQvR6KeF
 4E4qv5Lax687oqHUf9oQlEjKt7VdZ7PL1iNNQkRS/0YZnYqYUnXmRDgiCKwBUWjTiQ/Z
 qdjsKQxYVuaEXNevLZUJN1GcDT2M6Xn7rB0cNofg4quuArPRdtjrEip23PtmKze82tvj
 uazQWvOXNw4bPov/MTyreF4fe8SfK48qcPpZBRfKtqtQe8sWHFXtU3NBJDbTfI68nYHw
 Bsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHm+ZFPJ9DE+vEHPzRqOrLbYfvk1y1Gjl7YgQatO0w0=;
 b=Xq+XDs2mtCC5LkelkvALm/DqBjHnF0mpJarRXlGK95I6ZjDLcIsD3VefwG3uHvJX9v
 pijqYR3MPpMhMhaDgq9u3Zni8q8grSrgQsENkzlp0KlzT2q73R/xGFAPA7QcXjtVLJdn
 iXSuy9/Zj0ePpNp9G/xcZaxsV67UN0P0N7CbnfqIWavnN40/TST/qtnLvZc7LYASIZKO
 IqxuG7hCvZ8EXT9QFh59nMcp3T8EiQ1W6/mY5PXjs1glijv3aOnRD7jkvur2wrcAOLUu
 A1b58IP3deOKialDVtmp7iLTWn8cLpVS1kOZ9WAD3sd0jQoUe1zcFsIgW493tu5Y0QzG
 HHsw==
X-Gm-Message-State: AOAM531yS0dGmlEheWcrwE99u9ulKD606gQygOK4UH9ei7Q6qmeemK1k
 xRbT+pzxZqPfFH+9Aw4IySim3s3+Fvc=
X-Google-Smtp-Source: ABdhPJzOh67MyET6p/El9MDF7vBtcFDdSQe4+moYMlqGQ3zav+c60VU9bE0KOk0ToRXtze6jkhgu5w==
X-Received: by 2002:a17:906:fb8b:: with SMTP id
 lr11mr22744708ejb.191.1620134852742; 
 Tue, 04 May 2021 06:27:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] dma-buf: add interface for user fence synchronization
Date: Tue,  4 May 2021 15:27:18 +0200
Message-Id: <20210504132729.2046-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIFJGQy9XSVAgcGF0Y2ggd2hpY2gganVzdCBhZGRzIHRoZSBpbnRlcmZhY2UgYW5k
IGxvY2tkZXAKYW5ub3RhdGlvbiB3aXRob3V0IGFueSBhY3R1YWwgaW1wbGVtZW50YXRpb24uCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgfCAxOCArKysrKysrKysrKysrKysrKysK
IGluY2x1ZGUvbGludXgvZG1hLXJlc3YuaCAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwppbmRleCA2ZGRiZWI1ZGZiZjYuLmUwMzA1NDI0OTU3
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMKKysrIGIvZHJpdmVycy9k
bWEtYnVmL2RtYS1yZXN2LmMKQEAgLTY4MSwzICs2ODEsMjEgQEAgYm9vbCBkbWFfcmVzdl90ZXN0
X3NpZ25hbGVkX3JjdShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaiwgYm9vbCB0ZXN0X2FsbCkKIAlyZXR1
cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTF9HUEwoZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9yY3Up
OworCisvKioKKyAqIGRtYV9yZXN2X3N5bmNfdXNlcl9mZW5jZSAtIGJsb2NrIGZvciB1c2VyIGZl
bmNlcyB0byBzaWduYWwKKyAqCisgKiBAb2JqOiBUaGUgRE1BIHJlc3Ygb2JqZWN0IHdpdGggdGhl
IHVzZXIgZmVuY2UgYXR0YWNoZWQKKyAqCisgKiBUbyBtYWtlIHN1cmUgd2UgaGF2ZSBwcm9wZXIg
c3luY2hyb25pemF0aW9uIGJldHdlZW4gYWNjZXNzZXMgYmxvY2sgZm9yIHVzZXIKKyAqIGZlbmNl
cyBiZWZvcmUgc3RhcnRpbmcgYSBkbWFfZmVuY2UgYmFzZWQgb3BlcmF0aW9uIG9uIHRoZSBidWZm
ZXIuCisgKi8KK2ludCBkbWFfcmVzdl9zeW5jX3VzZXJfZmVuY2Uoc3RydWN0IGRtYV9yZXN2ICpv
YmopCit7CisJbWlnaHRfZmF1bHQoKTsKKworCS8qIFRPRE86IEFjdHVhbGx5IGNvbWUgdXAgd2l0
aCBhbiBpbXBsZW1lbnRhdGlvbiBmb3IgdGhpcyEgKi8KKworCXJldHVybiAwOworfQorRVhQT1JU
X1NZTUJPTF9HUEwoZG1hX3Jlc3Zfc3luY191c2VyX2ZlbmNlKTsKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZG1hLXJlc3YuaCBiL2luY2x1ZGUvbGludXgvZG1hLXJlc3YuaAppbmRleCBkNDRh
NzdlOGE3ZTMuLmM1MjVhMzZiZTkwMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtcmVz
di5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLXJlc3YuaApAQCAtMjg5LDUgKzI4OSw2IEBAIGxv
bmcgZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShzdHJ1Y3QgZG1hX3Jlc3YgKm9iaiwgYm9vbCB3
YWl0X2FsbCwgYm9vbCBpbnRyLAogCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgdGltZW91dCk7CiAK
IGJvb2wgZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9yY3Uoc3RydWN0IGRtYV9yZXN2ICpvYmosIGJv
b2wgdGVzdF9hbGwpOworaW50IGRtYV9yZXN2X3N5bmNfdXNlcl9mZW5jZShzdHJ1Y3QgZG1hX3Jl
c3YgKm9iaik7CiAKICNlbmRpZiAvKiBfTElOVVhfUkVTRVJWQVRJT05fSCAqLwotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
