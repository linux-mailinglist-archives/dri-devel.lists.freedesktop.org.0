Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AA49B4AD1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7455410E287;
	Tue, 29 Oct 2024 13:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WOyE0Jue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3511610E05E;
 Tue, 29 Oct 2024 13:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS3H7f2QxPzeHfUANn2HpderZewMGDx+9+ROBgIox93iBBhZAjXyN8awyBiinUakR3KuD/268TuBrpomBPF2HP4diyG281pH9YoSBp4ZaV9wQbvOdNDWdylXf6TbRqDjMQFEiuYUBI5XQToya9LkI+PeUfVauz6Xoyso8kkipertekOB5uCEfYdh9uNeyG2/GSHNkRI9RFTnbkqj13JUhh3oSqh6YcBkhmlu6/WIoGKGMJ5Ub8SP9FYtK0C7linqlwQXrua5+iwmrswPhgEzZ3XMbs6SVV1S/dT+TreVfD5sFFWQiiwfCD87CQSHNjc7on3tdFXu2qCdI3nTZ/ez9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HELSPjBdJHTSKTwfVQAIEKkgFTmVic9fIrqMUpG3pw=;
 b=T6zdOAyBf/+fkWxDDZH58IcxdkCpS2PN2nCtSO6CMm6Ktdi+EZLuL3jXBvqkq8mBxYd3UN8FIKJaogvN6ZpR1VjTtsV7Vdxc2Z5CsJ5lkdc2vA38uyDUNKp9ywRpIsgOSwQsinno5hsXODbSBzrDG48LylaJRlMnE66Gwaw41p5VVUrAsaDAPt4h8zgBCJdinojY0h80r/iEt/UkcSkNGS137SnnmKiuW/KQ/osToAgQ+POqnrSg74liqrUdlkVvcQ1w/tfZADRLYYYCSGbHGosXxl6V+XC41FhBvPd7O26/im9nsd2lcTeevF+u3ZNDZt3GWAVmldbPs1Up+eI51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HELSPjBdJHTSKTwfVQAIEKkgFTmVic9fIrqMUpG3pw=;
 b=WOyE0JueLc+RDyLGme1246fZ8vzSwKCDp2G7PQYHO85L24btGqnBBjDyrxzwhiXkAe8bYCrwSwt2NaAD5hBwWEawGVDfKhIISMWa80Ye+DQXeFCfspcHah/C/qFetyqfq097JYVXJN45fDYZSumvtXTYPG7t1VOn96YrZIpGhRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 29 Oct
 2024 13:20:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 13:20:46 +0000
Message-ID: <44356002-eeca-41ee-8a42-5ef528f69465@amd.com>
Date: Tue, 29 Oct 2024 14:20:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] PCI: Add a helper to convert between standard and
 IOV resources
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20241025215038.3125626-1-michal.winiarski@intel.com>
 <20241025215038.3125626-4-michal.winiarski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241025215038.3125626-4-michal.winiarski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f491798-84c7-41bb-85ca-08dcf81c7f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEpxNmFONGlxOXlEbFdCVndqVjdtSFRNT3NuTTk5MHgyUmg5Q1lEekpFSERF?=
 =?utf-8?B?TlBlODloYUVtMWw2eVk1RUFZQklqam9pdE93Z2tGMVNaNSs4em5HVTBjWU54?=
 =?utf-8?B?V25pVWd5T3JjR0k0RXdFbVJxOFpob2h0UjgvTzY5Vzc2UUVMNzd5d2o1akw5?=
 =?utf-8?B?VDJrOFVIV1Z6WkFuUGNPNnlscjh6dU9MalAwMG1ST2tSK29RbldZcHhhRFI5?=
 =?utf-8?B?d0Q5OHdZRG1oVUNIMGlmVU80WXZzWloraHdSTE01VzlqM0lOSno3K0VUMG01?=
 =?utf-8?B?V1lBYko5MjFRWDh5VlN5SE1KaDZwTDZWdzc5WlN2Vzh1aGFsV242dEFzbzRQ?=
 =?utf-8?B?VzJYK0xrcFE1dVlhYlBna0psRHpsdWE4c08vMjFGWThiMm1PbWVvelNZZm1W?=
 =?utf-8?B?VTJrclJzeERaVjVoMjVuT2MwK2x2RUt2bElGRGV1YXhaM2JNZVFkMVBiSmx4?=
 =?utf-8?B?ZUpMUjB0QlZKelpDM0Y2NTk3R05DNTB0YXhvYVpna2ZuM3EvVERnZ0dwQ2t0?=
 =?utf-8?B?QnM1Z2kwWThORURjVUVFSFhWTkc2czYzVW1QK2hJbkh4dWd1NlpSbWI2cTlK?=
 =?utf-8?B?SjR5dFJCSisvWjFyQVVEK0p6VHk3NHlSVVB2MW5qMTI1aVRMUVJLbVF6aXA0?=
 =?utf-8?B?SVRETUlBTjQrVS9GSmVQNy9lUHhVU3JjNFFmSkVtVXY2RmZxWFhGNmx2MUNO?=
 =?utf-8?B?NGk0MnJaZXkzaDRGbkNneHhnMVZmMk9wOHJuNzQzQkhuZUpnaHZtT2Y5M01F?=
 =?utf-8?B?Q2tIeW16czMvRWhLUndmOUpYTzJWdllZajYzU253aXVlem9tM3hXQ0NxTkFN?=
 =?utf-8?B?T1NmU3hMRndMc203MTZ6ZE5reUNUc25NNHZLYTBVUVNYOVlJWmhDYlVrZndM?=
 =?utf-8?B?Z0NPSUthZ2Q1b2JScENJSVEzdURPTVE1aGxqL3hVQ2o3enMrQ3YwVW14U0dZ?=
 =?utf-8?B?VFV0dGhSREQyYXJjYVMrU3c2bXRvL3NBUFBTbUVUN1ROcVNhTE5meUxvejE0?=
 =?utf-8?B?UEl4a2VDcGFOQUJsck9GOTEyNmR5WWs0cllMVi80MlRnK1VuNVRwczZQTWZP?=
 =?utf-8?B?K0dOVmxEZjBZV2NVL3NuNDByLzNXRFZxUzZVQmtoeGFqUS92QzExTmlLSEh6?=
 =?utf-8?B?QUgxMlFsenB1Z3UrZTlvb3lXTFQvRlZqSXZMbmdYUE0vWkk1OUxPbmo0UTZD?=
 =?utf-8?B?VVRETGdsVVIyWVNoY0tjSTl3d3pYd0t6YzluMHRtSlFaOTc3MXJrZDFEYWRk?=
 =?utf-8?B?OE94WE85aXREL3VwTEJBeDdROERYZ3VnME9PNVJTeXF3OGswMll2UURWS1JE?=
 =?utf-8?B?NWtjakRDZ2xKanZ3NHNNLzVDVzMvcGJ3Z3ZxMnZESlZiK2ZkU3JST2NhWWxw?=
 =?utf-8?B?ZktPQ2hlZFZQMlFkYXdEUWtsVEowWU5DeGdCaXBWUEdrMk1ieFVwQnN3ZkJ4?=
 =?utf-8?B?b21WN1Nyb0EzRFl0NW41OWtiYnc5VGdsekFkTFhMVEZjcmRITU83ODUzamgr?=
 =?utf-8?B?K1BEb1RnSCtVMnpkZTUzb1EzREw5d0hyMDZHUFdQRUdXY1JjZ3hQUWVyVHJ5?=
 =?utf-8?B?Zk9Zc3hUa3BMeUVIV2N0ZVRvUlQ4MFhHd0RLaDFXTHg0KzlNN1pmblB3R20v?=
 =?utf-8?B?OVlJeWZlV09LS1AxZEU5ZFhZM1JJL2M2ZE9mZjQzSWFuSXhyeWxWL1N6c01J?=
 =?utf-8?B?dFBWNWN0ZXRIZkNuVnJ3b1N1enpaU0hqS05oUHJ1VVo5VC9HOC9uQVlsUmVO?=
 =?utf-8?Q?0X4p9yhCGwwEnBzzf5tdRTB5ec2DaDA/24T3w3b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFJWL2RhYkRjNHd4VjFSTEt4c1RycVlyMndqUVozRHRGT0xzS1VaRzl5ajRY?=
 =?utf-8?B?b0dxWkovQms3RDNYMmlTeVU5aUlLYjBuSGRtcStCNmhxVUZocVJLbFpPMVNI?=
 =?utf-8?B?WE5MMkplOTJIM2lGNWEzWDlrRU5FczlHRE1GRzFTazhGOGZ0S3Z2ZGxWRG1B?=
 =?utf-8?B?bkVNSUFuQXNmQ0kvOEgvUFlUaEEyUG16TS82N2wvdk1RanVzZXRpcVlvVW9Y?=
 =?utf-8?B?N1IyM3VqMDlQRHZyc1JkYUVkbWhyaVQzS2NKYlZORGphYTVrdVlhZ205bU9m?=
 =?utf-8?B?OVVTWVBqbnIyOUV1WjFMTVlWcS95cmFTbCtHY05ac1RwRk9BUzRyWUVUcEg3?=
 =?utf-8?B?RkQzcTZaVTVKcTFKdFVZVXIvL3BoeGUyT01tazFzOGlkSGwwUSs0WFFEL0xK?=
 =?utf-8?B?UnMwRS9Wa211KzNWcTg4TW9tcUdncXFBRm1QWkJ5RGFLeTZqekJLeFNTVGVj?=
 =?utf-8?B?K1BoWlNxSGNBRE5DSGpTc21XSkk5RTBBVDJqZU11c0ROVWg5MEt0RWlVcmRK?=
 =?utf-8?B?MlorbFlvSjQxZnFsdURrNGJDZDRyVDVrb0VHNnMvY21HeEJ4RUJnMTlvWVNi?=
 =?utf-8?B?WTlQaGFtWkU0VFc4KzZvcW8zRDR0d2Q2RW40Y3UwMGRKRmtncTZyV1pxeHRM?=
 =?utf-8?B?R0MzUE9yZFlPWjVnNThlem1QUklNbU1UTjBDd29yWU15QlhlNjQ0c004aFpl?=
 =?utf-8?B?MDBGQ2F1VWNwaDJ4c25OUjhjejZ1OE9HL1NqMjZMeEhUNTZGRXl4TFBnS3NF?=
 =?utf-8?B?MDBvZkgvR2dwbm4yU3hsR010V3BKcXFGTTZZREw3N1ZTQTR6UXFqajRjZlZ2?=
 =?utf-8?B?dVdSblg0bCt5d2ZocG9vbWF6OUloQWc5Vms3M3pBcXMyY3JSU1BSYTVXSTdh?=
 =?utf-8?B?T1ZDK203QmRIV0RjeWJ2RXRDR2E5RkdPWUVMR09vZW5abFVWVkxBVE1scWxC?=
 =?utf-8?B?SGRkQm00bXVJVmdLWEJIU1N3WklINDdNcCs4ZlJZUDErdkZZVkdwQmdjY1Vq?=
 =?utf-8?B?VXBGaVZJU3BVenM5UnRML0t4U3A2TlRZZGdsWDRsZklzQkoyN2FWcTBmUm5C?=
 =?utf-8?B?SFVtR0ZCNDBYWnVKVzc5UUdSUWtOemJUY3RMKzh5b1VQZ1h4K0NQM24vM2Fq?=
 =?utf-8?B?Sm5YNHgzbFVpSG94Q1J4ZWFWQzBBTlVmK0tGZjkxQWdlMVlYQlV6TEZSdEU3?=
 =?utf-8?B?aUJmbmNvb0FBWGRYenF5UnIrTWpCN1FabS9WY1pscnEwVEthalJ4RGNUWENE?=
 =?utf-8?B?cHdUSkljMmdmT2ZjQXE0T1h0T2VlVDFOYXRmMmlweWxWSGlacnk3eVNnQ0c0?=
 =?utf-8?B?K295aVplby9ldVFuL3Yzd0RpTm5PcDgwdVZ5ZWZVK0FqR3FwRC9OLzZ6SDVC?=
 =?utf-8?B?cnl4bUZzZWdrUWZ5ekR1enZPNFlkMnNRV1RhZWgyMGFjVWJia2kwdm96a1E4?=
 =?utf-8?B?UUR4bmpMOGh5dVY1SXVFQ2tvQlZPemI4eDRzR2RFUjJYTVZNZkxBdGxZck91?=
 =?utf-8?B?OU1CRnpYM2ZGYXU1Vm9rM2NRVmdEZnowVGJjSDlNdjNuVUhVWkJyeWw2dW1m?=
 =?utf-8?B?Q0c2TU9UeTBJdDZDOUJaN3JSRFBiWjhUd3JhQkRiRS92TFFDWGJsS05XTXhB?=
 =?utf-8?B?WHpYaSt3RWMyQXIzb0FVRkcvdFVhdVRXazNBWGo0UDNCUlRnbHVhTUJQR2FW?=
 =?utf-8?B?SUlUdmNta2owQzN3Mi9ubnpEOXNuWVJVNXhzUmJoVmh5Q0NucHBMeWpWOVFN?=
 =?utf-8?B?WjAzdTZCaEs1WlBwRjYzMFZUZGxhM0h1UjZZU0Q4UHNQeEJ0L3JTekhSM2Vj?=
 =?utf-8?B?Zm1tRmhLR2JSQ0lwLzZXMHFpMGFzY05Vd3k3SDFCNnRNT0xzdHhQenFIU0pG?=
 =?utf-8?B?YjlZYjVMNnNZdm8wUGZlTlFKcUdxUkpySVYraSt6Z0dUZVJKcU9zbjkrek5j?=
 =?utf-8?B?Uk5EUGs0NjlTRFIwVmw0TVhzdzFyYjMxamRTRkZTbnhMS2tCcWV3Uk9zV1g0?=
 =?utf-8?B?ZUFvKzZ4N253YzdVb1RqM2pQWnFhMWxMVWRmNi9WRVdycUpCUHJpYnBHNkRR?=
 =?utf-8?B?cG1BamRIbEMvNG83S2pSUXRpK1VlNzNGSjZJRUtlTUlkQ2o2UGlvVnAxNkps?=
 =?utf-8?Q?lA+no/pf4yg/tHrZ5LG/vfl9J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f491798-84c7-41bb-85ca-08dcf81c7f85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 13:20:46.4719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1eZAenK8dFoE1+JMsj/VOc6iypm2Kveazw5OnAnKnp9GExGx1edS08d0Scs055k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7199
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

Am 25.10.24 um 23:50 schrieb Michał Winiarski:
> There are multiple places where conversions between IOV resources and
> standard resources are done.
>
> Extract the logic to pci_resource_to_iov() and pci_resource_from_iov()
> helpers.
>
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

I don't work enough with that code to fully judge if that is useful or not.

But feel free to add Acked-by: Christian König 
<christian.koenig@amd.com> since style etc.. looks good to me.

Regards,
Christian.

> ---
>   drivers/pci/iov.c       | 20 ++++++++++----------
>   drivers/pci/pci.h       | 18 ++++++++++++++++++
>   drivers/pci/setup-bus.c |  2 +-
>   3 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 6bdc9950b9787..eedc1df56c49e 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -151,7 +151,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
>   	if (!dev->is_physfn)
>   		return 0;
>   
> -	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
> +	return dev->sriov->barsz[pci_resource_from_iov(resno)];
>   }
>   
>   static void pci_read_vf_config_common(struct pci_dev *virtfn)
> @@ -322,12 +322,12 @@ int pci_iov_add_virtfn(struct pci_dev *dev, int id)
>   	virtfn->multifunction = 0;
>   
>   	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> +		res = &dev->resource[pci_resource_to_iov(i)];
>   		if (!res->parent)
>   			continue;
>   		virtfn->resource[i].name = pci_name(virtfn);
>   		virtfn->resource[i].flags = res->flags;
> -		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
> +		size = pci_iov_resource_size(dev, pci_resource_to_iov(i));
>   		virtfn->resource[i].start = res->start + size * id;
>   		virtfn->resource[i].end = virtfn->resource[i].start + size - 1;
>   		rc = request_resource(res, &virtfn->resource[i]);
> @@ -624,8 +624,8 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
>   
>   	nres = 0;
>   	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		bars |= (1 << (i + PCI_IOV_RESOURCES));
> -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> +		bars |= (1 << pci_resource_to_iov(i));
> +		res = &dev->resource[pci_resource_to_iov(i)];
>   		if (res->parent)
>   			nres++;
>   	}
> @@ -786,8 +786,8 @@ static int sriov_init(struct pci_dev *dev, int pos)
>   
>   	nres = 0;
>   	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> -		res_name = pci_resource_name(dev, i + PCI_IOV_RESOURCES);
> +		res = &dev->resource[pci_resource_to_iov(i)];
> +		res_name = pci_resource_name(dev, pci_resource_to_iov(i));
>   
>   		/*
>   		 * If it is already FIXED, don't change it, something
> @@ -844,7 +844,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
>   	dev->is_physfn = 0;
>   failed:
>   	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		res = &dev->resource[i + PCI_IOV_RESOURCES];
> +		res = &dev->resource[pci_resource_to_iov(i)];
>   		res->flags = 0;
>   	}
>   
> @@ -906,7 +906,7 @@ static void sriov_restore_state(struct pci_dev *dev)
>   	pci_write_config_word(dev, iov->pos + PCI_SRIOV_CTRL, ctrl);
>   
>   	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
> -		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
> +		pci_update_resource(dev, pci_resource_to_iov(i));
>   
>   	pci_write_config_dword(dev, iov->pos + PCI_SRIOV_SYS_PGSIZE, iov->pgsz);
>   	pci_iov_set_numvfs(dev, iov->num_VFs);
> @@ -972,7 +972,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
>   {
>   	struct pci_sriov *iov = dev->is_physfn ? dev->sriov : NULL;
>   	struct resource *res = dev->resource + resno;
> -	int vf_bar = resno - PCI_IOV_RESOURCES;
> +	int vf_bar = pci_resource_from_iov(resno);
>   	struct pci_bus_region region;
>   	u16 cmd;
>   	u32 new;
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 48d345607e57e..1f8d88f0243b7 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -584,6 +584,15 @@ static inline bool pci_resource_is_iov(int resno)
>   {
>   	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
>   }
> +static inline int pci_resource_to_iov(int resno)
> +{
> +	return resno + PCI_IOV_RESOURCES;
> +}
> +
> +static inline int pci_resource_from_iov(int resno)
> +{
> +	return resno - PCI_IOV_RESOURCES;
> +}
>   extern const struct attribute_group sriov_pf_dev_attr_group;
>   extern const struct attribute_group sriov_vf_dev_attr_group;
>   #else
> @@ -608,6 +617,15 @@ static inline bool pci_resource_is_iov(int resno)
>   {
>   	return false;
>   }
> +static inline int pci_resource_to_iov(int resno)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int pci_resource_from_iov(int resno)
> +{
> +	return -ENODEV;
> +}
>   #endif /* CONFIG_PCI_IOV */
>   
>   #ifdef CONFIG_PCIE_PTM
> diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
> index ba293df10c050..c5ad7c4ad6eb1 100644
> --- a/drivers/pci/setup-bus.c
> +++ b/drivers/pci/setup-bus.c
> @@ -1778,7 +1778,7 @@ static int iov_resources_unassigned(struct pci_dev *dev, void *data)
>   	bool *unassigned = data;
>   
>   	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> -		struct resource *r = &dev->resource[i + PCI_IOV_RESOURCES];
> +		struct resource *r = &dev->resource[pci_resource_to_iov(i)];
>   		struct pci_bus_region region;
>   
>   		/* Not assigned or rejected by kernel? */

