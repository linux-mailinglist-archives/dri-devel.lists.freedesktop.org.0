Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5179B1C5D
	for <lists+dri-devel@lfdr.de>; Sun, 27 Oct 2024 08:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD96410E0E0;
	Sun, 27 Oct 2024 07:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZxtvlUVN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9118010E0E0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 07:51:16 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7203c431f93so2642721b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2024 00:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730015476; x=1730620276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GgDp36psN/SPpIChNCHkaKRgeI9cFdiVtOP6OhBH41M=;
 b=ZxtvlUVNcyDc5FU3wfH7RKfIK4mUpi0BroA9y/HRI6gtg2xOP8+Q1QyYbN+xGC8q+d
 iK/ADB3On3DdELacSlNs/lUl7cuXYHkxhGvgDbNLvI1li8OJoSv29JAzfV/LboCmoWbl
 G8lx3zFZiqFI3JDy2HGC1xmIe2kFm/kl6cAzkvd8qK4JVoe3590Yzc8QNSsFBXU87Yfm
 3yKfFhdGifGY+JpOwS99rFJ18X8xGTGnpJcGS6e9SpE6O7yGC9YFqAKxsmzoGWclwxn0
 b3jcGQoExHPlwoBhMHcduMnUvp536v6WM+VpGoLLelVVhH2eELTvdG3uWJt4vw02s8zM
 zjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730015476; x=1730620276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GgDp36psN/SPpIChNCHkaKRgeI9cFdiVtOP6OhBH41M=;
 b=o9LLZOvcU/bmMdnwaUJ9XxxyWwcWahAHOk/T5oN/9ssK34kUypmqJGbP1U89Sz+Dq5
 Soiz/m+UCnA2wjmd9aV5ILfAu45KAmoaugXHyTwGQpAuBtHnQjnH9QpDcwR8rsuK5Dnp
 NHx8JpFFoS9cI6GigYIoLlKmtlOpVvxa+zdbuUZcpRZAYjCaT3RXogiqLGuBphXAy3CD
 qkc9W5ebDO+6jY2w9oDLjaeAdE2N5GgI4SkERebnA6Gv1OMK7UiiTZfLs277/X5Cf0Pm
 gux7h3V9TgKaaSKB5/ya6xfj4CCRQnVp51NXvDJ6NwnNfC5y5LOp6ZVtQJl5xhgkm9aT
 HM2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsYFt5q8iKkF8AIVXDIf2kNh9Vf4aRv70ziz/5At9w31QlaVcps7ry/rGmlmKLGMpjTdOAtcAHgDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjTCa8PJmT2hE66RARq3mbjeAV1qPXpatOD59XYekOb9trBEDW
 NqlWKgq4PEX/MXMPj6gyphKCV1wtbLYnZ9K1bZmSJKu6eV7+tJTJ
X-Google-Smtp-Source: AGHT+IGG3uZixxU7sLN89Y597B3CDnwHKYItbJPzYAlgedEPwGnEtMW8LACscypW5C35KUqgByz4Ew==
X-Received: by 2002:a05:6a00:2451:b0:71e:4dc5:259e with SMTP id
 d2e1a72fcca58-7206306f53dmr7211710b3a.17.1730015475827; 
 Sun, 27 Oct 2024 00:51:15 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:b7e7:6df3:9958:a45d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7205794f9a1sm3785551b3a.90.2024.10.27.00.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 00:51:15 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/edid: Convert cea_ext parsers to use struct cea_db *
Date: Sun, 27 Oct 2024 13:21:03 +0530
Message-ID: <20241027075108.14273-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Address the following
	FIXME: convert parsers to use struct cea_db
in the drm_edid cea_ext parsers.
1) drm_parse_hdmi_vsdb_video
2) drm_parse_hdmi_forum_scds
3) drm_parse_microsoft_vsdb
4) drm_parse_vcdb
5) drm_parse_hdr_metadata_block

These patches are pre-requisite to address another FIXME
/* FIXME: Transition to passing struct cea_db * everywhere. */
based on feedback from
https://lore.kernel.org/all/20241011152929.10145-1-vamsikrishna.brahmajosyula@gmail.com/
which will be sent in subsequent patch series.

In all the patches in this series,
db[n] has changed to data[n-1] since db={u8 len, u8 *data}.

Vamsi Krishna Brahmajosyula (5):
  drm/edid: convert drm_parse_hdmi_vsdb_video to use struct cea_db *
  drm/edid: convert drm_parse_hdmi_forum_scds to use struct cea_db *
  drm/edid: convert drm_parse_microsoft_vsdb to use struct cea_db *
  drm/edid: convert drm_parse_vcdb to use struct cea_db *
  drm/edid: convert drm_parse_hdr_metadata_block to use struct cea_db *

 drivers/gpu/drm/drm_edid.c | 126 +++++++++++++++++++------------------
 1 file changed, 66 insertions(+), 60 deletions(-)


base-commit: 850925a8133c73c4a2453c360b2c3beb3bab67c9
-- 
2.47.0

