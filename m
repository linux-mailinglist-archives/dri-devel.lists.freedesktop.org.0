Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69F77DB3C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 09:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D9A10E2A8;
	Wed, 16 Aug 2023 07:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266ED10E2B0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 01:43:44 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-765942d497fso466315885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 18:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692150223; x=1692755023;
 h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q3G8FS9b5Oc5V/9eVnxGtyAX6OCXTlykThN+/DvVfaU=;
 b=GmCgsfIneM1Xg7pTnhgWc7TVJ0Sm7wNVksKNAh/eZo3GyvdGGCfDnoA2edjEU4/ArA
 87JR72Qifo/JvrUeiDsxA/OVecx+tvcxlE3Y4SIXfBMPNA83TYlvDVe/yHISzEmygV7E
 ZWyQqGmuUASJKQaLzLaBHChlPJ/LGKhRo9efeazoKGf5t6wVUq5Idx0vVYYSjILKl0MJ
 tHbQAzSEd5USjxzIdjFf7PKxfch0Y78J2leCEX2zOHg4drpr9oSbhS6HIlgA7nMdiQM/
 R2B6ZVZKH3Bq+3p307wqgESJP3xdKOex6YefsMQ6f6ngDF1O+443739gSNsH9G0ZB93Y
 iE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692150223; x=1692755023;
 h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q3G8FS9b5Oc5V/9eVnxGtyAX6OCXTlykThN+/DvVfaU=;
 b=Ch0ZipXyf7g9el8E/ajP8czjia8s29iJ/fLuLoBFtyiIdAZtAmzJdTE37A3Wj/AbIs
 Q5H97MTBxcqry9Gb9dM6N03ec1bEkDT1rOK4vEnEflv4nXQ/RC9pVmRRUrb2qA1yLCBC
 hkVj8+G3gCkw2kAVlWNRiWz6uDmeQtB0Hmg5/B4/V0skqGqmL4OreqcQWGV1sCRd4uRx
 N19LZP2RjcwlIXM3tqktgLp+VHtPtWhtG7/NKg37yCOdJjyCTGlXir78LiOTw4OVuBck
 fbipluDFynt6drBTkVKKlwFoQHXpJphsX1zPFwYh2isvxBNJF5PW/xhNDfisvMeEOdQD
 1UbQ==
X-Gm-Message-State: AOJu0YyDyn4TuC/ophrWrWh2vc74SvlIzbKWyLO+O3d3FjBN04PfRkHd
 iiKBWNA/3rrtgWP2fs9k5b0=
X-Google-Smtp-Source: AGHT+IGAj4wvMwFSdDB5l7cdH84cRXeKKM1BUtXA6CVRS65hzyFmRtd8Ku/rAYEEsjWa/AsxA/ig4g==
X-Received: by 2002:a05:620a:222f:b0:76c:d465:201 with SMTP id
 n15-20020a05620a222f00b0076cd4650201mr545353qkh.42.1692150223097; 
 Tue, 15 Aug 2023 18:43:43 -0700 (PDT)
Received: from ganymede ([50.110.229.135]) by smtp.gmail.com with ESMTPSA id
 c21-20020ae9e215000000b00765a9f53af0sm4104037qkc.128.2023.08.15.18.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 18:43:42 -0700 (PDT)
From: David Michael <fedora.dm0@gmail.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com
Subject: [PATCH] drm/panfrost: Skip speed binning on EOPNOTSUPP
Date: Tue, 15 Aug 2023 21:42:41 -0400
Message-ID: <87msyryd7y.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 16 Aug 2023 07:39:26 +0000
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
Cc: angelogioacchino.delregno@collabora.com, boris.brezillon@collabora.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Encountered on an ARM Mali-T760 MP4, attempting to read the nvmem
variable can also return EOPNOTSUPP instead of ENOENT when speed
binning is unsupported.

Cc: <stable@vger.kernel.org>
Fixes: 7d690f936e9b ("drm/panfrost: Add basic support for speed binning")
Signed-off-by: David Michael <fedora.dm0@gmail.com>
---

Hi,

I upgraded an old Chromebook (veyron-minnie) to 6.4, and it fell back to
software rendering with "Cannot read speed-bin (-95)." in dmesg.  Does
this error code also make sense to skip?  Hardware acceleration seems to
work as it did previously with this change.

Thanks.

David

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 58dfb15a8757..e78de99e9933 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -96,7 +96,7 @@ static int panfrost_read_speedbin(struct device *dev)
 		 * keep going without it; any other error means that we are
 		 * supposed to read the bin value, but we failed doing so.
 		 */
-		if (ret != -ENOENT) {
+		if (ret != -ENOENT && ret != -EOPNOTSUPP) {
 			DRM_DEV_ERROR(dev, "Cannot read speed-bin (%d).", ret);
 			return ret;
 		}
-- 
2.41.0
