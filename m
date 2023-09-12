Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5139C79D571
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 17:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AF210E080;
	Tue, 12 Sep 2023 15:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB82C10E080
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 15:58:02 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RlSsf17bCz9sTb;
 Tue, 12 Sep 2023 17:57:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1694534278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogjrz5GFqjH3DW6OBPDcUdZgmEiIoyhQyyEbaq0f1+k=;
 b=Tth7556KDi1SofDZJrzCHwgwf/WnVcSy1C50XdmpNWTo2f4A+zfwUQut4PDlsRxWjQ5yst
 EcZu7NOzbhiiBCFvuyV/Scmr46l3AV2MVkbA9NfSHBQMvNT0n/lVpxK4QroHBx5VUimU26
 TFxsPt4+aOqybsRTSBLE9MfvPkocC6GDeeHjNWaMEgO+LTEpZr1ScSrRpU0AIOx0ow+Dg+
 TEjBM19TeMo+8AbLwAdeNI1irgps8rckLhSWpFEY1RY0lP3S+KSMUVF8o5GwnYzhyvuKuN
 T5Hu8fAtaniAHV0mWRPqdVFzWJ+mY+++wnljbi8b4OaP6BK86i+7emNdCT0YWQ==
Message-ID: <cf28003f-6b11-5800-61db-02195d8532be@mailbox.org>
Date: Tue, 12 Sep 2023 17:57:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
Content-Language: en-CA
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>
References: <20230825140434.182664-1-jfalempe@redhat.com>
 <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
 <20230908141638.79b31d1e@eldfell>
 <4e3bd95a-fcda-2e39-46f7-ebbb78ae515d@suse.de>
 <20230908174113.02b65f9c@eldfell>
 <6d506fe7-3c23-3b50-2d29-549ccb4dbe87@suse.de>
 <20230911113827.67ed6c7d@eldfell>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230911113827.67ed6c7d@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bfb1d4642c52c7c47a5
X-MBO-RS-META: ij8wpxx3wc7thpd1m19pk4yb3si8ftfo
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
Cc: mripard@kernel.org, airlied@redhat.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/11/23 10:38, Pekka Paalanen wrote:
> On Fri, 8 Sep 2023 17:10:46 +0200
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Am 08.09.23 um 16:41 schrieb Pekka Paalanen:
>>> On Fri, 8 Sep 2023 15:56:51 +0200
>>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> 
>>>> I have a number of concerns. My point it not that we shouldn't optimize.
>>>> I just don't want it in the kernel. Mgag200 can export DRM_FORMAT_RGB888
>>>> for userspace to use.
>>>>
>>>> AFAICT the main argument against userspace is that Mesa doesn't like
>>>> 3-byte pixels. But I don't see how this conversion cannot be a
>>>> post-processing step within Mesa: do the rendering in RGB32 and then
>>>> convert to a framebuffer in RGB24.

Even assuming the conversion could be handled transparently in Mesa, it would still require the KMS client to pick RGB888 instead of XRGB8888. Most (all?) KMS clients support XRGB8888, many of them will realistically never support RGB888. (Or even if they did, they might prefer XRGB8888 anyway, if RGB888 requires a final conversion step)


>>>> Another point of concern is CPU consumption: Slow I/O buses may stall
>>>> the display thread, but the CPU could do something else in the meantime.
>>>> Doing format conversion on the CPU prevents that, hence affecting other
>>>> parts of the system negatively. Of course, that's more of a gut feeling
>>>> than hard data.

Jocelyn, have you measured if the XRGB8888 -> RGB888 conversion copy takes longer than a straight RGB888 -> RGB888 copy in the kernel?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

