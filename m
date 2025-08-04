Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B0B1A885
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 19:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB910E326;
	Mon,  4 Aug 2025 17:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LSExDwkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453A710E326
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 17:15:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3b7920354f9so4188826f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754327733; x=1754932533; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NrTKl9K4+8vI5BzLuQ0RcuyJtwiyeqQNxpuwyBCjmjM=;
 b=LSExDwkAq8Q8xMnIptvZ9zQ1cVVUQaKzO134Sah/CkephVgw6DKjgrhA/fMoYWJoSg
 gPHDa1W9NIlqZpqVPV7JTzOqWp/M6/3e9iHiCTMfMwaX2SgKobFyrfU4b2nBitMsTpjr
 8poh1EujeI/3K0OAH6Rj0dsKO5PoInTVtOrUaNlX4Oz0pl71KrXlc44FfR9lfwx+LMZM
 h8InnUc9ZqdpKngByDaWa5OYo+m0vvpZnvotgVVz8Fb4jAKJTgMzcr9Q1Yov/MwFfFzx
 L8XmNMKQ6gdHp+GloBq8oQVqjZVkYvd7PbyxlSA9jsJZpEwML3F8Ww5AP74CRkmGhEGn
 LNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754327733; x=1754932533;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrTKl9K4+8vI5BzLuQ0RcuyJtwiyeqQNxpuwyBCjmjM=;
 b=CnKgnccIdLwQVnxcFscMoBf3Wy3NhtyyHbmI0nnucGkqaKGAoY8CCFjpZyDu/8y7lM
 088erwrXz9LP9yWK/1C5uAxFpvOixoiYYiezFcuPXA+EMCtkPc2ZZsIxOMe949j6ilIG
 TpzIY3XKoOjT4YDp61rop0oaR6Pff59I+9ZttC9EHmlqswd3Jt/KsygXu0lR4F4V4jWJ
 7/CqK1so7Ie9cTneB7h0ASM3qikaZUgifOmYejmEFy1N3o2uYakzVAXjLyFxGpY7m6MO
 bB8LA1tVN9ApLm9/4UOZyMQzPQvQ4WoEPApH5GQM35nAUhY6pDTG9HhqtMzJBAA+WkK4
 WYXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsWg6JutiFZ1s6euAdIioa9RhP6b1UDKkVR7Lu2SxN/SCxC0nGNp57QbXX3jERrPdvTSzD74I6cHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybVa6rdYexCOAjtbZF7RwO8AXDH9suTntRB3QZC80Pv9InFGnT
 /BWMLK7YnDSMCKmztg5K86bxQwObxnKMfmbNaZkBvRgQHuJ6rBRZ9ZpM18KDnSHUJ3o=
X-Gm-Gg: ASbGncuPKe9dp9VOFoVbELuXoBNM8O983XidDLMhOTavCzkjrkWHuofX2jWwVuiakbH
 iaqnQad72QLaH8glY/Xpglw3MFGZ6va6dyu3VJrqwV6GOxFQx30uSsZuuWKMlgH5Nw3lxQPJKKH
 RB/NnIHh1bStLcbAZ2SA5WrWv40Tx/62GQuvxISvLwMql4F5niK9nfl+THC2Icz0h5EJEpWuLJQ
 BeKk4GmGeYnst0o0W7u/kpCdLbxzpZoBV02JV3TJ8TWR4Y9smBOxW2EH88yeArPD75MkpDhlt05
 JJmltl8Yc1/bHs67aele385XqNx3QPR1D76cn1JCyH5YUwpRrBrZM1GYPavQoJR/YcDyMJNexrq
 rRRs0iJ/Sp4y/RrWHoyaY8hTFtwlAhXKimM83lQ==
X-Google-Smtp-Source: AGHT+IFGyZV3Lnqkd/Us0kr0C9bu01zWEPsZjgPddB7McgPHFiYC5RrBkxKNSmpQutG9nl15DFY5XA==
X-Received: by 2002:a05:6000:1ac6:b0:3b7:8af8:b90f with SMTP id
 ffacd0b85a97d-3b8d94c3f5dmr6949009f8f.40.1754327732649; 
 Mon, 04 Aug 2025 10:15:32 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4a6f62sm15897981f8f.73.2025.08.04.10.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 10:15:32 -0700 (PDT)
Date: Mon, 4 Aug 2025 20:15:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
Message-ID: <fda8103d-cac8-4c00-a78e-6eb27141d9ea@suswa.mountain>
References: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
 <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
 <c82931b5-0de2-4e45-a80b-3a90b0cc98a2@suswa.mountain>
 <CADnq5_Mk3FO_tvxFo+fJgqskVc7qtGv74VM6EStx_BcVpahXEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Mk3FO_tvxFo+fJgqskVc7qtGv74VM6EStx_BcVpahXEQ@mail.gmail.com>
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

On Mon, Aug 04, 2025 at 11:08:57AM -0400, Alex Deucher wrote:
> On Mon, Aug 4, 2025 at 10:49 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Mon, Aug 04, 2025 at 10:32:43AM -0400, Alex Deucher wrote:
> > > On Sat, Aug 2, 2025 at 4:22 AM Ethan Carter Edwards
> > > <ethan@ethancedwards.com> wrote:
> > > >
> > > > The repeated checks on grbm_soft_reset are unnecessary. Remove them.
> > > >
> > >
> > > These are not NULL checks and they are necessary.  The code is
> > > checking if any bits are set in that register.  If not, then we can
> > > skip that code as there is nothing to do.
> > >
> >
> > It's not a null check, but it is a nested check and it's a local
> > variable so the patch is correct enough.  At this point we know that
> > grbm_soft_reset can't be zero.
> 
> It can be 0 as far as I can see.  If none of the GRBM_STATUS bits are
> set, then we never set any of the bits in grbm_soft_reset.
> 

You're missing the first check...

drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
  7657          if (grbm_soft_reset) {
                    ^^^^^^^^^^^^^^^
Checked.

  7658                  /* stop the rlc */
  7659                  gfx_v10_0_rlc_stop(adev);
  7660  
  7661                  /* Disable GFX parsing/prefetching */
  7662                  gfx_v10_0_cp_gfx_enable(adev, false);
  7663  
  7664                  /* Disable MEC parsing/prefetching */
  7665                  gfx_v10_0_cp_compute_enable(adev, false);
  7666  
  7667                  if (grbm_soft_reset) {
                            ^^^^^^^^^^^^^^^
Unnecessary.

  7668                          tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
  7669                          tmp |= grbm_soft_reset;
  7670                          dev_info(adev->dev, "GRBM_SOFT_RESET=0x%08X\n", tmp);
  7671                          WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
  7672                          tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
  7673  
  7674                          udelay(50);
  7675  
  7676                          tmp &= ~grbm_soft_reset;
  7677                          WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, tmp);
  7678                          tmp = RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
  7679                  }
  7680  
  7681                  /* Wait a little for things to settle down */
  7682                  udelay(50);
  7683          }
  7684          return 0;

regards,
dan carpenter

