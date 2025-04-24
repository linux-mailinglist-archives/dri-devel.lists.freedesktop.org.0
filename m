Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A05A9AA8D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 12:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4510E7C6;
	Thu, 24 Apr 2025 10:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xsgoh53O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5A510E7C3;
 Thu, 24 Apr 2025 10:38:24 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-736c277331eso1930076b3a.1; 
 Thu, 24 Apr 2025 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745491104; x=1746095904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nrgta2/7VEwA556j+K1CA7sPpFtBFe12i6Ec93SGicw=;
 b=Xsgoh53OBvA2rAWj6LP5PK36/IiLMyDHBve/X2IheMfmX/JZbTlJ/vHQz41fIWNRQK
 +0ZvuE0fqBamZlNxWZDvDCFvEdyz4m1GU0w2RKwEiYQu65JsbHhhGZfy+cICB6MlASDu
 /tmLCIFmeYH1KtmsUq0W8MN7T4q9TCsLdXEWdgPmH9A1n9q3mRSatwTSRkjZI5xo78ZN
 73a+vogvYL7HXjicjyiWAsq2b5Wa4bVxAnoHLffHygx+bFmGK2nTbv8Ld6RDMSA4w8c7
 7WObwxyxH308ZceP5uV7LxklyXRC20rOYCLf8xcbtjTTrrLxtFQaCpuRv521bEcVHPV+
 RI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745491104; x=1746095904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nrgta2/7VEwA556j+K1CA7sPpFtBFe12i6Ec93SGicw=;
 b=Oa1hb63/qNqlu/HmetGVVEq+5XX8LZzKj+m13cuz9MA5IQDvno++sJIjlrRHRNiZCz
 k3E9II5+wIetMjBxEpuU43dU0dv/dFGZKf3Dv6BWi4/lVnz7KsmFSzm9XlhX10jnUjSd
 dRsAJtw/soWIzmSURinMrOVbbygcYlr+qn71e2N93TtWtpZ5Z60DstR010jorZRD/9+r
 kJsycMbTnQ0KobAlZ5u25fUZ9N6JTWv3uAPSybzSllaDkeIZDbxsnFD5AfRql+k+ILPn
 D/waTGIPedJabmhsNqs9krj6dQjA9aWofmKUgT6EgPrmsZXP9UfV8vZSVNM+EXVBunIm
 mTNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXZdSiQSGFEkNnLB7dc//qKPb6pFYjnJNhSs1r1jETsgyHFUFBjEBsaoH7Neo0FNvPEGCMBZ944k3f@lists.freedesktop.org,
 AJvYcCWIIM5tUVGiY3O5J0T4SYTeSXUiDGuvHNV3Ymyqs5rXdqVXYWiZqjFX2Wg+mqd1YMcqugtXYjxWeg0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2HuNed/KmF2WtFJowrpcrI0OAK+ojzjZxsfRitvih9jGEgUYh
 FeS8IdAys2Je5T0tSadoXsvBsOhFwfpuyc9KKu1SGeWhfyKcn59wmPPuI44p1+sXKw==
X-Gm-Gg: ASbGnct1HTDZuXDV+LaAaY6LvymibfCeYo+mOBhtGmAebU8zOyDJGF5KSSAwUwkmUko
 e67IdezhfzVwcN2cC+oYgf4THYjX/mrNH1pasX69YRDiwJH4mactBCRLcxxzfpr9CGv53n1pi4U
 HGTsGXoO9Hr0aBxj8nwl4uk3HJFFpM//OZ/WyamJ0g5Gfcj/ipdIy5aAIMjU7RzIzFYRs+ws7Tm
 7a1emx2VR0T7UVVxnTFVv1nSlN7aoGJPcmg07JBlce7NAjW8V+p+qPDStRcsVQ76M4thIE0qPeF
 I0dEdkQiekSKb673rSaK5YC6UNiIS2zsCDz4HQw=
X-Google-Smtp-Source: AGHT+IFblAEa2IajwDR48LGObFOr5YUTTm5hJ8f17L8YWgIJiEYZv9GGeLnUC1zETXQSojboHqvwfg==
X-Received: by 2002:a05:6a21:9102:b0:1ee:d664:17a4 with SMTP id
 adf61e73a8af0-20445dea998mr2677158637.10.1745491103634; 
 Thu, 24 Apr 2025 03:38:23 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15fa80fa97sm887608a12.51.2025.04.24.03.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 03:38:23 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: jun.nie@linaro.org
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 mitltlatltl@gmail.com, quic_abhinavk@quicinc.com,
 quic_jesszhan@quicinc.com, robdclark@gmail.com, sean@poorly.run,
 simona@ffwll.ch
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Thu, 24 Apr 2025 18:36:07 +0800
Message-ID: <20250424103608.184295-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
References: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On Wed, Apr 23, 2025 at 10:50 AM Jun Nie <jun.nie@linaro.org> wrote:
> Pengyu Luo <mitltlatltl@gmail.com> 于2025年4月19日周六 02:34写道：
> >
> > On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> > > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > > And 4 DSC are preferred for power optimal in this case due to width
> > > limitation of SSPP and MDP clock rate constrain. This patch set
> > > extends number of pipes to 4 and revise related mixer blending logic
> > > to support quad pipe. All these changes depends on the virtual plane
> > > feature to split a super wide drm plane horizontally into 2 or more sub
> > > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > > whole drm plane.
> > >
> > > The first pipe pair co-work with the first mixer pair to cover the left
> > > half of screen and 2nd pair of pipes and mixers are for the right half
> > > of screen. If a plane is only for the right half of screen, only one
> > > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > > assinged for invalid pipe.
> > >
> > > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > > the 1st pipe pair will be used. There is no concept of right half of
> > > screen.
> > >
> > > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > > the single SSPP and its multi-rect mode.
> > >
> > > To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> > > are needed:
> > > https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads
> > >
> >
> > [...]
> >
> > > base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
> >
> > Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
> > topology, I want to test this series, these patches can't be applied to
> > the latest linux-next tree, and I can't find the commit id in linux-next
> > or msm-next. Where can I fetch the tree?
> >
> > Best wishes,
> > Pengyu
>
> This is staging patch set. Code clean and formatting is still needed.
>
> https://gitlab.com/jun.nie/linux/-/tree/sm8650/v6.15-quadpipe-staging?ref_type=heads
>

Sory, it seems that this repo is private or internal for linaro, it is
unavailable in my end. Is it possible to set the repo publicly accessible?

BTW, I had tried it with linux-6.14-rc2 as you mentioned in changelog,
my display(PPC100HB1-1 binding with TDDI NT36532E) has the flag
`BL_UPDATE_DELAY_UNTIL_FIRST_FRAME`, if there is no frame, backlight
would refused to turn on. It turns out no frame is sent to display. I
checked encoder in debugfs(/sys/kernel/debug/dri/0/encoder-0/status),
found all frames underrun. Do you have any idea? Thanks in advance.

Best wishes,
Pengyu
