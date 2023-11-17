Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EF7EF60F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 17:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B894610E0C1;
	Fri, 17 Nov 2023 16:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C78F10E0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1700238031; x=1700497231;
 bh=c/h0b+5BWYhgvhTWWFoERjRovp9HG6DxXqas8Io0Upo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RpjcNazOxK0tuBinKATPVK+2WR+efx3Y2wqvPtcXXWZVDHdUqqf5ClnwPg7kir8Nq
 jUUMcjEHRp8yF7WejjC4mXDVcIiv2pqBNmM46Rg7PqXqCfHqSrwCB2RtCBg4Y4/ef7
 dOFgg12COHSJMpYAzIaQMxCZW+YBI6oxV5IFy9hjWUirZCE8lo28OCvJ3uhS6FCnMx
 oELvux5cLbQb0BOgOLj3JrBYX4Xj7UvDCty3x4KLnpS7q0MBYW7/pKXsQo/HeDUzMq
 OSFZntvHPC5vqHQ4H7zxbz/KWofKo07co6BHQQjcfnOIbSnNUaYMUydxtiZ/vHEEm0
 oXLRqa8iFeDqA==
Date: Fri, 17 Nov 2023 16:20:12 +0000
To: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v8 0/6] drm: Add support for atomic async page-flip
Message-ID: <Xvnc1dvx8ij7QQjMrEG5AE_wpnGxYwEwk0PxRir17B34AM8y9HZTorD18qGzm-mMrgq9svucDnTS2d-8VyPT44jHuOLpdTavQV5Rgjz-dYc=@emersion.fr>
In-Reply-To: <20231025005318.293690-1-andrealmeid@igalia.com>
References: <20231025005318.293690-1-andrealmeid@igalia.com>
Feedback-ID: 1358184:user:proton
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
Cc: pierre-eric.pelloux-prayer@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems like commits were re-ordered at some point. I think we need "drm:
introduce drm_mode_config.atomic_async_page_flip_not_supported" to come bef=
ore
"drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic commits" because the latter
uses atomic_async_page_flip_not_supported. Similarly, "drm: Refuse to async=
 flip
with atomic prop changes" should probably come before that same patch becau=
se
we don't want to have an intermediary state where we allow user-space to ch=
ange
arbitrary properties. In general, commits should be constructed so that the=
re
is no "broken state" in-between: each commit needs to build without errors =
and
not have transient bugs.

While reading this again, I think that now that we only allow primary FB_ID=
 to
change, we don't need atomic_async_page_flip_not_supported anymore? In othe=
r
words, allowing async atomic commits on all drivers doesn't require anythin=
g
more than they support already, because the atomic codepath can't do anythi=
ng
more than the legacy codepath.

With that in mind, I also wonder if the new cap is helpful. Since async ato=
mic
commits can fail for pretty much any reason, user-space can just try and
fallback to something else. The cap could be useful to indicate whether asy=
nc
atomic commits would always fail, but not sure how useful that is? I don't =
have
strong opinions either way.
