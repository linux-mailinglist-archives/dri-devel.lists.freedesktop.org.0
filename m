Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44859BA750E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 18:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA03E10E0C1;
	Sun, 28 Sep 2025 16:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="xHuubiMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4E710E0C1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 16:57:02 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cZVpy4LP0z9sST;
 Sun, 28 Sep 2025 18:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1759078618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3CPsXihGUBBwniCQJtpfCea9ZS+16bumyYVi9msdPY=;
 b=xHuubiMSI1U7n2AhL8UbwNP5D24fqsTalz73+pLetWsJpayvL0H7U0vNPv/fXMsI76dT9Y
 BA0jodO4DTAljzh5/955NxjTofoDmHZfTNUOzlkDS3J171LiYOLyY2SDUBvNsaq1Zwh5zL
 6JrhLKl4TghKRUMVY2QndMe/TNc8ZCO/SBDtDQGLdUowAIqGUQIJk4QRKEjbHGiHF0Kkkb
 ssTiWE8H09QNuZwWRR85eCbezsFXR7izc2l8Wz8JgyHv/B3EUqnTEKNDmL32N1AHcrAcSI
 mz6nzP+67SteciLT+nVZFgYGAuATIL2UgbA4E/I23JKuFiecI4PRluLDgCXXUw==
Message-ID: <a8d62ed4-38c7-4ff7-a283-3708761d94a7@mailbox.org>
Date: Sun, 28 Sep 2025 18:56:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
 <aNZaatnVRRkaPrnD@oss.nxp.com>
 <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
 <aNjwyIgs9fzWiprq@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNjwyIgs9fzWiprq@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 09c0d8297a0a9a440e3
X-MBO-RS-META: axcuj6fk8qs9i65ufsbua5pb77z3odbx
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

On 9/28/25 10:24 AM, Rain Yang wrote:
> On Fri, Sep 26, 2025 at 03:32:46PM +0200, Marek Vasut wrote:
>> On 9/26/25 11:18 AM, Rain Yang wrote:
>>
>> Hello Jiyu,
>>
>>>>> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>>>>> so please drop the reset change.
>>>>> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>>>>> as the internal driver use mali label to control the thermal up/low limitation.
>>>>
>>>> I updated all of the AHAB container, imx-oei and imx-sm components, and the
>>>> reset controller is no longer needed indeed.
>>>
>>> thanks, please update the gpu node label if possibly.
>>
>> Which label do you refer to, and which one would you prefer to have there ?
> 
> "mali: gpu@4d900000", not "gpu: gpu@4d900000".
All of imx*.dts* use gpu: or gpu2d:/gpu3d:/vpuvg: for the GPU label.

I see allwinner does use mali: label, but maybe it would be better to 
stay consistent with the i.MX labels ?

Also, variants of gpu: label seems more popular:

linux$ grep -hro '[a-z0-9_]\+: gpu@' arch/ | sort | uniq -c
       3 adreno_gpu: gpu@
       1 bb2d: gpu@
       1 gpu2d: gpu@
       1 gpu3d: gpu@
      80 gpu: gpu@
       4 gpu_2d: gpu@
       1 gpu_3d0: gpu@
       4 gpu_3d: gpu@
       6 gpu_mem: gpu@
       1 gpu_reserved: gpu@
       2 gpu_vg: gpu@
      17 mali: gpu@
       1 v3d: gpu@
       2 zap_shader_region: gpu@
