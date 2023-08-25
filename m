Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8517078917B
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 00:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0AD10E6EC;
	Fri, 25 Aug 2023 22:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44CA10E166
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 22:13:36 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bbc87ded50so10581755ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 15:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693001616; x=1693606416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0BjJU4w8nwIph8eNiwGoKfedSYPjcFpwJfo8NljTIRk=;
 b=UzpkgeTaNjwZqWYnvXJmrH8H4MUBGOgP+qcXrveK7VV6mTIdR8ZfSUrAHzEPSuyfuX
 o9BsMJ3X0CdwVZ4rkN2AHMiMAaSi3CXp1kpBkuRzhJgyWiEhy4DWSzan1srRbI+Myo2u
 uBa1JWaJlqpuwQtD6KqyrTfE00cTSwFSnQeOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001616; x=1693606416;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0BjJU4w8nwIph8eNiwGoKfedSYPjcFpwJfo8NljTIRk=;
 b=jY945rZyia26jE+HQHKXk+w4+sw3s1jzi9SmVsYfeX7+A+9b9/Hu7tDKflXNqQx8xy
 tH7fSdCVUoXVsZtHERNQO9X95D2K46mhi6HOEIkKOmZZXKcHndeAIsEfhMDXjZpbGgcs
 /R4E1l3FwLn4XnzYHhj84uus90hdY28ppY9YYX4AB3WeICeu6YAMQr4wDx78FSe/+Jo3
 AcFPHPbdiAXYkArYfU5omqNSB+iVpBfkZR/teBVZ6yPa3VR7kQvBvLjwZearPqfjvIr5
 sHPb0gDPh/ka9o1f+0I7bNO8wM/3Y4D+bXV0N+cfpNWKD7DHJ/IzN6uWTaVkEzT5eTud
 Dj6Q==
X-Gm-Message-State: AOJu0Yw/9hq6J+ye+iz+fYDpRYXflQEQjJzG0sELFp5NP6yIWvnhcCpx
 p2piwrJNbk7gU309BQjxxrJIwQ==
X-Google-Smtp-Source: AGHT+IHmApoYxQ/QPGNvuqZJJuCLA/kYG9vprDv9WbQh/uIwdR0ryLsfErzUUgIKN0tApgQ21jWq/Q==
X-Received: by 2002:a17:903:1109:b0:1bb:3a7:6af7 with SMTP id
 n9-20020a170903110900b001bb03a76af7mr22568511plh.23.1693001616232; 
 Fri, 25 Aug 2023 15:13:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001b9e86e05b7sm2261569plg.0.2023.08.25.15.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 15:13:35 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:13:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] accel/habanalabs: refactor deprecated strncpy to
 strscpy_pad
Message-ID: <202308251513.0F6BF9FEE6@keescook>
References: <20230825-strncpy-habanalabs-combined-v1-1-daa05a89b7e3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825-strncpy-habanalabs-combined-v1-1-daa05a89b7e3@google.com>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 10:09:51PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We see that `prop->cpucp_info.card_name` is supposed to be
> NUL-terminated based on its usage within `__hwmon_device_register()`
> (wherein it's called "name"):
> |	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
> |		dev_warn(dev,
> |			 "hwmon: '%s' is not a valid name attribute, please fix\n",
> |			 name);
> 
> A suitable replacement is `strscpy_pad` [2] due to the fact that it
> guarantees both NUL-termination and NUL-padding on its destination
> buffer.
> 
> NUL-padding on `prop->cpucp_info.card_name` is not strictly necessary as
> `hdev->prop` is explicitly zero-initialized but should be used
> regardless as it gets copied out to userspace directly -- as per Kees' suggestion.
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the consolidation and refresh. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
