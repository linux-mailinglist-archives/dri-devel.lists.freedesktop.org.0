Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DD858CE0C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0242810F7B2;
	Mon,  8 Aug 2022 18:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466CB10EC2A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ZTp6SIDLt5GT3+bYAdxWFxhygxOBr/A7Riii2XrJfsc=;
 b=qhGpcxdb5iTbEBtvZPVLEA6ZpqKHR8yu4ZU8RMLVyULUlpuViXjv5sLW9s8EbpNBeuxkp3vOy+A3i
 ro3rWUTX2ntUy3aMfpdUg7VFehlTK83iDTfAA9xgwWrwwYQatToe5Q6Nn0lnkYJ5ebYDUbBF8Z9Ik2
 pWh1qlFKhJKTIgYAHepzyWGLCkYI5XJSk7f9rnow+JEsAoXU0B+yLxaoCQgdaBOx7CYyzjmoMupNxH
 ptVn1RYFMy9LM272K9Ab9qzU8/wMXvLpa+ASdikJ/bk75JFfibKV0nrg1gN2Aauj5kNT/2KrXiZg5n
 FLj+eSxKJHb+Y9hVxJs0wDH1aRHj5Iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=ZTp6SIDLt5GT3+bYAdxWFxhygxOBr/A7Riii2XrJfsc=;
 b=krHftYRNaUIwUi2jPUvODBthBMPhm1UnlHVDq/my2tEemJ0SoWJXWf5GYoaSsokq99Zl2pUloaXyx
 6/KigL3CA==
X-HalOne-Cookie: eb00fd88576e255c300373dd3168e6e64109d575
X-HalOne-ID: 02a222c7-174a-11ed-a91b-d0431ea8a290
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 02a222c7-174a-11ed-a91b-d0431ea8a290;
 Mon, 08 Aug 2022 18:43:36 +0000 (UTC)
Date: Mon, 8 Aug 2022 20:43:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/14] drm/format-helper: Merge drm_fb_memcpy() and
 drm_fb_memcpy_toio()
Message-ID: <YvFZVlkfUFowPeu3@ravnborg.org>
References: <20220808125406.20752-1-tzimmermann@suse.de>
 <20220808125406.20752-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808125406.20752-4-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Aug 08, 2022 at 02:53:55PM +0200, Thomas Zimmermann wrote:
> Merge drm_fb_memcpy() and drm_fb_memcpy_toio() into a drm_fb_memcpy()
> that uses struct iosys_map for buffers. The new function also supports
> multi-plane color formats. Convert all users of the original helpers.
> 
> v2:
> 	* rebase onto refactored mgag200
> 	* use drm_formap_info_bpp() (Sam)
> 	* do static init in hyperv and mgag200 (Sam)
> 	* update documentation (Sam)
> 	* add TODO on vaddr location (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
