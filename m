Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2782E9D0134
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 23:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD47110E00A;
	Sat, 16 Nov 2024 22:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZWRnI4wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CC210E00A
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 22:17:30 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5cf7b79c6a6so4568947a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 14:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731795449; x=1732400249; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RNRkLfv8uiub4ucaYe1+y4yEXKc4tcPZYWyB+yk8dD4=;
 b=ZWRnI4wh7aoU1hLAEgA+CmMZ6rvh4GIvUZP+u5wJodYa2t6oX+nAtIAzbVFD493NlA
 Kyf2uUv4sl+xeukfjNJSikT5AUxLb4OTXNDCxuSeTKGcUOOhTpvIGuDdps0GfothXQq4
 NUTYG+BD231sGQjj2or6Crhv9gWw6PE79Fu3euC7Cr7eWipitQBVXdEKW9UwdGWHZJre
 G0HQN9hcn4W1pcJE3zDceS03PDaKhAp47gSuTe+X3angvwtF4jkiKYmSfbpFxPhkxWnp
 cjmtxhFTk5Zh9L8s8kvzLlAdPBh7jvAGu1d5nrak3aBnpBynmVBZ9YR7cJ9MVThDD4ep
 fyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731795449; x=1732400249;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RNRkLfv8uiub4ucaYe1+y4yEXKc4tcPZYWyB+yk8dD4=;
 b=VrX6WvMkVVbaLhke9u1/EVIRU9sWcWlZ6BU3/OwXqjPd2JLHReO+3MKG5T896/6N9+
 LgQ0ma5JPISYun1xBF2TXvqfH/snGTeA6Z38nrhz4YZ0D2Ws7mRxXoN+qomZ6tf6lk0v
 z3NsT+9faRDuzcKBrV6D9VdyQHrBwPx7q20CtssNkJgxc+xdeM9KrW3aao3meF/JOmQ/
 NYHuTS+N9qarpNYemgsWO6qQd0qae3faHSMIQuWHN2jeShFS1Wa1RqmmJG1HGOdRwdnX
 wO0CYCEdcn1t1BRf7Um4McF17a9T3Ctyoq83vZo2SfOhgcweOZuXNbjwYLLti3Wa7ouQ
 Z9WQ==
X-Gm-Message-State: AOJu0YznuPud9H9m8zohkRHgduV628xBnYLRAdQMvxrgj6DSzJXrMyQr
 Fi2tsjdhz4r+Lo18vzI1ye0zJJisQct+m7sUw0k7tG+iv77xIBXykK7Y+cB8hE+O/J6JkodG2uA
 X/SMRXRUK6d8n9yjhsnfmZKRklr8=
X-Google-Smtp-Source: AGHT+IE/aTY+U6vBRBwlGYj+Mi8CmrE2r60QAprP++Qno/mKxcLAHtXdSaU13Tt5ng4CfN1yp/8sO7kDuSx/vTtC4Vc=
X-Received: by 2002:a05:6402:2353:b0:5cf:8638:eaed with SMTP id
 4fb4d7f45d1cf-5cf8638ec84mr7580509a12.11.1731795448828; Sat, 16 Nov 2024
 14:17:28 -0800 (PST)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sun, 17 Nov 2024 08:17:17 +1000
Message-ID: <CAPM=9twfZ5B1NqByVsvHO38MGQ+ZfTEz6xmtZXQarHvKgg3gLA@mail.gmail.com>
Subject: [git pull] drm amdgpu regression fix for 6.12-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Linus,

Alex sent on a last minute revert for a regression found with swsmu
patch for final,

Regards,
Dave.

drm-fixes-2024-11-17:
drm/amdgpu regression fix for 6.12-rc8

amdgpu:
- revert patch to fix swsmu regression
The following changes since commit 21c1c6c7d732c2f6f4c5ffc77e103aa3ae8bff1d:

  Merge tag 'drm-xe-fixes-2024-11-14' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2024-11-16 04:31:54 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-17

for you to fetch changes up to f48ab0a39f12fd83fae13bf81152531565cd5e75:

  Merge tag 'amd-drm-fixes-6.12-2024-11-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-11-17
08:12:48 +1000)

----------------------------------------------------------------
drm/amdgpu regression fix for 6.12-rc8

amdgpu:
- revert patch to fix swsmu regression

----------------------------------------------------------------
Alex Deucher (1):
      Revert "drm/amd/pm: correct the workload setting"

Dave Airlie (1):
      Merge tag 'amd-drm-fixes-6.12-2024-11-16' of
https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 49 +++++++---------------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  |  5 ++-
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |  5 +--
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |  5 +--
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  4 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  4 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 20 +++------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   |  5 +--
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  9 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  8 ----
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |  2 -
 12 files changed, 36 insertions(+), 84 deletions(-)
