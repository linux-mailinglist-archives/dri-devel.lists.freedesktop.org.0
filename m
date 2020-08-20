Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F4C24C218
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CB96E51C;
	Thu, 20 Aug 2020 15:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF016E51C;
 Thu, 20 Aug 2020 15:24:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id p14so1966818wmg.1;
 Thu, 20 Aug 2020 08:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oenYgVwjipRowXOxqjVtyCUoSYNlrcwj67+GMIuDko=;
 b=MMcF+mOJYvPA8akpQ24nuA8lBBX8oTQa+MTImWvnuSGIgxSE5pkl/7lVj78wmvGkYU
 HZ+4SMmlHfPArAwZlp+L2GhZA6O/DwFvBnSweDGjmgogoU/HHGB2sqWMqE0binWyjZcy
 MFh9+EGU1nJXEguBk2ACIu2Xn53JD4J8c2TAJ4cXzU5yCim6aQ1Cnht4vhF7I2g0SQML
 7Qv7tNjOiQMeEmz09fZ4IW+WPQXjZbFIIcir+Wj74I5cpO06KC8xZhJEZhMiA3i4NGpi
 p7Hs5Oqt5Ps4zqlLpG2mPpsIfliNdl8G50qeQ/wo7TvOzAvh2/Ie0D6zvLZ0LJLFHtTM
 TgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oenYgVwjipRowXOxqjVtyCUoSYNlrcwj67+GMIuDko=;
 b=ct9rZsimE+EmqJkRI0wEBHhoaMZgyAmhA2rxgE1VPoIt3XKFelAQZXe5KwB2uj8bgn
 Bos90hxvpVXqfer0LVl62USLPh1QB1lPOVpjiCXV8oHB0BMOCwkIR3p7ueLAo2T69h2r
 mhiFDg8ivGE5TVrTm3rxVhqaEt4hHzDTtmGTw4ZdLg6nznyGZrOdSknX7mGjS3Cv0ew5
 YVo5zfvsOP/dxQXblDVU4QIh8Ae6OqM2oL1FX8JqLr2xHmuSa/LfO9wleijgHU2Ua75+
 sW2IWWux0RFwDhH6v57uaLuY0iiPyYfHU/rx8/ikbFNTdperscfhK6KReEhdX7wneHMq
 p9ZA==
X-Gm-Message-State: AOAM532SZ4rJEkYnidlX5uX5Hq2AqcIW/vkHPyZ4A6kBW44F/mWFYEqR
 qVf79KJYW0py6wXVvFpg+Xc=
X-Google-Smtp-Source: ABdhPJyvBb+CFqX4CdBovZi/pEYpg+bK98og5+a/Qm8XiuLZzTfQanJcsTmVJ9CEI8ec/owiExAUxw==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr3755921wmm.132.1597937046626; 
 Thu, 20 Aug 2020 08:24:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6f64:e393:bd4a:2d65])
 by smtp.gmail.com with ESMTPSA id t189sm5320708wmf.47.2020.08.20.08.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 08:24:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com, skeggsb@gmail.com, dri-devel@lists.freedesktop.org,
 Nouveau@lists.freedesktop.org
Subject: Moving LRU handling into Nouveau v2
Date: Thu, 20 Aug 2020 17:24:02 +0200
Message-Id: <20200820152404.22774-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

I already tried this a few month ago, but since I don't have NVidia hardware its rather hard to test for me (need to get some ordered).

Dave brought up the topic that we should probably try to move the handling into Nouveau once more, so I tried to fix the problem Ben reported and rebased on top of current drm-misc-next.

Dave can you test this? At least in theory the approach should work, but in practice there can of course be bugs.

Thanks,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
