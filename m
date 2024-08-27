Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10539607A3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B82A10E2DB;
	Tue, 27 Aug 2024 10:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="KCQu+W1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADB110E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:41:43 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WtPH70vBZz49Q5R;
 Tue, 27 Aug 2024 13:41:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1724755301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNdu/cjz6/mzEUvlwPYpUFMy3HYifTNHwSjHW2dS8tw=;
 b=KCQu+W1fnYwS4f/4Arn6TJc8CG+MWGC3Vsfp9ey9dNkqOfBItwpO+1ki6q6Kh4xeWtU6iG
 b1hROBKYkTzoLoNS5uMrNOkT7zlOKkK4A53GnGokV3b11eucBLKyka1NMnccE4K1mAlrJH
 opOXqiKZ6IFedvidMipxWfLLR31aMsAp8KeIgDSbk7u9cPpO2AoyDAMek8mQ16zWOKX0q/
 1tBYg9QLAGUuZoAX30I/+KK4X6mKeCLdSMOewwmyGkUyM49UccEvWruAoKZaxkeNllhzj7
 XT3LfWki+Dbw1zxyilEuhmIIJHt1mi/4udAAX+2PSbAglBo4ZjzNe9+4VOpM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1724755301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNdu/cjz6/mzEUvlwPYpUFMy3HYifTNHwSjHW2dS8tw=;
 b=JWTFZ3G3YcCzkuFg6DU7fQKqwvqXyI8HzVgf3N3PvN1HKR27gZ/YpbwD3OvQc2jOp6R1wO
 zXoO/mhL6sUkSbDj29myrd95w+sw7MS/b3U/lHiJ/G1R+ENvblnwHtlyxuPlHhofnesgrP
 l3oV3hTrZ38wiH9NwdVYhhjRUC1ySWG4x2u0+zBkdV+u9UGLajNCn+qsc1xJM7yruVmtqZ
 p5nv/GJhQmU7kTe1rHr3HBbZ3Bzx1bw48yNnEJUVxXbxnwcQkQ8XcCKxsLsECC4Fu8BQ04
 mtAe6Y/NGdLmS1UefW2oZ9PXfBX/XQeTubE6qQEmuexYHLgOsJ9+XemFMywNsw==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724755301; a=rsa-sha256; cv=none;
 b=sS2scnDLKWtv1UeBT9OK0S6isAWHRCBztmYhmD0NCXWu1N84HMzdNKf2DVWybcTw1jMVyD
 Vs+X4ThlsjzmuFF4RBQNLrp+otb19wueF1CEM8XKNgn2nSn7YT33BFfnA/G1Srew3PQglu
 5Nnxbp5d2+z5MNMTQxfrIJe78vgoSqOW3snEYbkYCpko3YSdtufDORJPpjuJjC8LnHgzSg
 jftQTqiKTxQdCW0yHmqEMJCvjBVbaLJRNWHPRC6cs9PQ3kku/B8tUmcBUQDfahWgOovsk6
 eH7YhC+MKi3/a8kH5wYkgX0nzCjH4vbat/RzW1TBYTpxFFk/9Rsz3ht9Attlrw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id DE609634C93;
 Tue, 27 Aug 2024 13:41:37 +0300 (EEST)
Date: Tue, 27 Aug 2024 10:41:37 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Rob Herring <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
Message-ID: <Zs2tYUh3PXv-0e20@valkosipuli.retiisi.eu>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
 <20240826154009.GA300981-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826154009.GA300981-robh@kernel.org>
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

Rob, Kunimori-san,

On Mon, Aug 26, 2024 at 10:40:09AM -0500, Rob Herring wrote:
> On Mon, Aug 26, 2024 at 02:43:28AM +0000, Kuninori Morimoto wrote:
> > We already have of_graph_get_next_endpoint(), but it is not
> > intuitive to use in some case.
> 
> Can of_graph_get_next_endpoint() users be replaced with your new 
> helpers? I'd really like to get rid of the 3 remaining users.

The fwnode graph API has fwnode_graph_get_endpoint_by_id() which can also
be used to obtain endpoints within a port. It does the same than
of_graph_get_endpoint_by_regs() with the addition that it also has a
flags field to allow e.g. returning endpoints with regs higher than
requested (FWNODE_GRAPH_ENDPOINT_NEXT).

Most users dealing with endpoints on fwnode property API use this, could
something like this be done on OF as well? Probably a similar flag would be
needed though.

-- 
Kind regards,

Sakari Ailus
