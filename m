Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC034D405
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9676E483;
	Mon, 29 Mar 2021 15:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6591F6E483
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:36:46 +0000 (UTC)
Date: Mon, 29 Mar 2021 15:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617032204;
 bh=rqe9EJEDo6OVkZ/VB+6sIQKNjLvmWP/qQQn0EH+cucE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=HpGWtcbSc1BRR8C//YNHRfRX94i3nWsb+pdd14v2BmpPVcvRhqxYDP65AyfHLnKBx
 XK25WeJ9dMffhERinc9teknCpK13ACInH5U3ioLVaZYq/382YcQL+NgpbJ7CuiZS9D
 l9GStvSS6LFR40V0tBF9/4vQST+o2u0wEAbj0bEbP197GtioRyahLzh5sn1mwWFSto
 WZ2Zw3bg5NhoBydcrl7qRc/Pr+PP2nniZGuVzjF/rDIplNm/gkalM7ynbXNfkWIRtU
 g0vavMPE3d9XV44tE1OrBuEeqFNrG2nKO1b4hPD8kyui51GNCIqEIrZLxmVQk2tRXE
 Ma+1ySXRmzdIQ==
To: Paul Cercueil <paul@crapouillou.net>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
Message-ID: <f_BApfXCctltkOAAKup7ZXRsq8N81SZgbxIEFbHWzeoKZCo8z169Bkk4DDwk9WmMNKXpyxaMQCxbWzwVMgfNav0ZYVf3s_6bXRO89LKD_AM=@emersion.fr>
In-Reply-To: <TTLQQQ.OCR65URAWJVQ2@crapouillou.net>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <20210329140731.tvkfxic4fu47v3rz@gilmour>
 <BoDZUOZSsZmHjkYkjHPb18dMl_t_U8ldrh8jZezjkA6a2O-IBkPGaER4wxZ2KlqRYuXlWM8xZwPnvweWEAATzoX-yuBJnBzjGKD3oXNfh5Y=@emersion.fr>
 <TTLQQQ.OCR65URAWJVQ2@crapouillou.net>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, od@zcrc.me,
 Maxime Ripard <maxime@cerno.tech>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, March 29th, 2021 at 5:32 PM, Paul Cercueil <paul@crapouillou.net> wrote:

> Making the second plane an overlay would break the ABI, which is never
> something I'm happy to do; but I'd prefer to do it now than later.

Yeah, I wonder if some user-space depends on this behavior somehow?

> I still have concerns about the user-space being "clever" enough to
> know it can disable the primary plane. Can e.g. wlroots handle that?

wlroots will always pick the first primary plane, and will never use
overlays. The plan is to use libliftoff [1] to make use of overlay
planes. libliftoff should already support the scenario you describe.

I think Weston supports that too.

[1]: https://github.com/emersion/libliftoff
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
