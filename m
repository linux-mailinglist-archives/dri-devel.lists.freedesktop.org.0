Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD228BE725
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D404110F29C;
	Tue,  7 May 2024 15:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rno1cZgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E2B10F29C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:15:09 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41b5e74fa83so24780785e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715094908; x=1715699708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CnDKUzJ1K4d32Zvr481HYLHQmHX8rOjTCcbf7ypp6Tk=;
 b=rno1cZgOaoLlQfaLCnl0ekr7Qeg+LKya9rh9faFbz+DoV7A/wn6YffaG0HpP2NfKTX
 bgJ98VxEqB5B34kv1bKsRHXsp/7l8t8W3iIYYBe9vhXv62qzcZ9vn08B2ktAwAgVAa4A
 3wpryi+5JOL02lQSUTYQM4q7UEtfaPzvswwwfhDpCZwfTLTwrGzNhpG88KzaQIJp87BF
 ZrIbeImS9YGpBl3JJb7S7Z5PEMCDdgVFHwnhIkGsk6dn4Q6ywhrHes56SUkvZzAbexzu
 Dq4mjOjI0T+2e7PIWYjRjqD4rH4xh+xpIHBw8sqnmyRrj4T04upJ+ZSrsFlF2VzR6jc6
 5Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715094908; x=1715699708;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CnDKUzJ1K4d32Zvr481HYLHQmHX8rOjTCcbf7ypp6Tk=;
 b=QFP6ytsZ0GKVFzFIsdV1fivLkeW18Q4wIENb9U61I5wrg3dzKq2KgAVigaHDLn9qjH
 01hBa2cxGp+NLGDlvBybePb2cnLO99gjJqv33ITeZzWwMv4ai9Ovwyv0eAmrA0gDkC+I
 s1hky4rNc5eB2OryIxUZb+RxbtVPFo/fhf45m3VkQ/KMBIWFVnwEMKY1557QFsqSr7cF
 mqwcXUwZAMFoI8SuOJX8N2OAOUaCObqwdh+Loq9HIr0R96MDOJ8imqQwFL6nEXgdjtbW
 YQEbMrTpAAANFgH/3RGlacidS/CbB6AJG7vRzJmpytL18DzuktE5gQ+/Eh0WaIJ+1+ov
 pjCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSCef6RNFEhzXiXHJ+SbX5ExPOVjijLfd4JjqSMEutcS7oOHv8Z1shycCsNrlkVew0oAbCo+WYwcnyYHNBn7I4tRUn3TvGEbwyOI4OiFXj
X-Gm-Message-State: AOJu0YxRHUjcxlUFI5JScIbgcLIfYvldLjG/ZYRQ4II9SxFwV3LVOpis
 1l9jbQ13PqVFRonig1X+4ZQ86VlJDB9ey/14giM0Bb86uN1yZFU7AdhMU67yEOY=
X-Google-Smtp-Source: AGHT+IGlcCfFKvdN6aJzvhdwXvMxfsPlGA98qekQycZhIaKPKQlXQ9xf4cXeathWNzjqKmhDo4q4+Q==
X-Received: by 2002:a05:600c:511a:b0:41b:b77c:679 with SMTP id
 5b1f17b1804b1-41f71accb88mr961465e9.37.1715094907784; 
 Tue, 07 May 2024 08:15:07 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 g7-20020adffc87000000b0034d1fe44278sm13176378wrr.39.2024.05.07.08.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 08:15:07 -0700 (PDT)
Message-ID: <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
Date: Tue, 7 May 2024 16:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> providing data to VPU or DRM, then you should be able to get the buffer
> from the data-consuming device.

Because we don't necessarily know what the consuming device is, if any.

Could be VPU, could be Zoom/Hangouts via pipewire, could for argument 
sake be GPU or DSP.

Also if we introduce a dependency on another device to allocate the 
output buffers - say always taking the output buffer from the GPU, then 
we've added another dependency which is more difficult to guarantee 
across different arches.

---
bod
