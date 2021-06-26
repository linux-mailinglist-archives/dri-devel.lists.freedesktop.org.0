Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AEA3B5977
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81346E1D8;
	Mon, 28 Jun 2021 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Sat, 26 Jun 2021 23:30:31 UTC
Received: from fgw20-4.mail.saunalahti.fi (fgw20-4.mail.saunalahti.fi
 [62.142.5.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836346E11C
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 23:30:31 +0000 (UTC)
Received: from macbook.musicnaut.iki.fi (85-76-11-157-nat.elisa-mobile.fi
 [85.76.11.157]) by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 3ec9cd77-d6d4-11eb-ba24-005056bd6ce9;
 Sun, 27 Jun 2021 02:14:25 +0300 (EEST)
Date: Sun, 27 Jun 2021 02:14:23 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Message-ID: <20210626231423.GA38365@macbook.musicnaut.iki.fi>
References: <20210625223323.13930-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625223323.13930-1-paskripkin@gmail.com>
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:06:06 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 26, 2021 at 01:33:23AM +0300, Pavel Skripkin wrote:
> In case of allocation failures, all code paths was jumping
> to this code:
> 
> err:
> 	kfree(fbi);
> 	kfree(var);
> 	kfree(fbops);
> 
> 	return r;
> 
> Since all 3 pointers placed on stack and don't initialized, they
> will be filled with some random values, which leads to
> deferencing random pointers in kfree(). Fix it by rewriting
> error handling path.

They are initialized before the first goto:

[...]
	fbi = NULL;
	var = NULL;
	fbops = NULL;

	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
	if (fbi == NULL) {
		r = -ENOMEM;
		goto err;
	}
[...]

A.
