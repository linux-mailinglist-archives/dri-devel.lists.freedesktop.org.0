Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9B4AE302
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6310E4A1;
	Tue,  8 Feb 2022 21:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646BC10E4A1;
 Tue,  8 Feb 2022 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Ka1YRMzeVRg7rN1gJ2YpEkVn/wWTU+NPmgwt1bGNWtA=; 
 t=1644354768; x=1645564368; b=SZ7Tcfpq7yYxcF8TZzgdG5YU795suz0G38P1OSKPzsTGuox
 vtcuhU8AEiJaPFEedkUD3l5uvpDBbp7ZRad3tPJ1AWss5WW0m3vR52cL0TW18iYXX79wcjECTeXnS
 wM7suTDBtoiEsKUz1Ozn0mbbZfCq3p+JmKWbeby+/7nlLDgYX4cShfEuvUOROBgF2mjkJocJmj7R0
 rTHR0rJso8ytegFHRCRVdOOL+lWpvQOI7h0rfsZrLL27SvuNuEzWmbGov+zd8fHJ8lE/aZlQbfq9B
 ofUu2+JIWk9H85Xyfz3iUtjZM35FbYp3cg3mvZFXtyfLcPCdKxiH6/NBKBFnx5tQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nHXn0-00GCMS-QC; Tue, 08 Feb 2022 22:12:42 +0100
Message-ID: <c59bc1af9974484075091333a3c98a2088251321.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: increase the device delete timeout to 10 mins
From: Johannes Berg <johannes@sipsolutions.net>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org
Date: Tue, 08 Feb 2022 22:12:41 +0100
In-Reply-To: <ebd340e4-2a02-d484-2ed0-9ee738d5b5c5@quicinc.com>
References: <1644349472-31077-1-git-send-email-quic_abhinavk@quicinc.com>
 <8d67484c7e4b9fb4560d2eca1f71c75fde8bae0d.camel@sipsolutions.net>
 <ebd340e4-2a02-d484-2ed0-9ee738d5b5c5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
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
Cc: rafael@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, khsieh@codeaurora.org,
 nganji@codeaurora.org, seanpaul@chromium.org, gregkh@linuxfoundation.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-02-08 at 13:04 -0800, Abhinav Kumar wrote:
> 
> It opened the file rightaway but could not finish reading.
> 
> The device gets deleted so the corresponding /data will disappear too ( 
> as the data node is under devcd*/data)

Yeah but even if the file disappears, the open file descriptor is still
there, no? Does sysfs somehow make those disappear? I know debugfs does
(now, to some extent, it didn't always), but I thought sysfs was
refcounting things and didn't do that?

What did the userspace actually see? read() returned 0 so EOF?

(I guess I could test it, but it's getting late)

Your other questions are related - you need to consider the file in
sysfs and the open file descriptor separately.

johannes

