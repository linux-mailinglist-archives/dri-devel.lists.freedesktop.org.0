Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDF8708F2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 19:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAC9112413;
	Mon,  4 Mar 2024 18:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="UijKYUII";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="LONYJcWf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4EF11240B;
 Mon,  4 Mar 2024 18:01:31 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 75BD811400A5;
 Mon,  4 Mar 2024 12:54:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 04 Mar 2024 12:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1709574886; x=1709661286; bh=SPcmanJw9a
 ZzYzBS08sp4txIx1ZQ+vV0dQEw8ThQ9mQ=; b=UijKYUII8e8JZaOKGvse7Dq+Xx
 scMykYwcSm8LYhuZh3BbDrPGBIvjoV2YodfDbBoA3zDG6iMgQjND77Jy8q8Dlvkk
 CFYiIIuEM0znzfRJ7xzBqzuf1nIyqYF8tvVaFDakeaynLUZc7UMFRc2Dv4GWda47
 eb3dh9XqLZdD2N8DpnN4ERCYyvAIe3/X0lTXofXjIrMARNaOWkn+sbkC5PkHZit8
 47pwoCd39iKA4DcomuzDEBzFWylx2zWMYDeKXEowv71FGAZ301Jm/x2sTaFN4/KV
 SY7sXCt7f7s2MoqahgPbUCsXhx1e/ZvbTFZW1tpVClN4FjjdVSyIiNS6QmDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709574886; x=1709661286; bh=SPcmanJw9aZzYzBS08sp4txIx1ZQ
 +vV0dQEw8ThQ9mQ=; b=LONYJcWf4zNMDllQ+Wrbrxew6Yd17x/fhtETUPfmUsyx
 /vXRgQ2UWMVLp/18AJb0bw9hsAcgoX8hRoUrhl6H6dG4JbcNO+8rcEol9hnDdpoL
 /5m9TL4KnNEEIiWUCI4R4AzRcKK6vbjbL1bjNGTXSiOTPaY3CA/R8lbzqtoOnLlb
 VcUNd0cQYxHMJopb053LjhiuueCMb/mi04813wi5yNr6F3JFo8sHCW2/OpMaj7UG
 1FkY/JeB0FCNlyQ1Degs+m7FVaJ8viZ2R/QjsdPBH+oXDTehggUIlKwvvJvwF80I
 Y+WPYnFm/rZp6qjtjfqPOznkXqtiA5D5iV1EDE2BaA==
X-ME-Sender: <xms:5grmZaSHD0nmrTa97QZM_3V5X6-jqGG5V8BYRmfGlWP-0bevPvObVA>
 <xme:5grmZfw0oJqYo5jpfzn28sBvb2Vfc-Mhz-fIAVaitnNSvMpdg_bzY21pSvntrx2Co
 nNgAL8B0L9dzQ>
X-ME-Received: <xmr:5grmZX1PgR2W9hXyQy-A461PeyLSMULMJtBTh8LBVSqHivdZokeLlmyWaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheejgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:5grmZWCSmK-_BTPVOQ2K6twhJN9WPVLJnQwH1bphxS3_paGap6rWNw>
 <xmx:5grmZThXPET9z3bpygZPvO3vOWmmSrkOH2lV6xo11Zku8UQed2JQ1g>
 <xmx:5grmZSoPlLxzAj-bEp5_qtiTugf1mDmcXGxMW8h2_BST04KfB9nTdg>
 <xmx:5grmZcYsQWcD9amB5TplbGFuUKpJ-9DJ0tAFaDNpXtf21qM1H37Q4g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Mar 2024 12:54:45 -0500 (EST)
Date: Mon, 4 Mar 2024 18:54:43 +0100
From: Greg KH <greg@kroah.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: stable@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH stable v6.7] drm/nouveau: don't fini scheduler before
 entity flush
Message-ID: <2024030436-console-enlisted-07d2@gregkh>
References: <20240304170158.4206-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304170158.4206-1-dakr@redhat.com>
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

On Mon, Mar 04, 2024 at 06:01:46PM +0100, Danilo Krummrich wrote:
> This bug is present in v6.7 only, since the scheduler design has been
> re-worked in v6.8.

Now queued up, thanks.

greg k-h
