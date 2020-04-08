Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC71A193B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 02:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A414D6E187;
	Wed,  8 Apr 2020 00:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234A6E187
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 00:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586305781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUaMFl6VOupQh7UxmlQdV+KauWU8dk0fEOX3vcNpHB4=;
 b=i5na3ox79+67jykruHpT9GgbMwTTbLWHM8oP3cZnbriJvU6Skslxuq2HVv6EP+1GiYs4V+
 NALmtCTKfwgmyrAnEtMiQDo73F8/DKj1aXPB0/kL8htBIubwKT1DxYmnqolFVeHul62DNR
 hn3iCuwTFihxwWcol1E/oX+wWFeH8UE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-2q2SZJc4NsmOGHvrvDcyKg-1; Tue, 07 Apr 2020 20:29:38 -0400
X-MC-Unique: 2q2SZJc4NsmOGHvrvDcyKg-1
Received: by mail-qt1-f198.google.com with SMTP id b3so4850477qte.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 17:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=tUaMFl6VOupQh7UxmlQdV+KauWU8dk0fEOX3vcNpHB4=;
 b=N5zO1NKV9ttfmTwClXHT0DDCveVnmYDVyheS+nVk8prt28r7Dw8sIx6VUZWXuDnJzp
 t5MzGlM0Y9jIZmzZDgmWdA1DzXzOzYAH4NuQ4EpTN0FuYPUpzdf4SsWReFfyFJKp0WH6
 KKI1KD+qDSedjUX1XakICEVpiL+nTDJB3KpS2kyvnjNPeS7k5n76uLfeSiPNoC/4puNG
 V7iSmfCorf+ir5112y0P2pJ48yg8lvZ04ke2wOFkmqJbf9z3LkFUOrIb0cy9VBu21WJT
 EG+x6ZyWzFk3mJo67Th5SOmxIKjYzl0vqexpBGs4odkBTpiPyYgpSinrnYFA2c3NIYvG
 1dSg==
X-Gm-Message-State: AGi0PuaKdgnMpQLAqRZ8Jr1lcDr+ehH6gArmNVvd46j+vRvkai046MNs
 O2yGgUNbgziTw1dT9l4lkEVzsGbCNAHmnoggU1NA7NMHUdImy7SfVNuLwxg526gLWiGQqGRD0dP
 XCjwpSREkJJLBz9cAdMQyRLNhPiO9
X-Received: by 2002:a05:620a:91d:: with SMTP id
 v29mr4932432qkv.424.1586305778411; 
 Tue, 07 Apr 2020 17:29:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypIlVgpRT2Lw3SajwdlxtCzLF2X4end/IWmlCSzOGeKBN33ZJvHZrJrYh4WLb/ryv5HN3uPTuw==
X-Received: by 2002:a05:620a:91d:: with SMTP id
 v29mr4932419qkv.424.1586305778146; 
 Tue, 07 Apr 2020 17:29:38 -0700 (PDT)
Received: from Ruby.lyude.net (static-173-76-190-23.bstnma.ftas.verizon.net.
 [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id g21sm12696744qtq.26.2020.04.07.17.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 17:29:37 -0700 (PDT)
Message-ID: <2f8f0ff07b39681ca07a054e74b59d14c955a7b7.camel@redhat.com>
Subject: Re: [PATCH] drm/dp_mst: Zero assigned PBN when releasing VCPI slots
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 07 Apr 2020 20:29:36 -0400
In-Reply-To: <20200407160717.27976-1-mikita.lipski@amd.com>
References: <20200407160717.27976-1-mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey - didn't get a chance to take a look at this today but I will review asap!

On Tue, 2020-04-07 at 12:07 -0400, mikita.lipski@amd.com wrote:
> From: Mikita Lipski <mikita.lipski@amd.com>
> 
> Zero Port's PBN together with VCPI slots when releasing
> allocated VCPI slots. That way when disabling the connector
> it will not cause issues in drm_dp_mst_atomic_check verifying
> branch bw limit.
> 
> Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 38bf111e5f9b..ed109dd15df6 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4276,6 +4276,7 @@ int drm_dp_atomic_release_vcpi_slots(struct
> drm_atomic_state *state,
>  	if (pos->vcpi) {
>  		drm_dp_mst_put_port_malloc(port);
>  		pos->vcpi = 0;
> +		pos->pbn = 0;
>  	}
>  
>  	return 0;
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
