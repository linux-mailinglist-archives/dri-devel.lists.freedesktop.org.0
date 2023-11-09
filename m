Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB897E6E40
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 17:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81AF10E8DF;
	Thu,  9 Nov 2023 16:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6406810E8E2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 16:07:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32fb190bf9bso1357394f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 08:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699546038; x=1700150838; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bLnVRYPlFfc13GAjjN2Xsp7jGpHoZsbxAdnsHea6XjM=;
 b=MbqVm8yC8ne6wiMIvJmBPmh15nqEhP/+/o0tfPeb3xh06JcXDpEkWc7Jgk1vCpuK0G
 5bL82pl1J8JVb0jkOqulyO0/tZnxIKDFClsbHBXZVZicQpV7SX0h5Giqm9Cpp01Hwvip
 O+tuKswGy7E8jzEUdjDx6SBiAhr3wazKto4xvJ4Qko4oTt5d3+9BBeVbu3G/Wy9CUiGO
 SvkysLWIIkzTuyOsDAszuYM1zNQ0fBp/84Jt0HRXWHox/TJcAo0PcbSHUd2YkatKYOuw
 4Oi6r055yWZlj/H4fUeDhK7/1CVMNA94k+XUwY3ZL6K78OTK7iLrvDg165envHyPuwRc
 +WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699546038; x=1700150838;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bLnVRYPlFfc13GAjjN2Xsp7jGpHoZsbxAdnsHea6XjM=;
 b=KsopNPo/KKLzAoGw2ANm/+SlR2GD++GyPmIjdJzMh1fX1lftpjkx4A4V+y59c83yoT
 +y53wx6Uc3N2KXu+2FBtw85a9FeXqvRkVm9IQDWrNf4kMN6SVQsBm/roh6ks9D2COTnw
 AJDAErLMiMTXC75VJ25xgqvUYNHFUzb06tQeY5NaFwBZG2veOUYCRypPKdS355XR4+lr
 Gqutm55ZznUtB11hXHsj5nriHTkHyK3EM3F92l+1I+SItvbFE1If32ZIMcy4fU5hgCbT
 LDHhHR8QV0AIm5gUccwEAxSVh4lhLvnApK2uHLsix/URLy4fwlRsQlpo7QFrbjT5GR26
 a4RA==
X-Gm-Message-State: AOJu0YzrNlWhs7SCxYmgf57EDnkojTE9BPpmiBZl2CYgoGcQXMe2imrp
 GgNt4F0mymeuSPzY8WeCGy0=
X-Google-Smtp-Source: AGHT+IGVRroWe9+M86SBSGyIl3Qj9MvOmsO9RPSIFo66Ff8BWlVF0jn+QQTFhXSBQi9W892f6tI7Bg==
X-Received: by 2002:a05:6000:1888:b0:32f:87e8:707d with SMTP id
 a8-20020a056000188800b0032f87e8707dmr7113717wri.5.1699546037464; 
 Thu, 09 Nov 2023 08:07:17 -0800 (PST)
Received: from [192.168.1.122]
 (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d42ca000000b0032f7fab0712sm7577069wrr.52.2023.11.09.08.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 08:07:17 -0800 (PST)
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: Mina Almasry <almasrymina@google.com>, David Ahern <dsahern@kernel.org>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
 <CAKH8qBueYgpxQTvTwngOs6RNjy9yvLF92s1p5nFrobw_UprNMQ@mail.gmail.com>
 <93eb6a2b-a991-40ca-8f26-f520c986729a@kernel.org>
 <CAF=yD-Ln4v8orUne8E7D2_eHu39PWPCrMR3Qtuh312pCu=erng@mail.gmail.com>
 <CAHS8izOU06ceKyc5oVZhdCKJqmeRdcRyJBFpjGe=u2yh=V52dQ@mail.gmail.com>
 <7ce2d027-1e02-4a63-afb7-7304fbfbdf90@kernel.org>
 <CAHS8izM_qrEs37F=kPzT_kmqCBV_wSiTf72PtHfJYxks9R9--Q@mail.gmail.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <6f853286-e463-b684-cc1e-405119528697@gmail.com>
Date: Thu, 9 Nov 2023 16:07:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHS8izM_qrEs37F=kPzT_kmqCBV_wSiTf72PtHfJYxks9R9--Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2023 02:39, Mina Almasry wrote:
> On Wed, Nov 8, 2023 at 7:36 AM Edward Cree <ecree.xilinx@gmail.com> wrote:
>>  If not then surely the way to return a memory area
>>  in an io_uring idiom is just to post a new read sqe ('RX descriptor')
>>  pointing into it, rather than explicitly returning it with setsockopt.
> 
> We're interested in using this with regular TCP sockets, not
> necessarily io_uring.
Fair.  I just wanted to push against the suggestion upthread that "oh,
 since io_uring supports setsockopt() we can just ignore it and it'll
 all magically work later" (paraphrased).
If you can keep the "allocate buffers out of a devmem region" and "post
 RX descriptors built on those buffers" APIs separate (inside the
 kernel; obviously both triggered by a single call to the setsockopt()
 uAPI) that'll likely make things simpler for the io_uring interface I
 describe, which will only want the latter.

-ed

PS: Here's a crazy idea that I haven't thought through at all: what if
 you allow device memory to be mmap()ed into process address space
 (obviously with none of r/w/x because it's unreachable), so that your
 various uAPIs can just operate on pointers (e.g. the setsockopt
 becomes the madvise it's named after; recvmsg just uses or populates
 the iovec rather than needing a cmsg).  Then if future devices have
 their memory CXL accessible that can potentially be enabled with no
 change to the uAPI (userland just starts being able to access the
 region without faulting).
And you can maybe add a semantic flag to recvmsg saying "if you don't
 use all the buffers in my iovec, keep hold of the rest of them for
 future incoming traffic, and if I post new buffers with my next
 recvmsg, add those to the tail of the RXQ rather than replacing the
 ones you've got".  That way you can still have the "userland
 directly fills the RX ring" behaviour even with TCP sockets.
