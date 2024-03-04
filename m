Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D987009A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91D810FFFD;
	Mon,  4 Mar 2024 11:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7ECCD10FFFD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:45:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 850001FB;
 Mon,  4 Mar 2024 03:46:26 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5240A3F738;
 Mon,  4 Mar 2024 03:45:48 -0800 (PST)
Date: Mon, 4 Mar 2024 11:45:46 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Linux ARM"
 <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org, "Maxime
 Ripard" <mripard@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, "Ard Biesheuvel" <ardb@kernel.org>
Subject: Re: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
Message-ID: <20240304114546.4e8e1e32@donnerap.manchester.arm.com>
In-Reply-To: <1baf9a7f-b0e4-45d8-ac57-0727a213d82d@app.fastmail.com>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304112441.707ded23@donnerap.manchester.arm.com>
 <1baf9a7f-b0e4-45d8-ac57-0727a213d82d@app.fastmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 04 Mar 2024 12:26:46 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Mon, Mar 4, 2024, at 12:24, Andre Przywara wrote:
> > On Mon, 04 Mar 2024 12:11:36 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:  
> >>
> >> This used to be a 32-bit division. If the rate is never more than
> >> 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> >> the expensive div_u64().  
> >
> > Wouldn't "div_u64(clock, 200)" solve this problem?  
> 
> Yes, that's why I mentioned it as the worse of the two obvious
> solutions. ;-)

Argh, should have cleaned my glasses first ;-)

I guess I was put somehow put off by the word "expensive". While it's
admittedly not trivial, I wonder if we care about the (hidden) complexity
of that function? I mean it's neither core code nor something called
frequently?
I don't think we have any clock exceeding 3GHz at the moment, but it
sounds fishy to rely on that.

Cheers,
Andre
