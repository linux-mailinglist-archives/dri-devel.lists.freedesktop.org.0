Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB28247FCD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235A089C69;
	Tue, 18 Aug 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F5689ECD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 19:44:39 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id o13so8619677pgf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RbvZkl+VFld3/SGn1wsxs528WtxH0u9kRcCVuGkaSCQ=;
 b=eDQAepLdsvf97NBV5qq+WRJIVRJOwcaBUEQzU1Umr707qRYx4QRlzqc9mvYICR5qcE
 Z80/4jpH1yQKaDx3y9tFLp0rKDCe3FRG43PteBr3FE3YUZWfrJNvo2A07Qed+3UcCsN9
 s5CQ7VZkr+RU13eLsg7JqtGvKfQe5/QbQEDhtIQ/fQRAevUnbKDsU8sT+8Oir7osRYfi
 OOsn0xCbEKjXVC3GhIKiF3HeFg0qdLk9pHusk8bhReZ06DWjOPvxxBuB+mi4tP7KMeob
 tjizXIrZys9cTA8SqeNNSyIdKevoj4mE09Mdo+ZLYql+H9fjqeZUU2UTeTozMQghU4RV
 02oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RbvZkl+VFld3/SGn1wsxs528WtxH0u9kRcCVuGkaSCQ=;
 b=NdpP+I+5j+YuQY4l9lG72cdiI74c7oF15BAr/zCq6ikM4lDnlsWjegckGqu2Sl38Er
 nzFEabvMvNn48oIHC/jjvlT4Kui8sR1q1Lf0c0u2eFVAOs4jDvR2C36DWEEYN91nZrLX
 ZKx5j7HydaPD2+UEj8+lbVKAf8hmvS+CAMOwBRBL6diIul7myaUNyEsS7qG+Siszn/3o
 //3ANVeLZ7cVDK89cOxbEO+kIy+7lKMrbjQHXasqux9qIr39OH8deCuQKFleADj/gc/B
 LojOw+MTuUYXMHWTVmV2OfOfpMX5S0gZnhyiyluvvi5N7DMNdoUEmsmKaAkKmKik/eH3
 x+2g==
X-Gm-Message-State: AOAM532/z2ADv2z8SwqDM5F8PLdtqw/ve2faqijv4M1c/jcfvzFk9tnJ
 P1JKgizjdvRa1cGA1WrKkq5YiQ==
X-Google-Smtp-Source: ABdhPJzFEoQnnFd028Ohjr70q+LK0HAhTgnBlIVjwMDee7dOwAHF3XJdqTZIG2jx09EV04eBp8JK3g==
X-Received: by 2002:aa7:9833:: with SMTP id q19mr5334525pfl.240.1597693478569; 
 Mon, 17 Aug 2020 12:44:38 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:bd62:5cef:d7f8:5bff?
 ([2605:e000:100e:8c61:bd62:5cef:d7f8:5bff])
 by smtp.gmail.com with ESMTPSA id y128sm21118788pfy.74.2020.08.17.12.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 12:44:37 -0700 (PDT)
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: Kees Cook <keescook@chromium.org>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
 <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
 <202008171228.29E6B3BB@keescook>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
Date: Mon, 17 Aug 2020 12:44:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202008171228.29E6B3BB@keescook>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: ulf.hansson@linaro.org, linux-atm-general@lists.sourceforge.net,
 manohar.vanga@gmail.com, airlied@linux.ie, Allen Pais <allen.lkml@gmail.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 kys@microsoft.com, anton.ivanov@cambridgegreys.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 jassisinghbrar@gmail.com, 3chas3@gmail.com, intel-gfx@lists.freedesktop.org,
 kuba@kernel.org, mporter@kernel.crashing.org, jdike@addtoit.com,
 oakad@yahoo.com, s.hauer@pengutronix.de, linux-input@vger.kernel.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, martyn@welchs.me.uk, dmitry.torokhov@gmail.com,
 linux-mmc@vger.kernel.org, sre@kernel.org, linux-spi@vger.kernel.org,
 alex.bou9@gmail.com, Allen Pais <allen.cryptic@gmail.com>,
 stefanr@s5r6.in-berlin.de, linux-ntb@googlegroups.com,
 Romain Perier <romain.perier@gmail.com>, shawnguo@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/17/20 12:29 PM, Kees Cook wrote:
> On Mon, Aug 17, 2020 at 06:56:47AM -0700, Jens Axboe wrote:
>> On 8/17/20 2:15 AM, Allen Pais wrote:
>>> From: Allen Pais <allen.lkml@gmail.com>
>>>
>>> In preparation for unconditionally passing the
>>> struct tasklet_struct pointer to all tasklet
>>> callbacks, switch to using the new tasklet_setup()
>>> and from_tasklet() to pass the tasklet pointer explicitly.
>>
>> Who came up with the idea to add a macro 'from_tasklet' that is just
>> container_of? container_of in the code would be _much_ more readable,
>> and not leave anyone guessing wtf from_tasklet is doing.
>>
>> I'd fix that up now before everything else goes in...
> 
> As I mentioned in the other thread, I think this makes things much more
> readable. It's the same thing that the timer_struct conversion did
> (added a container_of wrapper) to avoid the ever-repeating use of
> typeof(), long lines, etc.

But then it should use a generic name, instead of each sub-system using
some random name that makes people look up exactly what it does. I'm not
huge fan of the container_of() redundancy, but adding private variants
of this doesn't seem like the best way forward. Let's have a generic
helper that does this, and use it everywhere.

-- 
Jens Axboe

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
