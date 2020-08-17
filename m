Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E68247FCC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8602689C83;
	Tue, 18 Aug 2020 07:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E609B89F07
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 20:02:21 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id v15so8623883pgh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=97DJCt1f0pZE/lulXm7MIIWiJdssbmLKs4FWP+jsWew=;
 b=aSZhdkNSZ87cEFa5bVOxaRgbLX85Ac+f9y0d86ayXObRrHbI44P6QsGc3j0vxCaOtG
 T2k2WOgfibXFL7wthStQUZ2a3THDVNOGIm8YJURtA34YheOr2MAVAuh07KvbwkyanYJS
 0EG510E/ggHXtfUb6SqMiyn275eeX4FnCQjVBA0Ynkest98IGBIFATGO7FCiNvsrRbkh
 fmWOvmbqhkjk1q/XQS+NvaPIgrNKptwTVoidsz8P1vd8W5lrCq8X1NqQRsc/NszaPSZV
 B+EkeoLweuq1QOusC/DDv9aQ54VFoeSpo/Y8VIPH3trT8rbQk4iBVBt328RQJCy4a+pu
 mrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=97DJCt1f0pZE/lulXm7MIIWiJdssbmLKs4FWP+jsWew=;
 b=Ftfypwv3l3UoIKqtocDQ6JSRFAyY9810KFetou727vgiOViiLZ8zPROhq0h5gd4wax
 BPT7subuG4EBuVzRXtZt0NXYHAKLUwgUdFwz2SPw57R6NmfDrWqpDiiHbac7/GE3ZH8u
 IDW7hINBs/UiE3LAkRIvdp6NrhHEqxJydmZw5QiCQMf/iZZM+9cGfWWtrDQSkmUyZiJR
 Pabk3zBJAOQvgZpO3GqbqivCSjQMwhJcEXACIa9N96D9aZynxPYw1jSESIYCCgsEWM9q
 Ek+9V8AevOAAeUpVAub6xxng5/FJ2pLM8wFAC6jSm4ieky2OfcALWU+xViGo9iRsaxwk
 d0Vg==
X-Gm-Message-State: AOAM533lJqAi1uzOFyx1V9vRsyhSzmeGT86z4E7yWFSIgcbYDswqPHmX
 LLGvazQRxo3b9zsgkt2OMI7/Mg==
X-Google-Smtp-Source: ABdhPJx6fgKnzdqFet7WfKg8Bw76iQ/G91m6PuMxHTNY08ReQtFVhesqdO2JpfqR2BskRMIqTcZ09Q==
X-Received: by 2002:a63:d143:: with SMTP id c3mr10873272pgj.306.1597694541448; 
 Mon, 17 Aug 2020 13:02:21 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:bd62:5cef:d7f8:5bff?
 ([2605:e000:100e:8c61:bd62:5cef:d7f8:5bff])
 by smtp.gmail.com with ESMTPSA id c27sm18199498pgn.86.2020.08.17.13.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 13:02:20 -0700 (PDT)
Subject: Re: [PATCH] block: convert tasklets to use new tasklet_setup() API
To: Kees Cook <keescook@chromium.org>
References: <20200817091617.28119-1-allen.cryptic@gmail.com>
 <20200817091617.28119-2-allen.cryptic@gmail.com>
 <b5508ca4-0641-7265-2939-5f03cbfab2e2@kernel.dk>
 <202008171228.29E6B3BB@keescook>
 <161b75f1-4e88-dcdf-42e8-b22504d7525c@kernel.dk>
 <202008171246.80287CDCA@keescook>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <df645c06-c30b-eafa-4d23-826b84f2ff48@kernel.dk>
Date: Mon, 17 Aug 2020 13:02:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202008171246.80287CDCA@keescook>
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

On 8/17/20 12:48 PM, Kees Cook wrote:
> On Mon, Aug 17, 2020 at 12:44:34PM -0700, Jens Axboe wrote:
>> On 8/17/20 12:29 PM, Kees Cook wrote:
>>> On Mon, Aug 17, 2020 at 06:56:47AM -0700, Jens Axboe wrote:
>>>> On 8/17/20 2:15 AM, Allen Pais wrote:
>>>>> From: Allen Pais <allen.lkml@gmail.com>
>>>>>
>>>>> In preparation for unconditionally passing the
>>>>> struct tasklet_struct pointer to all tasklet
>>>>> callbacks, switch to using the new tasklet_setup()
>>>>> and from_tasklet() to pass the tasklet pointer explicitly.
>>>>
>>>> Who came up with the idea to add a macro 'from_tasklet' that is just
>>>> container_of? container_of in the code would be _much_ more readable,
>>>> and not leave anyone guessing wtf from_tasklet is doing.
>>>>
>>>> I'd fix that up now before everything else goes in...
>>>
>>> As I mentioned in the other thread, I think this makes things much more
>>> readable. It's the same thing that the timer_struct conversion did
>>> (added a container_of wrapper) to avoid the ever-repeating use of
>>> typeof(), long lines, etc.
>>
>> But then it should use a generic name, instead of each sub-system using
>> some random name that makes people look up exactly what it does. I'm not
>> huge fan of the container_of() redundancy, but adding private variants
>> of this doesn't seem like the best way forward. Let's have a generic
>> helper that does this, and use it everywhere.
> 
> I'm open to suggestions, but as things stand, these kinds of treewide

On naming? Implementation is just as it stands, from_tasklet() is
totally generic which is why I objected to it. from_member()? Not great
with naming... But I can see this going further and then we'll suddenly
have tons of these. It's not good for readability.

> changes end up getting whole-release delays because of the need to have
> the API in place for everyone before patches to do the changes can be
> sent to multiple maintainers, etc.

Sure, that's always true of treewide changes like that.

-- 
Jens Axboe

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
