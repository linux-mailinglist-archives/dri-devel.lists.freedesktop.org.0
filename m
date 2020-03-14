Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A87185581
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 11:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D3E6E291;
	Sat, 14 Mar 2020 10:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2886E6E291;
 Sat, 14 Mar 2020 10:59:51 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g19so15229850eds.11;
 Sat, 14 Mar 2020 03:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g01xlTcHoCeW8HA/Zoij0G1oenw325gwe1o5DluyjVk=;
 b=PaFKiIfFtTnsFkdtWrrCo0Bs2+zoLhGVhZqTnPjgTJ/fN7OcbrjVbGaIaT7GNNKinD
 UJgDu2i28dDtdvXJaPIsnNHTW6pkI4Dvt5i649RCKU6lQ6rN6R6VQPSGE+J0Kf31blI2
 IbqUEY9OpkhiHvJJaQqzy6MeE90gm799JCYdwxwA5YvqwtcT5k0reLn2yaK7XX59VRY5
 13voD54Ke2VtSzJJyz9FQ4m0ihEKlacXMX5u7ZzMm9aS6tOPM7VUulbg2ekgLnTzk4wS
 4jV9492DxDqpJvS3/w4As4cnuIY+Xjywdl4yOt/xKABzwlJiSgGCcB6069ShxMiVS35c
 DWTg==
X-Gm-Message-State: ANhLgQ0Ebq2g5nlk+mz9pnkIUy6SDCfUm6mlqCFrM8qjxYgqKRJtfHx8
 VP55ThMfra88ktBuV4nfmhw=
X-Google-Smtp-Source: ADFU+vv1WkKB0u07WBdUm4ghC+dsxjEf7g/P9HdfFTe2RSYc3zQrfQ3xU1TFNHiCqZRBtceL52pXBQ==
X-Received: by 2002:a17:906:2181:: with SMTP id
 1mr15328632eju.131.1584183589584; 
 Sat, 14 Mar 2020 03:59:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id f21sm1538993ejx.41.2020.03.14.03.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 03:59:48 -0700 (PDT)
Date: Sat, 14 Mar 2020 11:59:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND PATCH v2 6/9] drm/mgag200: Constify ioreadX() iomem
 argument (as in generic implementation)
Message-ID: <20200314105944.GA16044@kozik-lap>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-7-krzk@kernel.org>
 <90baef2d-25fe-fac4-6a7e-b103b4b6721e@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90baef2d-25fe-fac4-6a7e-b103b4b6721e@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 11:49:05AM +0100, Thomas Zimmermann wrote:
> Hi Krzysztof,
> 
> I just received a resend email from 3 weeks ago :/
> 
> Do you want me to merge the mgag200 patch into drm-misc-next?

Thanks but it depends on the first patch in the series so either it
could go with your ack through other tree or I will send it later (once
1st patch gets to mainline).


Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
