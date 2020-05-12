Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D671CEDBC
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DA06E84E;
	Tue, 12 May 2020 07:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC1A6E82F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 06:00:30 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l17so219150wrr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 23:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpPUiKoxrLHYw4+DH7/6FLsY3bFbf5FDzCuTH+tpmXY=;
 b=YhVM1qh5b2JTfXSFTmL6NUVbLnY8Gh7IKyb82fxao7EP2fTdGqjahewQA39dMIEiB/
 Hez3/pLS09TYLzhhUPbBTLgOfuWQwJ1C8zt5a4Lid90U6Y0lhDJvViWS/vEndxigUoc5
 Uw0dB+xZ/SKVvxDJ3MSufBGwscUAPPZQe6WNWy+0uh/hhSZ89iyfhgHMIIIh+TIjj+Uq
 YErlj+HD+NUQdsYGRqEvkVe6eIB2nvhjrn3FhicXAPQIaggvwEFfZTASnFU/OhYAKYIs
 m+ddiZTWK875hdqG6lIeIuwf8gJdNhhjXFWUc4YNG76U3vMdr5GmEKs17feTls9f8B4v
 EO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpPUiKoxrLHYw4+DH7/6FLsY3bFbf5FDzCuTH+tpmXY=;
 b=oBU3ChmaH1LO99qqUSrL9UgMjqrGmc+tksEwWeVCQc/3PBrjQht3do1AX2P2Vfagc6
 D4vJ8d0e3r41R5cP3qggGW8mlIrvONq3yfnuRSHvKZtg5zIJqyIZDUJUZD49A9DZ7EDd
 kMt8UxTHMGV1FNTxwhh6HNS7zB31ihSGrKZQdaY8U8R20DeHeoQ5ISa1GbLP7EGplmgw
 7/e2JhoNPppZEe0K1JtTOI5fKd8abikVtG6t8VvpiRyKq87qNyPjB/vfkjprotaLrNXM
 zqgRIQ+Hppkt/E2IHQmT0LidsCu5sOSWbUo09FkIOtJVVVYmtGOhps7t/zufglfpMAwL
 HuWw==
X-Gm-Message-State: AGi0PuZ31EEzSeFAZc07MC6S2PjVrbcoIw8Dusc7SBskKC03mg/PKZ2D
 Hxaqhv0TOFosqkq2RfL//Kk=
X-Google-Smtp-Source: APiQypJxBhGzU7FEv9wDSsbA6BcB09ZI6zcZJLRr0s5b2YymW4QimDRvIKvSBklXOggyjXe+NDAoWQ==
X-Received: by 2002:adf:d091:: with SMTP id y17mr22450319wrh.418.1589263229127; 
 Mon, 11 May 2020 23:00:29 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a13sm20539150wrv.67.2020.05.11.23.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:00:28 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 0/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Tue, 12 May 2020 08:00:21 +0200
Message-Id: <20200512060023.684871-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504185945.2776148-1-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBpbXByb3ZlIHRoZSBPT0IgaGFtbWluZyBsYXlvdXQgYnkgcmVkdWNpbmcg
dGhlIG51bWJlciBvZiBvb2IKc2VjdGlvbnMgYW5kIGNvcnJlY3RseSAKCnYzOiBpbnZlcnQgcGF0
Y2ggb3JkZXIuCnYyOiBleHRlbmQgb3JpZ2luYWwgY29tbWVudCBhbmQgY29ycmVjdGx5IHNraXAg
Ynl0ZSA2IGZvciBzbWFsbC1wYWdlLgoKw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzICgyKToKICBt
dGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBmaXggaGFtbWluZyBvb2IgbGF5b3V0CiAgbXRkOiByYXdu
YW5kOiBicmNtbmFuZDogaW1wcm92ZSBoYW1taW5nIG9vYiBsYXlvdXQKCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMzQgKysrKysrKysrKysrKy0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
