Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E5966C15
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A55610EAC9;
	Fri, 30 Aug 2024 22:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h2jKFsAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387BF10E6A5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:33:44 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-82a3022be9eso17464239f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725032023; x=1725636823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRLVDlLtYtEHFRW+z5u3RzqQq8Otkw4nKdbnkHz4B9k=;
 b=h2jKFsAC9kZ5nJ0gvNVDBrkJM/N0vqdYobyP5ynd8ASO9Ax0kOQmBaFbn9Nc4omZM2
 iZSaE+aqCRGjlF51yIA5ctBCrRlHBJTJONhNPIGVVDuqKLipLUdS1zrcInEM7mXOi6Yz
 czNT7MwN7/e8Yt6K9vjAzxg1OSTj2kS4ujeO9kWyrUhxQUznAI/rsK7tSf4m5hoUWJf8
 2LrdZPc+ZzURNdL1YB38dQn/eECf+P9yhOSF2AWY2h80V6CxIAIjWw+DLisvR3ZL9eCi
 np+DBjcbuU+8+0CTVSZHWq4GLEufYZEVvzBQXl50TXZ8ARcxov+DJ1nsKcQ23C7qKD7g
 sFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725032023; x=1725636823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRLVDlLtYtEHFRW+z5u3RzqQq8Otkw4nKdbnkHz4B9k=;
 b=rA89JoDd9CfRjKmFraBRGe31AdTZomkU2ITqfKHR0LJqJX/nMG8qjpnNaAqOB6jcA/
 C7N4Fy1hHK7guuBJwHPFa35P/gSfMGpe55XPEXl4vDCs3gJxIf4ElS8PqLIG1FrGL/q3
 MelqTWvbZ7TOKVxTjc/qIFNwMuL5bjCS/gYQaQmsFQsmjALrtb9sKmaSLuYkYWostzV1
 H0QQwMTpkAHPUXQSoZ/Z+0r4i9WLz5sI7gjlRBVf45BwLBjJ7sKg8u+8457zu0GURNxR
 UvqOL8N3cBjoA7uSyoBBIjd//o8hZmOIKsDDX8kDOHBHzpQJRue4RQRH1LpPP+3HDNI6
 9UNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDh4/hv5ko8jsL3XPkdiEN0Z4h+xsYO7Ns8QOXeFK48/RA0md0ONfmDGXcDzg9aKNBsatMF9Mlby8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaorDDUKS7Ie1CWdGy3HR70U6wYbkw1k0B0yb3PfSNxOr0TU7g
 pyknBUF7TjPtat6SNmLsAR4VbKgD0zJ2ZfDJZPQFV3PrvPIcnRg7
X-Google-Smtp-Source: AGHT+IG2cWkWM/nBFDX7DVTMBeL0INFhcJoxGS1vmbMD0g+wj0qZPDln60G5qlg6TvjRsKkG7WqZgQ==
X-Received: by 2002:a05:6602:6d0f:b0:824:d9d1:e67b with SMTP id
 ca18e2360f4ac-82a110478d8mr615310639f.8.1725032023266; 
 Fri, 30 Aug 2024 08:33:43 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2e96209sm781045173.91.2024.08.30.08.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:42 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: shimrrashai@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 algea.cao@rock-chips.com, andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, krzk+dt@kernel.org, ldearquer@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 markyao0591@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 tzimmermann@suse.de
Subject: Re: [PATCH v5? 0/6] Tweaked basic Synopsys DW HDMI QP TX driver for
 Rockchip RK3588
Date: Fri, 30 Aug 2024 10:33:29 -0500
Message-ID: <20240830153329.9170-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830152132.8894-1-shimrrashai@gmail.com>
References: <20240830152132.8894-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

Geez, my email system seems to have screwed up this submission by
duplicate-sending messages for some reason. Just FYI.

Shimrra
