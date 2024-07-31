Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8BF9435D8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 20:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7315210E6B5;
	Wed, 31 Jul 2024 18:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="DQ2Dvjgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236E210E6B5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 18:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1722451948; x=1722711148;
 bh=j/5XcbIq07wd41SYVofw1c/EmPcr+Uvp2VwHqgGr8jo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=DQ2DvjgrMj87kjzwf8jblERsqNIWu2raUVL/kDFfCLOELB9bVICBbEMJfihsimCil
 rKAncQ4152NlLnpthTTbs+Nkampkv3Ee9wZU675TwYTuW6tqPemIvsDEhWUBr4/912
 ShPRrPqTqazB53/11Ge8rWZobXdQbRc9v/8S4vm1PUrrNIKZ55arxQxuLd1W+UUBX4
 WI+OHuUwVRyFzM9ejuDG8JJQda0SqQpMtFmC4E4gp4LyPD2J0/bMPKG4VpxvtwkYtL
 4KpuRCro8iCfgLERO8R58av0ddAwYBJyqrH8AYJUN9GOKRurNc+MHFBbh4Sb11RZaz
 fyKlYcSzPZxSQ==
Date: Wed, 31 Jul 2024 18:52:21 +0000
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/atomic: Allow userspace to use damage clips
 with async flips
Message-ID: <OI4kMMLEzKSiSFR7TdYmIUAnUicSI0lW14YSJb_ylxwRrHGMCiNLnqFIe73K_s87v0z5nzRYASZD68SqgQAR08GCdLRMRCPWrWdA0hS86xI=@emersion.fr>
In-Reply-To: <Y7XXNRZbyuqt9XZPtxVFRJgywsSTpsDwdWZjhxWnYH3lPSwa0-hVV1kgXzb0q8BAMRvH8eEMdPHOvgAn2KI5HcaWazmQvRyfI7NvQBAU4Z0=@emersion.fr>
References: <20240702212215.109696-1-andrealmeid@igalia.com>
 <20240702212215.109696-2-andrealmeid@igalia.com>
 <Y7XXNRZbyuqt9XZPtxVFRJgywsSTpsDwdWZjhxWnYH3lPSwa0-hVV1kgXzb0q8BAMRvH8eEMdPHOvgAn2KI5HcaWazmQvRyfI7NvQBAU4Z0=@emersion.fr>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 3cc181851783a7a624f055a95095882c63f6a6fb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

I've pushed both patches to drm-misc-fixes, thanks!

I've added a Fixes trailer accordingly.

I'll rebase my patch on top of these two.
