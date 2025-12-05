Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DF8CAA3C1
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 11:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FB210E2C5;
	Sat,  6 Dec 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="rFotA6TW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCE410EB4D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:From:Subject:Cc:To:Message-Id:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ggheo0ikq2ZLYGvBXsuDD5zw1LIGJjvi4UBonIV99kU=; b=rFotA6TW7WoQcvq7vH6xJkWSVZ
 vwnbpO2oj31nG/ynR855lG+UyM9M3d1XxCub6ixSSRD39BXIyJu+nv6opai+Ff2s9XC/K5lTJSdqy
 6oLBngRD4ftYYUj/4yBZPZai8FdfVD05j8K5qNQ47SCKLlQpVuNEsgkoCxFu8YK/TM+xAOvGXO8vM
 vDOpY7Qsip/3iWWMY8RyUaytN/qVk5jPN8H9g56eWEkHorSqvahgIZwuc38jeRWTWB0xTbUww/C0Z
 ChELcMZhlGJdxTYtKrJbv0sATTtRwgGJybx8YFmYiFfxLF0sah08BLgL+8pxuvWrUAXF7I1C822AI
 zEvi8v5A==;
Date: Fri, 05 Dec 2025 16:14:59 +0100 (CET)
Message-Id: <20251205.161459.1654100040521559754.rene@exactco.de>
To: tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@redhat.com, Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH] drm/ast: Fix big-endian support
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
In-Reply-To: <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
References: <20251202.170626.2134482663677806825.rene@exactco.de>
 <e0f4a33f-9d36-4b7b-a1f8-1acc7434969c@suse.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Dec 2025 10:07:49 +0000
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

Hello Thomas,

On Wed, 3 Dec 2025 10:40:17 +0100, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> [2]
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-12-01-1/drivers/gpu/drm/ast/ast_mode.c?ref_type=tags#L559
> [3]
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-12-01-1/drivers/gpu/drm/ast/ast_cursor.c?ref_type=tags#L209
> 
> > +	case DRM_FORMAT_RGB565:
> > + ast_set_index_reg_mask(ast, AST_IO_VGACRI, AST_IO_VGACRA2, 0x3f,
> > 0x40);
> > +		break;
> > +	case DRM_FORMAT_XRGB8888

While working on it I discovered that the Big-Endian byte-swapping
bits do apparently not just-work on a newer AST2400 in our Power 8
while my initial patch did work as tested with an AST2200 in the Sun
T4-1 :-/

Maybe that is what Timothy meant with "This is due to a ppc64 hardware
quirk, which when combined with a hardware design fault in the AST2500
VGA controller results in a need to use software-based red-blue
channel swapping." [1]

Is there a way to simply specify the frame-buffer as BGRX8888? In a
quick test the drm layer complaint about "not supported" and "no
compatible format found"?

Thanks,
	René

[1] https://lore.kernel.org/dri-devel/407388289.1798972.1760725035958.JavaMail.zimbra@raptorengineeringinc.com/

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
