Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EB5BFDCE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 14:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C50B10E963;
	Wed, 21 Sep 2022 12:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244E510E963
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 12:26:13 +0000 (UTC)
Received: from maud (138-51-81-86-lsn-2.nat.utoronto.ca [138.51.81.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E3218660035B;
 Wed, 21 Sep 2022 13:26:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663763171;
 bh=LlHD5lcHyZfHfTEXQT+IbuM3eYyGjiUeyiaLrGNOPPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QvYpEeK56DoQSASB/Dh1LiOLwMFU4ZpTWoAXaCym+TzdsWmu8eOCfnCkAH6S3K+P7
 LvnDV7rkr+wX+OjRwZPTaIGE+MshSxNpouLRc273ES0c3cRbxz/tPOTXswuWbAo7tP
 4BWAeYf83B8s4P+lXxM0H2w08LbznpFeDOMSDz0IiPLz+ihHmDM2BQa4kj2+CHxek/
 QQpFu4k1M7FK4fp9Y09dXiaRcB7SA4hXTcKKCwLgkGgRCv0wok+6HybawAKq2lkrav
 HsWtOLn/Vea0fvspnkjPu4akabrKS3ZFrWg7Gq2q9GRzMPYx1zcZkSbtsOO3cuEX+3
 r7IvGnlxx1tQA==
Date: Wed, 21 Sep 2022 08:26:07 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/2] drm/panfrost: replace endian-specific types with
 generic ones
Message-ID: <YysC34LemH+Qzd7l@maud>
References: <YynVAAaQPIPhuN55@maud>
 <20220920211545.1017355-1-adrian.larumbe@collabora.com>
 <20220920211545.1017355-2-adrian.larumbe@collabora.com>
 <Yyo7A1eolIBssv/i@maud>
 <4e907f5a-0691-214f-d6a2-1bc3a8bd462e@arm.com>
 <6ce0a88e-6114-65b2-9670-6a76cfad068d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ce0a88e-6114-65b2-9670-6a76cfad068d@arm.com>
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
Cc: Adri??n Larumbe <adrian.larumbe@collabora.com>,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Or of course we could just actually use native endian and detect from
> > the magic which endian is in use. That would require ripping out the
> > cpu_to_lexx() calls in Linux and making the user space tool more
> > intelligent. I'm happy with that, but it's pushing the complexity onto Mesa.
> 
> If there's a clearly identifiable header, then I'd say making the whole dump
> native-endian is probably the way to go. Unless and until anyone actually
> demands to be able to do cross-endian post-mortem GPU debugging, the
> realistic extent of the complexity in Mesa is that it doesn't recognise the
> foreign dump format and gives up, which I assume is already implemented :)

+1 to this solution. Gets the complexity out of both kernel and Mesa,
and in the vanishingly unlikely scenario that we need this
functionality, we can add it to Mesa without kernel changes. As mesa
panfrost maintainer I'll take those odds :+1:
