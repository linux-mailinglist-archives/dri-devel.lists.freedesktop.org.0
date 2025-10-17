Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12ECBE99F9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6E510EC58;
	Fri, 17 Oct 2025 15:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Z1vBsP9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DB810EC58
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:16:52 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b48d8deaef9so399693366b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1760714210; x=1761319010;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0Yt/6++p05sAqYj62fKBAZskAYW8+TXhBVJRVFYeOPc=;
 b=Z1vBsP9r075+c40x4bGyArAdNPijU7xariN4p5bhLB/VJwpz6rh0rwGsULy3PJLpNe
 RXYG+CAD+Jzh29niiBplXnOqmecIzza5vYtMlldLMFoaW+rxdOF/Bq8x1XoU4IkaEoPj
 CK9c70/fKUgCTNSSFAvc67lxF/oC4ontLRahc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760714210; x=1761319010;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Yt/6++p05sAqYj62fKBAZskAYW8+TXhBVJRVFYeOPc=;
 b=UOOgLc/2JAQ5NTdYnTii1L8Y43TWmsxcO+c92dPxp+oQB9vmLphFLO9azPuT+Z56xf
 l2zMxKIda0PS3p7YNVGxmWTZY9MGVJZiFg3y7SJypR995/mtJ8/kURTuVBil6UBl7RGt
 BffSdbLdTjBL6YgN0F1gM5P+NXRBRjA1Vdsn3Jjzyxh3b6/ACWpgGBuf0vZK7I2iszh3
 5DvyUvDSfsuPzc06SvCoU9/4Z1vpC8Yefg+IoiyeNIupN9KGRx8q8qftGSNiYrgb5tV6
 q6cueZVU9P3jpQANwwkUsgVH1MsTF1MoGKrIKf0URfN+Lr15G3manNY+mM3CaHYmLe75
 BDWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAwsOTjE70WMB7qUinpWhOUynTctGJvvwrv0ocpY9Je/FIqSGLkNyAozknbRlacK24t7psEfmNyWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIgVD7Zy4BJbDgP+mmnIVfc9Gt6dSplfpGTNtQtA9g/5Ud3vl6
 0j3hUlznE2H0OfJllR/kHkTDFtzoxoC5X2xECStBTfUkYpKA7qvThGhUPRhrn3Y3G3k2v7/tYHM
 KjxAJkZw=
X-Gm-Gg: ASbGncuWfohV1c6egXjIm0T7ADs/Asx++XlwUz1y4TtHcRbAWOm4+rbNdvGZCMrt0H7
 KBiVH8yXMM0jjRzXsKr0/Ze9YCNlbo2dHu4aQ/om6haW0lqxxWTePs+KkdbFozJJnglIkBSLAiO
 fjVipPiy1sw4ojexpk8H3ODqc/zCzl8zHNR+heiShPMs14/KGSVFjTt/fHMVAAYxSTT92tCUR2w
 6VTcC9uDHm9GZXmIBJQ4KZV5J0lYdPBwlLZK+eBi3P0WbKGcopUKk8RNxusEcU2IQID/lqlNLx0
 XbnU0WsSf06pZ4TVI7AHTcmSAzPKffMRM1oQddgH3ReN1CEtnj23lCI8fbFseAfRTfajSKm8+/p
 O6TYp5/TqtRAl+SxgI6qcL3mjrGStQf+7gXaHdyxhRuWzRHlg8R874Dv5MLciTACvmGevMnTgJC
 ZPBypaxY5CSuao2QWmGigWXWGrvCDEox326Hw7TUjS3+duUvRBD8twNWQLlvxX
X-Google-Smtp-Source: AGHT+IGUxF4Y52hsEF3YlIIRLxcxORcfTdROX9RLsrFtKMo8xS99dHsVkFdyVb9jt/wn1CRm6IgXIQ==
X-Received: by 2002:a17:907:940f:b0:b40:e687:c2c with SMTP id
 a640c23a62f3a-b647394ce7fmr398651266b.37.1760714210216; 
 Fri, 17 Oct 2025 08:16:50 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da2bbcsm477666b.5.2025.10.17.08.16.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 08:16:49 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-63c0eb94ac3so3338549a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 08:16:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUVTy3zZI04qsU2vnWudlg37U8IKFyXkWWNwJqh8JKla1EKtz31dUH0aojQdT+nCAWe810mFFyt/w0=@lists.freedesktop.org
X-Received: by 2002:a05:6402:3552:b0:639:e30c:2477 with SMTP id
 4fb4d7f45d1cf-63c1f636789mr3814749a12.7.1760714209178; Fri, 17 Oct 2025
 08:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9ty=C+PAgZD44Y_LkUuKkRtLFGffjX9rZX8=fkP0s-8zSg@mail.gmail.com>
In-Reply-To: <CAPM=9ty=C+PAgZD44Y_LkUuKkRtLFGffjX9rZX8=fkP0s-8zSg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Oct 2025 08:16:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh7wA79sTZVEefX1BnBJEpYynkNcO=3UPEtmuLb5UJ8KQ@mail.gmail.com>
X-Gm-Features: AS18NWD27yZqWzRWvknziV1Hffxqvxsliqx3FofccoZTWL7zymMKM8Rfcs9vL0w
Message-ID: <CAHk-=wh7wA79sTZVEefX1BnBJEpYynkNcO=3UPEtmuLb5UJ8KQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.18-rc2
To: Dave Airlie <airlied@gmail.com>
Cc: Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, 16 Oct 2025 at 23:14, Dave Airlie <airlied@gmail.com> wrote:
>
>     There are
> a bunch of stability fixes for some older amdgpu cards, but older than
> yours.

Heh. The day before yesterday I finally upgraded my old radeon card,
and from now on I'll be sending in problem reports if they affect the
Intel Arc B50 Pro instead.

I'm on the road on my laptop right now, but once I get back I should
have my new monitor waiting, so I'll finally be back to a dual monitor
setup, because now I should be able to do two high-res monitors again.

          Linus
