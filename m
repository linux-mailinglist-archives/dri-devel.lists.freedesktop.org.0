Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394B7631DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 11:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134E110E1CE;
	Wed, 26 Jul 2023 09:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E26910E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:25:12 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-682a5465e9eso1486035b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690363511; x=1690968311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ajWZi1kTG9ZsFll3P13XRfH/M90QTcK5ZSE2yNZ8xrc=;
 b=FbQ/cU5KkBidPkx8Y2uGYCzGutSB6xNfkWiQEKQsSST8W9zvQhHhApft87PlLY8dLU
 DGKfOcVpxkQTOOl80Aro56BnjlNO41fZWD7CmV5GDlB1LjEDjOf3Kop2mVKp+naFiQzY
 As6MgqOMDkFvMljdz6Un/7KTBl/NUqtiNwtAlVNm8YXgeUKehHDEJVTDK07iwDWpbMUs
 Auk85ACWfB5lfW+mTAMWhogzlI0RHaQpyoe7zLfXc22574NosN/xSHT+kEdNg0VX/lgH
 cTQssA2/OElC5yJBDMwL3y7p8+2qs+uUi9JaKT2yW1TXFErKU2nPA1SSCU5AFvvQq6bi
 em9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690363511; x=1690968311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajWZi1kTG9ZsFll3P13XRfH/M90QTcK5ZSE2yNZ8xrc=;
 b=GenqxENVp0F/jX3MQnwwNRG0V6xrr1l/pED+P4w44eV6b/ef1OX69tBfwHKVMLmfgJ
 IV3hakQurtOcxYiVDsIxOxACP5Gf+hM5g0XF7+gpyA73OwtcudbHq4UWDN4dtL/88DBz
 FopB+3lI0oxZfr/WFKEHYoFIhqzESQ9ZjwLPn3z8gWGCDHOcaa459vn2btRFOyWJWGiX
 VSGagexog6G8HyordLZlsjkweCPKqoMUGZNfeMQ1zN+K/rvbWQvWX6ss4AXzudfYiJ15
 qF7eIEJwqhB2HoUV2T0F/B0xfbXjKPnRa6fMHLo5OXOlukLecId54schU3jQoYfCoY+f
 qXdw==
X-Gm-Message-State: ABy/qLYqLKsBCMkmmiGOd3TE06Ob7TNfNdofQEb8vWY047uy/HqnDPLq
 1/gfiYVIGTpjlQoxTUhq8HLxyw==
X-Google-Smtp-Source: APBJJlH7Lt4w+KKgSvUzSkJhF0oF8+b3ljHzveqc3Noqsk7KflIEw6xDKQ/sXRTNdo5n0Hc+oIf56w==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id
 o26-20020a056a20729a00b00100b92be8bemr1785615pzk.2.1690363511718; 
 Wed, 26 Jul 2023 02:25:11 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 h2-20020aa786c2000000b00682a99b01basm2004283pfo.0.2023.07.26.02.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:25:11 -0700 (PDT)
Message-ID: <491f5c8f-ccc6-dab8-71b3-caeedc8c4b39@bytedance.com>
Date: Wed, 26 Jul 2023 17:24:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 17/47] rcu: dynamically allocate the rcu-lazy shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-18-zhengqi.arch@bytedance.com>
 <3A164818-56E1-4EB4-A927-1B2D23B81659@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <3A164818-56E1-4EB4-A927-1B2D23B81659@linux.dev>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org,
 Roman Gushchin <roman.gushchin@linux.dev>, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 yujie.liu@intel.com, Vlastimil Babka <vbabka@suse.cz>,
 linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 tytso@mit.edu, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/26 15:04, Muchun Song wrote:
> 
> 
>> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
>>
>> Use new APIs to dynamically allocate the rcu-lazy shrinker.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>> kernel/rcu/tree_nocb.h | 19 +++++++++++--------
>> 1 file changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
>> index 43229d2b0c44..919f17561733 100644
>> --- a/kernel/rcu/tree_nocb.h
>> +++ b/kernel/rcu/tree_nocb.h
>> @@ -1397,12 +1397,7 @@ lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>> return count ? count : SHRINK_STOP;
>> }
>>
>> -static struct shrinker lazy_rcu_shrinker = {
>> -	.count_objects = lazy_rcu_shrink_count,
>> -	.scan_objects = lazy_rcu_shrink_scan,
>> -	.batch = 0,
>> -	.seeks = DEFAULT_SEEKS,
>> -};
>> +static struct shrinker *lazy_rcu_shrinker;
> 
> Seems there is no users of this variable, maybe we could drop
> this.

Yeah, will change it to a local variable. And the patch #15 is
the same.

> 
