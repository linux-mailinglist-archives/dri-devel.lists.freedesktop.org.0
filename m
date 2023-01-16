Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53966D11E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590C10E4EB;
	Mon, 16 Jan 2023 21:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22D10E4EB;
 Mon, 16 Jan 2023 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gEkHWkVQNVLsdoln9F9nH34ku6oBlSwFeBccFnovilI=; b=nT6CU9tWBOb84pDY1DSLYw7Fje
 qBuGyQwSPFKwY+BfB3hZ55PK4HA7n2J4eg5Wq2NjEt8QIoyz/lGRtAxeCeJ/qhYAdilivt7UQ3bFY
 puS1rLZYnFW04bVhaOYcLMPCzpdoTWxC7G4v4wD4Xv/5rpuuOQKJrAQaycay+rdolixsrUPI0hWVt
 HcVLBvutzSRDvt+AVcpTfsDqvk+l7Qv3l6Xu/DoePhzJD/IZpb0bcBhRXFoomhIrKjzP0urJ/CW2b
 nQdiwCWmTeLwml+GaNwYFJLH7xiMDcpWJnMAM+u3EOz6ygvnlFlxCgarwPkiRELGlWMxmqM6MjBtx
 5uhIysxA==;
Received: from [187.56.70.205] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHXR1-00A9YZ-Bg; Mon, 16 Jan 2023 22:54:31 +0100
Message-ID: <304bdd9f-5d47-008c-11d9-0995cf33041a@igalia.com>
Date: Mon, 16 Jan 2023 18:54:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking
 code
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-2-gpiccoli@igalia.com>
 <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
 <MN0PR12MB6101142C0E3653D7DA57866EE2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <MN0PR12MB6101142C0E3653D7DA57866EE2C19@MN0PR12MB6101.namprd12.prod.outlook.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>, "Liu,
 Leo" <Leo.Liu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 18:49, Limonciello, Mario wrote:
> [...] 
> 
> The problem with adding a comment about which platform it's in is that
> this will probably go stale.  Some IP blocks are re-used in multiple ASICs.
> 
> VCN 3, 1, 1 is a great example.  This is used in both Yellow Carp (Rembrandt) as well
> as Mendocino.   I would think a better approach would be to have a single point
> of documentation somewhere in the source tree that we can update after new
> ASICs launch that could act as a decoder ring.
> 
> It's effort to remember to update it, but it's at least a single point of failure.
> 

Hi Mario, thanks - it makes a lot of sense! I can remove the comments in
the V2, I'll wait a bit more for (potential) extra feedback but I agree
with you, so I'm inclined to remove them.

Cheers,


Guilherme
