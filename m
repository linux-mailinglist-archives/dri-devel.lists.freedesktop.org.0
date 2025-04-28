Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E751EA9F04E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 14:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3049C10E47E;
	Mon, 28 Apr 2025 12:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="OdTz9j58";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69A010E479
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 12:09:49 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso3198777f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1745842188; x=1746446988;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/JmJKZuEpq5UN0wmEtOpCzeCBmpLeQy7dV9yrtIP3UA=;
 b=OdTz9j58xRxzkjo3Ip09B1TK8iA/A7OMDK+AYQvB13g7LtRqjNbB1p4kjsB6DtK9EZ
 4piQzAfcqncn8Q8p5o+Y0BzK6PxdoxpWBuEEzspprrJhqXtJojpBgZ3MEw6I05mNpEJ3
 rUfpmoH3lH2n6JAEuBVkIzglgjruvg0g5/hj6uKBhz9Y2ZWz/gsxFnHP/LaNdYGm4MeB
 1UQSJutpXcNy23/0GcH7vpHuRAMgDKDibdpHcfotQiZ19NlEvr8kAis8GHf1JsbwaFNI
 8ndWytTlD5xs0d/u7MnrX/Zn9UNJlfL0/mzN1tZbwBn/ZIoYjL1t6orw5d5FDqXxLR1m
 +cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745842188; x=1746446988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/JmJKZuEpq5UN0wmEtOpCzeCBmpLeQy7dV9yrtIP3UA=;
 b=UccCMTrQBNWAEcdl5MIESE/VGYp4h+nXkGpk2kdNaDItU6p3OHgx9vuXTcETzSNaSW
 tHjYA4DvjpYjIMvYcXTN5iDRlJQu0IqKI5M7DWYpnsDkkyZir32KqkNKjKGRJ++pb0OW
 fpuQjx4fNswSxSusetLE/gj8g8O5AEtcGH00GNKS3QaVlbdyDasudJeUgCTh10DcXDVb
 92zzCrEEDBTuibFD50ISx9SQGu/KCHtokGEgBieLBp/p7AutPvwD4xH+PFovHuBHUUJa
 tmTQiuT8fEgrLonaI2fOOzhdLUxDThaj8sBnQsbiuUkEDIKSRh5kBmnqDMGqRwb9C9uh
 iE+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEUeDxbbmFostbPUeaNF7f2Ua35Mb/7DUCOhlIXtSERqgcc0OOA06e0pt+veZKocz9Rcm2kNCy5Gg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVU6znWoHR2xe1MTWUsLZ1N0/otP6EdBROsXXLq+TUxJnbwLGG
 7Bw5OEXLQ34f86RtKSaZbzpbB6eftlbJ2NJkD1Sc4JLwNo6crfnzI4+B0RDkW9A=
X-Gm-Gg: ASbGncvqDDxxNgQIzSsFqfwGJmVw0G2B1v5kIm8MTLa3zw6EZPl8PGSybEg4rVUd1QW
 O9oEha3Jf0vfq3danSwBx8dj38ReXeNGQzn4C2T9bDkqFJkG06cH3rEwToAkmnVwsMwOmWexU8J
 l2HFyqd35V4QLm6eB0Mez+TM5sOJUvsgRnbbIsOytE3OMebEt+uKXH1rxQSTOOQtfGkBafjc3XI
 b6MpROnqBDAYNd9+iPSHZvmtsweEYQXhIC3dCsF6NTNGFyh6JEfFDS9OuI2+NArAFXE05XrAkw0
 q4DANdnGgdVRtSxxNJvk3uS449V6JWYYVANankVn0By/zAkO94tipFY=
X-Google-Smtp-Source: AGHT+IHqEv8cFeHZNO066YOoWB8BFD6tcgESusNCDp7OcqCCqOLYefsxt5CXNgjV3wL2bS4dyhsh5Q==
X-Received: by 2002:a05:6000:1a8e:b0:391:3b11:d604 with SMTP id
 ffacd0b85a97d-3a07adb1d30mr7133747f8f.54.1745842187842; 
 Mon, 28 Apr 2025 05:09:47 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2d88cdsm153399285e9.25.2025.04.28.05.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 05:09:47 -0700 (PDT)
Message-ID: <7f1ad610-5a37-4f74-8eee-5f37556d9576@ursulin.net>
Date: Mon, 28 Apr 2025 13:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Remove const from struct i915_wa list
 allocation
To: Kees Cook <kees@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gnattu OC <gnattuoc@me.com>,
 Nitin Gote <nitin.r.gote@intel.com>, Ranu Maurya <ranu.maurya@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Angus Chen <angus.chen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Yu Jiaoliang <yujiaoliang@vivo.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250426061357.work.749-kees@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250426061357.work.749-kees@kernel.org>
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


On 26/04/2025 07:13, Kees Cook wrote:
> In preparation for making the kmalloc family of allocators type aware,
> we need to make sure that the returned type from the allocation matches
> the type of the variable being assigned. (Before, the allocator would
> always return "void *", which can be implicitly cast to any pointer type.)
> 
> The assigned type is "struct i915_wa *". The returned type, while
> technically matching, will be const qualified. As there is no general
> way to remove const qualifiers, adjust the allocation type to match
> the assignment.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <intel-gfx@lists.freedesktop.org>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 116683ebe074..b37e400f74e5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -156,7 +156,7 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
>   	if (IS_ALIGNED(wal->count, grow)) { /* Either uninitialized or full. */
>   		struct i915_wa *list;
>   
> -		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
> +		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*list),

Will the sizeof stay, and if so, how will kmalloc be able to distinguish 
the type? Or we expect one more churn on the same line?

Regards,

Tvrtko

>   				     GFP_KERNEL);
>   		if (!list) {
>   			drm_err(&i915->drm, "No space for workaround init!\n");

