Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 162701C9FB
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 16:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEBF892C2;
	Tue, 14 May 2019 14:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD4B892C2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 14:05:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 7so2972553wmo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 07:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uBLwjQYTlUE1McRJe73i8PgIuA+/7ICMzrmk1UuTwzo=;
 b=Hv5MhKSNFehtirq+3nqymUdGEGR99L+4992r+K0KKZg1x0mlptOA6IH1c2FUI4+iXs
 J7sd7xh/JeTzNwOtUSKN6k+IBiMsdamHNF8Hmf9PB1YoKrFvFBaDtODZwIHt7mwwZDDD
 h4ShAIU1q48PWH1mgx4uLPFgMWcYspHWku3i2nZ+xt6YavuMpbWSv3P9Zt8t5T7byD6g
 ARP7SqgJXGg75ai+v7ZpQb6VQuELt/xBMwTCBv3j48MbTEuGLe4DcreoqIBQ0SuEPaWI
 j9gCEoB9t57SuyE3ywxIQwGJDb7VbD/YoyG0g7eCIZgxHCoG1uDyoJvpv59jV8gHZzBE
 m8cA==
X-Gm-Message-State: APjAAAX+M9Czp1qTC6iQpOKFu6GSrjN/kiixwSGm/7Et7Y/OFjCn0NR6
 KZD5BUQcEdn3igxo2TC62+qfNFTW
X-Google-Smtp-Source: APXvYqzjOu6oWnyGk0qeWbuokzryn5MBGnA1PZ/yWdNPlUMTMT43zFqwVMkUZuOZMUq9Ljb2l2tVXQ==
X-Received: by 2002:a1c:eb12:: with SMTP id j18mr1146139wmh.48.1557842718871; 
 Tue, 14 May 2019 07:05:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id c130sm8077113wmf.47.2019.05.14.07.05.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 07:05:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: Preparation for unpinned DMA-buf handling
Date: Tue, 14 May 2019 16:05:13 +0200
Message-Id: <20190514140515.35566-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uBLwjQYTlUE1McRJe73i8PgIuA+/7ICMzrmk1UuTwzo=;
 b=Zs6FsySrbOT7IoF6fodk+tDEaEVG+B0Ju0tj/uUuyRevH9FNztCoxiBFQXi2Ryx5BR
 tVTR3F9Lz6h2LYGDou4vtWyb5bkChFPsqtwsZFB2co+CyNoZVh4EEzgVjFHVhLEbvkxF
 9NBElsfxsXqK7ke0xMg6hmwQgNnTtaUXBqxknFAaBRH0YzLmAcx9f63XVjMvrv1OnexT
 2ZcDpl807q+Pwls0jT4iUypgtS3OiWJ+Z7pC3CbC7tU7gu9tLTfhQMlJMttOrZ3ZR5Eb
 ioG/y6BAc1SWhoYwLYeXreePNrbypIYSj73BQqczaNt9lTRGtdeIyIWFulifTJZOQ0iu
 z4Tg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKc2luY2Ugd2UgYXJlIG5vdCBtb3ZpbmcgZm9yd2FyZCB3aXRoIHRoaXMgSSd2
ZSBzZXBhcmF0ZWQgdGhlIGNoYW5nZSBvdXQgb2YgdGhlIGxhcmdlciBwYXRjaHNldC4KCkFueSBv
YmplY3Rpb25zIHRvIHRoaXMgbm93PyBJdCdzIGJhc2ljYWxseSBhIDE6MSBtb3ZlIG9mIHRoZSBm
dW5jdGlvbmFsaXR5IGZyb20gRFJNIHRvIERNQS1idWYuCgpUaGFua3MsCkNocmlzdGlhbi4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
