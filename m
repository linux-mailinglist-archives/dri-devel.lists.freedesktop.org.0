Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBEB8A2455
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 05:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE86010ECD4;
	Fri, 12 Apr 2024 03:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="VVSex29K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3804410ECD4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 03:23:00 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dde0b30ebe2so485978276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 20:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712892179; x=1713496979;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBOGdLqBgn+T8Sf8XCjiOSBMtuQgIm6v2hDGHqnMEiY=;
 b=VVSex29KQzqL9kXD73xLF8Dt6++ANcP4QcYdu2tg73UuSkUdluHTQDDDBqPvHLoHVS
 t2O1lgnfc2/WKHbXZN1QhG+p93HDs1UtTU7NqATcGmoswZbZHuro+9Tz99gEBEEYsJoU
 JaMiDtCNL38JPamRBmngjFaZO6pmy6qiBGoCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712892179; x=1713496979;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBOGdLqBgn+T8Sf8XCjiOSBMtuQgIm6v2hDGHqnMEiY=;
 b=Mkq+PZMENmE4YRVwhW0KhjLR0QLwQo6cVvIH92gK6OZxcasi91f6ZwW2uiuIC2uYrR
 qa3HGTszKX4NZhWCw1EZyV4kFyLUKxekBCRZhDMi9YlNkrvCJYIbEj7L3J8cgFZEMgix
 vEVbHA/JolDhZJgNOJh7clCtGq1QKly6JbFbQedRK0k/JYvdsEet24qFnk1IBlICg1uS
 CeAron236qaCDctJHwIjvE5VQizAxVaLypJbvBbg5Hdp17KxLvwr2lh6Bv//iyviT6o4
 5qkzqbrfoH9QCJkw2hSxBkDdSH1oNCnwK3s4jUNkQcpffVpcEXnV8X3CWkQs0uw4sKuW
 nxJg==
X-Gm-Message-State: AOJu0YyF+dlFTG+DzqRs4hRNw0IobEkJbQT2HE5KkEAHD9+MDntROfWz
 4TQv3xMWqZZKgXuKWnUaBTb9e/w90Y5kPGm9j85MQotIJbbkJUhAhiXtR5/FOhNlb2ii72VPa19
 dt6Qv/eOVN5JFue6ldwzv3p+hFIPx9lsjEk1H
X-Google-Smtp-Source: AGHT+IEA2rbLK53IaCdzWxAVFaKDlUj1EdDuvLeu/58oR4F/E29XL0FCUFvDxl7G2P0d6VxXxzfy9px2yhZlTbLeHgE=
X-Received: by 2002:a25:c594:0:b0:dd1:5c7c:f262 with SMTP id
 v142-20020a25c594000000b00dd15c7cf262mr1422808ybe.48.1712892178996; Thu, 11
 Apr 2024 20:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240411212651.540-1-ian.forbes@broadcom.com>
In-Reply-To: <20240411212651.540-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 11 Apr 2024 23:22:48 -0400
Message-ID: <CABQX2QMp0OH1nivuo4PBY9Qa3b-1-JDDfsDWuAwD=4DXGaWC=A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix memory limits for STDU
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Thu, Apr 11, 2024 at 5:27=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Fixes a bug where modes that are too large for the device are exposed
> and set causing a black screen on boot.
>
> Resending as Patchwork did not like my last submission.
>
> Ian Forbes (4):
>   drm/vmwgfx: Filter modes which exceed graphics memory
>   drm/vmwgfx: 3D disabled should not effect STDU memory limits
>   drm/vmwgfx: Remove STDU logic from generic mode_valid function
>   drm/vmwgfx: Standardize use of kibibytes when logging
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 19 ++++-------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  3 --
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 26 ++++++---------
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 32 ++++++++++++++++++-
>  5 files changed, 48 insertions(+), 36 deletions(-)
>

In general that looks great! Two questions:
- with stdu what happens when the mode selected is close to our
limits, the guest is using a hardware cursor and we allocate cursor
mobs?
- with legacy du, is general mode selection with modes close to vram
size working?

And one comment: in series like those, be careful with fixes tags if
the patches depend on each other, i.e. the third one depends on the
first but they have different fixes tags so they're disconnected. It's
a good idea to keep distro kernel maintainers in mind with those and
try to organize the patches in a way that makes it a bit more clearer
that #3 depends on #1. It should be fine in this case though.

z
