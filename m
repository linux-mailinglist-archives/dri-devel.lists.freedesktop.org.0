Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB186A2C8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 23:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A7710E9A9;
	Tue, 27 Feb 2024 22:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EpZfZxfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8162 seconds by postgrey-1.36 at gabe;
 Tue, 27 Feb 2024 22:48:53 UTC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82A10E9A9;
 Tue, 27 Feb 2024 22:48:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23256E0003;
 Tue, 27 Feb 2024 22:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709074131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QzbrrxNlmtkyJPkPXOAQ3Vi2FcRLI5aLxFCBrtjaL3U=;
 b=EpZfZxfXqbqRaDVjijJHQoInyGWg+vri8zdceJ4B7N7f34VEuYZP/FYsn7U8EJ1WRLORLy
 A6BlkTa3RGWIiiPEhqe5pYJv3JBtDp8sjryUNnUJF7RDlVq0i1qNkPhfOBnwjV6/28OYTZ
 jeX0u3rrPUBJNdNv/dwo4aLzVvVH8QBnVgGivZfKJpgxkJ+/VPcQMPKxVxR0r5h1M1RzUG
 BQFSQITGA1qlokbIRX/3D/QspUn6W8VKR7RqnibcQq1PKBDohw3KSTnN31wdYzJA+gHjiN
 lcQlHS7S0xYfHc9BkYp9sX2cl1K024Ju+BGDQorum+y1UeQ4xrPoVm6VkkZNXA==
Date: Tue, 27 Feb 2024 23:48:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 5/9] rtc: test: Fix invalid format specifier.
Message-ID: <20240227224846c7846f20@mail.local>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-6-davidgow@google.com>
 <20240227203243070e7d85@mail.local>
 <56680d34-59f1-460c-a835-f1258abf4569@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56680d34-59f1-460c-a835-f1258abf4569@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
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

On 27/02/2024 14:23:29-0700, Shuah Khan wrote:
> On 2/27/24 13:32, Alexandre Belloni wrote:
> > Hello,
> > 
> > On 21/02/2024 17:27:18+0800, David Gow wrote:
> > > 'days' is a s64 (from div_s64), and so should use a %lld specifier.
> > > 
> > > This was found by extending KUnit's assertion macros to use gcc's
> > > __printf attribute.
> > > 
> > > Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
> > > Signed-off-by: David Gow <davidgow@google.com>
> > 
> > Who do you expect to take this patch?
> > 
> 
> I am going to be applying this series to linux-kselftest kunit next
> in just a bit. Would you like to ack the pacth?

Sure,

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> 
> thanks,
> -- Shuah
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
