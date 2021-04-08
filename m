Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354FE358FC1
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 00:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E9F6E417;
	Thu,  8 Apr 2021 22:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDC76E417
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 22:24:36 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:9ef6:7b41:f88b:5bc5:8ea5] (unknown
 [IPv6:2804:431:e7dc:9ef6:7b41:f88b:5bc5:8ea5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EFDB71F460C8;
 Thu,  8 Apr 2021 23:24:33 +0100 (BST)
Subject: Re: [PATCH 0/2] Document how userspace should use plane format list
 and IN_FORMATS
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <YG7qbA3KthIUXhDn@phenom.ffwll.local>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <14b8b86b-edc5-f726-5920-d5d381d3f538@collabora.com>
Date: Thu, 8 Apr 2021 19:24:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG7qbA3KthIUXhDn@phenom.ffwll.local>
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/8/21 8:35 AM, Daniel Vetter wrote:
> On Tue, Apr 06, 2021 at 04:21:16PM -0300, Leandro Ribeiro wrote:
>> This patch is to emphasize how userspace should use the plane format list and
>> the IN_FORMATS blob. The plane format list contains the formats that do not
>> require modifiers, and the blob property has the formats that support
>> modifiers.
>
> Uh this is a very strong statement that I don't think is supported by
> kernel driver code. Where is this from.
>
>> Note that these are not disjoint sets. If a format supports modifiers but the
>> driver can also handle it without a modifier, it should be present in both the
>> IN_FORMATS blob property and the plane format list.
> 
> Same here ...
> 

Yes, sorry. The wording was not good. To clarify:

I'm trying to document a good approach that userspace *can* (not must)
take to be able to tell if a certain format can be used in the
pre-modifier kernel uAPI or if it only works with modifiers.

The background is that we are reworking the way that Weston stores the
formats and modifiers supported by the planes, and there were some wrong
assumptions in the code related to what we can assume that the KMS
driver supports.

We've discussed and decided to send a patch to raise a discussion and
check if the conclusions that we've made were reasonable. And if not,
what would be a better approach.

This is part of a MR in which we add support for the dmabuf-hints
protocol extension in Weston. In sort, in Weston we store the formats
and modifiers supported by the planes. Then we send them to the client
and it may pick one of these format/modifier pairs to allocate its
buffers, increasing the chances of its surface ending up in a plane.

Here are two commits of the MR that are related to this discussion:

https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/544/diffs?commit_id=de6fc18bc35c2e43dff936dd85f310d1f778a7b8

https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/544/diffs?commit_id=75363bdb121bda2f326109afca5f4c3259423b7d

Thanks!

> I thought these two lists are 100% consistent. If not sounds like driver
> bugs that we need to maybe validate in drm_plane_init.
> 
>> This is important for userspace, as there are situations in which we need to
>> find out if the KMS driver can handle a certain format without any modifiers.
> 
> I don't think you can rely on this. No modifiers means implicit modifier,
> and the only thing that can give you such buffers is defacto mesa
> userspace drivers (since that all depends upon driver private magic, with
> maybe some kernel metadata passed around in private ioctls on the render
> node).
> 
> Maybe for more context, what's the problem you've hit and trying to
> clarify here?
> -Daniel
> 
>>
>> Leandro Ribeiro (2):
>>   drm/doc: document drm_mode_get_plane
>>   drm/doc: emphasize difference between plane formats and IN_FORMATS
>>     blob
>>
>>  drivers/gpu/drm/drm_plane.c |  4 ++++
>>  include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
>>  2 files changed, 26 insertions(+)
>>
>> -- 
>> 2.31.1
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
