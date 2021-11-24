Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343F745BE62
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102006E237;
	Wed, 24 Nov 2021 12:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C7F6E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 12:44:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 137so2231997wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 04:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gt95bCWbQrZOXbyG8sZ0s+drlAi3C3oxlCKpwir1aWU=;
 b=GrcPdZlouP1GwuYCIk/OZA0aTPYLl9cQT+L4ROzPRDK3BuEVvWeuM7K906VWr8LCPB
 raSxe0rAkA/kCQL9yM13+tZDjtxZVFpW6Pdi1/9iE2ShnaVgpcYlEXf7FFiAV0GiqaRb
 sboeMMmEHnFRBjXZ1N2xxSARitI8O+cEVFOb2htrLp3y6IyaDWDYCh2FGP97Xc8E+HVA
 JN6neWs8hitTlNqCCKdil98s3iyMY9o+O7LO8mk/6orER21Cf2uMdEoF7wbDfb1x6K9f
 cWSplymQxHfVIxYyKXDtLnMRDsgyumLBxHjeQCQR1tCdX2/Z/RPJc9HTxLZCMKLdd53j
 +TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gt95bCWbQrZOXbyG8sZ0s+drlAi3C3oxlCKpwir1aWU=;
 b=p8Qj7NUYenrsJgiSdq1b+YTNODzPhoCz7CzQXOmDA+cUOCdJjaMePDbxbjN96hplbx
 JQLnMRK4ihPEMek1BUsGsVE/mC7saip1Hz4URHoa4U4Uel6A55U6vo8qGHxguvm4EsiS
 ILXPmmHh4GPVy6E6lfB8CphaFS55Gq3eUqhMfS7NwpK3R+LmGpg0Wi+eaB9016sbKbnT
 Lw3gqYuQf+jm5TogfQhOCor8WV2hWjxsUWqd9MAdWGX//uiBjk8M2H6p0xOCyT//VyN8
 0Z/KPIzeMn/2aRsQgKv7IBj1pAN0+I2HNDHt/wPFbSWhY927hp3piCnDZEGZ1//WgSYg
 I8QA==
X-Gm-Message-State: AOAM532+cMnG/Mq43BhZMJFEgek4u+FzMzfri+8lo1lexeNkOxj1YqrB
 g6Cm+cSR88jVwADcAx+Ufv4=
X-Google-Smtp-Source: ABdhPJzjX4IywVOA9OOqUIt1Q83qcyi5pimOch6/7W9SwYMr2YL6714o1KCgcWmVqCzfCjjZnGwHlg==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr15095916wmq.122.1637757873012; 
 Wed, 24 Nov 2021 04:44:33 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 38sm15583145wrc.1.2021.11.24.04.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 04:44:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: drm/ttm: moving the LRU into the resource
Date: Wed, 24 Nov 2021 13:44:18 +0100
Message-Id: <20211124124430.20859-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

I've already send out this patch set a couple of times.

This fixes the fundamental problem in TTM that during a move a buffer
has resources allocated from two different domains at the same time.

Additional to that it's a prerequisite to remove ghost objects and
allow to allocate multiple resources per BO.

I should have fixed all previous review comments as far as I can see,
but probably better to take another look.

Regards,
Christian.


