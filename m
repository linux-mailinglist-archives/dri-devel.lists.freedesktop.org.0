Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140DBF1CF0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BB610E454;
	Mon, 20 Oct 2025 14:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h79K4kKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C110E454
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:21:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-427084a641aso1977050f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760970101; x=1761574901; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YxqmXp4v2QLMvh6syiByu4Ynx/xvLm0NtCGB4RaQEqo=;
 b=h79K4kKzwidjwE176emzuUZrC9jh1wlQlLgPhMJhKt48ZMc29DMz1sWrdaBGKBGzrC
 6OWK/n3378ma7bOz6peZ6oqu17NskCrmkh9rhr2QX60XGmbI5uTJoezZ3VnyFxsnz8Zp
 grISPoYjOHbws5+YF2PT+1/aToJpXGtzdYUJba4qzJ8gCZ8aTB8EYzbIOo8Qnc0J2kB/
 vnOJTpGJ/ZwA+LdhYC2TQYrWjfmwmkM3RxjB3br96XF0dzdRYkKKUGOwVUy56UMfGuLK
 my0J1pybX8yNJH3SmLGUyTiR3OsqjbOzNRsRKArxhFtwpfg7iSxmXyNhpVGP/sXi2Xp/
 a0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760970101; x=1761574901;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxqmXp4v2QLMvh6syiByu4Ynx/xvLm0NtCGB4RaQEqo=;
 b=H1IgTT9q79pnIWD9qNb8D1zOyJB4XZxEHuZXaMSx13pp4oQeWKik84H66ASGfKVn2E
 QPk1+EGwekUEOsmC3z/KJ4VL68v32vcXbAwZ6fMNuO2siNW5iVAEsyHv6PHbk/cMDf/x
 aZCVtkYQ3Q4+x5dvBqOsHmjvIuqLzXasIVdVtyf/rX1cZgg5zz3RN9Nw9sSVY13U4C5w
 z1Pt2kTtPeBCnbGZLw8Ahm9cvcMDgwIEdSIAhqthFKMVzM81FJkuLzTkl+6ChzEXGaa8
 7Q9ysVYloEt3hqxsfS/gNhBTWkoWCzUrPDbNc4suViaLC2p3Bs5nJWhSwNAUNLAvpVGf
 nBRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8Go1sCcM6IYP0pJvxI7llC2lv3fMOVCoe7RhWrATLzNo2E1kHAY0+3Vb/G8BsSLeqvSBpAktUvvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtGHiMyxHZMHsb0EnCxehTAvJmtQ3DGy5Pjv/XgNBwFO6CJfVX
 3LvmlWTKa8WO5MiU4yrhQYw3rMdYusVdMoo0y4A22s1F1kbKWyruNKvM
X-Gm-Gg: ASbGncttsWA52Ch0xHNA2cXgEcRbm5Y1oc44nRitekX3jaIBgmI4HNy5M2pwins4yRo
 Ztd0uIEvhEO1/ANdxJq7F5nAWuxgP+vk7oG5XDcFlY722DzkvY5sI4zdRFEnyDUnUfGV1TsX3lG
 sDzEY7/GuYYDVR5CKx0bmWvrtPEFvWukp5GJHEz5/ElurPHb9h3Y25YNAeXljqY5hbaGZ9GjzWc
 HHcrwH19v3GvrSjxsGC6MMtXYvLzCOqxxUPrFQ5hvgOf6x+IMXOtGiYBlrICI5TfsXJHGru92oS
 oyJ9bW+LctBVwOcnysMu4hdIcUzNwhom2kJtOcfArYh3FPX5CWrjGwSvzZeXBMLW5U6Os3MBUqN
 HhkerdZ+QnXF4X+jrwBodpqERgjKWoscivdM3IcroBWSfQ5TLcJ7itwGREjMhWdhPPPuJrrij3i
 NSO3dJzqW/jDbx
X-Google-Smtp-Source: AGHT+IHosVln57Io/lFR6bK5Ryk8CDp82/CoFu4jl9vj/N6JcHH4QxlFQapN4gi+QhSQj2fILa/7lg==
X-Received: by 2002:a5d:5f82:0:b0:425:7c2f:8f98 with SMTP id
 ffacd0b85a97d-42704d442b3mr8815112f8f.1.1760970101030; 
 Mon, 20 Oct 2025 07:21:41 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce678sm15827129f8f.51.2025.10.20.07.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 07:21:40 -0700 (PDT)
Date: Mon, 20 Oct 2025 16:21:33 +0200
From: =?iso-8859-1?Q?Rapha=EBl?= Gallais-Pou <rgallaispou@gmail.com>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: alain.volmat@foss.st.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/sti: hdmi: call drm_edid_connector_update
 when edid is NULL
Message-ID: <aPZFbe3ccrYcFeAH@thinkstation>
References: <20251020013039.1800-1-chuguangqing@inspur.com>
 <20251020013039.1800-2-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020013039.1800-2-chuguangqing@inspur.com>
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

Le Mon, Oct 20, 2025 at 09:30:39AM +0800, Chu Guangqing a écrit :
> call drm_edid_connector_update to reset the information when edid is NULL.
> We can see the following comments in drm_edid.c
> If EDID is NULL, reset the information.
> 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---

Hi,

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Best regards,
Raphaël
