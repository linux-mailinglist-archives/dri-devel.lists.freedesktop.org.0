Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9742A6B41
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 18:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3502E6E152;
	Wed,  4 Nov 2020 17:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5348984E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 17:00:17 +0000 (UTC)
Date: Wed, 04 Nov 2020 17:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1604509214;
 bh=8Y6IOQF8x9TD8K60g9sGIFUH2y7pNsmE5Vb3F55yZmY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=fWAiLRzrBTBMkBZAIQ6TfIOBAvcmuMbtGtwQUI+wD7nAuozg0pFjFkF/wpSJcEO7z
 tkl4fEZR3JBWZR+6IpbDdKf27+OxtU6h9OonLAb9jtJxxwE/VK13i/mvFG+qqK7a+1
 oKoGrFIsUVSTtdLUDeanaF5uOg7e1/mvCElbsumh0+lDT4DRCsBC2JQqNdh18Zt17i
 eUp+xpRWfqo0ESkS7sCmgEdbpWtt5WnVz2h5nEaiH46xTuKKPz4vGoE8vTmij3zgu0
 yS7IEXwEwCv2QfJ6ySinN4eesHFR1IjI5GMh+9ZpZ8QPk1LivbQO+wHAjr3b9sCi3a
 kSDkvDRQZbI2g==
To: Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document that blobs are ref'counted
Message-ID: <8qD21GTemX83u27d3yFWMmHvAL2uGgX_u2aWHHTMc7asFmEpZVRNwL1e9c9Bd3tkY_QZIm2D_21bdkBYxY-GouVreUeG0bNlZKhZa0yKXqg=@emersion.fr>
In-Reply-To: <CAPj87rNaL8Uu+=QVwQRRpS3r1LL1sPsQZpgpowm-HZ3Z=hMYLQ@mail.gmail.com>
References: <HNBtgIoryEkrMD_i_O5qy-HyxoyMYWSziPwHQQn9LYoOL8Ds5o7gvqMqz-Y0v7GZDqcYzBLC3d3KPfO37nRCl1doMWeQjKyHYv_pYFxYZ24=@emersion.fr>
 <qhVMa7YWDnEiufs2_tBn6d3idpWpj2A5cqvDHL94SdZeGfVsdZCdlKlKGKRN0MfJDGZ4PJthZ86C1Xqncp7jcdiEq2eKVMLFIm1uAKRDEkA=@emersion.fr>
 <CAPj87rNaL8Uu+=QVwQRRpS3r1LL1sPsQZpgpowm-HZ3Z=hMYLQ@mail.gmail.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, November 1, 2020 10:07 PM, Daniel Stone <daniel@fooishbar.org> wrote:

> > Daniel, does this patch look good to you?
>
> Unsure which Daniel you meant

I was thinking of Daniel Vetter :P

> but I would probably instead say:
> 'Userspace can release blobs as soon as they do not need to refer to
> them by their blob object ID. For instance, if you are using a MODE_ID
> blob in an atomic commit and you will not make another commit reusing
> the same ID, you can destroy the blob as soon as the commit has been
> issued, without waiting for it to complete.'

But thanks! That sounds much better and avoids using the term
"reference counting" (which is nice because it's an internal detail).

Sending a v2 now.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
