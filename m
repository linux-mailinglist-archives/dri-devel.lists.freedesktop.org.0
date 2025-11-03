Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E05C2B15B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0184A10E3AE;
	Mon,  3 Nov 2025 10:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="d/6lYsgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B136A10E3B0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:35:31 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6399328ff1fso7237970a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762166130; x=1762770930; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3OAbwuarCrA4ziOc0J/HvIweBPGt0pkYj8ooSEryuI=;
 b=d/6lYsgAdQVzailcaI+1g1WCQbiQrln0bxkL7btbEOCn05f0YMkDXfoQH81fhsHEI5
 wwLnTfW++pgGAiev9m/PUK9Mv8U6ZHn9cqIxUi2oSxywM2A9hUQJX6UGhxSwaKc4dE4N
 cQl1mTrpHNpsjdxriRoUdbTeQ9Nl+53BlO42bUc/nhuc8JJBOKf+pClVi/tMQxmLVNz5
 +KVBuxHj9QtCNWcW92WLeqX8ZGbBjhv7fYPC6hDNAoN7t7vfLk3dEpOhpIaD6I11HKQA
 DbrcKGpAOgIxY/VkabPtVaLt8WXcAWGiMW0cmUh6ZrJ9Ua8dJ7+QVcRcYdw1yZePfI+m
 1FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762166130; x=1762770930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b3OAbwuarCrA4ziOc0J/HvIweBPGt0pkYj8ooSEryuI=;
 b=sC48evgBRIIdHLRcgIhX8nPVM+BK/t+9aCiioFaNxoTCDxOTS5RWi6m4LmBuS5rgEA
 S1w2xGs5bPXZwxeISbCnQWnESuuvN1EdTU6nnZrROwJaiiwYRvW8wHxP5UJIrLR0IHfb
 Lc+C2oqj/GgEAQ+bTup289Ly1/6tt8mNGIlA567Sg0Vr1H2tFgGkAWDtsqCulE8Aa+ug
 qjUcutIR5Pp98pF0h1RWvEK5/tdvMAXXaB5w71ak2/8cAdmwxjhLES7/G0LZh2VSKI4X
 m7BTpkVVNcm3fgGW24PmO01z5MGwQXc3j6cxLyAMQ/Fed2nSrblkYo0qI2m8CIYNW+wO
 3aIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgc+YMG+SvYDdCfYxlmf/WfJzlAUhGqKvr0KnqTRTNOI47q8AbtFukRxqbuLmrYsoFOaW2qLHn7xQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxsHMC2TcZsqASNM7P7kf2+MH+mP0X9B7ue1TwkSL2DYyAI6If
 9i9LeXTrdWaVaVKvOLTTtmgjRHtwlUlvbR29180u5xB1VRIJdTWKsbOiP4DeuEtGt5zlQp6+V67
 +HCkI3jf5y9q38AK2RFUam0a+BEbJwDJB8YHKU5HLQA==
X-Gm-Gg: ASbGnctt1MleZ0+7ZNdJZV4wRghc/iWrkVIR+HSC3YWhWqk4nT1VPh7pNJtmRmB7dtS
 HMzq7PuyYyReR6wVIMFYNqOk20rm+JTsd6QVoxLea8S+B80uQSfhfYS1Hz44AtxLRe9N3Dy0QM3
 WEIG0A5iVcHtQYTtiqgCpcTXsZnHLWS1Jh2kgzm7p5HlBhI8lcGysLhzOmVDg0EO75Ze5ljdkE1
 ZnY8l/ltDwwEvC8jYLety0fT2As282ewSCYbAaz7lMwzT7nR2IYoUOQD87AGI0zsrYVKUR/hlhH
 i7MfBDk8Y161VXwKhdJVsEaHo8f2
X-Google-Smtp-Source: AGHT+IGPB5QN1Gp1XLL/Y8ZjkYXSk8ZUuddVGa1GdKH+M7nB4DA/XGBGr7gVZsMOkPzwtsGVJ/k3Z4SPV8L7T0lJ45o=
X-Received: by 2002:a17:907:fd17:b0:b3e:babd:f257 with SMTP id
 a640c23a62f3a-b707010563bmr1139966466b.10.1762166130086; Mon, 03 Nov 2025
 02:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20251031100923.85721-1-marco.crivellari@suse.com>
 <20251031100923.85721-4-marco.crivellari@suse.com>
 <5ujqee7npggfcqmul6lcm44ilqrhmpcpiaxvdpcjjfawjhf63j@764n7hxk3mfm>
In-Reply-To: <5ujqee7npggfcqmul6lcm44ilqrhmpcpiaxvdpcjjfawjhf63j@764n7hxk3mfm>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 3 Nov 2025 11:35:18 +0100
X-Gm-Features: AWmQ_bmWpazZdPBsK9c0k-BLQOvItdt7Z6drkQb5vfltpmcoKofemzM9vUTIkx4
Message-ID: <CAAofZF5FJ4T6xVJfHbQdEfyVCxZLXXiZ-s6pNHjRq+GBsJ6imA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/i915: WQ_PERCPU added to alloc_workqueue users
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Krzysztof,

On Mon, Nov 3, 2025 at 11:32=E2=80=AFAM Krzysztof Karas
<krzysztof.karas@intel.com> wrote:
> Usually, imperative form is used for patch titles:
> "add WQ_PERCPU to alloc_workqueue users".

Thanks, I will also fix that one.

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
