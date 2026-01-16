Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F3D37AC1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 18:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9B10E912;
	Fri, 16 Jan 2026 17:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Va5mvzIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B6410E912
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 17:45:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a35ae38bdfso84575ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:45:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768585500; cv=none;
 d=google.com; s=arc-20240605;
 b=OJg7pmmSOmBx/bbdXrbcBpYMP0ykZqBluvZYlFFUHxYDKcTCOkWPQ5i2yYaTN14Ye0
 mNSYcVUmoC1yAl3pNBiulvF6bgHtlBrivASbdEPOJiUDXlfjTbEDaM6S96f5+GPiunDa
 GdST+nPuJdrCwij0q+JVucr9WheSVVTbNHsZPCRNXB/qkrNQtAWE36WT1GH8R5rMbJAI
 Xyip+zbON7d7zbKgUcpOVGDtFeSOMPviy+8JbzwtONO4DKNjI7YEN+3VP4plJnmLzQGF
 Bd5Hisa+o/P3796CFSRPga6ms8HgKmHHq3iU0rSlXHe1DoMr8jS33hcr2ZzyTvx0TKQu
 nOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gl4zFmzxCsueRoLVdUzaTLfY6+bubb8ahnOUlhxx4jc=;
 fh=/hZh6QEVSmKAH3TG8SyYFuWi/1BxtwnAVg9xvr6DKxU=;
 b=ifYiexR0bRafmHm8A+u8oYKBAPlhkgiMh4Rw1k0JRmtGf+GLJ84+HchzqWzlFLBnDF
 ckgqqiUV576SSoeDPg8vScZBhWQnaikM7asouazOTprCMSAn8zpIaBp+p5VUBc7ET5s5
 JHDuooNDURXyUBMqjdYPQfBlm6Qj493vQHLkKOvELNezYDmJHHdQaCbiiV91VZRiE2fO
 xZMBdGYNt0/zWMdFIdhMRfSrZwyhbR3pF7HO2vfH9iadShoiCQgK+eoNydEx+UllrLV8
 ERx59B7WS+q2/+x1x0Dmz2J1UDodLi0//oYu9q/Swfo0auhcqscBDeGGKY2NmLBTcdAl
 NMVQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768585500; x=1769190300;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gl4zFmzxCsueRoLVdUzaTLfY6+bubb8ahnOUlhxx4jc=;
 b=Va5mvzIR3ReG2NcYwMp97swpqjn6P6BAgxSv3eYEn/SFYrVIakLBu5NQYLanvM08IH
 osR0dKeovX2ixM/WJ8De30Xljy7d+4C5GX3ZJD/+XaoDEYakohZ+VCAHNGE2uv+XNYVA
 LXHqXxUr+ND5AdflNrOT0T/9GhRS3vCk1uJojszpFdbzO8dv0eWoblecugneJvxp9Ds0
 HTC3YE9O1hBCbVdof1PHDBacM2OtB12CLesvzo3m8ha9D+SwtSjbNdW/UVNSQKKFKCmf
 glsEBvXL1cPnahHZ6HTzkdXT8Q1jg9CpqGshX9XZjM2hgF1ctfw2dH6xPp2VUPBcG+Cs
 2oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768585500; x=1769190300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gl4zFmzxCsueRoLVdUzaTLfY6+bubb8ahnOUlhxx4jc=;
 b=GfHTiVRlJi+LTzgG9pY6Hlv1QVxouBHOGc6Fzz2wyRYHTQza3sqfDxHQwqxzfSS+rd
 V3mV0mBi4FLNY2w+VAnPqjHdsGvphUBEF7jNRTJjrr6yzQh2QyLddKAoClmK7v43ZI8a
 ySHk1agkBoWIjoIYIAL0goY3IARpvEo5ulZ6xZAPkOs9VIVP089kkkJcHobmUG/EdAfO
 lW8qnfM5AVUuMjV2hxWh4VPncvdN/uJ6tSYPgpyWkMy2bg17ms8jo0byo0bwHaoMPD79
 WJWh1qetLFC+cDtSSiNTQvu2x2R4p7ulDSc3+bl8b52adiNVI6aQGrnioi9PSuWFS4P9
 ow/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCULfgVfJhglEpVmReOBDLv+rO2xMY0Sl+zixEG5nRZ54PgY3IjIf1GQYtoretVphIK44HcCx5rv+aw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2ZfBCpljAK3S1OzXuaVdhdHVvI0tu0LUCKlJM+PfxDLmExSiY
 aXLcCL8OpAFXnaTV2vmOzTPGYb9FbpHet5YIaBS9M5Ih6+zIGpgZYU73Yge/ZKQ/VwhURqwG5QC
 BiouQa+0TedL5aEm/SVh3P5VJxauLLJt+f3hp0c4L
X-Gm-Gg: AY/fxX4qSIFKj84jteclJ5uX3wwDr3BCoZrkf+Wu9f2eM0LeQ14g4/Yi4i30hv//fEx
 JlbXXfucnvDl2O0IawDpku6TVkBSb2Fffjp0XNwZ9RGp3D5vO3CWXil5dq1viuxOos90BY3PSyy
 EJWyuS5EskPZdULm7L5+y2njx14Xvl15aPGEt4eMMYEiOsmVrza7lVZDvBlhQ3YxcYlVmS4H+rn
 jUuwitsn4dxZNprrfbGUUig7Ht3MUgiTof9it1l9NoO7wiq/v+Zu+eeo/OjJCqw9FUo6kDnyGD7
 PM5G2hoOljiSkdLYySrEc/SY3A==
X-Received: by 2002:a05:622a:14ce:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-502a367be59mr5220311cf.3.1768585499718; Fri, 16 Jan 2026
 09:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
In-Reply-To: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 16 Jan 2026 09:44:46 -0800
X-Gm-Features: AZwV_QhmPRtd-UpS9Tj_-Xhzhu9qNDWnH_sMlLv41UkfjrVz_e5Kte0Y6tFqWfs
Message-ID: <CABdmKX32wj4yHAKMT7v9Na9CFwNM=Lfcop-dPYmcAt=jaygdBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dma-buf: system_heap: account for system heap
 allocation in memcg
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Jan 13, 2026 at 1:33=E2=80=AFPM Eric Chanudet <echanude@redhat.com>=
 wrote:
>
> Capture dmabuf system heap allocations in memcg following prior
> conversations[1][2]. Disable this behavior by default unless configured
> by "dma_heap.mem_accounting" module parameter.
>
> [1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local=
/
> [2] https://lore.kernel.org/all/CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMO=
XfDha6ddOA@mail.gmail.com/
>
> Changes in v2:
> - Add a module parameter to enable dma-buf cgroup accounting, disabled
>   by default.
> - Split system_heap logic in its own commit.
> - Link to v1: https://lore.kernel.org/lkml/20251211193106.755485-2-echanu=
de@redhat.com/
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
> Eric Chanudet (2):
>       dma-buf: heaps: add parameter to account allocations using cgroup
>       dma-buf: system_heap: account for system heap allocation in memcg
>
>  drivers/dma-buf/dma-heap.c          | 5 +++++
>  drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260102-dmabuf-heap-system-memcg-c86a381d663a
>
> Best regards,
> --
> Eric Chanudet <echanude@redhat.com>

Thanks for adding the param, LGTM. Looking forward to v3.
