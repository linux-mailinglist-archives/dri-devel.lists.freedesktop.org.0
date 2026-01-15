Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689AD28916
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 21:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C0D10E1C4;
	Thu, 15 Jan 2026 20:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Xw+6PLjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E22010E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 20:58:54 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-50299648ae9so20181cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 12:58:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768510733; cv=none;
 d=google.com; s=arc-20240605;
 b=WUoipmt/pOk3V8wTdblXhwIG2CX2sDhaawnuXjJaWFIC+M8Tmm2DWTJ5vv9tyf536j
 qYQ4YkEx5FAdIwes8G1z74fOMpAE9fWYYL9Gu76RTat3B/i4SeSbFJYczceOIB6xVf/a
 fFyXIZRBBC0CgHXZj61X5DC8KmKFs+OjQ7Jp8M4/vmZ44BMs/JOvaRUgA71UZPuHKXnT
 pJkoPkkIt9bbq7uY4QZzUQiuUkTGMej8Rrl4khY1I9gMaONHEyCNNACIalPx/1/ykbMl
 l6FIFZwQ0+ujRI4sFTQIT8Ob3/7z/1xwAJ5l9XPsKS63qv4cdCyC99dyxZJFTBTjVIWJ
 qW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aN6gj1asa/7P0fGIQeK2r+Ar66tOkO2hHBCp/S5hpjU=;
 fh=goKis6DXU4paQoZORREVcxlIrKXa+ubD5Uc/ENyb1sY=;
 b=T0MifemvOQE4nVuBEXgA8W6r6W7evO0hLMiPPHFdIsOd9pK+/6KDhtvsfaTBYTEdLi
 w3L5jKNYZJl92iSTFXC80kla21ThkIchK9gqin4marafMCK1evaofjP2cktvsbaGmzn6
 J/+SAncVpfIsWA7w6WAIa1eJFAhoHYLcHFc/+F3ayIUL2yvyw+Z7G62OxzzSX+kbxLWC
 HVVjCeVChqyFsIm6ESGPYbNF6lW+LMmlmxviA7BPwqRy8bN4peCkrbggSmP19YbDlJ6o
 lIjQ67Jy3h92qi4vX2upL2h3cM1MEcYr9cDvNSGRgxppvmnQEs5NaF3No4SOws0lQo6D
 yIsQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1768510733; x=1769115533;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aN6gj1asa/7P0fGIQeK2r+Ar66tOkO2hHBCp/S5hpjU=;
 b=Xw+6PLjPjU38zVBKo51mB5qB/xJv3oW61w9WfwfM/GxqBeVPVGl5wr1XP0YWuAsbzf
 ZBsLua/Fr6XIcOt+/tJHlbiw69X60kriDosiNdanq3C0X+NxJIeXq4EWviPKxYvnfv+4
 QTFmmH7iqVdvYw32WPZfsHGxfT4ztqmRrqSGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768510733; x=1769115533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aN6gj1asa/7P0fGIQeK2r+Ar66tOkO2hHBCp/S5hpjU=;
 b=Y4x7tS9epgYcxvTa0sRjgqSJrQIP/8dmOBl2FdTGc+I2kxEtcD+tQUird/JtphwP3U
 HdZKQ8AY/So99iy5uI1lu08hTCW9TK4cfbGsnrWghV2npBJFWUb0Z9SE2cHeie/WZcHY
 XmfBuaHmQljH/CtAjjHDCVhIqe+IkF/jwFTaOvFg0y7BHiZ+mcQnWUVBb2WNGfMXhVa0
 rdjFOFEFSB38a3ocYJxvyzn2vV7cKuC0ps1DLZT1ao528AZxHdcCp6Kbz4NmE6vhCqGX
 paMPssToZONP+z1IbrPkDXFyQy1BxrV18Qe7Sxk4iHqyUUgsUjOisRlaISXWOk6c6Aje
 KZug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXssMhmXI9YzbRCtAs+wxlg9hew/uksmIJgID0okLy8GNQnNsPJisWcBLoRdJh3+KmslmRxE73VdPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc2JvB6kokt7o26bRA9tcnBR8Sdy4CYWztKZ+cBiFpQI8MSPij
 1Fll1bNsmNA92mjEY67BbqEckDaQHTDfWNHr6ZsVNZgdYIlQEmGORWf9QONdjpQz3usb1uewvzc
 kyVoloBlTib9vWvZIHiud7T71byRvYqtk91fRmewI
X-Gm-Gg: AY/fxX5b5TXpK2YBwt7/YDfXFvG0KbntBxz1XQZSBz1oII+LXfxDVqJDC44YMntpQ3v
 Too2L6FA59DzhKVKTDdC1+r5QULiZnbNuwljk4Vm54TnVltaJYkwa6fOpwQbMT6aA+0zHsDMtPi
 Csxt1iecxoeRlEKyRQ4E/5+ciio7/vSIv5i20Pq4s+0TbIg9Y3qmMOY1ueWRiA2T20Hmkaw+/FM
 9Ww2RlupsojYQU9pvv7zLfIcVr3QmptL2azZiRU9wYvEDher+u1xzqRYHnkrSeHzsdAMr+uNIkC
 wMno+w/CRqGhy+svHjg2plb+Ng==
X-Received: by 2002:ac8:7e8d:0:b0:4ff:cb25:998b with SMTP id
 d75a77b69052e-502a23874c7mr2282841cf.12.1768510732990; Thu, 15 Jan 2026
 12:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de>
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 15 Jan 2026 12:58:40 -0800
X-Gm-Features: AZwV_QgAvNKXMipZU3vFetTFrWbMaSg3BOdWiKKlVxjbyY9-74HfW16m0dIEsTE
Message-ID: <CAODwPW8g5sn6nJkZbj-rc_7PkgT9qVcQeLg=ARba5w5MQEHDcA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] drm, coreboot: Add DRM coreboot driver
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
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

Whole series looks good to me in general, so you can call it

Acked-by: Julius Werner <jwerner@chromium.org>

But I'm only really familiar with coreboot and don't have the
expertise for all these DRM interfaces, so I hope someone else can do
a detailed review.
