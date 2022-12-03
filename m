Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7626417AE
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 17:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EF10E1CA;
	Sat,  3 Dec 2022 16:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBED810E1CA
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vLcn1woP++aXBJqTzDyHR87X2mxtS6wTU/gvQtO03+w=; b=b12atvA0+a4V6vg6VeGRD8ryqb
 +eHmQDGfHpTT9qPkhw6PCWFXIhAfutKArWUr0NhdKJeB+0AHZ8ymW+2gY1em7KIWFsWoh1zZH0Fub
 lIdu0m35xF0TlrPHdgIoPfx8UsjRJ1NPeYQJU77X2ZrOSE1w5FQEPI68Vvt1b8LUOHpBaH5OUOuFM
 +WJo/dFKbQgxOFTrg6qru9U278vFhe4esJ3p9/rRyX8YJharOPSQzZvc2Om/rkXYEvZ1ByzZgs/Xd
 JXPhzHy7XMEyic+4cMKbCdCRnzrdm7CbpqCCfEKDRPX+uBCTC7vCDgo37Wh7SRgbV1alnTI5FAbTC
 eQjz/UGQ==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=56534)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p1V6o-0000FP-TS; Sat, 03 Dec 2022 17:11:22 +0100
Message-ID: <506706ad-204d-f0a0-c8ce-92bb8805402e@tronnes.org>
Date: Sat, 3 Dec 2022 17:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 6/8] drm/mipi-dbi: Support shadow-plane state
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221202125644.7917-1-tzimmermann@suse.de>
 <20221202125644.7917-7-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221202125644.7917-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.12.2022 13.56, skrev Thomas Zimmermann:
> Implement MIPI DBI planes with struct drm_shadow_plane_state, so that the
> respective drivers can use the vmap'ed GEM-buffer memory. Implement state
> helpers, the {begin,end}_fb_access helpers and wire up everything.
> 
> With this commit, MIPI DBI drivers can access the GEM object's memory
> that is provided by shadow-plane state. The actual changes to drivers
> are implemented separately.
> 
> v2:
> 	* use shadow-plane state directly (Noralf)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Javier Martinez Canillas <javierm@redhat.com>
> Tested-by: Noralf Trønnes <noralf@tronnes.org> # drm/tiny/mi0283qt
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
