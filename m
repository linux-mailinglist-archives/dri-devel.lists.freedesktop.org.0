Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E199D2A95B4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 12:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474946E1BA;
	Fri,  6 Nov 2020 11:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EBC6E1BA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 11:48:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e18so956194edy.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 03:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cA+j1sGPJcErb4HuM5DHU6NQftn7SZ7mkcmrGBBfKQ=;
 b=QmxL1lFJ66IFitDBaMOYxSPNd1JTKREmbAo4OAJufJzt5D4/Nr18va9o/IO8i+It5j
 Drfecbh1X+MOyZUfFAv+i+jfuVKmFbJcHpdu3xrAR5mQ9dOP69OYvRMY/OyELJNDoVRi
 IlOKunE28oYqedsnZR1uX7BugguRYz8+OcHyXIneR/rLTYaE0viHUjvMrbPqvPOYA7fM
 x2Zb1eZuhCL3itYrz8T2ZW3Hn8da3lewnzkwGjgX46ovseM07goMz84/V0Y2YSYFxtmc
 6pqTze14rgljgLPpMFkDhJn6lV5lezjeimLnq4lAp0drgIoDVMYNcdypb7EkSK/zBlEp
 sBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cA+j1sGPJcErb4HuM5DHU6NQftn7SZ7mkcmrGBBfKQ=;
 b=idOk+A5zuwLkuavgLqdk7GFE14VWv//b0EQXCBHjzwEu2NlQva9phCq6KKTeeP0muN
 iv3gbFxuAR9LHy5ksty6SZWFFh4dbQXW7gt/CVUvp5abgAoD+tZ/KEFXma6VGvwcXRIg
 aoFjaMzg5tEpJatpXwBs8MkkOgx7HIqFRrng5PozT0mlhG8ATXwMmz7kONMBw3G5SfTt
 kDzSuJ8RNcaA3BnsPMclzH79O4RldPkQYVKmi8tHJ5Bg7XM7IpD+t8rYVL/WSqqUHbXv
 edg9CC/EfBZ/s268Dxbot0KDQVNjeavyZ3MI8EMVj1KGXl47nN5q+S8W19DYkMKQUb9Y
 r1jw==
X-Gm-Message-State: AOAM533sK1TtcvinQXDq5x+A9Iz6u9yFnLF0/XM/jvJRedA2LPmUmsau
 En3WGTf1Na7Elv6fpW/s9pY=
X-Google-Smtp-Source: ABdhPJx1bUWAzpYpM+p3n6y8K2H67wUyqPozJYGi+fMszCHeVhpx8tb/VetBGJ/LvgazVDb1im3KFQ==
X-Received: by 2002:a50:8c61:: with SMTP id p88mr1611814edp.257.1604663289749; 
 Fri, 06 Nov 2020 03:48:09 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c066:c9fc:f8c2:d50b])
 by smtp.gmail.com with ESMTPSA id j8sm875933edk.79.2020.11.06.03.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 03:48:09 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Subject: cleanup a fix and add the vma_set_file function
Date: Fri,  6 Nov 2020 12:48:04 +0100
Message-Id: <20201106114806.46015-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

can I get you Acked-by to merge this cleanup through the drm-misc-next branch? The affected drivers are mostly from the DRM subsystem.

The fix for the other problem you pointed out in mmap_region() has already shown up in that branch.

Thanks in advance,
Christian.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
