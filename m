Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B3CB460E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 02:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3211C10E69A;
	Thu, 11 Dec 2025 01:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="NKgOaPAY";
	dkim=pass (1024-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="DzELVdZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 300 seconds by postgrey-1.36 at gabe;
 Wed, 10 Dec 2025 12:41:34 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ED410E108;
 Wed, 10 Dec 2025 12:41:34 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519) (No client certificate requested)
 by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4dRFZh2MY0z49PvR;
 Wed, 10 Dec 2025 14:36:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1765370188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SM4/DYpAoX2OHJKWTtMBgck5YzGO83IGE2Ol5R7rY+g=;
 b=NKgOaPAYgGVYPPxyfSkV0r+tSdMQLBJ5xGIa7zWYOLeP2v72iSnZfU/o6p/ig0DCRjInz8
 Z2HCFexqQPsVN4SedKLxRUWHWKNQlDRICuPmBGD83hZIROc4DQGYl9C5QNC0yW/SLSA37a
 sogXI3pfQGP/vyCR5JHUOvSJ8gowRnTJG8Hv5tz7tw0cNns0RWtvAlK/ImXKgps0ydnIgz
 6/lzdhWRHudgbSQ94ArrDLJzBbi5tJt3+ALvpSJkfH35rIa8n36vbK6zA01VorVHxxAJ2H
 oNjT/2hzohhpxyspC7jSLHbtEYkfSdSoGsp8lU/0dphYX2Hoqt/0CWYAWsVR4Q==
Received: from mail.home (212-90-86-103.bb.dnainternet.fi [212.90.86.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: timo.lindfors)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4dRFZb5ybZzyQH;
 Wed, 10 Dec 2025 14:36:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1765370185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SM4/DYpAoX2OHJKWTtMBgck5YzGO83IGE2Ol5R7rY+g=;
 b=DzELVdZcX2l8aUIYnxx+Le/a4bUhw/ZM0PWgIJF/b4/lgYXRgmodJ+Fj2B81UYKoQVUNOe
 iP5NohO9Wt8euj3W1Gz0bCRQWyy8Ozu2aTLYwumtPE3aX8JZJcJlWS8JX5ls1CFD5q82Un
 pKa2fSmYsYTCU6Y63dvUBqHZXf45oAU=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1765370185;
 b=JYNpq39zyemGiMb1t7ad5v6kCUrhRJzfMJZkWIMDzFhpK08X080Ea8aZAB+SR/6hdfHsB2
 K7zx6cXmTNOSxzB7qF2E4UdnRtfhzWyrt6/Lv0xO7sQC8blbUkeJrLZgY68VVQ8KHe2nMr
 HCGeS9GLpS5u0vL+jte+1saB2KMP5cs=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=timo.lindfors smtp.mailfrom=timo.lindfors@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1765370185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SM4/DYpAoX2OHJKWTtMBgck5YzGO83IGE2Ol5R7rY+g=;
 b=CLDOKjX7Cu32PfV0NVCiO1qUclJ1F6tK4v16U3a9oSydenaUzfUUZqTQD+9YPTLprRkVFQ
 QlCrC6XnFz11Jkq5qqX/Q+Qa0DkK5bNFbspliqLnKTZ0jP1OhVlRlgJtU6YigyUm1cqj3M
 OgbiywM7mMlrI+xI9lYNmDBRrjHD/eA=
Received: from localhost ([127.0.0.1]) by mail.home with esmtp (Exim 4.89)
 (envelope-from <timo.lindfors@iki.fi>)
 id 1vTJQd-0006HY-DS; Wed, 10 Dec 2025 14:36:23 +0200
Date: Wed, 10 Dec 2025 14:36:23 +0200 (EET)
From: Timo Lindfors <timo.lindfors@iki.fi>
To: Salvatore Bonaccorso <carnil@debian.org>
cc: Matt Marjanovic <maddog@mir.com>, 1054514@bugs.debian.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Alex Constantino <dreaming.about.electric.sheep@gmail.com>, 
 airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, regressions@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, timo.lindfors@iki.fi, 
 tzimmermann@suse.de, virtualization@lists.linux-foundation.org
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
In-Reply-To: <aTiTnENWsCoTbT3U@eldamar.lan>
Message-ID: <alpine.DEB.2.20.2512101433240.24105@mail.home>
References: <alpine.DEB.2.20.2310242308150.28457@mail.home>
 <b8b1497f-789e-4bb7-be17-9d3ebb30c143@mir.com> <aTiTnENWsCoTbT3U@eldamar.lan>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Mailman-Approved-At: Thu, 11 Dec 2025 01:01:36 +0000
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

On Tue, 9 Dec 2025, Salvatore Bonaccorso wrote:
>> This is back in trixie --- unsurprisingly, because the kernel commit which

Indeed. The reverst of the problematic commit was reverted in mainline 
kernel. I have spent several days trying to understand the problem but 
unfortunately I don't have enough time to troubleshoot this more.

I tried switching to virtio but for my use case of remote Linux desktops 
it is not usable. If I scroll a fullscreen web page I can see how the 
whole screen is redrawn every time,

Meanwhile I've switched from SPICE to RDP. GNOME in trixie supports 
headless RDP sessions that make this very convenient. Client support is 
also much better for RDP. I solved the authentication problem by isolating 
each VM from each other on network level and then deployed rdpgw 
(https://github.com/bolkedebruin/rdpgw) in front of everything with OpenID 
authentication.

-Timo
