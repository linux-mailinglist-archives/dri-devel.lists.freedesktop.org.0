Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN3nAjfgcGnCaQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:18:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD839584B4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B182610E7EC;
	Wed, 21 Jan 2026 14:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="POdsB++1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013013.outbound.protection.outlook.com
 [40.107.201.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3574F10E7E2;
 Wed, 21 Jan 2026 14:18:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeHrUKltYOCQGIbQu7K0S+LV2UNxteQcGl1of83HkUcGT+Ar4OcFqN03CsIKSK3REUbdWwO3XFkuJmiLKFLM8XwT/sX3oL+QpemvCkN2DNSfUm5YuGTi3dfVhiefgCVAqDPCR9wkKKVkQli6jgiUPP0oEhPAnl+LF001TCAj0zSmpcNCydwpZCmoG3PkbwXUn+kehgCgidvQPwrjEmNvDHegXNXzW4M76B+9Hw/J3mxXW/iXnW17fF6miF5B8IQWp2WaYfmseemDxDZBBfauN1m/Twh/KeFsz/IVXesLkuQJdMG2OX0d0LcF/1XChXCDjUHOPeuTJHiWR6SEnXb9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2ha5+tNU1Xd+1YXibpUCHjTFFNgss+r9dpAFy+JtsI=;
 b=CLNZYu6sPazxrzX/TFz2wvw0njbfSpffsXsRs5dN2VLDSlJdBpOEm5YgpBgSrqGX6I2Nuo50+ARFrOMPmTyj9qYWZy4wezCxCTlgVhIQc6Q8WB54z/H/81YSY3dL44yg8SFtQD285OOkKWCZfARmlHt9fYrR1zwvS3AJbORTEWGlybqXqEVjs6+8CSVwV9PmGigPNk0tiSKXiwFEOdgApEVKD6GT5JuwkRwOq9iOEwxj8ZlWSqH3KktLm7Bs6r4Cwzd0V1XKN2Pehnr9SVf9HXSYgeBw6w6MA+Zvop24C2g8PTHoWxOSSvLJycWRJylT4LSoVkKPvoiqR/IBPSwD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2ha5+tNU1Xd+1YXibpUCHjTFFNgss+r9dpAFy+JtsI=;
 b=POdsB++1AK7TCHQxKbfSgr044a3Pn9xbvh/VWXe6Y5Nx/HKi4tz42vXsWfNbxysMtwAyYr9FBoMWAzXbrjQ8CMe2eB3BQLAEnwLdgc+Baz1INr9Wum7eereUFlkKTiCGRiuivm8prIiL0MOlAsJSGyvaUa5Yg/bDxcOsGxhGsE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8204.namprd12.prod.outlook.com (2603:10b6:8:e1::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 14:18:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 14:18:22 +0000
Message-ID: <ca33c9d2-3117-4a99-b8f1-e8e2f732fd2a@amd.com>
Date: Wed, 21 Jan 2026 15:18:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] vfio: Validate dma-buf revocation semantics
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
 <20260121134712.GZ961572@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260121134712.GZ961572@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0791.namprd03.prod.outlook.com
 (2603:10b6:408:13f::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5d9b40-6eb4-48fc-f9af-08de58f7ef12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG1YbGxiaDRDQ00rQk9yRUpMWVdhYXgxOGI3VlV5akFnSDdKT1hNY1R0L3Rr?=
 =?utf-8?B?aGptbHRMaXZ0anVIU05Hb2g1UWxYbVFqNlFXT3I5OE1yNjJMT21RTXNBOVZU?=
 =?utf-8?B?NmpSckFUeld0cWtJYUw4T3BIWEJKK1pFYlIxVmdCait4QkNhMFdvRTFUMmlW?=
 =?utf-8?B?Z2RtSjB0RTRDZkg0WmNyMzlpbEZDUkxJZzdCRW1TbEZhb2txZ0FwQ3l6NWU3?=
 =?utf-8?B?OGcwUkRwM2JiMEh2V2lDR2dMQlNXaGN5c3VZbjV5Zm5MU3M3NGk2V2VoUmhN?=
 =?utf-8?B?TkJzOWRLRlVVWFp0TWVNZnlwSitIdWNCeDhHK3ZBMVNkODNRbXYvMkR0bllF?=
 =?utf-8?B?dkpzWU5zTEZrU3c0ZmNhWVJ5dStqVWNNVi91ODJ6eGxHT3VhMlcrcEpyZFdJ?=
 =?utf-8?B?VlZFL0JuUGFGdWEzcXg3aFBGRTNHTm9rMjY5MlBoTTNkSmo1VFJ1Y0hQK2ow?=
 =?utf-8?B?RUNVUDNFK1R5QlorNHMzZ1ZFbGtPcytSSEd5TmFMSnRZRXQwODBYMVdTc1pI?=
 =?utf-8?B?Tks0MExRMjhzQUltTnluYldHaG13VnhMTFZyaTNmUUdDc0NNMVdiamlBNW5m?=
 =?utf-8?B?S3dYNXZXUm5GZEE3TTUvVUFvbVdIK2dTRmRPbFJiUWhZM0hwTERHcGpCL0NR?=
 =?utf-8?B?cUZPR2d0TXBWTjdUc0xwNUlNSlphV2Zhdmg4UlRBSENOa21VTExNbTN3dG1W?=
 =?utf-8?B?RXVCakhvODlmRUlWeWVBaThCdEtQWlRlU1M4WkJTQWtpYlBmSmRDOTdJNkxF?=
 =?utf-8?B?WXNiZlIrZENrV0E4VjVyVlFIMy83aVpoNVhZVEhlSVcrclhHbjBVWmtSQzhN?=
 =?utf-8?B?dFNBNCtpaDVxbGJPNXZEMklidUJQMS82SXJieEwvWTg4MXhoR1cxSUFORGtY?=
 =?utf-8?B?RlRJTWZKSlFGWUR6MWdkcTFDZUl4SW9LWGl4Snl2WCs1SitBNUNXVGRMZ214?=
 =?utf-8?B?L2o0NzYzaWE4R25TY0ZSdjV0NVV5ZEpNWDdvV2hoemljcmt6MXRFNkF6aitI?=
 =?utf-8?B?UEdGMS93Q1pOd01UWVo2VzArTXJGN2orUVZVWGJtVHI2emI0NlB6Y29QQldh?=
 =?utf-8?B?aVNQVGdXQnE3VGlYdE5hVFF2RnR5Sm5nNjBld0poTzhDUEo3UkgvbG1ScU9Y?=
 =?utf-8?B?eTQ2c0NJcFlNUmNUSDkrZDQ1cGUvQ1ZCRWZJKzUrb3B2OGhiM1F6QmxnQ1d3?=
 =?utf-8?B?U1F6dllJZ1dTei9PaXNTT0Rzek1XV00ycElhb2F2NnE4VEdvVjRaTG9jTWwx?=
 =?utf-8?B?Nm9wajVmdzZ2MkNzQWtPS0hDaHB2UG9LYXRyS0IrTUF3UHBBak5uQXV4dlJW?=
 =?utf-8?B?b2s3dXphQ1ZNeGFWTGRKeWIyd242Z2RnTmRxYnJFL1YxRyswaE83SlprNy95?=
 =?utf-8?B?NmQzK0dJUTU3a3dPZDl2c0lybmlTb2lnc0hodGNJbGczSnNIRXRPUmpWTGQw?=
 =?utf-8?B?MTRuZVpJcU5VSnpKeVh3b3JJVjhMOTNramo4dk5wUTNxdEV1RnFPakN2RkxX?=
 =?utf-8?B?QkpsOWk4THNDN2VIdjRQRTVUZ3FxNWhYblZnUXhDMmRZOGxkb0RSckt0cmlM?=
 =?utf-8?B?WGJ5WWM5Q1VQTG9ncm5zKzZPMTZzNE9LdUtzeXpCUFhoTEhOMUZveWlmMXZj?=
 =?utf-8?B?S0kxSmp5QmdTOWlpZWxyWGovR1NReEg2d1BlUGdEb2s5SUFmcENiREh0U0JG?=
 =?utf-8?B?NndTdUVyOEEzVkRPZ0JyS01RK2RRWDlIWmhZUlQxKzY4LzYzaWFiTDJTOGxE?=
 =?utf-8?B?bFZxRk4wVzI1ZlZPL0UzKzMvcmErVFYwMXhPMTZoKzdOOWdCYk12NERsdjAv?=
 =?utf-8?B?YjVuSHU2bVJqUlh5YllDZTc5dFRJYzlRTEFNbUtReXU2aFlTVk9TU2M5K0JQ?=
 =?utf-8?B?S1lJYU9KVWJwQUkrSlV3T0RBdTVUQ1FuanZzQmVUSEdxeFhSWlg5QzQvQy9Z?=
 =?utf-8?B?SDFzMDBmRTJxeXZJSWh0TEx3dFJ2RlIzZjJxa1l5M0pQTkV0b091ZzlqTjAw?=
 =?utf-8?B?WTRDWFRUR0dGYndISWxjQ1JReS9LMVdldTJuOTgydmxKTCt6Ky9lQmMzV0tj?=
 =?utf-8?B?cUdRejZ1MEdvOHhrWXdPSEoxSUZYN0I0RytNQ2VuWEp0ZWZtdkdtK1Bsb3g3?=
 =?utf-8?Q?fqMA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFaMitlNkl6Um1IN25yS2t1UFhJNzhyTS9NTHYwbEg1TnAyOXJLZzc5YVRK?=
 =?utf-8?B?T2NtOE1ZVnllSmlCTkVMYit1YzBTVGcvRXpiZCt2TEdjamZBSzJwSk9Cb1px?=
 =?utf-8?B?cU1KVUxrSTFWcTBHK2YxclJOVUh3dnI0c1RzNm5kMXczelhmQTdsYklzak5O?=
 =?utf-8?B?WFRMWmIrcXBKczBWWFdpeUJFUVV4NkZOaWtYUzh4VEVDdDVrMzBYQjAyQlZ1?=
 =?utf-8?B?d3YwQ241b0hHMElEd1ZVTGI4Ky83L3YxT01nbjRGL1RlN1BmM1lLb1gzOVdk?=
 =?utf-8?B?aStoVlNoOWR4S3RJdW5GclA3TTF4STQrVmhoVWRlbjlOakJTRUZFSmVjQUho?=
 =?utf-8?B?WWhpeEJsQUNKdk53R25TakFnSkQrSG9nWEIvejlzVWRMa1hWcVhyaWxHTUl5?=
 =?utf-8?B?VWJYb3BWaWE4cmJSUCtoL0pBY0cxN3VVdCtXN2dabHBkeWtCNmZMOVArSWUr?=
 =?utf-8?B?eVdXQWhTVHYyR3JsOFJFeG1kdnhSVVgwK1N4ZGtDaFNRTE5leDI4RDVNdFJi?=
 =?utf-8?B?cncwVU9PdEJ1WGNxUFFaR0t5MFN0cHNkTE82b2NERVQ3SERWNWtVb0lFa25n?=
 =?utf-8?B?Wm4xYzhLaXFlaW8zYXgrWlhIVnlsMktKSHZpZ0dUMWx1VTJoQ1FhVG9NZEVm?=
 =?utf-8?B?aVFlWTZ5SDlqL1lVKzNvbTNKZitCbzBBcXUxdzBDQi9paG9TanlLSFF5NGp6?=
 =?utf-8?B?eDZ0SmxNeUs0YkJOVUgvSGVvOUsxTmNSc0kvVGFwZnBxWitRWnlkdzhCSFVN?=
 =?utf-8?B?K09kOCttTUFIN2ROYzZHTG9CdmdCNUw0MnhUd0MvRDNnbWJRdFhiMlJONnhn?=
 =?utf-8?B?N2taSEdVZHdLbm1UVkdmZlBzZGVXZk1RU0NYRERQbTdFc0Q2U2pVNmFVZ0g1?=
 =?utf-8?B?Z1F1NzNxdHdCbFpIOWhzRkFPenA3R08yOUdhU3kyWGVvS0tJcnI3eDBOcHVP?=
 =?utf-8?B?ZDJtQmlRL2F2bnhaTm5RcCtxK3kwcURPeEFDU2w4b2VxMmFYRTZ2S1cxd0Nr?=
 =?utf-8?B?SExEV05VSmF2dkpKQ2FydHdOLzZBSWdsd3grV3hvQUl3ZkFWSkp3UlpZRnlv?=
 =?utf-8?B?VVlpT05KbnpqQzBaNUlvTmVDVlFtTzJCWnNnMlFrSlgvT0xta2lrSjNGWitE?=
 =?utf-8?B?ZkNkNTRtRWVEcW1pOEJ3NDBJd3ZCMGN5bTJDRG5rNWRlNzFEN05aRkNIU2tz?=
 =?utf-8?B?M0FNajZzdGY4dGxOU3BidzNlN0tsVFNSVFk0eitrd1NJMzl6T0c3UlVtODhC?=
 =?utf-8?B?Nm96dXJTdFlNT1k2NXZVM3ozckViU1F4VFYzbTFmcGxEQ2Y0RGpkUWpTR09Q?=
 =?utf-8?B?aEhFNTZ3MDJ4elhHbVU2RFB0SSt3STR2YUNrRllTOFM0WFdzTEoxS01PUGZE?=
 =?utf-8?B?eHAwc0ViaVoxTUlaMC9oTzBVRlgwcXB3SERVbUtTL3lmNm4xa1JobXZlMmNn?=
 =?utf-8?B?YTlpRk5ZNk9HSnhkam1FZmJvaU53MFh2MVk2bnM2Yzc0V1BxaFJZTFlBTTA0?=
 =?utf-8?B?bnlVU3F2d1N1bEp4Tk56eEU1Y0d3Ung3bHZ0cUp3UkcyZlR4TjU3ZFdWUUpu?=
 =?utf-8?B?dFdGdlYxZEZZdnZScmpuNHlyRjFablhIajJrZTNKaHE0cktHbEQyU1RuVmdL?=
 =?utf-8?B?Y0sxb2lBYkVsRld5N0lUOHZKK3hnb3Q3MXR0aGticERXS3NybjdWaVo4Wjh2?=
 =?utf-8?B?VlIycXlCRDhTbEozMm1oTEl6UDJVeTdtM0dHWHgyeEFrMENpTDJTZnlGaFp4?=
 =?utf-8?B?RzdoMDFralZwcVdiQTJVRkNZK2FyTm5LaDU0K2UwSnA0MVZ6eHBXa1kvbkhV?=
 =?utf-8?B?MVlDSmR2Wkh5TGVCcCs4QncvWXBjUkNBbU90elVNSVk3dCtiT2NtMlNZV1FZ?=
 =?utf-8?B?dkxNWnRYbUxlUXJHc1RKWHVEdSs1VEJ6NW1hNlRoeFNVbGR5dXR2RG5nVlI4?=
 =?utf-8?B?b1FoWk5JMXZscEZqZTMzZC9UN2hGZzhuNko5S2swczFPdGJYaldoQXZjNHRM?=
 =?utf-8?B?N2QyMHR5dDkxRFhDazdNT3Myb1pSazZlUkdEd3ZHbHpKTTh0alRVbkp2MnpY?=
 =?utf-8?B?YUhGZHMydmpET0ZCRjB3ZjZUZEJ0QUJFOStHUjZOTnY5cmorV2hNRVI0OGJO?=
 =?utf-8?B?dXpRcFpucTQyWGJhSmp4amlZbXppbEYwYWFEdlRIdUw3UWJ6NWlvSTJOc1dq?=
 =?utf-8?B?cjBXeGJUSlZocFRmVnlPdVB2WGxUQ24rOEQ5SnNJOTZPelVISklwOWlwaklW?=
 =?utf-8?B?TlFxZFlCWmhjM2lFdHpYc05DbElGTFdaUHVvOFZVMlBneGwxRjNCSlhLMGgr?=
 =?utf-8?Q?5uQCs0p+P0DAe+Rn2W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5d9b40-6eb4-48fc-f9af-08de58f7ef12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:18:22.6031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O54m4rWyle21NeigVwiC3wM9GMzmbYqIvyoXvC5pI3AKRGdbPiQZqO6Mkb/3Lo/l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8204
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: AD839584B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 14:47, Jason Gunthorpe wrote:
> On Wed, Jan 21, 2026 at 02:59:16PM +0200, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> Use the new dma_buf_attach_revocable() helper to restrict attachments to
>> importers that support mapping invalidation.
>>
>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> ---
>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> index 5fceefc40e27..85056a5a3faf 100644
>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>> @@ -31,6 +31,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>>  	if (priv->revoked)
>>  		return -ENODEV;
>>  
>> +	if (!dma_buf_attach_revocable(attachment))
>> +		return -EOPNOTSUPP;
>> +
>>  	return 0;
>>  }
> 
> We need to push an urgent -rc fix to implement a pin function here
> that always fails. That was missed and it means things like rdma can
> import vfio when the intention was to block that. It would be bad for
> that uAPI mistake to reach a released kernel.
> 
> It's tricky that NULL pin ops means "I support pin" :|

Well it means: "I have no memory management and my buffers are always pinned.".

Christian.

> 
> Jason

