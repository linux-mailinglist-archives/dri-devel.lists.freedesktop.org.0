Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B591A593
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 13:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B9B10E1CE;
	Thu, 27 Jun 2024 11:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="c0zN5d+z";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="oaWRz6rB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com
 [103.168.172.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6507810E1AE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:44:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailflow.nyi.internal (Postfix) with ESMTP id 595F72001CD;
 Thu, 27 Jun 2024 07:44:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Jun 2024 07:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1719488683;
 x=1719495883; bh=9gyG7wlh1QIEKIg/21vyG7suAQH24Dus6aNn+hOYVKQ=; b=
 c0zN5d+z41HjhLHCz3GMS1+j0P3dLOpI4X0+ceFBjKPmHQ+13zaSe3A8q/Nk31+V
 kXJY4Tuh5SsqZdflY1R9uf7LvRwWDShRG0WuA2vmZKx01m7ZjPYPKg9LT3BdJzlf
 GpJLQa8jz50AHhL47EewIftyhztxwZFpt01J2MYsY+yocKj5R7qwrPy67VKEAXTE
 nf1lR204RyvLcOKcqT3+Lom5BppR8euQMR7LT6VH6U9Odfy0CfEfwoePVplfnYtt
 0EgeggADlwG9NTPgK32WEV16BiciO+oECRs1+bhAtt1avUAZAfZ2HHKhZwyBu/sU
 o7e5mqIXwst/Q1Huq21Mgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719488683; x=
 1719495883; bh=9gyG7wlh1QIEKIg/21vyG7suAQH24Dus6aNn+hOYVKQ=; b=o
 aWRz6rBl7EGWhipAHW+lA9o3LGvqgCVuFhfhXgn79PPqBak/JNZRqicZHPHvv4N/
 DtvY99yRSkE1PRtL3PHz0/WyekR+COZ9vBlOX/mbdhSi3/utq4EWZybxhzCAuWCZ
 N0AjiZqhJ/3e+cbALsA6X1nf+MMLMaTDxByR2pm0s55baSQwMTE6EBoEHtSdGibc
 fLbzFrJ3eetyVLpMUSuf1hS9eS7JUQmjlRwSNb+RQjEC/7inuRJvA6O6Pszq3HS0
 dPQ/YJy/vv5TgHMDktbqlN1Hr5X2eBKNGiFx8tqRGi4LqsJ0Ll2aJD8SHB2Zn2RQ
 OiGxBpK4Ncek5zuEOzEfQ==
X-ME-Sender: <xms:qlB9ZgBdCSKDTxjvmcDSlRzwl_9Yu9mlqeq7VnmKz-thf3JuDpWeTQ>
 <xme:qlB9Zii1gOs3JWgPenYHxj7hDI9usHN5aurjMTTdGVMhoqWdRLd5WSeSG4xxmYhnJ
 jpK89VQ66sw5A>
X-ME-Received: <xmr:qlB9Zjlqz5Ac79XXWqSq7DO6O_fX-F8o4fM6aXRy9XFdNoPCYlGrat55twI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdeggdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepgfekff
 eifeeiveekleetjedvtedvtdeludfgvdfhteejjeeiudeltdefffefvdeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:qlB9ZmzcLqEahwr1ZbRC5tq9LdUPgPwk0xFdD7O7XG3NXIW_pXn5Ew>
 <xmx:qlB9ZlSm0NIXE5e_BYzyfwzLpUQI4A2eHiw55yEJd7ZC5k3rQzRC8g>
 <xmx:qlB9ZhbmnOZV6XAQSvNswxxCu2HTNJwvKGWQ_skDyUjTazx8ID_msQ>
 <xmx:qlB9ZuRMa8rSuMX35sUcagpVRIFHxdKIfUUuZkjltL9eoAu_sMjZ_A>
 <xmx:q1B9ZhIxZbaPOdGXA0xz68p0gLtDcgQn20N-yvK-JUSMZoHjA8mxmhAK>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jun 2024 07:44:41 -0400 (EDT)
Date: Thu, 27 Jun 2024 13:44:39 +0200
From: Greg KH <greg@kroah.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2] drm/gma500: fix null pointer dereference in
 cdv_intel_lvds_get_modes
Message-ID: <2024062731-left-cackle-4fc4@gregkh>
References: <20240627063220.3013568-1-make24@iscas.ac.cn>
 <eb14ae3b-7a4f-4802-b9a7-9ffec3b951f9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb14ae3b-7a4f-4802-b9a7-9ffec3b951f9@web.de>
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

On Thu, Jun 27, 2024 at 01:33:40PM +0200, Markus Elfring wrote:
> > In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
> > is assigned to mode, which will lead to a NULL pointer dereference on
> > failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> A) Can a wording approach (like the following) be a better change description?
> 
>    A null pointer is stored in the local variable “mode” after a call
>    of the function “drm_mode_duplicate” failed. This pointer was passed to
>    a subsequent call of the function “drm_mode_probed_add” where an undesirable
>    dereference will be performed then.
>    Thus add a corresponding return value check.
> 
> 
> B) Would you like to append parentheses to the function name
>    in the summary phrase?
> 
> 
> C) How do you think about to put similar results from static source code
>    analyses into corresponding patch series?
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
