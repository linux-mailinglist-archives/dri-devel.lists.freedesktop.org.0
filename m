Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864929C9187
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 19:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2ECA10E023;
	Thu, 14 Nov 2024 18:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GCWZIept";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E410E023
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 18:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731608222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VBxmOwoT0poWXTxRYS9IfqblptGD+HqiDdQqfClP8es=;
 b=GCWZIeptZ/AJ1WZCrVwHJP4tJlDcrGsi6HVfIRsyGDHOBGTSiWgbhdre7G/vpZiwDbBKFy
 ESqbvfxr/cPz1hnhL9jFi1BSikEHTHRJIqkutizsnW6V6CEXy45HjorZXvDOqtUcMhyI93
 FlCJwt8u8E8MA26RPAbBtnfxjbBHVik=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-dXFpQ-wGORymgC4P0XmuYQ-1; Thu, 14 Nov 2024 13:17:01 -0500
X-MC-Unique: dXFpQ-wGORymgC4P0XmuYQ-1
X-Mimecast-MFC-AGG-ID: dXFpQ-wGORymgC4P0XmuYQ
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d45f1e935so522659f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731608220; x=1732213020;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VBxmOwoT0poWXTxRYS9IfqblptGD+HqiDdQqfClP8es=;
 b=YHDebL7ikLN4/ybHQpQHuYGYzA183x57Cgrda8Bieh6krzSa052PQmRNbmamNP8OKp
 6gev0Xit+h69jBCNlWRTeVnTLTL4mSwOT6jexAfgh6IvBc9SX90gWnA5JxJ+YU4Q09XH
 keA/ipj3Ww2TbHkT/lCNCAIYtC7lNxrWVbrqeUjyCJVg9HoLxy55V9NVGw0Xb1GT8Tn/
 fiEbfszE1xXRgX79HbASxIvoKyiZOULRCOiX1nJQzSfH3nlfviGS5stAotxfmPWiZhSo
 PH98Jmc2R4n0uV0JW2/PBVjB3rR0q2bYtwJZ5Kvq/4JiYqlkzynMuruKuAz3YlV3Ngz1
 XTjw==
X-Gm-Message-State: AOJu0YyRBanzL62YJfNx5K+Q7nU+U9FJ/FgCp9ELWOpVA92VJ3FrorLO
 HZ03WetfcBVbpB3pqMJrQCuyWjpL+37Y9J5rxJVKhOmWseWORaN41YqTAYMbKy5p07Yv/Mqyrbc
 1nww6o4D+iRaTvPMJ0iFDXW/OTolZYMnBPzDnP/poY/zExGBRNA1765M0EA6fjg7yNKLo54+1fG
 iiyV7AR7HiOeV/s3z6f9r1Pd+H3CI+26d3ijVMrG1ZhAbVxcV+Ow==
X-Received: by 2002:a5d:5f92:0:b0:37c:cc60:2c63 with SMTP id
 ffacd0b85a97d-382184feec4mr2877805f8f.5.1731608219917; 
 Thu, 14 Nov 2024 10:16:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRKaS45PxBeLQhHQdSz9P8Asd8rXcgvTyAzC16haXuzLybnBvT73iW9MAtMAJ90XUcLtGthw==
X-Received: by 2002:a5d:5f92:0:b0:37c:cc60:2c63 with SMTP id
 ffacd0b85a97d-382184feec4mr2877772f8f.5.1731608219230; 
 Thu, 14 Nov 2024 10:16:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada2f25sm2155906f8f.9.2024.11.14.10.16.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 10:16:58 -0800 (PST)
Message-ID: <50709f0c-a5eb-42fc-9396-eb6d0db66518@redhat.com>
Date: Thu, 14 Nov 2024 19:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH v2] drm/mgag200: Apply upper limit for clock
 variable
To: dri-devel@lists.freedesktop.org
References: <20241111163306.860-1-m.masimov@maxima.ru>
 <a394af10-8428-4d19-84cf-f21ec63f23f5@redhat.com>
 <20241114-1e41c566600f3ef18943a36f-pchelkin@ispras.ru>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241114-1e41c566600f3ef18943a36f-pchelkin@ispras.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 10t0ZtlYJ9zKs2wRAaLwyG5lLFglD8UIKeX58qgsRsU_1731608220
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

On 14/11/2024 19:05, Fedor Pchelkin wrote:
> On Thu, 14. Nov 17:47, Jocelyn Falempe wrote:
>> On 11/11/2024 17:33, Murad Masimov wrote:
>>> If the value of the clock variable is higher than 800000, the value of the
>>> variable m, which is used as a divisor, will remain zero, because
>>> (clock * testp) will be higher than vcomax in every loop iteration, which
>>> leads to skipping every iteration and leaving variable m unmodified.
>>>
>>> Clamp value of the clock variable between the lower and the upper limits.
>>> It should be correct, since there is already a similar lower limit check.
>>
>> I don't think it is correct.
>>
>> If the clock asked is > 800000, then delta > premitteddelta, and it will
>> return -EINVAL.
> 
> In many cases when clock is > 800000, the check won't be reached as the
> division by "m" variable containing a zero value will have occured just
> before.
> 
>> With your patch it will instead configure the clock to 800000 which is too
>> low for the mode asked and will result in corrupted output.
> 
> Worth moving the check just after the loop or e.g. explicitly denying
> clocks > 800000 at the beginning of the function?
> 

I think it's better to check just after the for loop, if m is still 0, 
just return -EINVAL.

