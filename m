Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BEE6D4B62
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEB410E4D3;
	Mon,  3 Apr 2023 15:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E601D10E4CE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:07:20 +0000 (UTC)
Received: from [192.168.2.163] (109-252-124-32.nat.spd-mgts.ru
 [109.252.124.32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D210F66030F1;
 Mon,  3 Apr 2023 16:07:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680534438;
 bh=BJ0rhRc9niR6251Zs1LeEbn51nnEzPsY8IYv6hl3WEU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Gj4QTf52O23oWVQTDoPfhHBcaSM60R7JFwdcDkcwdy7ae+qLGtaL5d9E8EcLsGGku
 9S0+pw9We4NkcMyWa6a9AK1Y/Dmu7hbMkEjORRJ0jJAZ/TNPizWGHbKLKdvhS0pAHW
 YxRugV5unfDHoUMNZ26K96FTUITMxYpvAjGADzSRLD/eGeHqEZ2EMkCsqcrk7P7qNT
 DgTLIjAUX6fiDmT0+efn4ECpKTUAl6bk8ddGYIr7lKcXHXpjSKroGT71TZzlsKWOGF
 Tdj03ICtv4vXOh5jWEug3EySPJsRcY6UWK/W5vAOajHQghHTHff5FF0XfjgBHHGvKQ
 /iSxlYPxQuFnQ==
Message-ID: <d3f27ec6-bf80-ca18-9704-caf5008aeb3f@collabora.com>
Date: Mon, 3 Apr 2023 18:07:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 2/2] drm/virtio: Support sync objects
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
 <20230323230755.1094832-3-dmitry.osipenko@collabora.com>
 <ZCXF4q81wPcczkqx@arch-x395>
 <3618a293-4f61-b076-0a9c-c70812436431@collabora.com>
 <CACvgo51GWRCQuiJDVrqo=xzd3frKvs6WNcc755pbu8jNk6t-Rg@mail.gmail.com>
 <CACvgo53bkvDm7CXN_zFETZeuWas50tJys6u+nc5DO_MWK4SZfw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CACvgo53bkvDm7CXN_zFETZeuWas50tJys6u+nc5DO_MWK4SZfw@mail.gmail.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/3/23 16:22, Emil Velikov wrote:
> On Mon, 3 Apr 2023 at 14:00, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> 
>>>> I think we should zero num_(in|out)_syncobjs when the respective parse
>>>> fails. Otherwise we get one "cleanup" within the parse function itself
>>>> and a second during the cleanup_submit. Haven't looked at it too closely
>>>> but I suspect that will trigger an UAF or two.
>>>
>>> There are checks for NULL pointers in the code that will prevent the
>>> UAF.  I'll add zeroing of the nums for more consistency.
>>>
>>
>> Riiiight the drm_syncobj is attached to the encapsulating struct
>> virtio_gpu_submit _only_ on success.
>> By clearing the num variables,  the NULL checks will no longer be
>> needed ... in case you'd want to drop that.
>>
>> Either way - even as-is the code is safe.
>>
> 
> Err or not. The NULL check itself will cause NULL pointer deref.
> 
> In more detail: in/out syncobjs are memset() to NULL in
> virtio_gpu_init_submit(). The virtio_gpu_parse_(|post_)deps() will
> fail and leave them unchanged. Then virtio_gpu_free_syncobjs() and
> virtio_gpu_reset_syncobjs() will trigger a NULL ptr deref, because
> they are accessing the elements of a the (NULL) array.
> 
> Apart from the num_(in|out)_syncobjcs=0, I would drop the NULL checks
> - they give a false sense of security IMHO.

The reset/free are both under the NULL check on cleanup. I think it
should work okay on error. Will improve it anyways to make more
intuitive. Thanks!

static void virtio_gpu_cleanup_submit(struct virtio_gpu_submit *submit)
{
	if (submit->in_syncobjs) {
		virtio_gpu_reset_syncobjs(submit->in_syncobjs,
					  submit->num_in_syncobjs);

		virtio_gpu_free_syncobjs(submit->in_syncobjs,
					 submit->num_in_syncobjs);
	}

-- 
Best regards,
Dmitry

