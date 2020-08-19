Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9379524AFCC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B6F6E8EF;
	Thu, 20 Aug 2020 07:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2006E2E0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:17:25 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i10so5846875pgk.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jVlnd4GIq1avq9wCVX6yvVGrSg3V4B5anM3I74fUF2c=;
 b=aq3Djs+JYVFJOgH8pCYQM/bCFdYvnEX3r7XcOPyLDVvHQpULWghKapBRR7Mrnjk+lL
 ZI936ShOp4TWkrvbMHBKCEvkIKqzyiyTin6m81a9jqdlrP2+OEDYJcHB58jIeNBDbd8m
 9LbaNp3X/lBLFmvrut25w3ySdH9n0CHAUyDtUTBXXzVjGYQHigaJt+6Xuk9JIUYNhp/p
 FgUt/Jog4wUzADpawAKv0o63MNRr6Ve3N2jd4wS1pAFyLst7H23CtCfU8iM/CPRbUYHd
 itGN5mv4ExGtnYKFutLBYvVPG9eTW7mTEeiT/7xAmimuqFCHO0Ra40o4kXsfEZ2Savv/
 bwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jVlnd4GIq1avq9wCVX6yvVGrSg3V4B5anM3I74fUF2c=;
 b=anIHOczwVk+ITHjC4woTBT8tCOezyEFpxE2RLoRh9OVh8NU5JLJxFlECTNDV51al2t
 t8mMeKQYQQgKdsQJqfXuOd8xWo/Fruyfrmehg9TzsZi+sDS720DiO7KcQCdyylbj7AWq
 BbcXCmNxD/TDCnYJxk4qv2VNsqZYucFZL9g0fuCB6V/qutgTTqKTdD90+R5D/rXW3NqF
 sESKLQQBNSPVv+pAgObyq4kZeFX6HvrmZ+P+l/2Y8Iz/xWR9FAQ0VeotC5QeqL3/vRcK
 tbF5C0+U22AfPQtTe2Q3w4Fv5EerNkAjUT/iPQo+te4jkmVSPXgKqw5nbeC3FGcxx+nb
 wYQA==
X-Gm-Message-State: AOAM533/KP2tHInUFOwJspkCKyEXUrGHcO27P57cu7xQ3WbBQ7CJgOfO
 Xw9rU6G0odFrIWpfkovIkJN9mQ==
X-Google-Smtp-Source: ABdhPJxi299Hddd0S85ysgsMNI/X0B8d1WB7DsNIxo+ERAydDALt/5xQKxlJ2AQYnw532AABOTNI4Q==
X-Received: by 2002:a62:5214:: with SMTP id g20mr19509095pfb.168.1597843045329; 
 Wed, 19 Aug 2020 06:17:25 -0700 (PDT)
Received: from [192.168.1.182] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id 193sm28368540pfu.169.2020.08.19.06.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 06:17:24 -0700 (PDT)
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
 <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
 <202008171228.29E6B3BB@keescook>
 <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
 <202008171246.80287CDCA@keescook>
 <df645c06-c30b-eafa-4d23-826b84f2ff48@kernel.dk>
 <1597780833.3978.3.camel@HansenPartnership.com>
 <f3312928-430c-25f3-7112-76f2754df080@kernel.dk>
 <20200819131158.GA2591006@kroah.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <4f5a225d-460f-978f-e3cf-3f505140a515@kernel.dk>
Date: Wed, 19 Aug 2020 07:17:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819131158.GA2591006@kroah.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: ulf.hansson@linaro.org, jassisinghbrar@gmail.com, s.hauer@pengutronix.de,
 manohar.vanga@gmail.com, airlied@linux.ie, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux1394-devel@lists.sourceforge.net, anton.ivanov@cambridgegreys.com,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 maximlevitsky@gmail.com, richard@nod.at, deller@gmx.de,
 linux-atm-general@lists.sourceforge.net, 3chas3@gmail.com,
 linux-input@vger.kernel.org, kuba@kernel.org, mporter@kernel.crashing.org,
 jdike@addtoit.com, Kees Cook <keescook@chromium.org>, oakad@yahoo.com,
 intel-gfx@lists.freedesktop.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, broonie@kernel.org,
 openipmi-developer@lists.sourceforge.net, mitch@sfgoth.com,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, martyn@welchs.me.uk, dmitry.torokhov@gmail.com,
 linux-mmc@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 linux-spi@vger.kernel.org, alex.bou9@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, stefanr@s5r6.in-berlin.de,
 sre@kernel.org, linux-ntb@googlegroups.com,
 Romain Perier <romain.perier@gmail.com>, shawnguo@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/19/20 6:11 AM, Greg KH wrote:
> On Wed, Aug 19, 2020 at 07:00:53AM -0600, Jens Axboe wrote:
>> On 8/18/20 1:00 PM, James Bottomley wrote:
>>> On Mon, 2020-08-17 at 13:02 -0700, Jens Axboe wrote:
>>>> On 8/17/20 12:48 PM, Kees Cook wrote:
>>>>> On Mon, Aug 17, 2020 at 12:44:34PM -0700, Jens Axboe wrote:
>>>>>> On 8/17/20 12:29 PM, Kees Cook wrote:
>>>>>>> On Mon, Aug 17, 2020 at 06:56:47AM -0700, Jens Axboe wrote:
>>>>>>>> On 8/17/20 2:15 AM, Allen Pais wrote:
>>>>>>>>> From: Allen Pais <allen.lkml@gmail.com>
>>>>>>>>>
>>>>>>>>> In preparation for unconditionally passing the
>>>>>>>>> struct tasklet_struct pointer to all tasklet
>>>>>>>>> callbacks, switch to using the new tasklet_setup()
>>>>>>>>> and from_tasklet() to pass the tasklet pointer explicitly.
>>>>>>>>
>>>>>>>> Who came up with the idea to add a macro 'from_tasklet' that
>>>>>>>> is just container_of? container_of in the code would be
>>>>>>>> _much_ more readable, and not leave anyone guessing wtf
>>>>>>>> from_tasklet is doing.
>>>>>>>>
>>>>>>>> I'd fix that up now before everything else goes in...
>>>>>>>
>>>>>>> As I mentioned in the other thread, I think this makes things
>>>>>>> much more readable. It's the same thing that the timer_struct
>>>>>>> conversion did (added a container_of wrapper) to avoid the
>>>>>>> ever-repeating use of typeof(), long lines, etc.
>>>>>>
>>>>>> But then it should use a generic name, instead of each sub-system 
>>>>>> using some random name that makes people look up exactly what it
>>>>>> does. I'm not huge fan of the container_of() redundancy, but
>>>>>> adding private variants of this doesn't seem like the best way
>>>>>> forward. Let's have a generic helper that does this, and use it
>>>>>> everywhere.
>>>>>
>>>>> I'm open to suggestions, but as things stand, these kinds of
>>>>> treewide
>>>>
>>>> On naming? Implementation is just as it stands, from_tasklet() is
>>>> totally generic which is why I objected to it. from_member()? Not
>>>> great with naming... But I can see this going further and then we'll
>>>> suddenly have tons of these. It's not good for readability.
>>>
>>> Since both threads seem to have petered out, let me suggest in
>>> kernel.h:
>>>
>>> #define cast_out(ptr, container, member) \
>>> 	container_of(ptr, typeof(*container), member)
>>>
>>> It does what you want, the argument order is the same as container_of
>>> with the only difference being you name the containing structure
>>> instead of having to specify its type.
>>
>> Not to incessantly bike shed on the naming, but I don't like cast_out,
>> it's not very descriptive. And it has connotations of getting rid of
>> something, which isn't really true.
> 
> I agree, if we want to bike shed, I don't like this color either.
> 
>> FWIW, I like the from_ part of the original naming, as it has some clues
>> as to what is being done here. Why not just from_container()? That
>> should immediately tell people what it does without having to look up
>> the implementation, even before this becomes a part of the accepted
>> coding norm.
> 
> Why are people hating on the well-known and used container_of()?
> 
> If you really hate to type the type and want a new macro, what about
> 'container_from()'?  (noun/verb is nicer to sort symbols by...)
> 
> But really, why is this even needed?

container_from() or from_container(), either works just fine for me
in terms of naming.

I think people are hating on it because it makes for _really_ long
lines, and it's arguably cleaner/simpler to just pass in the pointer
type instead. Then you end up with lines like this:

	struct request_queue *q =                                               
		container_of(work, struct request_queue, requeue_work.work);  

But I'm not the one that started this addition of from_tasklet(), my
objection was adding a private macro for something that should be
generic functionality. Hence I think we either need to provide that, or
tell the from_tasklet() folks that they should just use container_of().

-- 
Jens Axboe

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
