Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69CC4E826
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 15:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512EE10E5D6;
	Tue, 11 Nov 2025 14:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="2GwE9k6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com
 [209.85.160.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A411910E5D7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 14:37:30 +0000 (UTC)
Received: by mail-oa1-f66.google.com with SMTP id
 586e51a60fabf-3e2bceca89eso1233476fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 06:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1762871850; x=1763476650;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sI/Bx88S/ljGSNn+PL5Rjkz6jNPZ9Ne5hLvzfkx+saI=;
 b=2GwE9k6u9Gvvtu/M4GxW7NcRVqVvQbfkrayHpkRxlLN0VC5d3g5GVeQXuH9nb/rNOR
 njDgxzjMwZFMyFl2JiXdqbOG0TL1jqfPNdzNlp+DUw1AZkE/XH0JmJUleRIw2yQyHr1Z
 fhlBK1mUnzs1+9xt83Kt2z/IaVywdrNt25VThkQwn+az/DyE7yjf/LW10IYswxoTMyPX
 KMjQb2bupElMsiyeuwY1FkaceX5VQc7tc8fUl6P3pS8NPJRqY26ddxU1SRf0dhHfxKE8
 VBZ46vFr6TvX4eUYVsq+2Z+/Wu0Y3ycAbLI70gTCvfJvxLyaJhJEWNtF1f2mTKAp4K47
 nMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762871850; x=1763476650;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sI/Bx88S/ljGSNn+PL5Rjkz6jNPZ9Ne5hLvzfkx+saI=;
 b=uJGEtyDmsE5t8fcbfi8E3te5NganTluIIl3E+/wbtUYvBqsZcKqUzKtguGy4p36NkR
 E4o+iMGikCQahhA9Zr96m2mjsUaY5laSheioNyE1xBl8BJ+VVf9K2MH5j3D2R4CYdiKf
 nJ/iL5CfAx5ypJ20mx7gQX+tLY5j24BbtTtcnbgbAQNKMLddlYIdNQ9ags3BkWF2LcZp
 soQ5wEXzeo6Ivc0Idqa5FrlXmIodda2/Hm2eWIoEQ9NYDysJiFt3GaEOWVHGmH2nUt9k
 Os2PQQjnVh5tc2e58CPHcYnnaQs2AkcPGF4LTWWAUy9fmrxA0ZLxUz2AvdP7rtGjXIsN
 juQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjqyb/xQZnvz58OeU53hVFWJcJFJKQ35rc0CwE/HuqrjTXxfEyhrtIJca7VP7W9ANpQTx0EW27TtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRoEG2pMoHfOTf5OxTSscmQHdJpauw81NO3C5BeWwCUTap42Hk
 qUIU2+LVZ9koLaEjDOSPp00OTFgjPiOsrOtq9dLTDW/XJoO4ob3CJJk3h03DkFwzvng=
X-Gm-Gg: ASbGncuSSXWL0jo3jw8S/PLOekLQsiWQ4pBH9/WmUQ9ZxTRaCpopHZBgIPTNELeENac
 Ohz2+CW8xZ7oUrqRYFrnclaCMP6g1EUBIWyXFe7/EeVDwvAxWPvOSfdiyHff5NeDDpck7rx/Gom
 2D6FoOkHaZFEw09qfmdK6UP1/kBpy2bodmS0K5DCdkp7lyTeNhPi2aVEnqC7tJG2ouZ9Fm3Ukpi
 /1mIvByHmEWDVIdNDJ7wQcS/txzkUJ6p06Bq8HpcpY8EThe1H8i/GyZXz8y0vAK8YyWlWXo3cfK
 HTy6Mgvapfokl96OZs718E4ZcuOOKkanamN53wCzowYfk2lyJzrNWrn9Cq9CYpLebLmLfik9I/2
 JZSnot7fRFUH0LmgcH5CUHlT9Fj76NSiXo80piyLDVEQ5wcCQICmJbPD9QrZJ/CR4NyCRPQg86D
 u4tE8=
X-Google-Smtp-Source: AGHT+IFusuA/Ax3anjd0HIltuToxJUS02/udclYoHdoDI29Kk3VNxq4/rhyMyYWudQr5f0WcO3jkBQ==
X-Received: by 2002:a05:6870:4792:b0:3e7:f4a9:588b with SMTP id
 586e51a60fabf-3e7f4a9b0bcmr4110818fac.15.1762871849590; 
 Tue, 11 Nov 2025 06:37:29 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b4e9:19a3:cdaf:7174])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3e7d6f7a27dsm4861066fac.0.2025.11.11.06.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 06:37:29 -0800 (PST)
Date: Tue, 11 Nov 2025 08:37:24 -0600
From: Corey Minyard <corey@minyard.net>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian K??nig <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstr??m <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <aRNKJIyk2ne39ScE@mail.minyard.net>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
 <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
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
Reply-To: corey@minyard.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 11, 2025 at 05:08:25PM +0900, Sergey Senozhatsky wrote:
> On (25/11/10 19:40), Andy Shevchenko wrote:
> [..]
> > +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);
> 
> Strictly speaking, this is not exactly equivalent to %lld.%9.9ld
> or %lld.%6.6ld but I don't know if that's of any importance.
> 

Dang it, I'm traveling and used the wrong way to send the previous response.
Sorry.

Anyway, yes, it's not equivalent, but it's not important.  It's better
to use a standard output format.  Thanks for pointing this out.

Thanks,

-corey
