Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53098157E67
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 16:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F16E6EC7A;
	Mon, 10 Feb 2020 15:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CBB6EC76;
 Mon, 10 Feb 2020 15:09:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so8187818wrt.6;
 Mon, 10 Feb 2020 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UOKMXl1v/cdQ85AtU5u2QsWEeOdXlwQ0JOYVlGA0JJY=;
 b=FYbqJegLfe3MlqFN518bJ2rSZt8OJENgVFjO0+LjD8NBlJ+fdv7J4aKjNHn0lCpWlN
 jnpuzJQXymntJW+qnC3A5xTUBHUsLrX+SFvICXM0mpyVLfaAddPWs0wGViKD9uDDTHxG
 gZpbTeQ1mEb7MmRJhXWLlQgkFRH8VcBncPmpRs91CF52euFoKyGEiSMNAxpbKPCdTcJc
 4CZnmNEyClaHZzTfH9K2mzE05lebHboKt7/Pm7OsHc8unagfKONCA5eOb1teY9PrgbWM
 Fu/i2nEmlXjRgvBBGkuWjfmAq8q1bpoVbjighQx8erflxB5WQyXS0HqAKkrM77ursOMI
 E5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOKMXl1v/cdQ85AtU5u2QsWEeOdXlwQ0JOYVlGA0JJY=;
 b=en/X5pQuWl9dz3e031Lapvuz8CNiy9And8RYrL+bcyNZRm0hHvKjtjj3qE79U8gwLg
 2sz8vfB457E1Esh1GPAjKbksG8ZIH3gHtT2WFFCOilMFOXPmwgezISubGzyrdWZZs0kL
 UV5mOlfabx1FwV3WKRYRCGMpouuxvpgSlupxPLHUI4sWs9sKcApLVl4xFNT/mrlYZ8mP
 WClz825g183ewPpMi6njt7myAJRs3ulVib4+5YnN+s4YifWW5CDDh7Y7304h91SkhaDW
 WkGvABgZtOmDWUvcRr+QUqwLFg6iBexXOmODvNHQdsrRRsBWs5WET92gNxvXFcqorU2m
 A0ew==
X-Gm-Message-State: APjAAAVU0jnugsXWpvjd02ShJewmCDtSQcjvrli0Q8lpYyP80wR/Nry5
 +vR0825C94ei+vA1qZklrvM=
X-Google-Smtp-Source: APXvYqzL+pVL2Cm7jn2+XYle/HoTN+fXReP7A073B8XzCAG3kZAqglpiSHKl+sBVB1fSEz83YSjnAA==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr2531083wro.350.1581347353210; 
 Mon, 10 Feb 2020 07:09:13 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d3b:a71c:475c:1e99])
 by smtp.gmail.com with ESMTPSA id q10sm1021996wme.16.2020.02.10.07.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 07:09:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/ttm: refine ghost BO resv criteria
Date: Mon, 10 Feb 2020 16:09:02 +0100
Message-Id: <20200210150907.20616-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210150907.20616-1-christian.koenig@amd.com>
References: <20200210150907.20616-1-christian.koenig@amd.com>
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

R2hvc3QgQk9zIG5lZWQgdG8gc3RpY2sgd2l0aCB0aGUgcmVzdiBvYmplY3Qgb25seSB3aGVuIHRo
ZSBvcmlnaW4gaXMgaW1wb3J0ZWQuCgpUaGlzIGlzIGEgbG93IGhhbmdpbmcgZnJ1aXQgdG8gYXZv
aWQgT09NIHNpdHVhdGlvbnMgb24gZXZpY3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3V0aWwuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0
aWwuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwppbmRleCAyYjBlNWEwODhk
YTAuLjg2ZDE1MjQ3MmYzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYwpAQCAtNTExLDcg
KzUxMSw3IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAlrcmVmX2luaXQoJmZiby0+YmFzZS5rcmVmKTsKIAlmYm8t
PmJhc2UuZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95OwogCWZiby0+YmFzZS5hY2Nf
c2l6ZSA9IDA7Ci0JaWYgKGJvLT5iYXNlLnJlc3YgPT0gJmJvLT5iYXNlLl9yZXN2KQorCWlmIChi
by0+dHlwZSAhPSB0dG1fYm9fdHlwZV9zZykKIAkJZmJvLT5iYXNlLmJhc2UucmVzdiA9ICZmYm8t
PmJhc2UuYmFzZS5fcmVzdjsKIAogCWRtYV9yZXN2X2luaXQoJmZiby0+YmFzZS5iYXNlLl9yZXN2
KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
