Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 394BA6727A9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A4A10E207;
	Wed, 18 Jan 2023 19:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFE010E1F6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 19:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674068407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VHgRLoz21ZdB+avm4AD7iQRbs1S2YR2I/6RIM3KpT8=;
 b=gChD95YacVi06h5XJVt7NIlIdu3Y8I1fbRBtB9okF+aThKY5IdFv0qEHZHSTAvJD6fIt2g
 1WlJfT52SNgpOrQnInZZ5pRwKx1GOKjBhQO3XBhP9m0Sfk68zvRSfUkbiMbZIU83EB+AsX
 CpkvkfgCaj+B9rkgWwrcI/Qd8IyPmIc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-V0ApqKUnMuuudq61somZfw-1; Wed, 18 Jan 2023 14:00:03 -0500
X-MC-Unique: V0ApqKUnMuuudq61somZfw-1
Received: by mail-ej1-f71.google.com with SMTP id
 sh37-20020a1709076ea500b0087760a6acceso1518903ejc.17
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 11:00:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6VHgRLoz21ZdB+avm4AD7iQRbs1S2YR2I/6RIM3KpT8=;
 b=bwVcMC1eUOWJaMGGOtN/tKM9Xwf+1HupqFT+PBAzGZP5HiG0W6sQUmQHrjOYpGaiEi
 wXoAb5ss1aHdHZ3CPXJAk7bly411nJq7KDwSNAF23Xl0xHdIJOsWY82gaex8TUe1Wux4
 3LAAtmniDmemverVxSrn70aYpN2pGPFBirVM+eF0klci9uIfV58pK5KBq+Xy/OcfzQ+6
 7RA9B5sc0vHefFP9sFFfFBCdJ0nAZ3AMH5UGErNjDG9M4uVUWkf7yDKuPnX1GA/fvi4I
 g84Kl9q9kvrSQlINVHhL7UuaTo411821IZKogOkcf5HRBYzgHnoR2j8+JjgjeMA2QcYp
 74Pg==
X-Gm-Message-State: AFqh2kqoMIZoRDcrENCjzJLlhiKV3pkoKqAH7xQPmEiBdXDRJszs17Xl
 OFZCCROhRy3UDBMZHf+W+SH/u9IYw0ouUJmLcbVjPc4mBKF4I5ul177cTTiI4bwnwwssve6xPWq
 TfZMXq2k+1iNvyJTOE3CCsqrOVIVG
X-Received: by 2002:a17:907:8dca:b0:85f:5d72:1841 with SMTP id
 tg10-20020a1709078dca00b0085f5d721841mr8927954ejc.39.1674068402881; 
 Wed, 18 Jan 2023 11:00:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtsdunAhuQoXTg/VSvgVA6q/ZXPxkW/qMVvnmose4gPIQY/RC2Jhhnm+VqSnkVslMwPuQBExQ==
X-Received: by 2002:a17:907:8dca:b0:85f:5d72:1841 with SMTP id
 tg10-20020a1709078dca00b0085f5d721841mr8927939ejc.39.1674068402689; 
 Wed, 18 Jan 2023 11:00:02 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1709061be100b0086f40238403sm5244115ejg.223.2023.01.18.11.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:00:02 -0800 (PST)
Message-ID: <9830b666-b78c-9794-0d4a-7de31b9fd9b5@redhat.com>
Date: Wed, 18 Jan 2023 20:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 02/14] drm/exec: fix memory leak in
 drm_exec_prepare_obj()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com,
 jason@jlekstrand.net, tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-3-dakr@redhat.com>
 <3c3bd64a-164b-7ff2-ebf0-c8f9c2f94b72@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <3c3bd64a-164b-7ff2-ebf0-c8f9c2f94b72@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/23 09:51, Christian König wrote:
> That one should probably be squashed into the original patch.

Yes, just wanted to make it obvious for you to pick it up in case you 
did not fix it already yourself.

> 
> Christian.
> 
> Am 18.01.23 um 07:12 schrieb Danilo Krummrich:
>> Don't call drm_gem_object_get() unconditionally.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_exec.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>> index ed2106c22786..5713a589a6a3 100644
>> --- a/drivers/gpu/drm/drm_exec.c
>> +++ b/drivers/gpu/drm/drm_exec.c
>> @@ -282,7 +282,6 @@ int drm_exec_prepare_obj(struct drm_exec *exec, 
>> struct drm_gem_object *obj,
>>               goto error_unlock;
>>       }
>> -    drm_gem_object_get(obj);
>>       return 0;
>>   error_unlock:
> 

