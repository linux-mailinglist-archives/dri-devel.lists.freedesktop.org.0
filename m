Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD37DC2A1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 23:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C810F10E3A2;
	Mon, 30 Oct 2023 22:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A1110E3AC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698706232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFIy3mrzBP77lv0o67y8anB8EGeOmt6BTfEU9kCMXz8=;
 b=flYsFNF1ycpY1i3NWoplivA8l0id1T6gJejCq/iFh3W2n6ecUVa89hiM9pn3p6Rhg8bl2x
 RrG398FG+v401vXQfs1LHbP/gY21xNlNXiEHuBYmMpx56XxgRkt6ZNUj/JaUQ6XK0jcBKO
 SLMGMIoYMJTZD6sqjb0BirkYFqa/mpA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-1cdlmfrEP7yn17jb5igCYw-1; Mon, 30 Oct 2023 18:50:30 -0400
X-MC-Unique: 1cdlmfrEP7yn17jb5igCYw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-53e169d2e80so3721201a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 15:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698706229; x=1699311029;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFIy3mrzBP77lv0o67y8anB8EGeOmt6BTfEU9kCMXz8=;
 b=qUVgfE+8jlfKzJ/1fIeiLR4ocu7Csb8cfUGSjL5l3NlO/77OnrhT8kD1gPIOZaDMY+
 Yhj7h7E/43fSf620PF2tNAmxaQjdzi8sjH4NWvu4Ultj7ZYxfdbXZo1gXX/gLiWYurAY
 9A3Hw3PyFOIGAA1qooatiAMkMFKkgX3auOwSRUoq9kqaysjk5INUDO5OaJ9eghgrBsOm
 /yhJHRD5yWN0Aco5RFJw9OQW/VFFHiFVROXPN90VHfZhLPt6l5rwQRFyS8pItE9LbeDS
 uzHdyUTy6AoVCO/RO0IT2YDMqO6xWjRn4d2O3Cg/7/0LryUOHnht5TnI6KcXRMDDzHeS
 kEew==
X-Gm-Message-State: AOJu0YwHQ4KjrB9nf6f6LXk/Z6qxfNKUCepikfOKa+3JLetF2bqp1Gzb
 sJr/mu8K5M5o77TXElwHTK9Tp7GkgIf62Mugl2DmOLz15oluidv/qJPs5vw1zq7kmD3QqP8JOYE
 CotQP9dFRyqBIQu56CxBaGdNUilVC
X-Received: by 2002:a05:6402:792:b0:53f:ba1a:800d with SMTP id
 d18-20020a056402079200b0053fba1a800dmr8972549edy.14.1698706229452; 
 Mon, 30 Oct 2023 15:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXVa6xXnv4xm7nzRODa4K0L/qogA0P532Unb675Vmd8nQAwAdbKc52UcipCoZLFPDO/rUYdA==
X-Received: by 2002:a05:6402:792:b0:53f:ba1a:800d with SMTP id
 d18-20020a056402079200b0053fba1a800dmr8972544edy.14.1698706229138; 
 Mon, 30 Oct 2023 15:50:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056402345200b0052febc781bfsm105445edc.36.2023.10.30.15.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 15:50:28 -0700 (PDT)
Message-ID: <ed2ebc81-9370-4c4a-a824-0b58eae057e6@redhat.com>
Date: Mon, 30 Oct 2023 23:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] [PATCH 1/2] nouveau: fix r535 build on 32-bit arm.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231030012814.1208972-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231030012814.1208972-1-airlied@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/30/23 02:28, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This needs the proper division macros.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> index 14a67cf96204..0f9b8087d5e6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> @@ -267,7 +267,7 @@ r535_chan_id_get_locked(struct nvkm_chan *chan, struct nvkm_memory *muserd, u64
>   		return -EINVAL;
>   	}
>   
> -	chid = ouserd / chan->func->userd->size;
> +	chid = div_u64(ouserd, chan->func->userd->size);
>   
>   	list_for_each_entry(userd, &fifo->userd.list, head) {
>   		if (userd->mem == muserd) {

