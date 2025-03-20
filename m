Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E2A6ADA1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBA810E69F;
	Thu, 20 Mar 2025 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dv6XR1OM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC8110E688;
 Thu, 20 Mar 2025 18:53:43 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-85b42db7b69so12871739f.0; 
 Thu, 20 Mar 2025 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496823; x=1743101623; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAdNrl6o4nlJGGBk/KZ03CeLYIHiGo9zImsUibhTTyU=;
 b=dv6XR1OMf7BWOHAIIRDVAanUUJecCGzmh5uvTKlD4QJL8fdFfdC3uDXhopVG1MC+tG
 zzyNy9xRG24vzvV6b2aXAvhbmGHzemvgo4toCNG0tBJpUwYdMNoxmtlu6l3uPKEziVL7
 PH/CQUEOMB/R1Nl5NRkBR0Orj5FtO8tT89CZ7r4+pyww0d/pqRXEbAYRXUM77LnqzJis
 SB8XEM+Fc+1RKEYkD3mLBnvWbhzSaJTj/o6MsXnp+Qx3zJ61WwB+lAP2iSDlOi89A5qt
 Sbw7HU8R8G1NtMk04w0S+sOTufZR4Jjt/McOU+93GM5+WZuU8TP+erJVbP4+hmRA1fAV
 B81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496823; x=1743101623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zAdNrl6o4nlJGGBk/KZ03CeLYIHiGo9zImsUibhTTyU=;
 b=OH0NpcHbmwIocdT28OVR3DcCqDb2ryERmpwa5loSalYRtNhdsOA3aiJivLgrgcNJdL
 kTNyj+3HwSxM+itlikymKVkJxfxZDs5OToc+Lw/IthX2KH3WySeNnC9ZgmJxwjEPZwFg
 wJEbNrfNR9AgbYlgeRtjV6datCupE7AiIy1uBd3mHyQ5abxw6M4G/m+/kcoSvkaUaN1J
 RQJDqq7XGRcqsphwrnMbC5EmFjQZ4AH3uXdYoSIg696HQARaXBQ+G2V2IGvlZYrX7CpF
 l2AQXr/4QLlZ2bpo3M5yEMddA/l6bUtJPgT0ENfe+l/DL+j+tFWRNwrNu0BO+y/wPstx
 hpcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1lFwi8j5LgvR4RrNL2nIMRFiynPVIEYwu3xUCrCla8Iqdz8id38q+aAJCQNJtGwM4SF5t9+ExHK0A@lists.freedesktop.org,
 AJvYcCUmMtyeB9GBz8uZZ3j2ZR/TxgnWjdXMENKGEorDWA0UiMjI1YSInyl0UyxeVJ/5Flza2//217ssrZGCvOQlUQ==@lists.freedesktop.org,
 AJvYcCVDcZbU+qiuZMRa+v55uJpxUbqNvhJlUlb0qA9O1N3NBb6JPZYZgG+3JGXl8BkqAOZ0hq90oFxDu9JdGNW9d3KZ1g==@lists.freedesktop.org,
 AJvYcCXmFua9ioGtgK7LuQwFTeDnj0gnrmz3wLGGOBYoiWVo7fHGbC7fnWmmI27ZS0O42y2E0vi5T4PV@lists.freedesktop.org,
 AJvYcCXvsTcXgKJXYdLPkk6oJkxh2xNpMGCOdWijMy4u2GnOVJ2lcSEuUDPvol5zp6QM1TDU1hBZm5cNy1Ug@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3Dw3ggpub0TEQn6Ctj/jG0JRSeGQynJf6MOBaUZEPXOC+XFh0
 fQ7UlQq+BdgNc2ZvOogyMhJWQPpWXFS4qAlBEsR6PQMQXzmzFoJa
X-Gm-Gg: ASbGncuFpwLm47EFSU+l6YzvOgiGBh2VYF4BcDlER87wcSq38HWTD+GITJAhQGBklvR
 Ph6n17eimDWO/0Dayeb51jgoPNY93z5i70TFQ3NidEFZze1MCKREibPeMOYPuDCCy9ZRh3DRXXp
 ESKNV54BZ3w5rsvghg5n4XYqiPXzXjCwNBZVMq6Kt6yGC565IzehN95YviRPhyjwAb22jrk5KsF
 2iD0BrJzY8rjaj5YWF2VhI3bnoqRpP/KnZzrnDZo5yuyS1tsp6qJxNBZn5QyHHJgAnRUgT//OLK
 JNWanZ8zinK3//l54ONpw6RmcU/SSbQoUlcnwnw8wBpfEWFGDRwNo9kU5oDslFQEi8QWf5BwLge
 EMQ==
X-Google-Smtp-Source: AGHT+IEnonEy983P248xMfxfk4/ahHSFdlmfHVC5Vin/zWCCx+HHiKMw3js9r1od9l49MZlN3oIx4Q==
X-Received: by 2002:a05:6602:2748:b0:85b:476e:ede2 with SMTP id
 ca18e2360f4ac-85e2cb39bf9mr41321139f.13.1742496822840; 
 Thu, 20 Mar 2025 11:53:42 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 34/59] checkpatch: dont warn about unused macro arg on
 empty body
Date: Thu, 20 Mar 2025 12:52:12 -0600
Message-ID: <20250320185238.447458-35-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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

we currently get:
  WARNING: Argument 'name' is not used in function-like macro
on:
  #define DRM_CLASSMAP_USE(name)  /* nothing here */

Following this advice is wrong here, and shouldn't be fixed by
ignoring args altogether; the macro should properly fail if invoked
with 0 or 2+ args.

cc: Andy Whitcroft <apw@canonical.com>
cc: Joe Perches <joe@perches.com>
cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b28ad331742..0c4f578ea6e7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6037,7 +6037,7 @@ sub process {
 				}
 
 # check if this is an unused argument
-				if ($define_stmt !~ /\b$arg\b/) {
+				if ($define_stmt !~ /\b$arg\b/ && $define_stmt) {
 					WARN("MACRO_ARG_UNUSED",
 					     "Argument '$arg' is not used in function-like macro\n" . "$herectx");
 				}
-- 
2.49.0

