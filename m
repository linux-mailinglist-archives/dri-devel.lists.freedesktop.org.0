Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B7C256A3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAF410EBBF;
	Fri, 31 Oct 2025 14:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="N0j2r3SI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF36710EBBE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 14:04:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4283be7df63so1183227f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761919489; x=1762524289;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EvtlwaHzYZFon2EgJ07/XN/tqKyRiHx0hAYzd9XK+Ng=;
 b=N0j2r3SIGpNRBh+G294wlVgWH/VK9LhtHzh0cI1jwTOoLtKQJ/6vdUkploU7nvBugV
 NT/jTwf5NnLF7STtE4AN2qRez2Ytjy/iGYLB49Ufq7ob5E45+2TizJkitLRpM3aZEpMG
 e2ZiTIaR6zpOKFjhcDMVTfSY1UD6AqCZeq6hUF0LSQykdvQmKlzfMoM4OwrgtpEgPhHR
 CKNWbod5JR9bi7MQRdiCjCKAF4nWfNId+p7aCLof+TxqULF267/+lY0epBFjn/tnR/JN
 Ztnu3h+yWZLuh1XGtJNN/+vnm89PWqlt3p8R76lm+5IcavCWFHZCaqeyzEO1uwzjeg4G
 5kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761919489; x=1762524289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EvtlwaHzYZFon2EgJ07/XN/tqKyRiHx0hAYzd9XK+Ng=;
 b=cHfaMEj0utvGbBEBV2vEahDOrbh492ioEufoaW8rqrfFm23aW0h81X2nZo8dNc00ko
 jrNH8SNF65LqO1178c0+8zwUnpOQMHrhDqKPksL+2pYTvF57TXjk4AP4suwQZuSJOisQ
 Y/t3hnz/q1hs6A0VENyMNdbrRVL+I5ArGu5xUMyQzakIBAk7ieaO3h+mWBIYqWmcZtLM
 tQCl2W0l+agYy8h/m2KJMe/eZ4VWNx18xlDLqLaYeIwX2WYsONCWISgwoMiM/tDMJ3LJ
 rtf4ENdVLlKtH5IUh85z4a0T3/01lJ75eJg8maheO4xr4LXFbcQVRpTK310Dm7k5c5yf
 ttJQ==
X-Gm-Message-State: AOJu0YyafMTPu7T1jnClJ0wyaEDpIQRq+f3xURZDXm4DByftTbxhJe7e
 Z9Ifz9YhD2jEDvkhx2CRIP9gS9fwt4SGZRdusdEu/97qVmxO5Km4Pj+dEDtkv0Sh50c=
X-Gm-Gg: ASbGnctVbyKzxU1f7KKUodXaj+H+Z4Se585Q/7CVdcHisAGrQz5Tq5hVvIYlCNF1NIK
 lnDrgXZO62hsZst6+JcHqTwDoWOFaS2FWpN/kibDV1htayXeobriKyB3DSv/ruxhlgzOe4Ce0SM
 2PzXvM2qRaFpf+nzCd7PmFy/L6z1y3DgcGXLJ8Y0jVN03hEay8DljIbjOQt5Q0sseIHfW93/D0o
 /uqWh345DQF8gWMBPVARpQdNH8tX4ugbZYPOmNp9xqi4Az+FBEToMQ3naMcNq7QcxaPixjQjgw/
 /Tyr8mSp+TnbYTEnBtEd8aO8RaS89yD8/71mhFAzQjAv1xjWMIkKptzY6WbMsVgUF7XNADsdS/a
 c1Sm7cQcIN817nVpqbvSpdPjlc2XPGdEZGUlsBAa1AtfmbiI3mArgg7T8EWjHRPtn5QXTeR/jbY
 QtvD3BorzkU7iZV5oPFIaBTau3PSNdmRZ8EniIuw==
X-Google-Smtp-Source: AGHT+IGObFhC16xfu3Obyo7XhIAOD/LALuiRq/UGanygaAQhLt+0iZTdhGL7NioIT2ZrhmOghKsAbQ==
X-Received: by 2002:a5d:5d0a:0:b0:427:53e:ab33 with SMTP id
 ffacd0b85a97d-429bd6a8f33mr2952256f8f.48.1761919489158; 
 Fri, 31 Oct 2025 07:04:49 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c54efcadsm391434f8f.5.2025.10.31.07.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 07:04:48 -0700 (PDT)
Message-ID: <8625b51f-df50-4a77-9737-9e71755c2c53@ursulin.net>
Date: Fri, 31 Oct 2025 14:04:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] dma-buf: cleanup dma_fence_describe v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-2-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251031134442.113648-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 31/10/2025 13:16, Christian König wrote:
> The driver and timeline name are meaningless for signaled fences.
> 
> Drop them and also print the context number.
> 
> v2: avoid the calls when the BO is already signaled.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39e6f93dc310..cfa6ddcc1278 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -999,19 +999,20 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>    */
>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>   {
> -	const char __rcu *timeline;
> -	const char __rcu *driver;
> +	const char __rcu *timeline = "";
> +	const char __rcu *driver = "";
> +	const char *signaled = "";
>   
>   	rcu_read_lock();
>   
> -	timeline = dma_fence_timeline_name(fence);
> -	driver = dma_fence_driver_name(fence);
> +	if (!dma_fence_is_signaled(fence)) {
> +		timeline = dma_fence_timeline_name(fence);
> +		driver = dma_fence_driver_name(fence);
> +		signaled = "un";
> +	}
>   
> -	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		   rcu_dereference(driver),
> -		   rcu_dereference(timeline),
> -		   fence->seqno,
> -		   dma_fence_is_signaled(fence) ? "" : "un");
> +	seq_printf(seq, "%llu %s %s seq %llu %ssignalled\n", fence->context,
> +		   timeline, driver, fence->seqno, signaled);

I still prefer my version, so if I am allowed to bike shed:

  a) %llu:%llu for context:seqno to align with the tracepoints would 
have been nicer.
  b) Why move the driver name in the middle of the timeline and seqno?
  c) Signalled case will have triple space which is odd.

But it's debugfs so who cares.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>   
>   	rcu_read_unlock();
>   }

