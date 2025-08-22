Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6CCB32819
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 12:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AA110E1CF;
	Sat, 23 Aug 2025 10:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S5YuAeHk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3510EB7B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 17:42:48 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-32326e71c31so1900240a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755884568; x=1756489368; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eCaKntriNX9X76AtgWLOepHoJZS+qCu003aK7xkrmig=;
 b=S5YuAeHkGXsKJAs95vpjGzP9BSpUZHjs0kKKHaLNAFSqw9RVjX8pVoJpGUtGTCezoe
 nx9Bp8+Id7JphjYlg+MgYT15wtiNY1C51mzu7GIMQ2m5i2vv2o20hgxskkQ/cjNmTgSf
 9e1EGFYFg4roea5IB6Po1mVAwnN6nK9k+/fwI97+Vgc9nAitnVzPTpa+ZRFLVsGKmNxe
 5ovNLKz0kD3ThI/Qkg/fJ26rLHh1D3i/Gmo5QJ6q2vrV31dSoGRR7XsV44Tm0OU8+Bpm
 FjyrqKs+Ii8RnyuZKiN951JWqSqbVZhYvxGfJDl3vOrp857HhgRmAbspD0bfJJi+goqc
 iMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755884568; x=1756489368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCaKntriNX9X76AtgWLOepHoJZS+qCu003aK7xkrmig=;
 b=qmVmXhRddVuW0x25tF5LcCGjmL6XGOfYU0E2Khsy8S/YtQyPKYrv4N2o/Ak+1gm5vE
 XNfAj3YneCWkc0xGTLwC0NQZBEFjjgOiqbzZHxQ4zO7zHPFylXsCoYycfHRfSz/r/lsF
 8OPDVE5WiXE2QfoEsmW3AAO4W33im4UQPQSV/1jET/PUyf6A66Bdu9LAoChBEcoFQLUg
 MvG93Oakv0W6lSzvrxCN+pHojaoV4dy2t+YJ2U0l5gW98ThL+9ageXcc5ff/qihh128g
 gvHOzAubdeYIclD6/BGe1YXiBW/aYe9DcPHNg4Dsyfah2x646ko97jOlPpOnGn1IjuTq
 aDGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLjwo4NaYzxZaPAVnnPkEcU+i1xSHpxJAMHdi90+tSULKCGEo9RbGTIfIh9Xl0b9KfktP/U41jwCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu7qngvuyfDl0Jf0i2vGIUq7N1jRRvcJuRYnJtlgBNiZESNeEE
 F9qlZ8wNIV6ojCthTMMJNn0iFc3LwVBjYV3KUUCp6jQ1oArqBjDzXF1+KsIKkxRNZDo=
X-Gm-Gg: ASbGnctz7tx5aQwhSFp9c0IU4OefN8YxujMDPALc0MGrYOyyQyq05V5vY6/+silPAEx
 gLLi/Br2bVgaUgRx+uao71rDsSkEKNZxx+/wmM3QfdXBaISbf3ziz7PZZCoekycDYKMJTcEKUuc
 ilsKc/REa+V57w45SJYM+mMGG8nPwAt8nJbEq6UM/NKKqF0i5bXiwyJBNjchqjEpKn0eVWhkX4S
 YdRtrzfRf9/u1+Xu8nkLcotA/Rd+qPzL0MfPFlcZ8d8mAsGxVFQH9Kb59lVMl/sE7ClTNeFlWxb
 RTpZ7nUE4TuXN44xZWae0B+sgLDdKuqLsw1s05pB3QnVtna1Vhhz+QpPyWReH5OOLdoJWJKeqKQ
 FoAX/skQZgLO4T4+r/7b45lZe6aW2Eu5zoB5EVy+G
X-Google-Smtp-Source: AGHT+IEalTXMRLBExjkJfhmWbKfZGlEYQ2B/07dHyNwP07FTl5MUSsyyOzKrKUj/4k/aKk0GC0EYCg==
X-Received: by 2002:a17:90b:4a47:b0:323:264f:bc42 with SMTP id
 98e67ed59e1d1-32515ec2d23mr4934158a91.3.1755884568015; 
 Fri, 22 Aug 2025 10:42:48 -0700 (PDT)
Received: from x1 (97-120-254-139.ptld.qwest.net. [97.120.254.139])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3254ae8ae9csm287059a91.11.2025.08.22.10.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 10:42:46 -0700 (PDT)
Date: Fri, 22 Aug 2025 10:42:44 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Matt Coster <Matt.Coster@imgtec.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Drew Fustini <fustini@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v13 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Message-ID: <aKisFGwxmgV7u3XF@x1>
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222020eucas1p20e40b85b991da0b4d867df76e55350ed@eucas1p2.samsung.com>
 <20250822-apr_14_for_sending-v13-1-af656f7cc6c3@samsung.com>
 <aa8d4ffb-4607-4bff-9d87-8635cd37d439@imgtec.com>
 <55e606c5-9ac0-4e0b-8506-5f88a6fc540e@samsung.com>
 <daf94e44-7c37-4fa6-a31e-b043b7bf46f1@samsung.com>
 <6df6dc78-d86e-4289-bbe2-0bfe4b168c43@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6df6dc78-d86e-4289-bbe2-0bfe4b168c43@samsung.com>
X-Mailman-Approved-At: Sat, 23 Aug 2025 10:03:57 +0000
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

On Fri, Aug 22, 2025 at 01:49:38PM +0200, Michal Wilczynski wrote:
> 
> 
> On 8/22/25 12:26, Michal Wilczynski wrote:
> > 
> > 
> > On 8/22/25 12:04, Michal Wilczynski wrote:
> >>
> >>
> >> On 8/22/25 11:28, Matt Coster wrote:
> >>> On 21/08/2025 23:20, Michal Wilczynski wrote:
> >>>> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> >>>> for managing the complex power sequence of the GPU on the T-HEAD TH1520
> >>>> SoC.
> >>>>
> >>>> To cleanly separate platform-specific logic from the generic driver,
> >>>> this patch introduces an `init` callback to the `pwr_power_sequence_ops`
> >>>> struct. This allows for different power management strategies to be
> >>>> selected at probe time based on the device's compatible string.
> >>>>
> >>>> A `pvr_device_data` struct, associated with each compatible in the
> >>>> of_device_id table, points to the appropriate ops table (manual or
> >>>> pwrseq).
> >>>>
> >>>> At probe time, the driver now calls the `->init()` op. For pwrseq-based
> >>>> platforms, this callback calls `devm_pwrseq_get("gpu-power")`, deferring
> >>>> probe if the sequencer is not yet available. For other platforms, it
> >>>> falls back to the existing manual clock and reset handling. The runtime
> >>>> PM callbacks continue to call the appropriate functions via the ops
> >>>> table.
> >>>>
> >>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >>>
> >>> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
> >>>
> >>> Would you like me to take the non-DTS changes via drm-misc-next?
> >>
> >> Yeah I think this would be appropriate.
> >> Thanks !
> > 
> > Hi Drew,
> > 
> > Matt offered to take the non-DTS patches (1/4 and 4/4) from this series
> > through the DRM tree.
> > 
> > This leaves the DT binding and TH1520 DT patches (2/4 and 3/4). Would
> > you be able to pick them up through your tree ?
> 
> Aw,
> Sorry I think Matt also meant to take the dt-binding patch, so there would be
> only patch 3 for your tree.

Yes, that makes sense, I will the dts patch through thead-dt-for-next:

[PATCH v13 3/4] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node

Thanks,
Drew
