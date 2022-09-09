Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BC5B3FA6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 21:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9454410E02F;
	Fri,  9 Sep 2022 19:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1A10E02F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 19:30:36 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MPR0q5q8TzDrb8;
 Fri,  9 Sep 2022 19:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662751836; bh=vFwkfIHkw9F5osFOESMcaFpLfifOqEP2vuPbL23xph8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XGg2vOKjHQVBmagY99sKeHPRz70A3sRukNV4cN5bfHIO9oq8vTcHiyt9BFjQYcC7R
 WdM2pFHrScN/oKb6R42dwb7I+cFVPmelhGYk7yvxWAXKz0AKKWk0COaTFxDTeMPhe+
 KA4HMwyDYLdBpJmOJmM+NIBIfXIqVs51Kfw7ArJw=
X-Riseup-User-ID: 56E9B09C9CF959B945D09D300BB3D49AFF8AE17AA3C25CEC798EB23B15D2CB28
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MPR0n4MqPz1ySb;
 Fri,  9 Sep 2022 19:30:33 +0000 (UTC)
Message-ID: <51f6f307-77f2-fcb6-c02f-b725eb5f182e@riseup.net>
Date: Fri, 9 Sep 2022 16:30:29 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/format: Split into more granular test cases
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220831215608.349269-1-michal.winiarski@intel.com>
 <20220831215608.349269-2-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220831215608.349269-2-michal.winiarski@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/31/22 18:56, Michał Winiarski wrote:
> While we have multiple test cases, most of them check multiple
> conditions, calling the function that is tested multiple times with
> different arguments (with comments that indicate test case boundary).
> This usually means that it can be easily converted into multiple test
> cases.
> 
> Passing output:
> ============================================================
> ================= drm_format (18 subtests) =================
> [PASSED] drm_format_block_width_invalid
> [PASSED] drm_format_block_width_one_plane
> [PASSED] drm_format_block_width_two_plane
> [PASSED] drm_format_block_width_three_plane
> [PASSED] drm_format_block_width_tiled
> [PASSED] drm_format_block_height_invalid
> [PASSED] drm_format_block_height_one_plane
> [PASSED] drm_format_block_height_two_plane
> [PASSED] drm_format_block_height_three_plane
> [PASSED] drm_format_block_height_tiled
> [PASSED] drm_format_min_pitch_invalid
> [PASSED] drm_format_min_pitch_one_plane_8bpp
> [PASSED] drm_format_min_pitch_one_plane_16bpp
> [PASSED] drm_format_min_pitch_one_plane_24bpp
> [PASSED] drm_format_min_pitch_one_plane_32bpp
> [PASSED] drm_format_min_pitch_two_plane
> [PASSED] drm_format_min_pitch_three_plane_8bpp
> [PASSED] drm_format_min_pitch_tiled
> =================== [PASSED] drm_format ====================
> ============================================================
> Testing complete. Ran 18 tests: passed: 18
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---

As there were no more feedback on this, I applied to drm-misc
(drm-misc-next). Thanks!

Best Regards,
- Maíra Canal
