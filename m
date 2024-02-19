Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF3185AA77
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 18:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8A410E2C1;
	Mon, 19 Feb 2024 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hL2FC/PY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9810E2C1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 17:59:06 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id c7uwr4K1Rb1Jlc7uwrZn6h; Mon, 19 Feb 2024 18:59:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1708365545;
 bh=ti6upGoRyyrC2hvsjOkpJVRvXntoJTVQ7/Zs/uqxjT4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=hL2FC/PYBaouzvlBBq79Hga/FRp5lg0G/W0pv0oEN7ZYTyC6Gf3gvHnHNw0Chyxy3
 FEBM012Ssb3ZtdercwRyvz8fiFGb/WOFilLBBKWlE//OA8lgUKJ9csKadViwxkI0ry
 t6h6RUTjQLA0vzgEG5S5pymbbZLTHLuX45NWMKnn7JTrIbTkZXPIGrjWBufil8a87Q
 Q3EbREOG9yH1CFM3FTepq/D7O8VcQnCYZiD+AsuA4vqGnDdep+v7gGh2yhnrYRnUUH
 bJSAvWeNGVO49Iznz8JoOuCSirJw5+4S/PA0MLr0oSlnvzzprX0Ji6NcET/oWbYYCw
 mFmzV1c/a833Q==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 19 Feb 2024 18:59:05 +0100
X-ME-IP: 92.140.202.140
Message-ID: <3fe4c327-b69b-464e-8e4e-005fa1813279@wanadoo.fr>
Date: Mon, 19 Feb 2024 18:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
 <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
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

Le 19/02/2024 à 09:37, Dan Carpenter a écrit :
> On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
>> If 'list_limit' is set to a very high value, 'lsize' computation could
>> overflow if 'head.count' is big enough.
>>
> 
> The "list_limit" is set via module parameter so if you set that high
> enough to lead to an integer overflow then you kind of deserve what
> you get.
> 
> This patch is nice for kernel hardening and making the code easier to
> read/audit but the real world security impact is negligible.

Agreed.

That is what I meant by "and unlikely".
Maybe the commit message could be more explicit if needed.

Let me know if ok as-is or if I should try to re-word the description.

CJ

> 
> regards,
> dan carpenter
> 
> 
> 

