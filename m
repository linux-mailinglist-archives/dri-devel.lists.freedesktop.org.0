Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940E927726
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 15:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5B010EAF5;
	Thu,  4 Jul 2024 13:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dw+Ulh+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B77010EAF3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 13:26:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-706627ff48dso422911b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720099584; x=1720704384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TaVzTCpKDgZG+VdQZ3FcaSSV6KNs+Es3hAkiC74Kydg=;
 b=dw+Ulh+SqebutxcriACueC/Qd80RBhtRVossLlA3OOi2sNpmx7uSuixe/t7jCr8sgy
 /3/5Zp0OK5CN892IKm6nhcgIFrOwp5rHEbajJZW5ahPx2y8y1ngkjqO1x7YCm68KrU9B
 zsIecqi5H9o2gHhFBrmb1A+fTxpv/NCVsQs40pLqBeG8rOWXTR9dSlgvjfA0eHxp/KfM
 +90R3AvaaDBURCopIrbcLx4Y62N7RWqqaYvhagaDdKCj9/agdxAWmx/1bFytDhXgm3wM
 Fi0aI/Eq3EiX5qWxwEZZgGYhskMAgzNfM+Aoi14EzhLSiom6UKGLl97XRDaPYlFVzcRQ
 VnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720099584; x=1720704384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TaVzTCpKDgZG+VdQZ3FcaSSV6KNs+Es3hAkiC74Kydg=;
 b=FCBOr0JO1+/K4tjTgJPhNKQUbKaiLK2JGszzspLp/8i3LStcR+K1GsqmmDcZ2yqPS8
 GiRacmWTeqOi0PAKLipoKoFI9WEfUfzlbPvKWS9aYmzX+Q/ShWS5efAn78w0B6Zvhyj8
 B1abnWfnkqpBmw5veoL3LZHO7CUBBSk2iFESmZ+1mFJqVnp6PEGbE7bowg5UlXw5YmJY
 qmx3HtwiUcb/lWy1vxpI2KgvqlVLNQBeuhh4rCO4T3JJjcF8InGzSvxBppryeArF7MZU
 zw6w0HaaU0vMsmnS9ijeGddSBgIMn1hbphAlPPI1dxfRUCpl92R3SgUO5uJ6wK2yQbXk
 KNww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyLeFkm/hoEReu7RpDe978gdShYxpOTO6u9m0NNprkObXgj3r2OP9Y8GNQnCiqYOfR1Hj78h9gazSCCg2UZj7hRqpYPHtRsAG7Byc2yxDL
X-Gm-Message-State: AOJu0Yxo8b7K45jQES8f+jMam/FZ0ulFy4GcCxcJsGulZYmetadHeCQ+
 +CoY28Rg0ZB4ExwR8K7tcTVOhN5p5OSi1rp5AJRI94gSg6MDNxbD
X-Google-Smtp-Source: AGHT+IHbSroMnL5diSYrVgL/mJFXNL4zWVBDdG3SmCpSPdMUh9pV/LB7fswxNCb4gpEIyClqhuQ/MQ==
X-Received: by 2002:a05:6a00:1ad4:b0:706:6b38:f065 with SMTP id
 d2e1a72fcca58-70b00b98665mr1604134b3a.18.1720099583701; 
 Thu, 04 Jul 2024 06:26:23 -0700 (PDT)
Received: from dev0.. ([49.43.162.39]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70803ecf757sm12200005b3a.104.2024.07.04.06.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 06:26:23 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: javier.carrasco.cruz@gmail.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 jain.abhinav177@gmail.com, julia.lawall@inria.fr,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 skhan@linuxfoundation.org
Subject: Re: [PATCH] gpu: ipu-v3: Removal of of_node_put with __free for auto
 cleanup
Date: Thu,  4 Jul 2024 13:26:17 +0000
Message-Id: <20240704132617.1003914-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <035757b1-5dc5-4966-9eaf-a52b707bd48e@gmail.com>
References: <035757b1-5dc5-4966-9eaf-a52b707bd48e@gmail.com>
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

On Tue, 2 Jul 2024 17:29:14 +0200, Javier Carrasco wrote:
> Hi Abhinav,
>
> Apart form having sent two different patches with the same title (hence
> the confusion), this cleanup is right from a functional point of view.
>
> On the other hand, the description should address why you are doing this
> cleanup (e.g. to remove the need for explicit of_node_put() when the
> variable goes out of scope). The need for of_node_put() does no vanish,
> it is only automated and no longer visible at first glance by means of
> the cleanup attribute.
>
> Best regards,
> Javier Carrasco

Hi Javier,

Thank you for the detailed feedback. I have modified the patch subject as
well as the commit description to better fit the cleanup task being done.

PATCH v2:
https://lore.kernel.org/all/20240704132142.1003887-1-jain.abhinav177@gmail.com/

Best Regards,
Abhinav Jain
