Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5D77631D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 16:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7759E10E44E;
	Wed,  9 Aug 2023 14:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E6E10E44E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 14:57:25 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4RLY7T01FHzDqD5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691593045; bh=4tX4rZiRnZLp2WoTTevA/Yx5F4ApE2E0HwyFY44x7mE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WTo7+3v6+QuuiACj+W03Azz11vIXnI/1cIl+/TpOpSebq2ZsP2LcFQ4zfMjAUSTwD
 d5d4EAh6WQTYan2SA8GVOp5Mc9ZgyXy2RP9phz1ue7peWcgbGimj0DLXc8q9p4+mrc
 QoWk4hlBvr8xwwyEPXdOmuXn75SyXCdwxFRFhM0E=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RLY7S3TdLz9tGF;
 Wed,  9 Aug 2023 14:57:24 +0000 (UTC)
X-Riseup-User-ID: C9EF3FE51A11584D0677A6C29BD1AF0C216FBA99BAFDD9B0E8443FB2F62C7365
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RLY7P5zhJzJmmS;
 Wed,  9 Aug 2023 14:57:21 +0000 (UTC)
Message-ID: <9a35adc2-435d-4c75-97de-c87fed184d4d@riseup.net>
Date: Wed, 9 Aug 2023 11:57:18 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] drm/format-helper: Add KUnit tests for drm_fb_swab()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>
References: <20230721182316.560649-1-arthurgrillo@riseup.net>
 <20230721182316.560649-3-arthurgrillo@riseup.net>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>
In-Reply-To: <20230721182316.560649-3-arthurgrillo@riseup.net>
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
Cc: tales.aparecida@gmail.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, tzimmermann@suse.de,
 davidgow@google.com, jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 21/07/2023 15:23, Arthur Grillo escreveu:
> Insert parameterized test for the drm_fb_swab() to ensure correctness
> and prevent future regressions.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---

[...]

> +			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
> +			.expected = {
> +				0xFFFFFF11, 0x00000022,
> +				0x0000FF33, 0x00FF0044,
> +				0xFF000055, 0xFF00FF66,
> +				0x00FFFF77, 0xFFFF0088,
> +			},
> +		},
>   	},
>   	{
>   		/* Randomly picked colors. Full buffer within the clip area. */
> @@ -425,6 +448,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   				0b010, 0b000,
>   			},
>   		},
> +		.swab_result = {
> +			.dst_pitch =  20,
> +			.expected = {
> +				0x9C440EA1, 0x054D11B1, 0x03F3A8C1, 0x00000000, 0x00000000,
> +				0x73F06CD1, 0x9C440EA2, 0x054D11B2, 0x00000000, 0x00000000,
> +				0x0303A8C2, 0x73F06CD2, 0x9C440EA3, 0x00000000, 0x00000000,

I would appreciated to have some information about those numbers in the 
commit message.
