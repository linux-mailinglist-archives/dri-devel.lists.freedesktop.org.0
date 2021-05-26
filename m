Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA10391E23
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 19:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AFD6E155;
	Wed, 26 May 2021 17:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53106E155;
 Wed, 26 May 2021 17:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 816D13F932;
 Wed, 26 May 2021 19:28:20 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="KSabvbkf";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_65Hibwksvd; Wed, 26 May 2021 19:28:19 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 690EB3F475;
 Wed, 26 May 2021 19:28:17 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 24193360132;
 Wed, 26 May 2021 19:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622050097; bh=4J2kZzByjsumcGN3Bm+D3qWLv6gtQhLXx69MM206+3w=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=KSabvbkfj3/99aQJiW3U05OsraDPCFrS3JKWUo9Eq5yzkAqHdXo910N4kWVtrTrCz
 BoVNtaLx3kWUVpLOOsW0OLNaYvKwu05pUncOGpmHCwgRoGXQDaI0wqO1SCf7Lkypcv
 +oeAy4v1U6EkbYksgIkMwjsQTkGLzj1wMpjGW69Y=
Subject: Re: [PATCH v4 13/15] drm/i915: Disable mmap ioctl for gen12+
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-14-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <49960df2-6bd2-81f5-ab09-1472ee7e1827@shipmail.org>
Date: Wed, 26 May 2021 19:28:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526113259.1661914-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/26/21 1:32 PM, Thomas Hellström wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> The paltform should exclusively use mmap_offset, one less path to worry
Hmm, Thought this was fixed, but s/paltform/platform/
