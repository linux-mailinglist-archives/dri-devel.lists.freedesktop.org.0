Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95046438756
	for <lists+dri-devel@lfdr.de>; Sun, 24 Oct 2021 10:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597F6E101;
	Sun, 24 Oct 2021 08:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D190A6E101
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Oct 2021 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7HzjyYNwVZDLpgzpPdiysmiKwCwBzklPeiEZLIob20=; b=MU/A9jJnzJ1wan42GmGn8SY6aF
 vrvtaSK6CNc/2ahF+r3lH1ar2fq+1UqSZeFtpMI94WA3/wRl80+GNd89bS1DGVCkgTgTOdHBuhQZm
 2SsMJ0i0JWdrJqhY2mXHWi7Xc1RnfxpXSOTRF78GMWvBT0ATN8Yvt32lgmxWsKsNdgclrjeL7q3NJ
 joVX9gNSc9V/QLR24AwXK8yKXlOKDdSgkgheEF2otNo+8UbG0+GFVUPBsZK3FjyE+bigV8RQ1fHKw
 U9wcJ1cICDdBxD+Bv91nl0U21Jv6rKGVglenBsGHxzaJlheNN0TQg2xBgBlORFp3XRgthGacVPWGb
 WH1SdtGA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56065
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1meYp2-0005UD-P2; Sun, 24 Oct 2021 10:25:40 +0200
Subject: Re: [PATCH 2/9] drm/format-helper: Rework format-helper memcpy
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <454a88ca-618d-3947-247a-52d8c5b4db08@tronnes.org>
Date: Sun, 24 Oct 2021 10:25:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022132829.7697-3-tzimmermann@suse.de>
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
> Move destination-buffer clipping from all format-helper memcpy
> function into callers. Support destination-buffer pitch. Only
> distinguish between system and I/O memory, but use same logic
> everywhere.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Tested-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
