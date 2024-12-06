Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A999E9E7A6B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 22:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79A710F1C5;
	Fri,  6 Dec 2024 21:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OUhSVeUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5091E10F1C5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 21:12:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso25835875e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 13:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733519572; x=1734124372; darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4hD0H7H5ubasYxch20ZH+UNijxPFs3rYn7B8AKhEqpU=;
 b=OUhSVeUOF5mtd0+jWPynn6iVmFSaQcGi1fbvPAQyMG+c0jlT7kwUZfMh0tEx6zFnER
 IG6lDmn7/JdlaeqGAcmIEpaRLi+f9oN5Q8sjgeT9/qyXeJrRVZHY7LUc/+ufM+ELZheO
 cD5AkHNZjV93N9jWo0SOdtsSx4twhVMWK7RXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733519572; x=1734124372;
 h=content-disposition:mime-version:mail-followup-to:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hD0H7H5ubasYxch20ZH+UNijxPFs3rYn7B8AKhEqpU=;
 b=PJgJLfMWO/05ZmXAvbIi/7Ci3HwgxsPujajxn/S/Wes+rnhno8+PdSOeVFLO3WFj5F
 6fi6ketOZHWw1r3wWNASIoc29OhD0mknIS70TohI5fuWUZbkAXRjQaWSZNXYdNO+Q/R7
 OhT/Sd3/1CuhKxWzDda6pxlCmb5J/gek2+GmNFi2B9Hf6cIF10xe67Ime2r48LaC6J6j
 Q+YuQMJvp6WtvK9fd+PSR1tBJA0njQyPc+wEliDcMwi0mfnwVFTmBAA1haKDNUwP3D65
 N2M/AHcHhoJKx3mamgI/IuQa65P4/vwpnKFcb7QPRMNavM1KD5WMv/emyoRvCeNJFJvp
 gBdg==
X-Gm-Message-State: AOJu0Yzo36SMFOnQF+liY6bgqRZwS7V11d4FXcxMGsO9BAwk1QGZqZMg
 +o5PLTv3eDT+YwJoYJJL8c5uL2bTwKU2zXyJ3VhdY8wL6zS2xmReMwbmL3yuweYxKoOBvUiof32
 U
X-Gm-Gg: ASbGnct5eNrm7XoB2v1S2p+LMaWU87chx2KZ0Isw8hGQ68uZL+7c2AMK6ye8XC2hBmq
 QmiYRi+LJionVWRH5C22waRoVRwljWov9DkpC3Dmiob2n1aC46ZaZYzndQ4SRd8+lrFrXOEADtd
 1f+hP/pd25DB+pYCnKgQuhqChMBQAsTXwubaRAkFEVr/szeF61GaGBtJPPcEYNgrHyHtkeB1Cvn
 4qz8nrVOh10sKUmmqe9KADXwv5/xmlbybcM30YBsXplw2o9GxQLAV/Yaey2xg==
X-Google-Smtp-Source: AGHT+IEQ93E+RW8mzHdK01YjyET1E7wKmoxlgSLee47wINTBPgcsQz5eAWXAjPZrycxULCOMofElNg==
X-Received: by 2002:a05:600c:19cb:b0:431:157a:986e with SMTP id
 5b1f17b1804b1-434dded65ccmr36326965e9.20.1733519572503; 
 Fri, 06 Dec 2024 13:12:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0cfdsm106786965e9.33.2024.12.06.13.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 13:12:51 -0800 (PST)
Date: Fri, 6 Dec 2024 22:12:48 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PULL] drm-fixes
Message-ID: <Z1No0B2ZRO5kq7Yx@phenom.ffwll.local>
Mail-Followup-To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux phenom 6.11.6-amd64 
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

Due to mailing list unreliability we missed the amdgpu pull, hence part 2
with that now included.

drm-fixes-2024-12-06:
drm fixes for -rc2, part 2

- amdgu: mostly display fixes + jpeg vcn 1.0, sriov, dcn4.0 resume
  firxes
- amdkfd fixes

Cheers, Sima

The following changes since commit 471f3a21addd4e5f170ab1364f11c3e4823e687d:

  Merge tag 'drm-misc-fixes-2024-12-05' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2024-12-06 08:40:47 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-06

for you to fetch changes up to 1995e7d05062097109ea1807778ff8654c2de7f3:

  Merge tag 'amd-drm-fixes-6.13-2024-12-04' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes (2024-12-06 21:54:04 +0100)

----------------------------------------------------------------
drm fixes for -rc2, part 2

- amdgu: mostly display fixes + jpeg vcn 1.0, sriov, dcn4.0 resume
  firxes
- amdkfd fixes

----------------------------------------------------------------
Alex Deucher (9):
      drm/amdgpu/jpeg1.0: fix idle work handler
      drm/amdgpu/hdp4.0: do a posting read when flushing HDP
      drm/amdgpu/hdp5.0: do a posting read when flushing HDP
      drm/amdgpu/hdp5.2: do a posting read when flushing HDP
      drm/amdgpu/hdp6.0: do a posting read when flushing HDP
      drm/amdgpu/hdp7.0: do a posting read when flushing HDP
      Revert "drm/amd/pm: correct the workload setting"
      drm/amd/pm: fix and simplify workload handling
      drm/amdgpu: rework resume handling for display (v2)

Chris Park (1):
      drm/amd/display: Add hblank borrowing support

David Yat Sin (1):
      drm/amdkfd: hard-code cacheline for gc943,gc944

Dillon Varone (1):
      drm/amd/display: Limit VTotal range to max hw cap minus fp

Lo-an Chen (1):
      drm/amd/display: Correct prefetch calculation

Mario Limonciello (2):
      drm/amd: Sanity check the ACPI EDID
      drm/amd/display: Fix programming backlight on OLED panels

Peterson Guo (1):
      drm/amd/display: Add a left edge pixel if in YCbCr422 or YCbCr420 and odm

Pratap Nirujogi (1):
      drm/amdgpu: Fix ISP hw init issue

Simona Vetter (1):
      Merge tag 'amd-drm-fixes-6.13-2024-12-04' of https://gitlab.freedesktop.org/agd5f/linux into drm-fixes

Sreekant Somasekharan (1):
      drm/amdkfd: add MEC version that supports no PCIe atomics for GFX12

Sung Lee (1):
      drm/amd/display: Add option to retrieve detile buffer size

Yiqing Yao (1):
      drm/amdgpu: fix sriov reinit late orders

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  90 +++++++---
 drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |  12 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |   7 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v5_2.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |   6 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c             |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   6 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   3 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  13 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  18 ++
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  42 ++++-
 drivers/gpu/drm/amd/display/dc/dc.h                |   4 +
 drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |   2 +-
 .../drm/amd/display/dc/dml2/display_mode_core.c    |   1 +
 .../dc/dml2/dml21/dml21_translation_helper.c       |  48 +++++-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |   3 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |   7 +-
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   3 +
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   3 +-
 .../amd/display/dc/resource/dcn20/dcn20_resource.c |  23 +++
 .../amd/display/dc/resource/dcn30/dcn30_resource.c |   1 +
 .../display/dc/resource/dcn302/dcn302_resource.c   |   1 +
 .../display/dc/resource/dcn303/dcn303_resource.c   |   1 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.c |   7 +
 .../amd/display/dc/resource/dcn31/dcn31_resource.h |   3 +
 .../display/dc/resource/dcn314/dcn314_resource.c   |   1 +
 .../display/dc/resource/dcn315/dcn315_resource.c   |   1 +
 .../display/dc/resource/dcn316/dcn316_resource.c   |   1 +
 .../amd/display/dc/resource/dcn32/dcn32_resource.c |   2 +
 .../display/dc/resource/dcn321/dcn321_resource.c   |   1 +
 .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 +
 .../display/dc/resource/dcn351/dcn351_resource.c   |   2 +
 .../display/dc/resource/dcn401/dcn401_resource.c   |   1 +
 .../drm/amd/display/modules/freesync/freesync.c    |  13 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                 |   6 +-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          | 167 +++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h      |  17 +-
 drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c  | 189 ++++++++++++---------
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    | 182 ++++++++++++--------
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 183 ++++++++++++--------
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  41 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |  43 ++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c   | 177 ++++++++++---------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c   | 151 +++++++++-------
 .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   | 169 ++++++++++--------
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c             |  33 +++-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h             |   6 +-
 49 files changed, 1062 insertions(+), 646 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
