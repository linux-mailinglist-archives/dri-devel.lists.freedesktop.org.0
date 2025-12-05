Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428ACA7A4D
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D9610EB1A;
	Fri,  5 Dec 2025 12:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="d1Q+ZdR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2626410EB1A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:51:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso1064428f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 04:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764939093; x=1765543893; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9MzpLnNl9vvJw+1q+qMx3EcEk0gQb02lA2SLfXsZdJo=;
 b=d1Q+ZdR1mg4W0SpgkfnxiiQYxEQr3TbWvP4v8U/pmIrMnGk4hqK1XPXQhexkJtopZG
 Ec89UrSDogNEGDlJTqMR1A50+/N0vQJ9aRsVda9n4pPwNxPx6d8LK3jDSTsZdae3coya
 patFYdLWbMNdEtDQqdbaBejcLaA6Lhjb0R7C8U0IOf3QbKISYKzBiWhGHDG9szINXOUa
 oqgf+8SrCfkBb/A4hciD+xYuBz3ygD79CHfSEgnkTeBgJTvcrbZi72R+NtqcK7gJoxFJ
 96WrKJGSBQACGd8TwKHVUOZ/24GxrUQzPbdZNhKRwpQHtwQhaS8WZ2uMf2wnZIuyI9/p
 bL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764939093; x=1765543893;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9MzpLnNl9vvJw+1q+qMx3EcEk0gQb02lA2SLfXsZdJo=;
 b=NCjxuOqc9m+73JAdEoVnjAjBcF8t4E3V0NYSlxcD/WP6Wjk28e52siU+7k0cgzaz6+
 Yy3SJrF3HGQRLI9ZWUhWb0X7ZNmpKpypsPRJe9E/tcI8VG8joBEFz6e2ogWBbRWCxHKR
 12QM8qmtKskMtdkklupKca0iRA9lgRLZZBaR59i6YD4JEEaiBym6z0Ux9MNNl/nmB3g7
 PMZywcD/iSmFoD0HNIrdZ9AeBZc76fXSFCNZ9q6NuVP9yUvO6nGoz5GJxSXO7QQCeBu6
 vP/gkzkFZu0MFErjGD3bvglJjvOQoN9K40x1jjfDdpOy10XWp/zA8IoQTxBCEuekcaGi
 +HrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxjLuVbhuMWXuEhGz3cCXsueMqT/qymJCdTJ5Vk00KTaaLO6cmAwBm4/ylDWsyDu8SsOt8Bx40JdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLe0BjlRZUjwu0ICC1Cypj/vDJpd1sEix7rn2UVepK0M7d7fwR
 b4+wWCu50ibf5aUP71xDLryGPJuxA1MgdiCUPWaUPyGaJw03piv561iVBfhyQOgoUl0=
X-Gm-Gg: ASbGncvp/V/khk9YCynEYaDQrIePhQaoR6w5kHMTpcI10Ey3guCkN7zDcqcU6zTbX/k
 i2GSj14x8hAvP+fA7rKJlhv0a2ndslnElTVw4DbWlzgrjgg4NCn5QirPywlb191WqDP7MbzDSSV
 sucfvSf7vemxn2eMO/FY48/EGYpgOXFNv1kdIKHa9faKwwaape2g9kCbHGWWIzEuOGT5amQPIrh
 cAr9R5hMPQUoyEn+DZ22RKRNF3BQhuE5tlDwG4/P7LMGXl6FFqplBqGk5I1t3tzHW+6lA8sDq9Y
 /iPWDyIMkhh9Lbov5qKqpZ8gVBfnt78vL6MV2QCD4S3/UTjt485rux2pUoF14sO48dQtzSNJB/p
 JMbLL42uztnqD+2o3GLa81+wN/bd/QLPhNJTx8n5YS9jQyRXz4TSHvOe9SIOuisIobloIBfCZNF
 Xw9F8588YhAZRZuUaT7lBBYGUO8Ymq9A==
X-Google-Smtp-Source: AGHT+IFF2YOP1yOKobPpwIABM0ALpDzm5Ux8rx9pH99/QlqE0Zty3TPaCCS2gXj6vJWnXG2wdtohyQ==
X-Received: by 2002:a05:6000:18a3:b0:42b:3272:c4a7 with SMTP id
 ffacd0b85a97d-42f731a2e9amr10500166f8f.29.1764939092550; 
 Fri, 05 Dec 2025 04:51:32 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331af5sm8375239f8f.31.2025.12.05.04.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 04:51:32 -0800 (PST)
Message-ID: <14cffb34-1c56-4119-af76-e8ead8099a9d@suse.com>
Date: Fri, 5 Dec 2025 13:51:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] moduleparam: include required headers explicitly
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
References: <20251203162329.280182-1-yury.norov@gmail.com>
 <20251203162329.280182-3-yury.norov@gmail.com>
Content-Language: en-US
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251203162329.280182-3-yury.norov@gmail.com>
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

On 12/3/25 5:23 PM, Yury Norov (NVIDIA) wrote:
> The following patch drops moduleparam.h dependency on kernel.h. In
> preparation to it, list all the required headers explicitly.
> 
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
