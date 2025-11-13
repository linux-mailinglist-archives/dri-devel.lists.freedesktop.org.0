Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F5C57DB2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3BC10E81E;
	Thu, 13 Nov 2025 14:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MlQwCqX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE410E81E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:11:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477632d45c9so6517225e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763043083; x=1763647883; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=91ag1uYbOHPtz4pKKSzD/eUHCpa9v/Cueyubly+zX38=;
 b=MlQwCqX4jFJkkufytn43KCkZIymWLMiaSa+OI370d6oM7tmf+BaZAo8k69nmHz/Ke2
 BQqbywoNWjjfDumN6pOELtU2BtII004Vvk1zA2kc6WaoixHKaBIoAiTDQrTK1nkzeX8z
 jVrBg3e75XxZmVZznbqpHVyaH/+ONzZwTgjy5fy+Em4c9nZ9Ux0uYsR+/h31iPD1pqAh
 iuOvft58gf+52wWTxbTuzJlNndkNgD+CUQZSK5IPp3KaFtkngi2e2mrn83ZPRfqwKXvA
 G/wR1yoEOfgbJny7y1c7gjWplCj1j6myK/Qk2UUo8lNDmgpMRQ7TJMRxb3eyhtxlwWnc
 8LWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763043083; x=1763647883;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91ag1uYbOHPtz4pKKSzD/eUHCpa9v/Cueyubly+zX38=;
 b=mJZfkmW1lrOGn37UmhK+QS0P/UgER7g00iTCGV+Ws2sKNXMLGkZqrCPXKw5jfQp2ya
 ozNjyhEmQMJbHGxE8iBKvc6CrQ2NvdHaEwgzTpiiVT3MgJ4xE46SRZ6nCDNznsbuvDpm
 i+d9DbwsBXqMDqYx1mc5Ql79skh4YovZRN0iW5ZqfD3gca0u0zY/y9Twph6eA3GrbLTQ
 ZV8k4vJmmH3yLKInSLKCPEFkDbZNvzBatRn/HUT2Qgn0mWBBkaRMWCXB4HFhiSSCnT+Q
 cCNkK4X3KcIkYUxe/DokRqtio8pIcyrwXzmE0QWftaYLkUb1FOmwV+jdRHTL+ONCaEss
 8V5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5NZ4tUfM2BhLufshrDVBO4LJMltJ8ygnDJE4eVQhA7R3s4s8X6vUqPxNiB7luNsvO1jIpBClFeNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydrXxMOAWMnTw/WfmPDbiShJG/wLBqZ4Z1c4qgJdOS5+pqobMy
 6E9prD06OSKGM7qpgd8Z6yLw0blZeJ8MQgKeFTlFIwNRuBjL1jAQWT0v
X-Gm-Gg: ASbGncvpDChdBoC+dewgFcdPdxO4hgq2K+OMVgJwgSnc1V6MYmmxlEERZozEgPu56Qq
 O07AExNVOM+jTRlT+yIBtMjNF3YL5R5q25b/IJ7F6ZQhoHep9sZq71SQyNs1jVAgHqEudWQi60F
 orW9BtlsttjQTSWw7/CZyJw4jmIPsNSHjTAm7anITREN+ohgHprm6HXf8vADgQVqex9mrosUAsT
 Mij/5u/nekhilzc7IZk13fufQSAh2XjM6yMy5Sue75Mph5KUjlJgA2MCvZJH468sbpvf3CE72m7
 FEVz6Jks0BnviEGuF0vQsvz+t0j5bALvUFGDMmPqz7t4X3IFN3TMIUd0+tvYfcR8BRuDZnyVMsz
 0GcT3L9WmE6dnZNmvmFuh9/JxmxffXo3mDldf2jMwfVTdKgQB6l3DAuNg65w4h4VRHk2wA6CM5k
 q01gzAgVQI
X-Google-Smtp-Source: AGHT+IELGbw5WDCBNn0abg6DnAsPsmi7nXIiMORLRzB1ZpydL6LJX/WfaKlpJx7oR41ie/aziJGasg==
X-Received: by 2002:a7b:cb95:0:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-477898540c2mr39839645e9.1.1763043082586; 
 Thu, 13 Nov 2025 06:11:22 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f19aa0sm4004858f8f.37.2025.11.13.06.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:11:22 -0800 (PST)
Date: Thu, 13 Nov 2025 15:11:20 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 04/32] drm/vkms: Explicitly display connector
 status
Message-ID: <aRXnCAjew4ZrJz9F@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-4-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-4-a49a2d4cba26@bootlin.com>
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

On Wed, Oct 29, 2025 at 03:36:41PM +0100, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of raw values for connector status.

These simple patches improving vkms_config_show() could be merged
independently if it makes easier your work.

Thanks for these changes!

Reviewed-by: José Expósito <jose.exposito@redhat.com>

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 391794d391c5..858bec2d1312 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -3,6 +3,7 @@
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  
> +#include <drm/drm_connector.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
>  #include <kunit/visibility.h>
> @@ -364,8 +365,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  
>  	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
>  		seq_puts(m, "connector:\n");
> -		seq_printf(m, "\tstatus=%d\n",
> -			   vkms_config_connector_get_status(connector_cfg));
> +		seq_printf(m, "\tstatus=%s\n",
> +			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
>  	}
>  
>  	return 0;
> 
> -- 
> 2.51.0
> 
