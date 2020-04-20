Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C11B0659
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 12:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2012F6E4D2;
	Mon, 20 Apr 2020 10:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242BD6E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 10:15:50 +0000 (UTC)
Date: Mon, 20 Apr 2020 10:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1587377747;
 bh=SJKNc/D6jtKC2XcsfP3v2Mt9OxeRp+t/wgufhdzhF58=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Dwj7TLp/SKwwgkMcmSMuQbwsHgzmT2NDYMrfZuZnmTkckFpMqznAstpK/hdEuoPTR
 zUYlVNLvyNMuEEFReDIMAbDMkWsasKHzI0+DjEMbTWMQ1D0pCpvUoOwNpPgrVesf3O
 0vtEZ3gWquitfZXm1fXm/dgjW2827NX3SRFBFzF0=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Operating KMS UAPI (Re: RFC: Drm-connector properties managed by
 another driver / privacy screen support)
Message-ID: <eT7Xq1DV3kIBOemufORRm39_VF3D9VD08jWCOHvl2IcqmNXqpgtgDGtPcpT_CnQjhIzqth_VdU_A8U1dCFj02JzayLcYCdUlz_5Y-i2tNXk=@emersion.fr>
In-Reply-To: <20200420112704.68d02472@eldfell.localdomain>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com>
 <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <20200417120226.0cd6bc21@eldfell.localdomain>
 <CAKMK7uEv_khNFC=JUyuQgDZp1p5eudDCrH0we+UdEdTV3H=Tsg@mail.gmail.com>
 <20200420112704.68d02472@eldfell.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Pearson <mpearson@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Nitin Joshi1 <njoshi1@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, April 20, 2020 10:27 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> The only "random" KMS state is the properties the userspace KMS
> program does not know that are set on start-up. I have been assuming
> that as long as you had fbdev active before the KMS program started,
> the unknown properties have "harmless" default values. And maybe even at
> driver device init if fbdev does not exist?

Note, this is not the case when using e.g. a display manager. In the
past there have been cases of a display manager setting a hw cursor
and launching a compositor not supporting hw cursors. This results in
a stuck hw cursor.

> Btw. I searched for all occurrences of link_status in
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html and it seems it
> only has two possible values, good and bad, and no mention whether it
> is writable. Looks like it's writable. There does not seem to be a) an
> explanation how exactly it needs to the handled (writing it does
> something? what can you write?) or b) any way discern between kernel
> and userspace set values like HDCP "Content Protection" has.

User-space needs to reset the value to GOOD when recovering from a BAD
value.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
