Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021AB66D119
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57C910E4E8;
	Mon, 16 Jan 2023 21:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038B710E4E4;
 Mon, 16 Jan 2023 21:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nxsoxIaD5n9KqvB4XRuJJaPVzZr53OQhOp6rYWEhgw4=; b=kXrr2vyCyk4gaFMeD0J8cmZdfZ
 ZzrO+hY0fLzEgcpdNRMMwgxWT9r4ay3rdx+2Ec5PDvhPHW1uu4xLdw7DFLYG/tLYVpEzuzBo6iVL1
 x0LKACS3jozegjT7YTsHLmFWqIW0z9bgIRBRHWTrIHUySssMj01/VatjS5L9kRa+zhReGoajx2pP0
 NdUdL2RMu2R+TXgxb7Vk3S5E/cDEn+D78aoHnGhjBEbtc822Z4Y4mu3dLXGoZPwbhYVRAZERYPICX
 o/KSI79bXqFDtAjFPnpht3nNdXBtCR1viDSBwLFa8uhe8dAoCFbTbkExfOE3yqynkUUIaI9ZjDsGI
 nreBgRLw==;
Received: from [187.56.70.205] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHXOB-00A9VH-Iw; Mon, 16 Jan 2023 22:51:35 +0100
Message-ID: <dbb667bb-dbc0-a6ff-63e2-b81309a2fc62@igalia.com>
Date: Mon, 16 Jan 2023 18:51:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking
 code
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-2-gpiccoli@igalia.com>
 <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Sonny Jiang <sonny.jiang@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 18:41, Alex Deucher wrote:
> [...]
>> +       case IP_VERSION(4, 0, 0):       /* Vega10 */
> 
> This comment is incorrect.  Vega10 does not have VCN (it has UVD and VCE).
> 
> Alex

Thanks Alex! I'll resubmit V2 with this comment removed.

I've stolen it from
https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c#L1147
, but obviously I misunderstood the mapping here heheh

Cheers,


Guilherme
