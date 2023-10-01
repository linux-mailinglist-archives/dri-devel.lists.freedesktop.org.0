Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C727B467A
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 11:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C40410E0D0;
	Sun,  1 Oct 2023 09:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD8410E0D0;
 Sun,  1 Oct 2023 09:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ee471ciaPlX0phSy+SQV96SmG4ukJhTbdg8H1e3PVh0=; b=c28dziJqYoePmgk8MekJaVi7Go
 gB6rE/E49eV49+3XNS3BBdtWbIreQJvCBHzVWBbnG6o8nGYC8LQND8FhzAvmGHVYdt2c5KF3RPIAU
 NBcs2G2hyRWjVm2nQ+oZwkSLEET8uRI89N7QbslE5JoDqJJvOA7VoMJ4QJIGG+H8EUZaRpmu2QsYR
 ssWy0z3sol9olRLGkzFyhYtToUg/s61C2UA8Zx8KoxkSJeYTOamZDELdPcI5F4OJuIGu+WsZob11Y
 spisS75Cgol3OTvb7uv4/MdFP+Ki2+D7AwJ2901xQL2rIjwHkhYP9iVrPuLnB64K+0F1BoZgYJggC
 W9q20amg==;
Received: from [206.0.75.64] (helo=[192.168.205.76])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qmsU0-00AK31-Jw; Sun, 01 Oct 2023 11:11:25 +0200
Message-ID: <4202076c-bbdb-4c1f-a3e3-45235fb390ae@igalia.com>
Date: Sun, 1 Oct 2023 11:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: Replace drm_framebuffer plane size functions
 with its equivalents
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
References: <20230926141519.9315-1-gcarlos@disroot.org>
 <20230926141519.9315-3-gcarlos@disroot.org>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230926141519.9315-3-gcarlos@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tales Aparecida <tales.aparecida@gmail.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Maira Canal <mairacanal@riseup.net>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/23 16:15, Carlos Eduardo Gallo Filho wrote:
> The functions drm_framebuffer_plane_{width,height} and
> fb_plane_{width,height} do exactly the same job of its
> equivalents drm_format_info_plane_{width,height} from drm_fourcc.
>
> The only reason to have these functions on drm_framebuffer
> would be if they would added a abstraction layer to call it just
> passing a drm_framebuffer pointer and the desired plane index,
> which is not the case, where these functions actually implements
> just part of it. In the actual implementation, every call to both
> drm_framebuffer_plane_{width,height} and fb_plane_{width,height} should
> pass some drm_framebuffer attribute, which is the same as calling the
> drm_format_info_plane_{width,height} functions.
>
> The drm_format_info_pane_{width,height} functions are much more
> consistent in both its implementation and its location on code. The
> kind of calculation that they do is intrinsically derivated from the
> drm_format_info struct and has not to do with drm_framebuffer, except
> by the potential motivation described above, which is still not a good
> justification to have drm_framebuffer functions to calculate it.
>
> So, replace each drm_framebuffer_plane_{width,height} and
> fb_plane_{width,height} call to drm_format_info_plane_{width,height}
> and remove them.
>
> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
