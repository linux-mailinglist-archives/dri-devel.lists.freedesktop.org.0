Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DFMLD2xcGmKZAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:58:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1CE559A9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 11:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BFC10E1B9;
	Wed, 21 Jan 2026 10:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZKcl1Yod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010053.outbound.protection.outlook.com
 [40.93.198.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EDD10E1B9;
 Wed, 21 Jan 2026 10:58:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1oFvLy5CQr5NUvkjT5MhuriZ7bygi5IkNSe/Ou9PZ1rFFLb7/m4O6TWKrP7XelfVYH4sIE/MCpKD4IMJQo1ZXzmYQXuHWzh1N5SVcVmcRSRub4trAzTv4qAcEPPa1jBQxyhc3tel6vVKY7UtKtr8JJqWnD3DsZLko40TFtQYdByje8pC6nmCw292qoiMSmGPoEPBQcWeGGLP1TIjjU5jdCSuB0msgKz7q8urY7X1rRVTvtSkdz3y0F9kFEXD7+iYUwnilq1h8SUupXvOHofcmZxUZkbHnhdp5LyByoYynpDJfx0cXGOCSK5uMzfIgJrIj2XU7xQktE7CxO7FvxmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQiQmUMK8nqIXoP3Ke5JWgql+62HnBBJ0VHUnRuGISE=;
 b=WgJ1K6WeKhjfkGZ82Fl/FOqHCOSvXuSKIPWt+CyqdfYR3A/GbSjDZikXvesBdvfzdPb6NWstrthcXooEkqxLMo9Qxl9SvyFZ8ZG1oA/3e1EAUERvm1fvc7ex5bxwsaBfehwmcf0desdp7EezVMhSGmp2D+j1giNqMijSxiwZIFNMbPYIzpvTcP6rd82kqfaGnc73WI8hDWy8KMGpNaGFMKYUyVrVRPHaT0boQA8xAPp46BS/yEiUQKbaKBzC2Tqu8DmSX/PMyW0Ta5jlIBqnhAO51AtPt3TCDrbKNlh+h/qUflxKTC+0iuMyc3OkXf70NgixmWH4+SlK+D4lMytxbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQiQmUMK8nqIXoP3Ke5JWgql+62HnBBJ0VHUnRuGISE=;
 b=ZKcl1YodPgYP6sqP8l8BAppdI+8lRvjZpuCjGzUJOpeI5zH18WUj8Rma3ZK51MkjMATno6sjx/TrykcpHpnzmO3fUzxTYoOqXal5KulM/0vwMtb53yaC1gVBAggMZvbD+S4LqULT3Gs0Rj771hYiBAX7j6tACDz3JOnxBwJinMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5736.namprd12.prod.outlook.com (2603:10b6:510:1e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:57:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 10:57:57 +0000
Message-ID: <693f302b-e859-47a3-ab00-626ced35ee78@amd.com>
Date: Wed, 21 Jan 2026 11:57:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dma-buf: Always build with DMABUF_MOVE_NOTIFY
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-2-b7e0b07b8214@nvidia.com>
 <24c7a7e6-b1bd-4407-b62d-4d9ea4cdeee4@amd.com>
 <20260121101421.GZ13201@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260121101421.GZ13201@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2d42ee-b7cd-4742-bbaf-08de58dbef56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVRQM0Rmb0ZYSCt4T0JuOTBVN2l5bDM1K0RJOEJKaE9aSzloOWgyNFVnR2JV?=
 =?utf-8?B?Z29qcCtPMlY1bFlLa2MrcFpKVG1TSTBaTFZLRFRZbzRWNGwveHNyY0xMOUxW?=
 =?utf-8?B?TVlpWGtmVHRHUi9UVko4VGxsY3RYb0FIR0M0Yi9BYjRublVyYVZEV2FoTWNU?=
 =?utf-8?B?V1JpeGF5VmxjVStRcFZvaGJEdFRLaldWVUhXWkx4V0s3OG14VGVjSnFlekxx?=
 =?utf-8?B?OXgyb29JK2NFbTVMVE9pNm5VNERRZ1hLM3lJeklhQ1dwNjk3cno5d0cxTTFV?=
 =?utf-8?B?RXNmMnEwcUR1cFViU1VqYnpnUjZleE9lOWcrNThwa25zbzcwUFJmc1VOSE5B?=
 =?utf-8?B?VkI3bDIrck1yekVhSkhmUjNVbnI5OVIxS085ZXdneUhKN0I5dW9FU2N0Y2Z6?=
 =?utf-8?B?SFFwY2I1NlJGV3RIUDN4SEVLZU9Pa2hDdHMrcHM1YzRNQ3B2M2FJa2tKbXUr?=
 =?utf-8?B?MEE1aW9RZ3gxRFg3VUxBYkFkcnViRmdSVGhpMUt0Q2RSSGtzbUQ4c2NVRGo4?=
 =?utf-8?B?cE9rdlY5R1V2eWo4QUgzZGhEV0x4NG5ZNkF2UnZHRGxOZEViWEdNN3JLZlNw?=
 =?utf-8?B?L3IrelZ5NEpBenpJdlpyUVVkWi9jMStuZTZ5dXlheGlYbDlkZlloS2NhQnlC?=
 =?utf-8?B?ZmtSZWNxeVVIYzZXSmFCVlpjN3RRRU9YaUNyNlZ6eTVSbDdBOVZTbmZKdlNY?=
 =?utf-8?B?UmNMblh2OGJDTml2SFMyY0tMRDBmNTFqQUpvbTczM2dSWnp4WjRBc2lLOVNl?=
 =?utf-8?B?SW5FZ2s5S2pWS3hPWmdSdk9WM3AwdkZZRmQ0UVJnd1JoWkZJVkJ4NW8vcmhL?=
 =?utf-8?B?Q0Jkcy9PdGxzcW02cThrVEJGeVVlN1ZJL0F6VHpxUURsb1RsaUxNUHQyaEJx?=
 =?utf-8?B?YjlEWjFab1JzZUlyaHV0SUFmRE5OSnBYanV2ejBpcTdiQlNyMis5VElpd0FW?=
 =?utf-8?B?OXB1ZEhsc2FzMCs0a0JJUEdGY1hONTEwaEYxdVVhWmlRbk53MnhMd0FmUHdX?=
 =?utf-8?B?TzNLM0NaVml2bGpZSGIwbzBkY05aYkV3Rk82NFEwTDZBMzJieGZ5UmJZNVIr?=
 =?utf-8?B?S290T1hESEs5S1pLL2p0cXhENHNreUl1SG93NitqdUZKbzRLVmpGMGtycmV4?=
 =?utf-8?B?bHhXcFExSFpZbitURkt4Q0xwcDJNNGVXbVFmTDNEVFBBRmtoTnFUTDJXUEFx?=
 =?utf-8?B?d0trSFpYWnRRaU11Y0dURHJFUGtwL3R3TFJUazBIZHY2SGI3TEk5ZW1lLzhp?=
 =?utf-8?B?NDdmdjE1V0lIc0ZtZGwzY2plK1ordWt3RmpVTklrbE42WXdYeFJMSnJIbFlz?=
 =?utf-8?B?TDNGc1hxbTJGYkFQRUFKemdxVEdmbzVYWERIQWFCZERwNEFjN0ExVlk5NG8z?=
 =?utf-8?B?eWJvNjkva01hR2xqL2lWUHdsUTFmV1hqcWgxUFV6cGNYR0pUMFVxWkcrWk9U?=
 =?utf-8?B?UTFJT0ZYN09iYmR6ZnpsdStXenpVcFR4aTNzTjF5dVhyTTZoek56MFgyQm1Y?=
 =?utf-8?B?ZjVtWHRBVnJqZ21BSmpTOUxldUMwUmZOSHpxTEpiZUtXMmxPT1ZNRmd1Y3p0?=
 =?utf-8?B?YUNHSUhPSkpBNWNtbnl3Q1hNa2JOajJpbFc1c2svRllIaEFhb0I5eW4vcFVP?=
 =?utf-8?B?Y0JBRjJ1bUJwaXIxVVlXTlRGYk5RZDFlZmorbXVBSHYvdmtITkZQMStHTERD?=
 =?utf-8?B?SFlTamNuZUsvdTU0dUQraGZ3WFhocUNnODhWOS9wWm40bFY1WG5jMFlVU2xo?=
 =?utf-8?B?amdWRVFsMVdFc1lLNlBPbUVPZCtwQk1kOUtvaEFBS3VoZGZiaUdqa1Z3enZv?=
 =?utf-8?B?S2ZMSlR6YUFPUUpYWkphS3JlZERiYk4wU09NNzltL2sxWmxJRlhJVnR6Z2lO?=
 =?utf-8?B?SnFLMUtWTCswejlxSkR5SzRmb3dCb1dlc2dlODlOSlB5MXJHWVJySVJvRDhB?=
 =?utf-8?B?T2pkeE5QU1pEY201eWJPelVEV0VOemN4YUFPZlFCZW82QnRWTjJMdVRpMzRm?=
 =?utf-8?B?aytBL1NqU051dUMrb3ZFdldBTmRoYVlnYnYxN3NuQngxMnZmcmVLK1o2dHdS?=
 =?utf-8?B?UXo3eWF0c2VEN084aERaOVJXSVRZSmMzY2NDYmJqY2VJSnBmVnRzZEcvTkVi?=
 =?utf-8?Q?lA0U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2l0cTEvUmI4eFBRWXVudk5mbUZFOVM3dTFyRVI5bU4xNS9LRFpjT25lNC9l?=
 =?utf-8?B?Tng4N3Y5Snc1aXZlbzdEU2ltamxSQkRWN1d3Z3lGY0dSaTAyTlIxVE56Q09E?=
 =?utf-8?B?K2tIUWY5SFUxSEZqSllZMnZyZk9yUjRzY01RT3RDLytpZk02UWFOQ1RCR0lK?=
 =?utf-8?B?SU5CUjRYVGpURVhwL28xaWt3MS9UenlEemc5NEpTQVhudEd1VHRmelRDUlNv?=
 =?utf-8?B?cnJzWmpoeVN6dlJQNjB3RHJLakdQSW5Xeno5dnJKTk0xVHhncGFYZjV6S2JG?=
 =?utf-8?B?SjUrNUZtTEFGMEVlQ0ZDWTVMaWs4U1JlbSs2bkFaSzRGbnFwMGFwWlZsOG94?=
 =?utf-8?B?cGtQbEJJNnJmS1hOck8ySTdaeExKL2FEa21XL2V1UHhJbDRsM081d1l0dWVl?=
 =?utf-8?B?YWFjamFlK0ZQc3pnaUhnenZGQnB4RVl2UHhoMVVnZDJGUUUwM1ArSjIrU2Nx?=
 =?utf-8?B?dTFHaEt3Z1VPdU5ibkR5RWMxVC9ieXMxRWc0TGJVZlFxcnZFaW1SZVVXdkx1?=
 =?utf-8?B?R3g2UmtwZTZPbmI2L0s2cGdBQ3NUUDkvc2dIaGpmMnlUajJSS2R6T2RLc3F6?=
 =?utf-8?B?MHljWm1DNFpSSDNWY1RseSthY1lycDNUSGFUNDhSWXB6MmtWWU1YeE5PWGIy?=
 =?utf-8?B?SWNURlN0SncvU1RLbFZ6eHZzU05VOXhHU3lGVmhwR3ExV1FlTHM1eXdzV05G?=
 =?utf-8?B?dXBMOTRXWW11L3hSNEFrUEx0UnNlTzVLdE9OK3h2Mld5bFJ0aWhKYm5McTNo?=
 =?utf-8?B?cTdFUjJ0SEhBNGNKZ3o4aTY0cHFsUEZ1NVpzdXNQSFVmTFQvZnFETkVTMXc3?=
 =?utf-8?B?bS9XRllYUXF0SC90K0lHSmdTWFJSb1FrZ3E1QmVhZUZsdDZaaytmMjhHeW50?=
 =?utf-8?B?YTBVZTVPQWdyc2NKamF5VE4xcE00V1gzcE5UUVVzZmdVRzV4ZXFZUXQydkdw?=
 =?utf-8?B?RWl2WU1CVHZ6Y2VoS0Y3RkhjWGJLVHJEUXhGS05VV3VlZTUwdXZYUzQ4QWtl?=
 =?utf-8?B?bGVEalZpTHdCNDh4emNCMXlnbFoydllIQUtWVFhQbkF4d3BJVlE2a28wRFFo?=
 =?utf-8?B?eSsyWVpVZWlPSkFOUGxjQWF2cXBiQVpqQmFNbWMvalNiMCt3THUyS0w4aWI0?=
 =?utf-8?B?T1NKcXVLTE1vcHgwb2psa2VtYWh6NFBsWENxWVFuZFAyUi9Eb1QwTHB6SEtX?=
 =?utf-8?B?SHZWVTROV0h2ZnFPLzdOdWFtbFIxZUlCWlRVZUNLbjMrV01LN0tNVi90dGFK?=
 =?utf-8?B?SHBCeUhpWEF4OGZ3Z1BsVnYvTVovcnhxMVNFQWlReW91MFRyOXFMaGkrMUor?=
 =?utf-8?B?U0s2UGdsaTNGbVIycEdHa3hKNmVSbzZnYjJ6YXR2QTZhQ0lGcVhYZnVETkg4?=
 =?utf-8?B?QnNNbU9JOVpJdld6MGxIdmgvVHhCNmVPUWE1enk0bTkwWDd0NEE5UFFoNTdW?=
 =?utf-8?B?OEJJZnpuM2VZaEpkdjA2SDBhM1g2cWZROWNtUmk1cXB0a1p2VzkwSk15akd4?=
 =?utf-8?B?UmxTOVM0RjExMERkSE1PRGFmUkNlVXYrVGFWZm50OFl3TXJGaWlEa1UydUZm?=
 =?utf-8?B?M1VXMHR3Q3l1TUNWU1Y3Q1NZOUtjc092NXdqc3A0L3c3WFVuTGR3TWFtaWU3?=
 =?utf-8?B?eFRSN3JMVFhQQ2U1MG16Q2o5aFQzdFZRcFFsK1pPbmxFMmlmOTNJdE9pUUtl?=
 =?utf-8?B?LzJCUkNmMUEvUXp6R2Z6QUJCSTYxalFQcndBSm04VVcyMWF5SHYyMmFzNStv?=
 =?utf-8?B?N3JqaGQyRkhjalQycnQyQ2toMjE2SElrOXNPWGdUUHNMQk44K00vY09UTElD?=
 =?utf-8?B?d0MxamlkS2FaNjBCcXI3V0VGZ3pGZzExeC9VYkJmLzgwVTcwa24wdFRlZnJC?=
 =?utf-8?B?WkFaV2V6R3lCSVFmRjhDVmI0UU5uOU1CU2FXWmNoT3JiSmhCVjF2UFd0WW1W?=
 =?utf-8?B?RlB4WVFkMDRublArSUhHaUlnSVdOSEsxQ24zL28yZDUxU2prM25QbkxHRXd3?=
 =?utf-8?B?RmZKUHNsQlZQcGFuMXpqdG02NE1EcTllYmZkcncwUGVuTEJ3eEV5cjYxdytF?=
 =?utf-8?B?dThNWG5TbFlqWFVLaS9QUERoTmZpU1o5bGh4TGFyUFY4RHI2VVJONjhCZDNj?=
 =?utf-8?B?K1hudkpQdCtVUi9UcTlUT3U5L2lyM1E0ZTBsQUtqaUx2S3lPdFVjUGY0MEo1?=
 =?utf-8?B?ZTVEcnFJZElrZTlzampoUWdyMzdPMVphaUdCZTFFV0JlWWtacFZsOHYzQm91?=
 =?utf-8?B?NEtLOHZjMjdaYTVkbVBIaUlRSERKT2xlaytxazh4ZFZnYVJ4Z3Z0ZExDelQ5?=
 =?utf-8?Q?xqM9jk9FzzNvUY30lH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2d42ee-b7cd-4742-bbaf-08de58dbef56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:57:57.0919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1HWx8A9tVnNr+Ul2VeoKBasGwsWi3/SYoJOvwFDzfJSZnRKLIMF+a57bLWnr+p9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5736
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 1F1CE559A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 11:14, Leon Romanovsky wrote:
> On Wed, Jan 21, 2026 at 09:55:38AM +0100, Christian König wrote:
>> On 1/20/26 15:07, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> DMABUF_MOVE_NOTIFY was introduced in 2018 and has been marked as
>>> experimental and disabled by default ever since. Six years later,
>>> all new importers implement this callback.
>>>
>>> It is therefore reasonable to drop CONFIG_DMABUF_MOVE_NOTIFY and
>>> always build DMABUF with support for it enabled.
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>>  drivers/dma-buf/Kconfig                     | 12 ------------
>>>  drivers/dma-buf/dma-buf.c                   | 12 ++----------
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 10 +++-------
>>>  drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
>>>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  3 +--
>>>  drivers/gpu/drm/xe/xe_dma_buf.c             | 12 ++++--------
>>>  6 files changed, 11 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
>>> index b46eb8a552d7..84d5e9b24e20 100644
>>> --- a/drivers/dma-buf/Kconfig
>>> +++ b/drivers/dma-buf/Kconfig
>>> @@ -40,18 +40,6 @@ config UDMABUF
>>>  	  A driver to let userspace turn memfd regions into dma-bufs.
>>>  	  Qemu can use this to create host dmabufs for guest framebuffers.
>>>  
>>> -config DMABUF_MOVE_NOTIFY
>>> -	bool "Move notify between drivers (EXPERIMENTAL)"
>>> -	default n
>>> -	depends on DMA_SHARED_BUFFER
>>> -	help
>>> -	  Don't pin buffers if the dynamic DMA-buf interface is available on
>>> -	  both the exporter as well as the importer. This fixes a security
>>> -	  problem where userspace is able to pin unrestricted amounts of memory
>>> -	  through DMA-buf.
>>> -	  This is marked experimental because we don't yet have a consistent
>>> -	  execution context and memory management between drivers.
>>> -
>>>  config DMABUF_DEBUG
>>>  	bool "DMA-BUF debug checks"
>>>  	depends on DMA_SHARED_BUFFER
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 59cc647bf40e..cd3b60ce4863 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -837,18 +837,10 @@ static void mangle_sg_table(struct sg_table *sg_table)
>>>  
>>>  }
>>>  
>>> -static inline bool
>>> -dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
>>
>> I would rather like to keep the wrapper and even add some explanation what it means when true is returned.
> 
> We have different opinion here. I don't like single line functions which
> are called only twice. I'll keep this function to ensure progress the
> series.

Yeah, I agree with that but I like to have the opportunity to document things.

Especially since the meaning changed over time.

Thanks,
Christian.

> 
> Thanks
> 
>>
>> Apart from that looks good to me.
>>
>> Regards,
>> Christian.

