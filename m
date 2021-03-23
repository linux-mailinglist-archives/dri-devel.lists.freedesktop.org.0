Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376D3463DC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C156E9B6;
	Tue, 23 Mar 2021 15:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32886E9B6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id j3so24000945edp.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZmVnw9e3zs9ujDSWUHwpSdZW2U3P6WcGwuzKoSOiP/c=;
 b=VXjlBx8Mz+v5Q26sEsoUwSqdY42SHNSc070iy6+C/2+8WhgNpN/eIMG6opEj2Q5R7f
 jx8Si+0Knav0nP8i1VRLSHQzWkFL8tNq9calbJclyI9eK6XlzVD99tFGbN6HLyl41uV7
 FWOXnzjNY3TL36TuW1kDoGMKK86rGfGuLiC4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZmVnw9e3zs9ujDSWUHwpSdZW2U3P6WcGwuzKoSOiP/c=;
 b=mOvXb5T/YjsI3Q0F+asbY0E+JT9EX2s4dGdJPbml+gFO3IdRVAFalwekF3s01KcUNV
 cL5/uIQa9/xODjVLOJ5hRXd0Sp0xtJ9ECjyiI5jVOhhqYVTZxL5pIwL7T/Fcdes+iDyB
 bCYQunRZZ47Vnzf1in73uL1Cc7MfJID2BtSxeA4I5sR7gW5ngsnqY8+3AFx2OBnbtjl1
 RKjNe/87e0xVZExCnmOnDezSD128XiNXppCbFMLwPvBonWUXIlxdxPzaVhZeE3xmS0Th
 7iSSdAUM0PkHAGKJNStavBajWrHusQB4z8r6MWnlr+b+Oqfp8KgWn0DHbGeyuEFwnuSG
 eeZw==
X-Gm-Message-State: AOAM530pUJgUxfKAk5F6bmC1z8TiMtJGAy39QQN3sI25fRaWxLYwFuWL
 JtPHPyP7Afb9xGVr/DIYPT17rw==
X-Google-Smtp-Source: ABdhPJxJh4y5zbto9JNYyNG+99RMRhIVRkumjFcGhX+XdnF5W+FCTKAbJCF0L12eKaQjojQgMYg6kg==
X-Received: by 2002:a05:6402:1393:: with SMTP id
 b19mr5178086edv.333.1616515058513; 
 Tue, 23 Mar 2021 08:57:38 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id la15sm11307906ejb.46.2021.03.23.08.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 08:57:38 -0700 (PDT)
Subject: Re: [PATCH] amdgpu: fix gcc -Wrestrict warning
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210323130430.2250052-1-arnd@kernel.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f8cd5d0b-0c50-a2e9-a5a1-a2358419dd44@rasmusvillemoes.dk>
Date: Tue, 23 Mar 2021 16:57:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323130430.2250052-1-arnd@kernel.org>
Content-Language: en-US
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
Cc: Jinzhou Su <Jinzhou.Su@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2021 14.04, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc warns about an sprintf() that uses the same buffer as source
> and destination, which is undefined behavior in C99:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c: In function 'amdgpu_securedisplay_debugfs_write':
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:141:6: error: 'sprintf' argument 3 overlaps destination object 'i2c_output' [-Werror=restrict]
>   141 |      sprintf(i2c_output, "%s 0x%X", i2c_output,
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   142 |       securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]);
>       |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:97:7: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
>    97 |  char i2c_output[256];
>       |       ^~~~~~~~~~
> 
> Rewrite it to remember the current offset into the buffer instead.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> index 834440ab9ff7..69d7f6bff5d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> @@ -136,9 +136,10 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
>  		ret = psp_securedisplay_invoke(psp, TA_SECUREDISPLAY_COMMAND__SEND_ROI_CRC);
>  		if (!ret) {
>  			if (securedisplay_cmd->status == TA_SECUREDISPLAY_STATUS__SUCCESS) {
> +				int pos = 0;
>  				memset(i2c_output,  0, sizeof(i2c_output));
>  				for (i = 0; i < TA_SECUREDISPLAY_I2C_BUFFER_SIZE; i++)
> -					sprintf(i2c_output, "%s 0x%X", i2c_output,
> +					pos += sprintf(i2c_output + pos, " 0x%X",
>  						securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]);
>  				dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is :%s\n", i2c_output);

Eh, why not get rid of the 256 byte stack allocation and just replace
all of this by

  dev_info(adev->dev, ""SECUREDISPLAY: I2C buffer out put is: %*ph\n",
TA_SECUREDISPLAY_I2C_BUFFER_SIZE,
securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf);

That's much less code (both in #LOC and .text), and avoids adding yet
another place that will be audited over and over for "hm, yeah, that
sprintf() is actually not gonna overflow".

Yeah, it'll lose the 0x prefixes for each byte and use lowercase hex chars.

Rasmus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
