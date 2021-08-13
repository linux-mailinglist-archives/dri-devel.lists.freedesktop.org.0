Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E23EB18A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 09:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53B36E526;
	Fri, 13 Aug 2021 07:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id E02176E526
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 07:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id BFB9420201B;
 Fri, 13 Aug 2021 09:33:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id VN5sTBzV7V1P; Fri, 13 Aug 2021 09:32:57 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 44D5A20201A;
 Fri, 13 Aug 2021 09:32:57 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mERgW-000B0f-6u; Fri, 13 Aug 2021 09:32:56 +0200
Subject: Re: [PATCH v2] drm: Copy drm_wait_vblank to user before returning
To: Mark Yacoub <markyacoub@chromium.org>, dri-devel@lists.freedesktop.org
Cc: seanpaul@chromium.org, abhinavk@codeaurora.org, robdclark@chromium.org,
 airlied@linux.ie, Mark Yacoub <markyacoub@google.com>
References: <20210811175525.2125964-1-markyacoub@chromium.org>
 <20210812194917.1703356-1-markyacoub@chromium.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <4ab4548f-34fc-27cb-928e-af2b8ab78b1b@daenzer.net>
Date: Fri, 13 Aug 2021 09:32:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812194917.1703356-1-markyacoub@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-08-12 9:49 p.m., Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Userspace should get back a copy of drm_wait_vblank that's been modified
> even when drm_wait_vblank_ioctl returns a failure.
> 
> Rationale:
> drm_wait_vblank_ioctl modifies the request and expects the user to read
> it back. When the type is RELATIVE, it modifies it to ABSOLUTE and updates
> the sequence to become current_vblank_count + sequence (which was
> RELATIVE), but now it became ABSOLUTE.
> drmWaitVBlank (in libdrm) expects this to be the case as it modifies
> the request to be Absolute so it expects the sequence to would have been
> updated.
> 
> The change is in compat_drm_wait_vblank, which is called by
> drm_compat_ioctl. This change of copying the data back regardless of the
> return number makes it en par with drm_ioctl, which always copies the
> data before returning.
> 
> [How]
> Return from the function after everything has been copied to user.
> 
> Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> Tested on ChromeOS Trogdor(msm)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Change-Id: I98da279a5f1329c66a9d1e06b88d40b247b51313

With the Gerrit Change-Id removed,

Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
