Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675414536
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61B589362;
	Mon,  6 May 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6A2892CB
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 17:39:50 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y10so2644141lji.9
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2019 10:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d3SE5g/jmgV5mNASQhzXKhHYJPe76OILIthVB+qsohQ=;
 b=ifB0ubvu/S7k4nnSQULJfqsE38TUejxR3zXN669CscgwKDXkZcyFeth8YwpXaTgq+E
 QS2lDT5YZiUponqlemzvzkDg3JHVmfIOaZbhh8EMEAUKtja4wLvElQUamn+PfJemOSo4
 JHUVDiaw5f0O+/NaIz+Ka0n94U3STVFtED99T2fnRJRiwyNWwuI+yz4UVTs4BZ8s+Yq5
 gDJI7iuyhleFGbO0vanPrnHK0F0GBK/VFGD6wSCSskrR07emW2XFOl38Rgpg39tBq3+i
 9+nRk1fat4Ce6Y+ODUx4Ag6obL/9n9PcgTSCGeZnilfytMncxie6dn68rOhAU7zulfil
 SIjA==
X-Gm-Message-State: APjAAAW0jyaLY0mu4hbddaAjMrgQK0SfQ2DDrNrmQxy67ecEwD+DmI3o
 kef5CbW3NmRVR6wpVlkcW1A=
X-Google-Smtp-Source: APXvYqwhSikFAq0dClUlxDG5krmxsB5eIzTUe9DMnqQJTN/73P5v5zF61OIjS8NyBZbhVlbGpRSHhw==
X-Received: by 2002:a2e:1508:: with SMTP id s8mr10931682ljd.87.1557077989134; 
 Sun, 05 May 2019 10:39:49 -0700 (PDT)
Received: from localhost.localdomain (ppp94-29-35-107.pppoe.spdop.ru.
 [94.29.35.107])
 by smtp.gmail.com with ESMTPSA id z17sm1626938lja.26.2019.05.05.10.39.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 May 2019 10:39:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 2/3] drm/tegra: dc: Extend debug stats with total number of
 events
Date: Sun,  5 May 2019 20:37:06 +0300
Message-Id: <20190505173707.29282-3-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505173707.29282-1-digetx@gmail.com>
References: <20190505173707.29282-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d3SE5g/jmgV5mNASQhzXKhHYJPe76OILIthVB+qsohQ=;
 b=i48kTU5OFPZStOA2TWKl13rQC4YdClnfX7TBrdw23LNxhtlh5lQ4RbXm9d4MiWQeXb
 /utUJpAGFUvzbNDne6BaaGxk49WL1TfDmKvruhQeoJ7EMLOK1kdH2MNTTJ7dBdT5Jec7
 UWe4jyCZLUkPYXochN2wFbsoVnUItB+0l/DrqMUg2xdjRT1rpko3lzGY5NeGVnXGNyU+
 yfXOa8uI2drOPSgaLNDh2T1W+jRWsVUFtbkxvfuIXpDs3GVOF7vJyTLlItrr0izM81V1
 xoXlpj25GwOXqSe9arRSGtzLQg3GkZyA2rFfZ+CO+B4zBbvFhm/iwf8Yh5GT7dWU2MMA
 YGlg==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBmb3VuZCB1c2VmdWwgdG8ga25vdyB0aGUgdG90YWwgbnVtYmVyIG9mIHVuZGVyZmxvdyBldmVu
dHMgd2hpbGUgd2FzCndvcmtpbmcgb24gYWRkaW5nIHN1cHBvcnQgZm9yIG1lbW9yeSBiYW5kd2lk
dGggbWFuYWdlbWVudC4gQ3VycmVudGx5CnRoZSBkZWJ1ZyBzdGF0cyBhcmUgZ2V0dGluZyByZXNl
dCBhZnRlciBkaXNhYmxpbmcgQ1JUQywgbGV0J3MgYWNjb3VudAp0aGUgb3ZlcmFsbCBudW1iZXIg
b2YgZXZlbnRzIHRoYXQgZG9lc24ndCBnZXQgcmVzZXQuCgpTaWduZWQtb2ZmLWJ5OiBEbWl0cnkg
T3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Rj
LmMgfCAxMCArKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuaCB8ICA1ICsrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCmluZGV4IGNm
NjIyYTA3ZTliNi4uNDFjYjY3ZGI2ZGJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtMTQ4Miw2ICsxNDgy
LDExIEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfc2hvd19zdGF0cyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMs
IHZvaWQgKmRhdGEpCiAJc2VxX3ByaW50ZihzLCAidW5kZXJmbG93OiAlbHVcbiIsIGRjLT5zdGF0
cy51bmRlcmZsb3cpOwogCXNlcV9wcmludGYocywgIm92ZXJmbG93OiAlbHVcbiIsIGRjLT5zdGF0
cy5vdmVyZmxvdyk7CiAKKwlzZXFfcHJpbnRmKHMsICJmcmFtZXMgdG90YWw6ICVsdVxuIiwgZGMt
PnN0YXRzLmZyYW1lc190b3RhbCk7CisJc2VxX3ByaW50ZihzLCAidmJsYW5rIHRvdGFsOiAlbHVc
biIsIGRjLT5zdGF0cy52YmxhbmtfdG90YWwpOworCXNlcV9wcmludGYocywgInVuZGVyZmxvdyB0
b3RhbDogJWx1XG4iLCBkYy0+c3RhdHMudW5kZXJmbG93X3RvdGFsKTsKKwlzZXFfcHJpbnRmKHMs
ICJvdmVyZmxvdyB0b3RhbDogJWx1XG4iLCBkYy0+c3RhdHMub3ZlcmZsb3dfdG90YWwpOworCiAJ
cmV0dXJuIDA7CiB9CiAKQEAgLTE5NDUsNiArMTk1MCw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB0
ZWdyYV9kY19pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJLyoKIAkJZGV2X2RiZyhkYy0+ZGV2
LCAiJXMoKTogZnJhbWUgZW5kXG4iLCBfX2Z1bmNfXyk7CiAJCSovCisJCWRjLT5zdGF0cy5mcmFt
ZXNfdG90YWwrKzsKIAkJZGMtPnN0YXRzLmZyYW1lcysrOwogCX0KIApAQCAtMTk1Myw2ICsxOTU5
LDcgQEAgc3RhdGljIGlycXJldHVybl90IHRlZ3JhX2RjX2lycShpbnQgaXJxLCB2b2lkICpkYXRh
KQogCQlkZXZfZGJnKGRjLT5kZXYsICIlcygpOiB2ZXJ0aWNhbCBibGFua1xuIiwgX19mdW5jX18p
OwogCQkqLwogCQlkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKCZkYy0+YmFzZSk7CisJCWRjLT5zdGF0
cy52YmxhbmtfdG90YWwrKzsKIAkJZGMtPnN0YXRzLnZibGFuaysrOwogCX0KIApAQCAtMTk2MCw2
ICsxOTY3LDcgQEAgc3RhdGljIGlycXJldHVybl90IHRlZ3JhX2RjX2lycShpbnQgaXJxLCB2b2lk
ICpkYXRhKQogCQkvKgogCQlkZXZfZGJnKGRjLT5kZXYsICIlcygpOiB1bmRlcmZsb3dcbiIsIF9f
ZnVuY19fKTsKIAkJKi8KKwkJZGMtPnN0YXRzLnVuZGVyZmxvd190b3RhbCsrOwogCQlkYy0+c3Rh
dHMudW5kZXJmbG93Kys7CiAJfQogCkBAIC0xOTY3LDExICsxOTc1LDEzIEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCB0ZWdyYV9kY19pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAkJLyoKIAkJZGV2X2Ri
ZyhkYy0+ZGV2LCAiJXMoKTogb3ZlcmZsb3dcbiIsIF9fZnVuY19fKTsKIAkJKi8KKwkJZGMtPnN0
YXRzLm92ZXJmbG93X3RvdGFsKys7CiAJCWRjLT5zdGF0cy5vdmVyZmxvdysrOwogCX0KIAogCWlm
IChzdGF0dXMgJiBIRUFEX1VGX0lOVCkgewogCQlkZXZfZGJnX3JhdGVsaW1pdGVkKGRjLT5kZXYs
ICIlcygpOiBoZWFkIHVuZGVyZmxvd1xuIiwgX19mdW5jX18pOworCQlkYy0+c3RhdHMudW5kZXJm
bG93X3RvdGFsKys7CiAJCWRjLT5zdGF0cy51bmRlcmZsb3crKzsKIAl9CiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmgK
aW5kZXggMTI1NmRmYjZiMmY1Li5hYjI1MTU3Yzk0OGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5oCkBAIC00MSw2
ICs0MSwxMSBAQCBzdHJ1Y3QgdGVncmFfZGNfc3RhdHMgewogCXVuc2lnbmVkIGxvbmcgdmJsYW5r
OwogCXVuc2lnbmVkIGxvbmcgdW5kZXJmbG93OwogCXVuc2lnbmVkIGxvbmcgb3ZlcmZsb3c7CisK
Kwl1bnNpZ25lZCBsb25nIGZyYW1lc190b3RhbDsKKwl1bnNpZ25lZCBsb25nIHZibGFua190b3Rh
bDsKKwl1bnNpZ25lZCBsb25nIHVuZGVyZmxvd190b3RhbDsKKwl1bnNpZ25lZCBsb25nIG92ZXJm
bG93X3RvdGFsOwogfTsKIAogc3RydWN0IHRlZ3JhX3dpbmRvd2dyb3VwX3NvYyB7Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
