Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A9CAB1463
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 15:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8746510E287;
	Fri,  9 May 2025 13:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nJRpLgVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FF810E287
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 13:08:54 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-7304efb4b3bso1258372a34.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746796134; x=1747400934; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5Pd/m01PDi5c8NuGiBbVhA117WkSdRT+UArDIp/Z3Jk=;
 b=nJRpLgVkxWrWgpp+Lb+NAnU3i8mxXuYlltZKiqVQvUWetPsQlhwxkB0yOZXHjs3hHL
 LtN3arOgMsUaM6/vTAE4B+iZ6chq3Ur6OhE07msIgkRrPGs7oVTJUNwsxzYuBrQtbyS1
 dxhUGNGNnT0Iqr9uLWzMNRD/JDAbejA5fAQwwYNUPGFxbkjL330bn18SkMqI6uTdh0VB
 O/1vxtt/2T2XrCaGeh5glmClAyv197xTID8miFo/CQi3F4WP8Rv0hvGm4VPenYd7wacN
 YJHz0pKj5kjV/L2ItG3Y2Llg0E4lTtlbJj1mlm/5g6j4c+OzfYtCZf0VMEkiAV2XoSI+
 wMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746796134; x=1747400934;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Pd/m01PDi5c8NuGiBbVhA117WkSdRT+UArDIp/Z3Jk=;
 b=CrpKp2fKGcStIjFYY6Y6js4IzgK15BMIjpNxs39TGJc6pN2/FAngFE9lxPOT+u3FIY
 WRk16cz8q+bMatM9iB9rk0MJni61xkgn9kSDetyUFO5p+7vPfvifjxSD488UeXYlBT09
 CQZxJQso5PM0+qGe5Fszd8+axqgLQZb9emNHR3Ku3TQTp6SOB+7NjCwGAwickiw0vto0
 BSlMo22nDe2BIU0wldKLThW5Jt2nvn2CmpoM8GgA7qBAW7tUFQ8jIpzaRgNP9O5iwT36
 kstfMh9ThSJF9eHi4hXmGECvRy51PqjOimSEKB9sJs5+M48xQoFMYxNwIcIkOaC1HaH+
 Bozw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfmU22YmKhj6TIJm8BiC/h8ot6XgnaIu2FCeipTbKg6hZQEiXBan1cJMd85/6F5rNUgjmxWA/dLdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgM9vLsAFiIEr5zCAcwfLTUeS8eiDdT3LBbE/vabL5A102zgnt
 cSFTw2MkJsp4FJmvVipC7eAtWIBtRam5ByiFqwxKxY43HVD3em27
X-Gm-Gg: ASbGncsycSYhgRO1nzqHrBmppUKE4EHwiX1d3XPcanttU2oX7WmT0K79gsjDDgUZt1I
 6arWuUfxg1lTN1gY2o+owjbuyTzybO4/dPgSL/i0ShF4XeNN1au/S7Ijx1PEaoFZ2L8bdxITq1C
 PbqQexGV6g7FkgSzPuBbobGOB9rkDC8sXXoE1M7Q/QVy6m9uM/JvaTpTOqBJBrqUS4cLvpMXwsK
 667kZMt/wGAr+vNPFs6doay7CvhHwMrMQd3dIX/WbpAFo5BxVL+G14im0M2rNmO+QCmpQY/8k4+
 VVhPcNpal4b/J7/VcodIhdpDqknjKNP+YJpkbCLmQtzWSVP6
X-Google-Smtp-Source: AGHT+IFEqGEU4+gmYrxK27SseVuJ9zHCcIk/byTROyoULXtbOeqxt2NTixyEVGYHAQ9VcKae+xCSqQ==
X-Received: by 2002:a05:6830:4181:b0:72b:8889:8222 with SMTP id
 46e09a7af769-732269fa0d7mr2673118a34.8.1746796133759; 
 Fri, 09 May 2025 06:08:53 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf:a91d:390d:851e:20e4])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732264b143bsm525881a34.20.2025.05.09.06.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 06:08:53 -0700 (PDT)
Message-ID: <681dfe65.9d0a0220.1c2d35.592e@mx.google.com>
X-Google-Original-Message-ID: <aB3-ZLAUO7YThhoF@neuromancer.>
Date: Fri, 9 May 2025 08:08:52 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ryan@testtoast.com,
 macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3 (DE33) support
References: <20250507201943.330111-1-macroalpha82@gmail.com>
 <20250508-foxhound-of-interesting-drizzle-34adae@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-foxhound-of-interesting-drizzle-34adae@kuoka>
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

On Thu, May 08, 2025 at 09:26:24AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 07, 2025 at 03:19:19PM GMT, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > I've spoken with Ryan and he agreed to let me take over this series to
> > get the display engine working on the Allwinner H616. I've taken his
> > previous patch series for Display Engine 3.3 and combined it with the
> > LCD controller patch series. I've also fixed a few additional bugs and
> > made some changes to the device tree bindings.
> > 
> > Changes since V8:
> >  - Combined the DE33 [1] series and the LCD [2] series to better track
> >    all patches necessary to output to an LCD display for the Allwinner
> >    H700.
> 
> You have here three or four different subsystems. This does not make it
> easier, but it makes it a huge patchbomb with unspecific or complex
> base.
> 
> Such combination makes no sense, because anyway it will have to be split
> per subsystem. You just know made it difficult for maintainers to review
> and apply, because they cannot apply entire set.
> 
> Best regards,
> Krzysztof
> 

I apologize, please ignore this series then. I'll break it up more
among subsystem lines and note that they are all related in the notes.

Thank you.
