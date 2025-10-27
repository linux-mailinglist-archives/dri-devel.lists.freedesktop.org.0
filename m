Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714B4C0F940
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7273B10E506;
	Mon, 27 Oct 2025 17:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HqZr+eK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0110E506
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:15:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A2ABC45F24
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88288C16AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761585311;
 bh=n10NlR5AQZVuyebRk7B2SUL8HffpvVGuK0dPunXc6Is=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=HqZr+eK4r0DzyGqvmeYi5mqxzyyqHWBykNMpoMfE03X5z6pt5O8eOzMRYd9U8ZUQh
 eYITan5jDOYW+kPveVqXTdkK4/68+CF7oh5DF96MzpETlIk0uh4aLwwmhsahp6rIJn
 hb9MZzElerUW3qdZGtZinkVPXmRKFFox7+oXIB2S4M/pqJ4Ql57IqzMoKRgUaT6FkK
 jOYZyLvn00EyjpiJgUwyHOibmTJxoa1uwMGwn7D4dhkQA2/m62ejGggHXJUpSlXPII
 kuefpXpMvSLts30670r1p/D5DybsVniH/C5X0jaqa2xC7Rx2pLw3QgoPR/rDlC8ft3
 9Jha6fJS1+a+A==
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-940d25b807bso199554539f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwvOTU3X2v38w/JMPZuHdMPOX1W09XFs+E7ztUn01luYL5hw9MPcV138F1vf3lfTEHiz6e1y/jEpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxxxd8YK19QtggO49hrEjdjvOnm0T5iSmqpi2/kG+6TR7o/Vr3H
 iuWx6Pb4/wE0ED8YeEtbqRW56z9lQQlviO3wxSz78ivyZiTLm5RPQkZ32EjpBhpPSm8/uR4AHkQ
 VcFSDeMik09HTOGj/+5HFFB8sN5tGF74=
X-Google-Smtp-Source: AGHT+IHX7Cu0cAsXytC3RTDyLGsbQ6D3nuir1yy3lnzLJPUDYwnFPuEpRZmXHsx20REcyJQHIoGh74zShF/YlLRFw2s=
X-Received: by 2002:a05:6e02:1686:b0:430:a4ba:d098 with SMTP id
 e9e14a558f8ab-4320f6e72b5mr13684325ab.14.1761585309545; Mon, 27 Oct 2025
 10:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-14-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-14-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:14:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v654iKx+2_GrFAJYF0VGXSd=ssxE6UYpN3jSAspEC9t3LQ@mail.gmail.com>
X-Gm-Features: AWmQ_bldcoQqUG3m9k_m37cYhHNBmzCyQWdekxIPdWuxn4IqUUTfMQc9GRDtYCo
Message-ID: <CAGb2v654iKx+2_GrFAJYF0VGXSd=ssxE6UYpN3jSAspEC9t3LQ@mail.gmail.com>
Subject: Re: [PATCH 13/30] drm/sun4i: de2/de3: Move plane type determination
 to mixer
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
> Plane type determination logic inside layer init functions doesn't allow
> index register to be repurposed to plane sequence, which it almost is.
>
> So move out the logic to mixer, which allows furter rework for DE33

                                               ^ further

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
