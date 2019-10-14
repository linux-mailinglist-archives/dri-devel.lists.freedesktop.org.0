Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AFD6310
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8343C6E2D5;
	Mon, 14 Oct 2019 12:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7556E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y21so16640625wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VDWizjgHzHaIFYFt83zBnigeKDs+hp0GWtpu1Y4vNf8=;
 b=gOy2/uWuhbYIm3F+0y22xui3sXeN8lWiJh2iKan1ek2+u2P3z/hXqA/PZ8kzHpu50A
 ohCc5rDaMtdI+x9qZW3RumNR2AYQ2Gzzp2FB6eK5dUCGzt2Y7kd3XnsA+rchPmNTHMBE
 CIEGN6MeZS2H8dyrxssYtEJyfvd2Kk086zFwg1rCqqFUi3e2DygBdM00MzJtGUpePT28
 33l5e+8oEM/enHF3Jj7yCgA56DIwatXTWS1v/3+KmQYaHX0M/P09i7Oocr2BI7HZ4YjI
 LNiei1VelGS7ldgdHUVqsr/fxDCE0Nyp+pxrJe10RoLbIi6RXq3HRYJrxeGfqXAF368a
 fIaA==
X-Gm-Message-State: APjAAAXbJGme/D5GybVuqCM3Jao6Hnd6pulfHXoI1aljX/UapEisVQsI
 cc0RfDvncIhe/SFlUPpJ6LGPYFFz
X-Google-Smtp-Source: APXvYqz8X5+f6i1aMnNFDYBatBFCV+qGCetZxynDcGxPHgl8rkjrnIO1LlCP6g5G7sRB6rhIdl5V9A==
X-Received: by 2002:a1c:a941:: with SMTP id s62mr14393658wme.128.1571057478049; 
 Mon, 14 Oct 2019 05:51:18 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c18sm16730393wrv.10.2019.10.14.05.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 12/14] drm/tegra: gem: Use dma_get_sgtable()
Date: Mon, 14 Oct 2019 14:50:47 +0200
Message-Id: <20191014125049.425101-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VDWizjgHzHaIFYFt83zBnigeKDs+hp0GWtpu1Y4vNf8=;
 b=nYS0pc+oc0WP0DGiaz+7394+j+LUl8X/KfzH9D3W7fs8+8xliID/0kQZ3l3rqzsoMy
 6i0KPVh0S4rOoYWSQK4Ev0Fu1Q7/WnXq7wltsFHNt7Qg0LysUo38fk2KaNQpHTk/wBBz
 J6z71ciFh8KMMIVbt17hD1F7yDenRoIR2X/vFMEO4M1i+XAf7WFTxRVByrowTBw0JYH5
 U6YQM88spXnpMWDsb/6ArnDjbOu3hLQoS2JZM8nxDoHYNdb0ocj4JsYVgH1N5XNNXsT5
 WLtr0EK769PH2oeOETG54LFovq05Pyh5Kn42XWsWAsWwHVu2ZUxenuQ2e3DxbXzkXqEB
 AiQA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClJhdGhlciB0aGFuIG1h
bnVhbGx5IGNyZWF0aW5nIGFuIFNHIHRhYmxlIGluIGFuIGluY29ycmVjdCB3YXksIGxldCB0aGUK
c3RhbmRhcmQgZG1hX2dldF9zZ3RhYmxlKCkgZnVuY3Rpb24gZG8gaXQuCgpTaWduZWQtb2ZmLWJ5
OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9nZW0uYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0u
YyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwppbmRleCA3NDEyZTIzNTAwZDEuLjMzNDVj
Y2UxNDY2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpAQCAtNTIwLDExICs1MjAsOSBAQCB0ZWdyYV9nZW1f
cHJpbWVfbWFwX2RtYV9idWYoc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLAogCQlp
ZiAoZG1hX21hcF9zZyhhdHRhY2gtPmRldiwgc2d0LT5zZ2wsIHNndC0+bmVudHMsIGRpcikgPT0g
MCkKIAkJCWdvdG8gZnJlZTsKIAl9IGVsc2UgewotCQlpZiAoc2dfYWxsb2NfdGFibGUoc2d0LCAx
LCBHRlBfS0VSTkVMKSkKKwkJaWYgKGRtYV9nZXRfc2d0YWJsZShhdHRhY2gtPmRldiwgc2d0LCBi
by0+dmFkZHIsIGJvLT5pb3ZhLAorCQkJCSAgICBnZW0tPnNpemUpIDwgMCkKIAkJCWdvdG8gZnJl
ZTsKLQotCQlzZ19kbWFfYWRkcmVzcyhzZ3QtPnNnbCkgPSBiby0+aW92YTsKLQkJc2dfZG1hX2xl
bihzZ3QtPnNnbCkgPSBnZW0tPnNpemU7CiAJfQogCiAJcmV0dXJuIHNndDsKLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
