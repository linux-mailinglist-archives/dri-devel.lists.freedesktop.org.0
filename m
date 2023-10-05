Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815377B9C16
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3570E10E1C9;
	Thu,  5 Oct 2023 09:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE1D10E1C0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696497380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mwgh+vb3m/Ae6g7xOqqQ/KxIog5axTPQFJabr5Z3VUw=;
 b=ELpaTEHp06KQJVdbDkW+MqoiA/sY8t/nue3+1j1s9mC/OyP+XnNVKmwvVT78pfjVPcbgNU
 PG56JLd9kJvFiMZkalguDm90DLYYPCKW8JTVDLGQzA5fQAqkABlnisjjXyWD4Pry76hEJQ
 b5HgvzVEeD7HOQ43JzIbnGPlLqsV73E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-9CovwboNNn2yHNyiehmsnw-1; Thu, 05 Oct 2023 05:16:18 -0400
X-MC-Unique: 9CovwboNNn2yHNyiehmsnw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-32480c0ad52so584744f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 02:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696497377; x=1697102177;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mwgh+vb3m/Ae6g7xOqqQ/KxIog5axTPQFJabr5Z3VUw=;
 b=vLb1XOWfimZ4TK32e/oy0IdA7uX5V/ks1V7l1CdUf0w1symrsrQyotuLab83KV0Rrx
 zZcW5eaLVUHIj/RPXVxge7R4fcLh6zgSDVxeS3wMAb7CeigLvdU14+diUVOm6elE74go
 0TktWLYOYPDWAWTDpiDf5rIiA7lR9exMYxChroY+KTVJpPWmicby4ZjRHSBqWREiyMHb
 QT2hAffMzIlZaF0DviRdIF2O5WtaK/U6GrJvSxTdgijDIYlZH1zscyhtUpKDAmsykyc4
 FgdQgv5jIL8BnU4EEf14J1crieyR1vQWB2r0mG+kiEgvH5ri+czZJKVktNjRipkTN+cf
 CDHQ==
X-Gm-Message-State: AOJu0YxWJsM/rFMONLbBkTz8MWHU71yGbXk2t0zvg7UgBclnebIBmc9J
 I47JFSXbmPAcvBIioKFyQMMCxGFWgaZNi7JqCcBk1uBqPubb2OaNOcn0RJVN8rFikD97ruZM50N
 C8cYSu12UI6JxIkERmo/zQCZl99/H
X-Received: by 2002:a5d:4412:0:b0:31f:db15:e9d8 with SMTP id
 z18-20020a5d4412000000b0031fdb15e9d8mr4433873wrq.3.1696497377050; 
 Thu, 05 Oct 2023 02:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEfwQ5dLDvDMS2c8UNRtmQ1xSrlSGNB/hDEgclrD9b7rXzVlGFrDJqb9ii0ApyjzaV+Z22vg==
X-Received: by 2002:a5d:4412:0:b0:31f:db15:e9d8 with SMTP id
 z18-20020a5d4412000000b0031fdb15e9d8mr4433854wrq.3.1696497376742; 
 Thu, 05 Oct 2023 02:16:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d4e10000000b0031fa870d4b3sm1305159wrt.60.2023.10.05.02.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 02:16:16 -0700 (PDT)
Message-ID: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
Date: Thu, 5 Oct 2023 11:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
To: Maxime Ripard <mripard@kernel.org>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2023 10:18, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 89e2706cac56..e538c87116d3 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -43,6 +43,7 @@ struct dma_buf_attachment;
>>   struct drm_display_mode;
>>   struct drm_mode_create_dumb;
>>   struct drm_printer;
>> +struct drm_scanout_buffer;
>>   struct sg_table;
>>   
>>   /**
>> @@ -408,6 +409,19 @@ struct drm_driver {
>>   	 */
>>   	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>   
>> +	/**
>> +	 * @get_scanout_buffer:
>> +	 *
>> +	 * Get the current scanout buffer, to display a panic message with drm_panic.
>> +	 * It is called from a panic callback, and must follow its restrictions.
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * Zero on success, negative errno on failure.
>> +	 */
>> +	int (*get_scanout_buffer)(struct drm_device *dev,
>> +				  struct drm_scanout_buffer *sb);
>> +
> 
> What is the format of that buffer? What is supposed to happen if the
> planes / CRTC are setup in a way that is incompatible with the buffer
> format?

Currently, it only supports linear format, either in system memory, or 
iomem.
But really what is needed is the screen size, and a way to write pixels 
to it.
For more complex GPU, I don't know if it's easier to reprogram the GPU 
to linear format, or to add a simple "tiled" support to drm_panic.
What would you propose as a panic interface to handle those complex format ?

Sometime it's also just not possible to write pixels to the screen, like 
if the panic occurs in the middle of suspend/resume, or during a 
mode-setting, and the hardware state is broken. In this case it's ok to 
return an error, and nothing will get displayed.

Best regards,

--

Jocelyn


> 
> I've said it in that other series, but I really think we should be
> having a proper state on the side to deal with those properly.
> 
> Maxime

