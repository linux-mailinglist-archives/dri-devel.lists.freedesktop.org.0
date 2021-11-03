Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C14443F0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 15:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D176735F7;
	Wed,  3 Nov 2021 14:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55C46735F7;
 Wed,  3 Nov 2021 14:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A6109202038;
 Wed,  3 Nov 2021 15:54:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id PezMLBlkcRZq; Wed,  3 Nov 2021 15:54:30 +0100 (CET)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 95B5F202033;
 Wed,  3 Nov 2021 15:54:30 +0100 (CET)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95)
 (envelope-from <michel@daenzer.net>) id 1miHeo-000sYE-8v;
 Wed, 03 Nov 2021 15:54:30 +0100
Message-ID: <fbe2a47f-4d59-54e1-c294-c5b65fbe9d82@daenzer.net>
Date: Wed, 3 Nov 2021 15:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-CA
To: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211026110740.152936-1-stylon.wang@amd.com>
 <0087f1c6-733e-4c31-63c5-c39da51138c1@daenzer.net>
 <BN9PR12MB5145DB44B7D71979F8277C0BFF8A9@BN9PR12MB5145.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] drm/amd/display: Fix error handling on waiting for
 completion
In-Reply-To: <BN9PR12MB5145DB44B7D71979F8277C0BFF8A9@BN9PR12MB5145.namprd12.prod.outlook.com>
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[ Adding dri-devel ]

On 2021-11-01 16:00, Wang, Chao-kai (Stylon) wrote:
> 
> The problem with -ERESTARTSYS is the same half-baked atomic state with modifications we made in the interrupted atomic check, is reused in the next retry and fails the atomic check. What we expect in the next retry is with the original atomic state. I am going to dig deeper and see if at DRM side we can go back to use to the original atomic state in the retry.

I suspect either DC/DM needs to be able to handle the modified state on retry, or it needs to restore the original state before it returns -ERESTARTSYS.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
