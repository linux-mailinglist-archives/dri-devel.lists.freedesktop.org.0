Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB47C4717A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C825310E0B1;
	Mon, 10 Nov 2025 14:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="de7bwxyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ACA10E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762783521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JtzOcemGD0TJWG3B+UVtVletzjnKYruntoqmhaEm2o=;
 b=de7bwxyOsPBxNerpVPS7AT/CKOVMa3Zc1N5lv5Pz7ShWuBXwdbLdOHWwwXFRrYgTJYJ2Ec
 ZbKfy7G5jqDkyLsofvZbbPB0JQo4KevuO18FLbiZLYaWPlT3/FpOjDqGV6EnC6FhhBGc5q
 Cts5C2SpdWtURrVYLTSUzOnuJcs3NFU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-PhLuvo4gNgiqS8bGU2tH5w-1; Mon, 10 Nov 2025 09:05:20 -0500
X-MC-Unique: PhLuvo4gNgiqS8bGU2tH5w-1
X-Mimecast-MFC-AGG-ID: PhLuvo4gNgiqS8bGU2tH5w_1762783519
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-475dabb63f2so14023485e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 06:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762783519; x=1763388319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2JtzOcemGD0TJWG3B+UVtVletzjnKYruntoqmhaEm2o=;
 b=QnkmHVp2kqh3M/Yd/jNKzCT5YfxLRNjcl7OKiCaa+Mb1usXfz0wNOcpSAdghfER9U9
 5xZAMmN3lZUvf5yws74coRNMShg+mpKohg3YqTc1yZ/td9eqbZ29Zfe626nDUTLQVkxH
 UEOr7eEz05z3HuG0evVWIn48f4yt4hy2RGP/q2jD6Ec7MUUh+sndIfwf8jnTE4mb+Z6z
 Exl0EHLk+oLG6A90w+buwgP9Cn+CjPVrQK7zoXRlThZCoV4/ALK7i35PvMm7BYCf/VfB
 YGX/9C9oGCa6ELtzI5saNLICQF+rag1KvyKjGiaLZW0I05p4+bFYICrpxV4Ph/GQaExC
 tsqg==
X-Gm-Message-State: AOJu0YwyYMZ9fJ5KO4CskPwJkCfY7UCEZVLyy95GP+/mp81uDZd3TSKX
 R9hl6/E8ozKnfd+bCGscy2md3Dh/9S6y98gm85sC5d1Isr9JTBhHYawZH05rDIylVlUmAYnJ9Ph
 Sg3tati/7YT2Qs6bjuAaLv4fZNQjTR+2qzQJ+obdr2Jx0K1ysHKj5yB3SDc5iJLZA2ObOtQ==
X-Gm-Gg: ASbGncuVh3HjRx5pbfP3mL1VToAa0w8T+RI05JmgckBYG7QcWZSpqMVjVW3opgZ0Knl
 zXAu6JDMiGGDplnuhMUGydyluCBKmqtegV85Fv4b4j6IVQ+tTlmCaXXYfagHCZtLgPq4i2bhE0r
 HXMHlNbFd/6tgW+N5C8Jvw7aSa0NBfP8/Ak/Vre/GlbEqcFhzPkcd+harHVVN/r+a/erzsow4Yh
 fRkczvro0KR2LnjyqXc3HDOHAZui5RXK5AWUZqdTCDd6I6PoLlKNpgOC87jb3BEZdEmwVyMiCuE
 krbJkzuX0QHZcy3Q58pgKM1PzDw33waz+1holFojaHK6WVtw1E2eHcb/aI58xT1Aw+jlR2JN1XC
 G+yzy93D8QBHJ8tQpMlByyiwWZUO/54tb3Sf3Ecs=
X-Received: by 2002:a05:600c:1381:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-4777325ab51mr76639805e9.18.1762783518789; 
 Mon, 10 Nov 2025 06:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMjn+CCsjUlMm3xzTYdWVzE/NNKmYzLaSSOr86S2ftoTTogHmleVtc8GMhLnQCQcUAUSFpsw==
X-Received: by 2002:a05:600c:1381:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-4777325ab51mr76639435e9.18.1762783518357; 
 Mon, 10 Nov 2025 06:05:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47763e4f89fsm116138455e9.3.2025.11.10.06.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:05:17 -0800 (PST)
Message-ID: <0749be61-2f3d-440e-887a-c841007e5b50@redhat.com>
Date: Mon, 10 Nov 2025 15:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/client: log: Implement struct
 drm_client_funcs.restore
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20251107142612.467817-1-tzimmermann@suse.de>
 <20251107142612.467817-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251107142612.467817-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EpPRrs9HHTdtO-bOF7sKn9LVWSg85iNH9yA6riI61-g_1762783519
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

On 07/11/2025 15:19, Thomas Zimmermann wrote:
> Restore the log client's output when the DRM core invokes the restore
> callback. Follow the existing behavior of fbdev emulation wrt. the
> value of the force parameter.
> 
> If force is false, acquire the DRM master lock and reprogram the
> display. This is the case when the user-space compositor exists and
> the DRM core transfers the display back to the in-kernel client. This
> also enables log output during reboots.
> 
> If force is true, reprogram without considering the master lock. This
> overrides the current compositor and prints the log to the screen. In
> case of system malfunction, users can enter SysRq+v to invoke the
> emergency error reporting. See Documentation/admin-guide/sysrq.rst for
> more information.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 19e55aa0ed74..4d3005273b27 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -315,6 +315,18 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
>   	drm_client_release(client);
>   }
>   
> +static int drm_log_client_restore(struct drm_client_dev *client, bool force)
> +{
> +	int ret;
> +
> +	if (force)
> +		ret = drm_client_modeset_commit_locked(client);
> +	else
> +		ret = drm_client_modeset_commit(client);
> +
> +	return ret;
> +}
> +
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
> @@ -348,6 +360,7 @@ static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
>   	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
> +	.restore	= drm_log_client_restore,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,
>   	.resume		= drm_log_client_resume,

