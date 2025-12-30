Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D98ECEAD9F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 00:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9342A10E0B7;
	Tue, 30 Dec 2025 23:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Wa226bn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB10510E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 23:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
 Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
 References; bh=rkYEIdat85qyx72JG9RDCYxdwTBwQbQUb/q775rwPoQ=; t=1767136753;
 x=1767741553; b=Wa226bn4WVaynD+sH3qMr3Z1JnMyNXhZs77PlF3kisfi0iO1NukRAy+xWc/Xm
 neulr+/S925Yid+XLAQkvZ2LWnPP1OXtElBcaB5aEElq/x49wbXclgFnit5Lx0VyOc7WWtpJ0MsUE
 w9HscJ5VU16YMzX06ri0wrnVu0I+p/IbyK8/CAkbwBzjWQywDN8dFzFAr1gaFpvp3UzRPJrzpelUP
 ApA1J+22NjhukHnnaDJTcbAmUA9M7kJQfnh/z1C1kl5SzZ/Vfqu1RbY5CamzeHT8HunxLnThp8Tq5
 jO6IYGwk3uKH0/9WrWmR3gSWenc4Uc3PYLk6H4r7X+62XN7gUw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.99) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1vaize-00000002bJi-0GXQ; Wed, 31 Dec 2025 00:19:10 +0100
Received: from dynamic-093-128-019-094.93.128.pool.telefonica.de
 ([93.128.19.94] helo=[192.168.178.50])
 by inpost2.zedat.fu-berlin.de (Exim 4.99) with esmtpsa (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1vaizd-00000002yoB-3X8A; Wed, 31 Dec 2025 00:19:09 +0100
Message-ID: <12a2ee5ca1a085fe0bd0c1b2d6e08589445cbf66.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/6] video/logo: allow custom boot logo and simplify logic
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Vincent Mailhol <mailhol@kernel.org>, Helge Deller <deller@gmx.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker	 <dalias@libc.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Date: Wed, 31 Dec 2025 00:19:08 +0100
In-Reply-To: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
References: <20251230-custom-logo-v1-0-4736374569ee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 93.128.19.94
X-ZEDAT-Hint: PO
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

Hi Vincent,

On Tue, 2025-12-30 at 23:19 +0100, Vincent Mailhol wrote:
> This series allows the user to replace the default kernel boot logo by
> a custom one directly in the kernel configuration. This makes it
> easier to customise the boot logo without the need to modify the
> sources and allows such customisation to remain persistent after
> applying the configuration to another version of the kernel.

Wouldn't it make more sense to make the boot logo to be configurable
at runtime so that users don't have to rebuild their kernel at all
to change their boot logo?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
