Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25354B59506
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8353310E6DE;
	Tue, 16 Sep 2025 11:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="VN4jdomI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A1610E6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:22:55 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b0787fa12e2so748951766b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758021774; x=1758626574; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h0oabvOv3LnHYmSMEDkeEgkYTZEtABtHwxuQ+4V9AEw=;
 b=VN4jdomIzkNc44AkZUSxPcHMEv/U6YC/4C4J6ReeaVPcvHxKZGGSM/9rXIFBUcR1l4
 fcQQaggF3eEv6GZPY20pDrjBfrm2yJe/ajd76pvwWhiPYhTPOq+u8HDvugAy7+jxIbm5
 bILzzXjZunUS4v20lidRP4OKk5VN5PQafqw5lGKRZ5YTUXT5T7BbKwbFMm4+e5VzSa8i
 c3Tp75IjOD1bqa705d3Ke1Qyl8E0IoIHaMrAeaEvF5o18j+FDg/jbwiBWKS0t3MF29ON
 t1Zt7aIUCLAYgTby0/mYE151/OgHIWWUOa9W+3odHMW/27DGMmanTZiKKdrFUitPEalJ
 /QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758021774; x=1758626574;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0oabvOv3LnHYmSMEDkeEgkYTZEtABtHwxuQ+4V9AEw=;
 b=pu93dnhfi2h0p6l0bdzxFZept2R6Gza5VOnhRov8qUklMxGGv9AK7RDGUccfJgw9UI
 V/6Sh4ezR1DMTOXVwIx3ni3gNdrafDd0qXrrPhi/UDFuPzVQ+4zUZ5vC4F/rftxywCsz
 74XUkM2p4ZrTyye9XY+pikKcbO7WSf018CVQ6qiKjb5zsn2yoWxbgMyhvJ8goARiKCaE
 8CU1n/QQMsfToDL1W88laPDH9WMKTs6j6zVlwF6fh7Gh97oAj9w/r18V1RkDOF/cX3rK
 iubrmKot9Qi5L01r1OvhxG3Pid/lL7bnofdYyTbnOb6lWkBqhrJuKua0jKb2vJbfdmI+
 HX9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn9akUbhEcR4EcEbn04NxLID2G+ZFc//qC1yO9AkSYFXS4xZOgjzkeLyBy3+6gCyY+SMdRsCI/NZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfdLd1owDHPSsJpjNziDeJjF6X0tNPl1ioDJ4mlz/PRWWLwQds
 IkX+HTy1HXtFoEVlL65h3DWVzfQ7yyz7HOH82BWRENoXLP/drNIsY4XB+DLgb56D5nY=
X-Gm-Gg: ASbGncu3hEZh+NUvKYI/dGFveju2bJgvMIY2axnBrjzWbh/ix6AoLbQpTgdZi3H5Rq9
 AV5q+5+DG2KitgwQ/ozF7IC+c4OjGy2dos14qeEtpKZRy+tsRFkEDT8Oq/82bScP6Khe6YOM30v
 44fLPgz0tc7p8FmWzOBl4bPBLHJnZ9x4M9u2n+xvJte1qHjmMg0bD24yprjZoMWIWnTMkuSkyRr
 QDeBYoPEdE1xcw3lAvQXg7vVU/yjzyx7Ehzj3y2nt5F2JUYeEY0dCz8MS+NtpfxHZBHF4VlzNXY
 Fc4lRtSKntMvO1/tTC+Kz5KpgCIInEuJNq79IRWbgqOq/IKmoKP9tzAiXixxgxobEzc4rxSMufj
 tOQj7poWkdwCO0i06aHpScHgIKVcwjVJOmhJbecukvNRcMpg2ppw=
X-Google-Smtp-Source: AGHT+IHgksZmCXWo+aWrU2puhznGEL5CDcY5xl+DcR6ldtoPz+TwMIqHuYXw60VG60pLkMPaI+rleg==
X-Received: by 2002:a17:907:daa:b0:afe:7027:56f9 with SMTP id
 a640c23a62f3a-b07c3574efemr1811450966b.17.1758021773565; 
 Tue, 16 Sep 2025 04:22:53 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f2098sm1157083666b.74.2025.09.16.04.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 04:22:53 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:22:51 +0200
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
Subject: Re: [PATCH v2 7/9] panic/printk: replace this_cpu_in_panic() with
 panic_on_this_cpu()
Message-ID: <aMlIi9cT7xiYWo29@pathway.suse.cz>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
 <20250825022947.1596226-8-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825022947.1596226-8-wangjinchao600@gmail.com>
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

On Mon 2025-08-25 10:29:35, Jinchao Wang wrote:
> The helper this_cpu_in_panic() duplicated logic already provided by
> panic_on_this_cpu().
> 
> Remove this_cpu_in_panic() and switch all users to panic_on_this_cpu().
> 
> This simplifies the code and avoids having two helpers for the same check.
> 
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>

It is great that the helper functions were consolidated and moved
from printk to panic code.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
