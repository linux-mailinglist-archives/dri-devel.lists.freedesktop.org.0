Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E680DBC1BA5
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8276C10E187;
	Tue,  7 Oct 2025 14:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CfibgxMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1507F10E14F;
 Tue,  7 Oct 2025 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRYIVJFqIDbJQeHjH6Q8TweI9/TkPMfMALN1izEC5as=; b=CfibgxMknqAZWaNrCY+32eVyoM
 AfNIpv9eEzkQn2QXblmco88hby0aXAhPKdi/O+aFD4P+pwsor0Xz+QDMCctb/NsqPt3folMa15UeZ
 oEoH0UtLi/hq2KN2KJbtSHSxSR1IaM6dLkimIYXMNJlLFJ57t/ffwUkl9RggmfDzkLUt2SpT9tKB7
 NmxR4Prl+CgsWZ7q1/PcW7auGn7g3rpTmvXq/sG9koK2DAjhm9umL6fk/bya/doqEZoDoStfwFwOY
 tXOZsgxcHcWxAldllDjcQjkDJVni4uVGYpFCIXx+HSJb0UDQNDlLpLKNFYyPW5rzzWP4C3XwCvS15
 5QeTvm5Q==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v68f8-006Dw9-Gc; Tue, 07 Oct 2025 16:27:34 +0200
Message-ID: <a09343b9-2b37-4805-b1e0-54e97af8cd53@igalia.com>
Date: Tue, 7 Oct 2025 15:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/5] drm/ttm: Add getter for some pool properties
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-2-tvrtko.ursulin@igalia.com>
 <b9a866ea-0f67-4e34-bb30-f8e297ee26f2@amd.com>
 <c3cb4df5-d6db-4cff-ba4c-c51f6503181c@igalia.com>
 <07ed348b-e8a7-4831-88d2-b53fcd07d5c5@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <07ed348b-e8a7-4831-88d2-b53fcd07d5c5@amd.com>
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



On 07/10/2025 15:03, Christian König wrote:
> On 07.10.25 16:00, Tvrtko Ursulin wrote:
>>>
>>> Please not in the header. Neither drivers nor other TTM modules should mess with such properties.
>>>
>>> That is all internal to the pool.
>>
>> Hmm IMHO it is not that bad. Especially that ttm_pool.c and ttm_tt.c need to have access to them. Alternatiev is a new header for internal helpers which sounds a bit too much. But if you insist I can create it.
> 
> Wait a second why is ttm_tt.c still needing this? For the DMA32 eviction?

Apparently so, goes back to:

680dcede2762 ("drm/ttm: switch back to static allocation limits for now"

Then there is the newer usage for ttm->use_dma_alloc from:

71ce046327cf ("drm/ttm: Make sure the mapped tt pages are decrypted when 
needed")

Regards,

Tvrtko

