Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE9026CA1C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 21:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26416EADA;
	Wed, 16 Sep 2020 19:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF966EAD9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 19:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600285661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tkD7fLHRzfBDrWOBVG4rZwkIcJdSt6QPk/vTM/imCo=;
 b=P10fWj8ii/Esto9OKI4uUBvkt9huUivIGVxEkM13tfhoWEqPB+gDxv2/jDecpAjhlHomYo
 UwU1RbjglMnYmpT+r0fzASYVulqtkf3NjeavMpiaPm+QsMTH7EiCbUBlVP5/8shE2Hjes/
 19f111tGtvZ5X20hLEwuul3qZx12ow8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-7aON-MJ0MRiAhLhP31hTGQ-1; Wed, 16 Sep 2020 15:47:39 -0400
X-MC-Unique: 7aON-MJ0MRiAhLhP31hTGQ-1
Received: by mail-qt1-f199.google.com with SMTP id p43so6974750qtb.23
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9tkD7fLHRzfBDrWOBVG4rZwkIcJdSt6QPk/vTM/imCo=;
 b=Dak5IS3842lgczQQkz1OkJuKTAEAWqL4IfrMz0LsZ+8JDBJkd9GdrDSJMNuLzpbv+n
 ZzDyMSQTU4Bs7zeoWz5kwmo0RqmgqiXJp61Pl4XSpQEM1TXoNxwOKepqJxnKr1OAwM4s
 It2xXx+jTjENeZ0tG0xg77C+CVm6eREiDKSaWpKDKFqeaVzeyPTwPVlexO4GHO5yqxJ4
 upVIzR5IWrFVHTofDvSMWWDWA5qslCOHpR/7Nq7dNemX3CaomY47e96bRphmweRcAU0K
 ynatd+5L1oMlMJ8FEABfWeLZ/yzRlZLkaA1cHz4+hLjSSlx9CwGvXn3HxMqUqb89CZAF
 CsfQ==
X-Gm-Message-State: AOAM531bV9RZhr5PM2akJISksRcWRHbety7a4DnenszgPKGk09eSNW8g
 dJlX18z45hu57BGqueZ8b2gnTRgqB5ibvyYsOdNyxiN2SexEbWwVPKZTVDf5RgVRjRyyiFNxNpw
 ooGOxmpf++/qcdBjUr22rVOAcDOf5
X-Received: by 2002:a37:a514:: with SMTP id o20mr23551153qke.374.1600285658950; 
 Wed, 16 Sep 2020 12:47:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxq3px1MuOCLEAZ17g8N7rutkh9QqWBZHPIaoMca4ZxTzOIagFtyp9Bsgm4Yt1jLSoR/n1gQ==
X-Received: by 2002:a37:a514:: with SMTP id o20mr23551136qke.374.1600285658700; 
 Wed, 16 Sep 2020 12:47:38 -0700 (PDT)
Received: from dev.jcline.org.com ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id g4sm18683447qth.30.2020.09.16.12.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 12:47:37 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH v2 0/2] Add fine-grain temperature reporting
Date: Wed, 16 Sep 2020 15:47:09 -0400
Message-Id: <20200916194711.999602-1-jcline@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812204952.1921587-1-jcline@redhat.com>
References: <20200812204952.1921587-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks,

This series adjusts the temp_get() interface in the thermal functions to
report milli-degrees, and additionally alters the way errors are
reported. As I went through all the users and implementations I realized
that Pascal's temp_get() implementation didn't include turning negative
temperatures to 0 like other implementations, so I separated error
reporting from the temperature in the API.

Couple of things I'm on the fence about here:

* I allowed the nvkm_therm_temp_get() functions to accept NULL as a way
  to check if temperature reading is available rather than adding a
  separate helper, but was torn about whether this is clearer than a
  separate helper function.

* I added a WARN_ON in places that previously called
  nvkm_therm_temp_get() and didn't check the return value for an error.
  This may not be a reasonable error handling method.

Jeremy Cline (2):
  drm/nouveau: return temperatures in temp_get() via parameter
  drm/nouveau: Add fine-grain temperature reporting

 .../nouveau/include/nvkm/subdev/bios/therm.h  | 13 +++++++++
 .../drm/nouveau/include/nvkm/subdev/therm.h   | 28 ++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 12 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 28 +++++++++++++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/g84.c   | 11 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 11 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/nv40.c  |  9 ++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/nv50.c  |  9 ++----
 .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  | 17 +++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/therm/temp.c  | 12 +++++---
 10 files changed, 110 insertions(+), 40 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
