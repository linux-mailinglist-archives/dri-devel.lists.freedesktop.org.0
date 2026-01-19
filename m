Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0AD39FE2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6812F10E370;
	Mon, 19 Jan 2026 07:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UK3t6y8a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69B410E370;
 Mon, 19 Jan 2026 07:32:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNXKGxQw1J8SHfgUDATczXC/maCXIpp3lo5NS0YYa8qklly9WIHh4vY8yrwMTm4GegB0f1Wt6XIMsUZqwwq+crehfzb62LYh5dxywBIk4Me/sPqWDgDuHiw2qy4xvwbvf1gw9Lb3F0J6w9hPyT5t5W4VPm5nhsIOHaf/UUWwoXp6Fbpx0REKcuvqNTIus0NV7lchYWojsCNOaGPrGYuZtfHdP1v8ULzscm0aHuvJU+k4IoUHyfNls9YB8jXpkVXw71s0Wy8pzZP25UyqCplyf7xx31mtdyqM1Ot3YWD9YnH/ZpPf6yqot1fo2hSFZ9dhEXgR0obKfaniXRefR4YDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=en0sa9rYwczFxfgrjJTEK/gEsvRV0Px66cu+bWR/+L8=;
 b=wET1yuDZX7+OE8k3rl5QOrthZoCg+8MuiDIhkwvHWg7OncNSqyJK3u+Tpqys6w7nvEFhZJx0El6Pbo4Qc3mECu+7EZLyKQCMUiT00WEcJJi+oR9gpfxS2V25+VbeowMFqpFK/3lWS45VRIS7gVDrr/m6dxB2iFHHxVabrsHI9zv/Hi7IqulX0dekl3eAiijr822xH2Q+OtzHHJJWtHgMhDGN6ANwWpsRjQMqZ0Zm6ISWDs+RAosyBuctK++tlbevq1CtU6eBHY4PAq5bBh/4Y/W/z+8HvGBPol4cfRJ2omW1Q32L5AG/94VXJMXb3/cL1D95vnHKCGYnkiRM/d+F5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en0sa9rYwczFxfgrjJTEK/gEsvRV0Px66cu+bWR/+L8=;
 b=UK3t6y8arrkw/RispBdrd15alGtqYZzpS+ZQofF2kb9HY3ZL7Ha8ZBZCBfXbCQS82Y2kEBDzyrAWbmExFTeDXtgug5D5pQ3d8Qc14gNoO+CleV0Hnt3M+GuBMdFszzfdR2PH+RFObWHLsQchWYKhSluHAtLff+WkA55RZOuH+3KTfPs4vYepGzyAhU6Q+HiiVsv+bI9fdjEsh+Hl5gQzH9yRf1v8D3L0GmkY5K6d2SSeEQ4/O4j0y4UJ5XIWBagpJs8eUUKgHGIuMJhTRwLnFRk5ayYNUWlQaYvaF4nyT+VACvzAiGSi/7HFHWXnHnll5i5GAP1KGewz61rtSxZcug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by CH1PR12MB9621.namprd12.prod.outlook.com (2603:10b6:610:2b2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 07:32:28 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 07:32:28 +0000
Message-ID: <3380a80a-7574-4dbf-87cb-0735fb20cd15@nvidia.com>
Date: Sun, 18 Jan 2026 23:32:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
 <d41d08e3-6a86-40a4-925c-6a3172670079@nvidia.com>
 <20260119072524.GD13201@unreal>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260119072524.GD13201@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|CH1PR12MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 420ccf31-48b7-4b28-6193-08de572ce578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dExjZXM3VnJlREMzand3UzlnWWpJd3NzR0JWM0tKbi9DNHlCUDVFWHNMT29o?=
 =?utf-8?B?dUpqaWpXY1ZmZ3NEckdBNXpsOHpKMWdzSW5vd3dFRCs4NnROMTRzbXdRelNi?=
 =?utf-8?B?czcvbVVMcExVaXBJcDN5djB1TlNkWTN2TXk1Q0l2UERzZ0F6UTFBdDRwYjJo?=
 =?utf-8?B?Z3NkZERYUGZ5ODVOWTg0T3dlY2xta0ZiMFRtSERkSDgvV2pIeXlNNU1Pb3Y0?=
 =?utf-8?B?TnR2akxwR0dwaDZoSGQrUUxYeTJQUEZXZHNzdmRxcVFZNnh1Tk9yQUhKRlIx?=
 =?utf-8?B?RHRKVFljRmhkVjlKckY1U0MrNFNzMEYyejhCUUhsOTFCRkJlTGxwWG10MVlx?=
 =?utf-8?B?SUtRMFd6UFNaOFllQjdxWVczY1VnZlFlTVR1UUsrMkRmNG55ek1QZ0tyaVBC?=
 =?utf-8?B?SC8rRTdoN1VaVnliL1hXcGtJVU83YjlUYWZUNnhoVmcrSm5Ma3JjUXpvc3BU?=
 =?utf-8?B?aG8zdmdGckt1TExzQlFHcm96cWJiOEZ0dGdBWVEzcy80ditUakNmS3RGMzg4?=
 =?utf-8?B?R3ovYW4ydjNLOUpXTnhFcitUN1ViVkkyNk94THFEUXJZUjVxZEc4VTBlb0R2?=
 =?utf-8?B?eW0vM1pXVWFuendqVFJqTk5tVjJGMlhJL1R0U0lvSWwvV2o3YnNsU2RIZVFF?=
 =?utf-8?B?bEMxQ1NIMm4vdkF2ajJLYkhObFFDNjVsNFYybWc4cmJRMlRYYjhCbXR1WHJX?=
 =?utf-8?B?MTFEWmdBYmVScExoRjc1Si9IUCtySStpdTg4QWpwOWMveXZnLzJyWFZpQjM1?=
 =?utf-8?B?emljQklua2N1OC9CcnArSWFQRFBpdC9HZUgzUzBCWTYvZnBCTm14Wm1JT3gz?=
 =?utf-8?B?Z3NjRVBpYW8rUzc2UWJqTkF2YUdjeTJuL1lXT2Q5a29FMDFxV0tMUmUzRml5?=
 =?utf-8?B?Q1pYYjNScFAyN0FtYy9pbHFSajUraHZ0STVXNkZVMWJwL25Oc0hvRWVtWGpk?=
 =?utf-8?B?cmFMTk9lUm9uSjcwSkl1SXJmWXF3bjc2MjJWTXU2UlJyYmYyMFZmQng1TVlX?=
 =?utf-8?B?enB4YXFWZEkzYnBkcjdJeW5KOXQ0U2E5TTlhV24xbnVnOTdPZzVQZlI5YWVG?=
 =?utf-8?B?bFhBNksrYjdGUWpZeE9jQkdpMHhiaWxnc3h2b0lNYzFPVHFzNTRma3M4alFB?=
 =?utf-8?B?NUR4ekNLRWovRGpScVdlRXQ0V29rNi81OGd5ZWY5TlJYenBHcExvWUN3S1ZI?=
 =?utf-8?B?dm9EeHNoNVNMUFJJYm1EZWExK2RvZjE1cDRRS25xWVdXMEhpUXpqTWNzMjdw?=
 =?utf-8?B?cTVUM3p6TXVmMmRZN2tOZnlETTl0MlA0S2dEcElXaHJVeGE3My9ITjYwQTQ1?=
 =?utf-8?B?ZFhLbCtObVZqMENxMi9ZUzhMTjhNWStxQlU2M1R0d3A4K2lHYTlPMGg2blIx?=
 =?utf-8?B?RDlTRlZDNndDRFA0TUFwMlNxTmptNDlObHJSdG9IODBQZU5nMExLZWphWFJr?=
 =?utf-8?B?ZXEybVNiVGFZRFNPcitqeGsrSE5PSWMweCtaNlRJUHU2TG9IdHo4Snl0ZUZS?=
 =?utf-8?B?NHd6WWxXa21oOHBrSWlXY2g1eVhwTWxQbVA4L2JtYVQxa0VqUmEyM2d5UW83?=
 =?utf-8?B?N0N2VmNKN2ZuMmo1RkpFWnUyTWV4NkV5NFhaVnZibnl3UStrelBxRFBCTWJB?=
 =?utf-8?B?Y012RUM0QnJzZ0VJa2hlQlpCTkRxWVpST1h5MFRyekNvWE1UcEg2cUVITHY1?=
 =?utf-8?B?VnVCajBZb3VMSUhaWTRhT1R4elZveFErdFdDU1MrdmgvUmZLcnRlQUJDZzlX?=
 =?utf-8?B?MGUrRFo0L0VKR1hPRkNWZHRjU2NHTG1NVGFJOERCd0JCUlJXYTJnUWUyQ3BX?=
 =?utf-8?B?WlA3ZGJvano0M3pTeS9UVVhjVmkrV2ptRjhwcDFuc1RqTzdDVmFlaUs4akhm?=
 =?utf-8?B?NGdhMDJhcGkwUXZLeWJTMVRDbTZCR20vQ2M1b2VOK1BjVTZPd2VOY0NaVGR6?=
 =?utf-8?B?L2hJVXV5aSsvaXBqejduSDM3UVdQUHNaUkt6UFNlQytWTFg3QjZnTTF0Z0JK?=
 =?utf-8?B?TVd4WW1jRjRwaktDUEd4MXl6eFE2dHJhaHIzQWgxNGJwcGhRZWtlY213dVcv?=
 =?utf-8?B?YmlTZ3JYYVQxUUNiRnp3UGlsL2NpeG42dDBvVlZiRnk1azJkZkRBMHRQVFEy?=
 =?utf-8?Q?802E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9412.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWJXK0RHQ1pvaVJ5Q2I3cjgvNGZ4cVBzOVIzb1pyWXMrMWtLWWtuT212S3ls?=
 =?utf-8?B?cHdPd1dDVkFqV05tZ2JvTXpZeE1ZdTBNTHZkeU52QXVYbVBxZWZtL1BKanJ5?=
 =?utf-8?B?Lzlwc05UdksrRVNYL2Q1a1cxTVN6Ym53TFhTZllRb052bVZEZXNneHNnWGR0?=
 =?utf-8?B?empIQTY2YXlRNnBzT0FuZW9rUzk4OG56bi9wSXBzZHhuWjJPeWZSVllOUkx2?=
 =?utf-8?B?STI0d3BnOCtVdVdFUnd6eXI1Tmp5dk5oQjkrZ1FIZlUvV1Z0d1VsdS83bEVs?=
 =?utf-8?B?cVBhYldndHlhZUtYeUJuWlFXNlBZQlpVSm9JUUhqRlgrTkpBTjRUMEdoN0lu?=
 =?utf-8?B?Y1dXSVFpN1MyUjBCWnBZQU9kSmhycnBjSmdlaEZ4VXpIZVptN2ZCVHM4VVo3?=
 =?utf-8?B?NGliVmVQK01HM2lqTCtOOXJsOE5PZUM1T1NtOTVSNkJUYkxnUzFhUWpYUWVx?=
 =?utf-8?B?K1VsbkRkSmxrZm93N1MzVTNLdVZiOVdrRDdiV1c3QXNqNkhwdjJTa2F4UlhP?=
 =?utf-8?B?S2N5TE5URmJ5VjdiNjJ5MlZzTUFXSHY0RDlWMXBwRTFrWjdqUWIvdFpuN2RT?=
 =?utf-8?B?Y3RGZmh6V0g3TGVvVVdIMnI5RXFEQ2I0cEdqNCtJUllzeTVSZVF1cTJUbDd0?=
 =?utf-8?B?SWptVC9tTVQrS3BTbVN2dEpiYnBFaW8zWkJvZm9GSHhOMTdWVUVLWkRMRWlH?=
 =?utf-8?B?ZWNreHA4cjFjT24wUmlMaU1yb3VvQjVLa3JFS0gvR0lmdGI4Qy9PdU9KUjVO?=
 =?utf-8?B?ZFRPQUQyamRrNjBvSmdvTThKaUtyZFBUYXgyTFkwQWJTc3c0bm52Mk12RkNO?=
 =?utf-8?B?YXIrZFA3NTA3WEJYVzZYeHNCVEJoOG4zejh1SzNMRlNZSis1cGdvdjBDMkxC?=
 =?utf-8?B?MTVpbVlUTG5nN1I0d3RGNmhRenMzWkREZUhUUU9TUUhCZmExdFhmK3Z6Um9p?=
 =?utf-8?B?VWh6V3k2UHRCQkRhQ0hVcTdZVUFjNUd1d1p4bkkrYXV2MUJ0d3BPeWFqL3Bm?=
 =?utf-8?B?ck1xOGkyOFJIdDRUbnlkTlcydFpIQ09aMktXTVN5NXhIME13MDliWmUvQWtC?=
 =?utf-8?B?aXQ0TTNqWDlHZENCV2k3a1JLM1QzNWNXdDJtN0JTVE45UlRScUppSjdISTR0?=
 =?utf-8?B?cVBYWGZQMnhZUEljbDVDcXhDbE5uRVF2SVlEQnZXcEFLSzNXcS9TbVpFSmRr?=
 =?utf-8?B?NHlVcFNXOElXTGNhSjR3MTBVRHh5ckdtSHc3NkVPdm1DWWx0L05TRHQ4a2Vs?=
 =?utf-8?B?d0pRQkJ0VTJITnNqd2VZY28zZloxdkRrbTA2YVZ6cTZ1NlVocUg2NVB1ZjZk?=
 =?utf-8?B?Q1hqOUgvTzVKbUtuZ0dVR2JsUDZFdTlJaEloWnFaRHBiVi8veGMzb0huN3l3?=
 =?utf-8?B?SDlOS1B5UDcxWVdhOEdJVEJXcHRJOGtQUk9IQ2Vab1pycnlEeHNHcERKUCs5?=
 =?utf-8?B?QTY3SjNZNU9wa3R4RGdMTFhtSEE3QVFwRnJROTVBc1BhaHY5azBacEVrUG9K?=
 =?utf-8?B?QjBFUzBlRXIzcFh1bjJXcTMrQ3pJMUlsdDh5WmQ0endsbGJUUkZEdFFFb2cr?=
 =?utf-8?B?bCt2THlEYlJnWGdZZmRML3dkMmdVTE5PK1dQSnJJSThBK2REeGIvbTJ0TWZK?=
 =?utf-8?B?MmNmNXBneVErR0dSTXlvald2YnRrRzdkREU4TC91V05NL0xaUGhqZDFvMWpS?=
 =?utf-8?B?NDdTQUVmblZRSmY2RC9lZDFzWXlubC9yK3BQY0lxWUVTdHJNTEpNRVBYdEt2?=
 =?utf-8?B?dXRYdXBIb09HOTdXUFVzZzhhemRDenZBUFh4S0dZa1JPNlovM3dha25DSXo3?=
 =?utf-8?B?RWtTa2Roc1RZMEtSdVRnT2kxQ3Zid00xTks4WHo2R3lsTFM5cDVKQk5NTmV6?=
 =?utf-8?B?MkFWSEZWRXQrakRES3VIVXdsM01WSU1kZjZ6M05wZjZZUC80eVo3TlgvaFFW?=
 =?utf-8?B?cE9uVWl3eEE1ZGZ4NzUzMGIySHowT2lUQTBFL0ZVS2pCZ0hWV3lSYnFkODQ1?=
 =?utf-8?B?bzlnaTA0WEsvbXNNaGFzejVucE93bWFPSnJNRE9oM0Y2Sjh6Z2dpMkZYUTdV?=
 =?utf-8?B?MXpHRU1zeitJeWZjbXJhRDZyeU9Yb1BRZEFOK0JhUWtmcVdKWEZhVmxPMWk5?=
 =?utf-8?B?S2ZzMjdGT0pDRkR6cVRHRnVDbWphVkhNM0pQcGJmK05jT1AxVlR5SktoMEtm?=
 =?utf-8?B?b0NSWjVNV25OLzZRcG90ODhJQlJsbkMxOURkRzhSSGVrUmhJTHRVOStrWTVt?=
 =?utf-8?B?VWN1TlEyRDhtY1lRdDdqL2tpNHV5aDVtZ28yYmdha1FMaXdEZ052WGpqNFhO?=
 =?utf-8?B?aFlvUFV4aDZMYWNHWkV4YVpFQ3ZhRkhaQ2tJN2dEamViUHcyeVFkZmRVMTc5?=
 =?utf-8?Q?SiQVPWIdf9cbPX4g=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420ccf31-48b7-4b28-6193-08de572ce578
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 07:32:27.7438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgMHu6lfaUQeXV90usdKJqOTT7KBR0HtbsRs+n/1NPrcSfMcEHXDIdOrD1N7eyjrQVHB+zUdi+Z3d3p771JzBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9621
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

On 1/18/26 11:25 PM, Leon Romanovsky wrote:
> On Sun, Jan 18, 2026 at 01:40:11PM -0800, John Hubbard wrote:
>> On 1/18/26 4:08 AM, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>> ...
>>> +/**
>>> + * dma_buf_attachment_is_revoke - check if a DMA-buf importer implements
>>> + * revoke semantics.
>>> + * @attach: the DMA-buf attachment to check
>>> + *
>>> + * Returns true if DMA-buf importer honors revoke semantics, which is
>>> + * negotiated with the exporter, by making sure that importer implements
>>> + * .invalidate_mappings() callback and calls to dma_buf_pin() after
>>> + * DMA-buf attach.
>>> + */
>>> +static inline bool
>>> +dma_buf_attachment_is_revoke(struct dma_buf_attachment *attach)
>>
>> Maybe a slight rename, to dma_buf_attachment_is_revocable()?
> 
> I can do that. The issue is that even "dma_buf_attachment_is_revoke"
> is already too long. :)
> 

If you're really pressed for space for some reason, maybe
dma_buf_attach_revocable() ?

Just trying to hang on to the "revocable" part of the name, as
I think it's an improvement.

thanks,
-- 
John Hubbard

