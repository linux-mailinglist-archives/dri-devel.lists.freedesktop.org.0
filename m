Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988783D394E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 13:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E436FADB;
	Fri, 23 Jul 2021 11:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B686FADB
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 11:17:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t17so1995357wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S8WwVQRfLT+0YgVaktWAs6cKEtHZfTnHXotrbhRYPLk=;
 b=EVouAHej+UXSehgbUHqpNrOqCHh2c7UAnWBbWV79YZa1GRI8jJ+YiBXaUoF6hn7hhE
 qqYby6CFmllOEXR2XPaJUOqXgGCG4A26juXm+mWuibBekkAfOyGJ9hAMcWBU/p27We02
 pDjVchqV7m8X6MYnTpiGCI55twrrwQrR3pEIt8uPB4ooLlMMXQvENky0JOcxhL8i+4ce
 Qur56fAc+1hCpl6B/5dKCk/f0xrUvKjBXP0AjXb7Py6jjGQXXZ1/14T5jWSaEu2L8XiP
 CC2XwQFL86ki3TCZklLYGPI88z8NEhoAbaAa7u7PlAkNjdYR1HRmexpzTCkIYWH73eAC
 B3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S8WwVQRfLT+0YgVaktWAs6cKEtHZfTnHXotrbhRYPLk=;
 b=C89/BXyaAnRu9DT/h21uSrpDkGYLGSqWUcQvkKZorDipEQJnuZIF26ITyMFgz5IXqB
 fdq3R4prrx/nYb6G6zJSa0Xvt2/zhmgqDLSf7gbqLJe+WvS9o9ZrK4PJhqB27fnUh7mb
 oIgrGTQcVg8/Ko4Aw/uVqF2suS8UzjhSDKUDVmQck8F4i5NZOf/vi0xffPxE5G3kVJyd
 CJez+vcC2d4wKS2tsYjv5PLXz4DRiFdBQa3gCcd+zkAtrxRWzdSNymfcpDWiI7wz5lGE
 PjuJOcgdjA4CkvRpOo209VGBXQgtE9WVrNQnGMLRrvsiwgVRVNouBIbajeXjkltii2ed
 NDOw==
X-Gm-Message-State: AOAM530lLoyXYYWTTyhbOD6V/6vK6sir/rdXHtHxbXkWwzoo328WTBIV
 ZMXwQcLteNSjs7AoWudSjj4Fhw==
X-Google-Smtp-Source: ABdhPJzJM2NBkW1FR8tuwIoIfkquQ155By0Bouro5WdgnqSK60iUBFW3nLZji5lk49wRS+uuNjb3Ng==
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr4672334wrx.399.1627039046608; 
 Fri, 23 Jul 2021 04:17:26 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id j20sm734263wmi.1.2021.07.23.04.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:17:25 -0700 (PDT)
Date: Fri, 23 Jul 2021 12:17:24 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
Message-ID: <20210723111724.q4yu2ocgn5fdzge6@maple.lan>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
 <20210721161249.gehnwkscto2hlh7s@maple.lan>
 <298f6a35-2120-60a6-598a-87b141118bfa@denx.de>
 <20210722112824.z5s2fst2q3vrblcr@maple.lan>
 <dd372ddc-0137-2f1c-8493-4bd38762384c@denx.de>
 <20210723101510.r2xz4rlzvgkhxtw3@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723101510.r2xz4rlzvgkhxtw3@maple.lan>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 11:15:10AM +0100, Daniel Thompson wrote:
> On Thu, Jul 22, 2021 at 09:02:04PM +0200, Marek Vasut wrote:
> > On 7/22/21 1:28 PM, Daniel Thompson wrote:
> > > On Wed, Jul 21, 2021 at 08:46:42PM +0200, Marek Vasut wrote:
> > > > On 7/21/21 6:12 PM, Daniel Thompson wrote:
> > > > > On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
> > > > > > On 7/21/21 12:49 PM, Daniel Thompson wrote:
> > > > > [...]
> > > > > This sails very close to the
> > > > > edge of what is in-scope for DT (at least it does it we can read
> > > > > the inherited state directly from the hardware).
> > > > 
> > > > The problem with reading it out of hardware is that the hardware might be in
> > > > undefined state and expects Linux to define that state, so that does not
> > > > always work. Hence my initial suggestion to add a DT property to define the
> > > > state up front, instead of using these fragile heuristics.
> > > 
> > > To achieve a flicker-free boot we must know the initial state of the
> > > backlight (not just the enable pin).
> > 
> > The backlight hardware might be in uninitialized state and then Linux should
> > set the state, likely based on something in DT, because there is no previous
> > state to read.
> 
> There is always a previous state. The kernel doesn't care whether that
> previous state was imposed by a power-on reset, the bootloader or a
> kexec.
> 
> For the driver to come up flicker-free in all the different cases we
> need to know whether the backlight is currently emitting light or not
> and, if it is emitting light, then we need to know what the duty cycle
> is (currently we inherit require the PWM driver to correctly inherit the
> duty cycle from the hardware).

Oops... this is wrong (I think it is cross-talk from an old patch). We
do not currently inherit the duty cycle.


> So far, the previous state has been observable by the lower level
> drivers (GPIO, PWM, regulator). I remain reluctant to provide
> workarounds for cases where it is not observable without motivating
> hardware. I certainly wouldn't want to make such bindings mandatory
> since observable hardware registers are a far more reliable source of
> truth than what the DT tells us about what it thinks the bootloader
> (or power-on reset) actually did ;-).

Which makes conclusion badly reasoned.

However, until we can clearly articulate whether the problem we want to
solve is describing the initial backlight state or specifying the default
(post-probe) power state for the legacy cases I'm still content not to
change things ;-).


> > > [...]
> > > Wow! That is *way* longer than I intended when I started writing it.
> > > Anyhow I suspect any disconnect comes about due to the difference in
> > > backlight state *after* probe being, in part, to software structure
> > > rather than purely a hardware property.
> > 
> > Maybe this should be added to documentation.
> 
> I'll see what I can do.

Done, see v3. I think it is better explained than the e-mail version.


Daniel.
