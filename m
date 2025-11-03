Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D6C2C9DE
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDB410E422;
	Mon,  3 Nov 2025 15:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d9DZanYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D79E10E422
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:14:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C95F43BE9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2680CC4AF0C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762182894;
 bh=X1lQDIOUYsjBlo4ocs57kAT3XVTll6xW8NP/rqlaXgw=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=d9DZanYu1Du0MYDLUS/92X+Uwvd7DmItGjVLn7l92ZW9DEUb8dEouTlqUwbuYBZIG
 pH1gQX7ZxOuFzhDCHe1s9G1KSvbw67fwVhKmCxVsahiM4x5/rVqHu+u0zq2W8ODsoz
 WJKUcHd5pr5oqkT/iQb5R4T4g6WV2iAa1ZTE1eSPGtr4DTB6shuHq5kXqIQZd1KCoy
 Ncb+AIiWy6F51l7Sq/I7eO7jQ7OQXP2ga3CqRE2OYEinAFBBmjD7g9EP+9O7cTMeDs
 JLxEmg5g4qWSllg5lno1JojlPBPckXZm0wq2CI5DsZSfACxyfyaUpu5nVc7Vg9Fqyq
 bGk2N7GSrgBCw==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-378e0f355b9so15603151fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXAoPjmaT/kDwkgtZvL0dN9utWXR7F/vx62rjIbDmcVOPOznIlOvROaaHyZ/HVVPYObFm4j6P8kA9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaTXd4CQl8ToAnPhje4oJOiCWCo5ZLi5KL/0UR7uGP6blGJQlH
 UabnTUxGqmuQVjSg2KawwI9ApEoLx0yxNQwDePjcLRIXQ8OiVnVHMK0pVIhTf0hCizNk63enwYS
 brGwaL7sDnbgvudDDWKukCHh5NH+vhTA=
X-Google-Smtp-Source: AGHT+IHZDkoXxNdhZHooF7In6ZS/umouiKh+BmptD052LhPp+RR7HY7bCHqMPN8dvQ1n5W4zzJk3EOAaNxVFM3Xu/nE=
X-Received: by 2002:a05:651c:b11:b0:37a:2c50:c437 with SMTP id
 38308e7fff4ca-37a2c50c5c6mr22032461fa.14.1762182892512; Mon, 03 Nov 2025
 07:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-21-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-21-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Nov 2025 23:14:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ubpB5sKnfQVej3AOtNSX=xAfh+RDL+=qZ3oz0j8-rDQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk5XxIurfQd85eS3oxbla8XyM5TbCCjYCsGGsUnTgr3dnC2wC7GmAAQMwA
Message-ID: <CAGb2v65ubpB5sKnfQVej3AOtNSX=xAfh+RDL+=qZ3oz0j8-rDQ@mail.gmail.com>
Subject: Re: [PATCH 20/30] drm/sun4i: layers: Make regmap for layers
 configurable
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
> Till DE33, there were no reason to decouple registers from mixer.
> However, with future new plane driver, this will be necessary.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
