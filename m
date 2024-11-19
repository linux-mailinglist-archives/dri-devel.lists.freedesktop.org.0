Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24619D2338
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AC810E20F;
	Tue, 19 Nov 2024 10:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Z3B++TKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0A710E20F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 10:17:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732011473; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=U2B0ElSmmISWt8I/gTGQ57bQfErlyWyEZPZeMrRQTBOeRTA1u4soJERwXNt7VpZTrpDC/kA2VDsUJVSSUiEa5aq21kYiNVQqwo+NE7LZmBAFmAsllVyS1QO7jpEUx+vJK5peq2PCAl8thd/o1zZu4F47PzDHBmwpdWkamOtng6U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732011473;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Mf5ZJbVzjPwmmc8rdr0u77z6Obya7DnFXxs8BBoA2XI=; 
 b=g4NOR6XchbZN0yJaK2f02cB3wigjG5nTpqsiTtyPXYsfs6foBD85IKA0ucZkAzmAhJQPKltsBXki4TcmgLu3xoN+JANHSS/l47lYI/an3cjsQyLpbAvdzyTfYBtcoCYrx6IezplQ0iKIneorSLCkn3DpdVC7J3bbUZ/pnsUmNJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732011473; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Mf5ZJbVzjPwmmc8rdr0u77z6Obya7DnFXxs8BBoA2XI=;
 b=Z3B++TKkQ9243rbqidcN9kbmnO9AAgjPWNX0IAfZJ9YM1EK842ab4mkuJj8MCUnK
 ArpmCQnwuT+/anxfRo4r/CJd6+tSIjRroA2EzmdsK3klxaVyMRZEnMlIPUV5LfhSBc6
 zAvincRF/VMzpU6PoT8m9LYRL5ga9zh4sCKeBk5g=
Received: by mx.zohomail.com with SMTPS id 1732011471240665.9970243998765;
 Tue, 19 Nov 2024 02:17:51 -0800 (PST)
Message-ID: <666c6ce3-d713-48a8-af17-e8bc28956e38@collabora.com>
Date: Tue, 19 Nov 2024 13:17:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
 <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <e336b9ef-c8f3-44c8-904f-42736f6ac481@collabora.com>
 <IA0PR11MB7185A20AA84175C4D44D44E3F8272@IA0PR11MB7185.namprd11.prod.outlook.com>
 <IA0PR11MB7185671D43889B076086940CF8202@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB7185671D43889B076086940CF8202@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi, Vivek

On 11/19/24 09:01, Kasireddy, Vivek wrote:
...
> After rebasing v2 of this patch series on top of the above patch, I see that
> this use-case works as expected with Qemu master. Let me send out v3,
> which would be a rebase of v2 on top of the above patch.
...
>>> Am I doing anything wrong? Suggestions are welcome.
>> Could you please share your Qemu launch parameters? I'll try to recreate the
>> issue you are seeing.

Thanks a lot for sharing your Qemu command. I haven't used the
`host-phys-bits` flags, will try again soon and then also check host
errors if it still won't work.

The `new fence for every plane` patchset is now applied to drm-misc-next.

-- 
Best regards,
Dmitry
