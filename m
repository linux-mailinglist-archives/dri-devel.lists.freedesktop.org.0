Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCC53A24BC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 08:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ED46E423;
	Thu, 10 Jun 2021 06:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7517C6E423
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 512E93F5A9;
 Thu, 10 Jun 2021 08:49:09 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="I47zHcbp";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -0.201
X-Spam-Level: 
X-Spam-Status: No, score=-0.201 tagged_above=-999 required=6.31
 tests=[BAYES_20=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFkIKUqR9uWJ; Thu, 10 Jun 2021 08:49:04 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4A10E3F324;
 Thu, 10 Jun 2021 08:49:03 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1E8BC360190;
 Thu, 10 Jun 2021 08:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623307743; bh=ATSXdwbKqZ0EvIIAD5bdUyEWCcKJZOc77FW/gwqvJLA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I47zHcbplnz77yHDTnQFjnkgOolj4Q1hBbovltLK7Bm9phG6lw7eDS67GEjeOMN9t
 4UI2tmhidd1N3yTU9iLZlcyvZMliH1Cqc+9JbiWwVaczQkkVJp5vDszMRjoAEVI69e
 RvvNJCAIBZXs11eBkquEYyXzJdAZQKaADDMAN0gA=
Subject: Re: [PATCH 3/9] drm/vmwgfx: Fix subresource updates with new contexts
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20210609172307.131929-1-zackr@vmware.com>
 <20210609172307.131929-4-zackr@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <4c17b92c-2f06-13a6-95e0-45c419ec088b@shipmail.org>
Date: Thu, 10 Jun 2021 08:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609172307.131929-4-zackr@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/9/21 7:23 PM, Zack Rusin wrote:
> The has_dx variable was only set during the initialization which
> meant that UPDATE_SUBRESOURCE was never used. We were emulating it
> with UPDATE_GB_IMAGE but that's always been a stop-gap. Instead
> of has_dx which has been deprecated a long time ago we need to check
> for whether shader model 4.0 or newer is available to the device.

Stupid question perhaps, but isn't UPDATE_SUBRESOURCE available with 
SVGA_CAP_DX regardless of the SM capabilities of the underlying device?

Thanks,

Thomas


