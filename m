Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9A4B740B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 18:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30CC10E4E5;
	Tue, 15 Feb 2022 17:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98A110E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:23:03 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id p15so45700397ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YwOYJoWc5iDWcqc0rAzSqHsUy+2x7wZlhHETKB9514I=;
 b=QyulXym8JACu8meGc6fCX+ripNM7rmXeYJqoCxoo+CUDCPo1TetcQLZhUXVYtMb4OT
 qwP6E3lizOKl6yi4Zifs6NdKtLbxPjnQRDGrbqfMfOHRJPs53unNK9WXI5Ve1KFZ6Hpy
 QE09Zks+/ZyFit4+ZTVORiKLIJMQiM/VhLEmBIhFLRWhJeFUFncK8MnaiRQI1XnB+Jlp
 mKiOBf6gk7ikvz8SCMzux4Bh3ajdvbkoOhumSsU57OJj6iDETfF945KZBykWREoMN/fP
 PKy4jSTdZqBiKQ8TmMAG2limythgZ1sx2ChllGYz6TbW81JtlAm88VI75TKYGuJGhvsl
 Sumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YwOYJoWc5iDWcqc0rAzSqHsUy+2x7wZlhHETKB9514I=;
 b=Asj7FoWZ40UaU0tbAx7XYPC/cMqsG1uiLBZDYkxeaHhouq/UUJAhNIDQ9XaCTDvU/z
 7d9s9okSWls/unDbdrNVVnxwBzBwRHGGbvowxX45DNy5nOH5lNMk/HH0mmQgxDDbxbRs
 kYM6wgF8L/XipH2dhJ+OkDWtfTe2DD0oit4pDQhlXKRjFd/2qixnLpd8jzbwbOqzBPlR
 m3ht2FCUnNuNB93XzZbqXiC7aYUXNtGSyrFOqSUTIGXGGc7YGqMrM/n7FksMOSXHbYEa
 ecv0u9xvK4HmfWjbJ/T+G1405kmYV8Cq7/ECbRCnaV/niAmy4xBDcmSe4VSpxZXMaUnm
 ddjA==
X-Gm-Message-State: AOAM5300v/lVYh7jk5wxc1ZL3mgyng3/72RZ6FzX9U170g0vvr0gdR+J
 T3APj+6hEKcorysi081AssQ=
X-Google-Smtp-Source: ABdhPJzm05GoX9Bixjo22KdeF97yho4kQgLd9Ihag95XttI10qtPpl8ex8AchEZIhtVUcxUyYK2S6g==
X-Received: by 2002:a17:907:a0c9:: with SMTP id
 hw9mr62659ejc.421.1644945782122; 
 Tue, 15 Feb 2022 09:23:02 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 18sm3521310ejj.1.2022.02.15.09.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 09:23:01 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com,
	felix.kuehling@amd.com,
	daniel@ffwll.ch
Subject: Reworking TTMs LRU handling
Date: Tue, 15 Feb 2022 18:22:53 +0100
Message-Id: <20220215172259.196645-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

in the last set Felix pointed out a severe bug in the iterator
implementation and after investigating I've found that my test case
didn't even exercised this code path.

So after fixing the test case I've found a couple of more minor
problems. This is the resulting patch set with everything fixed as far
as I can see.

Please review and/or comment,
Chriustian.


