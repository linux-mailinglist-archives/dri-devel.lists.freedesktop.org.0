Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B34CB2EB8D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 05:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AC910E369;
	Thu, 21 Aug 2025 03:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XCMGxydk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDD210E369;
 Thu, 21 Aug 2025 03:01:01 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-b4746fd4793so417132a12.1; 
 Wed, 20 Aug 2025 20:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755745261; x=1756350061; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uLIq0IXj0ljbI/uh1YhQvF3IAqw8jhRLNek2lIEpThg=;
 b=XCMGxydkWEZJvvE346tkUFyL9MiIoClkQPiZJfqJSJAA6miThTvVpphAcmZBmldufo
 8Wo9/HzpemsOir+Y+hu8NF0Rz650NkQuO/w+DiQEQdT1LdsVS06yhwiIFsCbdDORBiHF
 3iaaWcXEIGUHUqeBua2Z+k2wZMtyX6On2LiVBduqzefx7/2XKQm0XojExJFibFWnKEdl
 tiy5GzK/bnTskDDJUSqZ4oObbHIQf95YzLKns6bbmqacyh+XbtXdE0Avrw32Lzt2DDms
 ctNInhgMskMsqRKtSrZnyRXUw0NeC7g1jariPMng/o1Ete0flY0B1Ksh6n5nJ++G4Ire
 PcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755745261; x=1756350061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uLIq0IXj0ljbI/uh1YhQvF3IAqw8jhRLNek2lIEpThg=;
 b=ZnaIxMU/DLMCG1GillQAE2IJwJrbgZnLlG76R/ffS0ppa9eM9eUtv25JqlS50Ks/Fd
 6IB8lZ2ArX9GH+IdjURqjGyrrBmCdyjuAICDdgisIl/59wxAXz3WFZ/HvwfCGQFDYDwk
 OMriCx46LNG80dixg5BgH8/y/mQ6eamMDo9dOMRwk/Gfi1OGZJaD40LbF1sqitpKoTl5
 G6eI9c1psc+iOsK0jZoOU8CtRBjSDkzdvdwMHOy+AokWXug7SaotHb3rldcRRKxDNQ0w
 rR/PUTKn9pHeSkylZlKN55HQbKI6saMCGLQZlkOsLwOTUAkSJXAdb55NuegvtcQM7Tcx
 nRqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNXeTOX44Y092A/CHBRiHoT781voaAiWkiFfIEkn/+3w1IW7KNYwFTRlR4dnhwZRzdJ9pjfhBs@lists.freedesktop.org,
 AJvYcCWRv655EAAvp48uXFuGJD/qMS7PRkkZ3+6EZmY8pj8MffMgP6TdSCMsqgCCIZZVyNNYPo/U5G7G+rbi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG/92PQXJuDLoJuzxX9c6rs92kGdoTnvdDC/CaHshZdrQBXrzb
 mwbYl8X/pHcMEf4kgYi4jsyJYtpL+LHamW3XqqaXQJ1jSGauoBazNHKd
X-Gm-Gg: ASbGncuMeBk7cUpCcaFH8Ev6iQjFUqiYlal/XOIFg6XPtlqC47asT6oo+JsZaBruG9R
 dostsG/UMiq2K4Uf2DhnmKhiK/2nbyQdivas35pUtjheqAcbUo47a4Ofnu/9hv2lDNEb53FVnVN
 cPbjZ0S2Dme2SrYklpxwcci0RK9FvpIwrs3DDHMz3IaWiTQthuxe73oEmn46D40DEstYhO/uNfu
 EXAg+5NFhxltnFsZtOrbTtJ7/lpdkXWdPGjY/4veqWpsOLUT9TA1NhMN5+xziE59DoSvRpwVFeE
 YWkz5twVbH8RRNdnWixs0dlqz5UnpgHFYutE8w6Gk35ILLQvDo+uPzXJ9mGWbv3T8Gl3NlkOZyO
 6S8HWYY8e/RI97kBAHYnfcZ+MIpP2fwTWHiasKw==
X-Google-Smtp-Source: AGHT+IFvneYPfHw10OoTjF7DG4R4kNeVCtXde9LOb10gF9Bf3fn+/lBg5GgGDr671XjIvWiL9/bblQ==
X-Received: by 2002:a17:902:f706:b0:240:1953:f9a with SMTP id
 d9443c01a7336-245febe9311mr14910865ad.2.1755745260921; 
 Wed, 20 Aug 2025 20:01:00 -0700 (PDT)
Received: from lkmp.. ([49.37.161.210]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c73f2sm40160695ad.94.2025.08.20.20.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:01:00 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, corbet@lwn.net
Cc: tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, siqueira@igalia.com, harry.wentland@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org,
 rakuram.e96@gmail.com
Subject: [PATCH v2 0/2] docs: gpu: fix typo
Date: Thu, 21 Aug 2025 08:29:54 +0530
Message-ID: <20250821025957.22546-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Fixed multiple typos in GPU documentation reported by Codespell.

This series touches both amdgpu- and drm-related files.

Changelog:

Changes since v1:
- Dropped fix for drm-mm.rst (was included in v1)
- Split into a patch series targeting both amdgpu and drm

Rakuram Eswaran (2):
  docs: gpu: amdgpu: Fix spelling in amdgpu documentation
  docs: gpu: Fix spelling in gpu documentation

 Documentation/gpu/amdgpu/debugfs.rst                       | 4 ++--
 Documentation/gpu/amdgpu/display/programming-model-dcn.rst | 2 +-
 Documentation/gpu/amdgpu/process-isolation.rst             | 2 +-
 Documentation/gpu/drm-uapi.rst                             | 2 +-
 Documentation/gpu/todo.rst                                 | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.43.0

