Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A602A7FCC1F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 02:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B710E5D6;
	Wed, 29 Nov 2023 01:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A6910E5D4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 01:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701219690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSGCciYfFxwIPQRFv+/e0JSlg77OghN2r+cuBAMmVKU=;
 b=Ba3UZdr0ViBX0EW5P1G8waoDJ9p4kFWRF/L5B88n7UIGdshqfhVafTPZVknFwOdIyMONTj
 6cFuflTuS/ys08ix/QtnBcMU0180ashAM3iTNeD88xRsfc7m1Cjcz6Dnuru+Mqs9fC5ukJ
 Zezdb7I7QSGUPLt/cNN9L3yc3GLMYI4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-dcDlmEnQPNOWTKHCmy7SvQ-1; Tue, 28 Nov 2023 20:01:28 -0500
X-MC-Unique: dcDlmEnQPNOWTKHCmy7SvQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a01c7b09335so496844166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 17:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701219687; x=1701824487;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GSGCciYfFxwIPQRFv+/e0JSlg77OghN2r+cuBAMmVKU=;
 b=GpVCTwYRDtp8TNUWOv5Do2RLP9UTNQIeyWmg7sYi7O11lH5yV+LfXTWKNPVRJq/BSH
 IVII44VvzPpWtrVUFtutXbWYCQP39+YqBbPehOXa+FB8dXkS9TIxEg+pGyU5agxnyEUo
 E5SM5JF5nwS7I9mKgIYo8wKtsBVRlpdev/gvceDSIZnnEAAT5lp9I5PmOsXCkUs1kxNn
 6f9LpMfrM6zsSrVYQ+A/PRkKtY9R9FOrJ88jcJLwpvRAOa3wCJM5Sj9uYxf5+QLup4BY
 iZuwRTA0+A2aqJ+DdMArQxp2mV9v5iXWRh1/N67EgQB22MG/TIlnMOYne30RM7Ph7IvD
 MEvQ==
X-Gm-Message-State: AOJu0YwDUgfZj4w0uy6qGwU0qBGOwZao90OdClaYqHUPCGxV2ClJeYLU
 BiPh1/c12i3/BPWbAbkO0HJ3vqBRshsJ2GPASO0l2oHb9QuFKs7dPfSPR2XD38mLhhwWSOmtHok
 J6/kpnnawqHmn+Ea5iVNBansG/MAU
X-Received: by 2002:a17:906:2886:b0:9fd:1cd7:f68d with SMTP id
 o6-20020a170906288600b009fd1cd7f68dmr12528226ejd.67.1701219687673; 
 Tue, 28 Nov 2023 17:01:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQeFU/7OCm3a5OIDfphx7EB9HRSJKIcJpYxpSBNBkpXwboirjbwJAVpjyUf3WaykM2UmUoVQ==
X-Received: by 2002:a17:906:2886:b0:9fd:1cd7:f68d with SMTP id
 o6-20020a170906288600b009fd1cd7f68dmr12528216ejd.67.1701219687427; 
 Tue, 28 Nov 2023 17:01:27 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a1709064f8c00b00a01892903d6sm7264891eju.47.2023.11.28.17.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 17:01:26 -0800 (PST)
Message-ID: <4b10068c-4285-41df-b4bb-4c61ac70a30b@redhat.com>
Date: Wed, 29 Nov 2023 02:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
To: Timur Tabi <ttabi@nvidia.com>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>
References: <ZVZbX7C5suLMiBf+@work> <ZVZxXiXYIzEwUE3N@pollux>
 <6517a6a41eb72d16596c913dc56467e0390287a3.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <6517a6a41eb72d16596c913dc56467e0390287a3.camel@nvidia.com>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/23 20:55, Timur Tabi wrote:
> On Thu, 2023-11-16 at 20:45 +0100, Danilo Krummrich wrote:
>> As I already mentioned for Timur's patch [2], I'd prefer to get a fix
>> upstream
>> (meaning [1] in this case). Of course, that's probably more up to Timur to
>> tell
>> if this will work out.
> 
> Don't count on it.

I see. Well, I think it's fine. Once we implement a decent abstraction we likely
don't need those header files in the kernel anymore.

@Gustavo, if you agree I will discard the indentation change when applying the
patch to keep the diff as small as possible.

- Danilo

> 
> Even if I did change [0] to [], I'm not going to be able to add the
> "__counted_by(numEntries);" because that's just not something that our build
> system uses.
> 
> And even then, I would need to change all [0] to [].
> 
> You're not going to be able to use RM's header files as-is anyway in the
> long term.  If we changed the layout of PACKED_REGISTRY_TABLE, we're not
> going to create a PACKED_REGISTRY_TABLE2 and keep both around.  We're just
> going to change PACKED_REGISTRY_TABLE and pretend the previous version never
> existed.  You will then have to manually copy the new struct to your header
> files and and maintain two versions yourself.
> 
> 
> 

