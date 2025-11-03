Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D03EC2D512
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0662710E10A;
	Mon,  3 Nov 2025 17:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JP30ELTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C48C10E10A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:00:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A82ED6013F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3C1C4AF09
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762189231;
 bh=7CyzY1gi2utCnEO0mIJFk4I0teKsCJNbeXckClXmjAw=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=JP30ELTUudyhVsNf8Z28HixNPHuIblFoxzdt+6GKSZNVKcm68JNvQJpbCm5SoD3Li
 kPxz8aWYeBVNE/ybrjfVw8WChw3rExRtt0RqqRSX1f+YILweTNONW4VyLITZhAesmr
 0XHx5b0Tqh3VHviyGrZQLx+GK2gMq5LGyTNxvp2cymGy7ex7+LggtONVv8SoC8saRF
 ixOV6B3iUvawEuT2FJpdS2T+ecjF/RANMvXFrf+FWtPAGYqiJhA4ND+zS/Tlu4rCTG
 awXxUZuzNKA+t0tiQbE3IJAH12nHGyqht1iGtxLFt6HAN4CG1GjGT42F5yiox5+U82
 j+khydXWxwLVg==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-36295d53a10so39830021fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSUF5W7/F4+EyXPSGGZPQJm4Cw2tOy5qtQ2ksx9wxKNyG3qD6Kq3C+Amb5+e5/7m+m4RxwqqMvTms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJRxuAP/y1soBNJPTWaTXxNosdkkSe79xxyrVSBre/JGZdLRoP
 SOcTKBHKemucgkgcAS3JgaHin7dRVuvJyZMKfnC2EsBcsbAOpCuvESL14ppGIGmX/mABUab7RAD
 5nKrmDP5xa+LfQzwU//cvDGcWfH9OTjM=
X-Google-Smtp-Source: AGHT+IHVjRCJBpIQ0AkwGUkv1Oc/Iw1YpvgPMizZQAfItAe7f0KiKtYYqyVs+d6rQlc0MN+lNmy1tI7ZB9JGHs18oQ8=
X-Received: by 2002:a2e:7c18:0:b0:376:39eb:21d8 with SMTP id
 38308e7fff4ca-37a18db1eeemr34990161fa.15.1762189229761; Mon, 03 Nov 2025
 09:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-24-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-24-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:00:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64sMNZQEjZdofw_=pWYZ7VPa5zjFjrRBZu4tH+HrusZdA@mail.gmail.com>
X-Gm-Features: AWmQ_bnJun-VQPYKNpyT8f9hlvvkp9be9LX1bH3OeeZGxyWdWrG0bvZZDFNJw7w
Message-ID: <CAGb2v64sMNZQEjZdofw_=pWYZ7VPa5zjFjrRBZu4tH+HrusZdA@mail.gmail.com>
Subject: Re: [PATCH 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
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
> Now that channel base calculation is straightforward, let's update VI
> scaler base calculation to be simpler. At the same time, also introduce
> macro to avoid magic numbers.
>
> Note, reason why current magic value and new macro value isn't the same
> is because sun8i_channel_base() already introduces offset to channel
> registers. Previous value is just the difference to VI scaler registers.
> However, new code calculates scaler base from channel base. This is also
> easier to understand when looking into BSP driver. Macro value can be
> easily found whereas old diff value was not.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
