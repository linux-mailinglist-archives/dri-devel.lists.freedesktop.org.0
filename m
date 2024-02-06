Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2784B374
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 12:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB26112AA9;
	Tue,  6 Feb 2024 11:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EsryKiel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31611112AA9;
 Tue,  6 Feb 2024 11:29:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AC961CE1305;
 Tue,  6 Feb 2024 11:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18D0C433C7;
 Tue,  6 Feb 2024 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707218942;
 bh=xItSGKOsHY3nXC2qGy9xvtt+bnUbZopMnd876K04tjk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EsryKielTwcYBcVxuAxMAD0zvVmbPIbLkTrIBNpyeEXJDILMUGxe5VwThjhAPGnyO
 rLKJuiVoAMk877bcSrF8uDICB52XvtgnldywkMDYIUPLZfloZfAi3SBNlqPkVA5eMU
 rtW7cjWZGmSUlCxcZT3OUAe1pwiQ1NEcz1OoSMpGOOP/MQVUe9ovK2gd20aO9bMxUc
 7F6rVhcCMrxY0Lj0hbNT1tJTo6qegUW6e2CN95Dy8UeQd1tfvVavKRMi3A2Rafq7dY
 lxatORJk8dJTp3fusXqMAzr6uJHu5gTp95RSwtKKAotz7xRo64bafcCmGPZI/JkC+R
 4KjRAVWhH6ezw==
MIME-Version: 1.0
Date: Tue, 06 Feb 2024 12:28:58 +0100
From: Michael Walle <mwalle@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Trimarchi
 <michael@amarulasolutions.com>, Robert Foss <rfoss@kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
In-Reply-To: <20240206120643.1d30764c@canb.auug.org.au>
References: <20240206115956.4570e9b1@canb.auug.org.au>
 <20240206120643.1d30764c@canb.auug.org.au>
Message-ID: <fe0b21360178348543e662e9d620af9c@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

Hi Stephen and all,

>> Today's linux-next merge of the drm-misc tree got a conflict in:
>> 
>>   drivers/gpu/drm/bridge/samsung-dsim.c
>> 
>> between commit:
>> 
>>   ff3d5d04db07 ("drm: bridge: samsung-dsim: Don't use 
>> FORCE_STOP_STATE")
>> 
>> from Linus' tree and commit:
>> 
>>   b2fe2292624a ("drm: bridge: samsung-dsim: enter display mode in the 
>> enable() callback")
>> 
>> from the drm-misc tree.
>> 
>> I fixed it up (see below, please check) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but 
>> any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to 
>> consider
>> cooperating with the maintainer of the conflicting tree to minimise 
>> any
>> particularly complex conflicts.
> 
> I changed my mind and just used the latter version of this file.

Bug wise, this is the wrong solution. Because it will reintroduce the
faulty FORCE_STOP_STATE. Also keep in mind, my fixes commit is/was 
already
backported to the stable series.

See also the discussion at [1]. Unfortunately, there was no conculusion 
yet.
I think [2] is the proper resolution, at least for the commit 
b2fe2292624a
("drm: bridge: samsung-dsim: enter display mode in the enable() 
callback")
I'm not sure in what state the drm-misc tree is.

-michael

[1] 
https://lore.kernel.org/dri-devel/CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com/
[2] 
https://lore.kernel.org/dri-devel/31e1a38a1d012a32d6f7bc8372b6360e@kernel.org/
