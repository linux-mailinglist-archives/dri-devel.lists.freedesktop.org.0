Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19BF5AF125
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBA810E702;
	Tue,  6 Sep 2022 16:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046DB10E097
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662483160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQ92NUT9dpOIOuh5JEtBNQB9tI+VZBsLJQDfjydKtY8=;
 b=URXe2NEyqazQ4KrNMdLiNbdKKYPnzwnxziA+jYZGx/SsqmdTUAyvdNs09Bu+9IlEDRAv2G
 l1YF7ZftcP+wM5azN73vTSFn3nTR7RfkmA8vRbzGZRN+lT9jqB845R6HA2BfcavSS7P03a
 4+ayU/GbmWEpFiflGrsr/s0nqKER578=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-172-ViDcLVbkMSSl5aup0WZOjQ-1; Tue, 06 Sep 2022 12:52:39 -0400
X-MC-Unique: ViDcLVbkMSSl5aup0WZOjQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x21-20020a05640226d500b0044856301c62so7919265edd.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 09:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rQ92NUT9dpOIOuh5JEtBNQB9tI+VZBsLJQDfjydKtY8=;
 b=EIBTLnrBUg2uh9szSaD9Q3UeJ2Fh9BnXTGzC5LlAui1Gzdh6fzybQ3UIHESWI1q9CL
 mCidsPqmV1IsNY1rN3lP84Z2kC5xj6q6XQcRl0n48+gnf3mu4TQdLtJf8ElcCRqQjWOU
 9ojN4tXpXTGhg8zrNKqyrIoei/Uy+pWq+bLByPBoTkeYocV0nLkI9tjRBNlmIbSLYi1Z
 Ht6K6LWBZUxsFuFIKSJIDq6T5kxgWjJhpt3cnXKVuVhoki2sLi0vNg1trkDrLr2SVXjJ
 bGmEnOly2MtY7WfOf4otTG9l8uIVWYqk0p47Q8rjb32oYLG6uz6vz5EUBFYh0G9+Gbpt
 0eTg==
X-Gm-Message-State: ACgBeo21ppOuxaALne7EbeVqBlXLPHuLZdQwTS9g3KGvqUNMAhEFacc6
 nz0nLBWGufU4inUmBVs55gyN4hq/RJ8YPp3gpHy7da7gliG0q1FaMLDLEg6+5GQjTxRvDeJHecZ
 i3gSkXu8VW/VwwloVZzzOazHn6rRr
X-Received: by 2002:a17:907:971e:b0:731:48b3:6fb7 with SMTP id
 jg30-20020a170907971e00b0073148b36fb7mr40754486ejc.267.1662483157950; 
 Tue, 06 Sep 2022 09:52:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5VGNG+Occ2fyj39ID0jLmukzZ7WO16/W1HhzjGw7s/0lrDlWL3FId7joDN8+cdv4Cer+ercw==
X-Received: by 2002:a17:907:971e:b0:731:48b3:6fb7 with SMTP id
 jg30-20020a170907971e00b0073148b36fb7mr40754481ejc.267.1662483157823; 
 Tue, 06 Sep 2022 09:52:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 by12-20020a0564021b0c00b00445e1489313sm8688660edb.94.2022.09.06.09.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 09:52:37 -0700 (PDT)
Message-ID: <7db298d6-540d-cbc9-4ad3-76550a27fad9@redhat.com>
Date: Tue, 6 Sep 2022 18:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] drm/gma500: Fix crtc_vblank reference leak when
 userspace queues multiple events
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220905133738.466490-1-hdegoede@redhat.com>
 <20220905133738.466490-3-hdegoede@redhat.com>
 <530089c9-59c2-8ff9-a547-b25d5ad04c59@mailbox.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <530089c9-59c2-8ff9-a547-b25d5ad04c59@mailbox.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michel,

On 9/6/22 12:25, Michel Dänzer wrote:
> On 2022-09-05 15:37, Hans de Goede wrote:
>> The gma500 page-flip code kinda assume that userspace never queues more
>> then 1 vblank event. So basically it assume that userspace does:
>>
>> - page-flip
>> - wait for vblank event
>> - render
>> - page-flip
>> - etc.
>>
>> In the case where userspace would submit 2 page-flips without waiting
>> for the first to finish, the current code will just overwrite
>> gma_crtc->page_flip_event with the event from the 2nd page-flip.
> 
> This cannot happen. Common code returns -EBUSY for an attempt to submit a page flip while another one is still pending.

Ah I did not know that, that is very useful to know, thank you.

I will drop this patch for the next version of this patch-set
(which will include some further fixes).

Regards,

Hans

