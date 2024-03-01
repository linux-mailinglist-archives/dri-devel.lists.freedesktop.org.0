Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B124E86DFF5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 12:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15C110EC9D;
	Fri,  1 Mar 2024 11:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fdiFsW0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D98910EC9A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709291657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fEE62HUTb2Km+FBqYhB0pIcbLbRriFu9+pLa43NvRsg=;
 b=fdiFsW0OaE2DraRYOKG2eklcBGd9O6RxtDjm2HX3F2+5kaqQJrwrRSsyQ1PNfMyk2kfEGj
 0tPH0DsuZxnQNrbdx3PzJUusnBT2lGc+buepaEqGjEjPw/nUX3Zbhs/LhVGkfZzp4HiiTO
 v4Bqm5uX9aaW7ZxU0sl7RcdGkA4mAY4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-I3vPXzUROZyITpwtBLv6kg-1; Fri, 01 Mar 2024 06:14:15 -0500
X-MC-Unique: I3vPXzUROZyITpwtBLv6kg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-412ad75b517so9933395e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 03:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709291655; x=1709896455;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fEE62HUTb2Km+FBqYhB0pIcbLbRriFu9+pLa43NvRsg=;
 b=g+gF4g3ap9o5bRZCLUSQwX6xNLRqjcWowDSd28eJH7V6j1qOQqDA+V2yqPEom0P71G
 CSjBbF8V5KCJTM7Hya1KV6Qjl9xkoWGFaBW05M/xRhvp0qogTk9PYZJ8arkTKLGSnsDB
 pqLdd0qxP8cvA2MDYhYO5CvqpSvvWIUQ4zURipJcPBdNTj80CAKGqLiZDuvVNZcPAd7j
 HWBHQFtod3XakCVERt6TMgcBk5tPHV0O8P8Zmeh0+Zs4OZlAs2wSp3WCvirloUazcLF3
 4PpVAg/tT6BSSxTA4OzOXSKNFqUICQm/r5wB//7iGZ2PCgPF2npu4EJFyVoMw3Bwyhpx
 20wA==
X-Gm-Message-State: AOJu0YwGConUrTTvXJZRMAuBcuutuXF56vn7nuSce9OiWAILRxyZ+WOW
 0kV3bh4CGTMc4OCi+svujnNqgFLN4BYGVrSYW4yFq5G9LfsFTRL/zTqDZbabtvpRK07Ie2krqeB
 QOAcEdI0IsZe5fSRIzQvoe6GDxABXBeHG1zLc3VTWdrWa+oK6v0NmO8+BML9U621YBw==
X-Received: by 2002:a05:600c:46cd:b0:412:abe9:b011 with SMTP id
 q13-20020a05600c46cd00b00412abe9b011mr1239783wmo.25.1709291654801; 
 Fri, 01 Mar 2024 03:14:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX4vhWUpLzjqkUt2iL5RROANZ+KBN2JNGU+nOrrm8U1XZkHM6jXQJ2tnbKyKLklpLbECrcAA==
X-Received: by 2002:a05:600c:46cd:b0:412:abe9:b011 with SMTP id
 q13-20020a05600c46cd00b00412abe9b011mr1239766wmo.25.1709291654398; 
 Fri, 01 Mar 2024 03:14:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b00412a31d2e2asm5124244wmq.32.2024.03.01.03.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 03:14:13 -0800 (PST)
Message-ID: <266579a9-fde6-40ff-b13d-fb2312db406c@redhat.com>
Date: Fri, 1 Mar 2024 12:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [RFC] How to test panic handlers, without crashing the kernel
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Ogness <john.ogness@linutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Lukas Wunner <lukas@wunner.de>,
 Uros Bizjak <ubizjak@gmail.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Uros Bizjak <ubizjak@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

Hi,

While writing a panic handler for drm devices [1], I needed a way to 
test it without crashing the machine.
So from debugfs, I called 
atomic_notifier_call_chain(&panic_notifier_list, ...), but it has the 
side effect of calling all other panic notifiers registered.

So Sima suggested to move that to the generic panic code, and test all 
panic notifiers with a dedicated debugfs interface.

I can move that code to kernel/, but before doing that, I would like to 
know if you think that's the right way to test the panic code.


The second question is how to simulate a panic context in a 
non-destructive way, so we can test the panic notifiers in CI, without 
crashing the machine. The worst case for a panic notifier, is when the 
panic occurs in NMI context, but I don't know how to simulate that. The 
goal would be to find early if a panic notifier tries to sleep, or do 
other things that are not allowed in a panic context.


Best regards,

-- 

Jocelyn

[1] https://patchwork.freedesktop.org/patch/580183/?series=122244&rev=8

