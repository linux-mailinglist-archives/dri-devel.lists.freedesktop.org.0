Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACA8CCA47F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 06:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123CC10E344;
	Thu, 18 Dec 2025 05:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k30ZvcBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6232110E344
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 05:08:36 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-ba599137cf8so82839a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 21:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766034516; x=1766639316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FjcGM5VTK5l67wkUrio2NVMt8umJm7P9p36dbsbXPfc=;
 b=k30ZvcBHEBl+ABAH96nIXjWPdyA1+w/RWc3U7mn8Rm6vPX2gmwtymCY5WDftOD9oQG
 TUlFs6gIN+c/S1rSfMwGcVQo0QLkUKjELJN+iMczYebzx1jbVqJ0XfJauBo0mDwvssh0
 GpYlyT6PqcE+Zqxr0WW39rTtnd56cRSa1a+J1SpYIlKD7+0x/GubKbwqcpYMrBSkbuBN
 CvBNxKxd7ftdVbQpAaz2Gxt06e+W3d5u56pIVEuBQkkhM2jMmWrAYCOyQiOOVqNUDDSq
 yYIiblss2ZpZkOBtWjrDJO3X5dpj80VvO7KYSXsrn/VTYpGXs2t8uQzjutM+oFKG9YJ6
 ieNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766034516; x=1766639316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FjcGM5VTK5l67wkUrio2NVMt8umJm7P9p36dbsbXPfc=;
 b=TWWmDn+2/3LMSvSunyMvqHbMYLC2xwzhM4jeSKleNGwavpoJnXrq7fvmI+HVV7YWvz
 6IGDecVYCvKrf2Qm/5P4QmCGw2SVu+iBQU8tR1S7KaL86O/4R797MtReitns6p19c22i
 bG/KtEW8YrtvkxzaNlK3ZQJjV3cEQ5pI1OgsNwBlGrARfxOgasrD9RYUQg2gNsk8qM2N
 VxsFht5IKj0dMVzddFasI8CLoivaPZKDRjflYCdTMT6ztfzACnnXrYPXBtxBDiWzHbIx
 vV9+HCJ0yOfWGtZHEL/HUAZO8I8H8NU4s7OFG5bd/8eQCtcvdy1+Ss46jWXsppRAQm7h
 wlaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO7zUSISAdbbGH7FQEXoZQ8f3DmPfq8C4Dv37hL0SPGTGFJTj1NJp6DvqG1V6KdklxZ8xW/Uu+e+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTbnSQd2Kmc6td82KC8zg9BktJD4P/Tg05z9iF82yHNNGACuRE
 /9y7FvTYt9gWbmE6EgaThHqZ/hM2bfw/u8Qi/xRR12l6QsAoYdB1asZrzS0+Y6vaXdPHpv0iVfI
 PFKGsC2dvxd3CAH6+PI4Sxu8uNPgPg8I=
X-Gm-Gg: AY/fxX4DSdu9CkO5uhayF+bKtrq/gJKZGCYmTuayDMsuF62r7NltUA+21XyjZ0Ff+81
 Oa2uUF92NgTVhHdGYe5VPjDwzKzbK+x3OnuSpdHvuEI4EZHP4EFf8y1Jm1zM10cXcnSuY5+5REF
 1xPZyKq7Ago6/F7BgHQqOMLtcg800gH4kUMiviKW9vwGGJ5eOpiIfl/yNaRY7SoY8KT80Bd8JZD
 bOsAHstSC2gZ38BHOw5eZkwD2VAHmKjqYOytvPbazmIH35jGxASQekKtD9tUrdohMIvhQiE
X-Google-Smtp-Source: AGHT+IGq6/nMOiB2lnPK9y8yr1jjzPOXZ+THQMFogZeydpYpCLbdWv0ujw5klX1QwrcBpi7ZqC5hyE567ybtLRh20ec=
X-Received: by 2002:a05:6a20:9151:b0:366:14b0:4b16 with SMTP id
 adf61e73a8af0-3755408aa5emr1988106637.33.1766034515891; Wed, 17 Dec 2025
 21:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
 <4f872e73-5961-4cc1-a826-850445235a36@amd.com>
In-Reply-To: <4f872e73-5961-4cc1-a826-850445235a36@amd.com>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 18 Dec 2025 10:38:24 +0530
X-Gm-Features: AQt7F2rsUKtXkOCC1wfOQu0Mcmws3R8p9eouU3IF3TCiZBCmsgHa4wR8itgik04
Message-ID: <CAB0uMAfmpYdGPwtZZkaBf1ShOtXbdDSdbR7Mkqp=+P+nN55Kaw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 amd-gfx@lists.freedesktop.org, siqueira@igalia.com, wayne.lin@amd.com, 
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Thanks for the review.



You=E2=80=99re right =E2=80=94 I should be using adev_to_drm() instead of a=
ccessing
adev->ddev directly.
I=E2=80=99ll rework the patch to:
  - use adev_to_drm(adev) for drm_* logging
  - drop any unrelated changes



I=E2=80=99ll send a v2 shortly.
