Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ACD7E9915
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F6710E31C;
	Mon, 13 Nov 2023 09:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F4B10E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699868168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwJZ0Xbnvhf2lf2q1QxNyLQ6WK9A/m8KvfH5CYCBO3M=;
 b=fVB1YrLVbMsLYFLku00kWSvpjPG/DYS6xpEFNmHxb1t0U2IHZcpU4ODjJZ9oLu0s8UqeCH
 XKJV8qvQhaHhr2p41fUmCERATHil5Z8AbF+FICfz6oiDKO/46CE0xPxH1DN2rkifcGP8Xw
 mEfHiJIRVyUlyh0bThdIJHHQ2C1wO8M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-vZi3VHSmOx2RmbPh3jYskA-1; Mon, 13 Nov 2023 04:36:05 -0500
X-MC-Unique: vZi3VHSmOx2RmbPh3jYskA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32ddd6f359eso2035208f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 01:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699868164; x=1700472964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwJZ0Xbnvhf2lf2q1QxNyLQ6WK9A/m8KvfH5CYCBO3M=;
 b=ApzcGZvxi5CJuUeISmQzxN5u0Dv4u81tMW/geLuMaatqOuEFV6HiBDMAG6yT8gZGLJ
 Oa2imfJ1ri+ydk3OaO3/vxQsBxaCERqQpN8+obTxd84ZWV7L+TQmJqJ8nPZ8LrAL3i7D
 fXOhqn2D962MaNFJAc8cwCnAHpFzl25aROWUcx++krwv2JgVjUmb4bu3xmbKhaGGHqgM
 C8ylzJZ1xErqVcaAOZzSn2zTsMO7q/S9xPlaBR/0fHhUHWfap5ztAoY71Jx34JTXg41r
 2gSczXTPlw4oR7ffSo7sgXNZmUe4/ah+Ue0Kb/C5J17bMnMLTt5AOM+Y5zIYwbHRg6D3
 3Rcg==
X-Gm-Message-State: AOJu0YyLawdoHJg/5lzwrdRYqbbxQKqW5OYQE9hUpYRJlx0MDXDBRbdA
 t+DBqB7kAcqHLB86WYQYrV0oJ48iDpoCvJGwnsbN3nZWOO55eec+RGPzAHsVas2wnjm3c7CUwdf
 kXpwBc2Tp2T8NQ8mFQWfBlSBKTVSt
X-Received: by 2002:adf:d1c8:0:b0:32f:7d21:fd82 with SMTP id
 b8-20020adfd1c8000000b0032f7d21fd82mr3475732wrd.51.1699868164017; 
 Mon, 13 Nov 2023 01:36:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLGAlllr6+af01I7oixb2AlnKzkAe+EmipQrO095UcddK3SovOFEQ7UX3I/6FEprbQxEmEuQ==
X-Received: by 2002:adf:d1c8:0:b0:32f:7d21:fd82 with SMTP id
 b8-20020adfd1c8000000b0032f7d21fd82mr3475721wrd.51.1699868163726; 
 Mon, 13 Nov 2023 01:36:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 dn17-20020a0560000c1100b0032db1d741a6sm4729165wrb.99.2023.11.13.01.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 01:36:03 -0800 (PST)
Message-ID: <32a25774-440c-4de3-8836-01d46718b4f8@redhat.com>
Date: Mon, 13 Nov 2023 10:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Incomplete stable drm/ast backport - screen freeze on boot
To: Keno Fischer <keno@juliahub.com>, stable@vger.kernel.org
References: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
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
Cc: sashal@kernel.org, airlied@redhat.com, dri-devel@lists.freedesktop.org,
 regressions@lists.linux.dev, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/11/2023 09:34, Keno Fischer wrote:
> Greetings,
> 
> When connected to a remote machine via the BMC KVM functionality,
> I am experiencing screen freezes on boot when using 6.5 stable,
> but not master.
> 
> The BMC on the machine in question is an ASpeed AST2600.
> A quick bisect shows the problematic commit to be 2fb9667
> ("drm/ast: report connection status on Display Port.").
> This is commit f81bb0ac upstream.
> 
> I believe the problem is that the previous commit in the series
> e329cb5 ("drm/ast: Add BMC virtual connector")
> was not backported to the stable branch.
> As a consequence, it appears that the more accurate DP state detection
> is causing the kernel to believe that no display is connected,
> even when the BMC's virtual display is in fact in use.
> A cherry-pick of e329cb5 onto the stable branch resolves the issue.

Yes, you're right this two patches must be backported together.

I'm sorry I didn't pay enough attention, that only one of the two was 
picked up for the stable branch.

Is it possible to backport e329cb5 to the stable branch, or should I 
push it to drm-misc-fixes ?

Best regards,

-- 

Jocelyn

> 
> Cheers,
> Keno
> 

