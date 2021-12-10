Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5B46FD5E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 10:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B88C10E5A2;
	Fri, 10 Dec 2021 09:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C621710E59F;
 Fri, 10 Dec 2021 09:06:19 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mvbr6-0005NW-Fu; Fri, 10 Dec 2021 10:06:16 +0100
Message-ID: <079d8b88-f3bf-e3ed-677e-8bfdd27b67fb@leemhuis.info>
Date: Fri, 10 Dec 2021 10:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Nouveau] [PATCH] drm/nouveau: wait for the exclusive fence after
 the shared ones v2
Content-Language: de-DE
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dmoulding@me.com, sf@sfritsch.de, bskeggs@redhat.com
References: <20211209102335.18321-1-christian.koenig@amd.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20211209102335.18321-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1639127179;
 38ea121e; 
X-HE-SMSGID: 1mvbr6-0005NW-Fu
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker speaking.

On 09.12.21 11:23, Christian König wrote:
> Always waiting for the exclusive fence resulted on some performance
> regressions. So try to wait for the shared fences first, then the
> exclusive fence should always be signaled already.
> 
> v2: fix incorrectly placed "(", add some comment why we do this.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

FWIW: In case you need to send an improved patch, could you please add
this (see (¹) below for the reasoning):

Link:
https://lore.kernel.org/dri-devel/da142fb9-07d7-24fe-4533-0247b8d16cdd@sfritsch.de/

And if the patch is already good to go: could the subsystem maintainer
please add it when applying? See (¹) for the reasoning.

BTW, these two lines afaics are missing as well:

Fixes: 3e1ad79bf661 ("drm/nouveau: always wait for the exclusive fence")
Reported-by: Stefan Fritsch <sf@sfritsch.de>

Ciao, Thorsten

(¹) Long story: The commit message would benefit from a link to the
regression report, for reasons explained in
Documentation/process/submitting-patches.rst. To quote:

```
If related discussions or any other background information behind the
change can be found on the web, add 'Link:' tags pointing to it. In case
your patch fixes a bug, for example, add a tag with a URL referencing
the report in the mailing list archives or a bug tracker;
```

This concept is old, but the text was reworked recently to make this use
case for the Link: tag clearer. For details see:
https://git.kernel.org/linus/1f57bd42b77c

Yes, that "Link:" is not really crucial; but it's good to have if
someone needs to look into the backstory of this change sometime in the
future. But I care for a different reason. I'm tracking this regression
(and others) with regzbot, my Linux kernel regression tracking bot. This
bot will notice if a patch with a Link: tag to a tracked regression gets
posted and record that, which allowed anyone looking into the regression
to quickly gasp the current status from regzbot's webui
(https://linux-regtracking.leemhuis.info/regzbot ) or its reports. The
bot will also notice if a commit with a Link: tag to a regression report
is applied by Linus and then automatically mark the regression as
resolved then.

IOW: this tag makes my life a regression tracker a lot easier, as I
otherwise have to tell regzbot manually when the fix lands. :-/

#regzbot ^backmonitor:
https://lore.kernel.org/dri-devel/da142fb9-07d7-24fe-4533-0247b8d16cdd@sfritsch.de/
