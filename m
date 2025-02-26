Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F405A463C3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 15:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4614410E0BA;
	Wed, 26 Feb 2025 14:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="makalxCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC1010E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qbtbASKxIYYipFAVt3nJdzkBAoA+S1oBGjjAz/HmTSs=; b=makalxCj1yW3JmPdeqQHP7LUkK
 9cV6Ew51HZEzMOqFNbfHrewTTrNueM1Lrq4PjOpFMvvqx1POre1yCdEZypquNilWxa6sy2AcK5ywg
 bmRrmtcGPThfHdgffg/K7+dTRvykl05JQ6E9JUyrysC51GGwgY+hKFvtfceI8hKZ0E8YaoI0usE79
 S5We6Amax75OI+tnwwdpRhO5o3lSp8PP0MGgMDEfpr4vSmArvfl3a14GQBUN86PTyKi39iqjngXw9
 nNw6tlO2gZVne5TkZf1lfLdp/9sLgSN5NW4LVzaelM+tTGOThU0iELjgt2+DeZtXldBly8M/zGiPE
 sUDe8jZQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tnIlp-0010hb-Tz; Wed, 26 Feb 2025 15:52:28 +0100
Message-ID: <e0b3f647-ff26-45a0-9af8-16705a7b36ec@igalia.com>
Date: Wed, 26 Feb 2025 11:52:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/doc: Document KUnit expectations
To: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
References: <20250113101100.1373856-1-mripard@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250113101100.1373856-1-mripard@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 13/01/25 07:11, Maxime Ripard wrote:
> The DRM and KMS frameworks and helpers gain more and more kunit
> coverage, so let's document what our expectations are.
> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> I'm not too sure where those guidelines should be placed. Is it the best
> place?
> ---
>   Documentation/gpu/drm-internals.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index cb9ae282771c..94f93fd3b8a0 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -206,10 +206,17 @@ follows:
>   	The configuration included in ``.kunitconfig`` should be as generic as
>   	possible.
>   	``CONFIG_VIRTIO_UML`` and ``CONFIG_UML_PCI_OVER_VIRTIO`` are not
>   	included in it because they are only required for User Mode Linux.
>   
> +KUnit Coverage Rules
> +~~~~~~~~~~~~~~~~~~~~
> +
> +KUnit support is gradually added to the DRM framework and helpers. There's no
> +general requirement for the framework and helpers to have KUnit tests at the
> +moment. However, patches that are affecting a function or helper already
> +covered by KUnit tests must provide tests if the change calls for one.
>   

Acked-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

>   Legacy Support Code
>   ===================
>   
>   The section very briefly covers some of the old legacy support code

