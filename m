Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5708122CE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 21:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87618897C8;
	Thu,  2 May 2019 19:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D768C897C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 19:50:31 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c13so4063625qtn.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 12:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZ54H5MP9upabrXqeLSqzX5B4e3SolToSymz2mrIX3g=;
 b=HmOG8oJa6hcwiTBTJPiJEcsLOns/dAuOPKLSDQst7SOvAwbIjkajcjSngFaos6ptUF
 oTXOHNd4YlHykUdrMYdxZ1RMorS3vgAuDdrvGbZUekwi87pUCwouRqCoMD555oU4bP1h
 FhNxRkE31O9XO3n55jeqpLoYdzpuGpTMEehq8ISaCYXhipXci/JvxEDHdqRFyvrePu6Z
 qcvPHQFQJ9tojam7vzlKe8W84fkM9Fs39h6lUe5XuNofHo8QOIRhTVydRomSZeb/N2Yn
 YlHWf86GvODCmNAprT2ubX+vrOFZnu1ZLshCt99XI+Sjy4y63nY65F/MmlzN9wQPh/0o
 2Hmw==
X-Gm-Message-State: APjAAAXXRMwekRw0vTiKtsl+ziJ1qN8N4iGeW/hJCzC/91py0XIg3fWI
 0zksSo1qZe/RdVRN/OLsJm5TgA8OLPg=
X-Google-Smtp-Source: APXvYqwAd8mPI1Y2X3nRzth4DBaEKIcYqgIeuz6v1B3p53DHZ6z1xy8o5RlN/aCWFGrWOEYwFDn/1w==
X-Received: by 2002:a0c:d1ad:: with SMTP id e42mr4626493qvh.208.1556826630783; 
 Thu, 02 May 2019 12:50:30 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k36sm34366qtc.52.2019.05.02.12.50.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 12:50:30 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/10] drm/rockchip: Check for fast link training before
 enabling psr
Date: Thu,  2 May 2019 15:49:49 -0400
Message-Id: <20190502194956.218441-8-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190502194956.218441-1-sean@poorly.run>
References: <20190502194956.218441-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZ54H5MP9upabrXqeLSqzX5B4e3SolToSymz2mrIX3g=;
 b=FsXqbJVv4RjRteYBjM0Eb+VX1/TtUdDikLizo73Bi9HiCMSOPFuAufT/n4Q0GOm+oL
 dx0vzWr1cd1TEJGqPMZnYqb2oMzIYKMj/ePX5r8SghQTOSPT4N/agsp3wwhIJDf1rrj+
 HSs+0UXs+k+LvehE+GG37RleWXUrjqHccmPQTzz4S0I59L6RTJhajKsH0qVTMC3sEd/i
 HlMdfkhfl0YrZkiUpk0wFgaHpm/8edFw4g3PRGazWh7UiQmMW5QeH1BQrN4kg8TBjVHF
 ygoZsBxt0bMRDzc4xnb5VWFy4ktlZ0nOtmNp54zZnkBMrV3XFQahq1cRPXt0kZRog3gn
 t47g==
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
Cc: Zain Wang <wzz@rock-chips.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpPbmNlIHdlIHN0YXJ0IHNo
dXR0aW5nIG9mZiB0aGUgbGluayBkdXJpbmcgUFNSLCB3ZSdyZSBnb2luZyB0byB3YW50IGZhc3QK
dHJhaW5pbmcgdG8gd29yay4gSWYgdGhlIGRpc3BsYXkgZG9lc24ndCBzdXBwb3J0IGZhc3QgdHJh
aW5pbmcsIGRvbid0CmVuYWJsZSBwc3IuCgpDaGFuZ2VzIGluIHYyOgotIE5vbmUKQ2hhbmdlcyBp
biB2MzoKLSBOb25lCgpMaW5rIHRvIHYxOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvcGF0Y2gvbXNnaWQvMjAxOTAyMjgyMTA5MzkuODMzODYtMy1zZWFuQHBvb3JseS5ydW4KTGlu
ayB0byB2MjogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIw
MTkwMzI2MjA0NTA5Ljk2NTE1LTItc2VhbkBwb29ybHkucnVuCgpDYzogWmFpbiBXYW5nIDx3enpA
cm9jay1jaGlwcy5jb20+CkNjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2NvcmUuYyB8IDkgKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMKaW5k
ZXggMjI1ZjVlNWRkNjliLi5hZjM0NTU0YTVhMDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBfY29yZS5jCkBAIC0xMDQwLDE2ICsxMDQwLDE3
IEBAIHN0YXRpYyBpbnQgYW5hbG9naXhfZHBfY29tbWl0KHN0cnVjdCBhbmFsb2dpeF9kcF9kZXZp
Y2UgKmRwKQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwkvKiBDaGVjayB3aGV0aGVyIHBh
bmVsIHN1cHBvcnRzIGZhc3QgdHJhaW5pbmcgKi8KKwlyZXQgPSBhbmFsb2dpeF9kcF9mYXN0X2xp
bmtfdHJhaW5fZGV0ZWN0aW9uKGRwKTsKKwlpZiAocmV0KQorCQlkcC0+cHNyX2VuYWJsZSA9IGZh
bHNlOworCiAJaWYgKGRwLT5wc3JfZW5hYmxlKSB7CiAJCXJldCA9IGFuYWxvZ2l4X2RwX2VuYWJs
ZV9zaW5rX3BzcihkcCk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCX0KIAotCS8qIENo
ZWNrIHdoZXRoZXIgcGFuZWwgc3VwcG9ydHMgZmFzdCB0cmFpbmluZyAqLwotCXJldCA9ICBhbmFs
b2dpeF9kcF9mYXN0X2xpbmtfdHJhaW5fZGV0ZWN0aW9uKGRwKTsKLQlpZiAocmV0KQotCQlkcC0+
cHNyX2VuYWJsZSA9IGZhbHNlOwogCiAJcmV0dXJuIHJldDsKIH0KLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
