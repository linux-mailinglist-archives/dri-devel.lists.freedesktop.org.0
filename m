Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F433F89B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 20:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240D6E5B2;
	Wed, 17 Mar 2021 18:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948636E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 18:59:52 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q13so540343lfu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 11:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ipiAo/zFdoxmHMg8AWua2BzcAdGe0Ogzj6yRlLPPOUs=;
 b=MBV2/gBuCp22XDC4MSSlbszycii4D8No5J2A00NeO5JKUedUUhV4zpkLgBdEdas1a2
 YkdIFxAmIDKNTahutCnF5VTg5BImlyHK0pdqQ4Q0GXMOwGZpTr1UXcXrnHPf5DUs7AZX
 waXojytC63LEku8cZI6y27ZJocD21wl7xOHhB3YFmyvIutTw87datXAsn7TjQuIQzntv
 qqTbqLo2LIN8ouoyGwi2e8/+gyxSIIlFfJLJjqEiQPg7vSl6PaqM/xUbXm5GmRVrTQ2G
 eWBbVvaL2ndcmyvP+0u3T/psk25gughRt0zoW6qtCd5xjT8AStjrc5nIpEQDmkYInfuB
 1Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ipiAo/zFdoxmHMg8AWua2BzcAdGe0Ogzj6yRlLPPOUs=;
 b=PFp3YJOvTUx5VhH0mDeqLNAJYPU3JpclFiSPD7Vc5eb1tHIb/tf9mDlSNIcpTVKDyE
 SANDzrzjitFo509wtpZrEK+R5Yzrn4bS3bF3WIky68GF3GnSKhRNXMXoA2qhi9z6Dm63
 5S9KkfP/+lO2Ruq+Nw9fJHSIYOeibLvErVaJt//IwCWPbrbTM+YTRdODy0yoiI8n7ysR
 GSbIwUU5r0LCOuIctwOeoULq3hKSKVQkwOKJL5ukFh/vU9b38/gnr3G5dLItdYVbaHOE
 2iSRSCJbWqpz1Igfiq/fIWdcJYFr1528bQgbA7TjXreFmPcxLV6lnciIT+slAfjOacq+
 VghQ==
X-Gm-Message-State: AOAM53170l/RYHAYhxk2PFYpItUvmf9cQ6dYoKw6FVIutV1NsjWOhnOb
 AFLN4prtjc2A3JWklw7Jdcw=
X-Google-Smtp-Source: ABdhPJxXALK2JGzXVYySDferkWlXhCtMFtiONzK9B5d8m/64YAwpuNTpNgtzX+4FRNigIGo7/QEhQA==
X-Received: by 2002:ac2:465c:: with SMTP id s28mr3108039lfo.135.1616007591063; 
 Wed, 17 Mar 2021 11:59:51 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id b28sm3442482lfo.219.2021.03.17.11.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:59:50 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v16 2/2] drm/tegra: dc: Extend debug stats with total number
 of events
Date: Wed, 17 Mar 2021 21:57:34 +0300
Message-Id: <20210317185734.14661-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317185734.14661-1-digetx@gmail.com>
References: <20210317185734.14661-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyB1c2VmdWwgdG8ga25vdyB0aGUgdG90YWwgbnVtYmVyIG9mIHVuZGVyZmxvdyBldmVudHMg
YW5kIGN1cnJlbnRseQp0aGUgZGVidWcgc3RhdHMgYXJlIGdldHRpbmcgcmVzZXQgZWFjaCB0aW1l
IENSVEMgaXMgYmVpbmcgZGlzYWJsZWQuIExldCdzCmFjY291bnQgdGhlIG92ZXJhbGwgbnVtYmVy
IG9mIGV2ZW50cyB0aGF0IGRvZXNuJ3QgZ2V0IGEgcmVzZXQuCgpSZXZpZXdlZC1ieTogTWljaGHF
giBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPgpTaWduZWQtb2ZmLWJ5OiBEbWl0
cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RjLmMgfCAxMCArKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuaCB8ICA1ICsr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCmluZGV4
IDk2ZTNhMjdkYzk4ZC4uMGVjZjcwMjcwODVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtMTU1MSw2ICsx
NTUxLDExIEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfc2hvd19zdGF0cyhzdHJ1Y3Qgc2VxX2ZpbGUg
KnMsIHZvaWQgKmRhdGEpCiAJc2VxX3ByaW50ZihzLCAidW5kZXJmbG93OiAlbHVcbiIsIGRjLT5z
dGF0cy51bmRlcmZsb3cpOwogCXNlcV9wcmludGYocywgIm92ZXJmbG93OiAlbHVcbiIsIGRjLT5z
dGF0cy5vdmVyZmxvdyk7CiAKKwlzZXFfcHJpbnRmKHMsICJmcmFtZXMgdG90YWw6ICVsdVxuIiwg
ZGMtPnN0YXRzLmZyYW1lc190b3RhbCk7CisJc2VxX3ByaW50ZihzLCAidmJsYW5rIHRvdGFsOiAl
bHVcbiIsIGRjLT5zdGF0cy52YmxhbmtfdG90YWwpOworCXNlcV9wcmludGYocywgInVuZGVyZmxv
dyB0b3RhbDogJWx1XG4iLCBkYy0+c3RhdHMudW5kZXJmbG93X3RvdGFsKTsKKwlzZXFfcHJpbnRm
KHMsICJvdmVyZmxvdyB0b3RhbDogJWx1XG4iLCBkYy0+c3RhdHMub3ZlcmZsb3dfdG90YWwpOwor
CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTIzMjUsNiArMjMzMCw3IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCB0ZWdyYV9kY19pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJLyoKIAkJZGV2X2RiZyhkYy0+
ZGV2LCAiJXMoKTogZnJhbWUgZW5kXG4iLCBfX2Z1bmNfXyk7CiAJCSovCisJCWRjLT5zdGF0cy5m
cmFtZXNfdG90YWwrKzsKIAkJZGMtPnN0YXRzLmZyYW1lcysrOwogCX0KIApAQCAtMjMzMyw2ICsy
MzM5LDcgQEAgc3RhdGljIGlycXJldHVybl90IHRlZ3JhX2RjX2lycShpbnQgaXJxLCB2b2lkICpk
YXRhKQogCQlkZXZfZGJnKGRjLT5kZXYsICIlcygpOiB2ZXJ0aWNhbCBibGFua1xuIiwgX19mdW5j
X18pOwogCQkqLwogCQlkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKCZkYy0+YmFzZSk7CisJCWRjLT5z
dGF0cy52YmxhbmtfdG90YWwrKzsKIAkJZGMtPnN0YXRzLnZibGFuaysrOwogCX0KIApAQCAtMjM0
MCw2ICsyMzQ3LDcgQEAgc3RhdGljIGlycXJldHVybl90IHRlZ3JhX2RjX2lycShpbnQgaXJxLCB2
b2lkICpkYXRhKQogCQkvKgogCQlkZXZfZGJnKGRjLT5kZXYsICIlcygpOiB1bmRlcmZsb3dcbiIs
IF9fZnVuY19fKTsKIAkJKi8KKwkJZGMtPnN0YXRzLnVuZGVyZmxvd190b3RhbCsrOwogCQlkYy0+
c3RhdHMudW5kZXJmbG93Kys7CiAJfQogCkBAIC0yMzQ3LDExICsyMzU1LDEzIEBAIHN0YXRpYyBp
cnFyZXR1cm5fdCB0ZWdyYV9kY19pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJLyoKIAkJZGV2
X2RiZyhkYy0+ZGV2LCAiJXMoKTogb3ZlcmZsb3dcbiIsIF9fZnVuY19fKTsKIAkJKi8KKwkJZGMt
PnN0YXRzLm92ZXJmbG93X3RvdGFsKys7CiAJCWRjLT5zdGF0cy5vdmVyZmxvdysrOwogCX0KIAog
CWlmIChzdGF0dXMgJiBIRUFEX1VGX0lOVCkgewogCQlkZXZfZGJnX3JhdGVsaW1pdGVkKGRjLT5k
ZXYsICIlcygpOiBoZWFkIHVuZGVyZmxvd1xuIiwgX19mdW5jX18pOworCQlkYy0+c3RhdHMudW5k
ZXJmbG93X3RvdGFsKys7CiAJCWRjLT5zdGF0cy51bmRlcmZsb3crKzsKIAl9CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rj
LmgKaW5kZXggNjlkNGNjYTJlNThjLi5hZDhkNTFhNTVhMDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oCkBAIC00
OCw2ICs0OCwxMSBAQCBzdHJ1Y3QgdGVncmFfZGNfc3RhdHMgewogCXVuc2lnbmVkIGxvbmcgdmJs
YW5rOwogCXVuc2lnbmVkIGxvbmcgdW5kZXJmbG93OwogCXVuc2lnbmVkIGxvbmcgb3ZlcmZsb3c7
CisKKwl1bnNpZ25lZCBsb25nIGZyYW1lc190b3RhbDsKKwl1bnNpZ25lZCBsb25nIHZibGFua190
b3RhbDsKKwl1bnNpZ25lZCBsb25nIHVuZGVyZmxvd190b3RhbDsKKwl1bnNpZ25lZCBsb25nIG92
ZXJmbG93X3RvdGFsOwogfTsKIAogc3RydWN0IHRlZ3JhX3dpbmRvd2dyb3VwX3NvYyB7Ci0tIAoy
LjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
