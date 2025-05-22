Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B081AAC135A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 20:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9902010E7F4;
	Thu, 22 May 2025 18:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jrzrLSLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFEE010E854
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HwwUQzl2D3BmUBvszgNuv2TqAHKnY1hIL7TIDiTl2xw=; b=jrzrLSLROaYViBzc8snOQcBTBq
 CjVKgSO3BcCNtF+Jay50sRDaoRvdGQHBSzVVeyqB54BrKlF3mF9qxlIHnZvNfUiJr/GU2gTtNv1TT
 8Z7ne2TmuHAqcfbYRSUpLVeg4fAIctj+/KlrcKelFv1+Pb8CKShSaLTUnKwz525fVNwRI+4WDbB+D
 eIMGsvfJypwHE/BK2KGIT7IZk+kqqwybhqcLnQOZeGu/Dg+cSfNpaAj7llQI39sQk792eZndhlrBS
 umftwv++YOSAy+Om5gRt3t9nZi7My8D3cvPoBpd3oRZm7x9fIH78QDafyYi/Hk602CH6UOQlSsT4+
 ozIPB23g==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uIAee-00BqOC-DY; Thu, 22 May 2025 20:28:32 +0200
Message-ID: <df1d45c0-60f0-4850-9324-ab52a3f7f8e1@igalia.com>
Date: Thu, 22 May 2025 15:28:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_auth: Convert mutex usage to guard(mutex)
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Kees Cook <keescook@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20250509142627.639419-1-andrealmeid@igalia.com>
 <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <7133e9b4-c05a-4901-940e-de3e70bbbb1e@suse.de>
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

Hi Thomas,

Em 12/05/2025 03:52, Thomas Zimmermann escreveu:
> Hi
> 
> Am 09.05.25 um 16:26 schrieb André Almeida:
>> Replace open-coded mutex handling with cleanup.h guard(mutex). This
>> simplifies the code and removes the "goto unlock" pattern.
>>
>> Tested with igt tests core_auth and core_setmaster.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
Do you mind applying this patch at drm-misc?

Thanks!
	André
