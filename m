Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C039C2DD7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1050C6E513;
	Tue,  1 Oct 2019 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A7089CA4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 01:00:32 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so6679497pfl.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 18:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6c31Z8bqLagiMFjesWQuytu80YEed1XWODDuNsW24s=;
 b=WDB05LaQuWjwsZvTsIGFvwWBEoBZl/qgtjQMS7ZQoXvQjDCy9UUyYZG3RWVeY5qG5M
 KCoYUF8ZdCFLAUkaHyG6gDZS1H4Ocz5EPz9D0Bt8DRqWFmqdoCPA/eCiTHSQFWjmFn6m
 tZhc/qPfn5Op1hbbQC8pi8LIhUz/AiaPskwZHnWB8CqwdQ9+PazXV5lzMXw7MJ1BKJOK
 NsiC2lglcXU/qIVV0XxhgXiM+Mbc9b7iFMbd4RTYDkwVDCOdcjLjjeXearmUb+LSCGff
 VWvpuczSCXeZEpWW26YmF8/Dma98v8qJ0KyxQ49BEC7ob3O/zy6LVpWU0byW6aboB6J7
 LOKg==
X-Gm-Message-State: APjAAAUAbdzITpjRTdA2GT+sMxmM/VhvsPHLxWOQ/ONgE8/Fp9on1NP3
 Ilmk9ocPaPyYFaQ623MkhEjgFA==
X-Google-Smtp-Source: APXvYqxIwQ/Z/NG15bD/vJSTi2QXMxa4a8imVSlOMCNDTKdY/6Mm2LE1FlsEyH4TWT/43exPRAlWBQ==
X-Received: by 2002:a63:1950:: with SMTP id 16mr28046453pgz.213.1569891631964; 
 Mon, 30 Sep 2019 18:00:31 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id 62sm13146047pfg.164.2019.09.30.18.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2019 18:00:31 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: dw-hdmi: Restore audio when setting a mode
Date: Tue,  1 Oct 2019 09:00:20 +0800
Message-Id: <20191001010020.122134-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6c31Z8bqLagiMFjesWQuytu80YEed1XWODDuNsW24s=;
 b=epI3ugdyCvOb4zVNWfia360x2V+v1fm0AgFUCheJyZoUPJVy8ggRSIGIk4NaAVbcs8
 glkEUdVmFN63+q25+HfwPVyF7/WpBLgRjU2E3olV+ADe28YhCAQg+TX6TAKvCx31/fjd
 mDk4bYpvHaWJVnZyiYSSnbKK3bGoR5ynIr//c=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, tzungbi@chromium.org,
 alsa-devel@alsa-project.org, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Yakir Yang <ykk@rock-chips.com>, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIEt1cnR6IDxkamt1cnR6QGNocm9taXVtLm9yZz4KCldoZW4gc2V0dGluZyBh
IG5ldyBkaXNwbGF5IG1vZGUsIGR3X2hkbWlfc2V0dXAoKSBjYWxscwpkd19oZG1pX2VuYWJsZV92
aWRlb19wYXRoKCksIHdoaWNoIGRpc2FibGVzIGFsbCBoZG1pIGNsb2NrcywgaW5jbHVkaW5nCnRo
ZSBhdWRpbyBjbG9jay4KCldlIHNob3VsZCBvbmx5IChyZS0pZW5hYmxlIHRoZSBhdWRpbyBjbG9j
ayBpZiBhdWRpbyB3YXMgYWxyZWFkeSBlbmFibGVkCndoZW4gc2V0dGluZyB0aGUgbmV3IG1vZGUu
CgpXaXRob3V0IHRoaXMgcGF0Y2gsIG9uIFJLMzI4OCwgdGhlcmUgd2lsbCBiZSBIRE1JIGF1ZGlv
IG9uIHNvbWUgbW9uaXRvcnMKaWYgaTJzIHdhcyBwbGF5ZWQgdG8gaGVhZHBob25lIHdoZW4gdGhl
IG1vbml0b3Igd2FzIHBsdWdnZWQuCkFDRVIgSDI3N0hVIGFuZCBBU1VTIFBCMjc4IGFyZSB0d28g
b2YgdGhlIG1vbml0b3JzIHNob3dpbmcgdGhpcyBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IENoZW5n
LVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
S3VydHogPGRqa3VydHpAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBZYWtpciBZYW5nIDx5
a2tAcm9jay1jaGlwcy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMgfCAxMSArKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCmluZGV4IGFhN2VmZDRkYTFjOC4uYzYwZTk1MTEyMmM5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMTk4Miw2ICsxOTgyLDE1IEBAIHN0YXRpYyB2
b2lkIGhkbWlfZGlzYWJsZV9vdmVyZmxvd19pbnRlcnJ1cHRzKHN0cnVjdCBkd19oZG1pICpoZG1p
KQogCQkgICAgSERNSV9JSF9NVVRFX0ZDX1NUQVQyKTsKIH0KIAorc3RhdGljIHZvaWQgZHdfaGRt
aV9hdWRpb19yZXN0b3JlKHN0cnVjdCBkd19oZG1pICpoZG1pKQoreworCW11dGV4X2xvY2soJmhk
bWktPmF1ZGlvX211dGV4KTsKKworCWhkbWlfZW5hYmxlX2F1ZGlvX2NsayhoZG1pLCBoZG1pLT5h
dWRpb19lbmFibGUpOworCisJbXV0ZXhfdW5sb2NrKCZoZG1pLT5hdWRpb19tdXRleCk7Cit9CisK
IHN0YXRpYyBpbnQgZHdfaGRtaV9zZXR1cChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpCiB7CiAJaW50IHJldDsKQEAgLTIwNDUsNyArMjA1NCw3IEBA
IHN0YXRpYyBpbnQgZHdfaGRtaV9zZXR1cChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpCiAKIAkJLyogSERNSSBJbml0aWFsaXphdGlvbiBTdGVwIEUg
LSBDb25maWd1cmUgYXVkaW8gKi8KIAkJaGRtaV9jbGtfcmVnZW5lcmF0b3JfdXBkYXRlX3BpeGVs
X2Nsb2NrKGhkbWkpOwotCQloZG1pX2VuYWJsZV9hdWRpb19jbGsoaGRtaSwgdHJ1ZSk7CisJCWR3
X2hkbWlfYXVkaW9fcmVzdG9yZShoZG1pKTsKIAl9CiAKIAkvKiBub3QgZm9yIERWSSBtb2RlICov
Ci0tIAoyLjIzLjAuNDQ0LmcxOGVlYjVhMjY1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
