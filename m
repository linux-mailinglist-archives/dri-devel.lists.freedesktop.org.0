Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A222793CF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 23:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F686ED67;
	Fri, 25 Sep 2020 21:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE26D6ED65
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 21:55:36 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b19so3616775lji.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IqWRtJXL3h+0YNOWDfr/oyE5XU2E5SGs9B5R12b/mYU=;
 b=smLOvcFFfth/d/eCeWfi6sPNLPRxKuTHjZl6Qa78IJFY39bb2+0XlYQLC/pEPb0S5f
 krWWfpXYbxD08VHxrcxWjPchRtbLuzebmEukSrshxr4xU4tX1dR3f82OTovIcu62v4qP
 g20pfMDZ8diisUnm+1Se1IT4VvLZ2kruNSpscC6of4431D4LgyhrDdtXJZYCE10wtpdt
 gxO0psNfOrRHtRtDqjM8ju1BdpYSQbTemoNMxpKvwnAofmyb1mB3SQUq2a4pcitvlfIv
 b+hARjlJum+osgCVbXdK/+NORGUg++RWT54fIlmgTwTdM1sxpO02quE75L1NTKySgjPZ
 KjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IqWRtJXL3h+0YNOWDfr/oyE5XU2E5SGs9B5R12b/mYU=;
 b=hRMkQX5PtsTtr/EWy58U3DQ2JJiDS1W7q8PO8oWmhHJ+ohxalXCW8sbLg3EMxFtTUF
 9CPWXQlfgwrXmbY2Sc7IO5PFSYbAWBahx+shKyc+zUDA04WjSL8NNDOr+yqYsJksfiT3
 G1a3bXD0SCVqScnpoohIUGB0bP+4iwqLZVbbM8f6D6h/DDZiiJUmvugxEuxSPjwTgTMZ
 4EjpvJIGQbcHX7IUVqj0CFfjPFIlyqNtgzEcDJ0mv72Wr7P1mONCa7029zmHGjBZXtLz
 5kd7wtDAGboisyAeESv9N82rRIKc5B6VAJmfP/TXiTFYbHs9jviOZ5zpsDWjjmaPp79f
 cX1A==
X-Gm-Message-State: AOAM530RFDrvK97vv/FwpjkClyIdf+tu1znD+b6n6+ZOBoONaA73ifwx
 cXG/M26gJaAnpuMQEr2/PCgUc5LPVB3nzA==
X-Google-Smtp-Source: ABdhPJwmQGAytj+dmXke/hXv+JGQ4Kg6h02qEjK+GXB10/h+Q3MdC1ggeZKjWovNpDVBdcczonRk5w==
X-Received: by 2002:a2e:90d6:: with SMTP id o22mr1769262ljg.442.1601070935198; 
 Fri, 25 Sep 2020 14:55:35 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:3926:b59a:e618:9f9c])
 by smtp.gmail.com with ESMTPSA id
 j8sm261277lfr.80.2020.09.25.14.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 14:55:34 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Heiko Stuebner <heiko@sntech.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v1 2/2] drm/rockchip: fix warning from cdn_dp_resume
Date: Fri, 25 Sep 2020 23:55:24 +0200
Message-Id: <20200925215524.2899527-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925215524.2899527-1-sam@ravnborg.org>
References: <20200925215524.2899527-1-sam@ravnborg.org>
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
Cc: Sandy Huang <hjc@rock-chips.com>, stable@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDdjNDlhYmI0YzJmOCAoImRybS9yb2NrY2hpcDogY2RuLWRwLWNvcmU6IE1ha2UgY2Ru
X2RwX2NvcmVfc3VzcGVuZC9yZXN1bWUgc3RhdGljIikKaW50cm9kdWNlZCB0aGUgZm9sbG93aW5n
IHdhcm5pbmcgaW4gc29tZSBidWlsZHM6CgpjZG4tZHAtY29yZS5jOjExMjQ6MTI6IHdhcm5pbmc6
IOKAmGNkbl9kcF9yZXN1bWXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQKIDExMjQgfCBzdGF0aWMg
aW50IGNkbl9kcF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogICAgICB8ICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fgoKRml4IHRoaXMgYnkgZGVmaW5pbmcgY2RuX2RwX3Jlc3VtZSBfX21heWJl
X3VudXNlZAoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpG
aXhlczogN2M0OWFiYjRjMmY4ICgiZHJtL3JvY2tjaGlwOiBjZG4tZHAtY29yZTogTWFrZSBjZG5f
ZHBfY29yZV9zdXNwZW5kL3Jlc3VtZSBzdGF0aWMiKQpDYzogRW5yaWMgQmFsbGV0Ym8gaSBTZXJy
YSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlr
b0BzbnRlY2guZGU+CkNjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgpDYzogbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1yb2NrY2hpcEBsaXN0
cy5pbmZyYWRlYWQub3JnCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS44KwotLS0K
IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvY2RuLWRwLWNvcmUuYwppbmRleCBhNGE0NWRhZjkzZjIuLjExNjJlMzIxYWFlZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKQEAgLTExMjEsNyArMTEyMSw3IEBAIHN0
YXRpYyBpbnQgY2RuX2RwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiByZXQ7
CiB9CiAKLXN0YXRpYyBpbnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCitzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIGNkbl9kcF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQog
ewogCXN0cnVjdCBjZG5fZHBfZGV2aWNlICpkcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
