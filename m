Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLaIOV67hWmOFgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:58:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD91FC569
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2814910E028;
	Fri,  6 Feb 2026 09:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="ZrKy/Eck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AB710E6AB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:58:50 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so521427f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 01:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1770371929; x=1770976729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YtlKAacdj6VcSmvmFka6uFTtg4j2LxBgXZgRH4Au+E8=;
 b=ZrKy/EckNAYXq7+jTLdRMc/A/M+50Y5uIiFcTCey/O4UrB5yaZKT+Fn62j7MNg1dmm
 K3hxbELukMbXH+nLXZ7q96MkHMeGpCwlhwl8QV6+rVzFqIe/FASZTRf4zCR7Ke/4Mhxt
 p1rDzYsjePsGuS16kLclflUcXI8rQrxqNr+o5CJDmGduaW6aVnNxUW4lovZ+0FnEYwD2
 sswh9gpXs0HLMEY+c//uhorfhIaWoPpn1BKCIz8JicrnM73g/rWglv9w1AOrXrLZstSs
 fyNjY3zS5ku9FpsmQk1f4p5GlbvqZBTMtSGq8db9qWLwOoMDeLu+V1PM3sqBNsCn3Mxg
 iZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770371929; x=1770976729;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YtlKAacdj6VcSmvmFka6uFTtg4j2LxBgXZgRH4Au+E8=;
 b=lPtQTlAdK1fxYg4oMl/2GRIX++dqtZ0JbeyTU3VZ9JDZ5guIsttahFf+Ugo0RGbWoo
 qx6TyTMYF/V9htaBRTf8ho4vZPsTkgRKQxaBipp42LjVVulfU7CUvhC7WXKlqNOhjiS4
 FlUhq7fzeGGtsQvB8hlZs8iU8DIY0WbBoW90gWrh8digvK/SFTG5+zsmnXqLURaphRVr
 KfEdzOJoRmmEh77TUb0rAfX/ILEREgQhgie+F1xBlkAAvdmc0u8405WVwWL+79tCAzLU
 IBLvAvQ3PT+LhLb1qGwPq39YlqXIRejypmTVOwyEQX8IMTnh5NxJDM/ZKmExskau9h1H
 5UWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0NZRVyHeqYU6K1uAyPiEKMnrG267l8+eaIhm0S/jVYJEsMeUikTJSZlqAmy7LaVox4exegU3XfcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywp1IVDijYSkhzI5vh3qfZ12nDaCu0scA8hQTApcWrucgxAzGd1
 4JYhsxwyUoaJ1IUlkBops+l9kwUgUYM1wAEfqLoPpqguCyk5ImVydMJgdKZH/O7a38U=
X-Gm-Gg: AZuq6aI5mHsrOwXF2MsHICezHhjasYLf73+rByP1mhYT6ylO3A4bFAVAR0d+bsNtoV/
 Vo0kKbOMXJGQ1HbrtobGiOI//Rkv4l6buVmYJBo+bL8wU1AigjqdAZzm1lbB6vEw//jrCMZhP7x
 SBQGzKIrBqXMs84lskOHZw5X9x7xFxCJGAXSJbIVbtNnMjXK6WHIfz6S5fAhsEk44wPHyya1AyZ
 eRGbDkPTvRu5bG1msK8QQEpil9Cu4rm0p5wcqTk0MROJTmNzkFkvJGULcc/raADw5uWl20HZMDM
 WkqN5AzE2jGyzKBjQgZtD2KxCfi/OeWsBcWXjwVAUTWAgFZMTjayHJbqR4Q7bZFgafgq9O5bO0g
 13+wCsXREjLk+2HtrlIabSPxic9L73BxURFzkSRScbOSMJsvMOY/649lCvXE9W4EMxfeuZYJQ2A
 2mtpKwkYJy8m/yzJO8b71oXedG7Mbgihnk
X-Received: by 2002:a05:6000:2f83:b0:435:a815:dd81 with SMTP id
 ffacd0b85a97d-4362933be7fmr3262071f8f.11.1770371928385; 
 Fri, 06 Feb 2026 01:58:48 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bdc11sm4532703f8f.14.2026.02.06.01.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 01:58:47 -0800 (PST)
Message-ID: <a56b7e43-f499-4b52-bee1-15f7087057e0@ursulin.net>
Date: Fri, 6 Feb 2026 09:58:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Accelerator/GPU top
To: Alex Deucher <alexdeucher@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:David.Francis@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,ffwll.ch];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:mid,ursulin.net:dkim]
X-Rspamd-Queue-Id: 8AD91FC569
X-Rspamd-Action: no action


On 05/02/2026 18:58, Alex Deucher wrote:
> Has anyone given any thought on how to support something like top for
> accelerators or GPUs?  We have fdinfo, but using fdinfo requires extra
> privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
> way to even discover what processes are using the GPU.  There is the
> clients list in debugfs, but that is also admin only.  Tools like ps
> and top use /proc/<pid>/stat and statm.  Do you think there would be
> an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
> This would duplicate much of what is in fdinfo, but would be available
> to regular users.

In short yes, the inefficiency of the client discovery bugged me since 
the start of fdinfo and it was discussed a few times how to improve it.

AFAIR in those discussions a lists of clients outside of debugfs was 
mentioned, since that would allow the cost of discovery to not scale by 
the number of irrelevant processes. Something in proc was also mentioned 
but I guess for both no one had a strong enough drive to actually do it.

Challenge will be finding the threads to see if there were any 
interesting conclusions... The only one I can remember at the moment was 
this:

https://lore.kernel.org/dri-devel/20240403182951.724488-1-adrian.larumbe@collabora.com/

It looks this attempt died out due proposing a binary interface in sysfs.

In any case, I'd say it makes sense to do something.

Regards,

Tvrtko

P.S.
Just in a case you did not see it, a generic tool exists as gputop in 
IGT but as you say, you can only see data for processes the user running 
the tool can read fdinfo stats of. And there some nicer tools feeding of 
the same data.

