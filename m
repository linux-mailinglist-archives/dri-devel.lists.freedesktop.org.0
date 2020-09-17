Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068A26DE39
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3206EC34;
	Thu, 17 Sep 2020 14:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1284F6EC34
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:29:21 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id o8so3559619ejb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5guSOnGs98PAAzgQJqsXdyqL8EdWJJkz+E23gS40Y2Y=;
 b=iCgQQaIZqZvr/AYgODgqZ/BRNP0UEUr9M6WBzWic5vu7X61VLzMutAfYhbApTYtc+z
 t7gnUMilRhqiFbvfu3pylZmc+8s49Xy75M4KlgiB6TYdJPtpMrNGfOljZuVO3JVgv0nh
 Zchk+gV0tG1EI4Ncma4w+aM9PvAvUlk3ehGD4Yztvy8OgO+3NPO/xOo6I8G5cAQaxY4k
 5ODS6Mn+reE+zubJF597+li9J+4Gn+zi9febex4JvsyyOnOcahUme/WRpVqrYVLD/lex
 vivkbZ3gMSXD01ZUVT4pH9jje4CkH1hWfosGKun1aJ02A2B9p5GSDQeNtUKlmN7DbBIh
 Engw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5guSOnGs98PAAzgQJqsXdyqL8EdWJJkz+E23gS40Y2Y=;
 b=G5ZZoO+4OQ0mahNEZ0p7wHd8eyTy4Puk+oyqk02bVKWmxyc0IHv3ZpxvJhgWwdEPlc
 l/iE0QLgOena9l4S+MJ7B5sfEQU78CFGUFbZOV63pdRXTD4d0NozbfIT88xOzNL1B36I
 4tKCtRAGhgxTuIYWNMT/ohsNhSI2KMDGLUc9QSgFu2PetH9QneCbjyhUQV749gMnK1PJ
 VAu/OIe7yLgWcEMioli/WAjjYsbRaWqQyDlYXNVpxGV/hfQyod6w+C2vt0zPro743iab
 w+YIJUaXT64BOLx64P2pFAmBWkKYhZg9rC741TjoXwl2u2Rddt3RE1eD9DW+BdhhQql3
 dlAQ==
X-Gm-Message-State: AOAM531eOI6hahddjUyDdCuYj0jE/83c9EUHFV1zU51hdgaeorAQtNZs
 hBq/YnjJbgjccb0ehGMAFDM=
X-Google-Smtp-Source: ABdhPJwOItz4fMRl3uDAalCYpovAYOBNmdzVEdclAwbICSarWovVUyOMjhlkA6UqcObGK3yXNeGe6g==
X-Received: by 2002:a17:906:d11a:: with SMTP id
 b26mr29958508ejz.191.1600352959755; 
 Thu, 17 Sep 2020 07:29:19 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f602:5ce8:61ae:de53])
 by smtp.gmail.com with ESMTPSA id by24sm34691ejc.100.2020.09.17.07.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:29:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: skeggsb@gmail.com,
	airlied@redhat.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau: stop using persistent_swap_storage
Date: Thu, 17 Sep 2020 16:29:16 +0200
Message-Id: <20200917142917.3178-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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

QWNjb3JkaW5nIHRvIEJlbiB0aGlzIGlzIG1vc3QgbGlrZWx5IGp1c3QgYSBsZWZ0b3Zlci4KClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jIHwgMSAtCiAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5j
CmluZGV4IDg5YWRhZGY0NzA2Yi4uNTk0NWM2NjMzODFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZ2VtLmMKQEAgLTIwOSw3ICsyMDksNiBAQCBub3V2ZWF1X2dlbV9uZXcoc3RydWN0
IG5vdXZlYXVfY2xpICpjbGksIHU2NCBzaXplLCBpbnQgYWxpZ24sIHVpbnQzMl90IGRvbWFpbiwK
IAlpZiAoZHJtLT5jbGllbnQuZGV2aWNlLmluZm8uZmFtaWx5ID49IE5WX0RFVklDRV9JTkZPX1Yw
X1RFU0xBKQogCQludmJvLT52YWxpZF9kb21haW5zICY9IGRvbWFpbjsKIAotCW52Ym8tPmJvLnBl
cnNpc3RlbnRfc3dhcF9zdG9yYWdlID0gbnZiby0+Ym8uYmFzZS5maWxwOwogCSpwbnZibyA9IG52
Ym87CiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
