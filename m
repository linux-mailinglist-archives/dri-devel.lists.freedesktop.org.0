Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7E872266
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 16:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE125112B94;
	Tue,  5 Mar 2024 15:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fiZp1Ho0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F69112B94
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 15:05:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C25846156A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 15:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2CEC433F1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709651137;
 bh=gLPbfwuyxSScV3FBIWDvzEVVNxNHjNXrVi/0DTiPWz4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fiZp1Ho0Gif3cKd09FYqiAlwCbP7RYHzUtSAw6iOqfBciarjmpll75Dlxh7MvBsoO
 mX0AiaGP8xtypa6DP7h3s6ioD4l7e94AkqUJuYCrFxOXYVitAbGmrsoba+Q02sUChM
 fbFNs/i9em8t2C697ABvxV8jHWPfwSfPbfy8AYvXX+Ijly/BdW8fO05u51bLQ3hEyy
 03rxe3dewsZe1RcVEZQdzn/6JEnOIt2xgItW5ATg46l041uPcdEzq0TVKCUV4Qo0FU
 bO2XzBr4Er18JgJ9DR1CLM/LcDIIJ4RWfcjQ204eL1eYn0WPL1KRvdtzbbajdjzDxH
 Yro1afGOhA3Dg==
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcd9e34430cso5820224276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 07:05:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVaxkp2jMb4tkXiq/3E21GQaPc7kXv15uEliQ7Ssk8gmqGOnXynp0stn6FN35eczoUgNdNpGAuWitntDf5oeR+jDE5BC0FsKzbUM4VYUHbG
X-Gm-Message-State: AOJu0YxY4m+G2EgZB8uRUwHaZixLFjDNEq1GGIPM3EndjwOEvs/HIluu
 RgxwgtO0EWQxKZ2jqLYqK9bIwP1npgszLSr4qQrQFf2Vaefy32cjmOoea9yfw6P8/SOSZ8atXcV
 GEcvEeOVrJuDo1p0UQSWLUPoM9jIc+kyjTIaYIA==
X-Google-Smtp-Source: AGHT+IFWDUM9HwjAVyidIugRw2o1bmiLQVQlI7WwFoXm7E/t7apfeZzkR+tB9l1gWqxkRhVhPTEX9nsRr8SIgWb3PLw=
X-Received: by 2002:a25:b91:0:b0:dc7:46b7:6d67 with SMTP id
 139-20020a250b91000000b00dc746b76d67mr10095871ybl.33.1709651136730; Tue, 05
 Mar 2024 07:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20240219-adv7511-cec-edid-v3-0-445aed2f1cd7@bang-olufsen.dk>
 <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
In-Reply-To: <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 5 Mar 2024 16:05:26 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4WzRPKRFTFcK=DwdL_Z_gJPugM1BYaZAGEq2GEkAq_TQ@mail.gmail.com>
Message-ID: <CAN6tsi4WzRPKRFTFcK=DwdL_Z_gJPugM1BYaZAGEq2GEkAq_TQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: adv7511: get edid in hpd_work to
 update CEC phys address
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
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

Sorry to ask for this again, but this series has non-trivial merge
conflicts with upstream again.

Could you rebase it and send out an updated version?
