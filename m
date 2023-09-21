Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF67A9290
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E134110E105;
	Thu, 21 Sep 2023 08:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC8610E105
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695284721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4DhnAZiF0wr2DyC1BVNbdftxhtvdS4hZnADLGNEsyns=;
 b=T9teBZfYoTABNrjzgFou8/AicZ2sX1N/LLdP4pcdCVaSiN6URbLzf9W/XEFG2q2VSg/0jy
 NUw960mcNXOQiZQyT+tGWq7LYkig+O7iM+zDZPL3ZBhqK8xXKM95z6pOnS2wUqsvx9XUGC
 qGwE1Xwvpr+oBkTEQ2c5f8ZA1ANlCT8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-DH0KS4dnMaaGLd-x9JLnRA-1; Thu, 21 Sep 2023 04:25:19 -0400
X-MC-Unique: DH0KS4dnMaaGLd-x9JLnRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-402cba95486so5600985e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 01:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695284718; x=1695889518;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4DhnAZiF0wr2DyC1BVNbdftxhtvdS4hZnADLGNEsyns=;
 b=HYY0TqccXvWM988UK2vf3Us+yPjrJOofFvxNBqsRiaqLaVr9XJRpyJzsWIezaqkre3
 PRUwfEkK3MNEg22I+zki6jVYF3cQd+EGItn2CZprNX7A5o/Ghhw3gadNI3InbrGDfk8t
 kd3xLbXxqbZmu4qV4OJVUfNBDa5wMP/OUDYl9cpHNz6nQleBmxhVP9FVLO3IF+LMfhgf
 2onPupVI27kydRLZvAelmL/ARg8kZSkHidBSyrJW1uvmysT17SO+7azpaZQZNPOPybLA
 5h1llDdsEgyanjWWWhA2fz8BdUzFYBf67zlyX7WSVED+o+THgGGeK18pavq+DyXS2eMt
 vSAA==
X-Gm-Message-State: AOJu0YxTI8c0Vta8cXkebidkggL+1c6mubhNZIXTXdI/0iqnZ7XL0VO6
 37S0fj3EeFHbQn/j4kOcTeaRWt0r0Wa/tKVZKAZeyIxHkoxUxnSSMmqPqGhsf6RUkJhvTn+Evpr
 pzNrol5NGwMAthhfDzWveiW8XXx1o+ZoFCekB
X-Received: by 2002:a05:600c:2058:b0:3fe:207c:1aea with SMTP id
 p24-20020a05600c205800b003fe207c1aeamr4169768wmg.23.1695284718632; 
 Thu, 21 Sep 2023 01:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMlLW9jOSs0MCkR9x1s1+0fp5+Yk4QxI0G/9XOImPxYltcXjOlbzST6Z0ZyPnmg3ZZkvlI6Q==
X-Received: by 2002:a05:600c:2058:b0:3fe:207c:1aea with SMTP id
 p24-20020a05600c205800b003fe207c1aeamr4169758wmg.23.1695284718288; 
 Thu, 21 Sep 2023 01:25:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c444e00b0040535648639sm797911wmn.36.2023.09.21.01.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 01:25:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
In-Reply-To: <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
 <2p53aei56tlr7k6w5oawlwpmv2k7agpbb6wfwpxcg3rqyueyrx@2as7tijrgnh4>
Date: Thu, 21 Sep 2023 10:25:17 +0200
Message-ID: <875y44kk5u.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> On Thu, Sep 21, 2023 at 09:57:22AM +0200, Geert Uytterhoeven wrote:

[...]

>> Anything else confuses the casual reader. Perhaps the real question is whether
>> the structures should have "helper" in their name in the first place?
>
> Those structures are meant for functions used by the helpers, they are not
> helper functions.
>

Ah, that makes more sense. I wasn't aware of that.

If that's the case, then the split makes more sense to me now.

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

