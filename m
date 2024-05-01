Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC218B8BD9
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 16:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288501122AD;
	Wed,  1 May 2024 14:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.b="m0kGQ34T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Wed, 01 May 2024 14:26:54 UTC
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C481122AD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=zJzS+8XGm8C4eeKbbvynEhybHsCB9GY4MtQsheFW4g8=;
 b=m0kGQ34TqXJluxRVGGNrLA09V6Txt+Z9ku33c1j23Q36O/8vdp6BLV9y
 ExfPtsxkkKdiQ6xw9uzfJA0Yb37xhPCWtQDS6YVdQM0CugOOM3qCmngJn
 jOefRpTslor9tZeeajd/64gCoIZ9w3AWnWVoHcZLUyw7UHMLvz+7j/Ejt A=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,245,1708383600"; d="scan'208";a="86154178"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 16:19:43 +0200
Date: Wed, 1 May 2024 16:19:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Daniel Thompson <daniel.thompson@linaro.org>
cc: R Sundar <prosunofficial@gmail.com>, Lee Jones <lee@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 javier.carrasco.cruz@gmail.com, Julia Lawall <julia.lawall@inria.fr>, 
 Shresth Prasad <shresthprasad7@gmail.com>
Subject: Re: [PATCH] backlight: sky81452-backlight: replace of_node_put with
 __free
In-Reply-To: <20240501140144.GA10180@aspen.lan>
Message-ID: <alpine.DEB.2.22.394.2405011618351.3278@hadrien>
References: <20240501125146.33648-1-prosunofficial@gmail.com>
 <20240501140144.GA10180@aspen.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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



On Wed, 1 May 2024, Daniel Thompson wrote:

> On Wed, May 01, 2024 at 06:21:46PM +0530, R Sundar wrote:
> > Use the new cleanup magic to replace of_node_put() with
> > __free(device_node) marking to auto release when they get out of scope.
> >
> > Suggested-by: Julia Lawall <julia.lawall@inria.fr>
> > Signed-off-by: R Sundar <prosunofficial@gmail.com>
>
> Thanks for the patch but I think this one is a more appropriate
> solution to this issue:
> https://lore.kernel.org/all/20240421104916.312588-2-shresthprasad7@gmail.com/

Maybe neither one is perfect?  The one I see at that link has:

 	if (!pdata) {
-		of_node_put(np);
 		return ERR_PTR(-ENOMEM);
 	}

which has unneeded {}

julia


>
>
> Daniel.
>
