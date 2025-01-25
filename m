Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B8A1C18B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B65910EA78;
	Sat, 25 Jan 2025 06:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V4D6/Kb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E7110EA6E;
 Sat, 25 Jan 2025 06:47:21 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-852050432a8so79392739f.1; 
 Fri, 24 Jan 2025 22:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787640; x=1738392440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhR9o1TqB18h8Gejof58ltJDYupe0+A8Qxz5wplRn78=;
 b=V4D6/Kb64hGT7hXqDIPXBGDjI0Zll/nAIsKGCDgH+/NreH1PcFoOxiAar+t2yGvwBA
 N2Jidb/VTBwYL7VDafRHONevg/hRVWmV/6dHroImGMZPlvpMk75FDu0Du0B2TR2YN5Sz
 0NwrF58DlYJ47TCa/Zi+EJfmgWkTAuL5CfKZKa0s9HeTlrFGDYOVqVid+6+0ddC741fq
 JQ3AWlzAq8T5ptCATmgOjeLkmsruSAm8c24qFAtkaoc8CMNDcfWAYjREh7eZTwjUhot7
 bz+XgEj3mUuc3Ep88rj0B/wZovEG7Dt4mHJcpp/wIZ6j0vgNqRvJuQEVy51zW2ILsU0A
 sBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787640; x=1738392440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhR9o1TqB18h8Gejof58ltJDYupe0+A8Qxz5wplRn78=;
 b=o7Rhn9cSdwI9y+2yEPVpv1EQFQldlRlSUJ+zQ3GvUqtWjlTPMPaKh17uy5o5PQ019y
 8EXfEMwzbiR5/leKu1KlcfPc8V3EGG3lbeYKzCiZz4ahAYF/Sahuy+tF3E1s4nqqQUlz
 7jp82bLWhuapTt1y7LlKkHfSww8aiAW4CEFyppD0GX+ipiTmkdqX35uqgBrbTh/JLs2+
 L3tlP7gKSCTAEhjmD5Zb45DZYYCwJIOhQ2jm5td1ALfNaULIQavSAyYHrHNICo1bvK3w
 fJekbCIRuM5p449EFyUmHJGOBpZ3CRxPjyDnsymFvhBl9qMqPCiGXiUodCee2ihpMpY8
 vhaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU18mvy4xvY7eFGFplKgcAvVc+puBXvY4/ou07FSWv6m3ettC1N+CCzykbFwiTZUwP4PCxyQk1Vjhcp3pQaeg==@lists.freedesktop.org,
 AJvYcCVYilPk6amP0hc7F9aoiBT0yxJ0JFqts1mpLheLioj5LaHLhul6gupJV7lN3f/8TtzI3dHRe9X9@lists.freedesktop.org,
 AJvYcCW7R8ZX3u5RmNnkd9DVzAUuNMVaahnz2JdvpsJwjEXlYUlODSaOvMrUdNq0RpwO/rLovCl4l4Y1eMNK@lists.freedesktop.org,
 AJvYcCWlmVZI45T6UiE8P9AlrVKiuKnJqlvcximeSltFwvyhfS++XiiCAh7yd2MzCLOx8wbr/Bi/NWlAIxcx@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7fb1AKsB9cjTZHV+sW4mkFrWmI7Ktbo6z57rvkE36QGL6bvh2
 h7LtusqkjHnlu6BWce3WWXUp5GS5W9XM3D3Q26qpPfwBYjpvCkPk
X-Gm-Gg: ASbGncss9HBS8PmNAjtNX0rwQg31ferlzUVib3wxp9u2T5EwGFtIt1UQFRtJ2kbbZdL
 SuJWBGv0VsiXECaOAZhmG8CKNG5laOcij49UYhKKzEhLVl5UcSIoRwIzfHOZ4MCJQ8hnUHMNpWa
 GjwOQdSQf7oqRU17tC4Z43bPJ9DADxIIVwBCfR+yVE8dnTEa15NITY9pMZYLUOzFXyaDwObiEZN
 B7GJpsypTmQd6dGG73xDPHN/weRBKT0DgxeAxBn34+sVbAq0jYEdwTqcqsn0ZU5Uhk0nyoQwPQ5
 qzdYWoxSWFwx7ptD+WcX+PXajYcNhxox/RaR8Q==
X-Google-Smtp-Source: AGHT+IHZEzBNBYNOEBBToI8KiDl5Tsa5XkYH0RjpgGMIymyYt3NOZibANggXDZzgs4FwkUSL/FRdxA==
X-Received: by 2002:a05:6602:280c:b0:84f:70b6:d827 with SMTP id
 ca18e2360f4ac-8520bde410dmr633621439f.8.1737787640439; 
 Fri, 24 Jan 2025 22:47:20 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:20 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 40/63] checkpatch: dont warn about unused macro arg on empty
 body
Date: Fri, 24 Jan 2025 23:45:54 -0700
Message-ID: <20250125064619.8305-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
index 4a93b2ede8cd..8933bd30317c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6046,7 +6046,7 @@ sub process {
 				}
 
 # check if this is an unused argument
-				if ($define_stmt !~ /\b$arg\b/) {
+				if ($define_stmt !~ /\b$arg\b/ && $define_stmt) {
 					WARN("MACRO_ARG_UNUSED",
 					     "Argument '$arg' is not used in function-like macro\n" . "$herectx");
 				}
-- 
2.48.1

