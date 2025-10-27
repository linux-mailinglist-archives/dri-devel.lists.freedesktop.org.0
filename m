Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE84FC0FBD7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA11910E532;
	Mon, 27 Oct 2025 17:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cj14kJH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEC610E532
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:45:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 47ED5460D2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD8CC16AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761587129;
 bh=upm4Fx4Zyity5YEegKY8XfpMcrJf2ls4KbygxA0gOhs=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=Cj14kJH+FRFQaq800dK+D2JysmG7w5AjqVnjQRupPGzirc9wn/yrC5Rcfe1Hx+95T
 8iu2ONvQEsgLyKRwOVIy65cPnLYM87isb/TqYx6dNp2YI5CFb7lGyM6HHqrPsp5fZu
 2b7feUFVAi8CrHg+TlVk+BlhzGBH4hQDO+RpV6FmDilwGj+/wpIUbRhOcaIcKMcFpV
 ayfn++vB+0q1DQxHh1Yasy9l4D+BMOzs5zMCMbQF/j9d5I4hsR3Zz/Wse260cUKvCO
 U7I0mY2P44ao6p/8ZDTqX3bF2L7mwgtBxky0EyTZVZJr2jU/xeXuJ1sBzpvidAmMXO
 JI3WWuk0m5LVQ==
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-378f010bf18so21931451fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXBlCv6dHM5XAoOPEccG0k2sS9N++3OGmSN25zZnBpRTUdc1nY4NYEUK+/HydqGmYXcSuFmO8qHCRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCEc6qEHcPls3BWGYOb56OfPEqJ1+i+sbozdIrnz/TbqJ+NBYp
 fNY/53IibIIKQHT26m9PJffVLzwdydsazPgKcVR4QwhndeufMlqpwX+6K+wLxIj+cOLZTs8Anns
 yWGXf5few3jQA7F4D80/0xfVOm2YXU3w=
X-Google-Smtp-Source: AGHT+IFjlWIjfh9UvXhgPZoLIWaWRXGD/zpbLYult3MgsNK73imA2OTtKPUOEvbbhsWdoXcemdcDtRY3/9kK67MPTXU=
X-Received: by 2002:a05:651c:1585:b0:378:cd2b:5040 with SMTP id
 38308e7fff4ca-37907cb3b9cmr967131fa.21.1761587127507; Mon, 27 Oct 2025
 10:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-18-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-18-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:45:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v66KBHkZZEkORAyFO5LPqSChBm8mUFS6bgiRZopze7JuKQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmRMHRbSFfLfGrgGggasJXji4AX31snSt1AiPTxbTOpwyHoYhtiWgiL24Q
Message-ID: <CAGb2v66KBHkZZEkORAyFO5LPqSChBm8mUFS6bgiRZopze7JuKQ@mail.gmail.com>
Subject: Re: [PATCH 17/30] drm/sun4i: vi_layer: use layer struct instead of
 multiple args
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This change is equally a cleanup (less arguments) and preparation for
> DE33 separate plane driver. It will introduce additional register space.
>
> No functional changes.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
