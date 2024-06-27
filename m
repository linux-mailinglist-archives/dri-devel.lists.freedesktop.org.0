Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4691B109
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 22:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6410EB33;
	Thu, 27 Jun 2024 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="NxJXaFV5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1CD10EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:00:10 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-70675977d0eso4367370b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719511210; x=1720116010;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F/hg2HWwWebYgYxWqneD8sQQi2ODBnC38KdnXYrS4po=;
 b=NxJXaFV5HJbDuOMLdSaGMC9eTauMfIuihZEXSsjag+GgRfF/4RSQfA3ZcrNzjUI9mO
 R5PSnBxsyTJj1LXtPRoN3kJ4vK4mwFDmC8trvivbGCYJgc2KBI3QjrjWR+YOe141OX1z
 Zp8YdbmjrQfWfg48CzKtSV98QVH/dKhUXVfDD/9qkbRr1Fvb7ZWjVNvSwyQBJikFN+fP
 KscCwsRoGTK5lpxo6nbPqtuzk/hEdl0hg/IZNSrDVz3amn3BKq5AFdUe2J4nIY6IOcOr
 xcSuArQWPN9k7A0rU7cTjsPHz0aGuyRhxDPp1kdC0HU0KB4M6XCGGeJZbxRNUpEzCfbq
 DjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719511210; x=1720116010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F/hg2HWwWebYgYxWqneD8sQQi2ODBnC38KdnXYrS4po=;
 b=YRFk2696Zd2zC6HpBI0cQMQ7nxkRIhmuUlWGbSqMF8SC0mZYZDs+qbetGgZpYwuo2E
 oO9BSQqDrvgNE0Ong5II5HXUrv+aQ3i3mZk0fSuMOCUWeZKjxu1KUZPntdIx9ksrW014
 2YPOIoqSASjfIA8jCr6JqSMfOxTmE9+ETpcC1MX9ir/3T/7w5thSw9cR2puc6kvLU9u0
 QvC8OcrhoeReen5FQO55sgbufzBJnAUlQvEJInFhZUibxJ8kc858wyTXg9bd4jb/LEMw
 IUMx+qnlwN0mzabeHfexnu6E2tHMQAW4gewrrTzLTTh7/vjjns5VxhfSALTXrxkcNfru
 fJWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSZ2dos2SOuFpTXQl7YhybpUFTLAfxvJhq8WQEN22EzxYrSBVsOxoXJPdS3KQDbVRkLjf90nbXTiy7qC4xC7qzy3v+EngiNpvk2hL0uIlB
X-Gm-Message-State: AOJu0YzkksbzQRVHAFALquLesqn6W3QpekDHkLdrfroNmbfd1kJOfgLp
 5rMuXorCJ/45NrYk53U9YSduVJH+jZ41shEDzwNBp5Be2ARf+2CLO1KIwfGQtQ==
X-Google-Smtp-Source: AGHT+IHpiobjYruEkWsJ/A/xmkyPjOBLIxBVKh+aYY3IP4fHA8HQFI4CEmsyjh9D3v0v6wGraCyWeg==
X-Received: by 2002:a05:6a00:c95:b0:705:9992:e7f2 with SMTP id
 d2e1a72fcca58-7067459a63cmr18121040b3a.12.1719511209837; 
 Thu, 27 Jun 2024 11:00:09 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b4a352c0sm1718018b3a.171.2024.06.27.11.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 11:00:09 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
Subject: [PATCH 0/2] drm: panel-orientation-quirks: Add quirk for Steam Deck
 Galileo revision and re-label the Deck panel quirks to specify hardware
 revision
Date: Thu, 27 Jun 2024 10:59:45 -0700
Message-ID: <20240627175947.65513-1-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 20:53:57 +0000
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

This is a series of 2 patches. 

The first patch is from Valve's publicly available kernel 
source tree. It adds a panel rotation quirk for Valve's Steam Deck Galileo
revision, which has an 800x1280 OLED panel. The previous Steam Deck panel
orientation quirk does not apply to the Galileo revision's DMI.

The original commit is missing a Signed-off-by: from the original author, 
although the source tree is available publicly in a compressed package 
https://steamdeck-packages.steamos.cloud/archlinux-mirror/sources/
under the linux-integration-65 name in Jupiter-Main. 
It is also on the public mirror 
https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf as the
official SteamOS GitLab instance itself is private.

I was told this could be submitted without the original 
author's Signed-off-by: if I used Suggested-by: and Link:
Please let me know if this is incorrect.
I added my own Signed-off-by: to the first patch as I was the one who
added a commit message explaining the change. I did not change any
functional part of the patch. 

The second patch is one that I authored to clarify which
device version each panel quirk applies to now that there are
multiple Steam Deck revisions. 


John Schoenick (1):
  drm: panel-orientation-quirks: Add quirk for Valve Galileo

Matthew Schwartz (1):
  drm: panel-orientation-quirks: Add labels for both Valve Steam Deck
    revisions

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.45.2

