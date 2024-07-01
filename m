Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EE91E7F6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 20:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1EA10E08B;
	Mon,  1 Jul 2024 18:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AMLRirhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEADF10E08B;
 Mon,  1 Jul 2024 18:48:06 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a729d9d7086so701384466b.0; 
 Mon, 01 Jul 2024 11:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719859685; x=1720464485; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XOBqX6vEqO8I9+9x7cipWlXAGUF2pmkVi7D+4XiSKYI=;
 b=AMLRirhUmIjJupzXxD3SzOagkmUIvU4ZsTF/KZbLd1BT3REwMfQnGGW/LkScD5XDO4
 dWVy2Z/PRp68JxLXMHqJ5QVDTKIwVWAfcmlZQ0k7M4JqQIoOoYr266xTVJUymbzv5B1A
 bRUl9QoSFsyTmLRD6U7Jn8vWNeptrAviumVR2RnLHIGbQgNe3mRyLb6raqubbLlPzjNV
 3BiAdKDTOXeG1gdQUNKUE+gFGL0v7cQ6w6UFvgtYn68LW+oHoVLnDVZTyq0T7KvLgDxc
 pXAO0KyA1Y0EJvF2N+ufTqLT4yw1ambbb+tGF7bzJT/KQtCKEDzBUmmHYXoDyvmq+4KC
 NS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719859685; x=1720464485;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOBqX6vEqO8I9+9x7cipWlXAGUF2pmkVi7D+4XiSKYI=;
 b=ByAuhiU4ShTSpe8jzHnfoiRhdWkIsmeaI04BgXMXXHyXsbBa7NnHPf4/0TFsROFoOw
 wk1wT8GYdXTr9IOV3uzzyqD+PyJCnCUlnx6nDy/S8+0O6f6GBlHomkZxMB/uUqvQ/Ftd
 m1Gks/ARSgE9o6BBQ73G4dK35BrWLydKU+KVYecapuw3bBj0B/cGtfwU+lu0u0LeraIu
 8JljS84/z0odFtwkStzfwe9fo69POJnkfQ7vLvx9VPT4olCLVTnnf4ECCCOo08ELbzoS
 zH92SBNPEAU4C5BARYLsiIgr9NSK4oItGfMfko51dDJ8RYGltTiDcYN1A2Ud1tSHa9ce
 MODg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXygFE1mUDG5/jcxNqjFpiDkkwF8n3shLQdsdsonWUG30LXbSHJ3qW2fvQnMIgMBrJCj+o4W1VPegYwAvVwxZKt6/pVfHpLBTBYLM3u8lBRPCI5J0haBObuu2gSu13z856l9++AOYM9lBiDFaZa3g==
X-Gm-Message-State: AOJu0YxneMTx1tPxma5UGFCmukRc6CGEhXp3WJQS5dOUBblLCz1UmV2F
 uuKV4kQ3IgWndi472LKsKnJfkNQKLdvu1Ch4M4dYQ+2hnk1hZuNb8t0/MmrmqZcqtgzMcv0ZmQs
 ITNifHtJ80wXcG9ogfmP8TnfRbeE=
X-Google-Smtp-Source: AGHT+IGAMOojiJyBbt1/H6Rw8/TspWgSlD/yE6qOVbltvfbIpNipGI2zv9jT7kVgSVR0te7f9arBtHIikanhGfwCkaM=
X-Received: by 2002:a17:907:987:b0:a72:83ad:f087 with SMTP id
 a640c23a62f3a-a72aee6574amr976524766b.10.1719859684876; Mon, 01 Jul 2024
 11:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
In-Reply-To: <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Mon, 1 Jul 2024 20:47:53 +0200
Message-ID: <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>, 
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
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

Am Do., 20. Juni 2024 um 22:22 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
> Merging can only happen once a real world userspace application has
> implemented support for it. I'll try to do that sometime next week in
> KWin

Here's the promised implementation:
https://invent.kde.org/plasma/kwin/-/merge_requests/6028

In testing with the patches on top of kernel 6.9.6, setting the
property to `Require color accuracy` makes the sysfs file correctly
report "Device or resource busy" when trying to change the power
saving level, but setting the property to zero doesn't really work.
Once KWin sets the property to zero, changing the power saving level
"works" but the screen blanks for a moment (might just be a single
frame) and reading from the file returns zero again, with the visuals
and backlight level unchanged as well.
