Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F119A8273F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD8010E8EA;
	Wed,  9 Apr 2025 14:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E4EBVk4V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71D610E8D6;
 Wed,  9 Apr 2025 14:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5lRKNBT4ze5CBSfVFcsTlPPa7rXk9Nq4RACOQ4A90ZqtLyCRuKk2Uor/FWEt7YoyD2NrlHCLbFWZ3l2O5YShd8ErmLz7rDYIUl/UynEs1Un06zSn5F4ZMVl9jyrAfnkdI4W+F2TLRa6u/HvGsnVzUr7Qaxc1214frvAdL42/s2tgjZwzlYgCDMCuOq1OQS8y2SvMS5K7OP80WgBwdYBVOTKF5Ygxn+rZXpnmINx1deg/06Jm0RbkeeF2bPxUdFiU2FZ9GPLFgcXGxrUsmb2m9gPp0vnvgXsDnwqMdeu/ILLkMmIYvcIYvSiYKqjtXCn/pfq/fNzuqQI+erL+AlTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5gm/pWGj+7ED1yjql1cFf353+H6d1DolAXK/7P2vQM=;
 b=r0h60jFqQd48CkfPjL7eCDDFwKF7g16Nwvj4N7RgGnJe7Rp3BmvjtN0CB9sHd2ASi6staBFfWsAkLdqpziA35sLpmwLdSD6Tt8Zt7xL4uJEJbSWHjciPGVGTezmdebvuB1WfCFcI1Sc8AgIkEsWxqVIcj1dGoRUgyuBDak31NJavw7Cno4vYK7GSxW77EhSxdEVwAMHmZohlFvPSbuLDLT3HT7W1IrbYxjb1k7ChhoDC2WGc8sdKLv+v5yK4i27r5IYJ5Kngn1omjtd2zveF0s2e9ZXnKdXD/YCQ/iInfUQtmXspToWWxetqhhJrfEKVyZXizHoBRJAKb+yOsNkIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5gm/pWGj+7ED1yjql1cFf353+H6d1DolAXK/7P2vQM=;
 b=E4EBVk4VPNNoTU/u7S9QuLBzdaYTEX808PsYYBGU8FG1X4R4QjB2qdLkJ7xrxwN6HzFCyh5XHGFf7aXXuQA1TLoqT1LSpBN2bOBUM/oe7kMqpApmWfz6CKApRccWcY8x6W/qaKz3LdzSpxzsapn9cmlBuUPetFtnCdDiVhQryTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7181.namprd12.prod.outlook.com (2603:10b6:510:22a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 14:10:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Wed, 9 Apr 2025
 14:10:46 +0000
Message-ID: <334e843c-d7fe-4e33-b4fc-f3d18226465a@amd.com>
Date: Wed, 9 Apr 2025 16:10:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-fence: Rename dma_fence_is_signaled()
To: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Yang Wang <kevinyang.wang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Tim Huang <tim.huang@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Eric Huang <jinhuieric.huang@amd.com>,
 Asad Kamal <asad.kamal@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Friedrich Vock <friedrich.vock@gmx.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250409120640.106408-2-phasta@kernel.org>
 <20250409120640.106408-3-phasta@kernel.org>
 <20250409143917.31303d22@collabora.com>
 <73d41cd84c73b296789b654e45125bfce88e0dbf.camel@mailbox.org>
 <72eb974dfea8fa1167cf97e29848672223f6fc5b.camel@mailbox.org>
 <ab7d1937-d0e9-45f8-8f7d-ddd7a1a9d3d5@amd.com>
 <9a90f7f14c22c01aa28d89aa91bf4dfa4049c062.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9a90f7f14c22c01aa28d89aa91bf4dfa4049c062.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd019ed-815f-482c-1a46-08dd7770525e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekVCK1Z4aUc1R0pmQ0ZYaVlJVmx1UVFheVMycFgyNEh3RVAvdFUycTkzRlJY?=
 =?utf-8?B?bVR6TDF1KytKUkMyUlVFQzYxTDBUYXg5MHhUUlF1QjE2OGh2bk9MWnJUVHFy?=
 =?utf-8?B?c1ptbDhsUFp2eS9ndHoxbllaS2hnZUFCV2s3c1BWMFd4aHY1dUdwbGJLVVhq?=
 =?utf-8?B?Q05zOTlpbEFsTjd1WDhRWHRRUFJVR2pFWkQ2M0l4ZnhjWnNJZnh3aldBUmhM?=
 =?utf-8?B?d0lJMFdFSVNESWowa1Zoem13MlkvZXhjRVRGajhUcVp2dHZkNE13VFEvakpQ?=
 =?utf-8?B?cVdQaHBSSjUySktwNmY0Rllxd2htdHR5bWs0ZElhMmNIajl5UGhCOHdGVnVY?=
 =?utf-8?B?Z1owZ2hZYWZ3bmd4U29kcjZORXEyQ2UvalJrNi9zRzdZUzlIVUxuN05yU3BZ?=
 =?utf-8?B?R1F0VUloRTdKN0t5MWlFM3diWXg1ZW8vTTVKeEVFeURLK0pEVmN2d3cwVzkr?=
 =?utf-8?B?d0xHNUhJYzJUdG9mY240RXNBb3pNQWRxSmV1d1lNQ2JlK3JRVi9IUWY4d3Vu?=
 =?utf-8?B?bDZXdG1ZM0tZd05CN09VaiszUVlKNWQvRXc0NmZTeUs4YWlhMldJb2x3WjdQ?=
 =?utf-8?B?YXJPOHNIKzdreVpBcEh1UkNkZzAvVGhOWTZPZFFQL3pIRE1xK1Q4ZDR1b0l1?=
 =?utf-8?B?dUhZK3NqS1dPQ0tXYmdMMWRIRFZSSmFYeFRyN0tWRUxFZ2V3UEFqRHArck9s?=
 =?utf-8?B?aU1iWUYyTnRMOFlQWDNRbHB0MHBPb29rSW9xQVBWdngrdXJxb1FlNUs2Yk9B?=
 =?utf-8?B?STE3SHp4MlBVaDZJZkJCZFFsMnVWcnZPdGhxNHM0R3BkVk1ETnFlUHpFSTNI?=
 =?utf-8?B?QWFLQnNSVGFPa3U4bWR3UGQyL2JxaDhvK05YTHo1UEVTWEhHVk1ad0x4UW12?=
 =?utf-8?B?TmpiNEg0TTVDd3JVYU9DQnlleXlyVUFhc2hlQ1daTVdXMEFXMWdKaUhkZjBQ?=
 =?utf-8?B?VDd5VUpJYVVMTHBMdThnaTRTNWJ6MGtMUFV1RlowS2Q3eXIrUFJTMVlFenNO?=
 =?utf-8?B?M1BLTFBaZGgrb3Z6dk1HL0Ivb01RbitmYmo2Z3Bac09MN1lFcTVlc215ank1?=
 =?utf-8?B?QndjTFF3bEc0a203Zy96UnNLbHYrTGdoZTlzNDhxTzlrSFBySDVlcGpNbzlt?=
 =?utf-8?B?RXB0bGZwUjNHdmJldjl3ZkVJcmFlS2NSV012T24vZStLM2pUUGNOUWFkek1O?=
 =?utf-8?B?ditBV29GNkwzNzNTRGdSOXUvUUFaa0tPZjd0cmZKQ3ltN2VLUWJQUjZwWkdK?=
 =?utf-8?B?clhIQlZ5QmVJQjFZc29oSlQvNWtVdGVET1FGMjZ1MXVWV1NaZXVMRllHc0dl?=
 =?utf-8?B?dWthL1FabHJjazRLTk45QWV4Y0JUaWdxcVlwOXJZTnltWXc5VFFoV0lKUFc2?=
 =?utf-8?B?RXh4UHpRK2paL0h4THJUalFyL3JGSGw2NCt3RTh6WHZTQ3cwaFJESmp0RTFq?=
 =?utf-8?B?R3kwc2JTaEFHbERwbjkraFk2bURubVIyeGZ1Zjk4c3BMQmgyYzE5MzNpZjAv?=
 =?utf-8?B?aDBWS3RydWhSNnRaRWp0Vk1pa3RUUll4NzBjN2lRWFZOOWpveTQ0VUFvT3BN?=
 =?utf-8?B?YmlURTg2dDE1bDEwL1JNZXJZbnl2djdmbGF2Z252OWVJMWVhWkhvUWRCZFhk?=
 =?utf-8?B?cG5qcVFCcVJBeW9zeG9Td0Zvd3RSd2p2S0xiMWZ6bElQUE4ybVg3VllrdTZ0?=
 =?utf-8?B?eGxBQmIybStYcStwdHh0MDI3R0ZTVTRNNVh5T0NuOHgzdXRXOWhYeWxINThS?=
 =?utf-8?B?V1pUS2ZiMnlOaml2ZGhudW41T1BuSFlNek1kRDFZNytIKzZ6TFg3aXVFL052?=
 =?utf-8?B?eTlGQzhibHkvRWdNQWt2T002R3dvMy8vVDdTZGFHNENWanlGZ0t3RllPWlR3?=
 =?utf-8?Q?xBo2M35OcowmX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlJOMEttOFh6b29oMDVSdTNBd2Z5bGlCSTNXR3g0cldqenNEUUM0dFBGbkpp?=
 =?utf-8?B?c3pVcnl4RmhHVDdNUS85L0FvY3BubUo1OFlDV2pOd1NXY2I5bnFtcmdGenMr?=
 =?utf-8?B?SVllWE1RRGp5a0MraXdMc2Zsa3F4KzV6VFB5YU4yckhvVDNJcFVqR3ZPOHB0?=
 =?utf-8?B?clY5TTBXKzJMTHBnd0dhT0NrbUZEeFk2d2I5KzJaZTZRNC9zTld4L3kvRHVK?=
 =?utf-8?B?d1Y3UFA1elIxS0pDVktyVkVSWS9HQXRncjZqSmppQThHVTFCRG9jS2dYZTJW?=
 =?utf-8?B?aVBuemF3dFdxaU81aURVNTEwV3F3cmVJV096ektSK3pSY2R3MjFlU1RUSlJB?=
 =?utf-8?B?K1RPQVlodlBWN3l4V29zdnZOWitzd0xUaUlZdUttbnFYQzZaWmdTaGxhQ1Nk?=
 =?utf-8?B?eGk4NDVaNmphUlV2STN0MkZYenZrQ2pzOFQyMFUxeDRpQk5zWG9EYnBrUTFN?=
 =?utf-8?B?WVpkUGE4ZDd5QUhOcGJFamFORVZ6NkhudytvT1d6bk1uNkFXNiswenhUMElm?=
 =?utf-8?B?M0k3bGhMNnNnS3dkYVRrRGtnWTRaZkdHQUQvWGVGQnNkUEpUL1ViakFOTVZW?=
 =?utf-8?B?TFpwZG5ON0ZZRmhMQU5RS0EyWjVKYlB2ZmpseG5DdnVmNWs0dE5EYmU1SFh3?=
 =?utf-8?B?T2xlQzVBRG8xZisrREowWExHTWpiVWs2T2Z5bVBRNzNScGRpcWNwUEZrUEpD?=
 =?utf-8?B?V2xodFl2OFYydFUwbHRRTmxIbjF2VTB5RDRvZm1JbXBFa3lLMk8rWkcxQjk4?=
 =?utf-8?B?UGNENHJIMmQvN25oT053MVJMbzZwQ0tEd3BrVXRlYXYyRnNFVW82RXBHWDhJ?=
 =?utf-8?B?MlNEOURNZmI4TFlpY0JXdTJ6Z0hKbXhkNFVidlJvWDRDOVZQenZLbXZWZWZP?=
 =?utf-8?B?bDJsWmV2MDl2YlNUc1BuYVJ4Rk1YSXljZjJhdDQ1UHNxL09qL3gxbFhKQ0VR?=
 =?utf-8?B?cmswTTRYQUhNSGMreG9uYStMTjJuWVBrOEFSWjlEM05oQzZzUzhneXd0WmIx?=
 =?utf-8?B?TzV1eFUvemRzcUZtUHdkU09BeDdBUmhxZ3JYcXpvZW5SRk44cmhpU1JtQWk4?=
 =?utf-8?B?RnlJdHE2VHg5R1ZxaEFDOGd2dUxaYkROaVZINCtuOEt4SEZmWGhocWQxbksv?=
 =?utf-8?B?Tk1rYWlWOFZJaVoxM2Ewd0pSL21FTG4wZ0JHL1RPYzlTVFVxTEg0ekRvOXZa?=
 =?utf-8?B?eXRUYjhaYyszcnRQRGhQR1RpY2dNNG5YaGMyZHlHM1l1YlhxY2ZxOFNGUlE5?=
 =?utf-8?B?NGpuanp0bXVLbVN6N0hGV3NyRko0VXRWYnhsbENybENVTUdmU2RzUnQ3YlVQ?=
 =?utf-8?B?blBSREphSEVyTThTUkt5eFVsVkZNZUIzakxDWHI4cTArbDk5MHR3REFtUVdt?=
 =?utf-8?B?U2toa2YwSVhxbmoxQTVIcjZzM2pWL3lML0IzZUxHOEg2SjBFL1BZQ0krajhy?=
 =?utf-8?B?bXY1TzBsUm1yTHlHakdkaW9KWGNXVGxCY3dNeHAvc2Y3UkpxcC83NWZKNGli?=
 =?utf-8?B?T2c2YnF5UFRURXdtOHRvQWEwZWJNQlJpQm9jUytIeGc2cGs3elRNd2JBU08y?=
 =?utf-8?B?MWI2SVFIbnBxVS9wbEh0Ykh2RFp5eDNiQkdNeS9Eemk4R3J2TGNFOGFMVFdi?=
 =?utf-8?B?RzFGWnI3emYyRnEvRTV3WTdGbkV1akc3eUVmQkloTUZXSDEzZE9DSnZhNVFj?=
 =?utf-8?B?My9kZTc5MXU5WW1mZ3czYUN3QlRiQStLL0hwUHk2TUhQcmMxN3FUTVMrYkhB?=
 =?utf-8?B?bU43ancyYkhNd3doeURsOHo4ZUtwYTdkODdqYllWMStoOGswQ1VBLzRZMDlq?=
 =?utf-8?B?Y1hnYnZWQWc1azF0L2MyN0VUbHZXc0NmMi9uYWJ4TzJVaWUrYkZCK0ljMFhF?=
 =?utf-8?B?UHhac1ZtekdrQi9odXBjZ2pHbFQ3blIvMTVRYVNBU2NYTkEzUGZHci9sREJ0?=
 =?utf-8?B?c2VIeFIzK2RPWi80eC9MRHlGK2JTQzQvc2gxZVZmcGloMCt1TjBGQnJzcE42?=
 =?utf-8?B?N3NBRHg0TUhRYWdWK0NmZWg1VG1vYllNWGp5MldXd1BwM2dQakNWTmtxWkFK?=
 =?utf-8?B?ZkhTR243ZERuemxTaTZPM1F6eFJZM0NLUlNMd2prNkhqcEp3VXBkbWltNUJJ?=
 =?utf-8?Q?tsMzOE4IsmVFn6Tzkqy+AJENV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd019ed-815f-482c-1a46-08dd7770525e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:10:46.1606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqkYUP04hlzALEOAK1ebLVP68+FMla8PSl7i430KrBlKO3HgVv+npQmgci0yszC7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7181
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

Am 09.04.25 um 16:01 schrieb Philipp Stanner:
> On Wed, 2025-04-09 at 15:14 +0200, Christian König wrote:
>> Am 09.04.25 um 14:56 schrieb Philipp Stanner:
>>> On Wed, 2025-04-09 at 14:51 +0200, Philipp Stanner wrote:
>>>> On Wed, 2025-04-09 at 14:39 +0200, Boris Brezillon wrote:
>>>>> Hi Philipp,
>>>>>
>>>>> On Wed,  9 Apr 2025 14:06:37 +0200
>>>>> Philipp Stanner <phasta@kernel.org> wrote:
>>>>>
>>>>>> dma_fence_is_signaled()'s name strongly reads as if this
>>>>>> function
>>>>>> were
>>>>>> intended for checking whether a fence is already signaled.
>>>>>> Also
>>>>>> the
>>>>>> boolean it returns hints at that.
>>>>>>
>>>>>> The function's behavior, however, is more complex: it can
>>>>>> check
>>>>>> with a
>>>>>> driver callback whether the hardware's sequence number
>>>>>> indicates
>>>>>> that
>>>>>> the fence can already be treated as signaled, although the
>>>>>> hardware's /
>>>>>> driver's interrupt handler has not signaled it yet. If that's
>>>>>> the
>>>>>> case,
>>>>>> the function also signals the fence.
>>>>>>
>>>>>> (Presumably) this has caused a bug in Nouveau (unknown
>>>>>> commit),
>>>>>> where
>>>>>> nouveau_fence_done() uses the function to check a fence,
>>>>>> which
>>>>>> causes a
>>>>>> race.
>>>>>>
>>>>>> Give the function a more obvious name.
>>>>> This is just my personal view on this, but I find the new name
>>>>> just
>>>>> as
>>>>> confusing as the old one. It sounds like something is checked,
>>>>> but
>>>>> it's
>>>>> clear what, and then the fence is forcibly signaled like it
>>>>> would
>>>>> be
>>>>> if
>>>>> you call drm_fence_signal(). Of course, this clarified by the
>>>>> doc,
>>>>> but
>>>>> given the goal was to make the function name clearly reflect
>>>>> what
>>>>> it
>>>>> does, I'm not convinced it's significantly better.
>>>>>
>>>>> Maybe dma_fence_check_hw_state_and_propagate(), though it might
>>>>> be
>>>>> too long of name. Oh well, feel free to ignore this comments if
>>>>> a
>>>>> majority is fine with the new name.
>>>> Yoa, the name isn't perfect (the perfect name describing the
>>>> whole
>>>> behavior would be
>>>> dma_fence_check_if_already_signaled_then_check_hardware_state_and
>>>> _pro
>>>> pa
>>>> gate() ^^'
>>>>
>>>> My intention here is to have the reader realize "watch out, the
>>>> fence
>>>> might get signaled here!", which is probably the most important
>>>> event
>>>> regarding fences, which can race, invoke the callbacks and so on.
>>>>
>>>> For details readers will then check the documentation.
>>>>
>>>> But I'm of course open to see if there's a majority for this or
>>>> that
>>>> name.
>>> how about:
>>>
>>> dma_fence_check_hw_and_signal() ?
>> I don't think that renaming the function is a good idea in the first
>> place.
>>
>> What the function does internally is an implementation detail of the
>> framework.
>>
>> For the code using this function it's completely irrelevant if the
>> function might also signal the fence, what matters for the caller is
>> the returned status of the fence. I think this also counts for the
>> dma_fence_is_signaled() documentation.
> It does obviously matter. As it's currently implemented, a lot of
> important things happen implicitly.

Yeah, but that's ok.

The code who calls this is the consumer of the interface and so shouldn't need to know this. That's why we have created the DMA fence framework in the first place.

For the provider side when a driver or similar implements the interface the relevant documentation is the dma_fence_ops structure.

> I only see improvement by making things more obvious.
>
> In any case, how would you call a wrapper that just does
> test_bit(IS_SIGNALED, …) ?

Broken, that was very intentionally removed quite shortly after we created the framework.

We have a few cases were implementations do check that for their fences, but consumers should never be allowed to touch such internals.

Regards,
Christian.

>
> P.
>
>> What we should improve is the documentation of the dma_fence_ops-
>>> enable_signaling and dma_fence_ops->signaled callbacks.
>> Especially see the comment about reference counts on enable_signaling
>> which is missing on the signaled callback. That is most likely the
>> root cause why nouveau implemented enable_signaling correctly but not
>> the other one.
>>
>> But putting that aside I think we should make nails with heads and
>> let the framework guarantee that the fences stay alive until they are
>> signaled (one way or another). This completely removes the burden to
>> keep a reference on unsignaled fences from the drivers /
>> implementations and make things more over all more defensive.
>>
>> Regards,
>> Christian.
>>
>>> P.
>>>
>>>> P.
>>>>
>>>>
>>>>> Regards,
>>>>>
>>>>> Boris

