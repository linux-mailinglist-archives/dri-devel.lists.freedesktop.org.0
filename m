Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4213F1BC8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 16:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2766E839;
	Thu, 19 Aug 2021 14:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0150.hostedemail.com
 [216.40.44.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F106E839
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 14:40:45 +0000 (UTC)
Received: from omf05.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 5F491837F253;
 Thu, 19 Aug 2021 14:40:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf05.hostedemail.com (Postfix) with ESMTPA id 838CBB2793; 
 Thu, 19 Aug 2021 14:40:42 +0000 (UTC)
Message-ID: <3da667b1b415b19325c034dcb389a201fa46cfd3.camel@perches.com>
Subject: Re: [PATCH] drm/bridge/tc358767: make the array ext_div static
 const, makes object smaller
From: Joe Perches <joe@perches.com>
To: Colin Ian King <colin.king@canonical.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 19 Aug 2021 07:40:41 -0700
In-Reply-To: <913b96bc-f5c4-1a26-c5f7-70a9d0ab3f53@canonical.com>
References: <20210819133839.10745-1-colin.king@canonical.com>
 <0a2ea4e54d7bfd61b45cc070eee6b62e8da82190.camel@perches.com>
 <913b96bc-f5c4-1a26-c5f7-70a9d0ab3f53@canonical.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 838CBB2793
X-Stat-Signature: rpx6ew13rwdwithbhfj8psg5dhhbbzya
X-Spam-Status: No, score=-0.82
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19mint/LKCSMRD/9WFKliNX1OKZZLjKUQE=
X-HE-Tag: 1629384042-183287
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

On Thu, 2021-08-19 at 14:54 +0100, Colin Ian King wrote:
> On 19/08/2021 14:51, Joe Perches wrote:
> > On Thu, 2021-08-19 at 14:38 +0100, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > Don't populate the array ext_div on the stack but instead it
> > > static const. Makes the object code smaller by 118 bytes:
> > > 
> > > Before:
> > >    text    data    bss     dec    hex filename
> > >   39449   17500    128   57077   def5 ./drivers/gpu/drm/bridge/tc358767.o
> > > 
> > > After:
> > >    text    data    bss     dec    hex filename
> > >   39235   17596    128   56959   de7f ./drivers/gpu/drm/bridge/tc358767.o
> > 
> > Why is text smaller and data larger with this change?
> 
> There are less instructions being used with the change since it's not
> shoving the array data onto the stack at run time. Instead the array is
> being stored in the data section and there is less object code required
> to access the data.

Ah.  It's really because it's not a minimal compilation ala defconfig.

I think you should really stop making these size comparisons with
.config uses that are not based on a defconfig as a whole lot of other
things are going on.

Please notice that the object sizes are significantly smaller below:

So with an x86-64 defconfig and this compilation unit enabled with
CONFIG_OF enabled and CONFIG_DRM_TOSHIBA_TC358767=y, with gcc 10.3
and this change the object size actually increases a bit.

$ size drivers/gpu/drm/bridge/tc358767.o*
   text	   data	    bss	    dec	    hex	filename
  13554	    268	      1	  13823	   35ff	drivers/gpu/drm/bridge/tc358767.o.new
  13548	    268	      1	  13817	   35f9	drivers/gpu/drm/bridge/tc358767.o.old

objdump -h shows these differences:

.old:
  0 .text         00001e1f  0000000000000000  0000000000000000  00000040  2**4
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
[...]
 14 .rodata       000005ae  0000000000000000  0000000000000000  000046e0  2**5
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA

.new:
  0 .text         00001e05  0000000000000000  0000000000000000  00000040  2**4
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
[...]
 11 .rodata       000005ce  0000000000000000  0000000000000000  00004600  2**5
                  CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA

cheers, Joe

