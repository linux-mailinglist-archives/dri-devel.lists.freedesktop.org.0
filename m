Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076B88D378
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 01:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D1610E162;
	Wed, 27 Mar 2024 00:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UezsQDLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF4E89ABE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 00:47:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AF485CE2381;
 Wed, 27 Mar 2024 00:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EB0C433C7;
 Wed, 27 Mar 2024 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711500435;
 bh=2q5crH4HwBtEVMAdw9c1ugeNy2Oyqk30hp+EirVO3q0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UezsQDLgF9nL66A4jsvBTDD2EOr0eqDdVGhmNGprFvTwmA1eJHgPOWS9WJ7ECimcd
 RDE0aan9K8Zg8d9M25lbWh96ZCpZ7y0mP+R19goxTSdH2JUd8JcPPdRW83X8rI6QM8
 MJUThd//pIxYMao207aSg2QzHNfqWYJLPbB+dCwBN2EVPijRRPNUhHocfcqdZVwTSk
 P3meIA4B8q4n+12qJIk0cKVZsdNFWx3sQ+EkouWPRC+ZdDc/jHiwushF/bhTIdgyqo
 iwYU8SW6CRg3wKHM6DqpqtfSkZUOfF7qjVM0qmdXWxlmO2PGuFkWXuQEEE+muZ3xGT
 sSHlZk7LNCyaw==
Date: Tue, 26 Mar 2024 17:47:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Ariel Elior
 <aelior@marvell.com>, Manish Chopra <manishc@marvell.com>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>,
 Hannes Reinecke <hare@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Helge Deller <deller@gmx.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] enabled -Wformat-truncation for clang
Message-ID: <20240326174713.49f3a9ce@kernel.org>
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
References: <20240326223825.4084412-1-arnd@kernel.org>
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

On Tue, 26 Mar 2024 23:37:59 +0100 Arnd Bergmann wrote:
> I hope that the patches can get picked up by platform maintainers
> directly, so the final patch can go in later on.

platform == subsystem? :)
