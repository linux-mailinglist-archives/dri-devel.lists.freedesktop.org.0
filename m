Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339367E5A26
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BCF10E169;
	Wed,  8 Nov 2023 15:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10D810E79F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:36:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4083f613272so59686955e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 07:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699457764; x=1700062564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LPt/CJC1g4tSFhf5KGS0Ry+DiQk0RfMMoZGIrEp0lNY=;
 b=GfV8RdYpM946UX96mOm9ZplGVaChsjWQEDaNg1Nj85bcIsjp20Wmeq+1yVDZ5CwDYf
 9S4bPdXwNMWyfz/f4vX0mAAhh7F8wBxykEzShEawMCBGgQZEl49l+75kCb4ZLNsR7317
 7k6rYUrHKz8WnR4nNkhYR99CmluPGuIPz8DlrXeLiU40ROcLyv3s85YD8i+Ci/lK9njW
 MXvnhfSqkddtlrs+AhfpPk/+t2mra3YHSmGJ6jLJYDb+eUJ2AlCQRKhE1FF+S4pPlpFf
 WjGxkrM1+MuyvM3f6oK4Y9ydAiN/SxhgPX0uUyjPgDnKYtzYFS1eR7b1GM/nWGFxRHsb
 qzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699457764; x=1700062564;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LPt/CJC1g4tSFhf5KGS0Ry+DiQk0RfMMoZGIrEp0lNY=;
 b=GovEtdelLve24ebVN/b0DL0U7cVLQXhIx4nJdAuSQ8f/iW9ELHHNR3EygzmjL6hsGX
 wkAfLFKPlE2l24jnKvn7ZSPYkoVJslGySvqlC2OalNX26f3HECxzsdWxu6MYmmhYcEgZ
 FNX0JUqTJgDQWyO4lcdpAVR2ZzLjsNTldnrN7jTHWtJ9GUpWUg/5LZk0yWSQSfL55axK
 qE+3rBSeXRh7c3JSI+gc30rgma2rSu1DOSPwtPMzH3st1trWV+yGGhIk2UdlJWXdq4sf
 MLYCCEParwBNOLkEYLHvXkMnAQNN2vqE6fDGZgT9X7gNm/iMHfR22Rs9bJYYA2ip0oOD
 Qr+A==
X-Gm-Message-State: AOJu0YzrggNm2lHAfm+RuNcXivX9ciIptAfcKzlkSMO2m+Ulto7oIClz
 7+oR6o1qsfiZj2G73kyQSxo=
X-Google-Smtp-Source: AGHT+IF6+XqFcBsSe+xR2tBlGaQkYvldRjjMgYC5UQUH7LHHSh48/KBJVp9rOPyfhw3iYoFPLS35kA==
X-Received: by 2002:a05:600c:1c92:b0:405:1bbd:aa9c with SMTP id
 k18-20020a05600c1c9200b004051bbdaa9cmr2058164wms.34.1699457763824; 
 Wed, 08 Nov 2023 07:36:03 -0800 (PST)
Received: from [192.168.1.122]
 (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c444600b0040651505684sm19790325wmn.29.2023.11.08.07.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 07:36:03 -0800 (PST)
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
To: Stanislav Fomichev <sdf@google.com>, Mina Almasry <almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <ZUlYB99GK1Q8is-I@google.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <08a6e65a-92fb-4a94-2627-6c03e65f2509@gmail.com>
Date: Wed, 8 Nov 2023 15:36:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ZUlYB99GK1Q8is-I@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/11/2023 21:17, Stanislav Fomichev wrote:
> I guess I'm just wondering whether other people have any suggestions
> here. Not sure Jonathan's way was better, but we fundamentally
> have two queues between the kernel and the userspace:
> - userspace receiving tokens (recvmsg + magical flag)
> - userspace refilling tokens (setsockopt + magical flag)
> 
> So having some kind of shared memory producer-consumer queue feels natural.
> And using 'classic' socket api here feels like a stretch, idk.

Do 'refilled tokens' (returned memory areas) get used for anything other
 than subsequent RX?  If not then surely the way to return a memory area
 in an io_uring idiom is just to post a new read sqe ('RX descriptor')
 pointing into it, rather than explicitly returning it with setsockopt.
(Being async means you can post lots of these, unlike recvmsg(), so you
 don't need any kernel management to keep the RX queue filled; it can
 just be all handled by the userland thus simplifying APIs overall.)
Or I'm misunderstanding something?

-e
