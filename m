Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B978C0F761
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1FD899E9;
	Mon, 27 Oct 2025 16:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Iwct5VBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACC210E507
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:52:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9846D6048B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FDEC116D0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761583929;
 bh=qXSUYkzcaxBwT7PR3VqEg24D+wripCaqvcwPYVLA5qI=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=Iwct5VBPLz0VkdkDSWA+HrPfq9WSIDgOiBU1SFjAF1AcNrlIMqb/K6BJEIAGdqnDo
 nSYm5SFwJ0O3gfuFSQuRtXlC8uvgpY9QZVV/RqPJlFRUdoiTZ0OKMcG76JmTNCyhtL
 WbbrviiIdewI9HQpiX1ojEqgxxlwT3YuG1d1NxPvTzKPrix72aQsZI6VhdLrmi6S6V
 FaOb6ftKOOF809X6BKto2rZEPE5roKhFJmZ0V3/pOEkikBV+jYcTxfhbXqLmYjhBzV
 09iymB7lCmWV2jWUt2Oiacanu77v+Gm2HVuxvqIRJc/VbiYEJ3g63piplTXo9niAXS
 PDsb9hJOVP+ng==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-378ccb8f84aso52453441fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPEh72RpD6P8uy3go5dhDyS9FbtsRvws5ye47TVun8RBfY1RoCqqpuBE/lFsnZxTC+GHJZsMYYyhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt/LL+vs6AFr6U8T/kKZJiJNQjxr1nriqS94lEbXk6KWV46cYd
 qMJrCuQei9naH5e1+ZgnvQx0YCqQ6PomXPmEovZkENmmcHecmYCKD0NYBKcJ/kW9jb1MY3cAQcW
 zC0AJgCBOaw1Bq/FEvxULLD/IMpMNyAQ=
X-Google-Smtp-Source: AGHT+IFBPJYi1S4vop7Gb683MwdHCr7hm0ZlNxSJGBcGt42mr3LXF0sb06/EOe6oCAtgC1Lcmldr3eesncU595uaptE=
X-Received: by 2002:a2e:320b:0:b0:36d:1f0e:1c02 with SMTP id
 38308e7fff4ca-3790778cbc4mr742181fa.39.1761583927610; Mon, 27 Oct 2025
 09:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-13-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-13-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:51:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66hnO5ZQHR8US=TdCY=o2TJRgntCDFonKY4=aQi69oSBg@mail.gmail.com>
X-Gm-Features: AWmQ_bkqru6Db363dehTH0eyDlHZatRKL_5iBGTqBIvG6dXZWDY255VHS1_NOZM
Message-ID: <CAGb2v66hnO5ZQHR8US=TdCY=o2TJRgntCDFonKY4=aQi69oSBg@mail.gmail.com>
Subject: Re: [PATCH 12/30] drm/sun4i: csc: Simplify arguments with taking
 plane state
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

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Taking plane state directly reduces number of arguments, avoids copying
> values and allows making additional decisions. For example, when plane
> is disabled, CSC should be turned off.
>
> This is also cleanup for later patches which will move call to another
> place.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
