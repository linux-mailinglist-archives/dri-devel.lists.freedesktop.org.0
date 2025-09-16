Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84925B59501
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FC210E77A;
	Tue, 16 Sep 2025 11:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="XNYXN/uN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4241110E7C8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:21:34 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-62ec5f750f7so9366236a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758021693; x=1758626493; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uea5mfPfz6gsP2PTuhVLwd3VedG7XAMEGNBdCWZOsHw=;
 b=XNYXN/uNhDic5ZxpsjqMitK0o0LsEr1pWmju3szH78AYg+pwVjkCdlYMueSTcw74UG
 dPt626ZDNPNSbuf61jvWKTHuuxta+jl/YiH99HroBosb0N9XX6xChulhvZxSgzTyUeha
 KFab7d6rCL8aPlK0UPODGTZ4nm7IFBfV0qRs+CFH+VkUIremk5GUayAVpP2dW1VF3QNb
 w6N7x3PQYFY5K781g7kw3Zy6CQBXX/TfXhXxcB4jzhUUvdmpDTsvjrR35/7XzTLA30Kb
 k5+rKr4YXULuJhAvdZgWalfLLqs+b/d4xvkEMXKXxzwCxOsXmGugzbjwt5v9bKRbuZ8U
 IgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758021693; x=1758626493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uea5mfPfz6gsP2PTuhVLwd3VedG7XAMEGNBdCWZOsHw=;
 b=Qs+KHvlFkBd88Jl3CDn+3RjiXD2IystuOqCHf2hYESVdt7snKCdInQd6bjgi50Qqdv
 lMhNzX0NQgXJTuyLzaRv4clAxpJwg9aPmVo+cIq9zqjQY6MQFvYK3u124S13tN4jDa4/
 DxcG6FiEMX06xGuKP2k8cCvq5n8GL7DoEohs+qHho2SEyL7P16bgkh/StZaC1PZUnynu
 EHU2i2h1ZFvBunwKKpOvwdG12QDlGvGxP+ITZ8ea7NZNUcir5wCdnwH5sO9WuvcBKtgI
 lF9/sijxcuCwTrsKP7shBewDHF23HkuVBxRAJQ0bxwIqNTiU1SDYjnzS01tP6+1NQxgS
 4Imw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCzH1N93hTenuuZeRak6y4URuuAsDqKiX2pI3FARzUCE2Eay4uAlKB6QQadmjOfjUFN1H3E1FxD40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw1MiuEoW8IVAVOL2aFEQFXXMTbmCCQm+BsIIH4lv+CnR4SZl+
 PYgASakOayEy7ALDGm2wd+JTfAgGeC56djLmgiHqFMgJBevyqcGoq0jL1aI2B7AugPY=
X-Gm-Gg: ASbGnct9smM/5b7xaj1/7DN8CPS+EXlRmHiJzUliGEx6v+lyfx3K8qb1OdP5OMKsxZe
 aVl7/55b773TQTkTPvPVjL+J4Ud/hMYUqUOERDbDDas7i1rDObwPotglaSSbiDNjAcHwrzjMl+D
 bT0JNHd+4A98mQy0fVZOnrev6WpSziWWvaq9AFgpvQX5z4i5YKi1cFTMTquD+KMaZ6MTXXXDYk4
 OowwdHYtnn4vmvJYTn/MzT798Y2HuwkbDPI8ZEKQDpaxTvDaA3G+b/lSgWte7HDW9NRhLlz9UiL
 1NLEZgBjrpWd4LfwxEOIwIHEIbnPFtq7mtd2yKoqPuFEXNPWf3laefaJ5SissjhwOTyEAL1rzO5
 ndrcKWfxSJmqeGtW38ixv/kzxa5JdS9BIu7a7prJy
X-Google-Smtp-Source: AGHT+IGdaApH84qgSh4FpIAmIv68lRlYszt1DGU1HPMtQq+Jg7ayFfDUxA0h2cZACJ5agdILmluAcw==
X-Received: by 2002:a17:907:6d22:b0:b0c:5929:4cff with SMTP id
 a640c23a62f3a-b0c59295025mr1006070266b.26.1758021692577; 
 Tue, 16 Sep 2025 04:21:32 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f21a2sm1156991066b.83.2025.09.16.04.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 04:21:32 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:21:30 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Zsolt Kajtar <soci@c64.rulez.org>, Ingo Molnar <mingo@kernel.org>,
 Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/9] printk/nbcon: use panic_on_this_cpu() helper
Message-ID: <aMlIOt52xnLIvOpK@pathway.suse.cz>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
 <20250825022947.1596226-7-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825022947.1596226-7-wangjinchao600@gmail.com>
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

On Mon 2025-08-25 10:29:34, Jinchao Wang wrote:
> nbcon_context_try_acquire() compared panic_cpu directly with
> smp_processor_id().  This open-coded check is now provided by
> panic_on_this_cpu().
> 
> Switch to panic_on_this_cpu() to simplify the code and improve readability.
> 

> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>

It looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
