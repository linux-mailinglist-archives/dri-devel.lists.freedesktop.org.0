Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7B1764FF1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4E010E553;
	Thu, 27 Jul 2023 09:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7501210E553
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:37:57 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 780966607038;
 Thu, 27 Jul 2023 10:37:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690450675;
 bh=10mp7xD7Cx1D3lv25ctWipvmwRGE+3207Gw4RhcXQzE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KwGRUSuQxGQlU2yv2sqfBKZFWPTU+O353Ms2oGNUkS8cEF1e/XcogqaxvB+CPv6Bg
 9sloWG7DSzjnPtGH/caSjE2Y0FDfon4bWCPfO13tsjIhP17E5ovAaqteAT/b21M+ed
 rrqxyz98Nv0wWy+bYP3bTWCt7DMv+Q7GCktVS94oNUpr9EkyYHPcWjZ/4qbvxZksJ6
 8zHrkXeNBQBezE0zFHBsX3EwkPlle+au0npQXE9xR03e+tCDkq6vzehpkgKsV+dfSn
 PwUsTBOHC2ZKNE+caml+2kAoBd1jJZ8qJ841uKpTfjeWKtNci2MLgXPFAVqx7o49AE
 KFdUGc9ip4qHg==
Message-ID: <9334a56f-77d1-f062-08d9-33a6c6136fdc@collabora.com>
Date: Thu, 27 Jul 2023 11:37:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 Daniel Stone <daniel@fooishbar.org>
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
 <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/07/23 21:44, Justin Green ha scritto:
>> Would it make more sense to commmonize function mtk_plane_format_mod_supported()
>> and call that one here instead?
> I had considered that, but mtk_plane_format_mod_supported() is
> required to take a drm_plane as a parameter in order to conform to the
> type signature defined in drm_plane_funcs, but
> mtk_drm_mode_fb_create() does not have a drm_plane to provide, since
> the framebuffer is created later in the function. Technically we don't
> actually use the drm_plane in the implementation of
> mtk_plane_format_mod_supported() today, so we could just use a null
> pointer, but I figured we may one day need to add per-plane logic.
> 

My suggestion was not to use that function as-is, but rather to add a helper like

bool mtk_format_modifier_supported(u32 format, u32 modifier) { ... }

...so that a per-plane logic in mtk_drm_plane can be easily added, because...

static bool mtk_plane_format_mod_supported(struct drm_plane *plane,
					   u32 format, u32 modifier)
{
	return mtk_format_modifier_supported(format, modifier);
}

so apart from that, is there any other reason to not do that? :-)

Regards,
Angelo

>> This is not DRM_FORMAT_MOD_INVALID. Please either explicitly compare against INVALID if that's what you meant, or against LINEAR if that's what you meant, or both.
> Ack, I meant to use LINEAR. Will update for the next version of the patch.


