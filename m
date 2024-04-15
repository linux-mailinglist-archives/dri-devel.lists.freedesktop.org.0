Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2018A58B9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 19:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7CE10E782;
	Mon, 15 Apr 2024 17:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iQldb/Qc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F110E6D6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sg3b+2cNoZ81gja0weDCuFLWo3vrWyU/RMk60odL1I0=; b=iQldb/Qc5xFMnlxYRa7eYPZAi6
 KYStvuJGeFua8kozbQosOm+SP216uX+4uaict3666qyuQoQ4V21n+ytX/3br4w2CAIgTN+smSBC0Q
 DVJDeTF4cagVzUzvKzJdX0v+XAPUMX5TAD94Zq9uD10DcVSc49rC9fdb2vIxPkOn5C3XcboRKSFtr
 v6clGq/fusEfBbToWdUHnCLc6YeuSBtD+AkCrJpS3CkGfMQrjdf+ofy5PbgJzZSTgSTnQIzvLkOkw
 PTkXvp75AINlUlOqJnNEEhxi8COh8Ho0yLVyzmxHK1IHmiAAiff1KZbsQf3Aiw+4uGIAbja4R4qzu
 hesXEnNw==;
Received: from [177.34.169.177] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwPp8-004qDq-8a; Mon, 15 Apr 2024 19:08:54 +0200
Message-ID: <cb5dbffc-98d7-41e9-8a08-774d1f575b29@igalia.com>
Date: Mon, 15 Apr 2024 14:08:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Do not build debugfs related code when
 !CONFIG_DEBUG_FS
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, "T.J. Mercier"
 <tjmercier@google.com>, Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20240328145323.68872-1-tursulin@igalia.com>
 <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
 <9a063c39-6d2f-43c3-98b3-e4f8c3c6e9c4@ursulin.net>
 <1e94363a-b449-4efb-b2fe-c1dd710b57c9@amd.com>
 <4342d02c-a180-4a7e-8ef6-4ece51aba946@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <4342d02c-a180-4a7e-8ef6-4ece51aba946@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On 4/1/24 10:21, Tvrtko Ursulin wrote:
> 
> On 01/04/2024 13:45, Christian König wrote:
>> Am 01.04.24 um 14:39 schrieb Tvrtko Ursulin:
>>>
>>> On 29/03/2024 00:00, T.J. Mercier wrote:
>>>> On Thu, Mar 28, 2024 at 7:53 AM Tvrtko Ursulin <tursulin@igalia.com> 
>>>> wrote:
>>>>>
>>>>> From: Tvrtko Ursulin <tursulin@ursulin.net>
>>>>>
>>>>> There is no point in compiling in the list and mutex operations 
>>>>> which are
>>>>> only used from the dma-buf debugfs code, if debugfs is not compiled 
>>>>> in.
>>>>>
>>>>> Put the code in questions behind some kconfig guards and so save 
>>>>> some text
>>>>> and maybe even a pointer per object at runtime when not enabled.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>
>>>>
>>>> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>>>
>>> Thanks!
>>>
>>> How would patches to dma-buf be typically landed? Via what tree I 
>>> mean? drm-misc-next?
>>
>> That should go through drm-misc-next.
>>
>> And feel free to add Reviewed-by: Christian König 
>> <christian.koenig@amd.com> as well.
> 
> Thanks!
> 
> Maarten if I got it right you are handling the next drm-misc-next pull - 
> could you merge this one please?

Applied to drm-misc/drm-misc-next!

Best Regards,
- Maíra

> 
> Regards,
> 
> Tvrtko
