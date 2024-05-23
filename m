Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A9D8CD2B6
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59D410E588;
	Thu, 23 May 2024 12:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pwjod96j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873E110E577
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:51:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38E5FCE1723;
 Thu, 23 May 2024 12:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3862C2BD10;
 Thu, 23 May 2024 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716468662;
 bh=SE/AcBnibbHXcnZ3edG7LB2eAeI51NeMqnEBvDf6bKI=;
 h=Date:From:To:Cc:From;
 b=pwjod96jVg2xfUFRbx1AaDAhg/huX+Go3KIY3xoGIES2JihxdndxYdDOOaT6dTa+Y
 /hyEiwsOnDAqhXATBfo9rHljyfVeazHPUHeOJbhFo4i3tLT//g/I7A8HFhWj8Aa9no
 eD3M+WDVzJzF7nNnFoDEtr71XfoJNU7l6U6Yl/ExLIgXltUngo9rXpH9OEMeZbf68W
 Ouxzf5qcD88qlLWvgvqGRkAenpfDLvLiGsB1F2tvgPiYKCnfvG44xM0gKESlxII5S6
 517Ij8Cm9z/urcfd8gViiw2UhGug/eztfiPExUnCCqk6RzlVxk1zTCDssZ28UNBcEG
 MEAAlhgearz6w==
Date: Thu, 23 May 2024 13:50:54 +0100
From: Simon Horman <horms@kernel.org>
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com,
 mingo@redhat.com, tglx@linutronix.de, x86@kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 zackr@vmware.com, linux-graphics-maintainer@vmware.com,
 pv-drivers@vmware.com, timothym@vmware.com, akaher@vmware.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kirill.shutemov@linux.intel.com,
 Nadav Amit <nadav.amit@gmail.com>, Jeff Sipek <jsipek@vmware.com>,
 Joe Perches <joe@perches.com>
Message-ID: <20240523125054.GL883722@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Bcc: 
Subject: Re: [PATCH v9 3/8] x86/vmware: Introduce VMware hypercall API
Reply-To: 
In-Reply-To: <683225e0-1cd3-4dea-bb68-086d46b233e8@broadcom.com>

+ Joe Perches

On Wed, May 22, 2024 at 04:39:57PM -0700, Alexey Makhalov wrote:
> Hi Simon, apologize for long delay
> 
> On 5/11/24 8:02 AM, Simon Horman wrote:
> > > diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
> > 
> > ...
> > 
> > > +static inline
> > > +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
> > > +				uint32_t *out1, uint32_t *out2)
> > 
> > nit: u32 is preferred over uint32_t.
> >       Likewise elsewhere in this patch-set.
> Good to know. Can you please shed a light on the reason?
> I still see bunch of stdint style uint32_t in arch/x86.

Perhaps there is a document on this that I should know about.
But AFAIK, u32 and so on are Linux kernel types,
while uint32_t are C99-standard types.

Joe, are you able to shed any further light on this?

...
