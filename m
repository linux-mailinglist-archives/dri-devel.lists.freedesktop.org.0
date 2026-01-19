Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F82D3A7DC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB78010E424;
	Mon, 19 Jan 2026 12:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JBLu8mfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E04010E41F;
 Mon, 19 Jan 2026 12:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlcG7xK621qWHzLdrFeZJI6yVYRkSDEUNUxcUUE/KGvrnpw+/m4G6d58VJQDCHHPs1UiM3a6fsLlwsDxGcx9VrsRvPdxsQpphbKbkbaItoE8I9xwEE0Ktz+aw6UoUY0k6VIXDGag7tWZpiRxy8rNwfESdGbQHNhnttz5H97FMLBeBmOXn9LD4C45c8A3J0h/mpVdIAyQmnSFKbOZGwCZVN/rjXlu60+7ifBdj4uY/Blp/FCKOeeACAV4mAO9jEhQdzC9ItFoE2QuBJSMjo7ai+iGvycmqkfVK5CIwcAjTY5fncFy42VRP85xc4fWdqMQsrSu6t4EI9Rr6mHRulPxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFGbtM6Cu+F1q64Xe8wN40Gbs2kH0E9XObanYXYnxuo=;
 b=sIAS/lQhg1TKbqc1yNPILrv7s5ij22c30dBe+MXdXOHgjWWCnluxFVQWIiqYPk2utjnPUsign0/Ci/PtLeeYADKY6y44znnOjl93sTGoW2zauKFcigj1ssliJe6nq7ItXewYC0/0vVYqOwLrPJ62TxfbtUmAHFegyJVuKuoMndaauxHKJbWjPEbbX1g5lxQAVUaHSUsiIHYnXXVlKq4seCgjpP+PVzTMSuUg6HazDafT3t+QGHEXNJSthBgFrx6cKG7xpwOIxOnCL4lZXMURc3G7cITyFv1LFD2OUJSXqv9bNut4kdIEF74vYqIN/Ad6QNOsww5yyakEJODUlIVMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFGbtM6Cu+F1q64Xe8wN40Gbs2kH0E9XObanYXYnxuo=;
 b=JBLu8mfzXhivAsqg0BnCtaKsvcKCmWLN70PhsYAtwM7xmOjbeLNWDxUQGwK1JEHYQTgCYoJrKpcncZMoLCKPvpVXkrw9zvK08zQ6ZstjrdRqwAlJgbJJw2TzqBn5laTsdFMIxgmjct/OaTI1G9t9SOO/2lkuFds6IDPdFLzrwQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 12:05:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:05:35 +0000
Message-ID: <30ec9e80-f5a8-4b30-a55a-965f20f62125@amd.com>
Date: Mon, 19 Jan 2026 13:05:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
To: Leon Romanovsky <leon@kernel.org>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
 <20260119075229.GE13201@unreal>
 <9112a605d2ee382e83b84b50c052dd9e4a79a364.camel@linux.intel.com>
 <78035892-758d-4104-9dd5-aed9a045d481@amd.com>
 <20260119105312.GJ13201@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260119105312.GJ13201@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: afe5e338-ed8f-46b2-2eac-08de57530d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVczMzNrQ3ZqellyUGZPaDRJQVc1eUo3VlRqcnAzc3pKcmZRZEQyWGhWaHp4?=
 =?utf-8?B?aFMza05xeWllZW5mZXZsdXh1UDNGeDFhS0hLeTY1KzB2RExzWmFtWktRWVRh?=
 =?utf-8?B?WWFRNDVMUmxmYVJ6SEJldW9hekpld3lXdVVDK1lxSzBvS3NxS09LRlpnU3Bl?=
 =?utf-8?B?RnR0bEhYcndGaDBHdHJ6TWVZdm5aRzRjeFduNXJIMlBObURoQ2pPcExmWGgy?=
 =?utf-8?B?c2E2SzJVWXYxZVJOMWlvSFFMeGw3V2RLWW1VNVBaQkxtMGoxa3NGT1FrZkdi?=
 =?utf-8?B?OUlnY3pjbVo4Z2lZZHkrRVlaWFEwdXdhN0E0Um4vdkVORzcwWExEWDBFSmVM?=
 =?utf-8?B?dFRnUWxLT25mYStkcVAwem5LaEZOLzhkNTkwSUJ0aTg2azFPODU5emJqNlNt?=
 =?utf-8?B?NEp5a3dCaSsvOWJzWjd1WmtZMWJBWFA4NFVwMjB2R3Z6SEpzbFA4cWFndk9R?=
 =?utf-8?B?S0YwUUMrNWNEUGhNbk1VS3FXUmU3QmRSYVhXYVBjb01adHhnSk55MVdzRkhD?=
 =?utf-8?B?dGdsdFhVejhySE9zeTR5NmxaRmFIbG9rczlmckdPYnd3N0dxL2JyMkk0VzBG?=
 =?utf-8?B?QWI4K3dyeTFYRXVqdTNtejFmcDN4cHJLNFVYRmNXS0MzNTFVTmVuR0pzZXg5?=
 =?utf-8?B?K1lJTVVqWEY5c3JKQXlwWm1TaDdWK21UQjFtYWRqTjhzcG8yd0ZQVWwxVXU5?=
 =?utf-8?B?d1RLVExBcHowR0NVck5SYThmMGorQWoyUHR3em9BOWhma0dZSm1sN1Uyd0Jq?=
 =?utf-8?B?ZGFncUlPS3AvWGFTZG9iTnc1b09qcS9ZMjcxOENla2N0QXJRTzlVOWVKcHpG?=
 =?utf-8?B?VlpYTUhhS0RYSXZPQjRlMy9NZzgray85bzZDdUQ5ZE96RFprRTVTRkcyeW9o?=
 =?utf-8?B?bEp4cElXV3Z2dXBMS0ZoTmhVdFJFQXZRZmw0OVlQZ25uRnlVT2NBWG42b0VW?=
 =?utf-8?B?OWdPcnVyYVBhaVM3MGcxQTRleEtOUFlVNDBnL2lHZVNzcjV2NnFiamRKRE5I?=
 =?utf-8?B?VmplejZIZEdFUlAxaWtUNC9sdTZrRmVzUDFiVVBBK25lZ1hnUFZNUjFDZUJL?=
 =?utf-8?B?WDU3cVYyKytIRjZlV1ZXYkpwdEMyaVdLYy9BTEcyanJORjZDNjcyWGxZS0Ju?=
 =?utf-8?B?SlB1MVc0M3FzakE3YWl6d3ZjYVBRTG1KbEFFZHJnV0hpYWhSb1l3MmszZDg5?=
 =?utf-8?B?bm8rOEJsQ3RzVnN6dURtTHQzRzZGV0FGZTY5RHVJYitOODlYU2MvL3Nkamds?=
 =?utf-8?B?Y2JzUjkzVVBKaVVGczdIaTk0cy93T0IyNEdNVFBCOTV5dEVTRzJHcmtZajlI?=
 =?utf-8?B?K1NNeUlFS1VJWlpNeGt3OUx5Qkp4NXl6aEp0dExnRXhpT0NnUVRmRnZieW5B?=
 =?utf-8?B?dHJyVlhNU203dDN2aC9xMERYRnZNWkJJMTR1T2Vld0VpcnJsSTVkR0tuMEZj?=
 =?utf-8?B?aG5JQ1VxRjhjWVg3U245SXVSRURtRmZ4Z1V5ZlBHaStMdUtKWVdJdzdydjMv?=
 =?utf-8?B?bTJpMzlDOVNqVndJc1o3bXRTR0JKbjQwMnlVY1NNZ3QvZVF3M3QwTm9ORm1I?=
 =?utf-8?B?QllqREg2U040aTJuR1hocWNlby9aRW5LUzRtYmlSQ2doNkk4L2hZcGdGU0dn?=
 =?utf-8?B?dzBza29OT2QwK1BnNFRZbksxb0VIZUhxYVhYeFRMbC9ESUVFMWg5Y2lmckRs?=
 =?utf-8?B?MjVKVG9WR3E3MUlzSEdMakYrT2RoSk03cE0wRzFndFkzTHd5cXRRbVNMNlh2?=
 =?utf-8?B?SCt5MjN0QnJXWHZ4amJQY1Bxekd3cE9tc2ZMQzMwd2dYYU1wWjBpZE1xWm4y?=
 =?utf-8?B?Wmd4THBldWVVV01mMWwrek1BYnNEODM2dHRHc1JscTlRdzdHMkFsYkdpR2FV?=
 =?utf-8?B?WlNHbVBRWlU0WVFRWGFDVFR4dllvdlQ5TzQrdHREQkJvQnpuQjI0REt3bGFV?=
 =?utf-8?B?WTFwTHQ2RzBQQUY0bng4MktWa0hBWFVPTU5hKzhMZXExVU9SN1pGNUhqSTJW?=
 =?utf-8?B?eFFnWFY1WUFZdURuVzFRcVgwQTNqV2RBV0xHcERZVzFva2ZveUR0UXZ0NEVQ?=
 =?utf-8?Q?TvttPY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBnQkJ0Z0ZNR2RtcW15RUwzN3Z0R2dFaDhYNmowb1dzeTJZRVM4VUh6dElK?=
 =?utf-8?B?WjlHWm1oUmVzMWloUXl5YjIxWWk2MHQvaVNNVXA5WHVPd2U2NWxmNW5Rdnky?=
 =?utf-8?B?UE9lbW1RaVd5MDBoL1RrLzlPSktmT3pkVzBuMmx0L1ZhMDA3OVBUd1RyZ2pR?=
 =?utf-8?B?dFBMQkZZWVZ3dTlPczh6WEgySmpYVXFxSlVXVTVwWVEzUDFRenE4RTc1aEdD?=
 =?utf-8?B?RVRha0E2a2t2U3FQWjBzMkFSWkVoK0JybHVYaHl2WnhzMHhLY1NYRHcwSXhx?=
 =?utf-8?B?UmRoOGRwRE1Fdkl1VkxMUzVoeEl6c2ZyQlhMYXhmSDhibk04aXcrUmpyeWRY?=
 =?utf-8?B?SFJBSGdZRzd2RjdUQ0hMQ0U5ZGx6SHlWZFZSbjFiSkk0QjE3ZHhvbnZtY3ph?=
 =?utf-8?B?NllncWgxZkRWbTRMcHdiTm5KQ3l0WnRINWh5VVJ5QytZYTVudEpIMkdBRGsw?=
 =?utf-8?B?bmxTZmZ2cDJwaUdyOWlmRUk0bU1xbW5NVXpocmVjcUdNeGh5cytoaWxjK2F1?=
 =?utf-8?B?eVhjMDl3TUYwZHhQUnE1RDBiQkdZQ3pJb0NCYlozZEJ6elNLQzYwLzkzTVVz?=
 =?utf-8?B?QndMdDF4MWFrSUdkN1VDd251ZE1EYnR4OHJ3QTZYTmpRclVWNERWamVrc1RC?=
 =?utf-8?B?WndiZllQS0VBUTZUYnhXU2xobDdtelcxUzBUYVZTMnk5aXFTMy9rcEh0Ynps?=
 =?utf-8?B?QmpaNVM2T0NWWEdWbHBEUDdENElTaEFMc01kdUsvWnBiYVVYT20yUFRsQy9l?=
 =?utf-8?B?YnY5TlhGb1lreG43Rm1EWlhkeWNVUGtjZDdoTW9wR0JoUFdCNzJ3WHFEZFM4?=
 =?utf-8?B?MDZqWCt4aDVraS9UM0V5dG5nUDlzZ3hNaUk2cU5NMllUS1prck0xTUZkSllL?=
 =?utf-8?B?SkR4WkFCVWhQbGMzcTdWU0NUVXpVdVBrSWVuNElhRTlBTTV0ZG9IT1Q2OUs1?=
 =?utf-8?B?a3QyR292c0t4NnlKNTJaNjdwb0JSSHcrbVdkRmdDUCtWZzB3SFN4clMzcDVH?=
 =?utf-8?B?M1k2blU3K1JUeFprb3pQWjgrVjNyemtVNGVyMkJRNTRsYWxFeUhLSHpuWTdZ?=
 =?utf-8?B?cmlZVjFtbDVzN0RwTVd5b29TREV0M2xudXRoTjlxd3RHbVVEUTFXVmZKYitD?=
 =?utf-8?B?eVE2Vkg1WlVZODFUWTRzSDRibURYV1phYm5CSW5NdnE0QVdENFc4ZWpDRUZm?=
 =?utf-8?B?OUJXNHlGRGkxRHZCOHNHbERXVS9Eb1FENVJFL1FkRDdjcWhndTYzYy83UXFZ?=
 =?utf-8?B?V1RZYXlIQ1J1RjJBcEpDZHE3UWlvcm1CY3M1TEFpaEZPdld2Wmd5VVVYUW9N?=
 =?utf-8?B?cVp6TUNseTVzU2ZlYW42S3YwV2VIVlRsaHdMSHBTZzhmamNTam9nRjRNdFVk?=
 =?utf-8?B?Z1VpY1Z5a0hTVUNSUng5dER4MVk5NGV1d0ZPR3haUFV0Q01OVWY1aldxUlp4?=
 =?utf-8?B?djF5Mmx4TU1jWVNFa3RmbTluOERSRTMzcUZlZEJEZFJ6UHBrcFdaWDUyb1dE?=
 =?utf-8?B?MFpINTZScUR1dHhrd1VoRkVFRXhBWDROOFo2L1VjeDdGTzVQQ3B3VW82Q1pV?=
 =?utf-8?B?ZG1xdmUzTWZDTGRFbGxHRkdTa0dvb1V3QUxHVmtIa3Q2eWN0VjRWQXZIQ0Ju?=
 =?utf-8?B?OFQ5RHhXTzJhODFxc25GL0tOSXVldzNIaEtvSlFXcEE0STRoZDJFN3pPa2RI?=
 =?utf-8?B?VzRPcVNsY1ZZb2tNYy9ZSnpFdzZ6RStuN29CdXVTaWxnTkNxeDF5K253aHVu?=
 =?utf-8?B?c3BhMjhkUXZWSkVzck90VElIcVpTK0RZMTAxUnRVaExyNElLMm1BTGlkUERU?=
 =?utf-8?B?MmJBOUR5VXZPQ3dXYWhuaEYvNUdOZm9yanIrTzUwRm9ZeXE4YkdwZExxRm9M?=
 =?utf-8?B?MjdMSHlacndTREIwa3gvQTF3SUVva1N0MUxkWFovN2tUdzhrS1NraTMzamJJ?=
 =?utf-8?B?WHVDYUdYMHJLMGI4dS9hOHlZYlZEMEhMMGNwV3R3KzNMOExwakRhZnE1ZUpT?=
 =?utf-8?B?R3orVXp2bUhGeC9Wc0NReGpFVkM3SGNsR1YzK2grTkNOd3JOZGZVeU1Xa3Yv?=
 =?utf-8?B?Z1lUL3Z3bFloZzhRMVlHQS80WjdKMFpjUkhkeDEyenlQSmh3V2hsNGx0RXZH?=
 =?utf-8?B?TWl0MzlTRC9yWS94TGlSZ014WnhpaWZPVHJlNzFoZnRvYjl4aEpLVVVuNU5U?=
 =?utf-8?B?UU1GS3hzMlp3aW9VNmNzOGVhbzdFTHJBR05YWWFDSElzOVdDVjVnMVlQbjhE?=
 =?utf-8?B?THBmOUg2d1FGRlJtNkM2Wk1rU1MvdFZFblI4S0RjbnN1QUZCVkZNdVpTMDYz?=
 =?utf-8?Q?9w+TCgbwEbvUnIqKiI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe5e338-ed8f-46b2-2eac-08de57530d92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:05:35.6031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTDS9BnJjN5tQ97lCZeoyr6cKBegr+48fbRNqQnykQEBIAbI7M1Vgl9phxCHp6t6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845
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

On 1/19/26 11:53, Leon Romanovsky wrote:
> On Mon, Jan 19, 2026 at 11:20:46AM +0100, Christian König wrote:
>> On 1/19/26 10:27, Thomas Hellström wrote:
>>> On Mon, 2026-01-19 at 09:52 +0200, Leon Romanovsky wrote:
>>>> On Sun, Jan 18, 2026 at 03:16:25PM +0100, Thomas Hellström wrote:
>>>>> Hi, Leon,
>>>>>
>>>>> On Sun, 2026-01-18 at 14:08 +0200, Leon Romanovsky wrote:
>>>>>> Changelog:
>>>>>> v2:
>>>>>>  * Changed series to document the revoke semantics instead of
>>>>>>    implementing it.
>>>>>> v1:
>>>>>> https://patch.msgid.link/20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com
>>>>>>
>>>>>> -----------------------------------------------------------------
>>>>>> ----
>>>>>> ----
>>>>>> This series documents a dma-buf “revoke” mechanism: to allow a
>>>>>> dma-
>>>>>> buf
>>>>>> exporter to explicitly invalidate (“kill”) a shared buffer after
>>>>>> it
>>>>>> has
>>>>>> been distributed to importers, so that further CPU and device
>>>>>> access
>>>>>> is
>>>>>> prevented and importers reliably observe failure.
>>>>>>
>>>>>> The change in this series is to properly document and use
>>>>>> existing
>>>>>> core
>>>>>> “revoked” state on the dma-buf object and a corresponding
>>>>>> exporter-
>>>>>> triggered
>>>>>> revoke operation. Once a dma-buf is revoked, new access paths are
>>>>>> blocked so
>>>>>> that attempts to DMA-map, vmap, or mmap the buffer fail in a
>>>>>> consistent way.
>>>>>
>>>>> This sounds like it does not match how many GPU-drivers use the
>>>>> move_notify() callback.
>>>>
>>>> No change for them.
>>>>
>>>>>
>>>>> move_notify() would typically invalidate any device maps and any
>>>>> asynchronous part of that invalidation would be complete when the
>>>>> dma-
>>>>> buf's reservation object becomes idle WRT DMA_RESV_USAGE_BOOKKEEP
>>>>> fences.
>>>>
>>>> This part has not changed and remains the same for the revocation
>>>> flow as well.
>>>>
>>>>>
>>>>> However, the importer could, after obtaining the resv lock, obtain
>>>>> a
>>>>> new map using dma_buf_map_attachment(), and I'd assume the CPU maps
>>>>> work in the same way, I.E. move_notify() does not *permanently*
>>>>> revoke
>>>>> importer access.
>>>>
>>>> This part diverges by design and is documented to match revoke
>>>> semantics.  
>>
>> Please don't document that. This is specific exporter behavior and doesn't belong into DMA-buf at all.
>>
>>>> It defines what must occur after the exporter requests that the
>>>> buffer be  
>>>> "killed". An importer that follows revoke semantics will not attempt
>>>> to call  
>>>> dma_buf_map_attachment(), and the exporter will block any remapping
>>>> attempts  
>>>> regardless. See the priv->revoked flag in the VFIO exporter.
>>
>> I have to clearly reject that.
>>
>> It's the job of the exporter to reject such calls with an appropriate error and not the importer to not make them.
> 
> Current code behaves as expected: the exporter rejects mapping attempts after
> .invalidate_mapping is called, and handles the logic internally.
> 
> However, it is not clear what exactly you are proposing. In v1 — which you
> objected to — I suggested negotiating revoke support along with the logic for
> rejecting mappings in the dma-buf core. In this version, you object to placing
> the rejection logic in the exporter.

Sorry I probably wasn't explaining this correctly.

I was rejecting the idea of doing this in the framework, e.g. the middle layer, or that importers would be force to drop their references.

That an exporter rejects attempts to attach or map a resource is perfectly valid.

Regards,
Christian.

> 
>>
>>>> In addition, in this email thread, Christian explains that revoke
>>>> semantics already exists, with the combination of dma_buf_pin and
>>>> dma_buf_move_notify, just not documented:
>>>> https://lore.kernel.org/all/f7f1856a-44fa-44af-b496-eb1267a05d11@amd.com/
>>>
>>>
>>> Hmm,
>>>
>>> Considering 
>>>
>>> https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/infiniband/core/umem_dmabuf.c#L192
>>
>> Yes, that case is well known.
>>
>>> this sounds like it's not just undocumented but also in some cases
>>> unimplemented. The xe driver for one doesn't expect move_notify() to be
>>> called on pinned buffers,
>>
>> And that is what we need to change. See move_notify can happen on pinned buffers currently as well.
>>
>> For example in the case of PCI hot unplug. After pinning we just don't call it for memory management needs any more.
>>
>> We just haven't documented that properly.
>>
>>> so if that is indeed going to be part of the
>>> dma-buf protocol,  wouldn't support for that need to be advertised by
>>> the importer?
>>
>> That's what this patch set here should do, yes.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Thomas
>>>
>>>>
>>>> Thanks
>>>>
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> Cc: linux-media@vger.kernel.org
>>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>> Cc: amd-gfx@lists.freedesktop.org
>>>>>> Cc: virtualization@lists.linux.dev
>>>>>> Cc: intel-xe@lists.freedesktop.org
>>>>>> Cc: linux-rdma@vger.kernel.org
>>>>>> Cc: iommu@lists.linux.dev
>>>>>> Cc: kvm@vger.kernel.org
>>>>>> To: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>> To: Christian König <christian.koenig@amd.com>
>>>>>> To: Alex Deucher <alexander.deucher@amd.com>
>>>>>> To: David Airlie <airlied@gmail.com>
>>>>>> To: Simona Vetter <simona@ffwll.ch>
>>>>>> To: Gerd Hoffmann <kraxel@redhat.com>
>>>>>> To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>>>> To: Gurchetan Singh <gurchetansingh@chromium.org>
>>>>>> To: Chia-I Wu <olvaffe@gmail.com>
>>>>>> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>> To: Maxime Ripard <mripard@kernel.org>
>>>>>> To: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> To: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>> To: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> To: Jason Gunthorpe <jgg@ziepe.ca>
>>>>>> To: Leon Romanovsky <leon@kernel.org>
>>>>>> To: Kevin Tian <kevin.tian@intel.com>
>>>>>> To: Joerg Roedel <joro@8bytes.org>
>>>>>> To: Will Deacon <will@kernel.org>
>>>>>> To: Robin Murphy <robin.murphy@arm.com>
>>>>>> To: Alex Williamson <alex@shazbot.org>
>>>>>>
>>>>>> ---
>>>>>> Leon Romanovsky (4):
>>>>>>       dma-buf: Rename .move_notify() callback to a clearer
>>>>>> identifier
>>>>>>       dma-buf: Document revoke semantics
>>>>>>       iommufd: Require DMABUF revoke semantics
>>>>>>       vfio: Add pinned interface to perform revoke semantics
>>>>>>
>>>>>>  drivers/dma-buf/dma-buf.c                   |  6 +++---
>>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  4 ++--
>>>>>>  drivers/gpu/drm/virtio/virtgpu_prime.c      |  2 +-
>>>>>>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  6 +++---
>>>>>>  drivers/gpu/drm/xe/xe_dma_buf.c             |  2 +-
>>>>>>  drivers/infiniband/core/umem_dmabuf.c       |  4 ++--
>>>>>>  drivers/infiniband/hw/mlx5/mr.c             |  2 +-
>>>>>>  drivers/iommu/iommufd/pages.c               | 11 +++++++++--
>>>>>>  drivers/vfio/pci/vfio_pci_dmabuf.c          | 16
>>>>>> ++++++++++++++++
>>>>>>  include/linux/dma-buf.h                     | 25
>>>>>> ++++++++++++++++++++++---
>>>>>>  10 files changed, 60 insertions(+), 18 deletions(-)
>>>>>> ---
>>>>>> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
>>>>>> change-id: 20251221-dmabuf-revoke-b90ef16e4236
>>>>>>
>>>>>> Best regards,
>>>>>> --  
>>>>>> Leon Romanovsky <leonro@nvidia.com>
>>>>>>
>>>>>
>>>
>>

