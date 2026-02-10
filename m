Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGUPJdT0imn2OwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01759118815
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E07910E284;
	Tue, 10 Feb 2026 09:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="HPBghLQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0C310E284
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:05:18 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so6591385e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770714317; x=1771319117;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OP3VbNx68VcllvOx/t4H1bQXdiTg3vSueeogLKpAveY=;
 b=HPBghLQAE4i7qEGi58HvUC2Xk8nyElZReT+pbQ8p3vGLhKVAUpBgrlBRgYQN1KvDDF
 CvTICyPMGdtcXQi0jTHLJBv8zrUSGOp0mww+2zc6KN0S0Jv1dOyqo+2+8XpTvqvGZbw2
 EcVYJziyNWVNhwo5Mu9c1CLDXPys2UVDKNmUADpe2NhxmMaiPp2apm8FEVDQGwDFvNfB
 zwNhCvc+LjGxmF9GUdGK9Y3apJ82PEDM3XZcVxAzZ1WdyTq+yytC3LuTz0gSbEpNCgqN
 ffRaYQgGK6T9XTE4ZYW95TVlohJKRNoBxHHpg4gbCOvElAw+GOrtWgQz4M+lJny4uam/
 H0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770714317; x=1771319117;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OP3VbNx68VcllvOx/t4H1bQXdiTg3vSueeogLKpAveY=;
 b=LNqEwtwHbPXHv2Lizs/39SX4TJYcUQZR7SL5ORKdBLHuV94nr/s5kldutipq0lol1N
 /Yw9q7f3yHg8a2BTARIvvNsgQGpp9I1dFWUKLsFK7G4SCFl4M1iKl5+XuvgqKE71FHMN
 j7RH8IbNcVt62a0chHMuCyBqr6xXzPSi0Zjq6hOsKCFksgNaq17iGLGTf0gX7lwF9Or2
 soWpcWWjg1US+DZAaWyykPcvYRGHkipb6bcWAkOUhHgGTrDyBmS9gFLKg1RZEypAJijN
 JxjeHKwk9dUhbcHQmksZXvjp5StxbdGtoipm8232KXLhKnVexgas/jDIV1Ga4X+0nB+p
 o56A==
X-Gm-Message-State: AOJu0Yxy6hQctr7FWXE05vDwZ55QAnTrr4wOKybmXwbcx5KUx0rF7fHx
 UQVvBxdclB0gDnlfxoFQ6JrOgp3SeOVP+F0X/fjj065ypiIQqjytcRXtr18tHclUEyk=
X-Gm-Gg: AZuq6aI6tjsQXlLU4l0NI/2ShtEd8jKuuRzbYhXc1/q+T7yBEmDO8ABiXTbrvohhZXs
 Eh1qDLhUMDkj0jReB5J2GSIsk4j8IVfu3Wg0m8+oRbx2JPK06W3Fa8KLgFxzvb8S65S3AnMgKm1
 37+hvibkqALx2eABPzZqrDYNMIMBStrFw86wx2EjnBxK4tYfx4FUKffMd09xNtSjt630bYisg1i
 vkLmjDlygPEWQwZqxpaOes9cFsUJ9C2zVVp96RjPVYROJEQzG5csBVU7P1Fo4CUi0DbHQudpSZ4
 mBou+fQmQO0llezu2hrJIe5wQCRO6LI2e8PXfkTzGgqodcHTtkGMycqQJByvIzvXEWkBqizeH+R
 uH5M+DEcaE00sXc2gz7Vk9nDyIJiB3Ez+aGBrnBZKu7RN+G3tft3LiKWI2cNHKKR4Tgr7och35x
 ZjNBEfjQKElOqdkF59B0iF5UK87SMKhTZQZQQ=
X-Received: by 2002:a05:600c:674f:b0:471:13dd:bae7 with SMTP id
 5b1f17b1804b1-4832022aee5mr181770665e9.30.1770714317119; 
 Tue, 10 Feb 2026 01:05:17 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd4desm32761634f8f.18.2026.02.10.01.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 01:05:16 -0800 (PST)
Date: Tue, 10 Feb 2026 10:05:14 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, 
 leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
Message-ID: <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 01759118815
X-Rspamd-Action: no action

Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
>On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Currently the flags, which are unused, are validated for all heaps.
>> Since the follow-up patch introduces a flag valid for only one of the
>> heaps, allow to specify the valid flags per-heap.
>
>I'm not really in this space anymore, so take my feedback with a grain of salt.
>
>While the heap allocate flags argument is unused, it was intended to
>be used for generic allocation flags that would apply to all or at
>least a wide majority of heaps.
>
>It was definitely not added to allow for per-heap or heap specific
>flags (as this patch tries to utilize it). That was the mess we had
>with ION driver that we were trying to avoid.
>
>The intent of dma-buf heaps is to try to abstract all the different
>device memory constraints so there only needs to be a [usage] ->
>[heap] mapping, and otherwise userland can be generalized so that it
>doesn't need to be re-written to work with different devices/memory
>types.  Adding heap-specific allocation flags prevents that
>generalization.
>
>So instead of adding heap specific flags, the general advice has been
>to add a separate heap name for the flag property.

Right, my original idea was to add a separate heap. Then I spotted the
flags and seemed like a great fit. Was not aware or the history or
original intention. Would be probably good to document it for
future generations.

So instead of flag, I will add heap named something
like "system_cc_decrypted" to implement this.

Thanks!
