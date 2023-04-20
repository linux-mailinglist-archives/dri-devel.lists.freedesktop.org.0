Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CE6E9919
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 18:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0904E10E09E;
	Thu, 20 Apr 2023 16:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B186B10E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 16:05:29 +0000 (UTC)
Received: from mail.panix.com (localhost [127.0.0.1])
 by mailbackend.panix.com (Postfix) with ESMTPA id 4Q2MvD2jWzz4Fxv;
 Thu, 20 Apr 2023 12:05:28 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
 t=1682006728; bh=EKV0LEfOfid5iH2xb19C4EKN8EQAQyvXH2/h/3MLTF4=;
 h=In-Reply-To:References:Date:Subject:From:To:Cc;
 b=i+IL9/4WQSGafLFxLiTR2M+bo95QoJhM4Og4otnXuaWjJWZfbU++6l6QUh75Gdq4B
 XD7IS0GIbVOPwSUfitDzrX5u7kofffpXjEyXgLqQJeNHI6TbajyER09A8DHCH5lg56
 KtvmHfvkUvtEPvk2DdAxXFxhyB+CFAunSTJxCC5I=
X-Panix-Received: from 166.84.1.2
 (SquirrelMail authenticated user pa@panix.com)
 by mail.panix.com with HTTP; Thu, 20 Apr 2023 12:05:28 -0400
Message-ID: <29c370c79a9775398bcd0f111196f677.squirrel@mail.panix.com>
In-Reply-To: <20230420155705.21463-1-pa@panix.com>
References: <20230420155705.21463-1-pa@panix.com>
Date: Thu, 20 Apr 2023 12:05:28 -0400
Subject: Re: [PATCH v3] firmware/sysfb: Fix VESA format selection
From: "Pierre Asselin" <pa@panix.com>
To: "Pierre Asselin" <pa@panix.com>
User-Agent: SquirrelMail/1.4.23-p1
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
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
Cc: Pierre Asselin <pa@panix.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I went back to nested max3() after all as Thomas asked.  My first cut
had casts in the innermost max3() and the code looked truly awful.  I
decided that two casts are tolerable.  I added a comment to explain
the casts.

Against clamp_t(u8,lfb_depth,1,32): the clamp_t() macro does no
typechecking;  might as well just cast lfb_depth to u8, but that assumes
the value would fit (positively crazy if it doesn't, but still.)
Instead, I widen the other two args of the outer max3().

--PA

