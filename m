Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0DEC4E8BC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 15:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8CC10E5A4;
	Tue, 11 Nov 2025 14:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EJzidkmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ECB10E5A4
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 14:44:12 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-640a3317b89so6308660a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 06:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762872251; x=1763477051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1/P4cjnJRMKeJXb4QuiXEQkEuLjYJ7u3PWbuQSeBbc=;
 b=EJzidkmSDfzMFVIA9nX11N72kh7WKrNVT3UaDdTCnA3sjnwh/YK/i1EgPh2yDyR87+
 a0Zw+tRo/XVAYcPxARMtA4EE+3LD2SXfu1SoHGcE6oRUb0MbOwFWiF4GouTALoGc/VEF
 6YK9PfWJ4qtIwu/m7+BJ1S/K1Y2HNLCNBJLwZq+5m6r8+DGJM0c7nSCMXvJmpWiNJord
 ElTSuFrNncJlHmodDwNii6jjIzXA9CvDbL7RqLs6MGUiCbHZg7uB2iAhMYD53vLPARP7
 NFpAaqWXjspliAn1p+1LKVYWpk0/ooHGQn+97dC9wWfAtQsjl/HR2ZGNqs+vfO/omohA
 Iihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762872251; x=1763477051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y1/P4cjnJRMKeJXb4QuiXEQkEuLjYJ7u3PWbuQSeBbc=;
 b=BDJzKKiHmjppWI6lBj5t3T4OPw24Y2dmjvnm1OCNrGOZ7kgXkniXMhZgg5V791LiNs
 6aGKXAqjOdoxO+YKyD8Tx6yH2/iymPwE8ah9SRYwK0G8bT3+3pGfeGa8sfipQhX4oQ9L
 pjmuywN+uZ4QgN3sjh/1Q/nSEpVABYkio55PprEwq6pmdKn7X6DnxLfmK/c/zBogv6dc
 NJmyJ6qke1IsfVUBwYT+4KzGZvT+s15XBXP/C5pOY0unCqGKUBmUOrzLq9Y4jPyTZUVo
 33DnKsaH6+6rk7SLI2XjeL50DuJB+7p4lXuht1lqQt5tOf8/wXk84Ui9dIAJ02+EhZUf
 iZfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbc2daBc0V39Hji/RC2nqvN/R/Su9bmRqnsUTOT+G/SEdKAq9CNDkNHM+A8/UAzpQX9ZT2S2bj2eE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSmdPIrY7O213qaoiJ3mwQ++w/pzN2RyIUpjWvWlCtE9zlqDDQ
 5PKWYKdKWIjJpat7c28ypdSXNyKwMarIcBiXDE/OfBFtUGJlbC30SkfUuZKN+y75I9OXSKgk6+o
 WuO03dxkANy0nGd2UKr4rpi8S5OrYMsel5k9PZqYFpw==
X-Gm-Gg: ASbGnctkknJq2i06yTNR0IgV35XQ3iCthsQVk4y4AjVuyH2er+W4Cy3xDcwjxUCK/Xs
 z3uz62WiGYPZwOONZPry/243/mdVgZpibnLemAGlut4kBP2GJNmQKjszNF3Sfyy7h8Me8pR0A7u
 lWBAXXJzKcGEBw5k+qJpX3RhMANhNO7co47VCuJ69+eUMt3ysXojfDMwwhXm2q0qw/4j5jfV41M
 92wdOVg4kQ8vproP0j8TYWVfw+WBKZaRlB5y5frNT+Nz8692i/XhC1pNYbBAgcqbor4D0col5Zs
 FPomLRBcYq2eOvNPRQ4eBKWGDPI=
X-Google-Smtp-Source: AGHT+IHMY6SoKSk0VgpDlYvVT6P+glN4Yq9XXIqVKd9jfwRPr/K5XWhLNKItsuRhohz/IcTpClBme4+jDstH4cTCaYk=
X-Received: by 2002:a17:907:7ea4:b0:b70:b5ce:e66e with SMTP id
 a640c23a62f3a-b72e02db993mr1289989566b.21.1762872251327; Tue, 11 Nov 2025
 06:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
 <20251111122735.880607-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251111122735.880607-5-andriy.shevchenko@linux.intel.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 11 Nov 2025 20:13:59 +0530
X-Gm-Features: AWmQ_bnAE43qdt9uTp5GKOPhntYFEAk4L2mYcClIlF1B_9-TbeBvnkuEckfJGvA
Message-ID: <CAO_48GE5LK7hD-KJHHoD-XCRjTPcZWApE2MVvs4OgVdr1=u+rg@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] dma-buf: Switch to use %ptSp
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, 
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, 
 Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Andrew Morton <akpm@linux-foundation.org>
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

Hello Andy,


On Tue, 11 Nov 2025 at 17:57, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks for the patch.

FWIW, please feel free to add
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Best,
Sumit.
> ---
>  drivers/dma-buf/sync_debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> index 67cd69551e42..9e5d662cd4e8 100644
> --- a/drivers/dma-buf/sync_debug.c
> +++ b/drivers/dma-buf/sync_debug.c
> @@ -59,7 +59,7 @@ static void sync_print_fence(struct seq_file *s,
>                 struct timespec64 ts64 =3D
>                         ktime_to_timespec64(fence->timestamp);
>
> -               seq_printf(s, "@%lld.%09ld", (s64)ts64.tv_sec, ts64.tv_ns=
ec);
> +               seq_printf(s, "@%ptSp", &ts64);
>         }
>
>         seq_printf(s, ": %lld", fence->seqno);
> --
> 2.50.1
>
