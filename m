Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93757950B72
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69DC10E3B6;
	Tue, 13 Aug 2024 17:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="OrsKrXMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A37610E3B5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:29:05 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e04196b7603so5737410276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723570144; x=1724174944;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ej+GIAFDY3dY5obu8h1MJ+YQlppurY/RE+HmFZP3aEE=;
 b=OrsKrXMiuSkTjI4A1zIaUNPs+l12nz+q1Jl7LASC77YIPeazw7hLXdWL6h2lYbKqju
 IGxtTPkJsApBX4ZEa56Z+Sr1iXuDqbScjCSPWbkenP6Wbr4OgRPutXeOYAdalUc5dp7D
 8pwRVhQRtU8qsLGbUa2+W/BtUUrQOQaNSsVe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723570144; x=1724174944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ej+GIAFDY3dY5obu8h1MJ+YQlppurY/RE+HmFZP3aEE=;
 b=apeh84ekeUy/5V/PDk/o3s2z9jVcc6TtdpsS0FBP7CtIE8h9CvlJZKheLQX7psihw4
 eeb/YXjBPWD5l0UIBg+zbJ7cMgFjTBFhmIOapeH6mRCz4h677hG/iq2EyxCHZAxF3N++
 SwJVTpkHZZT5El3b0hG7iRALyqncBiWuSx0EhdpdNPj/mFk6JffLGWLydtO03UHgKh7v
 AjkaJYSutnBf7GVMcVeGKl6dklfjrDyfbGy3kCMalyzz+b4m+F65Pztuj97b4oo4ukgg
 /Df2Dbi6zaymV0Baw4w/Ba02LVZH1FI3bDSupeUUQwWsbo3sEGRyArA01YyFyRCfQPxs
 zt5w==
X-Gm-Message-State: AOJu0YwqeYa8Hzid8c02dk5n16e9HuTC9hHzUhc4AjuHD2wDQ5lIM0FL
 9F6SP03mR4lZ12DBujcc+5T0PN0EBcAGFSCkhTgJ2tfmkoA9G7D/VQg9tcjzCNL3nf5G5+C80LO
 zieCUZqyrDTFYqG7RyIafunucjOM+Ho/4yqNn
X-Google-Smtp-Source: AGHT+IHtrAKscoNgDYs1RSalf0ZqMoV624z1vbcAIXUiHI4BaHdw7buCdg+GUUA8SXKs8Lwbxf0UH82SeLhVTjvI8fU=
X-Received: by 2002:a05:6902:13cd:b0:e0d:19bf:329a with SMTP id
 3f1490d57ef6-e1155b84263mr286036276.41.1723570144264; Tue, 13 Aug 2024
 10:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240801175548.17185-1-zack.rusin@broadcom.com>
In-Reply-To: <20240801175548.17185-1-zack.rusin@broadcom.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Tue, 13 Aug 2024 12:28:55 -0500
Message-ID: <CAO6MGtg7MJ8fujgkA5vEk5gU9vdxV3pzO9X2jrraqHcAnOJOZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vmwgfx: Prevent unmapping active read buffers
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

Remove `busy_places` now that it's unused. There's also probably a
better place to put `map_count` in the struct layout to avoid false
sharing with `cpu_writers`. I'd repack the whole struct if we're going
to be adding and removing fields.
