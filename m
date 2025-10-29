Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EBFC1834E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 04:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FA710E6F1;
	Wed, 29 Oct 2025 03:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gE+3rtLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3D310E6F1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 03:50:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-781010ff051so4598244b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761709854; x=1762314654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwXYnLHll3c3mFZvlPqkbYLfqdqUZDaPqK+rO8VMv3A=;
 b=gE+3rtLqhb5zhVuKe2uDxTFcHy1tm6w/zI3JjdeDJWUSnp+ArMYCWmZCJrp7KLf1Fo
 Kmx0lkZ0+qy003rctqFZeAMfe9KmIVVNYYdyp4ud8fc6sL1IMRZsA8MlnHqnYGUcEZW1
 hQ7nsri5aBfQFAp+mcB57PvAXxG1Wyq67ZFsZwMq0EntHdtdfIctj86nVapq5kGLZbHa
 mO3pNtA+T5maXqw8Ysw5wSncR0ttnCOQ94np7nDoHiRK28kpN2CarUdMlrp5q01ePSj8
 JPudsDjvHJM+F3JSrcDBTQIaifEBNIhHF6aW2ENVxQroLeDS+iuEz0s/nXz1IVK9sSi5
 VwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761709854; x=1762314654;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwXYnLHll3c3mFZvlPqkbYLfqdqUZDaPqK+rO8VMv3A=;
 b=JqKmd+9gFmH7C8GXe6JJf/cBFsdNi4zAFCZ6FIppEgnTaJhCx6fvhWzFcg08H/Kw3Y
 ML/L/qz53gnafuRq7VJGxOM15dR4hL5ehzXHyR+klLfFoVa0X38SJq3rp3XEMxBNESXU
 wQZRgER09Z3r34ZIVfvekKbBq1iQj6JgHMlSoitorIyBqmCVTGwMAV5X21c+E+u+45ev
 XEGGw1U1WydKb3yNKIV0VpCqpTjAl37uPvW94q3zSUVDQYOmUf8AxzvjfHCQSg/a3nYZ
 SDNRjP355W1tQ5UhU2AHXe3Nd8asv4URqFZ+K1U1l2jzZMHBwGd8j2b2f0bg1914epuM
 /tGA==
X-Gm-Message-State: AOJu0YwunQo5wag+N1qWVUbvtG1qlkdn2vSogmxVYU/qjpLLYBno7eu2
 mepMnR09gHZdgSfq9l3sKODU9AQRYbRfLB3DpJ5n9d3DUe2LdamYVUAeYm0gpbHISRE=
X-Gm-Gg: ASbGncvqzS0mvCHI1L3ENBeCMhEQ3XEkzFHUX2oCdAgOcY2NU7P+H2ZoiyIQzoLY3Yj
 mBFnmDFEvsPI8zOq9yWGuy2TeRfVnTrf5A7jhUILllh4d48/6upoL5HnRUfNlZ89UhkvX2WpIs4
 qT3u3+TW1d2TpWMq2tRN7cL4KsjwTQGtdRt6j9mCaetvSg8Qq5hJpUxkUT/1UOEQgrJfSLzbw97
 yXr669Cw3OqX0Ws/0Vf0kjzWP8JbPZsc0iwGzcaiO5/gmmaRvVfoh17ubovSH/SRlSShCxGO5n3
 1FtEUsj3S7rATc/3nXRiEaTYK+YsLhm/KBv3/LD4ovrq1Ryb1C+Z/gUbO0wH7r23ZwpecUU/Jjy
 6YnV8/lFvU4eemLecmfKi73OAtcpFXj/zhy82OTrjJqqe1q/ThLkEgL9znvRJD42o9HKYLPHRlQ
 Juk3hLdhH9958+LMRHLw7ORWr/FkRu92qwo7w8L7qHI/vET1w=
X-Google-Smtp-Source: AGHT+IFZ2qDHNmI7HmZ3mZKfX113/QMKS8CLQWPjt/c9Tp5sY2iiMASjmfmEkRs+NEYMQl7jQAycFQ==
X-Received: by 2002:a05:6a20:3d10:b0:341:5e2:d354 with SMTP id
 adf61e73a8af0-3465323c289mr1608663637.37.1761709853972; 
 Tue, 28 Oct 2025 20:50:53 -0700 (PDT)
Received: from ?IPV6:2601:1c0:5780:9200:5568:45f7:ec26:fe8?
 ([2601:1c0:5780:9200:5568:45f7:ec26:fe8])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b71268bdd50sm12423966a12.0.2025.10.28.20.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 20:50:53 -0700 (PDT)
Message-ID: <e4882d15-1ba1-4521-ab52-365eeb7f77b6@gmail.com>
Date: Tue, 28 Oct 2025 20:50:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/vblank: Increase timeout in drm_wait_one_vblank()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
References: <20251028034337.6341-1-chintanlike@gmail.com>
 <2dae83e3-6fee-4e66-964e-c7baf46eecd8@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <2dae83e3-6fee-4e66-964e-c7baf46eecd8@suse.de>
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



On 10/28/25 10:14, Thomas Zimmermann wrote:
> 
> 
> Am 28.10.25 um 04:43 schrieb Chintan Patel:
>> Currently, wait_event_timeout() in drm_wait_one_vblank() uses a 100ms
>> timeout. Under heavy scheduling pressure or rare delayed vblank
>> handling, this can trigger WARNs unnecessarily.
>>
>> Increase the timeout to 1000ms to reduce spurious WARNs, while still
>> catching genuine issues.
> 
> Thanks a lot.
> 

Appreciate your guidance !
