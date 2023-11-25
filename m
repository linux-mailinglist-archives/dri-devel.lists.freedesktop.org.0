Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2EC7F8860
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 05:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB55C10E0CA;
	Sat, 25 Nov 2023 04:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E467B10E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 04:58:32 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3b2ec9a79bdso1650189b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 20:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700888312; x=1701493112; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=H7+G6kTUsYcf2EuznU9nGg+6a0PiyVvvTpJ6OmKLYnU=;
 b=Xkt/Co80SfGb2QqGpkO8MZvo6MjYv1Q8+/uyFb16o4M7SCb0cxzCRbDY8rxtw64WVd
 zKjoX6QD4jnkXh3fByReIY/rUT8LdpgY5KI/D6mwExIf4HGuS3pKUSLTsoY8J0M+dpys
 aAWXmFMtIyHvMpmWlA6ZHVmMFCwiEtfU2v5Q1kTa6WwEdfnD47MKIdzaEA0KS6IKXYX6
 bx1OkmozHQ5KcukWdP5bIk4i8JMrxEZJYUWYPiUlS0zGrId1ReOuusza+NFZY5ggYju/
 7gI19RTfeweWdzQ6uvvcBC4jGBetzwUADe4FjotBI8P30NrxyVsLYpB6sHvJTThX1Yp+
 xhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700888312; x=1701493112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H7+G6kTUsYcf2EuznU9nGg+6a0PiyVvvTpJ6OmKLYnU=;
 b=Bjv0PeV3mDD0x/JZqxTDpOu9dr/h1BtuKFWYGRzzth+kPEoCV2FLhtmZM86VsrZ7HN
 ZE4z+Io0Gzo3NQopbWWKZ9lzsyDN/wne1C+PsXs633qGmnSIbKrhhQpMG60GjCs5V4Hp
 Xs0S3h5dbsbSTmwwkhr244Mv/0H3Z7OeuEHXlmeGaX+CrJFohgtb8IWX2i9U1PLSbknx
 CpYuhTdBMBXgmwCpt5aPyHdTcOZRNy57IyKdbTng/LFsCTWDvwAAiq1LBPiI9/2siCE3
 NBs/AKGBwz4r66om9N/AgUd7BCysggjX2NFspKjiC8RGorpWXHuCK15rH/jpD5jg8Dya
 lkiQ==
X-Gm-Message-State: AOJu0YxOuwaxZBhpXuN2bBd7YmcVxQ3K8xOVvonoX9rKzdRie7DgJnpe
 47KnOUazOiHfoMnWmXV8Aq4=
X-Google-Smtp-Source: AGHT+IFeTSL/V+P+KPM4Qgxl19x/Ka79WuZ6Y2vXNvWEwWRybB7C/6fG5QLOW4EjPMH7qokAspkoSg==
X-Received: by 2002:a05:6808:13c2:b0:3b8:3e4d:605e with SMTP id
 d2-20020a05680813c200b003b83e4d605emr7298648oiw.42.1700888311914; 
 Fri, 24 Nov 2023 20:58:31 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:8b5c:82d0:578f:d0])
 by smtp.gmail.com with ESMTPSA id
 fd39-20020a056a002ea700b006cb7b0c2503sm3703306pfb.95.2023.11.24.20.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 20:58:31 -0800 (PST)
Date: Fri, 24 Nov 2023 20:58:28 -0800
From: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To: Alexey Makhalov <amakhalov@vmware.com>
Subject: Re: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Message-ID: <ZWF-9DmwakJBonmf@google.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
 <20231122233058.185601-5-amakhalov@vmware.com>
 <20231124194646.GW50352@kernel.org>
 <A64E0517-57D9-47DF-8DD8-040EE6843246@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A64E0517-57D9-47DF-8DD8-040EE6843246@vmware.com>
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
Cc: Pv-drivers <Pv-drivers@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nadav Amit <namit@vmware.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Tim Merrifield <timothym@vmware.com>,
 "dave.hansen@linux.intel.co" <dave.hansen@linux.intel.co>,
 "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Simon Horman <horms@kernel.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "mripard@kernel.org" <mripard@kernel.org>, Ajay Kaher <akaher@vmware.com>,
 Jeff Sipek <jsipek@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bp@alien8.d" <bp@alien8.d>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 25, 2023 at 01:22:58AM +0000, Alexey Makhalov wrote:
> On Nov 24, 2023, at 11:46 AM, Simon Horman <horms@kernel.org> wrote:
> > 
> > On Wed, Nov 22, 2023 at 03:30:49PM -0800, Alexey Makhalov wrote:
> >> Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
> >> Eliminate arch specific code. No functional changes intended.
> >> 
> >> Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
> > 
> > Hi Alexey,
> > 
> > it is not strictly related to this patch, but I notice than an x86_64
> > allmodconfig build with W=1 using gcc-13 fails to compile this file.
> > 
> > It appears that the problem relates to both priv->phys and
> > psmouse->ps2dev.serio->phys being 32 bytes.
> > 
> > 
> > drivers/input/mouse/vmmouse.c: In function ‘vmmouse_init’:
> > drivers/input/mouse/vmmouse.c:455:53: error: ‘/input1’ directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Werror=format-truncation=]
> >  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
> >      |                                                     ^~~~~~~
> > drivers/input/mouse/vmmouse.c:455:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
> >  455 |         snprintf(priv->phys, sizeof(priv->phys), "%s/input1",
> >      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >  456 |                  psmouse->ps2dev.serio->phys);
> >      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > ...
> 
> Hi Simon, thanks for reporting the issue.
> Zack, please take a look.

We want the truncation behavior and we do not want GCC to make noise
about these, that is why "format-truncation" is explicitly disabled for
normal compiles. I guess we should exclude it even when we compile with
W=1 instead of doing pointless changes in the drivers.

Thanks.

-- 
Dmitry
