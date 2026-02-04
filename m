Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJVCECxyg2mFmwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:22:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87DFEA205
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34A110E50C;
	Wed,  4 Feb 2026 16:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dw10h5er";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010061.outbound.protection.outlook.com
 [40.93.198.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA42010E50C;
 Wed,  4 Feb 2026 16:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5K24x3TjAR4QcyEqR9Rr6MyMVRl01zPDe+HfO3GWYGJgYDKeNj6nqjkmmO/0Lv00M0vq/Lz9ZaVO9V2C4SmD6SYyPZOCK7ysY95NNCIVN2jGEV9iXWYtVwnLuLE8Q+eAApn/UQopS1cBJgq+WabGWlAQsOjWt7lRdyid/DQAv3Tjw7xIW+uN4feZAmnJzmjRZEPrw5K9c3k/J5Rkc615kEIVOsM2H1Xmx/5fLRFyPSfD4q1YEhtYpDxMOUDO/fAXIEM/diQBHVeABoWXHRlDYliAPEenk/0zKD/eS8bKGjzzACrNd3YXC9H/rAwO/yhaD04KhTJDytn9YTH0pFVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm3DWcke8SB4n13gY+v4wuFPjMZQKZyLvLnh5u9elGw=;
 b=JjsuyQEUJY44zfL8tdbXPvM1OjmFBcmj6pCuVYqT4nvz6AeRRyP6kfvnTfyShf2XeSMDbBSgw5bXxAX0Ym0AQ+dG1exE7EC3WWg1zceQ3xu68bxFV/AJKvzle6Fy5gEq3pGDtULjLWP5wlPtyFbR6qcBx/VxIoZXVTm7J+ffSDcq+9v6ulyAaihpXxN48LynUA0ALtlqB7K7xLgcC1zoaLr6sJakNqpPX2bkg7BPuxpwf3vSQx1ffNho+9ln9+nFbbYx84aL2yjRy9zYlm3kXYgmUaPC/IRlZdS/Q+G7nFHlIxOEzCAQpeilp+MP6+j5j7q85L7Jk86RY/Hy2oFgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm3DWcke8SB4n13gY+v4wuFPjMZQKZyLvLnh5u9elGw=;
 b=dw10h5eruIfdxeozKYB6HqcxBW48A8dWWZ3aZNxwTuOpBhg5hh88qUrHqSuaO6rARjjKaq0arbQVqAbz3odR7ia9zPetdPHuPmlBF4KvfuDyzVIFI1MdOHA7h5ryHPMfJpxF1SRJ/knd3GA8dMbqN5eT9cDG9DkWOiJc8ModDbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5601.namprd12.prod.outlook.com (2603:10b6:303:168::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 16:21:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 16:21:53 +0000
Message-ID: <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
Date: Wed, 4 Feb 2026 17:21:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
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
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0446.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf6377c-c49a-44b6-bc3e-08de640981f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L253RXhGZ01YRmxHN3NpNi9CWUY1eW02OFdvUDQ3Ryt1R1p1d3JUOEVxOENu?=
 =?utf-8?B?Z0pzdXJHejRRQUl2Q2Q3aDJ1cm9qY1RtYmwrUmNRUnhqemJmKzZLR0h0TERl?=
 =?utf-8?B?QVVwRnRwQXpSVjBrWngrTVFRTEp1TUdwZWppUXdCVzkwU2J6TVJkVk9wNXR6?=
 =?utf-8?B?ZlZ3UFV6SFd2STZUTFp3SnllOEFmZ2xKTVZHZFZBbURBYTJ2Vjlvc3FyenZh?=
 =?utf-8?B?K2gvSkZXNkdZZE9aV3JjWWlobnhyM0VTcjNVK1VYVXdYVkVRSktMSGJaTVpn?=
 =?utf-8?B?bjlON1dpTm1ZVHkvZXRHMGovRTI4T0JGZkJVOTd3TDdqb2c1MGdhVzNIYVpR?=
 =?utf-8?B?bW1CQWNpU2FjYW1DTFBpQm00MHFUK1BsRXE5bU5DOVFzSDRabjk0VjRRVkQz?=
 =?utf-8?B?WHV2b0NERy9CdUFTT3QzNjZuK0VYdS9FVmhZL0ZMUnMrRGZFUGVBZXhHcEdu?=
 =?utf-8?B?ZzRsWEhBNGNLNFNtYjRPZnlQSEhaMkxOSitVaUJQcjl1N2hnbEIrREhPMHcy?=
 =?utf-8?B?WlBQMmwxUGkyUHNDdnRDKzZsaGg0Qk14WERmSy9qSUdkYnQ2QXhreEJZVGZG?=
 =?utf-8?B?ellQcS9zaTk0T2NpWFNQTlZYRUY5OWxSaUFWbnp1NTdWVlV6T3J4bi9IM2pi?=
 =?utf-8?B?Y1F0QjMzWGVHalFMRkR5V05uQ2IyQTk0QWcxVVE4WmdZZlZPaDZ0OU5pc2Y4?=
 =?utf-8?B?MnZiNkIveTlyS2VzTGRjTHdmaWdydGVKcm00VUpGTEUrNzdja29HblM3SG1M?=
 =?utf-8?B?OTB3bzZqZHRyWTRvc1RWTzl1MGVqQ0ZscXpyOTMrMW85OFV5WXpNSEZNQkM0?=
 =?utf-8?B?MzQzSlRoYTRPUTJwRmpjcGMrbExnc0hnb0pBNG14TUUyampoczVtYzNubXNa?=
 =?utf-8?B?blo5NjdJSHRRcncwS3QzZnB4ak15S2JyZFkvSjF3V1RjdWNIRmhnYVlOd0hu?=
 =?utf-8?B?V1hqRWFwK0JNcEFhOUpQckVuMXBzU05UZGVpRG14NkRHMFhVdDhzZDlHVWhp?=
 =?utf-8?B?YmtGSDBJZWtoZDFKTWZKTnp5Wk5Uc2cvQzdyd1JENUNtcFhEV0JqYWRTdlAy?=
 =?utf-8?B?K3ZVMFQzTXJnNEF2UitZMmZidGRRbXhUQzdEaFZORE1XODc3emJuM3JNcGVp?=
 =?utf-8?B?UTVWY29TODZ4bG9JNmQ3aE9KeVFiZUFIZkhjSUhHWk9sMWVwS295azliM1dR?=
 =?utf-8?B?eFExOVAzbjdoVTRjQ0EzaWRFcnVLb0p2Z3BMNVVwOERCZGRSSFhnejZZVWtr?=
 =?utf-8?B?MktPcWc2UnRBdEwxTUVsMTQzeW5uakhrTGYwZ0E5U0lva3F4ZTJvbUQ4VlZz?=
 =?utf-8?B?Rk1ONTVrZlNSdk5aWHYwWFRhblhZYksranRSSmt4OXFoTmRPODMwdTAvdGt1?=
 =?utf-8?B?OU9Ub3MwWk44VEFKTWcxMU5YcFhsYnZwMVhrY3FPQm44YWMwR1VEMncxeERv?=
 =?utf-8?B?Mld3MmhPcm95eFdxbnc2THJsK1N5bTg1bmZXSnlFWWFDZGswQmI0ZTJOZHB6?=
 =?utf-8?B?WVp1YlJTVjNadC8wb014aHMvVDdxRFNmUXZmckV2TlJOL2JBaklWaDgwL005?=
 =?utf-8?B?SVpZTW8vaFlDUXVUelZBaEZXeExES3ZQVkliZzNlQnVrWDFmc1lsNG82NlFz?=
 =?utf-8?B?L1FDOGg1QlhZQkU1SkRKc2Vxd1pYNGtQVjlYQzUvbTI2NFVWSE9XRTR0V0JJ?=
 =?utf-8?B?R01jMzY2ZmVQZE8yNHh1RTREY0JweVplbkI3NnRZN0RjdXBuVld3MitZVDlH?=
 =?utf-8?B?T1U4Wk5iK1gzRVVRL1ZRRVpmQmcwbkczcnNScU13Njd1NUFxT1V1Rk10OE5w?=
 =?utf-8?B?ZkpvbmNYVWgzOHErWUlXTGRvZm1OVnRBa2QzSFJtWWZNZmQvUUhuNWMyUW1H?=
 =?utf-8?B?VDczdEN4K0dJellIdFkxbFZFaDZKd3lOVE4wcG1SR1FKU1pDWWRsUVhiam5v?=
 =?utf-8?B?SVFpZjZRbVNQdnZKNW81YWtDUTg3ZGdOVXJGR1R4VVFPTTdmNjVKNU5ULzVu?=
 =?utf-8?B?eXNGUFlGb3MyMTlZWDNDUk1lYXRWMllQZlplU0pHOEtYVHNwcCtwOXlkbkV6?=
 =?utf-8?B?RVE4L0s4bFhDK25rekQ1TkR5TCtCbFVTVUdTOGprRE4vRWNvNDAwRnBiNzA0?=
 =?utf-8?B?MmR4TmIvTEk5Ykp0dEV2dzRVUHkxZ2x2YzBkZjJNUVFLaHFKM2hvMnRZeVA2?=
 =?utf-8?B?RGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1NLQ3d1OFloZVRVdTBEUU9zNXZCUXc4RzROMWF1QUM2SzJsMC9MTzZKWTJU?=
 =?utf-8?B?QkVBckVpU2kyeWk2ZVUxZ0NIYU5ZcGk3QnhEOGQ0ZnZGTWdqMWpxRmV3WGZY?=
 =?utf-8?B?c01XckZ0SGN3L29TcVgvSFA3b2k3OVBiUmpFOGsvVXVLU3NnSFc1b0hpNm1N?=
 =?utf-8?B?aXdYcHdVNnhENFRtZEJjSFRvbXRYRDhRTGZSTXMvUG5LZWVxcUplNUxyK2dU?=
 =?utf-8?B?cFFIV3Q5QTlpcnhJNVBDbTFLZE9WNHBYMWxwWlQrZXIrSzR2c1FQN3lsVlor?=
 =?utf-8?B?NnBFaFBEaHFENm42TzZoMUZMQ2JUQWRRci9ZN0JtR2QvL2pkNkVGYUZSM25G?=
 =?utf-8?B?T1lTRXBhNG5jTEVNRDFiaHNXYkpNejBhNkR2ZmV1WVZXSldiQ2owUnNrRmJt?=
 =?utf-8?B?b1ZzcGNDbS9vODlKNE1YMmZnaEZFN0RObzZLN0I5MVR3dDJoOStNcWExdG5R?=
 =?utf-8?B?ZHVPK1o3dUhUeVpDN21jQkxSRzZnMlVVKzBHM2k5ajBrVTRQMzZMZHBPaEg0?=
 =?utf-8?B?K0V1RDV2S21qbW9xbU1JYXJsQlAxMHpYMU04Y0ZQT3FtQVI2cm5OREovTEZ0?=
 =?utf-8?B?Z2JURTg1NG1SK1VZZmRTYS9sYmhrVm9VZDVlbno2VVlUQ05wUUxBTVIxWTQv?=
 =?utf-8?B?b05yUHJWU0pHVjJVY0tKbHNwdm1HVmpWd1BVK0RVd1hvS2l2TGFmZTh5djZt?=
 =?utf-8?B?Zm5yOU1lNlpvMTlKS1lnRkRETGZzMDduMVpmaDJYMXh0MDA3d2I3TkNkS3VR?=
 =?utf-8?B?V2tDd0NVOHJCSnRpVjl2RzNjeDZGZnIzMmZWNUUzQzhqZU5CRHplMjByZ2xD?=
 =?utf-8?B?bmpMbjZlU2NSaW9jSDBBS3NzTTJoNnd4N1dXRERFVWVVTXMzNk1sZDliNm9X?=
 =?utf-8?B?bVlGL3VSNGZzUkpMbEdKUFlYOUpORnV6SUVROWlpRENZeDJ0RU9BRUF3Y2hK?=
 =?utf-8?B?N2RpRjBiMW1QdThBTkZnQVRjMTh2WDY1VDdNa0NaRUxxN3l0TWwvY3hQR01U?=
 =?utf-8?B?NkhPb0hIOHErRm9ibkZFMEVScDBNRVl5SlpBS21mN2kwOWliVDlsUndON21q?=
 =?utf-8?B?c0FOSHN6UHg5OTJpOW9BZ2NRalYrLytCY1h2S1BRUlNDSHpDaW1MVDMxVTlK?=
 =?utf-8?B?YmdGOVZtK1V6a3NuS1VrL1Z3cnFjRWdIUHo3VUhlaXZJU3dKTmdsWFFFckQr?=
 =?utf-8?B?ZVlQSFZhdkRkTFJvQldSN3BDenJKYzk5Rlh3cFprUXA2NlpRdHM4dldLdVIy?=
 =?utf-8?B?bGZCQnVlSU5NYXdzM2pWNGpYUnNFZVlpbTBUckZEdW8vR1R2Rm1jMFZOelJI?=
 =?utf-8?B?aERrMGNsTHlaQno2QWFzN0x0RHUyVDA3Z0pVSTFCM1M0a1BiVmdzRkxzeTI5?=
 =?utf-8?B?TzVNMjdrVlRUZERaSnlXOUhIRDJ2RjNGekcza0pnZllKdm5uRkhlZVlYclZ2?=
 =?utf-8?B?YlBIcnZYMEluRjYwamRORnl0TDJ3czNpWkV4UEpmVjhPMEt1MU80T0t2NUV4?=
 =?utf-8?B?WXFnemwxdGpYVG01N1ZHc0kzM21ENGJsYi9hNTFnMmJrKzVYYkgySUlia0dY?=
 =?utf-8?B?UEczWlRUU2hYYlQ3S3BjMjZvbkV1Q2sxTG5PRk13cE0rN1lGazlUZDhEcXJ5?=
 =?utf-8?B?OGV2dkNCRjVkUXdkVXR2N0ZjT3BPd1NYbGlyQmNYVXZSS0psVExjejhQUUNO?=
 =?utf-8?B?RTkwMzNaUm54SHJldjl0V1VDOUxoSG1yaW5BbHo3M01TNjVxcGJRUXdHMUNQ?=
 =?utf-8?B?d3Qyb2l2QThteHEzWFlyUUtPSHNzWjlYb3hPQ2xqYXo5b2k4WlFuTnRMTndj?=
 =?utf-8?B?QXJVOVlXMkVicCt0eGdLQi8wWSt4M2hwY1dxV1F4UjVEamNIR3JKZVo2MWdr?=
 =?utf-8?B?TDF3RGFJT0JzYmkvL3VkOVZIV0wwNzBXSG9OSUk5QXMwdUtCMDZsbndTWlNW?=
 =?utf-8?B?UTIvZjVMOHJSeFlaNU9FY2RPdFVmWSt0Nm95Y0wzNGk2ZExQUmk1VVhGbEdt?=
 =?utf-8?B?bGJka1pxSXZLWlNRMG1vQjcyRDB6dmtsVEpuYUI5NzFiZjhXREptdmVuaEdX?=
 =?utf-8?B?MGJBcmJBRE5EVHRXWU9Pa0s2T2w2V09GMjZpY1RidW0xa3RhSkw5OFpTREx0?=
 =?utf-8?B?a3ptOFVzRW4yWmExTCtaL2FJby9saTVlbHBteGlzQUY3ZDhlVGZsaDV4Z29B?=
 =?utf-8?B?ZHpONERmWFlDdklUalZueXBLQlBlM2RFanFUY0o1T2ZIdXNNRkhDb0dLUTYv?=
 =?utf-8?B?L2hWaGRWTWFBYnhLTW9CdkRlYmlMVTN1aEM4aUNaWlhOdVA2bFNST3p3dW5v?=
 =?utf-8?Q?Hqox3iWGa+M6LUTCvW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf6377c-c49a-44b6-bc3e-08de640981f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:21:53.3750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggWSSFPIlWl82N4LfQAblC16qbnUgaNii+P4OIVW0JKD8VwkqIetY/sh8TadadM9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5601
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid,shazbot.org:email,intel.com:email]
X-Rspamd-Queue-Id: D87DFEA205
X-Rspamd-Action: no action

On 1/31/26 06:34, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Till now VFIO has rejected pinned importers, largely to avoid being used
> with the RDMA pinned importer that cannot handle a move_notify() to revoke
> access.
> 
> Using dma_buf_attach_revocable() it can tell the difference between pinned
> importers that support the flow described in dma_buf_invalidate_mappings()
> and those that don't.
> 
> Thus permit compatible pinned importers.
> 
> This is one of two items IOMMUFD requires to remove its private interface
> to VFIO's dma-buf.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Alex Williamson <alex@shazbot.org>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 78d47e260f34..a5fb80e068ee 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -22,16 +22,6 @@ struct vfio_pci_dma_buf {
>  	u8 revoked : 1;
>  };
>  
> -static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> -{
> -	return -EOPNOTSUPP;
> -}
> -
> -static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> -{
> -	/* Do nothing */
> -}
> -

This chunk here doesn't want to apply to drm-misc-next, my educated guess is that the patch adding those lines is missing in that tree.

How should we handle that? Patches 1-3 have already been pushed to drm-misc-next and I would rather like to push patches 4-6 through that branch as well.

I can request a backmerge from the drm-misc-next maintainers, but then we clearly don't get that upstream this week.

Regards,
Christian.

>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  				   struct dma_buf_attachment *attachment)
>  {
> @@ -43,6 +33,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  	if (priv->revoked)
>  		return -ENODEV;
>  
> +	if (!dma_buf_attach_revocable(attachment))
> +		return -EOPNOTSUPP;
> +
>  	return 0;
>  }
>  
> @@ -107,8 +100,6 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>  }
>  
>  static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> -	.pin = vfio_pci_dma_buf_pin,
> -	.unpin = vfio_pci_dma_buf_unpin,
>  	.attach = vfio_pci_dma_buf_attach,
>  	.map_dma_buf = vfio_pci_dma_buf_map,
>  	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> 

