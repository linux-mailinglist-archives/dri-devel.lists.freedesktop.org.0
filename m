Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700AB376623
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 15:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06D6E079;
	Fri,  7 May 2021 13:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5F36E079
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 13:26:42 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CDA3EF;
 Fri,  7 May 2021 15:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1620394000;
 bh=Y4ZVCz504AX3zFCTILayJKZwb9oWengQbtFqgQe03Ks=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g4cMR6R+Vzrds2ZDhFTz8PI5fkdtNX98/tJzBPmCIAECKyDC3Pulm6aWC6aZ5M+Ze
 Y/Uaj0Zehit+f1HZn9nFk7DmxYIG2E4tFqQB7+YP+tDSGHc5WlRx4IisQhzSdcwbdh
 q185JnEk+E54ws9an2BIWpA+B50D296UqUbTJnUQ=
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
To: Tony Lindgren <tony@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com> <YIo6CzsU4JRvAdpb@atomide.com>
 <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
 <YI/UXqQbvdtC2HqI@atomide.com> <YI/bdLkwtUNFKHyW@atomide.com>
 <YI/p9Trr5tphov6q@atomide.com> <YJJ9twsxdw2Mi0F6@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e2181257-4714-e306-1ba8-6b8c9d09807c@ideasonboard.com>
Date: Fri, 7 May 2021 16:26:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJJ9twsxdw2Mi0F6@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-omap@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2021 14:12, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [210503 12:18]:
>> I think we still fix the dispc related issue too, otherwise the parent
>> child_count will just keep increasing on each suspend. I check that
>> again though.
> 
> After tons more debugging, I found the root cause for the parent child_count
> increasing and posted a patch for it at [0] below.
> 
> This means the $subject patch here can be done later on as clean-up to
> leave out lots of unnecessary PM runtime calls and simplify the system
> suspend :)

Great work, thanks! It's always nice when someone else does the tons of 
debugging ;).

I tested the patch you sent, works fine for me.

While testing I noticed another problem, which happens also without your 
fix: go to suspend with HDMI connected, remove the cable, resume the 
board -> boom. I didn't debug that yet.

  Tomi
