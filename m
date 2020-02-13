Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9015BEDC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 14:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D086F5C2;
	Thu, 13 Feb 2020 13:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBD66F5C2;
 Thu, 13 Feb 2020 13:00:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p9so6134529wmc.2;
 Thu, 13 Feb 2020 05:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Q2g4A/qhd4DgQPzYfv7iOKWU99TbXd+zCuOm6idT/7o=;
 b=KRfBXGbOTB8X07YXOUDyYCHM407CZUFvegPxgirVW8vBd9MlVRSPKziD68EOuiOak6
 x+iqDJEkPn+gG4ngnH+FLpu3Y0VgQMNwJGmR+TW+UOFu8jsRoM8IMr6PxUp24qU4KShC
 4DnQCUCtC+q4X4QOADLj1pScM3rNzMs4b5l4Kcf5EsqKrfM9Bcu32N42eb7FjjXm+oCO
 zvO+pqNnRxtpBfi1s7QX2sAY9Sy1GNuopcjSvC0n6mNWEr0A9/u/SjqNLxQoFkSfnNXR
 YrQv41gvkSPwEsfWKSIjTRPlU6xkz0VI7PokQoyRZ1PXc+WQvtqlNUAnH70/d7suHpyv
 +EVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Q2g4A/qhd4DgQPzYfv7iOKWU99TbXd+zCuOm6idT/7o=;
 b=ZWvpywZ7BENoGzVJAao0JzTkzP3yF3poveN+d/X4z859Lnfzelg6KP8o0AJPgZcS+p
 9LuQ+dhFKB+uhX1guJTnYQgGh3pFOz3EiSmK+vpRq+t79Y2O1q7o7/tessDWvYvWV6w+
 iOIyOv0TL3rat6ex8LiF+EalSXjLqZft5UHLs1VdE1aBSvh1Lo9tVss/0cc/AIW21xuu
 lgoeL1OMYmKQKcCc7hSZjOxKH0eoLrUfE1ZzwXdhYE2ODJ9SBldSK7IU7Pzg9IWpoAE4
 RkXEPoCbJFJwBI8DwR34BdD06rCAxV3OmkxJ0QbBPS9xuGnskcYyboks/bir+uUE036v
 OjtQ==
X-Gm-Message-State: APjAAAVqwOLfb1asKAYwJufWb3ltebDhjf0JfVKee7mtvXzAm9ESUVOs
 lBXS5uPnr6boZdUlt066iZU=
X-Google-Smtp-Source: APXvYqwTPmUtKXFtnWgjHxFTvO1C3HPL/xSnhByXds1s9ofmlPizkPqv6+d/y3cZKNEhRICz6raV/g==
X-Received: by 2002:a1c:3906:: with SMTP id g6mr6016468wma.49.1581598830982;
 Thu, 13 Feb 2020 05:00:30 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a13sm2792119wrp.93.2020.02.13.05.00.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Feb 2020 05:00:30 -0800 (PST)
Subject: Re: [RFC PATCH 2/6] drm/radeon: don't use ttm bo->offset
To: Nirmoy <nirmodas@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-3-nirmoy.das@amd.com>
 <21dc2b96-fd7d-19e4-bda6-ebdae2051435@amd.com>
 <bacde18d-3db6-8752-a4ba-2fddf0e406a0@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <10d62138-bb51-155e-ac57-0f23c9c2943e@gmail.com>
Date: Thu, 13 Feb 2020 14:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bacde18d-3db6-8752-a4ba-2fddf0e406a0@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTMuMDIuMjAgdW0gMTM6MzEgc2NocmllYiBOaXJtb3k6Cj4KPiBPbiAyLzEzLzIwIDE6MTgg
UE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IExvb2tzIGxpa2UgbW9zdCBvZiB0aGUgcGF0
Y2ggaXMgbWlzc2luZz8KPj4KPj4gV2Ugc2hvdWxkIGhhdmUgcXVpdGUgYSBudW1iZXIgb2YgdXNl
cyBvZiB0aGUgQk8gb2Zmc2V0IGluIHJhZGVvbiBvciAKPj4gZG8gYWxsIG9mIHRob3NlIGdvIHRo
cm91Z2ggcmFkZW9uX2JvX2dwdV9vZmZzZXQ/Cj4gQ29tcGlsYXRpb24gd29ya2VkIHNvIEkgdGhp
bmsgYWxsIHRob3NlKGJvLT5vZmZzZXQpIGFjY2Vzc2VzIHdlbnQgCj4gdGhyb3VnaCByYWRlb25f
Ym9fZ3B1X29mZnNldC4KCkNvb2wsIHRoYW4gdGhhdCBpcyBhIGxvdCBlYXNpZXIgdG8gaW1wbGVt
ZW50IHRoYW4gSSB0aG91Z2h0IGl0IHdvdWxkIGJlLgoKSSBhc3N1bWUgeW91IGRvbid0IGhhdmUg
UmFkZW9uIGhhcmR3YXJlIGx5aW5nIGFyb3VuZCB0byB0ZXN0IHRoaXM/CgpJZiB5b3UgY2FuIHlv
dSBnaXZlIG1lIGEgYnJhbmNoIG9uIHRoZSBBTUQgKG9yIHB1YmxpYykgc2VydmVycyBJIGNhbiAK
Z2l2ZSBpdCBhdCBsZWFzdCBhIHF1aWNrIHJvdW5kIG9mIHRlc3RpbmcuCgpDaHJpc3RpYW4uCgo+
Pgo+PiBJZiB5ZXMgdGhlbiB0aGUgY2hhbmdlIGlzIG11Y2ggc21hbGxlciB0aGFuIEkgdGhvdWdo
dCBpIG5lZWRzIHRvIGJlLgo+Pgo+PiBDaHJpc3RpYW4uCj4+Cj4gUmVnYXJkcywKPgo+IE5pcm1v
eQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
