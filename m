Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8597B286
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 18:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D34110E4A0;
	Tue, 17 Sep 2024 16:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J1zqAZzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACBF10E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 16:02:47 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso61900181fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 09:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726588965; x=1727193765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmO+mvccPH3HoFLjdOHsVRubWAgC2YHdv7d1kMMRDLg=;
 b=J1zqAZzyJTrCdHIPhnsMFkEqANEN5Tf3D6zaqrRnwHJCh40NxP64O12H0CcNwjOciC
 A4FptWRyAmhIuz1OKL0iwrUwf0SsDRGGhYaaeybGpC0MA+M6yp/lF1ZHFqCVHzEjStqg
 Qixs8zyryPm85mni8z1lfJqAOruZ8sBqV6Pie60BhkIjCEo5vilNxRmYk723u1vBNyET
 1eFO2tvik5m3YT4dNnLPwkbIzhAM6TRIwgnstB+I61/KH0/12gqILFOSd2iRempzRT0Y
 DlM2bgR96UfLbSZKeNmeNxulf3/Dm5sijKxn2bDEtkWvdCBxuRKfhpqa5q31zGL0wuYu
 5K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726588965; x=1727193765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmO+mvccPH3HoFLjdOHsVRubWAgC2YHdv7d1kMMRDLg=;
 b=Wngvyjxh29MmudFXRWzCS3yKn23JWbv+qwdU8bQs4+gRrAv7w1wJvrmprmi2DqDdj5
 ra8TgT+WN7gqmLY90hMzSge4wODjYHLnJFW8t11XTR97vLLBYEYQ9nN0zk77Mid6OPDu
 VEr+OSSM3Pzmm+/YzAuApX6qFKXZ68rCxlfBCk4g1UpIjsGPCM/cpP7D+8r99QEV8eOr
 L8dv98gh/eFID6YYS9kQb3Zkt6W/6H1LVwqNkNcXk8bfR0YyYTiMx+EqhqDcn9Auwo7o
 Mmgdxtp7AB72ENCdaTmDrc2MaDo2IgIDe6SE8KAB3GCKGOVTGMTyF6NmgSo51bGb/MbM
 emlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbsTBNIwQJDzhYug/hnmC+3bgSAnpjjmdvSE4szcvgrIk6kqefu3OcRX5nbmYH4VPKmYfiDaVb0Pc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSqkolhHj2EUki3Nc5AiJ2x+l/wnLIZEmiieoKhLBq5ax7beUZ
 3MlmRU3lT8GXkMYbpQMD++5RdG/nwqcAdBLQGXOpJUJ1rzCS/F/F
X-Google-Smtp-Source: AGHT+IEPgD8VnvpPcMCe+0rWVyMAZssxXAum20O0qWKZ6bEljf5n74TaMyhUGEPO6EJYfZZNVvUPUQ==
X-Received: by 2002:a2e:a587:0:b0:2f7:5d73:92a3 with SMTP id
 38308e7fff4ca-2f787edbc0dmr121273931fa.24.1726588964937; 
 Tue, 17 Sep 2024 09:02:44 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e81e2sm9862759f8f.37.2024.09.17.09.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:02:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 0/4] drm/vkms: Switch all vkms object to DRM managed objects
Date: Tue, 17 Sep 2024 18:02:41 +0200
Message-ID: <20240917160242.2959-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
References: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi Louis,

Thanks for making this change even more atomic.

> To simplify the memory managment this series replace all manual drm 
> object managment by drm-managed one. This way the VKMS code don't have to 
> manage it directly and the DRM core will handle the object destruction.
> 
> No functional changes are intended in this series. This series depends on 
> [1] (for writeback connector) and [2] (for cleaning code).
> 
> PATCH 1/4: Migrate connector managment to drmm
> PATCH 2/4: Migrate encoder managment to drmm
> PATCH 3/4: Migrate connector management to drm
> PATCH 4/4: Migrate writeback connector management to drm
> 
> [1]: https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/
> [2]: https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

The 4 patches:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
> Changes in v3:
> - As suggested by Maxime, split the managed and the dynamic allocation 
>   parts in different series
> - To reduce the diff in this series, extract the "remove crtc index" part, 
>   see https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
> - Link to v2: https://lore.kernel.org/r/20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com
> 
> Changes in v2:
> - Applied comments from José
> - Extract the rename vkms_output -> vkms_crtc to avoid useless changes in 
>   the last commit
> - Extract the rename to_vkms_crtc_state to
>   drm_crtc_state_to_vkms_crtc_state to avoid useless changes in last 
>   commit
> - Extract the drm_mode_crtc_set_gamma_size result check in its own commit
> - Rebased on drm-misc/drm-misc-next
> - Link to v1: https://lore.kernel.org/r/20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com> 
