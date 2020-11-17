Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E82B669E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 15:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468766E233;
	Tue, 17 Nov 2020 14:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51846E233
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 14:06:20 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id y17so23929009ejh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 06:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oFyHoiV2d00mo5V49sT/52n1Qfw4rgsyOigOvwy2QxY=;
 b=iMj3VJTFLfOrPxcBH52cWhxLXPMM0y1PB6j6dPHRHemhFSO26WeZPXerYVhC0p6fzA
 bJdzTool0Gy8QrHSxNrnFBy3X/DPonbsiGOP3o7Njjaf4r4nBPgcchyOBRIE701ASbwB
 bgxNDRbL48ONoopDjFSAWTpaj6bPGIyL3V9EMslZx7vfCXXNtJeJMvHu0jO4Q188WhYZ
 QpcBsnPknIoKE9EKkcPDgs0VVYmBqlZwqVeHd89QaI25Fm14rK5CdpKicMtLuRvkeQJR
 dqT1YxjmVrTXtBUiZTsCzEAK3k2nSCFHPDN6ej8s2aF3k/MMUjYAi4XSrPH2LxZx5qm2
 dx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFyHoiV2d00mo5V49sT/52n1Qfw4rgsyOigOvwy2QxY=;
 b=KVkvU18thBRBIrlq7FUYtbxUcOg+K6RtL8EkKQ1V27Mb0zohm5eWlrfV95DhKYy+Gi
 CaFdl5xW1p/Ot9b3LwII+O0/6QM3UvMJ2a4xu+F/Mn7vWJZ/izNZuLvA1W4m/I3HMLko
 d+j9lY0BUbMUPDQJl5GyDUGf4iuHS9lm62GtwUuM2Ra2gSt4cZtSXg/UUHm4tLRrVy9c
 rLubQlFK7wKez0or5quuaSbyIlhCfEg5ktD1rHZTCz1MRx3RynID/9thuC2upknSdmKG
 a0rsVpEKXOg6KZWW4fSmuKjZsjCfzQfXM3yMRwCD8EuKntZFdoQVT+BCwdNnlx9It6Hg
 zomQ==
X-Gm-Message-State: AOAM533dXpnt0kLminxMXT2coBEG/T7btIi6gcDeXYSADKX7zuFieRjU
 FvVKzyujYYPj7B33SFbvypw=
X-Google-Smtp-Source: ABdhPJxT0aRt7dNz8VGn0baSCWvCmgUQdQ6JZuKgQlCHV7JFilZmBkSJuG3nrtbiHDgoGDpTzQg5Vw==
X-Received: by 2002:a17:906:1497:: with SMTP id
 x23mr20603707ejc.457.1605621979465; 
 Tue, 17 Nov 2020 06:06:19 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4d18:8ca3:78f:2e63])
 by smtp.gmail.com with ESMTPSA id h23sm11998900edv.69.2020.11.17.06.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 06:06:18 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@linux.ie, Felix.Kuehling@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 sroland@vmware.com
Subject: [PATCH 3/3] drm/ttm: make up to 90% of system memory available
Date: Tue, 17 Nov 2020 15:06:15 +0100
Message-Id: <20201117140615.255887-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117140615.255887-1-christian.koenig@amd.com>
References: <20201117140615.255887-1-christian.koenig@amd.com>
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

SW5jcmVhc2UgdGhlIGFtbW91bnQgb2Ygc3lzdGVtIG1lbW9yeSBkcml2ZXJzIGNhbiB1c2UgdG8g
YWJvdXQgOTAlIG9mCnRoZSB0b3RhbCBhdmFpbGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IGE5NTgxMzVjYjNmZS4uMGE5M2RmOTNk
YmE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTEyNjcsNyArMTI2Nyw3IEBAIHN0YXRpYyBpbnQg
dHRtX2JvX2dsb2JhbF9pbml0KHZvaWQpCiAJICogdGhlIGF2YWlsYWJsZSBzeXN0ZW0gbWVtb3J5
LgogCSAqLwogCW51bV9wYWdlcyA9ICh1NjQpc2kudG90YWxyYW0gKiBzaS5tZW1fdW5pdDsKLQlu
dW1fcGFnZXMgPSAobnVtX3BhZ2VzICogNTAgLyAxMDApID4+IFBBR0VfU0hJRlQ7CisJbnVtX3Bh
Z2VzID0gKG51bV9wYWdlcyAqIDkwIC8gMTAwKSA+PiBQQUdFX1NISUZUOwogCiAJLyogQnV0IGZv
ciBETUEzMiB3ZSBsaW1pdCBvdXJzZWxmIHRvIG9ubHkgdXNlIDJHaUIgbWF4aW11bS4gKi8KIAlu
dW1fZG1hMzJfcGFnZXMgPSAodTY0KShzaS50b3RhbHJhbSAtIHNpLnRvdGFsaGlnaCkgKiBzaS5t
ZW1fdW5pdDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
