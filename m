Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC25C64CE6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E3D10E3B8;
	Mon, 17 Nov 2025 15:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kw9Nxu5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC6510E3BE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:09:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 59473416A0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D31C2BC87
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763392168;
 bh=3zbp3rv3Pbtp6BhnnUjE7+HUOuLx/KIf8Dvndl0seZc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kw9Nxu5ejnAZFvD3mnDxi6HpQkf1TgCNkug5+vryg+OfHvPaua1TmSfausyzdSJSj
 j5/XRGmsUjmRLpF8lA27iWNm9p6msDA6JNDADSqp7hWFEEnt8QhzXM+sKx/q7gy3+d
 IZRxiGHrFG6pwi8hwjiI5aV+AJUJhHXQ5kD6iW9UwcTV0JTvf0ctvr86iH22FOu2DX
 30qYOr+WjJdeCTYviJlpMzx6jRQIbVY/JMsJbPZ0kXa1nlGKRMVk18OydnPp/v7WrT
 Bk45BmO7n4l6lB0KkTXhRC1fabRjX8qEiMjsjGuppD9QFm3w7stbi5O9Lreuv+mqkE
 pJxhqzJCc5lgw==
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso143041b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUc1FBJK06HSpmTzSSqJcC4znnOCQORsbj+vhk6Mr5mQyM7oe6e7+jbVUdq7y3jWNC/Sgidl9B0XXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqVGuu238gA4heaOUrjztyv+nb0JjNHBwAiBRjetde7xHb+DQj
 JOzTQPF6w9NCHzMkpojF3KZ9fV9JM0IGtFcs0D8OjTqpc5PP0VbkvgpobiznyrF6X4P2KjeBeJr
 23jbegYPWN2NTN2g7Ddtc7Krz+fZe2Q==
X-Google-Smtp-Source: AGHT+IFX3yT4m31cCyb/Z1+I4aTapLK5A2aAWg8mzrZJNC4ShJE0Imif2VAN6sLkFovV/4nwzbgRRFZL/2cPkevezx8=
X-Received: by 2002:a05:7022:98d:b0:11b:b61a:a497 with SMTP id
 a92af1059eb24-11bb61aa776mr3945411c88.37.1763392167590; Mon, 17 Nov 2025
 07:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20250923152340.18234-1-johan@kernel.org>
 <aP91AfdoyESxqfPG@hovoldconsulting.com>
 <aRr6Bj4yrcKN-jUD@hovoldconsulting.com>
In-Reply-To: <aRr6Bj4yrcKN-jUD@hovoldconsulting.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 17 Nov 2025 15:09:15 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8B8svZDHcLP0yRfU=2oTEe2RU+iz5Vpbhy77tvq9yM2A@mail.gmail.com>
X-Gm-Features: AWmQ_bnoz0kpERdVA_cJtV4JW9qwxQ8EFQkGKR1UJIT7D9EKmhqQzgDRCdCXfdc
Message-ID: <CAAOTY_8B8svZDHcLP0yRfU=2oTEe2RU+iz5Vpbhy77tvq9yM2A@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/mediatek: fix probe resource leaks
To: Johan Hovold <johan@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi, Johan:

Johan Hovold <johan@kernel.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=8817=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8810:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Chun-Kuang and Philipp,
>
> On Mon, Oct 27, 2025 at 02:34:58PM +0100, Johan Hovold wrote:
> > On Tue, Sep 23, 2025 at 05:23:35PM +0200, Johan Hovold wrote:
> > > This series fixes various probe resource leaks in the mediatek drm
> > > drivers that were found through inspection.
> >
> > Can these be picked up (for 6.19) as well?
>
> It's been another three weeks and we're at rc6 so sending another
> reminder. Can these please be picked up for 6.19?

For the whole series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Johan
