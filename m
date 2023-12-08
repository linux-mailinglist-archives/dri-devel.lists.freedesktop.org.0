Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8F80AD9F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BE010EB0D;
	Fri,  8 Dec 2023 20:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E291A10EB0D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 20:16:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c3b3caa55so431825e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 12:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702066613; x=1702671413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIAzMCiwJSZ7GUp121efXJqWFAFOgKJGEvOKpU6gcvs=;
 b=EDx75VyU7QxL0SFR8zVwF5eSNg1Qd7Ba2EP80Grd+UXlAjkkCTnLvqWM8xpfm3k9x1
 qGMpfYLyyJs7elwUDiEN6Y570T+0LDHvg3CUJXZ5JaYn4nXYSK97xFz/bDwpKhbF7YXv
 Sy+YLM+jmGepVGUB9BqWjBsLf7GOemZjC3IMQNkW8igJG+DdwzzGzl3jTfYdYFAJnElt
 lvzWdsnH4GTIOIHvXTNJa2tkz2d5tZNPBsx5mZdgpPMkyewg5PR+NOJAwsZMUPzW6Sed
 L5sbxCIqaFpOqaI3muPRpECgHlotGBFeU3PR/SKhrXuYfJgb4hEe2cdTLpskG1EOewwp
 o1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702066613; x=1702671413;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OIAzMCiwJSZ7GUp121efXJqWFAFOgKJGEvOKpU6gcvs=;
 b=NWDlNdMHRuu1ZB4oN6bTgjlbYcRfkESy532QEVqabMAGARFXxe2BxE3yvc+wHRqgBX
 RVrN8drR+xsgrlzYcXJHckiJ3Coim8/TyoCTuyqlLb2j9c6jbgTRNxnlg26ItkIunSTW
 WMYH4VJyiS1LGuIIzrZs0+L7Rt4vTEKJjq/yqUCJHkrgXMw0eaqjFdevPAPdTPibwPO1
 TUB1w4V9gjvVEtq5FT9BKWfYJMsemHF6xErZtj/H3Eg4GpMzZzs7safdQsey+KuNTXjm
 giotzRZtU+0l5/mlMExBSKftOSrI0TRcdNUSoywweVrl+kIIav5I7P1HYMdV59Eh53Mz
 dnIQ==
X-Gm-Message-State: AOJu0Yy96/RegzXzJdw7lEoSOCbzZ1PtEJQtBVIMEVUkme6Xhx40Bnrv
 viZzXUkj0eX1ssjb9M7EcxU=
X-Google-Smtp-Source: AGHT+IH9E/4bnvH9YSWOadmFJf+ut/SYIovjRfbTDYSnJvWRybbbFwlBNw1G8CFwyXdv0OXGnX+rsw==
X-Received: by 2002:a05:600c:54c2:b0:40b:5e1c:5c25 with SMTP id
 iw2-20020a05600c54c200b0040b5e1c5c25mr272170wmb.58.1702066612869; 
 Fri, 08 Dec 2023 12:16:52 -0800 (PST)
Received: from [192.168.8.100] ([85.255.232.89])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c470c00b0040b37f107c4sm2713374wmo.16.2023.12.08.12.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 12:16:52 -0800 (PST)
Message-ID: <48bcbb79-6464-4a46-8070-b59a64018b91@gmail.com>
Date: Fri, 8 Dec 2023 20:09:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
Content-Language: en-US
To: Stanislav Fomichev <sdf@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZUlp8XutSAScKs_0@google.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mina Almasry <almasrymina@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, linux-arch@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/23 22:34, Stanislav Fomichev wrote:
> On 11/06, Willem de Bruijn wrote:
>>>> IMHO, we need a better UAPI to receive the tokens and give them back to
>>>> the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
>>>> but look dated and hacky :-(
>>>>
>>>> We should either do some kind of user/kernel shared memory queue to
>>>> receive/return the tokens (similar to what Jonathan was doing in his
>>>> proposal?)

Oops, missed the discussion.
IMHO shared rings are more elegant here. With that the app -> kernel
buffer return path doesn't need to setsockopt(), which will have to
figure out how to return buffers to pp efficiently, and then potentially
some sync on the pp allocation side. It just grabs entries from the ring
in the napi context on allocation when necessary.
But then you basically get the io_uring zc rx... just saying

>>> I'll take a look at Jonathan's proposal, sorry, I'm not immediately
>>> familiar but I wanted to respond :-) But is the suggestion here to
>>> build a new kernel-user communication channel primitive for the
>>> purpose of passing the information in the devmem cmsg? IMHO that seems
>>> like an overkill. Why add 100-200 lines of code to the kernel to add
>>> something that can already be done with existing primitives? I don't
>>> see anything concretely wrong with cmsg & setsockopt approach, and if
>>> we switch to something I'd prefer to switch to an existing primitive
>>> for simplicity?
>>>
>>> The only other existing primitive to pass data outside of the linear
>>> buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
>>> preferred? Any other suggestions or existing primitives I'm not aware
>>> of?
>>>
>>>> or bite the bullet and switch to io_uring.
>>>>
>>>
>>> IMO io_uring & socket support are orthogonal, and one doesn't preclude
>>> the other.

They don't preclude each other, but I wouldn't say they're orthogonal.
Similar approaches, some different details. FWIW, we'll be posting a
next iteration on top of the pp providers patches soon.

>>> As you know we like to use sockets and I believe there are
>>> issues with io_uring adoption at Google that I'm not familiar with
>>> (and could be wrong). I'm interested in exploring io_uring support as
>>> a follow up but I think David Wei will be interested in io_uring
>>> support as well anyway.

Well, not exactly support of devmem, but true, we definitely want
to have io_uring zerocopy, considering all the api differences.
(at the same time not duplicating net bits).

>> I also disagree that we need to replace a standard socket interface
>> with something "faster", in quotes.
>>
>> This interface is not the bottleneck to the target workload.
>>
>> Replacing the synchronous sockets interface with something more
>> performant for workloads where it is, is an orthogonal challenge.
>> However we do that, I think that traditional sockets should continue
>> to be supported.
>>
>> The feature may already even work with io_uring, as both recvmsg with
>> cmsg and setsockopt have io_uring support now.

It should, in theory, but the api wouldn't suit io_uring, internals
wouldn't be properly optimised, and we can't use it with some
important features like multishot recv because of cmsg.

> I'm not really concerned with faster. I would prefer something cleaner :-)
> 
> Or maybe we should just have it documented. With some kind of path
> towards beautiful world where we can create dynamic queues..



-- 
Pavel Begunkov
