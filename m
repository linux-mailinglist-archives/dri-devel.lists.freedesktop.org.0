Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8738586F4A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 19:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBD99680F;
	Mon,  1 Aug 2022 17:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59E590568;
 Mon,  1 Aug 2022 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lV6Nj9c4zvsHkFQy7tICycDimwo4Sq7catGYsp4e4OM=; b=sszIulLjEmptCoufWV9wadwb/R
 IVtmrJZm/Vty1rFEIr29ikO/5UmW6LsYXtyEHOU5bNSRa0f0C7XJ/D2VNjmUmLuhv8TYhO2ACzj+h
 TMlhiuE69NL5c2Nj1cuv3LMv63tAj0pnuOFp2tLz/WbGmHVxPdo2WNN1xtKc+JcdIrUSalpQmXVCh
 huPAqm10mMtetvt4p7Loc8AdcjzwSVablv+s8SA8WPl+qGWiRydKvSFq3q22kyS8WhfBhnOAjafr7
 2Ztmk+Q/0x7Guu7S9gYcwWbqktGLC3zLJS9HmC4Tm1N9W4tlTkiDshcMQ7BgSDEIzbcxbKw4mJfkz
 rm8KI8HQ==;
Received: from [187.34.27.134] (helo=[192.168.15.109])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oIYsd-00Dy7P-Lq; Mon, 01 Aug 2022 19:06:59 +0200
Message-ID: <31187f41-64c8-d7ce-fcf2-5da421b3e194@igalia.com>
Date: Mon, 1 Aug 2022 14:06:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv2 -next] drm/amdgpu: double free error and freeing
 uninitialized null pointer
Content-Language: en-US
To: Sebin Sebastian <mailmesebin00@gmail.com>
References: <20220730034923.25500-1-mailmesebin00@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20220730034923.25500-1-mailmesebin00@gmail.com>
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Às 00:46 de 30/07/22, Sebin Sebastian escreveu:
> Fix a double free and an uninitialized pointer read error. Both tmp and
> new are pointing at same address and both are freed which leads to
> double free. Adding a check to verify if new and tmp are free in the
> error_free label fixes the double free issue. new is not initialized to
> null which also leads to a free on an uninitialized pointer.
> 
> Suggested by: S. Amaranath <Amaranath.Somalapuram@amd.com>
> Signed-off-by: Sebin Sebastian <mailmesebin00@gmail.com>

Reviewed-by: André Almeida <andrealmeid@igalia.com>
