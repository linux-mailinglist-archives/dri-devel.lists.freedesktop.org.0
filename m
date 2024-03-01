Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395BF86DE29
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3A610EC36;
	Fri,  1 Mar 2024 09:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CFF10EC36
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:25:43 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1dc13fb0133so15557015ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 01:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709285143; x=1709889943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXWMw6pAsiGYzdNx+w6Q2+x0DaSbJ210Wdmf7IDSwcE=;
 b=wXehmMjK6W4G4FS6yJv7nlDJEvhvAqG7lwu/ux8DxhyGY50wpQA76K5HabUixd5z2y
 pwWhkojMoZEFXtx+/Rdd2RDutqMyPN++G/L6vqa4c2nTMQ9+17UoNMWRKcrwEELzi5TH
 kZRCh9Sz+VU8L4xZtfKsvK7kVw8zTiNMXcPM9n4i37XKgj2Rzaau5ybTRYyXd6UJnTmf
 nD7yIywOPzeFoyNq8KjcY0FhCgm5QNW8nICUlZdR/ZBGarSg6I86kgDvLjsFAY/AQOVO
 ygjKAxM+JWQRpwm4Nf/OKN2GSfx0ZJ68ylwz14CBz7uMuddxeXmzOhy6KBqiUIsWfKA4
 p90w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtp17zPDWTNURb77JOCSlKV6uy2pmEXkQ/v04ZraYgAY94q4WUl1GEXBjy2AtzPtfwXm9r3t60SHBSWIvI68n4fYyzyXCfgfqCc0zRTJM/
X-Gm-Message-State: AOJu0YzWSqAAYBzcqqh2CEfRQCLbEiUetHVroy+u4FDw5W3Tx9LUah+R
 Bc1sq1aBQ2z9c+2v5mZS36ATsvEKFmcvAji11N5qAvKOocSTpvDs
X-Google-Smtp-Source: AGHT+IF/Ali+iq2it4mBYZ6Hp48G9qyMwdaeV6hXW5BlAgiCCv092V5PsmqkYC1zOt9KytHj+WDcAw==
X-Received: by 2002:a17:903:98d:b0:1db:faa6:d4a9 with SMTP id
 mb13-20020a170903098d00b001dbfaa6d4a9mr1387902plb.69.1709285142693; 
 Fri, 01 Mar 2024 01:25:42 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
 by smtp.gmail.com with ESMTPSA id
 ix19-20020a170902f81300b001db45b65e13sm2953154plb.279.2024.03.01.01.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 01:25:42 -0800 (PST)
Date: Fri, 1 Mar 2024 09:25:40 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Michael Kelley <mhklinux@outlook.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
Message-ID: <ZeGfFAWD0KfClwWI@liuwe-devbox-debian-v2>
References: <20240201060022.233666-1-mhklinux@outlook.com>
 <f2fe331b-06cb-4729-888f-1f5eafe18d0f@suse.de>
 <SN6PR02MB4157811F082C62B6132EC283D44B2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <8f6efa96-0744-4313-bb15-b38a992e05fc@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f6efa96-0744-4313-bb15-b38a992e05fc@gmx.de>
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

On Fri, Feb 09, 2024 at 04:53:37PM +0100, Helge Deller wrote:
> On 2/9/24 16:23, Michael Kelley wrote:
> > From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Thursday, February 1, 2024 12:17 AM
[...]
> > 
> > Wei Liu and Helge Deller --
> > 
> > Should this fix go through the Hyper-V tree or the fbdev tree?   I'm not
> > aware of a reason that it really matters, but it needs to be one or the
> > other, and sooner rather than later, because the Hyper-V driver is broken
> > starting in 6.8-rc1.
> 
> I'm fine with either.
> If there is an upcoming hyper-v pull request, I'm fine if this is included
> there. If not, let me know and I can take it via fbdev.

I've applied this to the hyperv-fixes tree. Thanks.
