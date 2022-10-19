Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB86D604DA0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4610E55F;
	Wed, 19 Oct 2022 16:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEEE10E55F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 16:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 06CA63F333;
 Wed, 19 Oct 2022 18:40:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -5.06
X-Spam-Level: 
X-Spam-Status: No, score=-5.06 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.961,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cMW9B3ypcCCt; Wed, 19 Oct 2022 18:40:24 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 1338C3F325;
 Wed, 19 Oct 2022 18:40:23 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 289EE3602C5;
 Wed, 19 Oct 2022 18:40:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1666197623; bh=0Vw5Dho/l3G4bQtINth6VrjbuQeM6ddK9UoxIpvsKsk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cy1vk/qnIOOOy+8sbMU/Z8Xi7GvRcqpTQekdpl0k8L2c3pt6NqcCVE9uGUnK+rMgQ
 5kMOAELqExxA94SiX//qPy9+d4VIkQHvDcWEjSwBbsAI+DL3U5K0EMfgixWEDWtckH
 sMTLQNPSmuqgpn/OjAR09gbXtA1eUDbZQ1avr9bA=
Message-ID: <bb98e4a5-66f4-a870-d477-8f42ade27fa9@shipmail.org>
Date: Wed, 19 Oct 2022 18:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 05/16] drm/vmwgfx: Refactor resource validation hashtable
 to use linux/hashtable implementation.
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20221017195440.311862-1-zack@kde.org>
 <20221017195440.311862-6-zack@kde.org>
 <968d3fa5-aa51-d388-7ec1-7c2e6dfb0911@shipmail.org>
 <3e4aab9f149159e3c860374f2d6fb33e1ec28c7c.camel@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <3e4aab9f149159e3c860374f2d6fb33e1ec28c7c.camel@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Zack,

On 10/19/22 18:32, Zack Rusin wrote:
> On Wed, 2022-10-19 at 12:21 +0200, Thomas Hellström (Intel) wrote:
>> ⚠ External Email
>>
>> On 10/17/22 21:54, Zack Rusin wrote:
>>> From: Maaz Mombasawala <mombasawalam@vmware.com>
>>>
>>> Vmwgfx's hashtab implementation needs to be replaced with linux/hashtable
>>> to reduce maintenence burden.
>>> As part of this effort, refactor the res_ht hashtable used for resource
>>> validation during execbuf execution to use linux/hashtable implementation.
>>> This also refactors vmw_validation_context to use vmw_sw_context as the
>>> container for the hashtable, whereas before it used a vmwgfx_open_hash
>>> directly. This makes vmw_validation_context less generic, but there is
>>> no functional change since res_ht is the only instance where validation
>>> context used a hashtable in vmwgfx driver.
>> Why is a pointer to the vmw_sw_context added to the validation context,
>> rather than a pointer to the new hash table type itself? Seems like an
>> unnecessary indirection which adds a dependency on the sw context to the
>> validation context?
> Hi, Thomas. Thanks for taking a look at this! That's because the entire public
> interface of hashtable depends on it being a struct on which sizeof works rather
> than a pointer, i.e. almost the entire interface of hasthbale.h is defined and they
> all require that HASH_SIZE(hashtable) which is defined as
> #define HASH_SIZE(hashtable) (ARRAY_SIZE(hashtable))
> works on the hashtable. So the interface of hashtable.h can't operate on pointers,
> but rather needs the full struct.
>
> So the only two options are either rewriting the functions from linux/hashtable.h to
> take explicit HASH_SIZE(hashtable) or make sure that in the functions where you will
> use hashtable.h you pass the parent struct so that sizeof on the hashtable works
> correctly. I've seen both approaches in the kernel, but in this case we thought the
> latter made more sense.
>
Ah, Ok, yes, tricky one. Lots of options, none of them perfect.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


