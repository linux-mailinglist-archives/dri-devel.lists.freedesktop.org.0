Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B2CCA860
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 07:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD04310E0C1;
	Thu, 18 Dec 2025 06:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UiBq43M2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4251A10E586
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 06:46:49 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id
 98e67ed59e1d1-34c30f0f12eso227830a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 22:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766040409; x=1766645209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4DXMpQBlzOPKb0PDGmvx/k+LAdVPHJJW3EIFcNTF2o=;
 b=UiBq43M2lPo1cvgbj7ZkTaNjm+4N5tbrbaQd4q81TxPAfY6uXULWE7a+Z4FLL/Py4M
 1SpN11PBUaUramnDQwRxMYYQlA0oG5rIUhWj11loEr3+Yd/vlqo/FkcdjBNeb7TxbA6o
 gZjiVC+TBGPce0mHz2KaIiHnRMTdQ+awjT5EyE7cOgt92OjA3lSuD3C6WBheOReVxWZk
 Z7UUmCSrlfTAXcvtLWvPf4kFfCskzQ5RfZXYxSxV32ze0lyIRP9Rjn9EcFw/3Rssa9Wy
 J1c1SiHsUkLZtlvGcRS46XHvVO1vLh7s7CdGJ8ETtrmnu2zUtSwlX3/GkE2+X8CtMsKe
 NiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766040409; x=1766645209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b4DXMpQBlzOPKb0PDGmvx/k+LAdVPHJJW3EIFcNTF2o=;
 b=sdAR+NQFKYDiVlEICJJocbjlAVVMXvM9TAwRxUixCer3blyBeaMR5kwEQMqc3rBORZ
 AZGSidt9hGR3W+O+pc4DnSym4K64q+umaN5s9J9cMhVM+vSFmQGCyuhQCDhrQFcsIfdI
 liu35IqdIZHbvK3Y4WMe3FyRPrx6ODnr/zzy4Io/gHGtNuSHqi5zJHsBoCf5f0xhtx3g
 HWPn0DhT5lIiWyOj8KJ7DwG6Xsu06YfT5FfhCgcM27AaI8dZLXfMOyHumoi48aKcsGFG
 NU/ERVm7ZZRbqfjKGuzCeuw5aRQOsc7UGhc6FNSKpo0a2toqIZF1bjzTefgSorl0sOe1
 5qWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVt6c6zuz34dHg2uAXpBBeJ+4jaARSyWMTZJPHhKfPuC7UkZA7aJAgiORC9EJsPtXJL5BpiE+xDL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw572AFCeXoQu5Ke4fFxwG6yOIvqM7Lv99aFj79N971+o3Af/aL
 TFISIbF0Bf6djdwmupM6JW4u2HmxlbRAkMtojs12J2NZo79Pp+yUlXaR
X-Gm-Gg: AY/fxX4YdV52aF0Kvm3P5ZVZRH4p0rB4VYmRsD3lx0QBrR2vYaBiy8RFqVtYtjnWlm1
 SGjn43oKVZetWBBw/Rq3up/MS+LFuYHknytaojzJGcAMlOmvytLEkkHqigM7jtKa8Jet6gD8qHw
 wQ5BcQjX+emdDnwoBINVLj9arV3wjEJhpHa6ePh7o1Tp5y/lH/+dR3fzpJsbLg/BWPnLGZIL6+T
 YuwskmvLZbgyMduLJCc1uK2a+QP8HxP0p9mys3sM26LI5GUvF+epviAIIuCJDBvk6zCE2vn5ho8
 a4UWKidh8ChPWvDh+l5wIaj5GZ6KXszg9du3qXXdd1v6bzmySwrKzj20QdijsY0XxKP88EFsOqX
 BTTL1jnVp2pwzUv0FNSo9Wod7rlF6NcbXI34jK75Yx1u8eKCmQPfv7cDsrGTsfn18rjpm3kL6Iw
 2Y0a5+OSXEtKiM5Y1IaryDBREZVNBfXw==
X-Google-Smtp-Source: AGHT+IFdoRZrRw5QtahV2gQwoNmNE41LBDvRqQFg+/l7MdbEQhD1YMberBYJd/2SCYxQ4wWDPjvV0w==
X-Received: by 2002:a17:90b:184d:b0:341:8ad7:5f7a with SMTP id
 98e67ed59e1d1-34abd848874mr17858772a91.18.1766040408650; 
 Wed, 17 Dec 2025 22:46:48 -0800 (PST)
Received: from LilGuy ([2409:40c2:1022:14d2:aaa5:8d6d:efa8:e19c])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-34e70dcc7bcsm1448312a91.13.2025.12.17.22.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 22:46:48 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: swarajgaikwad1925@gmail.com
Cc: airlied@gmail.com, david.hunter.linux@gmail.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, simona@ffwll.ch, skhan@linuxfoundation.org,
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH] drm/xe: Fix documentation heading levels in xe_guc_pc.c
Date: Thu, 18 Dec 2025 12:16:38 +0530
Message-ID: <20251218064639.7474-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209094836.18589-1-swarajgaikwad1925@gmail.com>
References: <20251209094836.18589-1-swarajgaikwad1925@gmail.com>
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

Hi

I’m following up on this patch from last week. It addresses a couple of Sphinx
documentation errors ("A level 2 section cannot be used here") that occur
when building htmldocs.

Please let me know if the changes look good or if you would like me to
adjust anything.

Thanks,
Swaraj
