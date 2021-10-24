Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7436343899B
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 16:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725F66E154;
	Sun, 24 Oct 2021 14:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949AE6E154
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 14:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mGt45g+3Uptl4J+LwgYLyEKcGzvmwnpkpwsNy6uYnn8=; b=IHDWcrEChDmqoRiprgLGG3ChMb
 ATYJnA4iLlvnT1xm/iqXjOK2QaCZ7etVuOCAswpATbL9HhGaHXKXtmyhyqLo+J3vIUtNw5SxK+Avm
 1dZhZiEYDUKGoaf/GlKG3t2VF/wSak5FqY4ydqMDnHNLWOC+J/KoWXDlWhLYS95IrkUBwQEZNTTCD
 VMoaIPOjbLPLMJ0umoL5dWYVzFkBFj38bgpEU8DG1tryDqPYsSTr3J77T7QVaI5s5JU7KQX03FuyE
 Ae7MRcrbyF5aK6jliY1iNH/xLh/jaOhBf7KoqWtHNJXdzv4vrvjC0s83MaLgDqrM4IrxP2fjND+tC
 ZZA3S/9Q==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51803
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1meexs-00055a-T1; Sun, 24 Oct 2021 16:59:12 +0200
Subject: Re: [PATCH 5/9] drm/format-helper: Streamline blit-helper interface
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-6-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <b5e7ebab-f740-050a-27a0-ec587c95ccfb@tronnes.org>
Date: Sun, 24 Oct 2021 16:59:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022132829.7697-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
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



Den 22.10.2021 15.28, skrev Thomas Zimmermann:
> Move destination-buffer clipping from format-helper blit function into
> caller. Rename drm_fb_blit_rect_dstclip() to drm_fb_blit_toio(). Done for
> consistency with the rest of the interface. Remove drm_fb_blit_dstclip(),
> which isn't required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
