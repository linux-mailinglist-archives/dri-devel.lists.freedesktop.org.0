Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC167B25FA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 21:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496A410E08B;
	Thu, 28 Sep 2023 19:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24FA10E08B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 19:34:01 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso3100671e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 12:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695929640; x=1696534440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=148+Q+CA7BT+nFUGSkOiUcTjDjkn9OIgvF3SvdOGiDM=;
 b=IG7ZLsxI97zZ7vDCL8ebvrUnlPFR84IlVtXHjIKV94Q+tpucjZv1aT/lps6PdSokUm
 29xzmCxmbXYnuwX1iprqZmqJRNZ0nAuz6tKf73zuhFwhTkVTFhPH3Nx+ugpt5krAK9nm
 3vJ4IdSPQqxsJpQ/8inV9ORtwGp3J9yKIt1Tybz/GQlMPZzMzQ2jeaMALs2Wy6q98dLu
 N8y/Nw+LlwWSzdjShocoeRxz1E/Cu5kLNPeJbGJ85lfrPAb4rI1pXlypb/Z7rL1h9Dfi
 qlgQQfnNbaja2jIJod+tmHLaXsuKPy0dSfFAMsVxmGMIOOnPng1dfJIsQ2Vo3mevsjRd
 1vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695929640; x=1696534440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=148+Q+CA7BT+nFUGSkOiUcTjDjkn9OIgvF3SvdOGiDM=;
 b=Hm3j92zngawvI5ptGL3vXFKp3IFR1jvGtsHGiuK4vuSXlalfTnqyr3UPmYhawt9j0/
 UU4e7m3Oo3mZpbPbiKSyjfJ2yO9nLY0Hp0KeAs462plMaGgfMWGsvIy/w3SPCiYURzZp
 nk1jxG1xuzuXgOl/7VbdAJ84GnK8G3VTCqxvrSjWVvDvQnbnNSbq8hkTYeSBD1hLsh9T
 whj2MzvUHDzgkgeLGMG1TG007aK/xw2A5Gx5ITRr8ZFfsrn6WQlWvEX1p9kZixcYg/hP
 t99xztUCnmk5IDRhb0wh3Bp3ihdU6PoWekf/lyJRY8HAZVVky0k8JorX2QuppNdsmiwn
 HF4A==
X-Gm-Message-State: AOJu0YxFNflFSaR4CiYnvyC1F4YKstt74qz9E2k+QFmjcAyigw4uKYhL
 pv5gTkOfD8TpM/X6fPhlMX65EA4R+yfjR0Hg6Ec=
X-Google-Smtp-Source: AGHT+IEKOVJN3MiRUfjRj9Hs1lcusauM6atG+wbJli7p4N4McD8GGmiXhdY7+BRYTfc0cMYcuyrrC01msDFplzIrhzY=
X-Received: by 2002:a05:6512:47c:b0:500:c589:95fb with SMTP id
 x28-20020a056512047c00b00500c58995fbmr2002401lfd.55.1695929639481; Thu, 28
 Sep 2023 12:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZRWVpCaQUefzdZ4-@intel.com>
In-Reply-To: <ZRWVpCaQUefzdZ4-@intel.com>
From: Ray Strode <halfline@gmail.com>
Date: Thu, 28 Sep 2023 15:33:46 -0400
Message-ID: <CAA_UwzJqwigNvMZ9C_tu0Hb5cLRq0u44FXa9+h3m7X05psGYhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hI,

On Thu, Sep 28, 2023 at 11:05=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
> Here's my earlier take on this: https://patchwork.freedesktop.org/series/=
108668/

Nice. Was there push back? Why didn't it go in?

> execpt I went further and moved the flush past the unlock in the end.

Is that necessary? I was wondering about that but there's this comment
in the code:

*  ... Locks, especially struct
 * &drm_modeset_lock, should not be held in worker threads or any other
 * asynchronous context used to commit the hardware state.

So it made me think there would be no locks held, and then I threw a
scratch build
at someone who reported it didn't deadlock and solved their issue.

--Ray
