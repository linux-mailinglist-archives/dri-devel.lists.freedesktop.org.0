Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D984B7F51A2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 21:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EAA10E30F;
	Wed, 22 Nov 2023 20:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCD410E30E;
 Wed, 22 Nov 2023 20:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dGgYBtPaNkz+NxmhFb7ZvVAiX42aZMlvMkpZ6HlBFVw=; b=Feg7DpwLlnWD3LTpkA08M3Gg0F
 LFRp0VDueKotk4Gcu5iGti02Rgic0ihhonOYctmgp7Q/nIUF6MehpE43BOKeUG23Io4d2G4snp+ng
 gZRSma4BTxueV0gtjkK6BdAuj80fVgNAKqFHwcm85cEmFnraoas7zbvrcBAdkxPCxZDeT2iNLROAU
 Tc+RAyhDz872OuZ2eC+TLRr0HZItiFXx1xb+mf6/ey3W1nAJSuSlOjp+JzewPlG5IeuFYTPQFvyRd
 bxVFc7umgMDjyIwydXTk1ZwhHxGDfhdKaSpTFMOKGxgeG0rXvjkgrIBVMTDUQimpoVcti2ZRvaWTu
 n6VdKdBg==;
Received: from 189-69-166-209.dial-up.telesp.net.br ([189.69.166.209]
 helo=[192.168.1.111]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r5tpw-0065hQ-Ea; Wed, 22 Nov 2023 21:28:40 +0100
Message-ID: <50ff86d4-5ce1-4ae5-aafb-ce3bc0069629@igalia.com>
Date: Wed, 22 Nov 2023 17:28:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] drm: Add support for atomic async page-flip
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
References: <20231122161941.320564-1-andrealmeid@igalia.com>
 <cc10f6b0-e26e-4021-85ca-33cb1e58e937@amd.com>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <cc10f6b0-e26e-4021-85ca-33cb1e58e937@amd.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 intel-gfx@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 xaver.hugl@gmail.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hamza,

Em 22/11/2023 17:23, Hamza Mahfooz escreveu:
> Hi André,
> On 11/22/23 11:19, André Almeida wrote:
>> Hi,
>>
>> This work from me and Simon adds support for DRM_MODE_PAGE_FLIP_ASYNC 
>> through
>> the atomic API. This feature is already available via the legacy API. 
>> The use
>> case is to be able to present a new frame immediately (or as soon as
>> possible), even if after missing a vblank. This might result in 
>> tearing, but
>> it's useful when a high framerate is desired, such as for gaming.
>>
>> Differently from earlier versions, this one refuses to flip if any 
>> prop changes
>> for async flips. The idea is that the fast path of immediate page 
>> flips doesn't
>> play well with modeset changes, so only the fb_id can be changed.
>>
>> Tested with:
>>   - Intel TigerLake-LP GT2
>>   - AMD VanGogh
> 
> Have you had a chance to test this with VRR enabled? Since, I suspect
> this series might break that feature.
> 

Someone asked this question in an earlier version of this patch, and the 
result is that VRR still works as expected. You can follow the thread at 
this link:

https://lore.kernel.org/lkml/b48bd1fc-fcb0-481b-8413-9210d44d709b@igalia.com/

I should have included this note at my cover letter, my bad.

Thanks,
	André
