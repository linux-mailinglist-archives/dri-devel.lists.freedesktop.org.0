Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1742876A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 09:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8526E430;
	Mon, 11 Oct 2021 07:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000FC6E430;
 Mon, 11 Oct 2021 07:05:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so52758189wrc.10;
 Mon, 11 Oct 2021 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wMNVOKH7I9nZJBmdmY82PpMuTIJnDPrxHG2zjEA5m9s=;
 b=pzSf3o5Llbrkbhs9yWVdcshQQe7s/EdjJ3wKU95Bwif3mVaeFGYa+EUBkmmBXYW03d
 DQrx0IEd6u+eYTF2YWHoL5pOUwgorBAP4CKBsOzj44HhL+zXdM2NB+Coh8cr8D/jON43
 OVCBCDKtMhQ1bWVbbSuOOzrQaLrwM8irwfgxmjgitZRbNQFf7x3CunUxuu3P0G3C50u7
 Cfr4417v1OZiiH1fXWemiB760QnXpOshNsShWDsTP4CxIloYsyoK7/xS6qR/Dx3wMq9/
 s8jnuo/KX33cv0vLJyZ9EpkpWlow2W6jwQ/Sirbmjn2IdAOpBih6kOcJW9svajFzl5bC
 vqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=wMNVOKH7I9nZJBmdmY82PpMuTIJnDPrxHG2zjEA5m9s=;
 b=GehxwMDrLu3Kpf1a5N4E2AB54R3Z/RbPBkKxRxQWfyyL3MRVYvo/fhqSZVqz1eUTrX
 eKRZV5DXSy7qIMC/7WGYo4e9Hf1jaqDzakHaovSL5BEj/at7HKWgvuLuwb4CdKZGI3hb
 e37KdcGpBvglsg7D2yxMAsQVSGv2TzeqrewAkoPBkM5AUkFx2lwZhTmNT0ntLEeqV09S
 blpDzy3bEe1hJSJePKcIJNkM5jIhSsXNmxUMjUifjYL3+fJpyLA9qyAiBfp2A9CIeUI5
 Wy6OBdjVG8ZlmfBjdzUgTlaFkMsXYmaWSVelt8mF9rQGYVUWpN78GPPCp/ThBt3p19W6
 6nPA==
X-Gm-Message-State: AOAM530h/KBNsY0ohc06NH5tK7xUOrR5u9enPRqBIUmJC8TvCYahspas
 rdco0ikm5A0Uz2jqYGAgbv0=
X-Google-Smtp-Source: ABdhPJzKBXc4gUSq/yC+ip4ByIKGOGVWV28ONE7yJ0I9k61i/DnvMnUlb1J+JeJXSVO7uRqSmUCoxA==
X-Received: by 2002:adf:ae1a:: with SMTP id x26mr21985872wrc.30.1633935956529; 
 Mon, 11 Oct 2021 00:05:56 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
 by smtp.gmail.com with ESMTPSA id u5sm7171049wrg.57.2021.10.11.00.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 00:05:56 -0700 (PDT)
Date: Mon, 11 Oct 2021 09:05:55 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/nouveau: fix a use-after-free in postclose()
Message-ID: <YWPiU+9G0AKglHmi@eldamar.lan>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
 <b4da382b17a77b66e45fd374c9d806dac6054e3a.camel@redhat.com>
 <YRoN0vWFN6Lw22ej@eldamar.lan>
 <418fdcbcf554d34cc6423a88974f916b64b3664c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <418fdcbcf554d34cc6423a88974f916b64b3664c.camel@redhat.com>
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

Hi Ben,

On Tue, Aug 17, 2021 at 04:32:31PM -0400, Lyude Paul wrote:
> It may have been, we're in the process of trying to change around how we
> currently accept nouveau patches to stop this from happening in the future.
> 
> Ben, whenever you get a moment can you take a look at this?
> 
> On Mon, 2021-08-16 at 09:03 +0200, Salvatore Bonaccorso wrote:
> > Hi,
> > 
> > On Fri, Mar 26, 2021 at 06:00:51PM -0400, Lyude Paul wrote:
> > > This patch series is:
> > > 
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > 
> > > Btw - in the future if you need to send a respin of multiple patches, you
> > > need
> > > to send it as it's own separate series instead of replying to the previous
> > > one
> > > (one-off respins can just be posted as replies though), otherwise
> > > patchwork
> > > won't pick it up
> > 
> > Did this patch series somehow fall through the cracks or got lost?

Looking some older threads, noticed this one. Ben did you got a chance
to look at it, or is it now irrelevant by other means?

Regards,
Salvatore
