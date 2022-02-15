Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04F4B82DA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE71910E8E0;
	Wed, 16 Feb 2022 08:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4441010E608;
 Tue, 15 Feb 2022 22:59:29 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so652656pjh.3; 
 Tue, 15 Feb 2022 14:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ydg/QaEHk+YtzGHqWPzjDmBjfyy2f1JmjiAxPzP8crc=;
 b=neA8UZ+ztvqI+c9Y0GhuINKiFZbH9bwEKDbDdCj/aBEOg8Je4KJR2FY7wqhQqcBAYk
 3Wy+WGL8h5hMZhHiRrJnELKEzNVne+rWwRiNSK+LaaB40t3gKAMZ5iPl6SH4z0sCF1sK
 WeebZKAyrtHxpGEBt52RHDKoImWcRYibqiE5YdJSrERCh5ErepkYhiOc7Yw8VRa7JtSJ
 adEHSUdt8ZETIXkSrLoXpm9wbvKFejNQ1Fv3M/q0bRnt69wRrVeApz/eynGg7QDAnCzT
 uJF8lE/RahbG4H9xVfC7Tm4Wgh1nT1vyrj+ukgd4F45LFSngNGYO0nz3bd1+0RfzB/uo
 Q/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ydg/QaEHk+YtzGHqWPzjDmBjfyy2f1JmjiAxPzP8crc=;
 b=V+tcmYagwQfeTZ4kkh7wjDtuNyeaQWxpoAvGPgBRojc/TqL3HbJVaQ169BpRdCRF8q
 Jl5JGiEWN+JSGARykgkHGLGpFBHLTZeqB7frYgEGQuY750wsq1UXqhTdWx7lZPDC6KmS
 WU+lwvRSVIzHYfeFJC4DT0aMQkLZb3+jlDcA6oZ5UqUGeSbQw+RzglcW+shJPOtPPS5P
 DzcKoriYOcc4RdUZXJ8IIrGpkae5UPjpig0GJLfmFDTFsCAcZHntJuTMUEa9k9uU/tDW
 ELO0t0Q9g+rM/ifb6+sYcf7cznyn032e0+cB8IMtOmy5QrfibvgVSXo944Y+SSS2YiNf
 EemA==
X-Gm-Message-State: AOAM532vb9dC4TP0q4NNwSKAEuZF3AN6N+xHpOOTVv8NTTmJyrM7DiY0
 4ZrFzctNOGCMbFjf2nEiT+I=
X-Google-Smtp-Source: ABdhPJzD5VTWuMUJjUi6d0x1rXiN3okRfTcvfy3+tsDIIsH6bfb6SZ+FiyUr2n1wCBp6WTu5fGOOUA==
X-Received: by 2002:a17:902:f686:: with SMTP id l6mr1079179plg.7.1644965965923; 
 Tue, 15 Feb 2022 14:59:25 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4e4a:b0ff:e926:40e2])
 by smtp.gmail.com with ESMTPSA id n85sm10430319pfd.142.2022.02.15.14.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 14:59:25 -0800 (PST)
Date: Tue, 15 Feb 2022 14:59:21 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Qing Wang <wangqing@vivo.com>
Subject: Re: [PATCH V3 6/13] input: serio: use time_is_before_jiffies()
 instead of open coding it
Message-ID: <YgwwSUlZVakiYF8j@google.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
 <1644890154-64915-7-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644890154-64915-7-git-send-email-wangqing@vivo.com>
X-Mailman-Approved-At: Wed, 16 Feb 2022 08:23:45 +0000
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
Cc: Mike Snitzer <snitzer@redhat.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, dm-devel@redhat.com,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-clk@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-media@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>,
 linux-block@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang,

On Mon, Feb 14, 2022 at 05:55:43PM -0800, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.

I applied changes by Danilo Krummrich converting the driver to use
ktime_t (see https://lore.kernel.org/r/20220215160208.34826-3-danilokrummrich@dk-develop.de)
which makes this change not applicable.

Thanks.

-- 
Dmitry
