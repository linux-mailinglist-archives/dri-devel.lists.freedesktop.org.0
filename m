Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED2696299
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBEC10E066;
	Tue, 14 Feb 2023 11:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A494310E066;
 Tue, 14 Feb 2023 11:42:31 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PGK7l6xN0z9sS1;
 Tue, 14 Feb 2023 12:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1676374947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bpxBXi/C0ESDbbBrRbwGSesIMfbtRruhtAnq66OD38k=;
 b=h8nrwUfPISMDZA5ONGRgTSVZ7zVlhAfPKpIMFcRZs/dsPoP499zVefTB2n5PgBG0P9A2J3
 gxOGfXs7Vvonpe+Fro3aIgOcEQibTgGgzQtWU5hnzoWwYAs2BAWeqoD6ChMQepNoiwASqK
 vshlXMrfvqPRRBwoGVuD/V5t5DYRinPA/ke0pYve/AirGF40JfQkmmd/pMrs1hOUqu2b71
 VcUWGUzFB+9LFRWG9X9440sebIzOWe2gQFk7xdng0yIeAT+OzBn5oQ7ok1n9H3fbizJowE
 DTivE1OsDdek7EgW+c9hLOBiQOtStqRhH0iIYe9QdeT3J/acSSoqUgug0IBkug==
Message-ID: <a3e4887b-ee5f-f41c-621c-d3f057528f9f@mailbox.org>
Date: Tue, 14 Feb 2023 12:42:25 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 06/10] drm/amd/display: Fix implicit enum conversion
To: Arthur Grillo <arthurgrillo@riseup.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-7-arthurgrillo@riseup.net>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230213204923.111948-7-arthurgrillo@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: egsu9frrzwd99krj16ynoeuffhtrbcw8
X-MBO-RS-ID: 4c36c591adb6f2225ad
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, mairacanal@riseup.net, alexander.deucher@amd.com,
 andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/13/23 21:49, Arthur Grillo wrote:
> Make implicit enum conversion to avoid -Wenum-conversion warning, such
> as:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.c:4109:88: warning: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Wenum-conversion]
>  4109 |                                                 locals->ODMCombineEnablePerState[i][k] = true;
>       |                                                                                        ^
> 
> [...]
> 
> @@ -3897,14 +3898,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>  					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>  							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>  
> -				locals->ODMCombineEnablePerState[i][k] = false;
> +				locals->ODMCombineEnablePerState[i][k] = (enum odm_combine_mode)false;

dm_odm_combine_mode_disabled would seem clearer than (enum odm_combine_mode)false.


> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = (enum odm_combine_mode)true;

I'm not sure which enum value (enum odm_combine_mode)true will be converted to, probably dm_odm_combine_mode_2to1? Is that really appropriate everywhere true is used? If so, again 
dm_odm_combine_mode_2to1 would seem clearer.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

