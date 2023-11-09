Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A75E27E6660
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB8910E1F6;
	Thu,  9 Nov 2023 09:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7DD10E1F6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699521282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIY6KLcsIbjCisPn3/PDw/7ArICiha1dq7DIQcOuaoM=;
 b=EnQtIN/SB5lR6rUZgwP0f+2VDe4Mu7lMfq8RJESTb1X8RzKgmacVit7xx2LzBklKBntI/D
 XvlcDtlt/zTKfZssix8AZH14LotsXM2gozC7bp2R3+ZX48JMTfE0SFBddr92p0fgbrK0K0
 TQyhrB/kI/KPmqRYDUXiXc8q58z2gKM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-rG9ce1HoOVGKssOnIb7vtg-1; Thu, 09 Nov 2023 04:14:41 -0500
X-MC-Unique: rG9ce1HoOVGKssOnIb7vtg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9bfbc393c43so15948466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699521280; x=1700126080;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rlxAh75JGCxuVSjk/DiobkLepAxu5g+JZPGhaCfgbCo=;
 b=j/wdX8ifG4+r3xHhI7YjDmK2j6CrMYbfCM1pP6E7BO8BMTKnNXXt9RazG8U6+R13yi
 rSw1x5BrfeX2TWZUWbMgLE9Ib8Zu+kzpziwslZAIU4mWj5OQALXfk/zpxgVp/btPf3xh
 WYFlDRVMSV/84ClToMHYMJy8Uzn4lMrIRtyd5Vue8njtUj1HL3iUlhRoSswvaYHyVT8t
 E+w8+XV4IyzyaFA+ZKKK1bRZOAvAWG8Cp4EtQUF8oGE3IWWhwsF9d+P7EfM+Z46h3RoU
 BClm0pmCAKpf5LvLf83Uu4gdyJICSNBYRIig1Jhx4HQQmGnREWqWksB1GkfLQ9ojkWHC
 Nqzg==
X-Gm-Message-State: AOJu0YxazotdQL8DtbMmhFna2/eB333r2Zvz2G+fmlHhKrPp+zocWWOX
 kUspSiACPfqV8D2bAAePzpvyt0w1WwWziV4w+Mt0rthIR2s6a7GicOLm5/vHq71kLo0TquE5Xzk
 2x5masksWikP44dKtcLNlVaUvfyuL
X-Received: by 2002:a17:906:e84:b0:9e3:a1a9:3db3 with SMTP id
 p4-20020a1709060e8400b009e3a1a93db3mr3052483ejf.0.1699521280329; 
 Thu, 09 Nov 2023 01:14:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrN7rWZV1LJySiH/LlJHce45p7c2N1o4c7lFbPUX87ekT7bdY/faJ0o5ksbIAqMgIYGTojqQ==
X-Received: by 2002:a17:906:e84:b0:9e3:a1a9:3db3 with SMTP id
 p4-20020a1709060e8400b009e3a1a93db3mr3052473ejf.0.1699521280043; 
 Thu, 09 Nov 2023 01:14:40 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 dv16-20020a170906b81000b009a1c05bd672sm2252071ejb.127.2023.11.09.01.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:14:39 -0800 (PST)
Message-ID: <adde2b31fdd9e7bb4a09f0073580b840bea0bab1.camel@redhat.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Nov 2023 10:14:37 +0100
In-Reply-To: <20231106024413.2801438-9-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
[...]
> @@ -3421,7 +3446,7 @@ static inline struct page *skb_frag_page(const skb_=
frag_t *frag)
>   */
>  static inline void __skb_frag_ref(skb_frag_t *frag)
>  {
> -=09get_page(skb_frag_page(frag));
> +=09page_pool_page_get_many(frag->bv_page, 1);

I guess the above needs #ifdef CONFIG_PAGE_POOL guards and explicit
skb_frag_is_page_pool_iov() check ?


Cheers,

Paolo

