Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B3A88A81
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 19:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8230410E05C;
	Mon, 14 Apr 2025 17:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pb7NEblF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C461810E05C;
 Mon, 14 Apr 2025 17:58:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so2519297f8f.3; 
 Mon, 14 Apr 2025 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744653493; x=1745258293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=izdBvu6TEaa0TT8zD5lSJAAH9BE+Oi7Zz7yfbJo4iyQ=;
 b=Pb7NEblFbYwLfitRxkyvs/FBYZY3yuOgpCZlTLta89KZQ/32kmvDAv5h28yicHB5FC
 4W+LUriP8KFlzH6EX+GwZ5KdoZhPUdD5FvTxlzJIlQTvdpbBn1Ev/QbSg2HGFIpAIbDL
 Cnoy3RXKDu+BqgXudHeTQg9k8c5Yg3B4CN4/cR9aD6WRllf17klIEzMotkJisHmSCPBI
 TmF8ih+XdpnnB5CSNv4OUPFt/SXg8rLRKRs9E/QUpC/dInP4ChK636FLSP3p1AZSLsSj
 Relgr8iLNfL1dUEtSK6uRI9A0/UQjSyWfg05apOOMShkF9ZBmV7T5+mDGrgcATCeqZ9t
 iEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744653493; x=1745258293;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=izdBvu6TEaa0TT8zD5lSJAAH9BE+Oi7Zz7yfbJo4iyQ=;
 b=AnG2PaP1cb4wu0Z8KzdNGaYM3Rkq9zzBGaIN62zCgzMFf0tIKhSalk9jtb8G0k+TiL
 J+FbdnN05u1NvQC30ZkOaV/2oOkf6vZmLnsnNwrV89fVSZpT3owo3p+JsatBzRfO2Ps6
 AG9+T9cPuSXaHJMD2PY3WAVhtAZC4TH+Sa2oDvcS8L1CtvjxUkie7CUgVEymbtMX5j9f
 +ul2KQV72ozsFTiSX5eZVdSqXcq6vlMGdxn1W/8oYZec9pQl6cqg+jfc6JIGZhHVrgFe
 Ha3/s3eIZjFQZumj7BNGCFsU6YbU1QBUsJR94wGD9XM7OL1kzrjPK+iRtwKHutujLrG3
 US5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPbxavZFejleya+4QVyfhnAHk2/6IS0wSk3iX8RNIVxR5TF6MLNzvx72oCR56upnwSNjzAhdiNtbsY@lists.freedesktop.org,
 AJvYcCXUDwGtwxOS180x+COi0tpkluVPBTuS6ibBjB7rBJIR6nvV1wevD+4CV2qnFGCcJ3oNwdKxJhGZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/X/iFhTM8dFHXOrolw2ygy3JAFTWllBmgDoDsK9VUy0N2rOpW
 QN1vmLuEw4fT5bVbBwFEXHWxnYYf+7gU9np7rMFijW3ioOcpNBhG
X-Gm-Gg: ASbGncusaxW2pr6GOf4NxemDzkezcNEdwCjLSGyGDMB0K7MGock4wL3yY4viZTwJgjp
 7zIbE888B+5sCMcPOaUK8RtvQa0fUTZPt8GIcu6esqeRIAiAXJ4mHG4rBVvlLZ5arsagcwvS52/
 T3aQW26V+cHMT3HjccLJZMk2SCGpK5DIX6q8RCWAyxtWStAjfGXMMfieTkOz/DNwy8wrnWC7+X+
 1qhlI0CbI05R5gL+AnvrlVFbZ5KyefK/dzXKq2lOpm6RE2qVqTBYKo6kfkzRglCY+K/dTbz3W3j
 3SRvQpOj/efMKvanyRgvtF2oE0M3wtLJJb7b3Awx7arQjSqKDUkdAh8VAYHa5yIl6elf9w==
X-Google-Smtp-Source: AGHT+IFvtklqHlORmmceCrD8uiwPBpCpvDJPl2jq9kFVRJyNPmahQWFJB79v3TOPyiQuTBE5rzMJ5w==
X-Received: by 2002:a05:6000:4304:b0:39c:dfb:9e8e with SMTP id
 ffacd0b85a97d-39ea51d3728mr9634118f8f.8.1744653492986; 
 Mon, 14 Apr 2025 10:58:12 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c0d9sm11887994f8f.32.2025.04.14.10.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 10:58:12 -0700 (PDT)
Message-ID: <c2ef0925-14ad-4eff-9972-53406ec01f0a@gmail.com>
Date: Mon, 14 Apr 2025 19:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm: function to get process name and pid
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250411130428.4104957-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250411130428.4104957-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
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

Adding Pierre-eric and Tvrtko as well.

Am 11.04.25 um 15:04 schrieb Sunil Khatri:
> Add helper function which get the process information for
> the drm_file and updates the user provided character buffer
> with the information of process name and pid as a string.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_file.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_file.h     |  1 +
>  2 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..4434258d21b5 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -965,6 +965,36 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>  }
>  EXPORT_SYMBOL(drm_show_fdinfo);
>  
> +/**
> + * drm_process_info - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @proc_info: user char ptr to write the string to
> + * @buff_size: size of the buffer passed for the string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +
> +	if (!proc_info) {
> +		drm_err(dev, "Invalid user buffer\n");
> +		return;
> +	}
> +
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +	if (task)
> +		snprintf(proc_info, buff_size, "comm:%s pid:%d", task->comm, task->pid);

Looks good in general, but I think people would like to see the optional client name here as well.

It's rather useful to have for native context.

Regards,
Christian.

> +
> +	rcu_read_unlock();
> +}
> +EXPORT_SYMBOL(drm_process_info);
> +
>  /**
>   * mock_drm_getfile - Create a new struct file for the drm device
>   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..c01b34936968 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -501,6 +501,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>  
>  void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>  void drm_show_fdinfo(struct seq_file *m, struct file *f);
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>  
>  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>  

