Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE3B0117A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 05:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456BE10E24A;
	Fri, 11 Jul 2025 03:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="js/ck2mB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A8310E24A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 03:02:05 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-23c8f179e1bso18977175ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 20:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752202924; x=1752807724;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sadpaz8PrWvHMkbxmc3mROAwLmTsdYFXlPsL8N6jUTo=;
 b=js/ck2mBOmvqf4aP+WvbQo7Oz5fn19bcm4rRu+LCgmYrSCREkEThNrH3mGJj3aE0DU
 6keBrsOohzv4orbk5zctMboeLv9yC4lVecZRp4wqYeNtaHY2/3PeHKLWvh1l6ONHXbYb
 GJLH69dbee35molyfZA9pDNf6cx4cefxeuFrh+Rjz5klQYd0m9+P06IzeBLP3PvNKHpY
 D8vpBBU8MFyOetgoyJF7dWvqQWP+tdyzzIJtBsZ2GW7t8+i7t+UoQWhOZKzNznn5dyrr
 e4Qn48EzjjBJv3umPnPGF4wTrraQeElqvYOBQmWNutP0otQl19JQ6dYAG3To9zX2cHTA
 hnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752202924; x=1752807724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sadpaz8PrWvHMkbxmc3mROAwLmTsdYFXlPsL8N6jUTo=;
 b=RGeATAarc+NF8fMCl/s3CFrDLxQHEXqN6wK363kpSJLIzGDjWftgu7FiFyaPpSex0y
 WD1Jz/Oa5DaoSlmgZ8a98spmoYrC9nOgtr4LoSaWPNaW4Fr+GPmXoGW2TOFiA+V3TJW1
 /0YLc+v5yHIYV/pD/fKUEXQcLoQH13+IdgMOFjQwQU95Pa+WHwNM5RNNXmgP7eo0QjG3
 YAVOgFPKmwp5tS45p5wL4czMVwJnBh1WKsP/c1Oo/9efUNnzZnFFabYxWoXZMscL4HZk
 e2wPtCeI/mBPBGT3xsP6vckHJD+1+fMlqLnwESb+VMyqCBuf15uDampIou585IJmL7Qq
 fUAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsvvQeKqsngm7UStY4Y5T8ZoqoAePQrSd1YQf9pZex0vLINDe5HkMdSC5WTR04z8GLejt2xBdEc30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGcqp8TvPnyr50h1ZBzHEZ45SJBHyx5iM9ZB/fY/8IUM7Ys56I
 OUFuqP3aaiW24b5KwucQ/du5p56pGmfJ+RumAQhhmWKrfpmlzYLvCGUfX1w7CGfc9a4=
X-Gm-Gg: ASbGnctF9VCXEPj6dnguTTkZAlFN9KjKYKjNyP3jWIbZwnZXlOqCqDxPjwgnvJrZQla
 nyyI7Hrb/IFADjhYH0n+5zVf42hxo7EBflRU/9wY6KPO45ZldVKck+LWddZw7ohagJIEjNW6K69
 o11fUM5amSfpv3URj7TSE1cA1Bk402XI1V+DTmjrlAMmGHSMTv6F7MyC2XK/6cXSKRLxhHzY7ZH
 mAZc27H3qYmkywFDlfr8uR8ssu0QhDZf5gG/Bs4zXfi+kdF9quHYx+LU+DRD1URK8Th03tq52jK
 IeumcEU/j/KA6/d8EX5XYOr+JmUvUbQdXRZ33vjNitDUnWN+1ejwBAEkfk3nmwN1VLHbZMsKrxZ
 8W2lYwmWyq93oAk6MypRMbT3tZTnmdc+7G7dYmmvFnkyD2TyZ8hlNGA==
X-Google-Smtp-Source: AGHT+IG3BdlUocDPxEIVRsXKPoLXrNsAE7NpPAv9kznyZrwFjv8MOOYM3yOY/fwUdxGzEatLzBzkSw==
X-Received: by 2002:a17:903:f87:b0:223:619e:71da with SMTP id
 d9443c01a7336-23dee28523bmr21809105ad.49.1752202924535; 
 Thu, 10 Jul 2025 20:02:04 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42ad25dsm34219115ad.64.2025.07.10.20.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 20:02:03 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH RESEND] drm: docs: Fix typo in introduction.rst
Date: Thu, 10 Jul 2025 21:01:57 -0600
Message-ID: <20250711030157.124778-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
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

Fix typo in Documentation/gpu/introduction.rst

Link: https://lore.kernel.org/all/20250620180258.132160-1-me@brighamcampbell.com/
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

This patch has received no response as of June 20th. If it's
unacceptable for whatever reason, please let me know and I'll drop it.
This is the only typo I happened across while reading the document. I
scanned it for more typos when I prepared this patch, but found none.

 Documentation/gpu/introduction.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b94..39b4c943fa00 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -32,7 +32,7 @@ member, only the structure.
 
 Except in special situations (to separate locked from unlocked variants)
 locking requirements for functions aren't documented in the kerneldoc.
-Instead locking should be check at runtime using e.g.
+Instead locking should be checked at runtime using e.g.
 ``WARN_ON(!mutex_is_locked(...));``. Since it's much easier to ignore
 documentation than runtime noise this provides more value. And on top of
 that runtime checks do need to be updated when the locking rules change,

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.49.0

