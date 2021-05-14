Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B8380BDB
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08976EE93;
	Fri, 14 May 2021 14:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CF66EE93
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 14:32:42 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lhYro-00055x-Ff; Fri, 14 May 2021 14:32:40 +0000
Subject: Re: [PATCH][next] drm/vmwgfx: Fix memory leak of object fifo on error
 return
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20210512195609.298326-1-colin.king@canonical.com>
 <20210514143053.GB1955@kadam>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <4db89279-4023-d35d-ae53-d29947c53b3e@canonical.com>
Date: Fri, 14 May 2021 15:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514143053.GB1955@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/05/2021 15:30, Dan Carpenter wrote:
> On Wed, May 12, 2021 at 08:56:09PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> In the case where fifo->static_buffer fails to be allocated the
>> error return path neglects to kfree the fifo object. Fix this by
>> adding in the missing kfree.
>>
>> Addresses-Coverity: ("Resource leak")
>> Fixes: 2cd80dbd3551 ("drm/vmwgfx: Add basic support for SVGA3")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
>> index 027d7d504e78..e5fa210f589e 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
>> @@ -107,8 +107,10 @@ struct vmw_fifo_state *vmw_fifo_create(struct vmw_private *dev_priv)
>>  	fifo = kzalloc(sizeof(*fifo), GFP_KERNEL);
> 
> This needs an:
> 
> 	if (!fifo)
> 		return -ENOMEM;

Doh, I completely missed that. I'll send a V2. Thanks Dan.

> 
>>  	fifo->static_buffer_size = VMWGFX_FIFO_STATIC_SIZE;
>>  	fifo->static_buffer = vmalloc(fifo->static_buffer_size);
>> -	if (unlikely(fifo->static_buffer == NULL))
>> +	if (unlikely(fifo->static_buffer == NULL)) {
>> +		kfree(fifo);
>>  		return ERR_PTR(-ENOMEM);
>> +	}
> 
> regards,
> dan carpenter
> 

