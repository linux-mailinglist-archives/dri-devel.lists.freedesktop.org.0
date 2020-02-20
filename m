Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9A165C43
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 11:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464516ED29;
	Thu, 20 Feb 2020 10:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB8C6ED28;
 Thu, 20 Feb 2020 10:56:13 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id l6so1375894uap.13;
 Thu, 20 Feb 2020 02:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RY6iEngyDGKQkKYzT387W2sKpng6F5mXSDUfIpnBVSk=;
 b=Iw7qK2saEf79xbHnnTjKmXFDEwgCMbqULPpGlxgGLq1o/kVLTrcTERV1YbMSCRJ6dl
 U7x0ojXSdkRQ4dsAKqn50Ryuoq+b8i1goUr4DcmItWDNzOGTOhPsl4OdR9JXt2d14yuC
 95DQiOmnq9lyXdLP5PKbZrhg0Z0fOevebeS+KnHbr5ZthehM1FC8l0L0NGFDrc5zbXNB
 fKftPPYjo5rzdtbWKOhLu+DM2i/FvbiF1Uaf0qfsSGM0cjopqCJs1GMpJWV01eivkZth
 HHXEsyPtLKeT5xEfu6MlWLyGIXENguJrWOhX2lnwavI4mWWU7AmSUZpUxQI7kMIwZW8n
 KmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RY6iEngyDGKQkKYzT387W2sKpng6F5mXSDUfIpnBVSk=;
 b=CqjUIwUfkTSpm0Ps45sHATFVxrNcd9ywFiUooW51v+7rk/KKWeArWwrtxRscetfHzl
 OJLjUpzJPeXXDoZR+xhGjlfFZFuucjk5BpOeAGqfI5Kb19rBKAr8MxfhFZ2Fzz0aOo4Q
 wQvEQjHjyVYZEClo+2sKKYMNy2Y+yOdmyIG/Hrl4w0gyizpXfcIo0eOnzo0FNDV8QaJ7
 +pMki9SHnAyrTjBkK1SvQmvfFt5U1bFgmus40qLUH1RtboK4EoG6uc8QS1F1TJu+pnZC
 3r06zaHGr++rQrzkf5/h/hdKTBY/tJ4qBQ0/x8Me5CXam+cTQ8/FhCW3zyvraRO6dFza
 jmfQ==
X-Gm-Message-State: APjAAAUgqcun8VAKf1WUkw+wJZbXeenTuAclrT7lB+cKIGaaEiUPfU/D
 JChizhTGIcCOyRYmHjVjqFOq95BcZMWp/lciSTUWLVpd
X-Google-Smtp-Source: APXvYqw6OJDC07yI2TJg5MCOmtjuCCFvl3RTMh/HoxPvylYmgGlhJ7tD19Qc9w6FEC//9mzZBbQ09iuS72AZGiQAE0o=
X-Received: by 2002:ab0:5bc6:: with SMTP id z6mr16681385uae.46.1582196172410; 
 Thu, 20 Feb 2020 02:56:12 -0800 (PST)
MIME-Version: 1.0
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20200219203544.31013-3-ville.syrjala@linux.intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Feb 2020 10:56:01 +0000
Message-ID: <CACvgo50fK+5CVUFJAnMQvHGcbaNWP8TQA0c+r6ikoRJTJcUVhg@mail.gmail.com>
Subject: Re: [PATCH 02/12] drm/exynos: Use mode->clock instead of reverse
 calculating it from the vrefresh
To: Ville Syrjala <ville.syrjala@linux.intel.com>
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBGZWIgMjAyMCBhdCAyMDozNiwgVmlsbGUgU3lyamFsYQo8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IGh0b3RhbCp2dG90YWwqdnJlZnJlc2ggfj0g
Y2xvY2suIFNvIGp1c3QgdXNlIHNheSAiY2xvY2siIHdoZW4gd2UgbWVhbiBpdC4KPgo+IENjOiBJ
bmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5
MjIuc2hpbUBzYW1zdW5nLmNvbT4KPiBDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1z
dW5nLmNvbT4KPiBDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9y
YS5jb20+CgotRW1pbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
