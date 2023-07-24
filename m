Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D28A75EBBC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 08:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687D910E106;
	Mon, 24 Jul 2023 06:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A6F10E040;
 Mon, 24 Jul 2023 06:38:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-31757edd9edso586937f8f.2; 
 Sun, 23 Jul 2023 23:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690180734; x=1690785534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nBFPtNUr5zfQpCgu0uRJ8hgMdYMycg/Xxc747XVGWkA=;
 b=OLZpPCpkL/lUrqmLwvcick8CzzbEKYULC8vrgu+dHVKrFaBOGyUbyxs7yY5Q13DkOC
 gdJi8Eo9/JJFyQkRyjS8fK5JSk/zMXDHD8gfagyg79oqroCaq7YtOaF8JSL6AAJf0F+Q
 U0utAaxuXAEtO0qLOmqxLF1lyYIfshkvlkciZSU7r5ZBEnPW8kI2UBHepkN83PQP/iGM
 DZQP/07TJIp0yrN2wCwV9KU5q6Pu9N5COWmEQZpE4PRplR7uXlT4ojou7ZAtI4z9v3Ft
 9OHGwL7dvg+EVtWY1guEseZeDr1+GZFGbALmJR/p9G5cbaS8k0k0G++7QLcVqS6PI3Rh
 sOeg==
X-Gm-Message-State: ABy/qLbsG2/zxiFTrCuI/cVWqj7J7YL7yZLKmnXXX/UOm+0IozTLspzN
 5TdPnd/SVNgACA8vA4I0Q5c=
X-Google-Smtp-Source: APBJJlGSUmRKzqjC/Uqd0tfK/mlDP8ww9QDg5376q0LqdGrJd79508IrFYaOBR6hTASFTeZL5KjIpw==
X-Received: by 2002:adf:f8ca:0:b0:314:1d7b:5b86 with SMTP id
 f10-20020adff8ca000000b003141d7b5b86mr5433796wrq.21.1690180733790; 
 Sun, 23 Jul 2023 23:38:53 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b00311d8c2561bsm11722892wrp.60.2023.07.23.23.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 23:38:53 -0700 (PDT)
Message-ID: <c1f2f55e-bd1b-957e-c4d9-6a326f7e19fd@kernel.org>
Date: Mon, 24 Jul 2023 08:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/1] drm/i915: Move abs_diff() to math.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20230721135318.17603-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230721135318.17603-1-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Stephen Boyd <sboyd@kernel.org>,
 Helge Deller <deller@gmx.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21. 07. 23, 15:53, Andy Shevchenko wrote:
> abs_diff() belongs to math.h. Move it there.
> This will allow others to use it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org> # tty/serial

-- 
-- 
js
suse labs

